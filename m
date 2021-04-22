Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4DB2FA1
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:50 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MMoT4-1lsIPD401c-00ImQd; Thu, 22 Apr 2021 22:08:40 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 08/10] staging: vchiq_core: drop vchiq_status from vchiq_set_service_option
Date: Thu, 22 Apr 2021 22:07:54 +0200
Message-Id: <1619122076-31785-9-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:ZlKKey7ATHNDpYH3tu9m+XhraJBmUFGln690RCNKjMLobMcSzy/
 nIGWg+gk4ogGHIMEOLJCKUoUR1PB+54nIrqf7YUjbNaSuLR/99UsxJKcVLCnTKPQgRCzOCp
 LoO6pK1z/vt0M7TR8mA+VyNykA2Cwfq2H+Sy+JXliUOK3nXI5p94soE+YbiW7zy9BVlOclP
 rEWpwH4ge3ENpQlvN+kmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tXkNLHmQTUU=:6GtStPL0AqZmAGtGR1YUh9
 KVVeYwwI0vyoGf2HyW3nOBHaxYF8NL9hrCayuTliCtoRpoYyyjrAU549gf+ajNj6SG/uCbJv9
 /3kvIocuxJAQKB0X2Rlgpar0Q6gkhgbCFjqYwY+pbsCkjP4p7wPcu4aoz4rGlqPvSr+9SF0iL
 lJWmhmjr0LRlmU2hkGUFpHlo7BhVGBe2w+C7Dd1u6QYkJ6qCmKR9h49umXHfkUGrlhKp9JVAV
 PrAArVqGWn4stEEOJJ7up7WDGnjUzqgnelhcpjN2Z54/tj0EolAfVT37WgA18Ia7QLx3XHJuC
 0Q4yD7Pgu0Xsnji+qemqMYbJyUZ6K4Kw2TnTCQsdFkgUty7YkVaIUYnvlFIM0k0h6fZVzyywZ
 LyzvcC2MQtsDp8UG0R104+nHLtcHM0/VB98giLdfnmNWHqL0ye24j6omtxx/cSkjrLXZe9YSR
 yjE3uJ/QSmdGXEETS0wNfApiMVWeLZ7JlLmiI3sNEERvVoJUF1KPLxw9pReJQcWCeC8pzg9Oi
 vSK7HLau7ul73Yap6bWW7o=
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
index 9f9677a..31c1c1a 100644
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
+	int ret = -EIO;
 
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

