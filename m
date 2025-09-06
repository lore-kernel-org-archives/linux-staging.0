Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2B2FC02F
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166863; cv=none; b=MLguRh7J6t4SjvbcAPopemM//4pT/CD94aa0fCuVINYNfccol5ksS0K3R/lF2NdNmSUdJManpcMz/pxxzIcd3ht8Kw/bRUiCdwY41fFgZEdO8PV0FzZu2OZPpl1SrGdS5+mf4tzUHzxY9GJ2MvT+KAepZmoJ0CivRmkp4c3Ub7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166863; c=relaxed/simple;
	bh=oDbo9QsqEy2foTEPE1s1RDeFNVI2fu9L/rdGqqDdpzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRuXU084GZhgq6r5LwDg1+7ycmue+JucBAuBXIecm0hwxJkm5dprW7cPqkRbovnwUFk5xp+axYb/Q2DYdzAzRwqX0wkLadHr2FhQ3WBsLbe9nIEnAKcGXwXSVT4HPbu9mqTkbs6IHzxYzka8yS75FzqgO9sWGUT0RP5UxJHUt3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYSjR0uc; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYSjR0uc"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso2848673e87.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166858; x=1757771658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dchXyakOLLQNmX90Db7XOELO9qq/NGifFST78n+g49g=;
        b=TYSjR0ucLEL3OphRs8PejvzmH1/FP5mVbrUX+lIIyWjUGdtsKkGaF7mnfNaTgFQBA/
         maIEbAyB08sgnFx+Lbv05KPRJJXXl8i2pvdM4puYgZU4Vfu+uBFbbX7FJ+5aJ8/lligx
         zkPbnC0UMwmxzsbDwxyJcm6E7VEJZW0Quu47/Lbh9YKGHbN4Kxp5x7qmluZ6J5bC5bTf
         XcLGieiusW70tO1Xd2bExb7cJRpeMe+S7YQ6Y/sDv8OIp5w1h54Kgw9lFgCh039cMOZg
         N1jIz4NOdfgdhFmsj5jT22s693ADPqqy4jrkyAm7guaEV5BijPPJQ9Zi3HJ6eTY2KCAz
         Ue0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166858; x=1757771658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dchXyakOLLQNmX90Db7XOELO9qq/NGifFST78n+g49g=;
        b=HsLUH5+LHsa7tncVFuKfxPJ4LgnCqh7XWzvdL4uUBV0qWyrpRshbxJa/I/JiKaUr73
         v5xvd+HU+lV3OiAuPqjnYHaBGXQoHkZ5zBJ1lfn1VyxTv4sYy+R99VnxgGvYjYgAF/gt
         qCgBGFkEdqdTslo1FbxeciLMFFY5MDRv7bnKtQDyYCyNqtYkTHYXSFG+tmjrz+FwdqYT
         sbMZ7rzrYgVKwd2mQra9h2WThhVZphoDcy5iKhNHEwgAwXr8AijUmO5idMDUxKLa/3ts
         jLYDQccUTXHxunZPPPTBpXVTXyA6fMJ02aJ6i+wABNaRwgHa1+1IwMzh39MRrOCY5mSo
         tzug==
X-Forwarded-Encrypted: i=1; AJvYcCUWmfzb32MrEKdKIcm3k3X0BXYfmg7eDCGgtRsfMOwQa7LVv1ZebP/ykk1dowhU5lzBosTWxnbY3Hj7S98Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwfNQFo5uYby8XdHbzoITq2PGYiD/9mSMcAUbHKsJ+IZZZx/h0C
	S9r7rTBVW44MAJTz1spyySGB0jNoKeR57gpp7Ub6qD76AoAMjKWckO79
X-Gm-Gg: ASbGncsJzA/Nm1VkyDgqYgfl/zYdT8hC+ofEOlbQHIhkHckrSahAuYEaxwkFWuHynv1
	zl34Aws6XedjaQ7mgxfZMGQmLmgzwFlINbJ8VvMKeoVVOS9itQfCFE/sKtIfpP/Qtr1ZgiVDEOy
	BoDv8c5zOBdT5i6JvH5WCx6VAy/LRUCOILgFTPnoiPzTpEOT0hr+4/tv4Lcejh5444CzCsp2Ye9
	x87RWUo2QhuTBQToHi9LYAAlTvPvPpDFLV6FUF2FlY0Ge+UlVYBdRlKSPbKOGktV9f8mjuu6In/
	/xPhK7R8T/SnuKXeNvrLAaICE5h3sOa+N9+T/w4CDYNo+id9upSElq2BmMSxIe0BjiJ4Ct35NUK
	WR+tIlCu32QEqwA==
X-Google-Smtp-Source: AGHT+IH8I2Auff/z35J3ggxpo1vwJ884ltjyjaLfaaaFMsTd6bn72w00EmrUSpTJ7lT5WXdLaRygAQ==
X-Received: by 2002:a05:6512:1546:10b0:562:d04d:fa05 with SMTP id 2adb3069b0e04-562d04dfad0mr274283e87.54.1757166857844;
        Sat, 06 Sep 2025 06:54:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 10/23] staging: media: tegra-video: csi: add support for SoCs with integrated MIPI calibration
Date: Sat,  6 Sep 2025 16:53:31 +0300
Message-ID: <20250906135345.241229-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20/Tegra30 SoC have MIPI calibration logic integrated into CSI block.
This commit adds support for using the entire CSI block for MIPI
calibration not only for CSI itself but for DSI too.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/host1x/mipi.c                     | 18 ++++++++---
 drivers/staging/media/tegra-video/csi.c       |  7 +++-
 drivers/staging/media/tegra-video/tegra20.c   |  1 +
 drivers/staging/media/tegra-video/tegra210.c  |  2 +-
 drivers/staging/media/tegra-video/vi.h        |  3 +-
 .../csi.h => include/linux/tegra-csi.h        |  6 ++++
 include/linux/tegra-mipi-cal.h                | 32 +++++++++++++++++++
 7 files changed, 61 insertions(+), 8 deletions(-)
 rename drivers/staging/media/tegra-video/csi.h => include/linux/tegra-csi.h (95%)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 2fa339a428f3..262f71296b75 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -215,10 +215,20 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 		goto free;
 	}
 
-	dev->mipi = platform_get_drvdata(dev->pdev);
-	if (!dev->mipi) {
-		err = -EPROBE_DEFER;
-		goto put;
+	/* Tegra20/Tegra30 add CSI structure to MIPI device */
+	if (of_machine_is_compatible("nvidia,tegra20") ||
+	    of_machine_is_compatible("nvidia,tegra30")) {
+		dev->csi = platform_get_drvdata(dev->pdev);
+		if (!dev->csi) {
+			err = -EPROBE_DEFER;
+			goto put;
+		}
+	} else {
+		dev->mipi = platform_get_drvdata(dev->pdev);
+		if (!dev->mipi) {
+			err = -EPROBE_DEFER;
+			goto put;
+		}
 	}
 
 	of_node_put(args.np);
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9e3bd6109781..3d1d5e1615c2 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -12,11 +12,11 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/tegra-csi.h>
 #include <linux/tegra-mipi-cal.h>
 
 #include <media/v4l2-fwnode.h>
 
-#include "csi.h"
 #include "video.h"
 
 #define MHZ			1000000
@@ -794,6 +794,11 @@ static int tegra_csi_probe(struct platform_device *pdev)
 
 	csi->dev = &pdev->dev;
 	csi->ops = csi->soc->ops;
+	if (csi->soc->mipi_ops)
+		csi->mipi_ops = csi->soc->mipi_ops;
+
+	mutex_init(&csi->mipi_lock);
+
 	platform_set_drvdata(pdev, csi);
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..461593c49594 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -16,6 +16,7 @@
 #include <linux/host1x.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
+#include <linux/tegra-csi.h>
 #include <linux/v4l2-mediabus.h>
 
 #include "vip.h"
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..59224c2f9948 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -13,8 +13,8 @@
 #include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/kthread.h>
+#include <linux/tegra-csi.h>
 
-#include "csi.h"
 #include "vi.h"
 
 #define TEGRA210_MIN_WIDTH	32U
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index cac0c0d0e225..64655ac1b41f 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/tegra-csi.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
@@ -21,8 +22,6 @@
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "csi.h"
-
 #define V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY	(V4L2_CTRL_CLASS_CAMERA | 0x1001)
 
 #define TEGRA_DEF_WIDTH		1920
diff --git a/drivers/staging/media/tegra-video/csi.h b/include/linux/tegra-csi.h
similarity index 95%
rename from drivers/staging/media/tegra-video/csi.h
rename to include/linux/tegra-csi.h
index 3ed2dbc73ce9..b47f48ef7115 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/include/linux/tegra-csi.h
@@ -115,6 +115,7 @@ struct tegra_csi_ops {
  * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
  *
  * @ops: csi hardware operations
+ * @mipi_ops: MIPI calibration operations
  * @csi_max_channels: supported max streaming channels
  * @clk_names: csi and cil clock names
  * @num_clks: total clocks count
@@ -123,6 +124,7 @@ struct tegra_csi_ops {
  */
 struct tegra_csi_soc {
 	const struct tegra_csi_ops *ops;
+	const struct tegra_mipi_ops *mipi_ops;
 	unsigned int csi_max_channels;
 	const char * const *clk_names;
 	unsigned int num_clks;
@@ -139,6 +141,8 @@ struct tegra_csi_soc {
  * @clks: clock for CSI and CIL
  * @soc: pointer to SoC data structure
  * @ops: csi operations
+ * @mipi_ops: MIPI calibration operations
+ * @mipi_lock: for MIPI calibration operations
  * @csi_chans: list head for CSI channels
  */
 struct tegra_csi {
@@ -148,6 +152,8 @@ struct tegra_csi {
 	struct clk_bulk_data *clks;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
+	const struct tegra_mipi_ops *mipi_ops;
+	struct mutex mipi_lock;
 	struct list_head csi_chans;
 };
 
diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-cal.h
index 2bfdbfd3cb77..81784b1f2135 100644
--- a/include/linux/tegra-mipi-cal.h
+++ b/include/linux/tegra-mipi-cal.h
@@ -3,6 +3,8 @@
 #ifndef __TEGRA_MIPI_CAL_H_
 #define __TEGRA_MIPI_CAL_H_
 
+#include <linux/tegra-csi.h>
+
 struct tegra_mipi {
 	const struct tegra_mipi_soc *soc;
 	const struct tegra_mipi_ops *ops;
@@ -17,6 +19,7 @@ struct tegra_mipi {
 struct tegra_mipi_device {
 	struct platform_device *pdev;
 	struct tegra_mipi *mipi;
+	struct tegra_csi *csi;
 	struct device *device;
 	unsigned long pads;
 };
@@ -69,6 +72,14 @@ static inline int tegra_mipi_enable(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_enable(device);
 	}
 
+	/* Tegra20/Tegra30 have MIPI calibration logic inside CSI block */
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_enable)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_enable(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -81,6 +92,13 @@ static inline int tegra_mipi_disable(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_disable(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_disable)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_disable(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -93,6 +111,13 @@ static inline int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_start_calibration(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_start_calibration)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_start_calibration(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -105,6 +130,13 @@ static inline int tegra_mipi_finish_calibration(struct tegra_mipi_device *device
 		return device->mipi->ops->tegra_mipi_finish_calibration(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_finish_calibration)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_finish_calibration(device);
+	}
+
 	return -ENOSYS;
 }
 
-- 
2.48.1

