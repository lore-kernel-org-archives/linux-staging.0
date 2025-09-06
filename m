Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E42F7AAD
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166855; cv=none; b=ea0Lqza5vV/jt8B5WMcVpFin1Is8f6tIIQIQIAo1goobiSUmz3suybeO9Q68hyJQfPgrzo9xBnVL21uV2kpHQIY+7Awk3SfzdTULb5cp0p/Vc5CBgmjSUK8xSYwzR6MwBcI77bJY1L8BIK/WJBs6bUOn7vUpttrO9xZvYNoVcag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166855; c=relaxed/simple;
	bh=KdlSvSgWUeoiyYo7Qunfj3lmupp9OJT/t3CZIweNWBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9/oC7dpBuxNrIQuMz7V1Tjym0/Yxhg6r8a9FTmKAY59J6lZlh82ZnH2chNGbhKU7Ieto4LwRdf02RiHqRB1jMrxDZEGmMIaDhMzl9f6NesvptkE93ODsGlbw19i3TdVal5RRPeJmsSU0lfTWTSJKK5xoqmJQZSt77RPLCU3/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNCIOVtO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNCIOVtO"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so3255325e87.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166850; x=1757771650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ticHo2J3iHomlRkxHXHmDMnz/mVEYrKRSjwtAcYd4Zg=;
        b=BNCIOVtOIFt9ZpVlcCLWfDHTOPfryydMnaTrkVNDXZBP3nRtOnp0pk6Cme+KqMNuj3
         CzMyUQ6BEuB4hoyhY8fcZ0M2KVViVJBAWb/MvC6ZWGlv7IB+NrXngntlezV3Th9xCUa/
         FnlYFW9QKNzSB65aGdQufTaTVp2LnDedGy6VDQKVeEyFGzU6zQNA5Y1tGCOvE9cHvAgJ
         u1P/Qvibuk6CWLoMj6WiY1abX2MG2wNAxTq4WYM56NTMLxs6jrdDV8ILEdYX80kqK2sp
         LxvYJ4baUSConVBYyCMMnmCl9DvFfxxzG+1ZUmtcdfybiz9h+kOrILoLL0p/LJujJ2gU
         tC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166850; x=1757771650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ticHo2J3iHomlRkxHXHmDMnz/mVEYrKRSjwtAcYd4Zg=;
        b=QfTeEC9zKkWyu/PUbq83pXvkzB2IU7Y1tIOVYvZFQENikwSQtM8cIAV7tPf9oXvsnn
         zILIygHyvJvFsESYi3tMbWV9bOrpoT5ZaLwqTzblWoGV+PDkUsTgmTmzOmw2+VVBftZy
         o8M05/MJKE1kOxnl0RdkcwrvgGNm7yZ0uVWxeuPQhFHyM3SgQqRB5aD0C+vd3Y533BWT
         +kmYG9a0lVUetsFIfeqfTXiXtKsr86P9oUPS2aqWxxXWg+7OhXihEwuqjAARkGpoXnZt
         S4CX9t3eoS5xwglzr5o1U2WARAwie3tQGC6S9gkN+VQlDAsuaqm8AHcKoAFCwV6c34N+
         qAEA==
X-Forwarded-Encrypted: i=1; AJvYcCVykJACtV3HA/hBQrS8QS+FphqBVCGxyHA1i1Xyx+MOwtQpar2yXeOxuZKe74OMrJc+YX+fb7h2UovfuwJs@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8cyvy3RyuMeZad1XBmoEcxhPW4QZrssYteQltPvTohv88tdQw
	nsnQRbih5h+UQq+9TvMyqDn4qGM29Dg+0eQg6Rpvh/SHnw6TRohpfib8
X-Gm-Gg: ASbGncsaVsroGxmBMYDAUfeU0I4tY7UwcS6/wb3YpxICFciBvi3mkQivkKXpvQFNVlF
	Is3lxNiTu1KaH6PBCDluXMRuLe8OT7WUc4gviAlt/ejmwa2EDI0+yTmhbWAffsn7TrvDWVFNg9a
	+tjLpGlAMyskm+wi4uLWiqMIsB+U9vCBSEyiZXIXQozSctQLFeZ53jw7kCOpof0gCJ5wBIMG0SI
	BXUZD56skMcsIRGo62R4XWkA5puDwwIdagiXQjXD7eV9gzqZUWQujkL8keG7se7itER29Yi6BMQ
	TxZAr4el9mPNECHE+oFsEFtyWQOI+4f/7+qLveVRuplSTKDCtdazTyx2KREg+sbWkmjyPbdxNOb
	JzrSb7dOljqoX/e2xNx0Rsfc88v42QgwCsZQ=
X-Google-Smtp-Source: AGHT+IEraTYTltF3wywtp3NkE6/6iVWl/Axk/+8aEN1z75HCvzKoiL0+m5CBiVO5QfedG+gwNKnWSA==
X-Received: by 2002:a05:6512:12d6:b0:55b:8f1a:1276 with SMTP id 2adb3069b0e04-56261cbecd8mr637299e87.19.1757166850062;
        Sat, 06 Sep 2025 06:54:10 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:09 -0700 (PDT)
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
Subject: [PATCH v2 05/23] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Sat,  6 Sep 2025 16:53:26 +0300
Message-ID: <20250906135345.241229-6-clamor95@gmail.com>
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

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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

