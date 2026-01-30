Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897BF37F0E7
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777399; cv=none; b=Xb5Ch+wTiLgjRBIZo5kXkJkv7+nLQiTubaZJL/NdClbPm3qJld8XNr1Nj4QnpCW8yccJDhYZVZKcYpmd9oPFevBNX1sXt18zoine6Y4JC2eOwwuskk/bJvxeImK9Hq8eHY8TZmYHSMQuBKM9GdMAjtX5KQlZxszm6Ybtf9dzjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777399; c=relaxed/simple;
	bh=To1d/zhAMJHw605taojXaeo9SAKZcoKeQpcDI3cxW/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ldzm6uiC4Q7Adgka1MDtaf5DTaM2TotO6tOlgs5Jbf2SENpbpbmMY7i7ajM902Yafscb7F/heRV7U3hCsqcGgBLu/xNOE5ZRl1RpFpkJERVxy2tOa9eyHyNIm5QoRS4Ljvaidz0fbOtthIRUI1DIiv0JMw3KxzV+flSKjP+mN9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZYUjsdc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZYUjsdc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1161940f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777396; x=1770382196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe8jyxD8htr2t5lhKuU5l2a42gpBrpfOGyfYmkBAV1Y=;
        b=nZYUjsdcRzULy/Mctfmg2smTwTlpbmhx8f6SYamye9WrT+IN9IEjEtnamMmqM78PP5
         fqGszS3t/6GT7haVanPs9zHymF1KlvNSLwe6pYCSDiYX16JbuFZcZP7H6fT5MS9Drk/y
         f0LOxZLdZl8xYUUxqjTPn5MOYH1wf0rQvlUzieL5sFohYiQVOCB8mFVkPL2vM+XnIQpI
         M6/9aqZOygf6MKcjq5JFYAjhNvtW0Gnjh3FX1FsI6p5EsUBIArgOOnJHF7+sF5uepCdx
         9zwDpUY1J9hx3Euto/5Ep25PNNn6rd1nWcKXL9ibxnJ7BNAajnzyzRfq0HMwybjnoO5H
         tOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777396; x=1770382196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xe8jyxD8htr2t5lhKuU5l2a42gpBrpfOGyfYmkBAV1Y=;
        b=Y6tNtbbWL6Ge++X+7x6ly95Yn69MT64QNDVV54Bb/kRKejCUNMTh24wGRB/oCNwsT0
         TrfwUlFFZeF0o+U4Bk2RIMbZa4bP/b361Y1D3X20JH/t70+oN+IEtoTCHLz2d4cdQ+ue
         p+Tgb2lmTEg7p+JKQZHaBma0Jq7hMCis9Q/oAgR1lmICqAMF6xS2XMwzNDYvCzMFOHbs
         0GRHrVyybeIr4AocxC8VEI5az+TU05NBiiRAaS1nTl/yqpg50wzkvhkGykn06Nt4bOhy
         Pux+1yp+ExM142RnHlST1Ofi6at8oBkfuSXF7HDwWwX+dpkHSjcyQ2JGoFYx4vzaRgZU
         55gw==
X-Forwarded-Encrypted: i=1; AJvYcCWzSog5ES+2kmZdIy98MYR+CAGtNvnwABWl6mLKPLO108Ab0REwmG3b/G1BqEwakjlFKTfTqtOpIoEhDhE6@lists.linux.dev
X-Gm-Message-State: AOJu0YxBhU1azPiN3hWV8ccuiOFWvYvoPyjQIUaaSkTtxrQitE4raaqd
	v7mLqcrvR4kDskozWStoV+c2r0sQNfpmok3qcuWFYOfrphPVGtHjJhUh
X-Gm-Gg: AZuq6aI+IpJMTMd8sgp09mjlV/NMPgYovDOLcKlUSYazny+2mLQwIEvTkEAbG+kPIDR
	2i4bcl7BUdFvcn7tawACyBGws/VdBm1d0LL6HrXiQDS8rDVguATGsJSAe6v/SAypz4x3W4CXfTk
	phYkUE4KeLMIelFh/FgtExXbYJN9M7tWR+OyinwSvl2m5jzUa6W0F1ygYFqjqQKq2K1Jy8dlWWw
	yF0Un4l67zADdWu+VhPHIoVi42AjInET1bs7yZlq6w0cfPTUB7RwnUtDR9H62E88DDH28fhIkJ1
	iUPbJYHHuFvCRP9jKSf4ma9H8cdWdYD7A1zbraap/qXZ2GP0P98GAhkpoBKPKoUahhcnH/Y/11U
	FFOxdJ4BXoeZTz8ByDM45U73pzGfQp3SqqTTi5sKss5Fa5o4i1/Mg56B6Ikp/y4aLVltIaNvx/f
	5E
X-Received: by 2002:a05:6000:4285:b0:431:b1e:7ff9 with SMTP id ffacd0b85a97d-435f3aba7ddmr3579193f8f.59.1769777395701;
        Fri, 30 Jan 2026 04:49:55 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:55 -0800 (PST)
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
Subject: [PATCH v6 01/15] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Fri, 30 Jan 2026 14:49:18 +0200
Message-ID: <20260130124932.351328-2-clamor95@gmail.com>
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
 drivers/staging/media/tegra-video/vip.c    | 2 +-
 drivers/staging/media/tegra-video/vip.h    | 2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

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
index 14b327afe045..4b80086f8c05 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1959,7 +1959,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
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
index 68783d5ffeb1..4aec2ff9a69c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -121,7 +121,7 @@ static void host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 80cd3b113125..9ff1f1750a15 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -264,7 +264,7 @@ static void tegra_vip_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
index fdded00447e4..563059cbf5b5 100644
--- a/drivers/staging/media/tegra-video/vip.h
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -50,7 +50,7 @@ struct tegra_vip_soc {
 	const struct tegra_vip_ops *ops;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
-- 
2.51.0

