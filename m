Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C9D518
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667830729; x=1699366729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UdHr9EPfk2rI3xfTinW5/BgZpjVmDpj9RNJNkwC8ntc=;
  b=QqHparrerDLu6dSvBsl5uoB49zWKPtw+oAU+EAbwcolgDGwKksBTyrTF
   gG8yKeb/Td76kknnj21f5yE+Cj78N8lfTnnmG7Pq2Wn42rP0DQ2YSE6g1
   3lYrTq5iQjT2ZzAm8qV7RtQxImMNBx9hHUUGR3w9g5tZVTan8Zzl9z0D1
   UBC5rjpqi62Ks0X/Y+7DLa01Uc3Ohr2g86bUBumUkYcq18Sx3NJaSYkeC
   NrNBcr1wrqkkOWZ4gNoopdgJNMhJoiOx0FBFYXpK1/C2kb7teRjyLGdXd
   AWPMYYYuMIomt0QQVEuBCZo+l3NWsf9U5OEdeZcgtPo8hWTjlnX1O6M4I
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="182276996"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Nov 2022 07:18:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 7 Nov 2022 07:18:30 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 7 Nov 2022 07:18:28 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <jacopo@jmondi.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
	Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v12 1/6] media: atmel: move microchip_csi2dc to dedicated microchip platform
Date: Mon, 7 Nov 2022 16:18:13 +0200
Message-ID: <20221107141818.104937-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107141818.104937-1-eugen.hristev@microchip.com>
References: <20221107141818.104937-1-eugen.hristev@microchip.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The Atmel ISC will be moved to staging thus the atmel platform will only
have the ISI driver.
The new media-controller converted ISC driver will be placed inside a
dedicated microchip platform directory.
It is then natural to have the microchip-csi2dc moved to this new platform
directory.
The next step is to add the Microchip ISC driver to the new platform
directory and reside together with the Microchip CSI2DC driver.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS                                   |  2 +-
 drivers/media/platform/Kconfig                |  1 +
 drivers/media/platform/Makefile               |  1 +
 drivers/media/platform/atmel/Kconfig          | 15 ---------------
 drivers/media/platform/atmel/Makefile         |  1 -
 drivers/media/platform/microchip/Kconfig      | 19 +++++++++++++++++++
 drivers/media/platform/microchip/Makefile     |  3 +++
 .../{atmel => microchip}/microchip-csi2dc.c   |  0
 8 files changed, 25 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/platform/microchip/Kconfig
 create mode 100644 drivers/media/platform/microchip/Makefile
 rename drivers/media/platform/{atmel => microchip}/microchip-csi2dc.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 307775bfbf99..2991dfd61d9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13461,7 +13461,7 @@ M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
-F:	drivers/media/platform/atmel/microchip-csi2dc.c
+F:	drivers/media/platform/microchip/microchip-csi2dc.c
 
 MICROCHIP ECC DRIVER
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 87c05acebb83..bc8969d20167 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -73,6 +73,7 @@ source "drivers/media/platform/dwc/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell/Kconfig"
 source "drivers/media/platform/mediatek/Kconfig"
+source "drivers/media/platform/microchip/Kconfig"
 source "drivers/media/platform/nvidia/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
 source "drivers/media/platform/qcom/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 533a18d61f5f..d5c5e02f7855 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -16,6 +16,7 @@ obj-y += dwc/
 obj-y += intel/
 obj-y += marvell/
 obj-y += mediatek/
+obj-y += microchip/
 obj-y += nvidia/
 obj-y += nxp/
 obj-y += qcom/
diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index f399dba62e17..6d07a31d4c0e 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -49,18 +49,3 @@ config VIDEO_ATMEL_ISI
 	  This module makes the ATMEL Image Sensor Interface available
 	  as a v4l2 device.
 
-config VIDEO_MICROCHIP_CSI2DC
-	tristate "Microchip CSI2 Demux Controller"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && COMMON_CLK && OF
-	depends on ARCH_AT91 || COMPILE_TEST
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
-	help
-	  CSI2 Demux Controller driver. CSI2DC is a helper chip
-	  that converts IDI interface byte stream to a parallel pixel stream.
-	  It supports various RAW formats as input.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called microchip-csi2dc.
diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index 794e8f739287..ab3890f95776 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -7,4 +7,3 @@ obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-common.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
 obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
-obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip-csi2dc.o
diff --git a/drivers/media/platform/microchip/Kconfig b/drivers/media/platform/microchip/Kconfig
new file mode 100644
index 000000000000..aa9e902f41f0
--- /dev/null
+++ b/drivers/media/platform/microchip/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+comment "Microchip Technology, Inc. media platform drivers"
+
+config VIDEO_MICROCHIP_CSI2DC
+	tristate "Microchip CSI2 Demux Controller"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && COMMON_CLK && OF
+	depends on ARCH_AT91 || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  CSI2 Demux Controller driver. CSI2DC is a helper chip
+	  that converts IDI interface byte stream to a parallel pixel stream.
+	  It supports various RAW formats as input.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called microchip-csi2dc.
diff --git a/drivers/media/platform/microchip/Makefile b/drivers/media/platform/microchip/Makefile
new file mode 100644
index 000000000000..cbcde4a73117
--- /dev/null
+++ b/drivers/media/platform/microchip/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip-csi2dc.o
diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
similarity index 100%
rename from drivers/media/platform/atmel/microchip-csi2dc.c
rename to drivers/media/platform/microchip/microchip-csi2dc.c
-- 
2.25.1

