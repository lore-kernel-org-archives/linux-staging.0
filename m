Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5872F3C30
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908688; cv=none; b=h1U1047Exkq/Jj4GDlNuYO38QTxkRPrRj3eoBqh+SWlHLcaROi3TCcTLxW++wsSTyqpzkU7U6Og0SwnFPhkSiumcgrKvWg1jfUtyNWrCnIH4/Xy66xuStJ/MDMVI5u6GyfVGnXDRUkrEK+Otxme7T/MpdpIDFmwXByBNUWM7V9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908688; c=relaxed/simple;
	bh=sgN5V56YM4qhVdHy0m6Dz/yGVt5884z/MxNndOF+8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmkmDS1sW7o8p2ns5IXDzwWTWa0PfIEMhVp0N3p7IoTuK9xEBqMO81ho/0ExT1P75SXFE5TAgmTb7Al8stDRmMO2A7J5ENKKTATUWhgIslveaZ8tW+tqBGFxo59iQwfqYkK/1IUNnfefP5StXqEu4X6kAzv2PvYc4g9oJDIrHa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hixoRBrE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hixoRBrE"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso8781627e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908684; x=1760513484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=hixoRBrERd/RBpvC9/CXS4+3GzfPRbtt6SUrCXuh4gSWahSIT61rYsCGblHMsPalt8
         BmqVZlD5Kppevl7smHiNfKBiBCgcynTWj6jHOa205lGZrVucsJqjpIAXtFxUpzVaBk2A
         oSyQBFTdQq2nv8aWwytg1OqCU7Mo7FFYt1CBQ9dTVTXf/zTH48WFKR6ls8SKouJGy32+
         SEg2kfXDOXe7MNjDAgIb4eTW5zMC5VEhqf0/Uzf9TpUz3US9cKARgeVNBLfG/QH3Zbnk
         bg7OPiAQ8F+SAx7v/0NAsYZq45OTTJiBp2buyAZhrxKxmV3r4meoPhHn2XPPMFDw+yre
         6OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908684; x=1760513484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=bT3THGFI1UzPhNCSK5JoD9+kOn/BgDm14EsXW42gQcG8MC4Bk0db3phzBQAn6WoLta
         F06crXROFxfxtP0z80by6+bHRNV2dbzdoPyMO7QRkGP7ngGCh3xJad+OWDRTSBTYjzZx
         5y39lm3HbYiUBxEnCcX6dBjh8nWrv3j1mYHqyRDvMxeUYUALMhyB/pWueoEbRyquCsjT
         QsQ4St2FazIEKNGGqenYOLLGJiNRL2qS8TWjnCjM0dXst8a2dHlpFt8BOZmx0o3nIDhl
         MH6Nu9GZmvGkB1+i2bX2oolR95vdEFxCWobNb7sbwq2+X7Gk/2w2tN2eAioL8RmRSv2K
         fIow==
X-Forwarded-Encrypted: i=1; AJvYcCWJq2IbdjCvIG7hYA1cUQcXRxN0QmD5pZD71LBg2hZ7dZUlGXQsI/EYsFPX+B1UVcoVT7OAdONLorIH7kbm@lists.linux.dev
X-Gm-Message-State: AOJu0Yz97ipqET/NN0xiAoEQiQl1N/t+2rEXo/rPc/ckSZTsx2u7FpQK
	ZSZSO1iuU8+1u3N85TQkYvBRqDODLGBq0K1Ex7JxjccGtyQumxzKK7vJ
X-Gm-Gg: ASbGncuQFxtZQGjJVC7EUTb4oHqQwYN6QueF8pTs0dBjLyA22X5Fp6r8/rybDkVT9nV
	/SyBUDJJgItVrgxX8Eu4QAb6lxdmknoJV8iiHyHq1+xuH0e7wKQMrcZu4B/PmSNvP2A7rSksAdh
	3JLbSpFyROPGkQ3EkQgH01PEPswkp3CzQ/sWi5Fd7Dngvz2wa+SUmMC0Cq+ulDZw+TtOe5xcoKa
	U0m5EcNgoXX8nLcLuvJEzIoUywCWmp1LnQmyuKOzSkj4XOe9Is5TzBy0Qvk+heRVjZiyZSM4NSt
	99ZI5yZGIq5dUWHHO1XJUBUWTFQioPVGwtcurbR4ny+LYgHQhxLIOFwH5V9ThI64mUOaZiWVwGJ
	z/KszKT/D41rAsQISvEhQ3KMUaTR2gTPJ7KjlyQ==
X-Google-Smtp-Source: AGHT+IEDn+mOKOkExskkEHmiVmmAHBRTPG08XJfXi47qrRyipXy27ogpWUhWkyGqIQp8qUggurZtlw==
X-Received: by 2002:a05:6512:10d0:b0:585:1ca7:1b69 with SMTP id 2adb3069b0e04-5906d88b1d3mr616741e87.13.1759908683479;
        Wed, 08 Oct 2025 00:31:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:23 -0700 (PDT)
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
Subject: [PATCH v4 06/24] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Wed,  8 Oct 2025 10:30:28 +0300
Message-ID: <20251008073046.23231-7-clamor95@gmail.com>
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

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 2 +-
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 2 +-
 drivers/staging/media/tegra-video/vip.c    | 4 ++--
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..7c44a3448588 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1956,7 +1956,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..6fe8d5301b9c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -123,7 +123,7 @@ static int host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..34397b73bb61 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,12 +263,12 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
-- 
2.48.1

