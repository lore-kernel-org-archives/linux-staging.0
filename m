Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4F63B7
	for <linux-staging@lists.linux.dev>; Tue, 27 Jun 2023 20:16:46 +0000 (UTC)
Received: from umang.jainideasonboard.com (85-160-38-115.reb.o2.cz [85.160.38.115])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 765F22C1E;
	Tue, 27 Jun 2023 22:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1687896956;
	bh=h1HbFuL1coODwZNUdPdZyZjoMMWonPwJDJRxIgNIO9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i8iqgiRN4u9l00ZAeq0b5EYY+2KAN7bWs/hUbX2+6Pnqbsi1/u2/h9R7hVRvPPkx7
	 aPiSBoVxm7JPYIp7A/PQ1iNEiYPL8VlAHPVgqlEJxGU5ejWG8uuFKmPGxsbnawchv+
	 pEXsjH6ARfukV2TXKznx0k1phIIABvDXXIDuwGUM=
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
	dave.stevenson@raspberrypi.com,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v8 2/5] staging: vc04_services: vchiq_arm: Register vchiq_bus_type
Date: Tue, 27 Jun 2023 22:16:25 +0200
Message-Id: <20230627201628.207483-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230627201628.207483-1-umang.jain@ideasonboard.com>
References: <20230627201628.207483-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the vchiq_bus_type bus with the vchiq interface.
The bcm2835-camera nad bcm2835_audio will be registered to this bus type
going ahead.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index aa2313f3bcab..e8d40f891449 100644
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
 
@@ -1870,6 +1872,12 @@ static int __init vchiq_driver_init(void)
 {
 	int ret;
 
+	ret = bus_register(&vchiq_bus_type);
+	if (ret) {
+		pr_err("Failed to register %s\n", vchiq_bus_type.name);
+		return ret;
+	}
+
 	ret = platform_driver_register(&vchiq_driver);
 	if (ret)
 		pr_err("Failed to register vchiq driver\n");
@@ -1880,6 +1888,7 @@ module_init(vchiq_driver_init);
 
 static void __exit vchiq_driver_exit(void)
 {
+	bus_unregister(&vchiq_bus_type);
 	platform_driver_unregister(&vchiq_driver);
 }
 module_exit(vchiq_driver_exit);
-- 
2.39.1

