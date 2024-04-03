Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62546AD7
	for <linux-staging@lists.linux.dev>; Wed,  3 Apr 2024 05:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712121674; cv=none; b=RK+9mQCKS97CzL0/OuKmtwc4d5TBJx7qCcIwfaBPmG0aua+6a5nIsGs91LCdX4+TL3O2DheKqYrTOp+qM9l4AtaOIXHV1IOYYYgfLe4kgGGvBN7buCs4CFFKNj9UqG6g+yUT/BNhi3Yx+F3sPHdUXGrXUI6bhqEfcc4OoDqs4lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712121674; c=relaxed/simple;
	bh=46JcxjulV5/lM2GUs9gqnwPY0ol6w2JEAnKRSPxsID4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m4S+FLfiQDmFheaRNjjZePzHi10ogzzFjPc4bvxEBmHeSI5Jbv8kLCqm3Bj0xVZeTc1AHy0ES4Ez7VOTgQcBLGDFZO1Z5xgdEOuG4rhdUyQaoAT4DMySkwbo0LsVOYYmfpo01iji3H3DxFFI3iTicgczkPbu4KKEGm+wSVTOke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DZ/BiENP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DZ/BiENP"
Received: from umang.jain (unknown [103.86.18.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3ABB83A3;
	Wed,  3 Apr 2024 07:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712121632;
	bh=46JcxjulV5/lM2GUs9gqnwPY0ol6w2JEAnKRSPxsID4=;
	h=From:To:Cc:Subject:Date:From;
	b=DZ/BiENPoJK+TfxKEkVDFJmnGaMxHuuMyG5s2MIDsfYdEwtkV4NMY4QUNzKeZ49z4
	 5iBsTdlndgoChMhnqc2b3s+wGh5GWV0OMzEvhzZ4/0ddAUlaU4UGICfu+3w2O3JAsO
	 rEYah492hbyn5iJl6uAYb/vgREE/OtEKJZEoMTw8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Mark Brown <broonie@kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2] Revert "staging: vc04_services: vchiq_core: Stop kthreads on shutdown"
Date: Wed,  3 Apr 2024 10:51:00 +0530
Message-ID: <20240403052100.2794-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d9c60badccc183eb971e0941bb86f9475d4b9551.

It has been reported that stopping kthreads corrupts the VC04 firmware
and creates issues at boot time [1].

A fix-up version of this patch
bac670144384 ("staging: vc04_services: Stop kthreads on .remove") [2]
was also attempted but it also doesn't properly fix the TODO
(i.e. clean module unload) and similar errors were observed when
stopping these khthreads on RaspberryPi 3.

Hence, revert the entire patch for now since it is not very clear why
stopping the kthreads breaks the firmware.

[1]: https://lore.kernel.org/linux-staging/CAPY8ntBaz_RGr2sboQqbuUv+xZNfRct6-sckDLYPTig_HWyXEw@mail.gmail.com/t/#me90b9a9bc91599f18cd65ceb7eedd40e5fee0cdd

[2]: https://lore.kernel.org/linux-staging/171161507013.3072637.12125782507523919379@ping.linuxembedded.co.uk/T/#m1d3de7d2fa73b2447274858353bbd4a0c3a8ba14

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Changes in v2:
- Improve upon commit message
---
 drivers/staging/vc04_services/interface/TODO           |  7 +++++++
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  8 ++------
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++-------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 57a2d6761f9b..05eb5140d096 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -16,6 +16,13 @@ some of the ones we want:
   to manage these buffers as dmabufs so that we can zero-copy import
   camera images into vc4 for rendering/display.
 
+* Fix kernel module support
+
+Even the VPU firmware doesn't support a VCHI re-connect, the driver
+should properly handle a module unload. This also includes that all
+resources must be freed (kthreads, debugfs entries, ...) and global
+variables avoided.
+
 * Documentation
 
 A short top-down description of this driver's architecture (function of
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1d21f9cfbfe5..ad506016fc93 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -726,9 +726,8 @@ void free_bulk_waiter(struct vchiq_instance *instance)
 
 int vchiq_shutdown(struct vchiq_instance *instance)
 {
-	struct vchiq_state *state = instance->state;
-	struct vchiq_arm_state *arm_state;
 	int status = 0;
+	struct vchiq_state *state = instance->state;
 
 	if (mutex_lock_killable(&state->mutex))
 		return -EAGAIN;
@@ -740,9 +739,6 @@ int vchiq_shutdown(struct vchiq_instance *instance)
 
 	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
 
-	arm_state = vchiq_platform_get_arm_state(state);
-	kthread_stop(arm_state->ka_thread);
-
 	free_bulk_waiter(instance);
 	kfree(instance);
 
@@ -1314,7 +1310,7 @@ vchiq_keepalive_thread_func(void *v)
 		goto shutdown;
 	}
 
-	while (!kthread_should_stop()) {
+	while (1) {
 		long rc = 0, uc = 0;
 
 		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 953ccd87f425..76c27778154a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
 
 	DEBUG_INITIALISE(local);
 
-	while (!kthread_should_stop()) {
+	while (1) {
 		DEBUG_COUNT(SLOT_HANDLER_COUNT);
 		DEBUG_TRACE(SLOT_HANDLER_LINE);
 		remote_event_wait(&state->trigger_event, &local->trigger);
@@ -1978,7 +1978,7 @@ recycle_func(void *v)
 	if (!found)
 		return -ENOMEM;
 
-	while (!kthread_should_stop()) {
+	while (1) {
 		remote_event_wait(&state->recycle_event, &local->recycle);
 
 		process_free_queue(state, found, length);
@@ -1997,7 +1997,7 @@ sync_func(void *v)
 			state->remote->slot_sync);
 	int svc_fourcc;
 
-	while (!kthread_should_stop()) {
+	while (1) {
 		struct vchiq_service *service;
 		int msgid, size;
 		int type;
@@ -2844,10 +2844,6 @@ vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instan
 		(void)vchiq_remove_service(instance, service->handle);
 		vchiq_service_put(service);
 	}
-
-	kthread_stop(state->sync_thread);
-	kthread_stop(state->recycle_thread);
-	kthread_stop(state->slot_handler_thread);
 }
 
 int
-- 
2.43.0

