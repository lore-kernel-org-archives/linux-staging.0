Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ECE335D8
	for <linux-staging@lists.linux.dev>; Sat, 30 Mar 2024 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711814692; cv=none; b=ZzytdhFPUy+4dkMLV9Vmpzf+2y+9mgOsdmFNxYp81KEizlf6REjyvMPUvvLbTi+HtYJau+aiVVmlaez2Qw7UTfx/AIb5wrNH051D9ZEIwzxWhafZ1/gokeLyQwPFzjDa8Jyxh5/Bp2BMDKC3pgGXzOdxSe1ghI8F6e+YZR34BeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711814692; c=relaxed/simple;
	bh=7m4XidJ+5SqB5zHIhv/3qY3CpYgQIS7NroxRDgU6zrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKvRlmO6AwT4c8w27GlXV2dqygGzCGW8qIfXBMUp8UQc30xhr7C1yQVfp/pvvnrezvbUM5Zf+PCgURtr2xGME4FOqb+HFGuvp/ZI0x6249Gna/YmxdRx0ntAwZ4EkjcyaaERcNf25hdq0RH3uWryRzFDa75rjpdFsq3rCYTJH3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=riLXA3tE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="riLXA3tE"
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B01F7C80;
	Sat, 30 Mar 2024 17:04:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711814653;
	bh=7m4XidJ+5SqB5zHIhv/3qY3CpYgQIS7NroxRDgU6zrY=;
	h=From:To:Cc:Subject:Date:From;
	b=riLXA3tESegnHFTehr+TfzAed4/ZhkkYYsUoklPfAOnKTH+0ftVVkoh15ZigMwTcu
	 it7YOTuwblxNrH5K/IVA0WMsY/l7P5O/S0ddWlO8xf2KVB23g270PN/SUKeg0QbJLi
	 3fJ0EepJ/4Bj575QiDXPRqlH0WyDNy71g3I3PWqA=
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
Subject: [PATCH] Revert "staging: vc04_services: vchiq_core: Stop kthreads on shutdown"
Date: Sat, 30 Mar 2024 21:34:40 +0530
Message-ID: <20240330160440.49179-1-umang.jain@ideasonboard.com>
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
and creates issues at boot time.

A fix-up version of this patch [2] was also attempted but it also doesn't
properly fix the TODO (i.e. clean module unload) and similar errors
were observed when stopping these khthreads on RaspberryPi 3.

Hence, revert the entire patch for now since it is not very clear why
stopping the kthreads breaks the firmware.

[1]: https://lore.kernel.org/linux-staging/CAPY8ntBaz_RGr2sboQqbuUv+xZNfRct6-sckDLYPTig_HWyXEw@mail.gmail.com/t/#me90b9a9bc91599f18cd65ceb7eedd40e5fee0cdd

[2]: https://lore.kernel.org/linux-staging/171161507013.3072637.12125782507523919379@ping.linuxembedded.co.uk/T/#m1d3de7d2fa73b2447274858353bbd4a0c3a8ba14

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
Please ignore the previous email patch, so the staging-list email ID had
a typo.
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

