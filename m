Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614324F21;
	Wed,  2 Nov 2022 18:08:23 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id f5so25932381ejc.5;
        Wed, 02 Nov 2022 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SBm3d04GFk4/+H9PR8aMvqp5TW7eO4YQt832cb+sCg=;
        b=WR0l2Xt1Y0GAn95DiTLQh6MHGWr8qXgYV/chfa2ugXr4bZT9SQriyRPo6YpT2gASTF
         UTFPmCNDfFjbM0MfC29UFzhsYwt9b4qmh385Lm7OdlXG4DYX3jlbtCsTcKRqXpqT27j1
         OxJpQ8gHoQq/KxIh/yiXTDfjiC3rbAlChB6D7Txv/j9b9ofaQ5KaFjecy7dm2QXnqn9C
         GCFw4IZD2AFUFXDb+9TiX/9cTvH7xmlwcZ7Emetbqi0nvrlg+S9UYLlgzFgHDmrGSQmF
         SFjGi+pWDE+Nw/rBjt8ZYzPo3B/h/DLiZB4PjNCVpdMwgCDA6Ud6tVxrntBBP+o9rRGv
         dCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SBm3d04GFk4/+H9PR8aMvqp5TW7eO4YQt832cb+sCg=;
        b=QR2OMm07uq9IQm6bq/hOb+c0uuvT2wxX7GJXEtly1Yg5hBcGQGVJHmG8mWweM1z2iS
         IQMgBs+WO7A+EPIrBGqYTcfaBhh8f7fv1UMvwyCwkyoy9PoRf52J7bfpk92wmChG8hTL
         oe8CmR0OnAfR+bzr+FOwXDtVxjepytNPy66igIFPM6wMQtAzD/Mc4zBcukY5/N6qNl3b
         p5U7Y/jEX0+2s98yIMEWc/QSe+UCeQyClYQWbsYLd1LIqyBPLOFn5gi3yMF867YrR0+9
         rQx1WoVvvyFSpHv80C7q8eznvYlRERhqkOOemF2T/Dzq+0yEhkEt0fGmAVJMgHParnSa
         bMdw==
X-Gm-Message-State: ACrzQf3HZubmuUb23CJpU2Y0oa9IIe8JlA9Bd7Uuwhp1w2XU+z69md2j
	ROW/WSuE6/AzB/WPMvBlsLw=
X-Google-Smtp-Source: AMsMyM5gSMtm7ldxt7yqChPSJ46+ccpg2ZkAAR31xOqTldaMLBY+vUaGSN5+YW6/Te0XXBcGS4fvHA==
X-Received: by 2002:a17:907:3206:b0:780:a882:a9ac with SMTP id xg6-20020a170907320600b00780a882a9acmr24800867ejb.765.1667412502028;
        Wed, 02 Nov 2022 11:08:22 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gy8-20020a170906f24800b007317f017e64sm5677460ejb.134.2022.11.02.11.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:08:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 04/11] media: cedrus: Add helper for checking capabilities
Date: Wed,  2 Nov 2022 19:08:03 +0100
Message-Id: <20221102180810.267252-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102180810.267252-1-jernej.skrabec@gmail.com>
References: <20221102180810.267252-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is several different Cedrus cores with varying capabilities, so
some operations like listing formats depends on checks if feature is
supported or not.

Currently check for capabilities is only in format handling functions,
but it will be used also elsewhere later. Let's convert this check to
helper and while at it, also simplify it. There is no need to check if
capability mask is zero, condition will still work properly.

No functional changes intended.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  6 +++++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 24 +++++++------------
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 9cffaf228422..1a98790a99af 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -268,6 +268,12 @@ vb2_to_cedrus_buffer(const struct vb2_buffer *p)
 	return vb2_v4l2_to_cedrus_buffer(to_vb2_v4l2_buffer(p));
 }
 
+static inline bool
+cedrus_is_capable(struct cedrus_ctx *ctx, unsigned int capabilities)
+{
+	return (ctx->dev->capabilities & capabilities) == capabilities;
+}
+
 void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
 u32 cedrus_get_num_of_controls(struct cedrus_ctx *ctx, u32 id);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 27a7120fa6fb..192d51397fd2 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -73,8 +73,8 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
 	return container_of(file->private_data, struct cedrus_ctx, fh);
 }
 
-static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
-						unsigned int capabilities)
+static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
+						u32 pixelformat, u32 directions)
 {
 	struct cedrus_format *first_valid_fmt = NULL;
 	struct cedrus_format *fmt;
@@ -83,7 +83,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
 		fmt = &cedrus_formats[i];
 
-		if ((fmt->capabilities & capabilities) != fmt->capabilities ||
+		if (!cedrus_is_capable(ctx, fmt->capabilities) ||
 		    !(fmt->directions & directions))
 			continue;
 
@@ -177,19 +177,13 @@ static int cedrus_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 			   u32 direction)
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
-	struct cedrus_dev *dev = ctx->dev;
-	unsigned int capabilities = dev->capabilities;
-	struct cedrus_format *fmt;
 	unsigned int i, index;
 
 	/* Index among formats that match the requested direction. */
 	index = 0;
 
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
-		fmt = &cedrus_formats[i];
-
-		if (fmt->capabilities && (fmt->capabilities & capabilities) !=
-		    fmt->capabilities)
+		if (!cedrus_is_capable(ctx, cedrus_formats[i].capabilities))
 			continue;
 
 		if (!(cedrus_formats[i].directions & direction))
@@ -244,10 +238,9 @@ static int cedrus_g_fmt_vid_out(struct file *file, void *priv,
 static int cedrus_try_fmt_vid_cap_p(struct cedrus_ctx *ctx,
 				    struct v4l2_pix_format *pix_fmt)
 {
-	struct cedrus_dev *dev = ctx->dev;
 	struct cedrus_format *fmt =
-		cedrus_find_format(pix_fmt->pixelformat, CEDRUS_DECODE_DST,
-				   dev->capabilities);
+		cedrus_find_format(ctx, pix_fmt->pixelformat,
+				   CEDRUS_DECODE_DST);
 
 	if (!fmt)
 		return -EINVAL;
@@ -269,10 +262,9 @@ static int cedrus_try_fmt_vid_cap(struct file *file, void *priv,
 static int cedrus_try_fmt_vid_out_p(struct cedrus_ctx *ctx,
 				    struct v4l2_pix_format *pix_fmt)
 {
-	struct cedrus_dev *dev = ctx->dev;
 	struct cedrus_format *fmt =
-		cedrus_find_format(pix_fmt->pixelformat, CEDRUS_DECODE_SRC,
-				   dev->capabilities);
+		cedrus_find_format(ctx, pix_fmt->pixelformat,
+				   CEDRUS_DECODE_SRC);
 
 	if (!fmt)
 		return -EINVAL;
-- 
2.38.1

