Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E62FA5
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:40 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Ml76o-1lBUD80IQO-00lUsm; Sun, 25 Apr 2021 12:51:30 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 08/11] staging: vchiq_arm: drop enum vchiq_status from vchiq_*_internal
Date: Sun, 25 Apr 2021 12:51:00 +0200
Message-Id: <1619347863-16080-9-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:H7acvbto9VMqpFF+nUouLRzTKt9CYHhdeZmd2qatItXFt/RS8CV
 t/hfBEYT2CLqjdx+fVN37Xgq2qUuERvCr/ZghAnwGGoaeBUB2svbOpGEZSKPSRUfz6hZrkM
 WEbGg06FlU/SCRNHsfkqS0H9nUmmaSaBOMTxf9gnKHFtJd97212YLZofJhKLJInemfE5nl9
 ZOKNgAC2h55P8kPzAeQUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gTaB+600yAY=:1MrX+wIHXjjp64J3tQ4Yp7
 eJfNuz0yrv1S92s2jn9xQ1t5xS91JgRbz6vc0S+zhAy6ciC95vDE1fHhU+LuQ//D9xUZz/24g
 jhyftzSshCqBuJLa8kUG8BRDBWFv2UEnL15pihJ3PwskiBAKeHMSUkCUNeeyktkZ152lZbF8m
 vpeRDFRRMcPyZLPWukdqFNdNFORFBRspc+qNv1talgulpYZRkEVhBEpKr3oFIhsp5R7JmWzpU
 4FpbieIoaXP2thmnyeQoc2kSZBnVwM38fUN+o6VDHUZG4Qdl9/7OUW8KvZWWIAP8hFXqYJY1X
 dBygdydimb/Z9MxvGoqhGZYzPUNTkFosafiCV5y4YF4OLWKIraxj1Rs6Jxg2vx3y/J9QUtLq7
 dONNXJ9R9Nls/bQLoEjrq370Hq1GfVjG9p6jKIfBI9EUlz+y5dNmbpeDPXj7N4uVaHnjUMAM5
 fFVv+V2x0/zhaob9j02B6+9g4ly8cpMQOO3ivIyIv4DCbFBgY4YMqLghkEM/Rxy6SkiQLh64y
 rNYFeYMrRCjmISDJG/M66k=
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
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
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

