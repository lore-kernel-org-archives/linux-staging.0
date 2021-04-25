Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96CA2FA5
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:34 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MX0TX-1m7JWK3Sfp-00XOHR; Sun, 25 Apr 2021 12:51:29 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 07/11] staging: vchiq_2835_arm: drop enum vchiq_status
Date: Sun, 25 Apr 2021 12:50:59 +0200
Message-Id: <1619347863-16080-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:M+jFVFzaBxhxJY7M9kouGkOxuArkL0x3v3LFaykcMd2uIx4mbiQ
 efkxwszD/Ij6knMbRhtFTcsTvMCZig7jGgrYqePYpSfpPl5/lmCk1x/4chkbHa6Jp4LcTOe
 0H7UuUVevWzFe+A3eVHXDIdqHpSldXC08XZn1KhO5BH26hgCCkbrWFMRvd4EmxrAUxWT3Bm
 /Fykb0taC9dJxI/kGcHhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OLSw1m6/tIs=:Nr2cbw+iq9qScanm6Hn4pI
 UsxXgGx7Hw6q+L46aOBbzHBq2gjnMgH5/o/7ztIRPBv2UKHQB8k9WpIXqTxR6f3q2Y2j4R77t
 ixT1Gu7ppZUWrjYeuaY87gQLi9FukNh3Qc1t3vVsKVHSFqEwjJTeCQzIfHdfNajqrSC04qETV
 b6eQszaSwryzw+MSr9MDE5yX8dJo9A62Jyix4vwx0fKv0pMOJ372ZOzfxdiL9AmaebBwNwM2M
 5x0rUCRIH8PZrUDvuv8NU4aGi0pN+4P3Gs93hQ1oT8onazB+0gywZz2Zo72ZzENplWJwI8xLB
 1ZkHeEwp3MYCp0e8H98c5Q/bH7si6nJtyz7zm3R5wRyEfGvn14jCWS/EbsOonwWXEm8VdYWGj
 RYL6wR8CxlLFoYXeYhn636YtgnDMlAreTVQYsCGnyZIO73rCNPFRQsI5pS0PlJpx4LbDgQv3o
 HxLUY9oDZHJ04aoNLAIaBFR8bVykQ7k1RXcc1mCWHp9XQJh+KSy2nQRMM2mmsF5AizpYgtBqf
 5O3yUuIwmhtekKlvIG83OI=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes.
As a result we need to initialize vchiq_status in vchiq_init_state.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
---
 .../vc04_services/interface/vchiq_arm/vchiq_2835_arm.c       | 12 ++++++------
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c   | 11 +++++------
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h   |  4 ++--
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index 7c336d0..a644fe6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -169,21 +169,21 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	return 0;
 }
 
-enum vchiq_status
+int
 vchiq_platform_init_state(struct vchiq_state *state)
 {
 	struct vchiq_2835_state *platform_state;
 
 	state->platform_state = kzalloc(sizeof(*platform_state), GFP_KERNEL);
 	if (!state->platform_state)
-		return VCHIQ_ERROR;
+		return -ENOMEM;
 
 	platform_state = (struct vchiq_2835_state *)state->platform_state;
 
 	platform_state->inited = 1;
 	vchiq_arm_init_state(state, &platform_state->arm_state);
 
-	return VCHIQ_SUCCESS;
+	return 0;
 }
 
 struct vchiq_arm_state*
@@ -211,7 +211,7 @@ remote_event_signal(struct remote_event *event)
 		writel(0, g_regs + BELL2); /* trigger vc interrupt */
 }
 
-enum vchiq_status
+int
 vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset,
 			void __user *uoffset, int size, int dir)
 {
@@ -223,7 +223,7 @@ vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset,
 				       : PAGELIST_WRITE);
 
 	if (!pagelistinfo)
-		return VCHIQ_ERROR;
+		return -ENOMEM;
 
 	bulk->data = pagelistinfo->dma_addr;
 
@@ -233,7 +233,7 @@ vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset,
 	 */
 	bulk->remote_data = pagelistinfo;
 
-	return VCHIQ_SUCCESS;
+	return 0;
 }
 
 void
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9dc9a6a..9f9677a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2162,9 +2162,9 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 {
 	struct vchiq_shared_state *local;
 	struct vchiq_shared_state *remote;
-	enum vchiq_status status;
+	enum vchiq_status status = VCHIQ_SUCCESS;
 	char threadname[16];
-	int i;
+	int i, ret;
 
 	if (vchiq_states[0]) {
 		pr_err("%s: VCHIQ state already initialized\n", __func__);
@@ -2246,8 +2246,8 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 
 	local->debug[DEBUG_ENTRIES] = DEBUG_MAX;
 
-	status = vchiq_platform_init_state(state);
-	if (status != VCHIQ_SUCCESS)
+	ret = vchiq_platform_init_state(state);
+	if (ret)
 		return VCHIQ_ERROR;
 
 	/*
@@ -3141,8 +3141,7 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle,
 	bulk->size = size;
 	bulk->actual = VCHIQ_BULK_ACTUAL_ABORTED;
 
-	if (vchiq_prepare_bulk_data(bulk, offset, uoffset, size, dir)
-			!= VCHIQ_SUCCESS)
+	if (vchiq_prepare_bulk_data(bulk, offset, uoffset, size, dir))
 		goto unlock_error_exit;
 
 	wmb();
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index b817097..6b3a907 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -644,7 +644,7 @@ vchiq_queue_message(unsigned int handle,
  * implementations must be provided.
  */
 
-extern enum vchiq_status
+extern int
 vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void *offset,
 			void __user *uoffset, int size, int dir);
 
@@ -679,7 +679,7 @@ vchiq_on_remote_use(struct vchiq_state *state);
 extern void
 vchiq_on_remote_release(struct vchiq_state *state);
 
-extern enum vchiq_status
+extern int
 vchiq_platform_init_state(struct vchiq_state *state);
 
 extern enum vchiq_status
-- 
2.7.4

