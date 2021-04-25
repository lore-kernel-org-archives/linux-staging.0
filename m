Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F5B72
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:33 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLQgv-1lsQMN1P3j-00IVul; Sun, 25 Apr 2021 12:51:28 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 01/11] staging: vchiq_arm: avoid crashing the kernel
Date: Sun, 25 Apr 2021 12:50:53 +0200
Message-Id: <1619347863-16080-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:RN9fEASRYzYQ9bwxMiuGhpj6C0mIde7B7dAuL5LHsnNtl9PrEPO
 8P5jcJpw+vyHOblMz0rlgSVXLEEhxgQnxuKt5wn1QDIdDq/1jcgcErkoez0O5xsjhrrjl0T
 Nt5KzTwcIHYXp0gE4t8SAKd5/myIsiVVecmYpGxYsOdmAE1fK3z89D4ZxJnWjoDX02wDBOx
 4USYcL6l26aTNLycwAZvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FXzSV+WiwtA=:6yd4u25M64GBPrE1dMqHSr
 eBfjYkZC91OCa0TOKfMtmGgN+zDwoTSmyqXdwZlhccdxeTqo0FQt1hS2wshwMKcRzC/nHEBr0
 0DjT5UvF0yJD5B6A85fNY6MnvBatfEfHcoZYH41ktQwGHZDjCKZw6wuPc5cdUADtdfVbRVJWg
 cS2tS1GXThDBdBWXGilLbNMQsZtSrFyo59Nj0Ckpeza8322kJsWYAlyrWLTnl0CA8wQfvkiO1
 k/IFlegtjZOc4KShM160RwpkooWMvtM202RO6sfFNjtLigc5ddPdiTAESCbgHFasbAl1X6D3C
 IegtwMRrXuU6cZHtiwHw8/t+J9fBWLszC0y++Dkmmn/Fv2mns9GZpxw49pcrt+k0BDCKBT7Qg
 pqnBOhtBQTOCGN/Z1IHd03v1+3msNvPB5SVEiiSxVFv8Gzk8aGmhMJm5rHImTKvsrO16d44B7
 e+ftytybHEna6oXlZikq73RZ/lVcW7vVfEewFaRF82m8zV2Gt74m8Uwt2sK6S7k9BI4MY3tao
 JTF6idpuq0fRweXM7fvkgg=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Using BUG_ON in a non-essential driver isn't recommend. So better
trigger a stacktrace and bailout.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
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

