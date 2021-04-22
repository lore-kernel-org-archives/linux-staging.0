Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE12F81
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:43 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MiakT-1l65J32jax-00fh0C; Thu, 22 Apr 2021 22:08:38 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 03/10] staging: vchiq_core: introduce get_bulk_reason
Date: Thu, 22 Apr 2021 22:07:49 +0200
Message-Id: <1619122076-31785-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:z8K4QJwApqrqJPSJqjI1kF+Ww9eohqEbdgl4ZM1Oh87BKRJVi0B
 eOiafiRXFKeZUINpJLhvaf8D/q9zv6ARQJoSQTX6isGqnT5ecwASAHtMiuDqNMPXom51Uji
 V0JUE+d0vDP0MvRm1ELlS8g57gtFOicYEBl7fS1eM7ykQGJp1er2Rhw1WD1QTZ6a97db2fv
 GiNlaF6sraBuos0MpQ7xQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VPRGJuDwQ9s=:2sf8huMWRFng9eDX5pg5cC
 j+XW9YepZOz93Lz7wRrKlJzAwTWIvLUr/+nvA56m4VdtgwPH1LMgPC4SwXxvBzkyaZqBNIeOA
 lKVw6cPM8jRgsLL6PCsEnVIgjWEazcRsM/9ykNpZzai3tpaKk4prL+tV3OeKAb/QD4oi4Ir25
 IFn2QrNMmagtYua55QZs+42mMXXvEhHf0ubl19H+8gUth1Jfj1n/11N5VF+kGph9l7pkKAJJd
 cs2rlVqa5BbHL9n4/WD+wl2+yOdyqCA+VSequjpC/4ZOEydtO7LDbtbsn4z+ytY8PRz5/orcx
 IY8x0zwBmQo2ganLodug1xGVXsWUDBRvM0wR2q/k+vWBw1rRXoA1xi3QBX2gyXqVX8j5cAVv4
 TrxUB+Iows+RP/SfklbvIx7ZS/VFneKnbRqv3YgbiOnmZi8/4jhoMMMu8wg16hbNBJnE92kZM
 NHydZq+6lnDqXsfgjHugeNQ4OZF4C/WJJiUYNrenOGvwPnxWeUstszITmQS2jBOo/OjL7Uaua
 HsknNE+iWBW0nbUkC1weYw=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Nesting multiple ternary operators over multiple lines isn't easy to
read. Move this logic into a separate inline function.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 35 ++++++++++++++--------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8a1e6f5..3a72c36 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1226,6 +1226,22 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 	mutex_unlock(&state->recycle_mutex);
 }
 
+static inline enum vchiq_reason
+get_bulk_reason(struct vchiq_bulk *bulk)
+{
+	if (bulk->dir == VCHIQ_BULK_TRANSMIT) {
+		if (bulk->actual == VCHIQ_BULK_ACTUAL_ABORTED)
+			return VCHIQ_BULK_TRANSMIT_ABORTED;
+
+		return VCHIQ_BULK_TRANSMIT_DONE;
+	}
+
+	if (bulk->actual == VCHIQ_BULK_ACTUAL_ABORTED)
+		return VCHIQ_BULK_RECEIVE_ABORTED;
+
+	return VCHIQ_BULK_RECEIVE_DONE;
+}
+
 /* Called by the slot handler - don't hold the bulk mutex */
 static enum vchiq_status
 notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
@@ -1281,16 +1297,8 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 					spin_unlock(&bulk_waiter_spinlock);
 				} else if (bulk->mode ==
 					VCHIQ_BULK_MODE_CALLBACK) {
-					enum vchiq_reason reason = (bulk->dir ==
-						VCHIQ_BULK_TRANSMIT) ?
-						((bulk->actual ==
-						VCHIQ_BULK_ACTUAL_ABORTED) ?
-						VCHIQ_BULK_TRANSMIT_ABORTED :
-						VCHIQ_BULK_TRANSMIT_DONE) :
-						((bulk->actual ==
-						VCHIQ_BULK_ACTUAL_ABORTED) ?
-						VCHIQ_BULK_RECEIVE_ABORTED :
-						VCHIQ_BULK_RECEIVE_DONE);
+					enum vchiq_reason reason =
+							get_bulk_reason(bulk);
 					status = make_service_callback(service,
 						reason,	NULL, bulk->userdata);
 					if (status == VCHIQ_RETRY)
@@ -2622,9 +2630,10 @@ do_abort_bulks(struct vchiq_service *service)
 	mutex_unlock(&service->bulk_mutex);
 
 	status = notify_bulks(service, &service->bulk_tx, 0/*!retry_poll*/);
-	if (status == VCHIQ_SUCCESS)
-		status = notify_bulks(service, &service->bulk_rx,
-			0/*!retry_poll*/);
+	if (status != VCHIQ_SUCCESS)
+		return 0;
+
+	status = notify_bulks(service, &service->bulk_rx, 0/*!retry_poll*/);
 	return (status == VCHIQ_SUCCESS);
 }
 
-- 
2.7.4

