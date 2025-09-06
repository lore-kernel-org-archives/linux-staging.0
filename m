Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7530147E
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166871; cv=none; b=QdphnsO24OGR8rFuDcQjozfhJwqR5bkLWORKBgMe6Jz+8B+lk5fsyAhdhedIpG4XOqWyV/tkTBciOjfPsDXykPYKXhfOV2X1MLMEp4ZRrDJwN1Ffg0h+oc9J+AQjsg3ouOrFgZ7aW5YTGaMQ02K9cgm+WUOxC375tFFhiScmP3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166871; c=relaxed/simple;
	bh=pcvsch9equ9U2eg2pRak278y2u7D1KNfIZsN951Ej2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh9eplMH48i93WqvqoKjrFjdgkCBoeVOnV0WxSnYmt4gbzda4NAHUphtonCOqF09zVjmLVHuNDr64JZLE6LVrCjNOhWirCpVCqaX0W0C9Uhi6cC5Dzw52+EtfRYtuSHTnRtyrFCi1o5KPZuEzohYOAT+/gkB7YOyJR40fwEviM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+/D1GW7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+/D1GW7"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f76277413so3648827e87.3
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166868; x=1757771668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZW7dqJgZ0dYH2mdRsFDOcRUdcwAD8iUPPbmwcwKHGg=;
        b=c+/D1GW7/j5OAhS6OJUVMpFB6Na6TeH/EwFBmNVJwD1jROvlBbUjWS+7bbhevuz8sy
         ITEOHGLGF8PIrsGq3Xl7hddCxx7F3SCQ59X3hpQBd++pEY2KzmgV/HSLB4apirnDeFKq
         g0wRIazeaeMVXTLDd0dyESdbK+92QRs9MiVlpqhIiIxMkgA+KoRERdwheZiR1W0xjm/R
         WjWYrZzovDRlHKw9k5ISn5JQJ+5jvoIMM37dJtdxyViknoi6CEIlhLBBLnLTIDqOAhL7
         lH9nJbyaAsGBZqIXXQIHfd+KCUMxlzdLUj1Ux/HaJUAgyFhZxiWinhuBdpskkWLb4sHx
         ruPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166868; x=1757771668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZW7dqJgZ0dYH2mdRsFDOcRUdcwAD8iUPPbmwcwKHGg=;
        b=qgR0tiVmyjFKQjwu260TRrNW6v6yszO3RuRfvFdg4ryx4oKb8tfBchrq1Lj88t2pBW
         MJP10VFsuFSPUXi46wsk3s8D7eq5JW1ZQE063rU58hqjSToFH/dmFM36q1AzqeUsXlOa
         GUQDG5EeNsiX6oBakO3CunUmc20wGo3r3aU+JoUa5UgGMSyU2MnlmyxVy/7YuWtIUH9M
         S8Mkvw4tecPxm7N4JEHdbg9rA6huvMVXdnniB87t/FZSNFX2jFKJtYPebuOn2P2RH9MQ
         Rp2g8m2WLJwidV9hXxGWtDElploudN4ZFcfrXFMnJ13JIawgBBFoPxQSBv9CdxhmM2R+
         NdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXKmsXZqZf66Q8Z00pWDkZh7MaN/erZ+5XL/jY2xRBAZ276cb3VsEcNo+bfEqMMQpDEdoLiVdbxWTJRK8z@lists.linux.dev
X-Gm-Message-State: AOJu0YzMkSGWeRa+mUhdrzbZMb+dE1qO7kA0pxmC813awlerhdnHrai5
	NshZr9id8ChjcxOvcKtFwSwfy7Vn6VruGg/yks63MsQCKuiALqd88oBoj+pGPQ==
X-Gm-Gg: ASbGncuropB+w3aIhnpuGqtxrv3LqHLr43T39AEKWeB1gnxMW5WT+8qmVeuhDCGjnvi
	JckXllxQeJhZPrHb3pUDkOK7lMpPzdRZRy3eTmXMwwue41aNASFG9Leqf4tGYmitq6WKzy/+Mmz
	fQi/nWJeSoA6Lvz5JmN4Gwv0XAdmMdf3ot2OynxjGjKgwEs4yRdHhtWIIUA7OzXWO7e3Rfq8qiS
	xvmw6HgzlAkBvoPq441P2Do9UVYYk0lzBTYYHLYcIJp0r1PqZ2I5bqqnuTp8l3I+mDyPJ2G/GZR
	f4aZg3d/3qjEu+Exr56pyPR6DkVZo1uAjidKK6N/yrdJmfi4udtHMVi1UEQKU3vtyw73nM/KU2t
	hEkp/d9UeSEjjgqBWy0prULXb
X-Google-Smtp-Source: AGHT+IG+CJZ7iseF3kv/Cj6ge1e/cUIXjhaB91wzpTVojIxeSMhx9A3nDfwz+NAjq7cRrEt97mJS1A==
X-Received: by 2002:a05:6512:3ca1:b0:55f:4a34:e333 with SMTP id 2adb3069b0e04-56261bc58ddmr636666e87.33.1757166867511;
        Sat, 06 Sep 2025 06:54:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:27 -0700 (PDT)
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
Subject: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify format align calculations
Date: Sat,  6 Sep 2025 16:53:37 +0300
Message-ID: <20250906135345.241229-17-clamor95@gmail.com>
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

Simplify format align calculations by slightly modifying supported formats
structure.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 6e0b3b728623..781c4e8ec856 100644
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
@@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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

