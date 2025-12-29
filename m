Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9B22F74D
	for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766991702; cv=none; b=Zvor6U+wmgZKu+cNcMbheF5yo9PvjW9G0XpcU8nEHO1lGACzW4qW0fSPyROA1nx6ym/RF9i2VeA24FmZL3XwF5uMn3p37Gr8XXeImhINlFoAAf7gRfkRRO8cDvY9V93aRalo5OKDp0sVv0QmYuKAJnuLylW2Bm3ppkyfvG2vpzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766991702; c=relaxed/simple;
	bh=h2keJZQTTt4orCNWk1YI1WP1CMKaiyM8tZBdR25fcFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fkJgJZKeem/Kxx4sLW3Fyz9lUi/jJ88S+3LJ4d3BAGz9hkscs8MUYJehjQubU43yXdy3+Er75ya5CaftreOI20e/g4nI1EpMziU6a52KA9G2lV5w+jCIrvGxTBImCBjaQ96TtI66/b1tH1aXm8tep9pdnXfnLWGpET32PHHtT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKrVKqur; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKrVKqur"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bc0d7255434so5130507a12.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 23:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766991699; x=1767596499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cn1YA2jaa3c7NmmlHPNdV/Y/XHTIDC7PRzAlwxcDII=;
        b=IKrVKqurXIkzteyiYd/S+DJE4gqhFyDZar/lW5av7mJqjok7SYRiu+5kvAIisBmZ2M
         JK3gZI8LSzbPhnlRg/mlTmtqU3a7kQTOSA+J1Z5ba7ig87uL4B7LAx6f/futAx3vflxH
         xV2YdF4cbT+Ua61znf3eR4+jX85/VVFAI9gYd82UM5DKgQ7vT31i4pYTD045hVVvZ4ff
         IcOjytAahxlx7K3NcOBLXyW3UW7a/Dc4hWgaox8dEMLNBM78c4/stkTIghyQnICth/I7
         b3WwWmgZBdMSYl+raBEGqPdd/yRambaRpPZKlHBwZvgAgErcIqs7ubxgPevJyFI/66bQ
         h0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766991699; x=1767596499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cn1YA2jaa3c7NmmlHPNdV/Y/XHTIDC7PRzAlwxcDII=;
        b=VB/DSsBErTkNZmXi982aR0DxmvPn2wafYrqumV3e71RrVERe6v62t6pvNyebPxCpBy
         XCniq2G3ySFiEJmn+CoOUEipvyWG3i9T4dau+AMhX8g+uy3X6x2aj8YgzCQA/UhxsheS
         A5nquM1YRD8BVNlLnG05RoUyU4nRwk23xDNt0PneJRUeU2JTVCTQy9WxTiHTzy4aVyPF
         x0/ra1njHyCZsaa3qrlC2AncSGngs78oL+0BnJSZMTj1ak6Fahk3S7a623xcGFgAeRKL
         eL23UOuBOj4FQCidQdaEsT9mWUTon0iR5zJgqAxZyoL5wge6DZhQZf//CPwn08im9DgI
         7qLA==
X-Forwarded-Encrypted: i=1; AJvYcCU2QwIFwLGgitDzOqHt7mNyUBBMFDJuE9jrJ4tfWYzXATp3+omBmx5HdBSH/RrovF9X1pYVuh9mdUGYm20p@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/QcF/Apz5p0TM4xc1sd+wYLSkDPISNIc77eLrlixBK3SrWPWO
	16vCBIhAyFGD1vr4rFNR9kXOedwj6A9DPKZye2xk/vU3khcM+NAfpr2m
X-Gm-Gg: AY/fxX6cxeIB7lVMmVdXCxBFhWAymy8sN6u4rwfDSnOik91u1kv+FGL7h5pKpA6M82/
	dkx6cy3IHkGtjhhGzooaVnciZ/f12jAV5nKfWP34DlLZrN6inTLhYVJCqeevHPK1wRuhTrkDH9A
	8pxH5rt6sWBCGnEmG3Jr2Y+CyvcWK9jPpw2SLB8gMwqdkOsS4d5PdrDGbJSOwcy3PB1P6R2Zv9c
	4xgoa4g5s5SX7BQlG8+Cdqia+3xDciwPYXtPmeit86iG9zNBORLM0FERjYqPIOEPOjI+Lt1DF7s
	mPSmz/MZeojdLV6rI7ThO+bbXxNKCbJmsmakKwWpfvd2uVEMlt0hBCQJ6Vn8tfZQH4mBqf0Ix4W
	kO9dXjTwykzv9okuUl35xu3gJYBBNTioFvmzYPtt11twpxL+3FEvlHIxLOPKeur/24c6Out+6Hm
	et1CjcvDCRUPQmUbQHpy/4Q72ghnC4Nk4YuGBNSogbZVFmawRZ1Jlpz3FKHZUWBDSVdTYxRYyqc
	bynYng=
X-Google-Smtp-Source: AGHT+IEg54VjCsdGwWrQZg836LQ7kq2l1RLk9ija49iOphX2yVvtnRWpvx5GP4wRoVgfNEIVMzd4YA==
X-Received: by 2002:a05:7300:f584:b0:2ae:566b:1213 with SMTP id 5a478bee46e88-2b05ec74b3fmr17880492eec.28.1766991698499;
        Sun, 28 Dec 2025 23:01:38 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm73086507eec.6.2025.12.28.23.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:01:38 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Mon, 29 Dec 2025 15:01:25 +0800
Message-ID: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
The symbol is referenced from csi.c, so it must remain global. Move the
declaration to csi.h so users see it via the header and avoid extern
declarations in .c files.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..3c3f6e3fd1ec 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -835,10 +835,6 @@ static void tegra_csi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_210_SOC)
-extern const struct tegra_csi_soc tegra210_csi_soc;
-#endif
-
 static const struct of_device_id tegra_csi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..609c5952e050 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -130,6 +130,10 @@ struct tegra_csi_soc {
 	unsigned int tpg_frmrate_table_size;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_csi_soc tegra210_csi_soc;
+#endif
+
 /**
  * struct tegra_csi - NVIDIA Tegra CSI device structure
  *
-- 
2.43.0

