Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549492F81
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:13:58 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBUyX-1lm5291kAJ-00Cxwm; Thu, 22 Apr 2021 22:08:38 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 02/10] staging: vchiq_core: break early in vchiq_close_service_internal
Date: Thu, 22 Apr 2021 22:07:48 +0200
Message-Id: <1619122076-31785-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:VbxEs+RLFjpGSBvh18agyrILLMV3QP0z74zAwNG0LJpxsiH8m14
 FBAucIVrEvaoJKBUGc3+M+b/0a6gTZG2XgPt8MBGKgeLbzzSV90CDcSO7/IvNnhbv3ZmgpA
 MYV8oD5GykbpY4nIvJcEM/gf7yHyT7MZ9ekT4ZoJ39YBxtBk89I4To95RTwFvfDtC3onwYu
 ymugRtben/c/i0QiM74NA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kmjyCiOWDeo=:4ipcc/avhlVzMn5dnnhDnM
 XIZyRQ6bqyFfh/07NIiAEG7aF/POgdevp4+9iX/HxjU2bOCuqWU8mxx8PYP4wUEu6Kj+1gLET
 uTgguqic5Q3tfZ3nnERg3lIAefo2FTO3NT86pCrYJ2Q1ICMwH6ZGCKeCSM36u+7FWpcwl6OsL
 pKpVA4ve8lfgu6do6kqD7DPyCNF0swY2qVEoegYBfkhkkbUiCW2b5dYG+80KgWXWwvwTMYKW+
 v3pDqEJRoE418RvbIp2XmPofvBPWAUogxlgwmhGIJ8NEwJ7M2CLGNq1VRpZH839+mVTsaL4XZ
 SRHsZhflhy8gcG2TIFeoL1E34poKpQJUQ5Q/+c9p58Y3F353w//j26Pnd5gQpgMymhOed67in
 Nbqi50iSss/WNlJwfvfpIN+8NF1o5BDSl0f4wmSa/pn5pXgXd80CWDaLBvqpYobKdnT0uK+jV
 ke03+bkysWUDiyV7euYiPmtdN0WiuFogyEfU+DId03vgwjJsUllkwweHux4yd/9OKgywkhmfK
 HttPERfM+AkQeB1h2ywywg=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The logic in VCHIQ_SRVSTATE_OPEN* is unnecessary complex. Handle the error
case of queue_message() first makes it easier to read.

Btw we get the rid of the checkpatch warning:
WARNING: else is not generally useful after a break or return

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 517a8c9..8a1e6f5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2763,21 +2763,21 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 				VCHIQ_MSG_DSTPORT(service->remoteport)),
 				NULL, NULL, 0, QMFLAGS_NO_MUTEX_UNLOCK);
 
-		if (status == VCHIQ_SUCCESS) {
-			if (!close_recvd) {
-				/* Change the state while the mutex is still held */
-				vchiq_set_service_state(service,
-							VCHIQ_SRVSTATE_CLOSESENT);
-				mutex_unlock(&state->slot_mutex);
-				if (service->sync)
-					mutex_unlock(&state->sync_mutex);
-				break;
-			}
-		} else if (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC) {
-			mutex_unlock(&state->sync_mutex);
+		if (status != VCHIQ_SUCCESS) {
+			if (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)
+				mutex_unlock(&state->sync_mutex);
 			break;
-		} else
+		}
+
+		if (!close_recvd) {
+			/* Change the state while the mutex is still held */
+			vchiq_set_service_state(service,
+						VCHIQ_SRVSTATE_CLOSESENT);
+			mutex_unlock(&state->slot_mutex);
+			if (service->sync)
+				mutex_unlock(&state->sync_mutex);
 			break;
+		}
 
 		/* Change the state while the mutex is still held */
 		vchiq_set_service_state(service, VCHIQ_SRVSTATE_CLOSERECVD);
-- 
2.7.4

