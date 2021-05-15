Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E472
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:36 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MpDeD-1l8fLT2cPf-00qgUb; Sat, 15 May 2021 21:11:20 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 09/20] staging: vchiq_arm: drop ftrace-like logging
Date: Sat, 15 May 2021 21:10:48 +0200
Message-Id: <1621105859-30215-10-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:uzi/PCN5Zf2VTLYJAWrXbn87OkbkYBRhqUtctbzwjrpdHFwH0H0
 ZZVPWmpfoi6Zsb9pSjjlpWtlvyqUkXDk2258DcdKQH6y12upRX/5OfKDbmdQ/xxxVw1n4FK
 aFsx+7qobZLGkIse96KCq7Im5wTOeNhaQf244veuJFD1sA0xmJWX52o6ZBX9dmjDK+dILxt
 fskTx1vF2OGzh5NzWhciw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BRIpmDjtD0M=:MyRDhxesaVApwyMuGYZrTE
 HqLBBRCmU74TzuY1RUTJOr4f3NAmHGFbQyD1IS3gAPZ2ZAv6NAzX2Ge2xVPU5o1bVnOJXbCLG
 wwi4xUGwb77YATGwQA0lTjhD60SYIab/CbnH5/mrArznodVE+Ug1fWuBIEEFkeAVZLH0a8kOb
 TTTPYM6gWxM1+SqPSSNWydi/G+pSocaK5Jw9UiAe7YxaAx1l/A2RGvMA0kcbuTni1oZqkNAOa
 KQuc85Ri9b7EFh6DIy2oSQR+1JwLTstuAQaKtBRCeVwAdrffMlMDEppK6T+sEv9kcakJv2qxh
 fPMFf6H3xE68g33OKKe26c/hIIpnlZQFqmv3bmmbz1v6A1CmCdlVKdywJnQkxhrgD9HSMiCgn
 CHchMit7c+Zi9HxCk4+VvtX4WLah7ldlkoV0+SHRjNaz+wBkOAU0MoBB0J5DtkuW6QzPsi6tu
 7cf2r5wFBovjKRUUw+kPta9I6PcR/Gf0sACgP+/5v5tUsvIYWgwxuxISAa+2OeNuwY3ssGdAN
 dRlPEDLAy1fJx+0Dl3aZRI=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This addresses the warnings reported by checkpatch:
WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 7951324..b70db46 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -153,8 +153,6 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 	struct vchiq_instance *instance = NULL;
 	int i, ret;
 
-	vchiq_log_trace(vchiq_core_log_level, "%s called", __func__);
-
 	/*
 	 * VideoCore may not be ready due to boot up timing.
 	 * It may never be ready if kernel and firmware are mismatched,so don't
@@ -207,9 +205,6 @@ enum vchiq_status vchiq_shutdown(struct vchiq_instance *instance)
 	enum vchiq_status status;
 	struct vchiq_state *state = instance->state;
 
-	vchiq_log_trace(vchiq_core_log_level,
-		"%s(%p) called", __func__, instance);
-
 	if (mutex_lock_killable(&state->mutex))
 		return VCHIQ_RETRY;
 
@@ -249,9 +244,6 @@ enum vchiq_status vchiq_connect(struct vchiq_instance *instance)
 	enum vchiq_status status;
 	struct vchiq_state *state = instance->state;
 
-	vchiq_log_trace(vchiq_core_log_level,
-		"%s(%p) called", __func__, instance);
-
 	if (mutex_lock_killable(&state->mutex)) {
 		vchiq_log_trace(vchiq_core_log_level,
 			"%s: call to mutex_lock failed", __func__);
@@ -283,9 +275,6 @@ static enum vchiq_status vchiq_add_service(
 	struct vchiq_service *service = NULL;
 	int srvstate;
 
-	vchiq_log_trace(vchiq_core_log_level,
-		"%s(%p) called", __func__, instance);
-
 	*phandle = VCHIQ_SERVICE_HANDLE_INVALID;
 
 	srvstate = vchiq_is_connected(instance)
@@ -321,9 +310,6 @@ enum vchiq_status vchiq_open_service(
 	struct vchiq_state   *state = instance->state;
 	struct vchiq_service *service = NULL;
 
-	vchiq_log_trace(vchiq_core_log_level,
-		"%s(%p) called", __func__, instance);
-
 	*phandle = VCHIQ_SERVICE_HANDLE_INVALID;
 
 	if (!vchiq_is_connected(instance))
@@ -2350,8 +2336,6 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		goto out;
 	}
 
-	vchiq_log_trace(vchiq_susp_log_level, "%s", __func__);
-
 	if (use_type == USE_TYPE_VCHIQ) {
 		sprintf(entity, "VCHIQ:   ");
 		entity_uc = &arm_state->peer_use_count;
@@ -2409,8 +2393,6 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 		goto out;
 	}
 
-	vchiq_log_trace(vchiq_susp_log_level, "%s", __func__);
-
 	if (service) {
 		sprintf(entity, "%c%c%c%c:%03d",
 			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
@@ -2450,7 +2432,6 @@ vchiq_on_remote_use(struct vchiq_state *state)
 {
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
 
-	vchiq_log_trace(vchiq_susp_log_level, "%s", __func__);
 	atomic_inc(&arm_state->ka_use_count);
 	complete(&arm_state->ka_evt);
 }
@@ -2460,7 +2441,6 @@ vchiq_on_remote_release(struct vchiq_state *state)
 {
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
 
-	vchiq_log_trace(vchiq_susp_log_level, "%s", __func__);
 	atomic_inc(&arm_state->ka_release_count);
 	complete(&arm_state->ka_evt);
 }
@@ -2647,8 +2627,6 @@ vchiq_check_service(struct vchiq_service *service)
 	if (!service || !service->state)
 		goto out;
 
-	vchiq_log_trace(vchiq_susp_log_level, "%s", __func__);
-
 	arm_state = vchiq_platform_get_arm_state(service->state);
 
 	read_lock_bh(&arm_state->susp_res_lock);
-- 
2.7.4

