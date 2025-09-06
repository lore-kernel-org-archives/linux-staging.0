Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CB2F1FFB
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166860; cv=none; b=SrY2Vk1CRVVl2gBRzwQmW8/2gSlZdPQzbZAxU9tt9Kiwdlz8p/KjgN0FznKoZa5HwLbCAiKt+v3FN2nlMGR7NUcsIKlrlAbzwoy0J88zcRcQ6GjTmZXUD0u/3H7NwpzVlgdThw4Wd4CsiZ16cOq6oNmnBEkTsRmYjeXYCiigyow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166860; c=relaxed/simple;
	bh=9KIxS28aoJOme8EpOd4zWd+QwiyDFvN5SpGojzD8ALg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0uoN0tEHN1QCD0uwHz+3jqdl5XGzbKj2/8NTb1PRf9RFkxDwsWZgWcWOpK/8C5ZfDS2jxGP6HUKe8ulfyBioGiggs0kt8x/0vYFFvdDU7kbJK5AR21VT33QgKkuI7kNwV6snrfVZy1cu+/JFYD9qnbcWTKu7EO5yAvqvpN2qMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCLxcqZZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCLxcqZZ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2745441e87.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166856; x=1757771656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l/OXJ/2UtKNoWod0pa8ri4mTLgdrOtgcC/h0wB5OSo=;
        b=VCLxcqZZG6xuL2XPkzzxKPxx7qy9bRmUiXq+5LNidbd5/kg+hAEMbCvEIuU8XR8Uq5
         VYjX6CgdbVDzNmXvuOYR7GSI7abMEjx+zbE7mR+VBB5mmwV9Els7E8aSAJv2UIyeiw8H
         1SOEIDFQONpRguUXGkwHlI8UHUHFzJ4velMLmqZPjSD9rHVKogZbMMRxknAH27zotRRj
         ai7ZYDFNZhsgDz3fuwYu1wyWBEM4E/teYZdY+JoVUxkSrcRPqBRddSomSt1vMvt5F6hz
         npWu/upn/8yih+dQfo614XFdR4gQXjnybfnxZnd9HUAmDk1LdEDJTbh9Rtd9WDzbMira
         ePPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166856; x=1757771656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l/OXJ/2UtKNoWod0pa8ri4mTLgdrOtgcC/h0wB5OSo=;
        b=ihx5zcvKx/za/g33BkTbxAakhae8Gb/ZTmAf7L7cqnols/wBSJUpO4PLaD17+Fg6na
         IMnRbkGjhUHUQwAko/ZdP5LlGQ9ZyzQqFP1k+tkMyy+/p4OwbmtXNgp386Qr7Tt4B7Jl
         7DxKK0HBFqNagB7wR/ZRLokG1bhKfE29z7vl2V02W9I0taCRYEnb73sYI+m6Gyv+Z3Kg
         BZBow8Ed/PGkgPE//v2MuM044qO4TPmqcqwy4Ld+ET/YQYeYDrDWB8Bo32l70ADCOqei
         YPOvofmhUgH9if2AE3jI38AB/PuxzxK1cEJAXxrjZ4c+wpywhC72r7QHksPrDiH05gp4
         HENg==
X-Forwarded-Encrypted: i=1; AJvYcCXAQZi0JLXrHvuF3JVwxpeJUPoaBldGvixSMKZgF12IsGTIpBBhdgNxYVqTzfk0WB0NBY+CgN33crg+XMXU@lists.linux.dev
X-Gm-Message-State: AOJu0YwCB28qPXwponJ29XsSLDvkIYnu/qZdux2CrN0p3ZxVh08/H62z
	Wjbay0crQqxdH9Ndn1riHuUGmrRWqiHQH8L5YUDRHc/RnSjT4UdZDJb4
X-Gm-Gg: ASbGncvFEAoTm2MKpzniM7EoE7AHmzNb+EfgCoQ65c/KpT+DtJDrw3IpXJ04ZVtiYZj
	/hPmBSL/Zi/XzL8EtR/rCugAAD9Z2v+wKTVPoob2HXcIkoFSA1f7IB3yXTOzn5b/YTmJTT90hUY
	mRe7OokpLghy+sN7TMaWs4w8jtEb6wUw0+VYzHUukhBer9aDP4/4dZzwa8J4s6i0hcDO+jVumzY
	ztMh+QKIwzmC2BgxxIgBPEfiinFnWiz9dWIrWAGh1dRe1Aq0GXslRxJHw6ZXnMMGc9EdEWdvGkK
	qcKGKWYqadR1YrUsQoc7/JUtWsSzKNdrz8EJ3aFCAXzZU734CiitDaEsWAKiPHre8P4Lh7YPPGH
	lnkODdBWes0PqZoO3ugv577PC
X-Google-Smtp-Source: AGHT+IGOsVwpFAp9ei3qqIw/HizK7mMNqSE9hxsvN6Nn57gYmdRCRcKqFueD/yz21T792etfHkKELQ==
X-Received: by 2002:a05:6512:3d12:b0:55f:3ecd:31b9 with SMTP id 2adb3069b0e04-5626275db0emr565244e87.26.1757166856301;
        Sat, 06 Sep 2025 06:54:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:15 -0700 (PDT)
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
Subject: [PATCH v2 09/23] gpu: host1x: convert MIPI to use operations
Date: Sat,  6 Sep 2025 16:53:30 +0300
Message-ID: <20250906135345.241229-10-clamor95@gmail.com>
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

This commit converts the existing MIPI code to use operations, which is a
necessary step for the Tegra20/Tegra30 SoCs. Additionally, it creates a
dedicated header file, tegra-mipi-cal.h, to contain the MIPI calibration
functions, improving code organization and readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c             |   1 +
 drivers/gpu/host1x/mipi.c               |  40 +++------
 drivers/staging/media/tegra-video/csi.c |   1 +
 include/linux/host1x.h                  |  10 ---
 include/linux/tegra-mipi-cal.h          | 111 ++++++++++++++++++++++++
 5 files changed, 126 insertions(+), 37 deletions(-)
 create mode 100644 include/linux/tegra-mipi-cal.h

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 64f12a85a9dd..278bf2c85524 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/tegra-mipi-cal.h>
 
 #include <video/mipi_display.h>
 
diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e51b43dd15a3..2fa339a428f3 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -27,6 +27,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/tegra-mipi-cal.h>
 
 #include "dev.h"
 
@@ -116,23 +117,6 @@ struct tegra_mipi_soc {
 	u8 hsclkpuos;
 };
 
-struct tegra_mipi {
-	const struct tegra_mipi_soc *soc;
-	struct device *dev;
-	void __iomem *regs;
-	struct mutex lock;
-	struct clk *clk;
-
-	unsigned long usage_count;
-};
-
-struct tegra_mipi_device {
-	struct platform_device *pdev;
-	struct tegra_mipi *mipi;
-	struct device *device;
-	unsigned long pads;
-};
-
 static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
 				   unsigned long offset)
 {
@@ -261,7 +245,7 @@ void tegra_mipi_free(struct tegra_mipi_device *device)
 }
 EXPORT_SYMBOL(tegra_mipi_free);
 
-int tegra_mipi_enable(struct tegra_mipi_device *dev)
+static int tegra114_mipi_enable(struct tegra_mipi_device *dev)
 {
 	int err = 0;
 
@@ -273,11 +257,9 @@ int tegra_mipi_enable(struct tegra_mipi_device *dev)
 	mutex_unlock(&dev->mipi->lock);
 
 	return err;
-
 }
-EXPORT_SYMBOL(tegra_mipi_enable);
 
-int tegra_mipi_disable(struct tegra_mipi_device *dev)
+static int tegra114_mipi_disable(struct tegra_mipi_device *dev)
 {
 	int err = 0;
 
@@ -289,11 +271,9 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 	mutex_unlock(&dev->mipi->lock);
 
 	return err;
-
 }
-EXPORT_SYMBOL(tegra_mipi_disable);
 
-int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
+static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *device)
 {
 	struct tegra_mipi *mipi = device->mipi;
 	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
@@ -309,9 +289,8 @@ int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
 
 	return err;
 }
-EXPORT_SYMBOL(tegra_mipi_finish_calibration);
 
-int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
+static int tegra114_mipi_start_calibration(struct tegra_mipi_device *device)
 {
 	const struct tegra_mipi_soc *soc = device->mipi->soc;
 	unsigned int i;
@@ -384,7 +363,13 @@ int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 
 	return 0;
 }
-EXPORT_SYMBOL(tegra_mipi_start_calibration);
+
+static const struct tegra_mipi_ops tegra114_mipi_ops = {
+	.tegra_mipi_enable = tegra114_mipi_enable,
+	.tegra_mipi_disable = tegra114_mipi_disable,
+	.tegra_mipi_start_calibration = tegra114_mipi_start_calibration,
+	.tegra_mipi_finish_calibration = tegra114_mipi_finish_calibration,
+};
 
 static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 	{ .data = MIPI_CAL_CONFIG_CSIA },
@@ -512,6 +497,7 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 
 	mipi->soc = match->data;
 	mipi->dev = &pdev->dev;
+	mipi->ops = &tegra114_mipi_ops;
 
 	mipi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(mipi->regs))
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 74c92db1032f..9e3bd6109781 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -12,6 +12,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/tegra-mipi-cal.h>
 
 #include <media/v4l2-fwnode.h>
 
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9fa9c30a34e6..b1c6514859d3 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client *client);
 int host1x_client_suspend(struct host1x_client *client);
 int host1x_client_resume(struct host1x_client *client);
 
-struct tegra_mipi_device;
-
-struct tegra_mipi_device *tegra_mipi_request(struct device *device,
-					     struct device_node *np);
-void tegra_mipi_free(struct tegra_mipi_device *device);
-int tegra_mipi_enable(struct tegra_mipi_device *device);
-int tegra_mipi_disable(struct tegra_mipi_device *device);
-int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
-int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
-
 /* host1x memory contexts */
 
 struct host1x_memory_context {
diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-cal.h
new file mode 100644
index 000000000000..2bfdbfd3cb77
--- /dev/null
+++ b/include/linux/tegra-mipi-cal.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TEGRA_MIPI_CAL_H_
+#define __TEGRA_MIPI_CAL_H_
+
+struct tegra_mipi {
+	const struct tegra_mipi_soc *soc;
+	const struct tegra_mipi_ops *ops;
+	struct device *dev;
+	void __iomem *regs;
+	struct mutex lock;
+	struct clk *clk;
+
+	unsigned long usage_count;
+};
+
+struct tegra_mipi_device {
+	struct platform_device *pdev;
+	struct tegra_mipi *mipi;
+	struct device *device;
+	unsigned long pads;
+};
+
+/**
+ * Operations for Tegra MIPI calibration device
+ */
+struct tegra_mipi_ops {
+	/**
+	 * @tegra_mipi_enable:
+	 *
+	 * Enable MIPI calibration device
+	 */
+	int (*tegra_mipi_enable)(struct tegra_mipi_device *device);
+
+	/**
+	 * @tegra_mipi_disable:
+	 *
+	 * Disable MIPI calibration device
+	 */
+	int (*tegra_mipi_disable)(struct tegra_mipi_device *device);
+
+	/**
+	 * @tegra_mipi_start_calibration:
+	 *
+	 * Start MIPI calibration
+	 */
+	int (*tegra_mipi_start_calibration)(struct tegra_mipi_device *device);
+
+	/**
+	 * @tegra_mipi_finish_calibration:
+	 *
+	 * Finish MIPI calibration
+	 */
+	int (*tegra_mipi_finish_calibration)(struct tegra_mipi_device *device);
+};
+
+struct tegra_mipi_device *tegra_mipi_request(struct device *device,
+					     struct device_node *np);
+
+void tegra_mipi_free(struct tegra_mipi_device *device);
+
+static inline int tegra_mipi_enable(struct tegra_mipi_device *device)
+{
+	/* Tegra114+ has a dedicated MIPI calibration block */
+	if (device->mipi) {
+		if (!device->mipi->ops->tegra_mipi_enable)
+			return 0;
+
+		return device->mipi->ops->tegra_mipi_enable(device);
+	}
+
+	return -ENOSYS;
+}
+
+static inline int tegra_mipi_disable(struct tegra_mipi_device *device)
+{
+	if (device->mipi) {
+		if (!device->mipi->ops->tegra_mipi_disable)
+			return 0;
+
+		return device->mipi->ops->tegra_mipi_disable(device);
+	}
+
+	return -ENOSYS;
+}
+
+static inline int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
+{
+	if (device->mipi) {
+		if (!device->mipi->ops->tegra_mipi_start_calibration)
+			return 0;
+
+		return device->mipi->ops->tegra_mipi_start_calibration(device);
+	}
+
+	return -ENOSYS;
+}
+
+static inline int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
+{
+	if (device->mipi) {
+		if (!device->mipi->ops->tegra_mipi_finish_calibration)
+			return 0;
+
+		return device->mipi->ops->tegra_mipi_finish_calibration(device);
+	}
+
+	return -ENOSYS;
+}
+
+#endif /* __TEGRA_MIPI_CAL_H_ */
-- 
2.48.1

