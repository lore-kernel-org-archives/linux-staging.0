Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB69E4316C
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410789; cv=none; b=B9plWKDIWobtPZkFYUzGqgw6OD2lu6BUlb7rm3aRQX/Bt1+CeBVtCSx3Ffdx/lvF33lMkQxz/kt8uN7o/bnz8INXkyhC8JGJEuYvsSRrKZOBRIvLbUTn0gCPSdpDZ9wjQW2H5v/cJJv5iAKsQLPIxzZQ1JVi+ooFq+Jp7WIKk8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410789; c=relaxed/simple;
	bh=83O1zFYKfxBnunZMBh3mPle7r8qz2eEZrTC2M5fHtI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxB+lKXrbwx14T9yZ19fre0kAF9aZUEYnKu+slpZK3uJ6fhYjPelG+ifkEtOnFF0Fv8erdL+f37598OGD9h9W8/N3zbucK26CkLxsNcOqx0T2pOG7gIBVXWC1VY7fxFPrFfGvmOYALSdb6AYG9BJVvp+HMbejbaG5qyQspvl/l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HPznrVQx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HPznrVQx"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2D076BE;
	Thu, 14 Mar 2024 11:05:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710410763;
	bh=83O1zFYKfxBnunZMBh3mPle7r8qz2eEZrTC2M5fHtI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HPznrVQxSTcrILc74gNN9W0MeG/SGakadsFQ5OA3OVivDLdM9/OUjsxMLwvqRtKyD
	 3j0SNkkxhoy2ug/yQpsn6uPjBGpIT0YocPPCyMSrujsy0acYxyS/Z9yrMi3Ck78NX2
	 oGy6GjYRxq9jwkv7ZK+90np9/VAgeHhsdYbr2r0U=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 2/6] staging: vc04_services: vchiq_arm: Move struct vchiq_drvdata to header
Date: Thu, 14 Mar 2024 15:36:03 +0530
Message-ID: <20240314100607.336009-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314100607.336009-1-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vchiq_drvdata structure will be extended in subsequent patches,
to track the vchiq connections (currently tracked by global members).
to the vchiq platform driver. Hence, prepare the struct vchiq_drvdata
by moving it to vchiq_arm.h, so it can be shared across.

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 6 ------
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 1579bd4e5263..52569517ba4e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -29,7 +29,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
-#include <soc/bcm2835/raspberrypi-firmware.h>
 
 #include "vchiq_core.h"
 #include "vchiq_ioctl.h"
@@ -71,11 +70,6 @@ struct vchiq_state g_state;
 static struct vchiq_device *bcm2835_audio;
 static struct vchiq_device *bcm2835_camera;
 
-struct vchiq_drvdata {
-	const unsigned int cache_line_size;
-	struct rpi_firmware *fw;
-};
-
 static struct vchiq_drvdata bcm2835_drvdata = {
 	.cache_line_size = 32,
 };
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index 7844ef765a00..7fef05e7389c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -11,6 +11,9 @@
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/atomic.h>
+
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
 #include "vchiq_core.h"
 #include "vchiq_debugfs.h"
 
@@ -25,6 +28,11 @@ enum USE_TYPE_E {
 	USE_TYPE_VCHIQ
 };
 
+struct vchiq_drvdata {
+	const unsigned int cache_line_size;
+	struct rpi_firmware *fw;
+};
+
 struct user_service {
 	struct vchiq_service *service;
 	void __user *userdata;
-- 
2.43.0

