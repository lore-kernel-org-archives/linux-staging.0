Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA22FA6
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:35 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmkjY-1l9qa42xuw-00jpvS; Sun, 25 Apr 2021 12:51:30 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 10/11] staging: vchiq_core: drop vchiq_status from vchiq_initialise
Date: Sun, 25 Apr 2021 12:51:02 +0200
Message-Id: <1619347863-16080-11-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:F6N+IJhXXPAC1X2Mqwe82o/W/1Jz2aoRRKQyb11lVSOAxSOSrS5
 r45pobCBISai0CxoWlnIWGH4ZnxU3lOY7zPj3oGwtO97HeDWppRdUMZd4gp38+YoxGkKyza
 q80vInk74tXfZBPKZnsJPxUOcyeTR//2Ex+W3bYkz4q7QfB94GXb62NsaBezOq+YYn6DwhP
 Yhl9HqsiJM+qDNL77I6DA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5gFWQ6x/7do=:0hxdW39Hgnt0+Riws6zoZ3
 ItsVVMOFN/f8dou1npqZyZ3ZdDwrmY37e1zQvxVah0v+MJkrdzfzZHJlJQ6458L7G9mPprb/i
 WDMhxcGYAKs1xM2+/8LSg1qJ/4XTl/alSsBLeKNxR7ntln7ZE1M2wGwZjflSXsgJshpKnauxF
 WZZpIJTVYTrXkkZM+UZTRL2ID1PTGmHkOyDXah/GR2gDwGpd/V8lHNOXQiWOWuPhZo3zin4oP
 /niE41bgiYwkXQtIgV9fY/ricqhaaFs2Fve2RUQ/+9I/DQhAj+Bj77BjZt7WlzeVKSVh5V2g4
 RmsRD7+GFN8T4Imohd6rgM1AYYiqB46RanFvSaqKEBhfD47nV99VsVPeh6Fvl6dCN3ZT5jH1Q
 Ycv0pt+DXEgMsxNfbchChs+diAkT4r7MbG++3UljEwllKx1mg5Xa5Hr9BsWFbw/tqPpf6TfIp
 hQvhiwUvnRXmt0obc0TZGUd7HmIPRbfJR0q23Q+aaMSRjey4nnpzHUHbggSeSbp0eb1pSTE1D
 W8OY6JzlfxtuPxeNJvRW+0=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes for
vchiq_initialise().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
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

