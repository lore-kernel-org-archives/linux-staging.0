Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FAF58235
	for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710198983; cv=none; b=QoczuCEAyAObSdg6R9JHUuJzCAGx+x6lK4WW69hJMvZ9C4z2pQiPvvMTeTHXyNPXeB6n9cIVThrR6in0oqixaGVBXUr9lCSrr+us1CQGGFuF1yaR+SWtJXiACvaXOlb5xrfHdyNuW4bh/VOXE3/G1NVl6usacGPgCoRvTf0ZfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710198983; c=relaxed/simple;
	bh=xHIfD81yVB4B5Qt9H7PKJlfJSLs9raYVZ/AyxWEwL68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFNoUVkk/sTyG4bby0NMDXkG8m2helIYv8pB51yshOXZ0UYDbHzIJ845H15y59/4lz13jdwZGDcng9UAemNFeF9K7G8vu5ItXUdH0F7dx3yTZEAHhPU7AiQ6AiSoo9Wh+kc75aiRJeAHYeVhnc5ODwrWLcxgdpFXKZb0H/PsQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wBsX4QYF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wBsX4QYF"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 798D913AC;
	Tue, 12 Mar 2024 00:15:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710198958;
	bh=xHIfD81yVB4B5Qt9H7PKJlfJSLs9raYVZ/AyxWEwL68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wBsX4QYFFB5v4ZnUKN3+rphHcNNqYXsT9fVkACMj008co/drRRnddvQJ0YzD0B5mQ
	 NYLC31TAyV3ripbVevHiul0Hl8MPrSPXKEhSuwOpba8wK1w4ZDTdzZuUOUa1aOyFrt
	 71VH6WArXeQ+HZSQ3RtH0BEpuiUm/x5zbDiFoilk=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/3] staging: v04_services: Add connection structure to driver data
Date: Tue, 12 Mar 2024 04:46:06 +0530
Message-ID: <20240311231607.124491-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311231607.124491-1-umang.jain@ideasonboard.com>
References: <20240311231607.124491-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new struct vchiq_connected, responsible to track
the connections to the vchiq platform driver. The struct is added
as part of vchiq platform driver data.

Adding struct vchiq_connected will help us to move away from global
variables members being used to track the connections in
vchiq_connected.[ch]. This will be done in a subsequent patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c      | 10 ++++++++++
 .../interface/vchiq_arm/vchiq_connected.h              | 10 ++++++++++
 .../vc04_services/interface/vchiq_arm/vchiq_core.h     |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 52569517ba4e..b8b51267bcde 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -72,10 +72,20 @@ static struct vchiq_device *bcm2835_camera;
 
 static struct vchiq_drvdata bcm2835_drvdata = {
 	.cache_line_size = 32,
+	.drv_connected = {
+		.connected = 0,
+		.num_deferred_callbacks = 0,
+		.once_init = 0,
+	},
 };
 
 static struct vchiq_drvdata bcm2836_drvdata = {
 	.cache_line_size = 64,
+	.drv_connected = {
+		.connected = 0,
+		.num_deferred_callbacks = 0,
+		.once_init = 0,
+	},
 };
 
 struct vchiq_arm_state {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
index e4ed56446f8a..cb5cba94dd54 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
@@ -6,6 +6,16 @@
 #ifndef VCHIQ_CONNECTED_H
 #define VCHIQ_CONNECTED_H
 
+#define  VCHIQ_DRV_MAX_CALLBACKS  10
+
+struct vchiq_connected {
+	int connected;
+	int num_deferred_callbacks;
+	int once_init;
+
+	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
+};
+
 void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void));
 void vchiq_call_connected_callbacks(void);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 331959a91102..e36a8cd8533a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -17,6 +17,7 @@
 
 #include "../../include/linux/raspberrypi/vchiq.h"
 #include "vchiq_cfg.h"
+#include "vchiq_connected.h"
 
 /* Do this so that we can test-build the code on non-rpi systems */
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
@@ -429,6 +430,7 @@ struct vchiq_config {
 struct vchiq_drvdata {
 	const unsigned int cache_line_size;
 	struct rpi_firmware *fw;
+	struct vchiq_connected drv_connected;
 };
 
 extern spinlock_t bulk_waiter_spinlock;
-- 
2.43.0

