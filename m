Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3503876AC
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527375; cv=none; b=YFCn5PozFKixEsnOYxYyJPi8AsFaX+73cmhSVcaNgDs0rcyG8MWoAZ5Uo/5IFwxewI26BHgHQCRh0f0Os7Vf7fxZ53qS0OiAuu8KrMhC8lil1TcIIhENVchJsh1z4Q/56O/YMXskoxspoThqd2zAft+c46MMWK0pJc1kzojBbWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527375; c=relaxed/simple;
	bh=vrXA6fjKnnF+GhBdbrJNqziUBe6Qkh4RFzb3cfkVQc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1DkWbC6mCDJt/A3O5H4GqIRz/FCCjqFIIU0XHK6B/WF1RN0CfiXoXj4UWQn8LfHcwsR0weob5XgD2uI5s8CLum+Q0nWvAYJgivenuCHhqHqhcb6NmGQeQd40+Gy+9qL1JvJ1J20RjM0lzxC3VyO6BgnA/kZKlVdeh0kgm/70Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6frPfNH; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6frPfNH"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-389f9895c81so26501501fa.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527372; x=1773132172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qxgfowoWtROq2728bE7puz98E/n2zeRecmBGFgU010=;
        b=S6frPfNH19cZQhRWBROULl1ncqeS1q3VHV6ma3MU8Yj/8hgFayWfOPwPH4gkKKSaHX
         eu2Z03/q/p7BEW4ZgYXfGWsRWEvxq5YWSAE5OT+K0+lqJiyDSLPo1wXIri7aqaWUJzYB
         O+IiJsok4OFL9aCeWTvbUhERIHjGKpV1A/b6s1yLWAu/1Xkz4BinNp14ZjTTcRCESnN+
         glkzJDYcfSmaYNd5jP1JfGbIynjpHKZREZJdtepKYVtAfrekO4DPEHew/Mi/OQ+Jgx2B
         dMORbBou7lCNNGFHDQJhYg+kHjapjrhmDuD5Dc7uXgque1G4W97B14+OO9l4SYI9fZgN
         gFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527372; x=1773132172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qxgfowoWtROq2728bE7puz98E/n2zeRecmBGFgU010=;
        b=kYhTU1mZhTbTw84SG4eLcoz4XlkzlDQX9O5lRlmbn6pHKj6TIpjZlY7K+x/j+21AFs
         lGeeD1FMQrNBlgVSLNe1TGMwBzjE2VfgkponzFBmST7ixy25hfLUVxMMiiyUNZgkNlRb
         /FfwUMff3Nw9ZoMNqmfm8qMFf4p+qgwo1EflZakhZgLi96DlLTOhGfbIEnxStKUMBoC4
         rNdwCI5LrYiCJ5l8dogSn6EKOwu3y8LFLlXtjoTu557Npbwvvi3hkqAQElaPMGJVAEe2
         P/sQTcO5YjR3Y6q+yEdOCA+iFumGCS+/6Gk2u1Us6QS8uPnDIfmdm/2ft2HpMfvqhsNM
         7YYg==
X-Forwarded-Encrypted: i=1; AJvYcCUzWBeR7G5BER466T2sbwmJAZg946v9Af1VIS1fQD8f1JEBoMJsh3ZmiEfJkgDTtYPg7xi+BqcftkXTWAqi@lists.linux.dev
X-Gm-Message-State: AOJu0YxqpXPBU5fxQUp0N3AedRNBi9kYJ4eNLXq3uwD3tX+IJ9PamqaK
	bARxmv+Y4xGfUiUciK8ovDQw2F4FR8fvnBEeWk4FvowZP9P4J6pHIT3y
X-Gm-Gg: ATEYQzyA75KBhojtxE7OfLLBes5BFwxO7NVWK8WzWr8pgQ7mv6FLs5pmZgcucugTOVi
	NMNnOZF2EWtYLdw3COz1LWDZJmIJn9nuGFHIuoermvKCM27XG57KUxVgJhGKVhw3Qv77F57XeHX
	Zj+RXEdoS8HB4C09cYj+G1T8yMqAR/DXYs0pw3ZaDZeQDNKsa/i8J1P8nBfmkz9MauReyj1Sz+6
	zqJAzdCjwJzC3UkduPu7EutfIG+SQIAjJCyCw3JBn3cwasGvXbPiGJOERjH32zG8lEHCNiYi7Jm
	CvaFLLsitnUUJLseso2a6V2I1T+j5BVa24wzEYbR2hIQxR7XcL7mCHPusb/LAbhxGOVZIpvo4gh
	VA/XzSaHHF9CUF7Poum7k7LZr4FGsUbGJcMjOOV0bRPPiWUjFMblWg9Hs3tyb+5/sK22+DhZlFo
	PxwBwcgWQsHsHE
X-Received: by 2002:a05:651c:548:b0:38a:18e0:6427 with SMTP id 38308e7fff4ca-38a18e06618mr26592321fa.22.1772527371915;
        Tue, 03 Mar 2026 00:42:51 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:51 -0800 (PST)
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
Subject: [PATCH v7 01/15] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Tue,  3 Mar 2026 10:42:24 +0200
Message-ID: <20260303084239.15007-2-clamor95@gmail.com>
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
index 9c0b38585d63..a7892036f29e 100644
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
index ae1ae03fa9de..b009ceefda14 100644
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

