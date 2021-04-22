Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0F2FA2
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:44 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M3DFj-1lchMb118X-003a1q; Thu, 22 Apr 2021 22:08:40 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 09/10] staging: vchiq_core: drop vchiq_status from vchiq_initialise
Date: Thu, 22 Apr 2021 22:07:55 +0200
Message-Id: <1619122076-31785-10-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:lEI+MMZmqA6hHlQSsGRqWRE9IkVvmdt2z7+ZYKn076tht9aJY1K
 9jYGKmmL02ZUvPW77KoSfeoOw2LQdkwR/O4R4Z+SPFR9qq5c2zINeVHTck2+tKRJ4M1Tn8B
 EbAChIJxh1nL+j448ShCxEXIhMg4B2lVaoc6j8m3xi9LLPcugPx43oBfDAIsRwPSpOXOmno
 PIDFCo2Tcny4z0PoKV3FA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ewk2jAoDAqg=:i8JX7ftk5RX1onySDOjBFW
 UDKMFNhkgHNRVu63tWEtIwp2/pRtEq2cLQVv6Ykr1vIqc58NwK4ppy71J/zc8cAg3pa07/S/g
 w80r6O5DYqEeSVfyfRzuET391c45BKYRLWpIU8PCA06C3zeGwSe4dp/bgFFMZke7+N2/hFJO5
 vV9phXIPKQuM552glDI0P0CDFFv7vKyUf6fvtIFGpXvsmYaOUYNRNdg3ZwrMatGxUpM3r0VGO
 4d0woSGVcwwCiYZ0fxidSSrtqmo/NvtlloJVp4LpGf7ctMyODwd7iY4q+n1J0txJ7F7n2kC6V
 34BuNhVYPSvHqhQQvAdDahjv0MlROjuTDsIF8i0yiUT60BhsGT+5dhFPiJBpP8DTlSf94Jce7
 3GNf9Kz2tx2XI5MWT+d6D4YQ2Olil9Ri2iFfa+iiAu/8qp+3DdYliyWj61jtuyck6g23NKjTb
 k6HIzSD0U+YA4IlXaQAIo8qTqil23sCqj/PpyGxemm1E63Ufu1E0t4r5Do6rSMrlXHmDIMZDO
 Gt9HCUC017JabPLtc9YleQ=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes for
vchiq_initialise().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index ab2ce07..04a72d4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -147,12 +147,11 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data,
 	unsigned int size, enum vchiq_bulk_dir dir);
 
 #define VCHIQ_INIT_RETRIES 10
-enum vchiq_status vchiq_initialise(struct vchiq_instance **instance_out)
+int vchiq_initialise(struct vchiq_instance **instance_out)
 {
-	enum vchiq_status status = VCHIQ_ERROR;
 	struct vchiq_state *state;
 	struct vchiq_instance *instance = NULL;
-	int i;
+	int i, ret;
 
 	vchiq_log_trace(vchiq_core_log_level, "%s called", __func__);
 
@@ -170,6 +169,7 @@ enum vchiq_status vchiq_initialise(struct vchiq_instance **instance_out)
 	if (i == VCHIQ_INIT_RETRIES) {
 		vchiq_log_error(vchiq_core_log_level,
 			"%s: videocore not initialized\n", __func__);
+		ret = -ENOTCONN;
 		goto failed;
 	} else if (i > 0) {
 		vchiq_log_warning(vchiq_core_log_level,
@@ -181,6 +181,7 @@ enum vchiq_status vchiq_initialise(struct vchiq_instance **instance_out)
 	if (!instance) {
 		vchiq_log_error(vchiq_core_log_level,
 			"%s: error allocating vchiq instance\n", __func__);
+		ret = -ENOMEM;
 		goto failed;
 	}
 
@@ -191,13 +192,13 @@ enum vchiq_status vchiq_initialise(struct vchiq_instance **instance_out)
 
 	*instance_out = instance;
 
-	status = VCHIQ_SUCCESS;
+	ret = 0;
 
 failed:
 	vchiq_log_trace(vchiq_core_log_level,
-		"%s(%p): returning %d", __func__, instance, status);
+		"%s(%p): returning %d", __func__, instance, ret);
 
-	return status;
+	return ret;
 }
 EXPORT_SYMBOL(vchiq_initialise);
 
@@ -2236,6 +2237,7 @@ vchiq_keepalive_thread_func(void *v)
 	enum vchiq_status status;
 	struct vchiq_instance *instance;
 	unsigned int ka_handle;
+	int ret;
 
 	struct vchiq_service_params_kernel params = {
 		.fourcc      = VCHIQ_MAKE_FOURCC('K', 'E', 'E', 'P'),
@@ -2244,10 +2246,10 @@ vchiq_keepalive_thread_func(void *v)
 		.version_min = KEEPALIVE_VER_MIN
 	};
 
-	status = vchiq_initialise(&instance);
-	if (status != VCHIQ_SUCCESS) {
+	ret = vchiq_initialise(&instance);
+	if (ret) {
 		vchiq_log_error(vchiq_susp_log_level,
-			"%s vchiq_initialise failed %d", __func__, status);
+			"%s vchiq_initialise failed %d", __func__, ret);
 		goto exit;
 	}
 
-- 
2.7.4

