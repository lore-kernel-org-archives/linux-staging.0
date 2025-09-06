Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23FB2FC036
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166867; cv=none; b=TUOpb6VdI4wsRJzHxPNXD4Uw9zGOnIvdYCXqay+8xyBd2g2BOaY2LhF+8f1OSbTdPj//AI0u12i68tkN2Ts3JsxwgvYxck0L+HXzU1f+tscNG5GZ5xfhBsglzfXFKaNLRe6N2ldfI/WgxUEbn5TsEH2FhuezyDsTbYILWvFA7wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166867; c=relaxed/simple;
	bh=65j6LwR4mJiY2H/RFsjkUk04+hjmd9f5nUARp7ytK+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgpY8Q81Nd4kogROS4y2irLYNSG687i0Ey4HCvj0pC5YTYsL4847aqklA+GMQ+vAebqWetJ0kTBh6HuyxsYitj/S8s/b54S3HPCCll2sEm7RFfMch0heLoPenDsGza4b+Mc3PUAA7rzxhUZZ2YvGTA9DIDVoDB7hBNE05egVlnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuxjpSap; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuxjpSap"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so3255445e87.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166863; x=1757771663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vTlXJ0ADIeGEtY5cxRTfOE3Fzno1hN3qUAjTXoRk9Q=;
        b=BuxjpSapoWH7uuKiY2jvvhxwHhcGFsrJCZ+HMq1nK2tuI0QaUKp8ldjbcJb41uPHd8
         FZ3BVk3GKXh1LRGf7YeqJzQzs+ucn6QcAjvfvuWMCP7VrYq7Fvbyzf+edwYM1NAKcuAD
         CBIB0mlXouz/7u7yAS6FM1ALE3mRuTZSgAMG6Tw0EgbGVOqMBKR+JlnrKXfWwuJZdGn5
         zr/WCj+mieeqJBzRUkHSGvzS1ArhRYb6FAnzB+skcO3IjbE/WwSEBGMvZtux02TJKB8C
         uPTCZsg58RUL1XxdHEWZ0bV+m3QUqnitIJKvTBvtIFTOLn+tPeOM+Wfv4cZFBpg+ZSoN
         Or/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166863; x=1757771663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vTlXJ0ADIeGEtY5cxRTfOE3Fzno1hN3qUAjTXoRk9Q=;
        b=iDcxSyTnu6JQe+He7NUquqOiE2ySmD18ImLHQcKT91YcFcIdrCqUprAYVEClYn/sX3
         OBmFND9760d2rScXi9ZTV5guJ/G4qt5HOOBPDcjKn3bgYQRiBdgG7ATVd8ynslLMs0yA
         sVh9MqSJUmZJWpAMFbMy3L4bbdPp8vFJGihqrltoWGO97K/HTqnkeKK8du47qVuglJIi
         fH64ilSOgiMMiVkJ0b9p83mVPFR7wSp2cSU7tFJk7ihkhKVLMJsBJptOO6SVg0GyWa0G
         Gib4D7vm+IaFgvUvzr73OeKNTYZdtEgS5WZplzqEjxVPVG+iRFHkz0Wi6EKbOwFdcNDD
         rTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSDPUBElK3iB/4frA6Ofs+AnSr/Z4Cu/6IZ/YSmxiM4P82SeSp7PuUjPuQx5DgnovZ0CZ9h/W9xEhVFaRS@lists.linux.dev
X-Gm-Message-State: AOJu0YykWMneKTpnp4AfcXBl1odsj5nH6QbZDQoaOt2cv8xYJLRAU9R6
	tXXketDrEeRP1xBPAidwbX/yfEpC0ivWlQGXVdOkJds4NM/WAdQt7/vr/Fme4Q==
X-Gm-Gg: ASbGncuo4HJ2MGhgg9+HU030thWwmwBrOUdARrR+oxnYaEgOhFls4d1uZMYrKuytl++
	0aCADy8sEnlWP0oXhheZ4W7ynbSL5fUw6pmPyVQrOrDnJwoix1gaeFht9lFCS2DdhXkIYhtOfB5
	u9XLwEWFcBWNHvDjlHcUvl9d1GNMt6yJmtIIkbuSOTf9k58evFSV1L4XXz23qRoeIkkiGkgBln9
	LUxHLpyV3xyt9eMXcpJoGJTbKVcVRE9c2nm9tCS0lSxt8Ea6sKDosz5H5EK5WoQgBcoTu1TrN3A
	urYDKiUP7YeLERvYjYF9x43swZ5+QNnFKdegMfsrm7B1Hdc2CGDdR/nvQZ8CQWSH9g+1hpKP9pe
	N7J99P4X8qgQAFw==
X-Google-Smtp-Source: AGHT+IHwDEExXcShBRr7iwUZKOVrNMOfF2rMEiTh8K8LE2hhdC+VYvqxYCvbDotc3PEX8XolwsvD6w==
X-Received: by 2002:a05:6512:138a:b0:55e:990:fff3 with SMTP id 2adb3069b0e04-562648219famr575340e87.53.1757166862562;
        Sat, 06 Sep 2025 06:54:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:22 -0700 (PDT)
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
Subject: [PATCH v2 13/23] staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to CSI
Date: Sat,  6 Sep 2025 16:53:34 +0300
Message-ID: <20250906135345.241229-14-clamor95@gmail.com>
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

The avdd-dsi-csi-supply is CSI power supply not VI, hence move it to
proper place.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 19 ++++++++++++++++++-
 drivers/staging/media/tegra-video/vi.c  | 23 ++---------------------
 drivers/staging/media/tegra-video/vi.h  |  2 --
 include/linux/tegra-csi.h               |  2 ++
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index c848e4ab51ac..1677eb51ec21 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -710,6 +710,8 @@ static int __maybe_unused csi_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(csi->soc->num_clks, csi->clks);
 
+	regulator_disable(csi->vdd);
+
 	return 0;
 }
 
@@ -718,13 +720,23 @@ static int __maybe_unused csi_runtime_resume(struct device *dev)
 	struct tegra_csi *csi = dev_get_drvdata(dev);
 	int ret;
 
+	ret = regulator_enable(csi->vdd);
+	if (ret) {
+		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(csi->soc->num_clks, csi->clks);
 	if (ret < 0) {
 		dev_err(csi->dev, "failed to enable clocks: %d\n", ret);
-		return ret;
+		goto disable_vdd;
 	}
 
 	return 0;
+
+disable_vdd:
+	regulator_disable(csi->vdd);
+	return ret;
 }
 
 static int tegra_csi_init(struct host1x_client *client)
@@ -802,6 +814,11 @@ static int tegra_csi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	csi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
+	if (IS_ERR(csi->vdd))
+		return dev_err_probe(&pdev->dev, PTR_ERR(csi->vdd),
+				     "failed to get VDD supply");
+
 	if (!pdev->dev.pm_domain) {
 		ret = -ENOENT;
 		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 2deb615547be..05af718b3cdf 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1405,29 +1405,19 @@ static int __maybe_unused vi_runtime_resume(struct device *dev)
 	struct tegra_vi *vi = dev_get_drvdata(dev);
 	int ret;
 
-	ret = regulator_enable(vi->vdd);
-	if (ret) {
-		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
-		return ret;
-	}
-
 	ret = clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
 	if (ret) {
 		dev_err(dev, "failed to set vi clock rate: %d\n", ret);
-		goto disable_vdd;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(vi->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable vi clock: %d\n", ret);
-		goto disable_vdd;
+		return ret;
 	}
 
 	return 0;
-
-disable_vdd:
-	regulator_disable(vi->vdd);
-	return ret;
 }
 
 static int __maybe_unused vi_runtime_suspend(struct device *dev)
@@ -1436,8 +1426,6 @@ static int __maybe_unused vi_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vi->clk);
 
-	regulator_disable(vi->vdd);
-
 	return 0;
 }
 
@@ -1882,13 +1870,6 @@ static int tegra_vi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
-	if (IS_ERR(vi->vdd)) {
-		ret = PTR_ERR(vi->vdd);
-		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
-		return ret;
-	}
-
 	if (!pdev->dev.pm_domain) {
 		ret = -ENOENT;
 		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 64655ac1b41f..367667adf745 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -93,7 +93,6 @@ struct tegra_vi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clk: main clock for VI block
- * @vdd: vdd regulator for VI hardware, normally it is avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: vi operations
  * @vi_chans: list head for VI channels
@@ -103,7 +102,6 @@ struct tegra_vi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk *clk;
-	struct regulator *vdd;
 	const struct tegra_vi_soc *soc;
 	const struct tegra_vi_ops *ops;
 	struct list_head vi_chans;
diff --git a/include/linux/tegra-csi.h b/include/linux/tegra-csi.h
index b47f48ef7115..85c74e22a0cb 100644
--- a/include/linux/tegra-csi.h
+++ b/include/linux/tegra-csi.h
@@ -139,6 +139,7 @@ struct tegra_csi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clks: clock for CSI and CIL
+ * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: csi operations
  * @mipi_ops: MIPI calibration operations
@@ -150,6 +151,7 @@ struct tegra_csi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk_bulk_data *clks;
+	struct regulator *vdd;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
 	const struct tegra_mipi_ops *mipi_ops;
-- 
2.48.1

