Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B46FC2
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 11:55:42 +0000 (UTC)
Received: from ideasonboard.com (unknown [IPv6:2401:4900:1c80:b229:a6c1:a673:925f:1ed6])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11FBF904;
	Thu, 19 Jan 2023 12:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674129341;
	bh=5uZPDNBAVgla1XWWQJSwoTOJpmT0TnxJ5fUoIq0dTDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mBvtK0NshbuMl/lObkeUD/duaD/IZ5CQ/hEq2A1kaF/MtaOGNgTLQeCtZEr03r3rx
	 L1Qz4/mIFgEQ4J1P4MENXMMKLLgGXyCzexMKa35vlBi/zdhYIXzLzpy6uB91g1fk5z
	 KapZHxMZUR+J8gwsuhLsvVLAczz1O7Oh8eMHlVzs=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v5 3/6] staging: vc04_services: bcm2835-camera: Drop include Makefile directive
Date: Thu, 19 Jan 2023 17:25:00 +0530
Message-Id: <20230119115503.268693-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119115503.268693-1-umang.jain@ideasonboard.com>
References: <20230119115503.268693-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the include directive they can break the build one only wants to
build a subdirectory. Replace with "../" for the includes, in the
bcm2835-camera files instead.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/bcm2835-camera/Makefile  |  4 ----
 .../vc04_services/bcm2835-camera/bcm2835-camera.c      | 10 +++++-----
 .../staging/vc04_services/bcm2835-camera/controls.c    |  6 +++---
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/Makefile b/drivers/staging/vc04_services/bcm2835-camera/Makefile
index 3494c82b271a..203b93899b20 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/Makefile
+++ b/drivers/staging/vc04_services/bcm2835-camera/Makefile
@@ -4,7 +4,3 @@ bcm2835-v4l2-$(CONFIG_VIDEO_BCM2835) := \
 	controls.o
 
 obj-$(CONFIG_VIDEO_BCM2835) += bcm2835-v4l2.o
-
-ccflags-y += \
-	-I $(srctree)/$(src)/.. \
-	-I $(srctree)/$(src)/../vchiq-mmal/
diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 797ebe2a973a..4f81765912ea 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -26,11 +26,11 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 
-#include "mmal-common.h"
-#include "mmal-encodings.h"
-#include "mmal-vchiq.h"
-#include "mmal-msg.h"
-#include "mmal-parameters.h"
+#include "../vchiq-mmal/mmal-common.h"
+#include "../vchiq-mmal/mmal-encodings.h"
+#include "../vchiq-mmal/mmal-vchiq.h"
+#include "../vchiq-mmal/mmal-msg.h"
+#include "../vchiq-mmal/mmal-parameters.h"
 #include "bcm2835-camera.h"
 
 #define MIN_WIDTH 32
diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 5644d1d457b9..6bce45925bf1 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -23,9 +23,9 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-common.h>
 
-#include "mmal-common.h"
-#include "mmal-vchiq.h"
-#include "mmal-parameters.h"
+#include "../vchiq-mmal/mmal-common.h"
+#include "../vchiq-mmal/mmal-vchiq.h"
+#include "../vchiq-mmal/mmal-parameters.h"
 #include "bcm2835-camera.h"
 
 /* The supported V4L2_CID_AUTO_EXPOSURE_BIAS values are from -4.0 to +4.0.
-- 
2.38.1

