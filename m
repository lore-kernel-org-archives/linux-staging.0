Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9702BAE7
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 05:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711602988; cv=none; b=BLGzcY/k3tjtCxEUZtnRMZKjFDJCFNFL77XLdnNIscQDEuqTFxSqX+rNEdDiT//fOn8pzavO5Ue6fYW4zzwz1SDf1XpVu6y3cFXJlc4k9B3pW0KjPD1wcHoxn41fxngJUctV8o3gfHaGbrtOlOClbK8sOdiVYGla6lCHaMtgMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711602988; c=relaxed/simple;
	bh=CKdMF9yOhqrNjIorTPIe+YuMjFqC7BA8CHDZpx2Eaas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLjK/DvB/KHsg+hJTqZ9vfCYWvG/ERqlUepoftSVZ2nvYfkhGnC24ShmsiOXJ7qTybQNCntCGpU/ck2qoD0DFJpNKDy7SsW6gcv6azMWbH0cYWkA/sanM9V7BzFt8FIK5xIPl20OVLVjuT+uoQilx0T2laPts4/Ss64IHqIupZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rl4XKZxm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rl4XKZxm"
Received: from fedora.local (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBDD3D20;
	Thu, 28 Mar 2024 06:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711602951;
	bh=CKdMF9yOhqrNjIorTPIe+YuMjFqC7BA8CHDZpx2Eaas=;
	h=From:To:Cc:Subject:Date:From;
	b=rl4XKZxm7arWvonm5UH9+YB2WEelM2BzWY0IILmLAi07ESS0+KT3etDK66fZIJJTg
	 dD7hjsTz74DhPcdTstgNgd1VgJUk6hTb3Ztn6dn0sazSjTXAE81f2v7OKKjjCoSvkC
	 uUz4y6q6zNSkK+ZhhqMLvx6aaU0eBJlLR+dUKQ6k=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Greg KH <greg@kroah.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] staging: vc04_services: Stop kthreads on .remove
Date: Thu, 28 Mar 2024 10:46:15 +0530
Message-ID: <20240328051615.618908-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that stopping kthreads on vchiq_shutdown_internal()
corrupts the vchiq firmware during probe.

[   11.005324] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf unexpected msgid 0@b18db30a,0

Since the kthreads are created during vchiq_probe(), symmetrically
they should be stopped on vchiq_remove().

Also, vchiq_shutdown_internal() is called by vchiq_shutdown() which
is a exported function. Hence, modules can take indirectly shut the
vchiq interface by stopping the kthreads.

Fix it by stopping the kthreads in .remove instead.

Fixes: d9c60badccc1 ("staging: vc04_services: vchiq_core: Stop kthreads on shutdown")
Reported-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---

Reproduced on rpi-3-b 32-bit kernel with multi_v7_defconfig and all
vchiq configs options. Patch seems to fix the error mentioned in the
commit message.

---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++++++
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1d21f9cfbfe5..9af77d17a1e8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1771,10 +1771,16 @@ static int vchiq_probe(struct platform_device *pdev)
 
 static void vchiq_remove(struct platform_device *pdev)
 {
+	struct vchiq_state *state = vchiq_get_state();
+
 	vchiq_device_unregister(bcm2835_audio);
 	vchiq_device_unregister(bcm2835_camera);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
+
+	kthread_stop(state->sync_thread);
+	kthread_stop(state->recycle_thread);
+	kthread_stop(state->slot_handler_thread);
 }
 
 static struct platform_driver vchiq_driver = {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 953ccd87f425..658d19f1e7e8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
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

