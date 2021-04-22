Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F96B2F83
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:13:58 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MN5aF-1ls1I22Z3F-00J3Xm; Thu, 22 Apr 2021 22:08:39 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 07/10] staging: vchiq_arm: drop enum vchiq_status from vchiq_*_internal
Date: Thu, 22 Apr 2021 22:07:53 +0200
Message-Id: <1619122076-31785-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:zzpKKaZn+PJPLbc7dsBDY834amU/JDFPJA/XG5HtxdrTkTFFHmv
 0faYRvwyb6h7Cr6QPN8Ngy7b0e4p+Or5aESYJibm/O672EsswHlt3Hks/n8iMYjs1wZ2vbC
 RLRfNYey9atbaHpVf/sOTvLC8my8nmGvqE+3M8tqaOLhA/n7nIJNiNu3FZSBP2PFoiNMY8D
 JUfkh9ALaEHq1j6NI/p6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xFSNVrLwKbk=:xlxYmWAPpk+jQPHbqmJR30
 GWSXRtCSdxfdPy9Weqn0UZGYP2xg4tgsX0N+EaGEJSdUAgsZmFpJilZq8zSvwjjuIG9itonQ+
 TxjsDcKksedN0fEw+iGa1RxzjYhgQFkNtkEzh9StNxV7LRMne7kpW9tiSGKAi15FopFVV3G0u
 A6dM8lwa+pDeI0Mjmd2LIeM6fhDMROzn3LyNIrvRgCgwjjcmgPNCHHIarSGBvkQhnCLtfwSoW
 E9bXxo81pu7xZf9CeGnCfXjuZGEX+NoUVaLJu5ZGZhNhw0z4U77fn8pRYYo+Zvnr9xqfmLtH7
 pRPTCn6+uBG+OC3GqqzFkm/s/ndoq/NnCCllo414uXUxx+1mKnXdvZm1wlmqVcTMHwms7O1E/
 iJkm8uTfnOESZReWISjOEbKMDJGscdnDaqhj6XcErOdZwG3tg6P5/H6OcBrU1cDOj85p5o+wF
 ZQo1f06EZxgu2seKYlK5hH+wycoiPUM+x3W4ivMbjxDTn50NaImXXdFxiE87v5ZuM+smxs6U5
 IzwqyUhfNuWhTXkgYx32FM=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes
for the following functions:

vchiq_use_internal()
vchiq_release_internal()
vchiq_use_service_internal()
vchiq_release_service_internal()

Now we can use the result directly as return value for vchiq_ioctl().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 31 +++++++++++-----------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |  4 +--
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index db10d83..3395201 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1385,21 +1385,20 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		service = find_service_for_instance(instance, handle);
 		if (service) {
-			status = (cmd == VCHIQ_IOC_USE_SERVICE)	?
+			ret = (cmd == VCHIQ_IOC_USE_SERVICE) ?
 				vchiq_use_service_internal(service) :
 				vchiq_release_service_internal(service);
-			if (status != VCHIQ_SUCCESS) {
+			if (ret) {
 				vchiq_log_error(vchiq_susp_log_level,
-					"%s: cmd %s returned error %d for service %c%c%c%c:%03d",
+					"%s: cmd %s returned error %ld for service %c%c%c%c:%03d",
 					__func__,
 					(cmd == VCHIQ_IOC_USE_SERVICE) ?
 						"VCHIQ_IOC_USE_SERVICE" :
 						"VCHIQ_IOC_RELEASE_SERVICE",
-					status,
+					ret,
 					VCHIQ_FOURCC_AS_4CHARS(
 						service->base.fourcc),
 					service->client_id);
-				ret = -EINVAL;
 			}
 		} else
 			ret = -EINVAL;
@@ -2330,18 +2329,18 @@ vchiq_arm_init_state(struct vchiq_state *state,
 	}
 }
 
-enum vchiq_status
+int
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		   enum USE_TYPE_E use_type)
 {
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
-	enum vchiq_status ret = VCHIQ_SUCCESS;
+	int ret = 0;
 	char entity[16];
 	int *entity_uc;
 	int local_uc;
 
 	if (!arm_state) {
-		ret = VCHIQ_ERROR;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -2357,7 +2356,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		entity_uc = &service->service_use_count;
 	} else {
 		vchiq_log_error(vchiq_susp_log_level, "%s null service ptr", __func__);
-		ret = VCHIQ_ERROR;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -2371,7 +2370,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 
 	write_unlock_bh(&arm_state->susp_res_lock);
 
-	if (ret == VCHIQ_SUCCESS) {
+	if (!ret) {
 		enum vchiq_status status = VCHIQ_SUCCESS;
 		long ack_cnt = atomic_xchg(&arm_state->ka_use_ack_count, 0);
 
@@ -2391,16 +2390,16 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	return ret;
 }
 
-enum vchiq_status
+int
 vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 {
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
-	enum vchiq_status ret = VCHIQ_SUCCESS;
+	int ret = 0;
 	char entity[16];
 	int *entity_uc;
 
 	if (!arm_state) {
-		ret = VCHIQ_ERROR;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -2421,7 +2420,7 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 		/* Don't use BUG_ON - don't allow user thread to crash kernel */
 		WARN_ON(!arm_state->videocore_use_count);
 		WARN_ON(!(*entity_uc));
-		ret = VCHIQ_ERROR;
+		ret = -EINVAL;
 		goto unlock;
 	}
 	--arm_state->videocore_use_count;
@@ -2460,13 +2459,13 @@ vchiq_on_remote_release(struct vchiq_state *state)
 	complete(&arm_state->ka_evt);
 }
 
-enum vchiq_status
+int
 vchiq_use_service_internal(struct vchiq_service *service)
 {
 	return vchiq_use_internal(service->state, service, USE_TYPE_SERVICE);
 }
 
-enum vchiq_status
+int
 vchiq_release_service_internal(struct vchiq_service *service)
 {
 	return vchiq_release_internal(service->state, service);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 6b3a907..aad1c5c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -667,10 +667,10 @@ extern int
 vchiq_dump_platform_service_state(void *dump_context,
 	struct vchiq_service *service);
 
-extern enum vchiq_status
+extern int
 vchiq_use_service_internal(struct vchiq_service *service);
 
-extern enum vchiq_status
+extern int
 vchiq_release_service_internal(struct vchiq_service *service);
 
 extern void
-- 
2.7.4

