Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD72E2FA4
	for <linux-staging@lists.linux.dev>; Sun, 25 Apr 2021 10:51:41 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.137]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N9M5y-1lVF4w43XA-015L3c; Sun, 25 Apr 2021 12:51:31 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 11/11] staging: vchiq_core: drop vchiq_status from vchiq_init_state
Date: Sun, 25 Apr 2021 12:51:03 +0200
Message-Id: <1619347863-16080-12-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:eEBtG1+Myiw6PejKQQVv1L3yeGjLMRbGqHgsRxwjJ+u8m7m9Cy6
 mpAX45p5C5jClzOfmGtpkI36hBwuX/ZBTNfQceeXjWHh34HdiCd840JtigEaCFU9x/u2jrE
 AAVc5EHnwkiCbmASxhgp5YT49pjIWsf+WvVxlt3+hIR492mOxbAMqG4Yt6c3os87sJEIaZ5
 LFAag8/kvmgAqdxIF6Gcw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JKic4PbT5tc=:gvAcl2ZDUp98hYS9//kIYs
 y+5KfO0dQBCoiJCRf8cRIS+BOQ3lCflHp/YO18g/UDKrmGwTniflXwZS8475Eu2OkBJP7lHWF
 YV8121bg8b6+k4QcWRLEtBPxYiiM4HSIv2wRTROWnYWGubRI1zdew4WRrPns0VURWTp8xYr7T
 YH/lG08OWDXru3IlB/7mybVnBXg6OFhejWhU+DjKCD+Zfu518myIbs2mzA8Ybht2873ipkP71
 YCoZhz+dAx2b0I4JncMImUVCkatptT9aLB8RYFcGE8wwH2sT1dQrZ3gFvlkUvq8Vp5h5Yd5yQ
 tSkkdY7h04dESZqQpYwITjxxdXbXGVqfelErgacdb8sAHYCboOeW5h+HYXLzoA6FiXzJPu8Tr
 U85iPfk1Tud5vYGrOflibIPcynCMdp9IpX/FYjjPs3CgHpRVuhnJhbL+X9dKn7TNjAus35mM3
 etnkXCf+D0fOozWu+L2blrHmRdoaOEs9es7bEKi4QMH+Nn9EqPVWSv0e6wTCy9kbhMcI5DdaX
 YX44K8DzrCmq8Pu7Ag7bQI=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Replace the custom set of return values with proper Linux error codes for
vchiq_init_state().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
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
index e150feb..ff85327 100644
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

