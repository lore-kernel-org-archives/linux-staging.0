Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901437F735
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777410; cv=none; b=n0zRBr1dboRm92aJCxV8pFby+FVH55ciJlmNKDT/jAwfuzKJb8OBkimNN4J83yTIXrD8jdnSH2/Z5+8uuEsmvgPmYkvlwDGXg3cjmMRxu8HxZAGUxPe/3iJvflfvWs5OrM6rhJOZbjUG/pBBq279ZLi96dN2czCAXdct6+dGHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777410; c=relaxed/simple;
	bh=XkC6pC1Ht7QYhYz5xBTY+ZnKrbdM95bt/73kNqM5zOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l97yxZYb70pvBGDS8JZM/2l/wHGrK/pdekHFOiJQ2cKIwzKHNh7ijj17XCylYVuIEQ7+ooIV2Wlqh+X461QJq17U6354yNtt7d1/eF3XIbFLUM61wCJo4TAJ37VyTrycw+SnHBAfRgsGhuVzEVAu0rgx/11AZafSKB+sxPIAczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuhCu8Pu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuhCu8Pu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-435a11957f6so1749100f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 04:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777406; x=1770382206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=RuhCu8Pug/PZ/mw4wCmTIhmOJyVVnZjviUOMDmkkjcg2RvbMbcDh4X83bSNbl0KoGB
         4rPDtL46+PwAlz8KP9JVmQu3b1u1BoLRpOcZ8Pg5N8jYNw5psoTizHWQuOVBpJDQDWEj
         65jVB/vLhZFyRrTXarlIpJcW93PEJztwV3NKajaDzCagdlHfZU4kXEGY8N5o4/aRSXLg
         Q9004WIKwQrBUz2zJcMP/HV0zb5nZlq8vEzXe8fKo3eSOJ/wPVWBUuIKEUKtv4o92fb3
         6OotQ7BshLKr6Zb2v8UbRXp6ifEcffhGalKoCy6CaSs4D0r24KyiMa6Bod4x3BK9FRbA
         huMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777406; x=1770382206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=GeyRmyUKhQBDsIpox8Xq9QEi0r1SJcz4QFyuIkMtdy3p1BWmyZflML/EPLsE49Lha5
         klbgugKAVlmkHyOg78yqsCmyVxG5VfNte53BWhJJRDCHjz4poJVhfgoUtpy8k4o2bxLu
         DU4mqO7lFfvbLRO0SZtMUotmReKUGdQtM5xBAj9p5B57sauVj7VYokbyglIoW+SuGbCH
         3ynMffCjkE2Rw8JcLHtoY9bFw12QQjRMNE0xFi5bJxSFIZa/RIfZcnr+83p7T90bO3VY
         jVPKk128CGB70OJS9F+SRD9o5uuXPsxkHAQSFF6RwiXKTppQw6B5oky0uksSYtgHgRaw
         6m5w==
X-Forwarded-Encrypted: i=1; AJvYcCWkD0mjtCzzeqyBU9S+NaI5dkwgS7FzI6VYMAtN2Yo9j4h2lyCnJNEtjpBQFiHVaFRW3V9LuBzNCJZddgV7@lists.linux.dev
X-Gm-Message-State: AOJu0Yydi+X949nF1xxC1nfRGugdAOFwZnDyRzWGbYTwRSbIO/WXtVxK
	Ghl7F5qVboKA0vvvWOJHXQwGY7ctHEJuo6LHsnIGIvUR4yUKYr00gfck
X-Gm-Gg: AZuq6aJyBJQ1V6oR2C64xwEaxbstJArorzGRiMc++rUx2rS+nzolbms4Ags5ko76dQ+
	wWmXxZvGGREXPJo3tZDW8riUbx0PVp2OSdLT8MD/9HAALr8RkOmjeTUyUvyXvo+VoHKi5hfs3tc
	zBt4iFzKQ66g25ecVdkTMe5QU7sdiY4YwMRywDXPp2CI7iJRzSANqD4svVzCyFUosKGwcAvxhVR
	twG5VU/iDBTK3JHgSqa9PoLNmHr/E7+ptvqgLR2dSqo2IJl3rouLNa2RxHgxlPS5TVw7QS5+Acd
	8P0o9orMlpJnGphHIHY0ygUsQ5nkVQgK61FGsWfOTgmS7xFtIdddbmexSctZiGRQla5QVPdAOMj
	VV0GLYRFS9CfBdtdCcXbiauT36EfGW/Nfg5I/usNG3dbAqlyZyrQyrgUaHGJTkot6oDmlRSxEwm
	xP
X-Received: by 2002:a05:6000:2689:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-435f3a7bb17mr4337461f8f.24.1769777405561;
        Fri, 30 Jan 2026 04:50:05 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:05 -0800 (PST)
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
Subject: [PATCH v6 10/15] staging: media: tegra-video: tegra20: adjust format align calculations
Date: Fri, 30 Jan 2026 14:49:27 +0200
Message-ID: <20260130124932.351328-11-clamor95@gmail.com>
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

