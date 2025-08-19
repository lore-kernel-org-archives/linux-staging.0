Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DF5345759
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605826; cv=none; b=daFifcK3ztq3KhK/LGBTEGT/0xjb7NXB/uTqiE7/4ph8jRHmnH0hZ52I3kjsW+ml/wWX60rCyCStb6TAwyZg8KTdIRZPjRrbRenSQYTNw1yCY1WxR6ZqYtp9pE0hjzOl7yDoBqfH0wtUpuUImGxO4cNsPT+4rFmlC8n1dodZK+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605826; c=relaxed/simple;
	bh=A9t86rGpVySjyq4/FJppXm7S3ER1Y8c6X6OjQIOGIlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nj3ZpF0SQgmvOqSNVIDfud6VYYNM5QpupgzgePvE2oaWwZ+Ix3QPQC7yPS8RC5lG5OD40EvWBaOxL+YR/ypgzcu0AFZZYtMnlEPUkO8j/G2n6CDqg85y2yf91GVEqOMgzTqqrPPbgYRKa5ccz8slOzW6AmHXXVuxuMU4HbnjGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dL1rGGrr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dL1rGGrr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afca3e71009so918475766b.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605823; x=1756210623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7nPdsPtcAgjunV6X7jhJIj/ZKqq5EgnoWj7gjO7V+Y=;
        b=dL1rGGrrlOnHv9zDMMWSHr0nnEafjncpeBExaY+VrOKtbEU1Yz/QiuLZuYh6mW4Vof
         iO+JGF0+nquPegtTtzVTfjEBmBkdAiVD/tO7KeISaYeMxG7txj3Je3fHx/b17iq2hLCs
         +RzA1Sua+mxIEIog5neL1osOcQIqMNvyvr6ghcIXFfdgkFze0JBpJ7KNhQc+lOb0uI8w
         2qL9Qcy0wbTcC2WzRXqy7y6iOOcDwpXmrZt7gYs0IN+U78N4HVu9jxwqPrFs72OCZeJu
         7Guu9N7qPJtFtagngOoKVf5/bAMf/fb3aaYsR72Q0NoAwyTCbIvKqwGkzEUPFqnGJWGu
         53NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605823; x=1756210623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7nPdsPtcAgjunV6X7jhJIj/ZKqq5EgnoWj7gjO7V+Y=;
        b=OBiQfEtXlETsUiXaOfup8is1vsTvw3e6nibs655R4tyFH4PGVPl83xve4tEmBeRg9g
         f6mGT6F1GqRiMrTyXSYSYTYSXXnY21WH/ivY/orMTwyEyBA5agFGqjmbxmPq6pwgGCA/
         Gkld/HN9+Z9etj25FibhD4ALeqfS+AQlKo99BNj51mdKCOZrm+rS2BL6/ZiIIUVOEREd
         Vqq0og8TPaQA8OvVIGQKWhIzf7icUVVgqaw8fsH3kuKW++BJ06cF5cQraPWrFABTtAgl
         dYKCqxdb6YCUoUav0ja2KkNLbnuGty1AAKwZvjU2YYjXRyUz/RXIAwwEGadrj472aWK9
         gHkg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8qbzMEJSZ/3LFDaUpFcWPDIe1dywAyYFWi46TDfO1v6D+8COs/pbjFQvGAt6wbST3/mlvnl5oNcivqrQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9AkuLSnkox58S0Vjhzr0X84DAusR2Ad4CWjghbjRP+GCyUNe7
	rpcVi01D7vl3/OgxQFp5jpxch/han07Xf2tG0ejWB6a8xQMqJ/q66tvF
X-Gm-Gg: ASbGncsNt4JIMCm7L+N/x1opN+kUM2yB81VzFN3yPG7yInEO6Ooj8qMAlR8nMD2/5tu
	/WRcLWhI5D2AV+BIpJ0WOoRZ6KwKU2/AL/1PRcdScWIotk6UJ8ZhL5nBWZwsG7Kkf6MJxobyo8O
	6fWGCL74oEpeAcGZTQyoCT+oHfr8tV6XGR3ACAnZ+R4zCEqPM9nvbl5JqS5V7URoJZv8FU7DRmw
	eLBzr0Wta/Kv70YsF6E1cfyJi6VmU8koMeVFUehjZQqE0DAjKyehZtImoFwWZIcAcgAb0wOPyGT
	nFOejV0RF2t+YJm4SHHKPfCKUzmRhqGDvFHjyWLhq3YavKLOyhXOUF6u6iOZF2XDlVJ7Ac0fwI+
	FW5Ppkpjwd6rPRg==
X-Google-Smtp-Source: AGHT+IEI4wu112muy0eGgPKtJeKpcn9FInkstfnVtc9qNv6q6tgCe+us6rrc7oSTRUrJxnYtpqfh7w==
X-Received: by 2002:a17:907:86a0:b0:af7:fd29:c5e4 with SMTP id a640c23a62f3a-afddebca776mr252056766b.2.1755605823220;
        Tue, 19 Aug 2025 05:17:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:02 -0700 (PDT)
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
Subject: [PATCH v1 12/19] staging: media: tegra-video: tegra20: simplify format align calculations
Date: Tue, 19 Aug 2025 15:16:24 +0300
Message-ID: <20250819121631.84280-13-clamor95@gmail.com>
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

Simplify format align calculations by slightly modifying supported formats
structure.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 54512d1ecf83..735611c3c47d 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -279,20 +279,8 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
-	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
-		break;
-	}
+	pix->bytesperline = DIV_ROUND_UP(pix->width * bpp, 8);
+	pix->sizeimage = pix->bytesperline * pix->height;
 }
 
 /*
@@ -575,20 +563,23 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
-#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
-{							\
-	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
-	.bpp     = BPP,					\
-	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
+{									\
+	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
+	.bit_width	= BIT_WIDTH,					\
+	.code		= MEDIA_BUS_FMT_##MBUS_CODE,			\
+	.bpp		= BPP,						\
+	.fourcc		= V4L2_PIX_FMT_##FOURCC,			\
 }
 
 static const struct tegra_video_format tegra20_video_formats[] = {
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
-	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
-	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
-	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+	/* YUV422 */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.48.1

