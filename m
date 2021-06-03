Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988C6D3D
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:56 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MnJUy-1l7ldv3x3M-00jLjg; Thu, 03 Jun 2021 17:50:52 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 16/16] staging: vchiq_core: introduce handle_poll
Date: Thu,  3 Jun 2021 17:50:05 +0200
Message-Id: <1622735405-9980-17-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:+D2al0DdGuNsU7rzgDjD+Lc1h0nMqlhWmJUy6GYorg5+LSmk9oM
 M4MOWvWrBAIavbqaIzp9Ybe6M1cmlSKsCK6299CijzGvYkbmBIW+P/CNY+YH81BR4oVvgLP
 9qyIW//t1FsdkS3HBTpbo1fOaoyGgRmoAXHGFMMTX2aKHlY043GMSNKzo/m1E+Nf2xgJybx
 wBg5n2dK0yUthnDL5ymCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PriqgyWlGdA=:4XO3mcePEkXL+xtLpVa6UG
 d/lgcps+vLNYUvuf+mUhygiXctohXcaeKT43UyXK++BWh5lmyYmLPz6rBbslzNobH5ApKqghu
 1cX13tW36gpDBw2+TsAm8FQ6x+Pb22dkjdLEG0YHC3z2QMqYXE8EOgLhYZMss9VOrSUO7TO2Q
 m5W5/CxFsM/ftMkKRyGeGhGbsp02I5J9Bae6gA0Bs9KI5bzjEA2xbfnz106ogCjrwY161cIPr
 dSg2j1u3vzIXf1MTF7kpChBNeIHuPJF3PR7BjUet9926GaeFViTmfHb/cZX1hA6qu7vlyJlzI
 Gr7PslCIVV4lXqlR5uO6i+VF9lf3+CvpGEk13DFQQ3Ek9mtz44Z4NXhl3Gq6ZW1isKE/O9BC0
 zzKQV3BiUGczhJJAWLib0Xwh0BNsE6BtF2egW/150S3ctOwtrTSjf+q9Ts+p7Ur98CI2jhHVs
 1i9Pm7H0lGXjPXN+dUE+nc2R3Wr6GwrG/3GY2RKE5d7cUSBSKxAreneT+4iUyVM0OY7bjF01x
 cNaEB4gx6uDFQBq00s/g/U=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function slot_handler_func() has very deep indentations. Moving the
poll handling into separate function could improve the readability.
Use the return value to keep the poll_needed handling at the same place.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 92 ++++++++++++----------
 1 file changed, 52 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index a2a2472..4f43e42 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1992,6 +1992,56 @@ parse_rx_slots(struct vchiq_state *state)
 	}
 }
 
+/**
+ * handle_poll() - handle service polling and other rare conditions
+ * @state:  vchiq state struct
+ *
+ * Context: Process context
+ *
+ * Return:
+ * * 0        - poll handled successful
+ * * -EAGAIN  - retry later
+ */
+static int
+handle_poll(struct vchiq_state *state)
+{
+	switch (state->conn_state) {
+	case VCHIQ_CONNSTATE_CONNECTED:
+		/* Poll the services as requested */
+		poll_services(state);
+		break;
+
+	case VCHIQ_CONNSTATE_PAUSING:
+		if (queue_message(state, NULL, MAKE_PAUSE, NULL, NULL, 0,
+				  QMFLAGS_NO_MUTEX_UNLOCK) != VCHIQ_RETRY) {
+			vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSE_SENT);
+		} else {
+			/* Retry later */
+			return -EAGAIN;
+		}
+		break;
+
+	case VCHIQ_CONNSTATE_RESUMING:
+		if (queue_message(state, NULL, MAKE_RESUME, NULL, NULL, 0,
+				  QMFLAGS_NO_MUTEX_LOCK) != VCHIQ_RETRY) {
+			vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
+		} else {
+			/*
+			 * This should really be impossible,
+			 * since the PAUSE should have flushed
+			 * through outstanding messages.
+			 */
+			vchiq_log_error(vchiq_core_log_level,
+				"Failed to send RESUME message");
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 /* Called by the slot handler thread */
 static int
 slot_handler_func(void *v)
@@ -2010,52 +2060,14 @@ slot_handler_func(void *v)
 
 		DEBUG_TRACE(SLOT_HANDLER_LINE);
 		if (state->poll_needed) {
-
 			state->poll_needed = 0;
 
 			/*
 			 * Handle service polling and other rare conditions here
 			 * out of the mainline code
 			 */
-			switch (state->conn_state) {
-			case VCHIQ_CONNSTATE_CONNECTED:
-				/* Poll the services as requested */
-				poll_services(state);
-				break;
-
-			case VCHIQ_CONNSTATE_PAUSING:
-				if (queue_message(state, NULL, MAKE_PAUSE,
-					NULL, NULL, 0,
-					QMFLAGS_NO_MUTEX_UNLOCK)
-				    != VCHIQ_RETRY) {
-					vchiq_set_conn_state(state,
-						VCHIQ_CONNSTATE_PAUSE_SENT);
-				} else {
-					/* Retry later */
-					state->poll_needed = 1;
-				}
-				break;
-
-			case VCHIQ_CONNSTATE_RESUMING:
-				if (queue_message(state, NULL, MAKE_RESUME,
-					NULL, NULL, 0, QMFLAGS_NO_MUTEX_LOCK)
-					!= VCHIQ_RETRY) {
-					vchiq_set_conn_state(state,
-						VCHIQ_CONNSTATE_CONNECTED);
-				} else {
-					/*
-					 * This should really be impossible,
-					 * since the PAUSE should have flushed
-					 * through outstanding messages.
-					 */
-					vchiq_log_error(vchiq_core_log_level,
-						"Failed to send RESUME message");
-				}
-				break;
-			default:
-				break;
-			}
-
+			if (handle_poll(state) == -EAGAIN)
+				state->poll_needed = 1;
 		}
 
 		DEBUG_TRACE(SLOT_HANDLER_LINE);
-- 
2.7.4

