Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1433A02F
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605814; cv=none; b=sBwhQYeJnKtGCMB2opx+ara4G0ptVxa18FPXgfyCfI+giGrDW7z9z6bxu8W4HXtUQPSFCVjKmjzB5m0y5dzlRA/EjtQA2BWkx/wN/RBVu9rVYZvbLisKN1Pdm8KmB273o3U1oZgStNfelr4qRRAppTRn6WnO5pT/Sd7z+oQs3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605814; c=relaxed/simple;
	bh=Tr+qlF9CCfeobNfcvFCe0mBkgSd+LTHFlpz2ygDhrEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYnbIsuXo9JJZxr3LbrLkInDB/7YSG6vZhSNTQNM62Y6AS67qwdY9fwnNhVBG0QdPX22r1GIw6OQHq2bYkIH3c3SHuxLuGNtEtAGvoNnTHy0atfGcAiu3OyEl+bfZGtca8nBnrmtmBXORiz5/gXzNKM45Mo6rMh4w/+saofnJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtiXKIzb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtiXKIzb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb79f659aso788156066b.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605811; x=1756210611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flb6InEp+Rhz/Z2grT5FKfpHtbQ47S/+b9t1ySuxxnA=;
        b=gtiXKIzbWln1H3HlvrfNwIO4Gt7oWZJESFgag6IFBwAtZmvJTITXvv9P8BDQuG5Rk7
         9fuoYAcGjztBdmuOuyO8wPIDBoWHH9N3nlaC0JZMio0e6+NVSBe4QB0++mtF8o712BIk
         GiRxRuifNaur3l1mbvw/JB+2JkTdoxl9Tkg22s3wzITW01HnZy4K/Q6iAju5HREw3F9y
         WTLlROBR6IW2h8sJo6Em3pfX/K6AiOcJwv/h/5QB8TjUKMA98DXVx4SRQFli0k0WvguJ
         jKcmWTSz6xN/Q8Gn/rbyURnSc8sHvrl7rI7QavDBklJrdMTDtcXY0OtsL0j3wETPbO8E
         Aa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605811; x=1756210611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flb6InEp+Rhz/Z2grT5FKfpHtbQ47S/+b9t1ySuxxnA=;
        b=h7qhx7QlLf7syqOsMg+gmNOD1JUPxulj98ojAZUhlt0T5CWafbSfcj0cO5sT/1Hxgh
         EiX/t4cBbgLg6S75awu+uCL5ba5q4XdHhXvpTE4rkoal3olMEXNhoatHwy9jlBlE38bt
         LnQgs/1RmzJoovGKl/UtQ4wDmEM1ssDXzvuD9T7urWX5dcmk5mS/swSwvQFSN93vP75E
         IVi1yiHZQZxKaaDCPMEjEPIg+55zzd29Swt6oGpUpTI4FqG+h+jTIw8kk32+GQkELT7t
         eRJNPd+XZAP72yBCPkPL9YGhaL3P/ZaL3hJDnj89f8H+KlOh3CvWwKkeZXUbl11C36DB
         vCNg==
X-Forwarded-Encrypted: i=1; AJvYcCVEwHoXCkIWNXuCgGFoJA6B/wi0d/Z3bHa92mvsgr8/HslZlMDV/AMWzt9spouGuMA6PYFgHPzlZBzyozPC@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv7BwHo5oXojsgCV6VB5bKzmYzDGbK5HYxnXtBAjjTvCTJNAxy
	GJQTNctLVVRzonKFoUkWqi7HwlCPxabDi8HB22ccNA8mxFQOk6tx+/4/
X-Gm-Gg: ASbGncsSXMy78ZSoHw3dHEwLqPNY+H5Dq8PU1KMqZeewdBebiuyAgojHMX/4IKOpx4z
	3ml6hGZ9IBYweyKyFpHOAsP/l0yNzxrUk2Hb9WzAgvgdCuXTslAU2x/i90M4Q3KB0iDt/ghqsRO
	GqVifyKdiP740DHxxtv7INB+22aC8/dfy2TvfpCYdNoKz3Zdv/cpYVDU/8z/kgb4PX48Cyai1Fb
	txIySSw6/rc779q7IDuZpiIyMX8sWybn80R+lHD/nPBo0BXC9RsX2zbbJm8ukPTl8I6SPMUpNeG
	q12FpzvI657i8c7LZAj3yZNApa0dsjK3Kn3hrQF7z7sBGlqeTbDL9pI7IyA82iczFz3W/Pxw4Rp
	gruTb98efHn/xjQ==
X-Google-Smtp-Source: AGHT+IEXOXhJ0hiodB5SHvqbo00ALrsk+5peNPZ+NBwXvS3HlKGWuLTRmhWK5ct+hfcLkurIUQXNKg==
X-Received: by 2002:a17:907:3e9e:b0:afd:d9e4:51e6 with SMTP id a640c23a62f3a-afddd25a827mr222294066b.62.1755605810477;
        Tue, 19 Aug 2025 05:16:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:49 -0700 (PDT)
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
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 05/19] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Tue, 19 Aug 2025 15:16:17 +0300
Message-ID: <20250819121631.84280-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exisitng VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 3 +++
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 4 ++++
 drivers/staging/media/tegra-video/vip.c    | 5 ++++-
 5 files changed, 13 insertions(+), 2 deletions(-)

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
index c9276ff76157..71be205cacb5 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1959,6 +1959,9 @@ static const struct of_device_id tegra_vi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra20_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
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
index 074ad0dc56ca..a25885f93cd7 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -127,6 +127,10 @@ static const struct of_device_id host1x_video_subdevs[] = {
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vip", },
+	{ .compatible = "nvidia,tegra30-vi", },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
 	{ .compatible = "nvidia,tegra210-vi", },
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..00e08a9971d5 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,13 +263,16 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
+#endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
 };
-- 
2.48.1

