Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D932F6594
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908702; cv=none; b=h8lBmYLM3lNn8OfuOf6PJbOaHvY1bDoLk+EWxhHHjCy5F+2SaV0ownfff/ngp9NwVxNDs6Wi1k1CW+o82tCjK34oIXA7gFSU6lvJf3CJDULiV1g4BE0sFHhfeSrZ43iVD/YW9Do+vTISTLxUHDoXb+e0xOT2+QhO8T1F2pvdrUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908702; c=relaxed/simple;
	bh=oogKzOkmRUHqbeJIXHjFVmuliJy7HLFoYw49y22EcBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCM3PaiEgNQG7/shse6aKi2NiO9B8qlsp3ylRIsy/Hj1Jw8K2beQs9Gfaj9gdm3PzBrjABqg6k+pWf53zE0oF4o76NdEmWEu36i1nE3aUQzR61O5cPoEZ3Ft9lnW46lVcT8N1r26tK07LUw1WqLWdBEWfJszm0VcmiTX9N0ewDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pkf+t5di; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pkf+t5di"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so670805e87.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908696; x=1760513496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FSRFPudzEKyK76m04qsFR3ktGMJkJD3i+v6OWuiw2c=;
        b=Pkf+t5di5elC43UQD4vfWHlkqyoz3v0Ali7KZ1IJ+90fNJhXsO19XuCMViqgVpcGDs
         DcE21s02+LKEFWXn/kthJEFiV+0p5Opx/euDUz7GLSkJkbgFugDocd5/tFojRcyOyb3s
         a3DamniLQOe8l1pEWQ1TLxrU3aKZN6SvrdEhd92plcGN1PdiCbUGSQV0Gkevcffs8kDT
         KV2LB8xeS77W5lZkO6L7/80Jpb3xcsvB4F7JOM+E+WwihbaDIWPQdaKLQ3E9yWdGj1dP
         Aps8alrv0u4xuzbr0kNb2cqhvuVq9ME06quqVEBfUrN7HV3KOm5vLkJj79MteahoSjwO
         sHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908696; x=1760513496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FSRFPudzEKyK76m04qsFR3ktGMJkJD3i+v6OWuiw2c=;
        b=wEXufVUKU/OvYtJSi2+UEP4SvouAy5TJcbk+RoY/mWmurGc/G3ZToge0HH/5Lg8KmD
         8YWMXkBr2RFA5fIpMUOBrqfBPoU7m/WL5iMD5qcABW81Y4UOPPK4MS6h+/yFJsabjnnT
         9PdF7yHODfIjpklz2NIZnHMrQ77+SVmynDyQRNBZCyUnP2uIW305HpL/UCZcUW5HlXE9
         jzCaEJAvn8Ey6sCMhasJNqQG2nMdiCT71JCoqLBkqYX3CNP9HoNSd/D9eWotLnAG0fci
         8K3KBy/b8q28qN/FPKpLAFxwA6bKBHxY/nUrihgftJn/rEg6YK6pjRI+anHpfyPQdEzu
         IYzg==
X-Forwarded-Encrypted: i=1; AJvYcCV6h7K6H6Z+pWDVeYPZxWJltYRDI4f3Wyb/m+qzRQvBH7TVd8WRj1+tnuNRbBweP20OE6z+Q42TKgUzgxYe@lists.linux.dev
X-Gm-Message-State: AOJu0YzzTx3PpEZD60ToVhv8bx7/6O4BHeSMNPZS0xZJyfrPRHlrs+8Z
	X21/m+KmqimGa4VR/dioOSB0/LYXwltjcXjFws0WYo5FVjRdibFulAZk
X-Gm-Gg: ASbGncsxXoiYvUi8415xGOOogtnYJWdMyiOQB7sMQys9yZDuUG0qxcvZmKTgBbn7DR/
	BFx1jBXETARE7bDBoRUYdRJMit65mbp67hkbV06Iy+kMG1aYIbomD55ZJhvfjbxGjzyZ43Ok8AG
	6yIAxRaY3r84pjgwrkuSr6KDOTJQ68hHCD3yN6xFfjk0Fzg1CLwtZXxxIpCJ11Ghb15Ptluc4Xc
	rkA6tHXJi0vMmsKiBvthBsaaMraNiv8QJy1Ix16k8GInBjRJt760eH0uWUMkNycJsGFNXiA7N7Y
	+qrAPzVHkLqfptBD/v8aD+7CYD0nn0yrNWRhsSFxUHGZORou1q2M5L5zc8mGrHo+Q0SM4ojP7eg
	q1YZhoopM+Ib/EQPPGuBRopfFwwxfxRIDW3J1Ww==
X-Google-Smtp-Source: AGHT+IGE/TSIUL/StBMJgUWD0w2OVrZkhtE/d38a8baz9U6KTpcPJsAal1RoMEveZ2pL7kJn+hRzyw==
X-Received: by 2002:a05:6512:3d09:b0:571:75c8:43a5 with SMTP id 2adb3069b0e04-5905e1d36demr1945298e87.1.1759908695553;
        Wed, 08 Oct 2025 00:31:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 13/24] staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to CSI
Date: Wed,  8 Oct 2025 10:30:35 +0300
Message-ID: <20251008073046.23231-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 19 ++++++++++++++++++-
 drivers/staging/media/tegra-video/csi.h |  2 ++
 drivers/staging/media/tegra-video/vi.c  | 23 ++---------------------
 drivers/staging/media/tegra-video/vi.h  |  2 --
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index ef5f054b6d49..7d70478a07aa 100644
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
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3ed2dbc73ce9..1550defb115a 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -137,6 +137,7 @@ struct tegra_csi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clks: clock for CSI and CIL
+ * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: csi operations
  * @csi_chans: list head for CSI channels
@@ -146,6 +147,7 @@ struct tegra_csi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk_bulk_data *clks;
+	struct regulator *vdd;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
 	struct list_head csi_chans;
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 04b538e8b514..70607a3eeee1 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1417,29 +1417,19 @@ static int __maybe_unused vi_runtime_resume(struct device *dev)
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
@@ -1448,8 +1438,6 @@ static int __maybe_unused vi_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vi->clk);
 
-	regulator_disable(vi->vdd);
-
 	return 0;
 }
 
@@ -1894,13 +1882,6 @@ static int tegra_vi_probe(struct platform_device *pdev)
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
index cac0c0d0e225..bfadde8858d4 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -94,7 +94,6 @@ struct tegra_vi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clk: main clock for VI block
- * @vdd: vdd regulator for VI hardware, normally it is avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: vi operations
  * @vi_chans: list head for VI channels
@@ -104,7 +103,6 @@ struct tegra_vi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk *clk;
-	struct regulator *vdd;
 	const struct tegra_vi_soc *soc;
 	const struct tegra_vi_ops *ops;
 	struct list_head vi_chans;
-- 
2.48.1

