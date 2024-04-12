Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D55B4CDF9
	for <linux-staging@lists.linux.dev>; Fri, 12 Apr 2024 07:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908705; cv=none; b=k5D/8U9+/9VVwV8nxZvCinCdXZB4dp2nkz8CMXgo6dwd9kJD7RlwSIvHgqOLHe/NfAAJZ7qP2saF7vlS0CYJvp6ynYJ/85u5jwalpFU7cKEMLNFpyjNtps0MhlyqFwgoXnP9OVIOkesONvAnpbP2Fu68nksCvBOmCbNhW5v3YnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908705; c=relaxed/simple;
	bh=ukA+Ojc8CbYxb7wueWt0eDR6921rQ6IUnd3CR6R+Yx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOvcwkQ2NFG7BJDkgiWwxOP+fAkVcqmB3ToOKogYxK2A9Ari9VyMOID+z5MsVkbzvSP1ysj8wkk5xI9hYVQjPmLhgWlerD4jWtso8AmYvJ1WDpDO5UoXEMFcMDPCI1UcTqMnHs73nzUY5UX0lDvzWphSvYJbjkNGNC17A2I/O/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=juZoZXzI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="juZoZXzI"
Received: from fedora.local (unknown [103.251.226.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F53DA68;
	Fri, 12 Apr 2024 09:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712908659;
	bh=ukA+Ojc8CbYxb7wueWt0eDR6921rQ6IUnd3CR6R+Yx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=juZoZXzIltkYC7W2woZ1yUkj4LM8M1wZN4RjmaK9tWNAhsiS8/YLHDQhSOhc7HD0A
	 4W0QA69Q+UTNGvIal+2NDNZvUi3N1tjnzp5VxBbg1b5ts6KPip55OcFB3AYmkIfk7W
	 iK+1CU2S/7HsXSBmo1RPtSr7H3gurSefLbkmXPyY=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v5 07/11] staging: vc04_services: Move global memory mapped pointer
Date: Fri, 12 Apr 2024 13:27:39 +0530
Message-ID: <20240412075743.60712-8-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412075743.60712-1-umang.jain@ideasonboard.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

g_regs stores the remapped memory pointer for the vchiq platform.
It can be moved to struct vchiq_drv_mgmt instead of being global.

Adjust the affected functions accordingly. Pass vchiq_state pointer
wherever necessary to access struct vchiq_drv_mgmt.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 19 +++++++++++--------
 .../interface/vchiq_arm/vchiq_arm.h           |  2 ++
 .../interface/vchiq_arm/vchiq_core.c          | 10 +++++-----
 .../interface/vchiq_arm/vchiq_core.h          |  2 +-
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 29f9affe5304..9fc98411a2b8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -129,8 +129,6 @@ struct vchiq_pagelist_info {
 	unsigned int scatterlist_mapped;
 };
 
-static void __iomem *g_regs;
-
 static int
 vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
 			     unsigned int size, enum vchiq_bulk_dir dir);
@@ -139,11 +137,14 @@ static irqreturn_t
 vchiq_doorbell_irq(int irq, void *dev_id)
 {
 	struct vchiq_state *state = dev_id;
+	struct vchiq_drv_mgmt *mgmt;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int status;
 
+	mgmt = dev_get_drvdata(state->dev);
+
 	/* Read (and clear) the doorbell */
-	status = readl(g_regs + BELL0);
+	status = readl(mgmt->regs + BELL0);
 
 	if (status & ARM_DS_ACTIVE) {  /* Was the doorbell rung? */
 		remote_event_pollall(state);
@@ -556,9 +557,9 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 	if (err)
 		return err;
 
-	g_regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(g_regs))
-		return PTR_ERR(g_regs);
+	drv_mgmt->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drv_mgmt->regs))
+		return PTR_ERR(drv_mgmt->regs);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0)
@@ -641,8 +642,10 @@ static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *
 }
 
 void
-remote_event_signal(struct remote_event *event)
+remote_event_signal(struct vchiq_state *state, struct remote_event *event)
 {
+	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(state->dev);
+
 	/*
 	 * Ensure that all writes to shared data structures have completed
 	 * before signalling the peer.
@@ -654,7 +657,7 @@ remote_event_signal(struct remote_event *event)
 	dsb(sy);         /* data barrier operation */
 
 	if (event->armed)
-		writel(0, g_regs + BELL2); /* trigger vc interrupt */
+		writel(0, mgmt->regs + BELL2); /* trigger vc interrupt */
 }
 
 int
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 52013bbc5171..10c1bdc50faf 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -50,6 +50,8 @@ struct vchiq_drv_mgmt {
 	char *fragments_base;
 	char *free_fragments;
 	unsigned int fragments_size;
+
+	void __iomem *regs;
 };
 
 struct user_service {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 76c27778154a..8c339aebbc99 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -691,7 +691,7 @@ reserve_space(struct vchiq_state *state, size_t space, int is_blocking)
 			/* But first, flush through the last slot. */
 			state->local_tx_pos = tx_pos;
 			local->tx_pos = tx_pos;
-			remote_event_signal(&state->remote->trigger);
+			remote_event_signal(state, &state->remote->trigger);
 
 			if (!is_blocking ||
 			    (wait_for_completion_interruptible(&state->slot_available_event)))
@@ -1124,7 +1124,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 	if (!(flags & QMFLAGS_NO_MUTEX_UNLOCK))
 		mutex_unlock(&state->slot_mutex);
 
-	remote_event_signal(&state->remote->trigger);
+	remote_event_signal(state, &state->remote->trigger);
 
 	return 0;
 }
@@ -1202,7 +1202,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 		&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
 		VCHIQ_MSG_DSTPORT(msgid), size);
 
-	remote_event_signal(&state->remote->sync_trigger);
+	remote_event_signal(state, &state->remote->sync_trigger);
 
 	if (VCHIQ_MSG_TYPE(msgid) != VCHIQ_MSG_PAUSE)
 		mutex_unlock(&state->sync_mutex);
@@ -1260,7 +1260,7 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 		 * A write barrier is necessary, but remote_event_signal
 		 * contains one.
 		 */
-		remote_event_signal(&state->remote->recycle);
+		remote_event_signal(state, &state->remote->recycle);
 	}
 
 	mutex_unlock(&state->recycle_mutex);
@@ -3240,7 +3240,7 @@ static void
 release_message_sync(struct vchiq_state *state, struct vchiq_header *header)
 {
 	header->msgid = VCHIQ_MSGID_PADDING;
-	remote_event_signal(&state->remote->sync_release);
+	remote_event_signal(state, &state->remote->sync_release);
 }
 
 int
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 5fbf173d9c56..8ca74b12427b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -516,7 +516,7 @@ int vchiq_prepare_bulk_data(struct vchiq_instance *instance, struct vchiq_bulk *
 
 void vchiq_complete_bulk(struct vchiq_instance *instance, struct vchiq_bulk *bulk);
 
-void remote_event_signal(struct remote_event *event);
+void remote_event_signal(struct vchiq_state *state, struct remote_event *event);
 
 void vchiq_dump_platform_state(struct seq_file *f);
 
-- 
2.44.0

