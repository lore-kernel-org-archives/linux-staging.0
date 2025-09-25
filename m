Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F1E2FB61C
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813444; cv=none; b=DLClWmeqbGbQJrKW9WIfFFDwe+ZwjxEVUrktahYr5XvSvid/RXMZHr6fXiye8zO7y0JopyI+w7c0013nvmHmCRNvwfjG1AWwTLUHpDev/Xl+8n0AnaLx+xQtQD/D9VY0QQ4AQHppl/uUfKYp00IvT4reyKh37VTTL0VmHeS4vV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813444; c=relaxed/simple;
	bh=sgN5V56YM4qhVdHy0m6Dz/yGVt5884z/MxNndOF+8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N662ApLhsK0xUPl8xBlISM1q2qo9PtRqmz0XOQy8opJI89vto/1dFeKwuQPJuL1XCwZUP0ykmVfUOMSnIF71yi/Ow9xc5vnMP2/vwNK6tLq+69wO+11hZAdF3TnEx2sY/tEFFu648Bimi7knrLs6NnRRoNf9zWqrtbqiyU/RpvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBKR7j3B; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBKR7j3B"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1343863e87.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813440; x=1759418240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=PBKR7j3BvnZg1n65x9uJJz5hUqF1rca3+vlVNLBPVkXXTRuujmWjFaID3N1/ogs+6P
         lj036Z01PHSSTBeOdlgylyi9LwtQZpwoVbO86FY+BVOHBRQEZ69v1DGDqJrKhKXzSFsd
         eY4/idrkCOWR6QGGr7NMdNHwRwS4/Vy0RBdrQcV2yI5bJ6gqzsL9NhPE4yvGJOLk0p6r
         hEs9/691CwV09tdHa/LDvBQf2z0IP0r9X8DD6cNDqGUwVz0Ik8qjf/jxbTIB+TeS28vv
         l7Du+/ATRz7MVhaLC45nUAxzVGzrq0k5mlyPUkbQ2P/XlsCxvIKvkF9cQtYwMmlaNjPk
         2GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813440; x=1759418240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=ZuHGDRbdKFt5JUGf+GBx3NBnuv2BURLqPFdrbyrHUMD4pQzYdrMr61wAgQPf9qVZwQ
         +WGanSXHm8Xh2waIwZUwM9vjXiq3Ppi+zlOBHDYxY1UItv+qVA+NE9GSzLpH3ASkwAXs
         K/ANlHA15stm8ECMkYHmxmxdv2evGGclmM130ykvD3Pz87uaVbRWBr9CgaD6VHt9QQe3
         GjeYLOmD5ocQsZ47ExBn5Yd6sznxS+RiY/DUclYrxSraOcwv/w2C2JegivL8hfp7/W75
         QFqFz0qiodHkksFr8Vtwx372429Oeika07eWbpjoWUcsnxUlKksV052wix0RUat49K3z
         irBA==
X-Forwarded-Encrypted: i=1; AJvYcCUCZgIJJmmsa1iCnxKGSBcSuUkFBD3AJnWLK1BzU0N+3OQhHfBXpMFGP6Bw0Owq/LA+3ML3c6TPCtyz2Bas@lists.linux.dev
X-Gm-Message-State: AOJu0YzLXVunlAdkey7zXMC/8lwYJn5xRRhD7kplhPX2tBL14gPiu+G6
	1rZWy81eG9+Qk4e3V6W95GN/pldfCSnNGmYVr/TDkHgk0enB4hbqI9Cr
X-Gm-Gg: ASbGncv1BDkpyMFChEG/XWcdxvd16aRDY5dAMDvhEeIfNgGi44Kf2lh8dqycl+jrOT8
	hKRWE7o1t5qYwUKwFU2vPYbTWvVpPIKWlZ6sFneZM2GzwBtpf9mVi1cDHndoQtCC2yssfsOYcZ3
	jTgBv07ryIt/mDXO6zspKlaymA/UiwFh4SfiYAoZJ/rHo4CXm01C2aK2x2RQec5f+M9ryG5QJQL
	Rk+o0Anmez4cwpzSJQsOl8XDYnHWhshqFfMJ6RppIb73VIiLPiw9o7KVgDUhaDzf6a9C62xRnMg
	QHsBlIjyg70rb0HTriiRgZFQHMorgaMidnz1R+dLsfRfLDs5vb66COhs6leBDyUCw1vBJIDPF/z
	EfaT0sucPhzJjnVPxWrqeXC9f
X-Google-Smtp-Source: AGHT+IF5ZI2beyyzEW/PAtDOxp+J3O6NLq/9OKReZs2Hy68TyNyWNxXVchzXa+SA2R9q+HUVhQzW8g==
X-Received: by 2002:a05:6512:10c9:b0:55f:6f5b:8e65 with SMTP id 2adb3069b0e04-582d25839efmr1072613e87.30.1758813440236;
        Thu, 25 Sep 2025 08:17:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 05/22] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Thu, 25 Sep 2025 18:16:31 +0300
Message-ID: <20250925151648.79510-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

