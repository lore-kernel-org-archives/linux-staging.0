Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79337F00B
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027149; cv=none; b=eJI+hzss17yQsZG4ZWbJ1/DEBl0t6rhhbshj5krIXqoMuI4OFqc1aGLZh9kcY4nvceDzwpdF2G36IJDrmlKAeYLyTxsINnjnAC9S6J6Y2VppoN0neVQaeBWXnie1DYyiNvkEUAFokSr9kZbzWmxhMz1dYVuynO5xU7L0XTwrtng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027149; c=relaxed/simple;
	bh=DSV51EC4wDAZAtG63wE3QtVJJqfSvUl5AYHQrvro0uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrR8vlEq4tMqTYIMzNC121nV0dxzzpQZ45zp+7jkh1AjEVZdO/rFg5KaG7PRXWA9gnkggMbfIHEcW35WbrLJmEnti+F4cAnHxk/bcgp1/cdJmM1ygtXxwxiU/e38sasqYKU+t2iLSnlFqf1/NXTAvJl1o3radE0EyZjFJaliPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz21e+nA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz21e+nA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66dd1b5bb6aso5784664a12.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027146; x=1776631946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVfujx2mt/GYaWZCYACzathtB/uLnH5k7JHfo05VG1E=;
        b=gz21e+nAbrHvcOTc609CRPG13WU6jsId/2FYSHsLFDDCJfwhWdi5YBD6ZhSlQuXcy3
         A78qsFUYF8t53m+5PxAYmE8z2hd2xBFN8T4/UiJOEJHWN2FCvegwtTX9EmuFo3NnYV+V
         q2pkloMGfJjcJmCaHgeQrlH2ffWeCCpxY+gEoY4BvkqMt4ehLZGctOXNVRVbdchrlcCz
         8dsB0VmbrSgHUAYPrntkQ7Q2i42Uf4UgbH3DjT/anVMQ1jaoUhbhPvsV5fgq32Kh5ndG
         bnI6aVFrzv8NBI3U3iMK7J9FbP5oFunaVmBOQvrVj+74LzrgBrPUIkmgmBs8JZHA+1ND
         Exlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027146; x=1776631946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVfujx2mt/GYaWZCYACzathtB/uLnH5k7JHfo05VG1E=;
        b=GS6Rx7UAeABjpJ3klRHotf4no3iBmLY4L82DeG94+3iZ7bY03WD81FEDB+qGtQaCbq
         1r35zEgV84j3Cq2p14CSWXmnemBVfgZdh5IWS00XFEHXcQxbhin5cYfhnTJZrJmO79FQ
         wHjbwfp5+EXA0rE3cCyBbRSRYCgp5ZXG6bMsXaJ/bnaQ2WZkpcT9gadedISgIRlKEBtG
         hKH78avtCJw7Jq86njQt1P61PBLsiW8xphcVb+QuAq0pqLM279vn+T7HuImjdi2h12td
         Xrl1zx2eVyC4YfNLRXETYnr3rtCSaT1GVyCLf+vERxFDrAROmtDVxSC6Avnbb+89rRl4
         89sg==
X-Forwarded-Encrypted: i=1; AFNElJ+Cqa2fYFI69zWWAdlQd3fH9KfdDSgR271+xFXbYxAns3CxQkEN0fJAoebm+gdukJURNFZrD2Oi1mubyYaz@lists.linux.dev
X-Gm-Message-State: AOJu0YwpV9fcpCA2NrJuSj4FBc9/qt+tgzBMyjlaPV7itF2jLkVzlTXZ
	y/zCPylJbrSUDKNWyXvuyHnGX0G0aKaOPNEJBpb+/B7yc/9NVvqwAo7d
X-Gm-Gg: AeBDievLgQOBHQ7lT1IUoJxW3Slc3KOq2hKrtaMoz9vw4E1aJlPtaAaDy9/bFg2M8rP
	Ar0+YfO2myr0zwG9cxsvfoZFBx9C1cD8qIxmfRlQT5+X70if2qehaj3gmn6AiC/J5f8RCosIx8j
	JatPaiFkiVN87Aklq8nJcNLiKDXZEvk0D01P5s0haz0HwSdeZw5Ruw9YsLngjfnZh4fjWLJHd+H
	PUmcwu5tYYSfCLy9lKsDuN9mz90u4CqqKTpCYRBLVOUvIjr8faEpU3xWbAMgT3pWfbEFig2VtSA
	GdhwPOAgDt3iv4J8+LQyHdL+xOtayWHU09tTIOaSkqgDitcMI9yWiGOnhLkEGUx+/HlsMiDdyyU
	8Fl+tlN9TUPchQBCbII1NGt02vUv0XelBtOrz7cPOrwrJjf+r+HDX60yv74dE2wDs4/FCfYPgEb
	Ia5VRbuZZ7xy9ceSQeXtIzPadHYF4A9liQ9mx9yUeN5feTpQ/fyFH7A5RgsZruEumPWveLLpZKK
	mFjZK6e0dj892Bg6MPAYYI88sszoS8NlxQxBKWk63POE2fTDIddZoLJXsN24yDqQQZLc52aOLrr
	RKqJ4w==
X-Received: by 2002:a05:6402:505c:b0:66b:b6e2:66e1 with SMTP id 4fb4d7f45d1cf-6707a47e6a3mr3822463a12.18.1776027146093;
        Sun, 12 Apr 2026 13:52:26 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6707082732csm2178795a12.29.2026.04.12.13.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:24 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/5] staging: media: tegra-video: add NULL checks for of_device_get_match_data()
Date: Sun, 12 Apr 2026 22:50:57 +0200
Message-ID: <20260412205057.386856-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_csi_probe(), tegra_vi_probe(), and tegra_vip_probe() all call
of_device_get_match_data() to retrieve SoC-specific data from the device
tree match table, but none of them check the return value for NULL before
eventually dereferencing it.

In tegra_csi_probe(), the pointer is dereferenced on the very next
statement via csi->soc->num_clks. In tegra_vi_probe(), it is dereferenced
later via vi->soc->ops. In tegra_vip_probe(), vip->soc is stored and then
dereferenced at runtime via vip->soc->ops->vip_start_streaming(). A NULL
return would cause a kernel NULL pointer dereference in each case.

Add a NULL check returning -ENODEV in all three probe functions, consistent
with the defensive pattern already used in similar staging drivers such as
drivers/staging/media/sunxi/cedrus/cedrus_hw.c.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 2 ++
 drivers/staging/media/tegra-video/vi.c  | 2 ++
 drivers/staging/media/tegra-video/vip.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7842104ca933..33369a8c803a 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -781,6 +781,8 @@ static int tegra_csi_probe(struct platform_device *pdev)
 		return PTR_ERR(csi->iomem);
 
 	csi->soc = of_device_get_match_data(&pdev->dev);
+	if (!csi->soc)
+		return -ENODEV;
 
 	csi->clks = devm_kcalloc(&pdev->dev, csi->soc->num_clks,
 				 sizeof(*csi->clks), GFP_KERNEL);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d1d934e361f7..f3b749f059f8 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1907,6 +1907,8 @@ static int tegra_vi_probe(struct platform_device *pdev)
 		return PTR_ERR(vi->iomem);
 
 	vi->soc = of_device_get_match_data(&pdev->dev);
+	if (!vi->soc)
+		return -ENODEV;
 
 	vi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(vi->clk)) {
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 80cd3b113125..148c68ceb605 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -236,6 +236,8 @@ static int tegra_vip_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vip->soc = of_device_get_match_data(&pdev->dev);
+	if (!vip->soc)
+		return -ENODEV;
 
 	vip->dev = &pdev->dev;
 	platform_set_drvdata(pdev, vip);
-- 
2.53.0

