Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075F388E68
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527389; cv=none; b=i2h88I57FK5NgFpSPTfyw4UxlR/UFx2X4j3TaGcBJCZHFX8R6oOjY1Rge89bfHr9PofCNFZzaWCrKvIPPtbiIScXKg84Ol1E4MpxstuskFHpobSGFN1B0p744w1AbGUg+ocpVkgAtURwGEPuQ6LXulPLvjCICRflPVi7GIVAweg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527389; c=relaxed/simple;
	bh=XkC6pC1Ht7QYhYz5xBTY+ZnKrbdM95bt/73kNqM5zOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKY7S0ewM4lsBPsmAyBhYr3WIn5ZOGcNTraKBIVCgnYG0Q1tGMEgEHzJyzD6mmRVSNn9UKXBq9WXdrYDBtRJbbywlym6Fy1jM2zTAB7OeAzcniWx1ei9D7hPIx6eOC1AUB55ufM8xSC74x8Z/06Ha6eqj7VxsrX5eejfvm99fl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkhBlTlR; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkhBlTlR"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-387090ae5b1so89223891fa.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527384; x=1773132184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=VkhBlTlRBsedzJm9JhqpevFo5uOEZ4ZyVNs7EPxEeRE+P4PZV/djkIdKUqJ751yDq5
         /ExxvdKIl9IaK/08A+zhBua+CQImS3hEF4EpCqfqBT5V1qpXZ8y7zBT2B3Mhi0oM6vRQ
         jFnFRefh/kJWKvBtpnd94pFa0YQJhuGeO9nbdpydAMjQ09t6Rwt1lweLD3faR/VgNOhX
         kAbB6YibtWVvG5/uGf6wgN4gSfs17hMu1HwmeOsmF9/mtFbi1AF5nMQxpCde7yICB3vL
         TQZmoJ7Z5PGecXtPlWOqu0Iovf4OoNqHcb/V9jaf9N5X+S9o3It4NYj7jlfHPvXjuxMF
         T+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527384; x=1773132184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=khxf2t6FQDpSceEJ4Hq754+YXSKKGX/ElDaPeE79UVkAMxNQUhkz7xl//z6pLXRK7C
         1KXpPB7Sa3UgUpIY226EhfBSc2b7ZESMW9ISZmeJTRox8skv7UszCX3MVGY/BeQpYun4
         A04mLu9dRNv0RBBGGUmthaJx8MC/yLHhCN56LwlYcvk1YonD+IkW8kGSt04YIi1uyGU/
         B4sHumdQlZtomiQNVnK7qt7LGBZwvhpdVBF2UDKfZfjtV5O+/W/SLjrb0dzvDLU0hXK7
         /OWOJR93l44hDgyT5BhY8sZpc/IBUKCKRqpoRspRZ/tbLp6Zv49GN3BSJeaN8CTVKJb5
         DC7w==
X-Forwarded-Encrypted: i=1; AJvYcCVTPpgJ3+/2+nnPuwqwUQw+G1QVwIK6Oxwb2Q/NYERQIfxMntKVq7OJ1TciJsOAcKz9AMOkJPInYzbexP0n@lists.linux.dev
X-Gm-Message-State: AOJu0YyQq1GUVZJkxNs5nLba1ndimcN1VGhda+F/ZYQ4aFhVzrzDnYk7
	+hlJB4/EEOPrIT+7Q9RSJ6duHA3jb/4ylZsdkfDyzXi84TqkLG2ES8DQ
X-Gm-Gg: ATEYQzyiZtQUOU+MT+1q6VHjEUr0YUVlEUBC0hPeOfiOpceYChW5MNPUQgkIz/ufDCW
	qwDoqIGXZnktimMYw4Js7lymNZMzO5ziNipJIoLfiBQGxaS0JpnDbbQ6cTpT6mKfQWbH02CA9r1
	vJiaac1uJ9WJOI3L567I5UpDgDyp4siAnJeZvw2bmF5tE6eYd2nSKo3MnTEgWFY7bUT63/EpIL5
	qDU+mR/FzuEIv8T8uPhxOvppaUBwHgH+682T5BbLWhyntaLOjpQsH40zbwkYQq43jlxMV0FNOkI
	3120Hy4DKthKuTEArqcbA6khmMh+JV2tD9aWyqDO06ucJ6Ru9+FohgfkTAhvyP7DnpDxXMmst1X
	GS7EPfPE1bHFu5GC1jrnrdYgdVLZzu6h/jbglg4/PenEuPJ3L6l7QrGRFqPK1BLRhAT8Y/FGC9K
	XMFkddc03UtHjl
X-Received: by 2002:a05:651c:2112:b0:38a:34a:7823 with SMTP id 38308e7fff4ca-38a034a7c3dmr110038231fa.21.1772527383803;
        Tue, 03 Mar 2026 00:43:03 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:03 -0800 (PST)
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
Subject: [PATCH v7 10/15] staging: media: tegra-video: tegra20: adjust format align calculations
Date: Tue,  3 Mar 2026 10:42:33 +0200
Message-ID: <20260303084239.15007-11-clamor95@gmail.com>
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

Expand supported formats structure with data_type and bit_width fields
required for CSI support. Adjust tegra20_fmt_align by factoring out common
bytesperline and sizeimage calculation logic shared by supported planar
and non-planar formats and leaving planar-related correction under a
switch.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c8afc6f2adf2..4b218b9fbc26 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,18 +280,13 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
+	pix->bytesperline = roundup(pix->width, 8) * bpp;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
 	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
+		pix->sizeimage = pix->sizeimage * 3 / 2;
 		break;
 	}
 }
@@ -576,20 +571,24 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	/* YUV420P */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.51.0

