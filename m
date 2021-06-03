Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5C6D2B
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:53 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGzDv-1lcP9v32Y7-00E9mN; Thu, 03 Jun 2021 17:50:48 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 02/16] staging: vchiq_arm: introduce free_bulk_waiter
Date: Thu,  3 Jun 2021 17:49:51 +0200
Message-Id: <1622735405-9980-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:akUJvfq7AD8rhc4tG0EDHLsQtyHFG40Tsiskmp5BN9XBDvZFQzj
 B4KvTMNTncWLOa80fgIEVg7DeqMaLWfIkAyjRwSEheCUAGeumPbacZdoQA3Yy3bQEpnB4EY
 yJ4Xoq5IVvuFBqLUh/34IaKvAbQOA27RT7EIEDdWj3/a8Sf2A3jbnA58wlcGFoTbovfoSIk
 BrHUJdO3hQ4aeSz1vxksg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fmY1NksyyBk=:MxZttP1/vLu/vVcALxqrmA
 nJyE20vMJMY7WL9jZIVKR0AkfmpJsg05E8Sm2nDe16RQl0jQo8ZOtaQC23MUX7wkre2BHXQEJ
 Jd/zHt0tzKuz8gJuZIPgSVV1wrgszgtc8smQQfbuwXowq0elkenXXvM0/xJG4FL/PHpVJmMRN
 9SaAUpxPqwfFM/zMc6o3Xf321Cc62bM8zSBy6Aw4VVBkJJPeaxsA7qoNTNrS/NpLK58uQNrfO
 nba16mITvDO5iNONDxD5xOq0GxHsZURl3/vv/tpYnW+Thdere0Lm68NTm4wbass4CqWfl4aay
 d3HpLjgr7lYgP0RWZkiPmjcaP/qFI//4IMC296I6p5hFX9VG9T8jJUzGeOt4Ji2DDvh9DNPyA
 L0thnQEptM471lfWafGVRCghMz+y2FfqW1ceovo+IEy5au/XqK5/TpzjWgCm2y6p3mBP12sjV
 xXHl4y7lmoDpaBs5wEtv0c2wgyrj3ZmjNhcd6eQVPu4J2kxR/JO3Tyf051lhZep0/ROWOkYMU
 h3hBAjHzHWBN3eqj2GmywI=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Avoid the copy & paste of freeing the bulk waiter and move it into a
separate function. Found by CPD.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 37 ++++++++++------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 344f35a..12a294c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -199,11 +199,24 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 }
 EXPORT_SYMBOL(vchiq_initialise);
 
+static void free_bulk_waiter(struct vchiq_instance *instance)
+{
+	struct bulk_waiter_node *waiter, *next;
+
+	list_for_each_entry_safe(waiter, next,
+				 &instance->bulk_waiter_list, list) {
+		list_del(&waiter->list);
+		vchiq_log_info(vchiq_arm_log_level,
+				"bulk_waiter - cleaned up %pK for pid %d",
+				waiter, waiter->pid);
+		kfree(waiter);
+	}
+}
+
 enum vchiq_status vchiq_shutdown(struct vchiq_instance *instance)
 {
 	enum vchiq_status status = VCHIQ_SUCCESS;
 	struct vchiq_state *state = instance->state;
-	struct bulk_waiter_node *waiter, *next;
 
 	if (mutex_lock_killable(&state->mutex))
 		return VCHIQ_RETRY;
@@ -216,14 +229,7 @@ enum vchiq_status vchiq_shutdown(struct vchiq_instance *instance)
 	vchiq_log_trace(vchiq_core_log_level,
 		"%s(%p): returning %d", __func__, instance, status);
 
-	list_for_each_entry_safe(waiter, next,
-				 &instance->bulk_waiter_list, list) {
-		list_del(&waiter->list);
-		vchiq_log_info(vchiq_arm_log_level,
-				"bulk_waiter - cleaned up %pK for pid %d",
-				waiter, waiter->pid);
-		kfree(waiter);
-	}
+	free_bulk_waiter(instance);
 	kfree(instance);
 
 	return status;
@@ -1943,18 +1949,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	/* Release the PEER service count. */
 	vchiq_release_internal(instance->state, NULL);
 
-	{
-		struct bulk_waiter_node *waiter, *next;
-
-		list_for_each_entry_safe(waiter, next,
-					 &instance->bulk_waiter_list, list) {
-			list_del(&waiter->list);
-			vchiq_log_info(vchiq_arm_log_level,
-				"bulk_waiter - cleaned up %pK for pid %d",
-				waiter, waiter->pid);
-			kfree(waiter);
-		}
-	}
+	free_bulk_waiter(instance);
 
 	vchiq_debugfs_remove_instance(instance);
 
-- 
2.7.4

