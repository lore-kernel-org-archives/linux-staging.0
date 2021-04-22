Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60062FA1
	for <linux-staging@lists.linux.dev>; Thu, 22 Apr 2021 20:08:44 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MAOVx-1lkz6R21Tn-00BrUC; Thu, 22 Apr 2021 22:08:40 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 10/10] staging: vchiq_core: drop vchiq_status from vchiq_init_state
Date: Thu, 22 Apr 2021 22:07:56 +0200
Message-Id: <1619122076-31785-11-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:jVJ3kylL2aG7zaAhK3/BR018ckIIjbJzZmuRLztInvB1jD+opLN
 C9gdJNYMpNIcWCDxco2XATW+79v1CnNjtj3uwSa/x1Wb4l47GWzxqbyvRPWW65j30kQyL/d
 CreQeJLrqTWd6rDRr1mMdTpW6v1JohTGBSe7v/T2eKoqPNmBsfkyvhAONCGm+s0f0bWkiph
 SWFMcXSkJ0rqwm47kUsDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:racCJZKMEQM=:HOAMv5qbjh5u22Q1t9J/3e
 QfXUvevtUwoyMec2ddPwX2P90BxDq6AOEHLad046eIfjCsFUnT4i7UdWYNnPkRdxHFlrj8PMo
 mTlE/x1cuPt0Gop7LxmtI9CjQnG+NH9e4V+rermPxMpHOk8kR8EDMQ0T08R7NH9OOXxu9dA2R
 +TXBaV4zsdRTYGI4VEDNmnp3JF2CJKOlxd0qOglJ0rlrMVCE7g4mZsCRp+Ny792RVr3qZ9fQx
 WGhrjnv4QNygoqcbgjzmsWN8d1pAhK/nP36tB4AljrXfbN+GeyPVHDgY8FVu1lknEnFDUwvu7
 hFNpZTk7PzmWTqrPOBMtjqRLWv61s8b7f7Z5+j19Gqd4dqai9p6T9lgzOOFVtpLqxqYqPb+4T
 ZWtve0NdGlkj9B07kkwdqp+7bGA4LnXY3IbLo4Wkti68My4pdVHhlhEtGi3nWFMO7uyPio6b3
 HroXEk+H1o0I+uGX0VbWbo/TZb+yDkTv+Z+EocFFo73TdHtlINfY7j/FRMhprqMsJAmNNxcbE
 Cr1S18wkSXzc7XvNojia4A=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes for
vchiq_init_state().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_2835_arm.c    |  5 +++--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 15 ++++++++-------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h        |  2 +-
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index a644fe6..c3fbb29 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -132,8 +132,9 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
 	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
 
-	if (vchiq_init_state(state, vchiq_slot_zero) != VCHIQ_SUCCESS)
-		return -EINVAL;
+	err = vchiq_init_state(state, vchiq_slot_zero);
+	if (err)
+		return err;
 
 	g_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(g_regs))
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 31c1c1a..4a4ce3c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2162,13 +2162,12 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 {
 	struct vchiq_shared_state *local;
 	struct vchiq_shared_state *remote;
-	enum vchiq_status status = VCHIQ_SUCCESS;
 	char threadname[16];
 	int i, ret;
 
 	if (vchiq_states[0]) {
 		pr_err("%s: VCHIQ state already initialized\n", __func__);
-		return VCHIQ_ERROR;
+		return -EINVAL;
 	}
 
 	local = &slot_zero->slave;
@@ -2181,7 +2180,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 		else
 			vchiq_loud_error("master/slave mismatch two slaves");
 		vchiq_loud_error_footer();
-		return VCHIQ_ERROR;
+		return -EINVAL;
 	}
 
 	memset(state, 0, sizeof(struct vchiq_state));
@@ -2248,7 +2247,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 
 	ret = vchiq_platform_init_state(state);
 	if (ret)
-		return VCHIQ_ERROR;
+		return ret;
 
 	/*
 	 * bring up slot handler thread
@@ -2262,7 +2261,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 		vchiq_loud_error_header();
 		vchiq_loud_error("couldn't create thread %s", threadname);
 		vchiq_loud_error_footer();
-		return VCHIQ_ERROR;
+		return PTR_ERR(state->slot_handler_thread);
 	}
 	set_user_nice(state->slot_handler_thread, -19);
 
@@ -2274,6 +2273,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 		vchiq_loud_error_header();
 		vchiq_loud_error("couldn't create thread %s", threadname);
 		vchiq_loud_error_footer();
+		ret = PTR_ERR(state->recycle_thread);
 		goto fail_free_handler_thread;
 	}
 	set_user_nice(state->recycle_thread, -19);
@@ -2286,6 +2286,7 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 		vchiq_loud_error_header();
 		vchiq_loud_error("couldn't create thread %s", threadname);
 		vchiq_loud_error_footer();
+		ret = PTR_ERR(state->sync_thread);
 		goto fail_free_recycle_thread;
 	}
 	set_user_nice(state->sync_thread, -20);
@@ -2299,14 +2300,14 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 	/* Indicate readiness to the other side */
 	local->initialised = 1;
 
-	return status;
+	return 0;
 
 fail_free_recycle_thread:
 	kthread_stop(state->recycle_thread);
 fail_free_handler_thread:
 	kthread_stop(state->slot_handler_thread);
 
-	return VCHIQ_ERROR;
+	return ret;
 }
 
 void vchiq_msg_queue_push(unsigned int handle, struct vchiq_header *header)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index bd1f590..89f898ce 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -539,7 +539,7 @@ get_conn_state_name(enum vchiq_connstate conn_state);
 extern struct vchiq_slot_zero *
 vchiq_init_slots(void *mem_base, int mem_size);
 
-extern enum vchiq_status
+extern int
 vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero);
 
 extern enum vchiq_status
-- 
2.7.4

