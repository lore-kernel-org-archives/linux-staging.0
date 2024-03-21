Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214FE83CAA
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711026495; cv=none; b=bBqkJ85OW2jWdv1N2II86Rrs/HvdlNVzHk8+zpXJll2pjpTsAFQcOi/tyEscUfUoQW1a8RrwN9XvtZ6X7sebfXMC9wMIZM6vjXTZBxtSMgjhP7/vpTySKEIvyfD/DIsffL9zmFCPajbLPWPR733idwHPY2bLciOvMNgYFvzm/FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711026495; c=relaxed/simple;
	bh=tMeR659OfKIrTXQYvk1oVmFiNKFxdQ6SxGJcRaynxZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcYIL4maSq2bzJhdKDj/v3q3w3A2jY51vsLc0SJu+3aasIYLktnZFRHj/bm7YYbX2EmrarqZNQa7bb0d9Pta6mjXHooJVkF04fhrbscUavZTpBG+T+wxQy6KcSKlg469JhStxlQSq6pgwm0rhckaz6UELSV24QR34FTHiz1Xtus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FYeWMw4N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FYeWMw4N"
Received: from umang.jain (unknown [103.86.18.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA48A7E9;
	Thu, 21 Mar 2024 14:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711026464;
	bh=tMeR659OfKIrTXQYvk1oVmFiNKFxdQ6SxGJcRaynxZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FYeWMw4NdU34pxWERS/RWUFowqOfVCxQB52wMBdPfAYkiPd+JZ3aSPopFRTbbYtUV
	 idijrJiS4scEB5aRoSHhKy9JSA3t7JsaBt6h1xO6Q7ceHA7RhMwvXOMUdiBotlf1m3
	 L9T9QzK1GjarTvby+tcnZeG7Wh+zwgvOy1obJcjQ=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 5/5] staging: vc04_services: vchiq_core: Stop kthreads on shutdown
Date: Thu, 21 Mar 2024 18:37:37 +0530
Message-ID: <20240321130737.898154-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321130737.898154-1-umang.jain@ideasonboard.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The various kthreads thread functions (slot_handler_func, sync_func,
recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
vchiq_arm should be stopped on vchiq_shutdown().

This also address the following TODO item:
 * Fix kernel module support

hence drop it from the TODO item list.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO           |  7 -------
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  8 ++++++--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++++---
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 05eb5140d096..57a2d6761f9b 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -16,13 +16,6 @@ some of the ones we want:
   to manage these buffers as dmabufs so that we can zero-copy import
   camera images into vc4 for rendering/display.
 
-* Fix kernel module support
-
-Even the VPU firmware doesn't support a VCHI re-connect, the driver
-should properly handle a module unload. This also includes that all
-resources must be freed (kthreads, debugfs entries, ...) and global
-variables avoided.
-
 * Documentation
 
 A short top-down description of this driver's architecture (function of
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index ad506016fc93..1d21f9cfbfe5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -726,8 +726,9 @@ void free_bulk_waiter(struct vchiq_instance *instance)
 
 int vchiq_shutdown(struct vchiq_instance *instance)
 {
-	int status = 0;
 	struct vchiq_state *state = instance->state;
+	struct vchiq_arm_state *arm_state;
+	int status = 0;
 
 	if (mutex_lock_killable(&state->mutex))
 		return -EAGAIN;
@@ -739,6 +740,9 @@ int vchiq_shutdown(struct vchiq_instance *instance)
 
 	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
 
+	arm_state = vchiq_platform_get_arm_state(state);
+	kthread_stop(arm_state->ka_thread);
+
 	free_bulk_waiter(instance);
 	kfree(instance);
 
@@ -1310,7 +1314,7 @@ vchiq_keepalive_thread_func(void *v)
 		goto shutdown;
 	}
 
-	while (1) {
+	while (!kthread_should_stop()) {
 		long rc = 0, uc = 0;
 
 		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 76c27778154a..953ccd87f425 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
 
 	DEBUG_INITIALISE(local);
 
-	while (1) {
+	while (!kthread_should_stop()) {
 		DEBUG_COUNT(SLOT_HANDLER_COUNT);
 		DEBUG_TRACE(SLOT_HANDLER_LINE);
 		remote_event_wait(&state->trigger_event, &local->trigger);
@@ -1978,7 +1978,7 @@ recycle_func(void *v)
 	if (!found)
 		return -ENOMEM;
 
-	while (1) {
+	while (!kthread_should_stop()) {
 		remote_event_wait(&state->recycle_event, &local->recycle);
 
 		process_free_queue(state, found, length);
@@ -1997,7 +1997,7 @@ sync_func(void *v)
 			state->remote->slot_sync);
 	int svc_fourcc;
 
-	while (1) {
+	while (!kthread_should_stop()) {
 		struct vchiq_service *service;
 		int msgid, size;
 		int type;
@@ -2844,6 +2844,10 @@ vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instan
 		(void)vchiq_remove_service(instance, service->handle);
 		vchiq_service_put(service);
 	}
+
+	kthread_stop(state->sync_thread);
+	kthread_stop(state->recycle_thread);
+	kthread_stop(state->slot_handler_thread);
 }
 
 int
-- 
2.43.0

