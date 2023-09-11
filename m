Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B21170E
	for <linux-staging@lists.linux.dev>; Mon, 11 Sep 2023 14:07:33 +0000 (UTC)
Received: from www.ideasonboard.com (unknown [103.238.109.17])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7240B1ACE;
	Mon, 11 Sep 2023 16:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1694441161;
	bh=XVYefCQU5WcDc2NaRLs9eMQLGiBQNdAD68wR5L9l9h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cJYuf1s0KRyevFYsJfAYQ3aRxqT3moxVoEZD6kcdg7DCsV+M4eZTMGEIdY17BVS6X
	 G4jfsACMN/bl6I7sgidtCJnpmwDB3O4J4AdG5Ide4Er7YxvG8HldPnLkvyE3DN2RdK
	 Gi7V9lJ0ksyBjS31UWD+06wqWLpVuVO7JriPW/aU=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stefan.wahren@i2se.com,
	gregkh@linuxfoundation.org,
	f.fainelli@gmail.com,
	athierry@redhat.com,
	error27@gmail.com,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v10 2/5] staging: vc04_services: vchiq_arm: Register vchiq_bus_type
Date: Mon, 11 Sep 2023 10:07:09 -0400
Message-ID: <20230911140712.180751-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911140712.180751-1-umang.jain@ideasonboard.com>
References: <20230911140712.180751-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the vchiq_bus_type bus with the vchiq interface.
The bcm2835-camera and bcm2835_audio will be registered to this bus type
going ahead.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c   | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index aa2313f3bcab..d993a91de237 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -12,6 +12,7 @@
 #include <linux/cdev.h>
 #include <linux/fs.h>
 #include <linux/device.h>
+#include <linux/device/bus.h>
 #include <linux/mm.h>
 #include <linux/highmem.h>
 #include <linux/pagemap.h>
@@ -34,6 +35,7 @@
 #include "vchiq_ioctl.h"
 #include "vchiq_arm.h"
 #include "vchiq_debugfs.h"
+#include "vchiq_device.h"
 #include "vchiq_connected.h"
 #include "vchiq_pagelist.h"
 
@@ -1870,9 +1872,17 @@ static int __init vchiq_driver_init(void)
 {
 	int ret;
 
+	ret = bus_register(&vchiq_bus_type);
+	if (ret) {
+		pr_err("Failed to register %s\n", vchiq_bus_type.name);
+		return ret;
+	}
+
 	ret = platform_driver_register(&vchiq_driver);
-	if (ret)
+	if (ret) {
 		pr_err("Failed to register vchiq driver\n");
+		bus_unregister(&vchiq_bus_type);
+	}
 
 	return ret;
 }
@@ -1880,6 +1890,7 @@ module_init(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
+	bus_unregister(&vchiq_bus_type);
 	platform_driver_unregister(&vchiq_driver);
 }
 module_exit(vchiq_driver_exit);
-- 
2.41.0

