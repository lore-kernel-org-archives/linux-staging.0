Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254712FBB
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:16:38 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mv2gw-1lQbIf4BZw-00r2mE; Sat, 15 May 2021 21:11:22 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 16/20] staging: vchiq_arm: make vchiq_shutdown_internal return void
Date: Sat, 15 May 2021 21:10:55 +0200
Message-Id: <1621105859-30215-17-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:LhjWVnmN8GN52zZIlgHJUESegMil6sg4wDYCKVGBos+rv5Sz2Sh
 JHw0thgbVekA4pbxLqlMsnz9CSU35MVi352fH0+cmhrvewgxus/EGfkBc737T5DmA2KqMIT
 Sn21i4SCU6xxPx21UMi7qwf2cqrQRLqaf/wTbTNj1q5UL2pKUrA3s2jqdolRRZFTDDZjVJn
 1XK3Mej8SZob2PI9oD5zA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DDlSvexq0c4=:3FWXTpvAYONt8K0l321kW9
 Fe89XPKRnrMqLI4RxSE0pyBhvTpJanDIWVVDvDn/3BF3CHDEE27VDciLe0/PbsyjrutKKSJLI
 4PyfU4WqtfAmvu+iQ5SfCdPBvyw64V9actpvkE35uQC4Zg05ycfXUCmulygLGPerC3WEN81iO
 PfSusjXpSojvZkdIsF9hKei9eGvYAtFLPD49trzioIvqXPRHTEb7YSi4BNurdQmtip7H0x4ef
 5SqrghKN27h+UrUJXJ9QHfUxni0wAWYtELoZirbOGlP6r9xqqoNXouIhC/ZbpfJszXTznowV0
 ZuAN+ESDSivx+F23nXut363ynEV8NMmfgtioOSXZx5wAVU8PqwjQNENILEYNF/GMcePuNbKL0
 8NSdg4D8DXCfI1psxUDqZG+Yur3ORdRIp+amdN1DPI08YAj6GcBNweS5rYi+p2mYSAW+o81Ci
 gHTtEH7YxvpQkKdPHM3teE3S1zWaDcBesHnXo1Ln//PyXrXf00jnaAuRCCp1OETrIS8ZqQUXZ
 B3b6yZv9J6d2+2S7pkDFgI=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function vchiq_shutdown_internal always returns VCHIQ_SUCCESS. So change
the return type to void and simplify the logic in vchiq_shutdown.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 25 ++++++++++------------
 .../vc04_services/interface/vchiq_arm/vchiq_core.c |  4 +---
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |  2 +-
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 65456c86..e7b5f14 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -202,33 +202,30 @@ EXPORT_SYMBOL(vchiq_initialise);
 
 enum vchiq_status vchiq_shutdown(struct vchiq_instance *instance)
 {
-	enum vchiq_status status;
+	enum vchiq_status status = VCHIQ_SUCCESS;
 	struct vchiq_state *state = instance->state;
+	struct bulk_waiter_node *waiter, *next;
 
 	if (mutex_lock_killable(&state->mutex))
 		return VCHIQ_RETRY;
 
 	/* Remove all services */
-	status = vchiq_shutdown_internal(state, instance);
+	vchiq_shutdown_internal(state, instance);
 
 	mutex_unlock(&state->mutex);
 
 	vchiq_log_trace(vchiq_core_log_level,
 		"%s(%p): returning %d", __func__, instance, status);
 
-	if (status == VCHIQ_SUCCESS) {
-		struct bulk_waiter_node *waiter, *next;
-
-		list_for_each_entry_safe(waiter, next,
-					 &instance->bulk_waiter_list, list) {
-			list_del(&waiter->list);
-			vchiq_log_info(vchiq_arm_log_level,
-					"bulk_waiter - cleaned up %pK for pid %d",
-					waiter, waiter->pid);
-			kfree(waiter);
-		}
-		kfree(instance);
+	list_for_each_entry_safe(waiter, next,
+				 &instance->bulk_waiter_list, list) {
+		list_del(&waiter->list);
+		vchiq_log_info(vchiq_arm_log_level,
+				"bulk_waiter - cleaned up %pK for pid %d",
+				waiter, waiter->pid);
+		kfree(waiter);
 	}
+	kfree(instance);
 
 	return status;
 }
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 1174715..0ec1c11 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2922,7 +2922,7 @@ vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instanc
 	return VCHIQ_SUCCESS;
 }
 
-enum vchiq_status
+void
 vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instance)
 {
 	struct vchiq_service *service;
@@ -2935,8 +2935,6 @@ vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instan
 		(void)vchiq_remove_service(service->handle);
 		unlock_service(service);
 	}
-
-	return VCHIQ_SUCCESS;
 }
 
 enum vchiq_status
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 89f898ce..5264677 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -563,7 +563,7 @@ vchiq_terminate_service_internal(struct vchiq_service *service);
 extern void
 vchiq_free_service_internal(struct vchiq_service *service);
 
-extern enum vchiq_status
+extern void
 vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instance);
 
 extern void
-- 
2.7.4

