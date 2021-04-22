Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E92F81
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:49 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEFrX-1ljK8x0h65-00ADr8; Thu, 22 Apr 2021 22:08:38 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 01/10] staging: vchiq_arm: avoid crashing the kernel
Date: Thu, 22 Apr 2021 22:07:47 +0200
Message-Id: <1619122076-31785-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Yb5ffQSfHIQ6wCBlJN+V1tj3tcodygyafoGHIeiIB2eMVab52+i
 +cyAmB4ps17BSLYFa6ZAbrQaQU+/waqe5+3zcq1SPXcIJTCnP+I/LEIPN2s+GKD/ITrB38v
 YWD8JVRzzsOy+LPUVVKSns1NrrSCVSpV9+CwHQ/nQy36lcgcx5p/N45xXXnlNVLXbuoyJ4s
 /nO4fwiqZ/wHccCa0gG1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:m/s0fojAJsI=:E/VQflVFwblMmK1Dr6kRIU
 DDu7wX31LwfN9dwq3vJhKZn99aOzWCc4nPkIXq5bWje5AHQtqCQlFrfx8/H5ScvVg9nwDz2ni
 b9r75T5hJ6EeMMN1JWWsLg+Zt3ziJoGOCaOR/DNQVRlQPokoqZmcm8AM+Qiowftpp+gEH3NIs
 9jvcu+uhZebTknlnk/4JP+3g6Ziu5kYoytjTEK0TwOuqjVjLhNVE1dGQNYhYCmZDr8tJZ3HQq
 M1NWhempQf6ktDRFwribKf0QE9W7P8ZEvkht1GK4tDfJp3n35056hFKU8XbT8YKh2DfCY3Zez
 NUaLSc3mku3/2XnT6ucohljLKsYFhgGCRiTBNBxfj0yOelsIyoojDljBr61IuJap0whGuxX3h
 2YY552xfEpCpEDUVrv382iuqM5E10MXKVKj1rH7SMYJkzOBlNj5/BzxF7oZmlOi2rbKv9k3aB
 wf7sc7v966KVP8OX5zAs/uPnbMjpT9ZT1ZEihNsl8mInhztGEFFno/mS8PLS0e/BbyOOWoDCd
 huEf6jZ1gErCedZPYidVsY=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Using BUG_ON in a non-essential driver isn't recommend. So better
trigger a stacktrace and bailout.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c       | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 8b2b477..c51840a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -602,7 +602,9 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
 	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 
 	service = handle_to_service(handle);
-	BUG_ON(!service);
+	if (WARN_ON(!service))
+		return VCHIQ_SUCCESS;
+
 	user_service = (struct user_service *)service->base.userdata;
 	instance = user_service->instance;
 
@@ -918,8 +920,12 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 			goto out;
 	}
 
-	BUG_ON((int)(user_service->msg_insert -
-		user_service->msg_remove) < 0);
+	if (WARN_ON_ONCE((int)(user_service->msg_insert -
+			 user_service->msg_remove) < 0)) {
+		spin_unlock(&msg_queue_spinlock);
+		ret = -EINVAL;
+		goto out;
+	}
 
 	header = user_service->msg_queue[user_service->msg_remove &
 		(MSG_QUEUE_SIZE - 1)];
@@ -1937,7 +1943,10 @@ static int vchiq_release(struct inode *inode, struct file *file)
 
 		wait_for_completion(&service->remove_event);
 
-		BUG_ON(service->srvstate != VCHIQ_SRVSTATE_FREE);
+		if (WARN_ON(service->srvstate != VCHIQ_SRVSTATE_FREE)) {
+			unlock_service(service);
+			break;
+		}
 
 		spin_lock(&msg_queue_spinlock);
 
-- 
2.7.4

