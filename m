Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D765530F558
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813465; cv=none; b=qdGS95FTZmfdWWc3nF7jhljQVXi63l1JOruHzrw7aTZ5QRPuRF3R7FDpow0cD4U1VU5WciLEjVoqAMx25kLiTIdJZbQKEtkQqaM8KcGxl43ZOQz+QP/NQJ6LEA+XVAKkIFZyZlQtGUBYGDZFsSDxOJuPJypzQEU+j87GY29mKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813465; c=relaxed/simple;
	bh=Cd+31InyjedttBn2jPLwH1b53yKe5Q/mKZB/CRG/JDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sr7Yw1RsbXOMqy4te/GxpOrq1173e4QbyeMuK1hJcqNezgWjofb5R+UQgon+SDQKEYdy7C8OUPCF1HiuZgtGwPcuQF4Y6RANyH/HCQyGrCzP8Bdd2D3SMHSEqr03t/vxUXvNqFZkBynj9BWbxCUp+ZZ66BiqC6AkmYE8/DdFWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiNVUJEx; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiNVUJEx"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso1371767e87.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813458; x=1759418258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8swc3KhKVsBZovpQQIlz8qOzKsdH3lFJ6rE9nIfvYyI=;
        b=IiNVUJExIBXXfXaquTP8kv7EiQXb026z/nfG1qZqMOeGaz5TQZCbo9yRY3utSLFymm
         wp8UAo3tOhIqYOt99baoS7bg/Z3jbEJQC3eIh5o9R+adbT9dtb3KLHoR0mFcP8scj97G
         bHlcM9pR6tnvPpEqc+3a1xA2mjGEsPabvL7VrYmn0j6HuQZu/jVHLXg31CwI5/1iSaFJ
         ctJjVizaeYwGLkKfOKVJrKXznjWWGvYFH5qaf/GC06sLeZxrOLC6ZtmAnp2B4ojbS7MJ
         aVNp2egnCy/XKPvcxVr/9JcRWlVczPtwrtqzCC+WXzHosNrZnt9ZlR3xRgdGwuAjn7SN
         16gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813458; x=1759418258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8swc3KhKVsBZovpQQIlz8qOzKsdH3lFJ6rE9nIfvYyI=;
        b=O+zdXtOaM3W09nJO5Eev4Gnp1yQNzXFCRxx6V7KgYKkJpjvwvIRu+DAX1hdNZHXHIt
         TXElVKjTuFT5gPQwXry4ESchQzMTJ7QiOZvEQyEnjAFx8nPwOAYg0K5Qc/zOyNBbaqte
         gl4gCV+iOeTFeLFedAuevPZTnZdt1hFGtVMJ4JLA4xAbrb05kkoIFeUhRz7rtAKOSi53
         9V64ha3v2+D+ROYzpXeLHD43yo1B2UHVEPlXoJEct9jSmZbNunIhnX0wls5CwMguLLoH
         Z4lIysbNnVMr85O0B4yu1/94S9RRQfr9CqwaVNwsCOfVnut+E8sobcPMZ6S8eVf8qiN3
         MSMA==
X-Forwarded-Encrypted: i=1; AJvYcCWktmgq+ax586+ffInzcO0crD2ojoW3s2Qkyi+pK1Hsrd1sxvA/HXWyowXMfPIiFO97knDAOWuB7dcP65bR@lists.linux.dev
X-Gm-Message-State: AOJu0YyM+iIAfXA1R1bvT5YkZ/e4xHKDLyt6bG9Uok2t+uA+wE0j9ajR
	nNaOKuMgpkf/2bpwGp9J+8cjor6NAVvVfOfEONJ6inZaEZ76I3U9DRLr
X-Gm-Gg: ASbGnctJG5ULN8o6aXe2biWWRGUnryXyT/EAeebb2yQViXfvFU8vu2ZT2LRDbWOp9cN
	8Opi8YxDIJygjnx5wNgyQjEMa/nNzkjHz+d6dUx/uUNBVkI8Fzvj9tdBz4F1cjysORo0LpYz7jI
	JXM1BNYTjdoLlysLu6lcobxsYFpgIeH3pC4McNkROqwJIwSzJowR42sxkSZVu4OctWEbC8Rf6ii
	0JprlET8qcmBOloDiL+cnQdGllKWfCKY02CX5RF3ga4mFxda1MhHVtax7raW/l4whcrSJ5Oh6hA
	RrI2npSUdrQY2DSM3gi1zJv3l81EMXut4MMM0t8uI0BUHl9D2EBic0GNCB/alNbvm1VxQO9hXS7
	+ceplvBofy9iQwQ==
X-Google-Smtp-Source: AGHT+IGaPEzbqVLifBj6VMV1u7ov2ufzTFhND39AMWYuMrWlxeUCOc7nQIX5EVr4wX9P3chS0k2O3Q==
X-Received: by 2002:a05:6512:1328:b0:56b:1f30:6734 with SMTP id 2adb3069b0e04-582d41623d6mr1140908e87.54.1758813457759;
        Thu, 25 Sep 2025 08:17:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:37 -0700 (PDT)
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
Subject: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify format align calculations
Date: Thu, 25 Sep 2025 18:16:41 +0300
Message-ID: <20250925151648.79510-16-clamor95@gmail.com>
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

Simplify format align calculations by slightly modifying supported formats
structure. Adjusted U and V offset calculations for planar formats since
YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 planes for U
and V) so stride is width * 3/2, but offset must be calculated with plain
width since each plain has stride width * 1. This aligns with downstream
behavior which uses same approach for offset calculations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++------------
 drivers/staging/media/tegra-video/vi.h      |  3 +-
 2 files changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7c3ff843235d..b7a39723dfc2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
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
@@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 {
 	unsigned int stride = chan->format.bytesperline;
 	unsigned int height = chan->format.height;
+	unsigned int width = chan->format.width;
 
 	chan->start_offset = 0;
 
@@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		chan->addr_offset_u = stride * height;
-		chan->addr_offset_v = chan->addr_offset_u + stride * height / 4;
+		chan->addr_offset_u = width * height;
+		chan->addr_offset_v = chan->addr_offset_u + width * height / 4;
 
 		/* For YVU420, we swap the locations of the U and V planes. */
 		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420)
@@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 		chan->start_offset_v = chan->addr_offset_v;
 
 		if (chan->vflip) {
-			chan->start_offset   += stride * (height - 1);
-			chan->start_offset_u += (stride / 2) * ((height / 2) - 1);
-			chan->start_offset_v += (stride / 2) * ((height / 2) - 1);
+			chan->start_offset   += width * (height - 1);
+			chan->start_offset_u += (width / 2) * ((height / 2) - 1);
+			chan->start_offset_v += (width / 2) * ((height / 2) - 1);
 		}
 		if (chan->hflip) {
-			chan->start_offset   += stride - 1;
-			chan->start_offset_u += (stride / 2) - 1;
-			chan->start_offset_v += (stride / 2) - 1;
+			chan->start_offset   += width - 1;
+			chan->start_offset_u += (width / 2) - 1;
+			chan->start_offset_v += (width / 2) - 1;
 		}
 		break;
 	}
@@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index bfadde8858d4..5cbc0606ed6c 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -281,7 +281,8 @@ enum tegra_image_dt {
  * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
  * @bit_width: format width in bits per component (for CSI/Tegra210 only)
  * @code: media bus format code
- * @bpp: bytes per pixel (when stored in memory)
+ * @bpp: bytes per pixel (when stored in memory) for Tegra210,
+ *	 bits per pixel for Tegra20/Tegra30
  * @img_fmt: image format (for CSI/Tegra210 only)
  * @fourcc: V4L2 pixel format FCC identifier
  */
-- 
2.48.1

