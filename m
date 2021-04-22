Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3644B2FA2
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:50 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M89TB-1leKCC1cId-005Fn2; Thu, 22 Apr 2021 22:08:39 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 06/10] staging: vchiq_2835_arm: drop enum vchiq_status
Date: Thu, 22 Apr 2021 22:07:52 +0200
Message-Id: <1619122076-31785-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:T5eBLHizv0yg92RAi8czdqJuTUk2gAeEC8mROli80JSu6GD0i2K
 NLtoiktcgsBFftqAmrLU2ozOx8vWcjo3tC7kJBCXefG9zzeijyxvwLrgyEHmubZJqvBGdK7
 3IArFadFDFlHCORDXWKZfgBQ0ADg+LQ01c7OPbhdRi4H0ckF3LqVsmpbjojdOMvbCl69K0B
 W6ck6/ExVtXfROwbkE/6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yNlFDUjeac4=:bEoYRBL/YtNXxPCoyAw7n6
 uZj4aYiBXelORYYrOVRqKY9FOPJPA1fDTihMqcAWGbg4NOLTJVRqVo4AjW4tdVWlk7DmHHRZP
 57nYFY/KiIbo/qlyOwdR+FiN9EypKioEwO5BsYObsxtBjeU4610z1WeGsj9KbOp0FXn7djf2K
 d97qf3Imn3YCCdKvbKk65zO/QjV4QSwt3xvlql9yQB5pVl5Vq/LqKMapC47sNKr3ANLRJg/TR
 fiitKF2R7rIuVLRHpzuK5YpkNEtuIRLRtvrxC1UekML9bH6tDRcNPS40tLTErmA/vXPTfH6KY
 mMuXIsJS9f4sTOpff7BozGbri/Y+NyTb0SEBovmtEnjd6JEAnsBL24rzicMYStI5s7Rpp9z79
 vvgwCduuo+XtP6pxHYjFO8DqcTW52iq5ZwyMR7HGvy9HwgSoIB6WezBdmqmzGXXAOpSUlLJAP
 yvRqbI+b9YJBvTiwxHtkYACmCVI2m5500rDGjlp9uUaCl49r+Dd2Yh7yoDKt66jrNjbktwpDh
 0WeEv8OyCqlyJ7D2hPmpCw=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes.
As a result we need to initialize vchiq_status in vchiq_init_state.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
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

