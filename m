Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F69558235
	for <linux-staging@lists.linux.dev>; Mon, 11 Mar 2024 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710198981; cv=none; b=kRcz8HNvlGGTqWtulWYN0fmiMfuCEIiHNkF4jXf4Qo/pdrn6e1/s+HRJ3BFMK27N4KS5JC/U+OQPAEXaTkeFyPGE/gQFaeQFdHC9unFscehWzpFsp6cfjvJhL3Ze449SZEGlj/aNCwpMNFZonYA8r3tU9RkbWq/HyB+HphF5pp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710198981; c=relaxed/simple;
	bh=9qw0CyDP4Cf/nkfnfaAD/IjHt+B3D4AzKmWG94ghSWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzUGsBHENtejx+WYtdJrSz02B/76NAQp2IJflUi5UJorJ6wH67FFMC6oo2hmEAeQm5YDEEfWgbyfda4IdVqhYJ1h7OZjEmXwYSfgph7obZSTNXSb60+m1GRwKWxcoz+L4Bt7G/jPP6Ca+rkJt2flKQlKtdc9ESHPc93xYhnQvUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N9arz/4n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N9arz/4n"
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17A15F8B;
	Tue, 12 Mar 2024 00:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710198956;
	bh=9qw0CyDP4Cf/nkfnfaAD/IjHt+B3D4AzKmWG94ghSWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N9arz/4nkq8oRWa1qAYPqEwMLpKDP4xtIufY4OThOTuijipa+33/aVK+JY9K/DEs2
	 sVlSkerauBqQbo73NLD/AwnAiNLZEFLp6VWV5lXAoJOnhWNPbVVpxr/93pewuO48kI
	 bBsAU7Po7l6kmga+0vOaSVKDDoOEEXjXf/Po21Dw=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/3] staging: vc04_services: Move struct vchiq_drvdata to vchiq_core header
Date: Tue, 12 Mar 2024 04:46:05 +0530
Message-ID: <20240311231607.124491-2-umang.jain@ideasonboard.com>
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

The vchiq_drvdata structure will be extended in subsequent patches,
to track the vchiq connections (currently tracked by global members).
to the vchiq platform driver. Hence, prepare the struct vchiq_drvdata
by moving it vchiq_core.h header, so it can be shared across.

No functional changes intended in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 6 ------
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

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
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index c8527551b58c..331959a91102 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -13,6 +13,8 @@
 #include <linux/rcupdate.h>
 #include <linux/wait.h>
 
+#include <soc/bcm2835/raspberrypi-firmware.h>
+
 #include "../../include/linux/raspberrypi/vchiq.h"
 #include "vchiq_cfg.h"
 
@@ -424,6 +426,11 @@ struct vchiq_config {
 	short version_min;  /* The minimum compatible version of VCHIQ */
 };
 
+struct vchiq_drvdata {
+	const unsigned int cache_line_size;
+	struct rpi_firmware *fw;
+};
+
 extern spinlock_t bulk_waiter_spinlock;
 
 extern const char *
-- 
2.43.0

