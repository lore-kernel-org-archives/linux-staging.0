Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBDF5CB2
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:46:47 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id y24so2669801lfg.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f47GckzJrLFQe11M6QHCWPz/yNiHT2zaHt2FLCF5JV8=;
        b=SrhKPbOfquVqB/u1GrI0dDo8oMv9TtwvV7shSghQ7WqQ50IIAm7MPtYYU/yTaRVUKN
         no8T/QZVDvHwLnBgf7AGC3Mtar5803bBxuUhdWYE3KYwniY6lmFd+Nc0L9ulQ6fsDGAs
         cUFluk79a4QyWMDhCS21GiYu/zSpXySuHPdGoaufSAtuAv8d6HxQDx6g+PypBGIlvpP5
         /If9NDft/5q+WQDkgZf13HBrCBBBlyp/f7PljMn3+xZi+iDUTASxgkhkHaghOMrGe4HA
         YIMxioW20IZCVACNa+QYC/6Pzc0TRGH7Y8HJTWC9F3oTA0pSwClXtozjyNstHhOKR70R
         DCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f47GckzJrLFQe11M6QHCWPz/yNiHT2zaHt2FLCF5JV8=;
        b=sU5rHSLK9gcp7flvs/evZJbA0Xfat103mNkK8VXbOPWVSBWMg7PSjiI94+q/bnQvxE
         vpZ471vln5UofaevUY0kElF8yx68Hsa2ZgT9qsO0qmzAljLhsgftt1C7Jo+hElQtWu2p
         DYkOhzI2BeTYsvKvp93WEUeNs2efgZnDqiEP6heV+gdlsXnp0i0bmJXg2N2GpM7BuPxb
         1DobB7PDRPT74O3ybYL142a++ss+fv4ZWY4lpbzfYUxGIUnn+eMLGoD+AUriy2Z4y9ju
         DJ+AL+Z49gZnAm3VdAWk/mBJ+GCFHJhwueZEe0giF99rz5JfqpYkml5PZQtzAGYWjntp
         WjXA==
X-Gm-Message-State: AOAM530fDAkabX1d1wGmM3xU/UJnwLKF2eSncrdXTz8yKolTponbZFJC
	S9EiqFxT5gUwJEZTcW78gVA=
X-Google-Smtp-Source: ABdhPJyQvCd7dJ+EMyZ0e5gTNmxMxKdAkCDH3rBqzRe8b/NrF/R1m2C19OlEJ526iwaVyhgEIfcNKg==
X-Received: by 2002:ac2:51d0:0:b0:43a:df78:18c with SMTP id u16-20020ac251d0000000b0043adf78018cmr11996542lfm.168.1645390005614;
        Sun, 20 Feb 2022 12:46:45 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id o14sm913955lfo.117.2022.02.20.12.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:46:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/8] media: staging: tegra-vde: De-stage driver
Date: Sun, 20 Feb 2022 23:46:21 +0300
Message-Id: <20220220204623.30107-7-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220204623.30107-1-digetx@gmail.com>
References: <20220220204623.30107-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO of tegra-vde driver has been completed, driver now supports
V4L2 stateless video decoding API. Relocate driver to drivers/media.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 MAINTAINERS                                     |  2 +-
 drivers/media/platform/Kconfig                  | 17 +++++++++++++++++
 drivers/media/platform/Makefile                 |  2 ++
 .../platform/tegra/vde}/Makefile                |  2 +-
 .../platform/tegra/vde}/dmabuf-cache.c          |  0
 .../platform/tegra/vde}/h264.c                  |  0
 .../platform/tegra/vde}/iommu.c                 |  0
 .../platform/tegra/vde}/trace.h                 |  2 +-
 .../platform/tegra/vde}/v4l2.c                  |  0
 .../platform/tegra/vde}/vde.c                   |  0
 .../platform/tegra/vde}/vde.h                   |  0
 drivers/staging/media/Kconfig                   |  2 --
 drivers/staging/media/Makefile                  |  1 -
 drivers/staging/media/tegra-vde/Kconfig         | 17 -----------------
 drivers/staging/media/tegra-vde/TODO            |  4 ----
 15 files changed, 22 insertions(+), 27 deletions(-)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/Makefile (67%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/dmabuf-cache.c (100%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/h264.c (100%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/iommu.c (100%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/trace.h (97%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/v4l2.c (100%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/vde.c (100%)
 rename drivers/{staging/media/tegra-vde => media/platform/tegra/vde}/vde.h (100%)
 delete mode 100644 drivers/staging/media/tegra-vde/Kconfig
 delete mode 100644 drivers/staging/media/tegra-vde/TODO

diff --git a/MAINTAINERS b/MAINTAINERS
index aa0f6cbb634e..1f210d2227f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12071,7 +12071,7 @@ L:	linux-tegra@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
-F:	drivers/staging/media/tegra-vde/
+F:	drivers/media/platform/tegra/vde/
 
 MEDIA DRIVERS FOR RENESAS - CEU
 M:	Jacopo Mondi <jacopo@jmondi.org>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9fbdba0fd1e7..97a191a3c0a1 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -630,6 +630,23 @@ config VIDEO_SUN8I_ROTATE
 	   Support for the Allwinner DE2 rotation unit.
 	   To compile this driver as a module choose m here.
 
+config VIDEO_TEGRA_VDE
+	tristate "NVIDIA Tegra Video Decoder Engine driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	select DMA_SHARED_BUFFER
+	select IOMMU_IOVA
+	select MEDIA_CONTROLLER
+	select MEDIA_CONTROLLER_REQUEST_API
+	select SRAM
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_DMA_SG
+	select V4L2_H264
+	select V4L2_MEM2MEM_DEV
+	help
+	   Support for the NVIDIA Tegra video decoder unit.
+	   To compile this driver as a module choose m here.
+
 endif # V4L_MEM2MEM_DRIVERS
 
 # TI VIDEO PORT Helper Modules
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 28eb4aadbf45..4c6fdca75b9f 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -89,3 +89,5 @@ obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
 obj-y					+= sunxi/
 
 obj-$(CONFIG_VIDEO_MESON_GE2D)		+= meson/ge2d/
+
+obj-$(CONFIG_VIDEO_TEGRA_VDE)		+= tegra/vde/
diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/media/platform/tegra/vde/Makefile
similarity index 67%
rename from drivers/staging/media/tegra-vde/Makefile
rename to drivers/media/platform/tegra/vde/Makefile
index 1758aa201baa..4e96f3305567 100644
--- a/drivers/staging/media/tegra-vde/Makefile
+++ b/drivers/media/platform/tegra/vde/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 tegra-vde-y := vde.o iommu.o dmabuf-cache.o h264.o v4l2.o
-obj-$(CONFIG_TEGRA_VDE)	+= tegra-vde.o
+obj-$(CONFIG_VIDEO_TEGRA_VDE)	+= tegra-vde.o
diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c b/drivers/media/platform/tegra/vde/dmabuf-cache.c
similarity index 100%
rename from drivers/staging/media/tegra-vde/dmabuf-cache.c
rename to drivers/media/platform/tegra/vde/dmabuf-cache.c
diff --git a/drivers/staging/media/tegra-vde/h264.c b/drivers/media/platform/tegra/vde/h264.c
similarity index 100%
rename from drivers/staging/media/tegra-vde/h264.c
rename to drivers/media/platform/tegra/vde/h264.c
diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/media/platform/tegra/vde/iommu.c
similarity index 100%
rename from drivers/staging/media/tegra-vde/iommu.c
rename to drivers/media/platform/tegra/vde/iommu.c
diff --git a/drivers/staging/media/tegra-vde/trace.h b/drivers/media/platform/tegra/vde/trace.h
similarity index 97%
rename from drivers/staging/media/tegra-vde/trace.h
rename to drivers/media/platform/tegra/vde/trace.h
index e5714107db58..77358ddfdb8f 100644
--- a/drivers/staging/media/tegra-vde/trace.h
+++ b/drivers/media/platform/tegra/vde/trace.h
@@ -90,6 +90,6 @@ TRACE_EVENT(vde_ref_l1,
 
 /* This part must be outside protection */
 #undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH ../../drivers/staging/media/tegra-vde
+#define TRACE_INCLUDE_PATH ../../drivers/media/platform/tegra/vde
 #define TRACE_INCLUDE_FILE trace
 #include <trace/define_trace.h>
diff --git a/drivers/staging/media/tegra-vde/v4l2.c b/drivers/media/platform/tegra/vde/v4l2.c
similarity index 100%
rename from drivers/staging/media/tegra-vde/v4l2.c
rename to drivers/media/platform/tegra/vde/v4l2.c
diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/media/platform/tegra/vde/vde.c
similarity index 100%
rename from drivers/staging/media/tegra-vde/vde.c
rename to drivers/media/platform/tegra/vde/vde.c
diff --git a/drivers/staging/media/tegra-vde/vde.h b/drivers/media/platform/tegra/vde/vde.h
similarity index 100%
rename from drivers/staging/media/tegra-vde/vde.h
rename to drivers/media/platform/tegra/vde/vde.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index b81cfa74edb7..1fd6a0c6e1d8 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -36,8 +36,6 @@ source "drivers/staging/media/rkvdec/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
-source "drivers/staging/media/tegra-vde/Kconfig"
-
 source "drivers/staging/media/zoran/Kconfig"
 
 source "drivers/staging/media/tegra-video/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 7e2c86e3695d..66d6f6d51c86 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_VIDEO_OMAP4)	+= omap4iss/
 obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
-obj-$(CONFIG_TEGRA_VDE)		+= tegra-vde/
 obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
deleted file mode 100644
index 07dbc1f44ca8..000000000000
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config TEGRA_VDE
-	tristate "NVIDIA Tegra Video Decoder Engine driver"
-	depends on ARCH_TEGRA || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
-	select DMA_SHARED_BUFFER
-	select IOMMU_IOVA
-	select MEDIA_CONTROLLER
-	select MEDIA_CONTROLLER_REQUEST_API
-	select SRAM
-	select VIDEOBUF2_DMA_CONTIG
-	select VIDEOBUF2_DMA_SG
-	select V4L2_H264
-	select V4L2_MEM2MEM_DEV
-	help
-	    Say Y here to enable support for the NVIDIA Tegra video decoder
-	    driver.
diff --git a/drivers/staging/media/tegra-vde/TODO b/drivers/staging/media/tegra-vde/TODO
deleted file mode 100644
index 31aaa3e66d80..000000000000
--- a/drivers/staging/media/tegra-vde/TODO
+++ /dev/null
@@ -1,4 +0,0 @@
-TODO:
-	- Implement V4L2 API once it gains support for stateless decoders.
-
-Contact: Dmitry Osipenko <digetx@gmail.com>
-- 
2.34.1

