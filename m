Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5AE34C13A
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142898; cv=none; b=ozyiPtPK9woDQ0K297MOzgwimW79AEOpc/cCzb+aG7af0tTNs9d7r1LWCAFjcaiE9D5SUh6WpgRK/P3pCzVIXAnD45Aa3yxcfB9AgHhQG8U84t/kP0yVm45sSbmgEKJv2fhZTPFGjykMs7yOS/tE9CL+JkL96VXlHPKzNumfv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142898; c=relaxed/simple;
	bh=sgN5V56YM4qhVdHy0m6Dz/yGVt5884z/MxNndOF+8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPY1ObMluS8VB8u1au4W00BkEsq1/iNHG9gvb6DEndaxEX20irK48ecapSNXkv7sZwJVi1k+Fs7P8x+rCC5+286HfBKj+VqOXnid/+lXIkPjbmLeWzRcJKc/BgVdgCEnuk5W9q1QILji60xW0P3kE8jlC5Fkkl0OCXUQINGX+gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddwimJsN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddwimJsN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-471191ac79dso60286955e9.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142892; x=1761747692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=ddwimJsNztxdzGC0hFjC3rNUwR6Xyk5UmUvNu/DB1cOgZLkrTSI73ERM+K35OF2woI
         E+SQ1hE5WMTtHcW1m8/rLz5ZYDEgGORKm8dy70xSPQRh1Ur/GzwYER3KzeeJiUvTti8v
         yLrUUEmCGoUoSXnrB5Dl2YhHVIQRaWQ6pYaQ7TPSiE55JtPyAUB+g6sOS8NRjX6aW5vF
         pJlDNq13W8PG57Ru6F3+79iJdY7HmHh9QXiquwwA2Ig0EExnishN/qpQFsHk0CO/FuBP
         M4b276bN4KJvdP21j1KL4St3xCTqdnJaTfCtGkuHUkkx112Zc/1gZ6vuDLlF7d5JpyxN
         3c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142892; x=1761747692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=EzUpwxMSgsdu1zeKmyOh9ovVIn8dgD7KomT9C9ZTi2sxppdePlAfb2RJRfIijtWu02
         vkdCc0k4+hNxaRNN1gAiu/zZeZVQrnQoMS0+gyujLOAVx0/oisXENPCNNtgVavJi3iWn
         hDymQKhOOts4zHdLr5L2TDzaLJoZRR3xHOOeh02vDjUZBc37lHJIM8/iHkV4BG97oJH+
         9NfP1foSFes7ypjXQEAppzEPq1cTDwyVsH/xX9dupBrupoK8EWXDf+iMEi8XoJDL91cU
         6XvJ9bueAukHs5Ckh79HBKCeGUfKwE8YqgFij7K2pjEcqLqCtBLoyG3fghMNr+wdXYyy
         eAhw==
X-Forwarded-Encrypted: i=1; AJvYcCUSxcAd6m4sv4T6Qq16pTh57IbXp6B3tWmgHmJuDke8plA2GXwQGouIwa8t14n07buaHGyUdE52aCqnFk0k@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5aw7baLqYJ6FXrDXlT2wL2pk6vEGcYwl+Ubc0H3UdIG2sXHSi
	fGTPbgvWfzGjtlUQdmalOy8QlM4kCO+9BzIfNPARAiQjSE4Zj55P2HDJ
X-Gm-Gg: ASbGnctAvyuioQ3gF7Y3fST1lLYO6g6/uU3OOK9naXI6lNFuCo4QXMzow+vFFBm/TeC
	YwiypVXO3bh30xWoIPQFVzz7nlbE5pa8AG1DAYbCpFrQux2qCafgITCqXXuZX5hEHLYNXXfUPiM
	Gm0KeflxxUlxwzOholarWIOMU7i60EcR5sCuhPWtJVGmJQyO6Jx3xdq4t5abHzu1JdYbVfxx2co
	X+9w6JZUuHud3pRz47WBQHMgYQK+6LBVxVSoDJeo+pgqfzOEOHL7KFQa1Wj0YGwPGLMOO8FMQEI
	/Yshe0x5EAm0AGDA8XZYR4BnVWW6WwuKPv6e6WpLpXiX4GZs5qH3aNFcyhiqpFrppiIKW/G5s13
	BC7whIz0lkHhvgaHVdSQ4Fjc0Rhr7+T3D5Vl5HDymvQOWRHyb6ZnCjbDteOID6jGO6VlGGF7spw
	Mo8molRctsoQhL
X-Google-Smtp-Source: AGHT+IF+82cvX09pMZxWI3kQBEfe70yoMhjWZgKxMgHRV992x45EZGsBOAfdIq28w0jPz4jSk+0d/g==
X-Received: by 2002:a05:6000:22c6:b0:3ec:db18:1695 with SMTP id ffacd0b85a97d-42704dc9395mr15346109f8f.45.1761142891534;
        Wed, 22 Oct 2025 07:21:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:31 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 05/23] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Wed, 22 Oct 2025 17:20:33 +0300
Message-ID: <20251022142051.70400-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

