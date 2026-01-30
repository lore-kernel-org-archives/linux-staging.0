Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F437F8CF
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777407; cv=none; b=YZM1v1MKz/A08mtqF8Ff+n0hfGnm+6LJT8wWGZ4fhiOe6zo4hqQbySG+dxv7bA1bzAFoVFV8E6sDLAHU/NG4cG9nBzjH7fw7uGzGuKzSXf6qhcmIlLehosKALjmVdQDqMC/LbpVlFz6hbyxN5Yp+drirkwZ7DWC9NOmyyDYZJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777407; c=relaxed/simple;
	bh=k4P77wKfPOw5qBQm2fSgQYKJNQxFpoZ+A4PyELRbMsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P30NuUFbUUq2CROHE9svxEG3NFDePdOYMvQgDXgem0C86sInON9cSpLZT+wLQLWLsvOcrZVGDGGHJ6OAS15J1oR27PoFxU3giR1xlLx8SlWhjk8vdP1QZmY8uB/n7OKhpQHtNkR7u+Hkm5k01o5XVWjf8UdqERoYV19SOGf2GpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUCG+hBF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUCG+hBF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so21572065e9.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777403; x=1770382203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPWz370lLxtbqzCECPQrj+RuO7LQhtN0NznRqbDwmqA=;
        b=OUCG+hBFvpZY5W5IWK7EQILby+AMY+yfMKP7Yiv7eAeamlIzv0F15Bu3wV2dysTyna
         XeVzqDUHFeWFR+SCmPJpCdM3ZbgTxbEhBm41MYGHMaqbrEios6t4Fl5Og8X1sRuM9rtY
         nefX0fmlGLK8tb6sLToxHTRDJrt1SXGIv0ssMhd9ms4yC4CkPufIjMQPLoPXTBrunjTI
         cosxFfLXLW5VgqnNTzkmUKL1lNJVa6PT5X4yfwG10+T1efy2VmhiWxr+J0Vm6im6Ku/x
         EyzdN2bYTTF6SOqDYoZz8+HCJCAy6hiWB1sAsuyl8gxy2DCrbhuyx+3wqtFOj8z6fI6i
         lzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777403; x=1770382203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPWz370lLxtbqzCECPQrj+RuO7LQhtN0NznRqbDwmqA=;
        b=i4+PyOIhGSakNLeHbo1lOePYjgy8YgxR/rU3kPxiG9rH8lxshc5zq3FjVO2nf6/539
         XYheTkoGE+AyvdG768YkNXN/9pZqCAZyjLmfKqX1Yxw9QPgQJ4+a3ISLEKpLu0S0qMnO
         I61GSuXVYJAm7II29uLOgVjYw2PBDAwl/UGicJ59fkdQNoLvUJsv43Ec54E/2kg9Rvlw
         1D/lgIGOuQXuw+i7zZtkXhpySmfn8lX2MmptLHSbKEbCwSQVtPgPVsnMUzRo+C0kz5EQ
         2sX46g+KxGWql+tx5brapofOfVh+/L6kugRN/utDBbOEcCE3eyAws4OG3fnbWxUhQ7OE
         p26w==
X-Forwarded-Encrypted: i=1; AJvYcCU25ZiZ6ZTnkhNfhWNNst13anQ9b9EL99Y3QamQJA3D9bvxaeZfimiv9HRlVPYPV4+hm4BioTWuzmmQVSNX@lists.linux.dev
X-Gm-Message-State: AOJu0YzOgkIZEYRoRTMhe1f5FMdbsO0KbrrY0b0ohjsljCmTr7QzI6AI
	9QB+XP9o0NPJqZqPwTh+bMB23FMda8fD8zYDK++nGelNY1JqhNr6uX+/
X-Gm-Gg: AZuq6aI+2gleuXok0mGRAODZz/An9gg1OyN1FimGyqI+kV47/12roJXjdiOb35BGoKF
	OtvXQBB/WG6FZ7E7xswMfZYq53s9X7Tk48WeOyYJ5dQAlhDgtFOGgX9R0CTUrzczMhzxceSmVSx
	0vRJyquiWWx1gloAtiPy9HEWuc99NwjkOqOTShuVJ/NebQ+INGX57OFYUV0h9KYMAqrM3vYDD1/
	OoFNtTnxmQ8UGEVa/SOUOLqa6Dh5nMUb3lxCaK/kGoQF21z9xhmlOKjOWm+WFkbhg2rvusznbY8
	OEkJI0UHe5wZn2JroosnDK5vehM3cReugarKjbeOx+cDyK2wg1q5an98lYKwT5z/nsh9SDyceFs
	0tm8VuKflpzgAKR2xWlsdx6HxsEvjsH7PyLvvJf48wN/dLHpEkJ6VoU1EeMiBwX2xtYYNnWuMmF
	1ijM7Mh/q676Y=
X-Received: by 2002:a05:600c:34c7:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-482db47413emr37096415e9.16.1769777402319;
        Fri, 30 Jan 2026 04:50:02 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 07/15] staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to CSI
Date: Fri, 30 Jan 2026 14:49:24 +0200
Message-ID: <20260130124932.351328-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
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
index 38bff499a8e0..36f5b7cbcd4d 100644
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
index 2b4d586d3845..5344088aa022 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -141,6 +141,7 @@ extern const struct tegra_csi_soc tegra210_csi_soc;
  * @client: host1x_client struct
  * @iomem: register base
  * @clks: clock for CSI and CIL
+ * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: csi operations
  * @csi_chans: list head for CSI channels
@@ -150,6 +151,7 @@ struct tegra_csi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk_bulk_data *clks;
+	struct regulator *vdd;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
 	struct list_head csi_chans;
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f0725312e236..c0cd23cecdd0 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1418,29 +1418,19 @@ static int __maybe_unused vi_runtime_resume(struct device *dev)
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
@@ -1449,8 +1439,6 @@ static int __maybe_unused vi_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vi->clk);
 
-	regulator_disable(vi->vdd);
-
 	return 0;
 }
 
@@ -1895,13 +1883,6 @@ static int tegra_vi_probe(struct platform_device *pdev)
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
2.51.0

