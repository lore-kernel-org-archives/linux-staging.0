Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE66389452
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527389; cv=none; b=cYcE5o8wjH9aE11Pl6DpAfoLFF14TZqq9XFo+pIdL6Q/3Skll8Cr/6iP3xDWBNl1/5HXsK2IFaWZP4S5+zyGc7pvDzvAYxwL4azzaPpHDQ+JFb3mQ8JkAqMu5y8NY5MzYQq2/XSbRecZ+DnxyK3b30PoycmYwzmtry6FruGm2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527389; c=relaxed/simple;
	bh=QID8cbxZ0p/kYB2KVrtFO1HT+HJnaLuoQsjTauVelmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+HsSRMSSJ4L+1Zl6iEueQuoaCveq64GdQpDbgS3a6qIOCqb6a1RDaBI0YzrGV2HzMll58z7ZgHzcJWzrOjIizjz9GbOUAmQTbvB8Riqb6bMVzMtj825Q0mdEDl7ljOThhl5hqVXdWbrU16mwQym8pHvwEW1TIN10206UjlINsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUp4BiYe; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUp4BiYe"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-389f9895c81so26504501fa.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527380; x=1773132180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqEeaetpkKSpqDc/1afFvsBhHX5UV9awkVwQAYPdPEo=;
        b=FUp4BiYe3hQjEMo/OTNj7achFuLurCR2JE3mERnYH3ZRHuJDA4kJ3Hqy1tiNTwmJ1I
         ux7LL5wZfeQntbTBi76LKejhF09yueHdH4TUjQVW4wmFSaKzxFdM6P8kTknx0LfMjlSU
         q+Dg/qvQgh3I72dBq3fdbJyswEIgsapoRsX99QUEbGvETG75TwKrmvzL8O7YoHy6cGcs
         e4QA4oM/IxrL/8PIh3nuq9oCal2djUWoxiK/l3HdKu3uauQcKpp+uexYXOfvnurNOdHk
         HsItrLdx2khyae2DfHrDveexgGq95msFt5zujFbePPrxGtt8N760bBvr5WRR1jjS2iAN
         MuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527380; x=1773132180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bqEeaetpkKSpqDc/1afFvsBhHX5UV9awkVwQAYPdPEo=;
        b=rLjTsNfJRVg4GGB65t2CNtGnmGwuPTPW1jeRHiDPHjj1dMbHqQhtMZnu3ZaIB6kX1Z
         1QQZLn/Y65jBR9bJXQD4U9a3OyLVMMRQvbEuBl4lEYDG2IrzEBAkC02nWHYlKXnsjQmW
         98dJGV/Zlk25r1iiiRTopxfEyylxKgyp+XAn7OlhvHc52TdAYLJFMmmUGLODApOgFec8
         2ELGCMXUKj8QTR82FaC79nRUnechUqRREjV9glxmAAu3cmpacy9svAPq/94QpkxVcsTT
         3qvFA+3YdwAYv0924Jo2Yb4jtRR8Qg/8YewTn0KzJPef+OO9eB5cf6YrbdfsU/hy4XsX
         i3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWsB5Frx5xwIbIvJyNGbYUMXTSgfdtEE3jNf3XrSGeWfGgGQ/W4c+9F4wTqf5kuPgv91vLRCVu9T0QCKcyp@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxn9gsXReOfgSpTPmnPh7IGCsVJtC9YGWf+tA3zQPQEW4epQv7
	qYnFtZtwl+Wpyxp/ccrIx+UqXC/Z9H6MkjsF1E2HwejD2+TbfMfs7voN
X-Gm-Gg: ATEYQzzOcR78YBKABGwnL7o8bWwY6YsAxkSjo2UfJa04AJnaLzs4OuUpBWyZBwTI5ve
	HyG6uHeyEsmrcsW9PDwvCMLD8SAbEW6EEOeESr8s+xaO+isb+uDzzPPzjFO9PpuGqYJptxwKSGc
	CAtiEH7DGEN33GBVd4Xh4hsxuHCWuh+YDx5UJ/uN5AYfBcXSd0Nzl3efaGikbnCwwQ8IQpL6C3i
	lHbWDHpwbBNMSQbmWP1oJI7HlQtWYE6bxF2CjfB+sNVxeycL3faQLfiPUziaBrCam7HUHmN7frQ
	RNKmVRycW6isfGlyQHtUqKHRR30XCGmjyMTozRgAqr+LD+5bmhhp8qNF4/kuu/hBx4qg90dBAqJ
	WoJr9F7O68Vcz4YxKMnAHiOloV5iH/sTslKvx9lfzUCH9EbvGDYrmdg++r2yD+K3hS6RhPUgZE6
	Fzyo6UsAkgZ+mV
X-Received: by 2002:a2e:9e95:0:b0:387:cdb:9b9a with SMTP id 38308e7fff4ca-389ff3580d6mr88804201fa.32.1772527379909;
        Tue, 03 Mar 2026 00:42:59 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 07/15] staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to CSI
Date: Tue,  3 Mar 2026 10:42:30 +0200
Message-ID: <20260303084239.15007-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
index 92078a1f9a4e..c4d3514f19b3 100644
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
index 7032c733577d..f14cdc7b5211 100644
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

