Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B3C2FA8
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:41 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mt7st-1lL0Dj1tf7-00tVcf; Sun, 25 Apr 2021 12:51:30 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 09/11] staging: vchiq_core: drop vchiq_status from vchiq_set_service_option
Date: Sun, 25 Apr 2021 12:51:01 +0200
Message-Id: <1619347863-16080-10-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:xsu47Tum37Awiiv1jnTBeILO6cRh8I4EKnC38oHMw1M4sC1aIEd
 UQ/heoozsWWIF9omRsG3UnQqvT9JzSVqUSxoEnF2UFeof0olimeDOcCOQSmbTp9KqPEvs6t
 UXYf8VrhWWAqXg1qbr7xyai0vTyGZGK5VCv5sYG74qnp6ESUnWWSWyqMu7D3ZRP0Tqqdd2F
 UUKAltxrTyfKtg7ikyFnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mNuxaqduVMo=:6t7rxsEGZGZM0LRureHOJn
 tWkmXRyhoXimDm0oZKkaKDE/NamSeIFcttP/zYwolK9lo2E1Izwl3bS7pSPocPrCv809zVuvD
 E8lKdh4hIL52JsKMbDFUQY786Ck/YA1Poo2UeziSgt8Fo2XT6eG7IfvDp3mKnjLjQ0qbMM81m
 l36EGw+qIDrO8Q7wRE4dgRdQbxjxISRdMnLzUptt6mK0swQzJN/3NXN8GTuM86DfXZ7rtG+Gw
 AMf8OKjjG6+g4UtGUEjgjn7On2DWIzKAxCrLviOuN/Y0RDMF/UdfGOfHGfYfVAoSFKaCTddKs
 8C5OHnl8VrkP4XIlZ/bTP/fo11OcsgOm7d/FOF1TQR4nomciC3tnQw1xejZL2otKniHpDBPYi
 ojfhTqZMaSivndaXIHBxlXxFE4RDgVm8j4rLNys01LAArWA8+6P6I4b06P3TnOCEV21K8pG2x
 doLa4gyfgM1Kq/t3iwa3tMdUHPMlcRpH7Ksz84ULZgnkcq5Edxs0x3npXVj7zbuCAuwAldiId
 V24pLg8Maoe8BI5fQVQfok=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes for
vchiq_set_service_option(). Now we can use the result directly as return
value for vchiq_ioctl().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  4 ++--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 18 +++++++++---------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h     |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3395201..ab2ce07 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1517,8 +1517,8 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			break;
 		}
 
-		status = vchiq_set_service_option(
-				args.handle, args.option, args.value);
+		ret = vchiq_set_service_option(args.handle, args.option,
+					       args.value);
 	} break;
 
 	case VCHIQ_IOC_LIB_VERSION: {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9f9677a..e150feb 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3371,21 +3371,21 @@ void vchiq_get_config(struct vchiq_config *config)
 	config->version_min            = VCHIQ_VERSION_MIN;
 }
 
-enum vchiq_status
+int
 vchiq_set_service_option(unsigned int handle,
 	enum vchiq_service_option option, int value)
 {
 	struct vchiq_service *service = find_service_by_handle(handle);
-	enum vchiq_status status = VCHIQ_ERROR;
 	struct vchiq_service_quota *quota;
+	int ret = -EINVAL;
 
 	if (!service)
-		return VCHIQ_ERROR;
+		return -EINVAL;
 
 	switch (option) {
 	case VCHIQ_SERVICE_OPTION_AUTOCLOSE:
 		service->auto_close = value;
-		status = VCHIQ_SUCCESS;
+		ret = 0;
 		break;
 
 	case VCHIQ_SERVICE_OPTION_SLOT_QUOTA:
@@ -3402,7 +3402,7 @@ vchiq_set_service_option(unsigned int handle,
 				 * dropped below its quota
 				 */
 				complete(&quota->quota_event);
-			status = VCHIQ_SUCCESS;
+			ret = 0;
 		}
 		break;
 
@@ -3420,7 +3420,7 @@ vchiq_set_service_option(unsigned int handle,
 				 * dropped below its quota
 				 */
 				complete(&quota->quota_event);
-			status = VCHIQ_SUCCESS;
+			ret = 0;
 		}
 		break;
 
@@ -3428,13 +3428,13 @@ vchiq_set_service_option(unsigned int handle,
 		if ((service->srvstate == VCHIQ_SRVSTATE_HIDDEN) ||
 		    (service->srvstate == VCHIQ_SRVSTATE_LISTENING)) {
 			service->sync = value;
-			status = VCHIQ_SUCCESS;
+			ret = 0;
 		}
 		break;
 
 	case VCHIQ_SERVICE_OPTION_TRACE:
 		service->trace = value;
-		status = VCHIQ_SUCCESS;
+		ret = 0;
 		break;
 
 	default:
@@ -3442,7 +3442,7 @@ vchiq_set_service_option(unsigned int handle,
 	}
 	unlock_service(service);
 
-	return status;
+	return ret;
 }
 
 static int
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index aad1c5c..bd1f590 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -712,7 +712,7 @@ extern int vchiq_get_client_id(unsigned int service);
 
 extern void vchiq_get_config(struct vchiq_config *config);
 
-extern enum vchiq_status
+extern int
 vchiq_set_service_option(unsigned int service, enum vchiq_service_option option,
 			 int value);
 
-- 
2.7.4

