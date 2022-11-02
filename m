Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FC924F21;
	Wed,  2 Nov 2022 18:08:25 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id t25so47513617ejb.8;
        Wed, 02 Nov 2022 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2Hed/cwaitEX8IrPnxfw0nVvIrGKU5Ht5QuLIknVQ8=;
        b=b7M5xUafZOHUvxv29xa7AkbFS94acHS8dlOgQeQe+0YZAPGynF0HZthmCM4/cO79H/
         mawzSDzg30s4Huq4oFbWQ9CgckbxVgGJV6JrVZV2QN/eK/AY2pq5yqvvy9PgBhRl1NZ0
         tKYTnc97RIIQYChMsjuEZmP9RAriCt+fXhd3chXfzBgfvTqCnx9bZ3/div3h5YGIYG9+
         UXSfDdItc/fUT4JWIJEGqyW9p7TD5RaXhV2oTBcOdbt3eiNqoF1E6Mlpi4XNUytAqteq
         qwTLHnyxofcuwly6HpbVu3F1hpPectLC7LD0sTIS8tx8mHHrlyRC/loAb3jdaHiUOKp6
         /nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2Hed/cwaitEX8IrPnxfw0nVvIrGKU5Ht5QuLIknVQ8=;
        b=QiuuJwphXiMtJoQ0v8kzztrzmUC2/myqG822cjpOVX8QHq7rNx4JiYOwXZQzbLWm3n
         Xe9inH/qZEYqqmq1x09zTBOZokvoHjpaAMtyguHw+r3MSluhuRw95B/0KuwXMha8uMws
         iGxlGFW+bxHiYhmlPLAfpgrjRyVDz5LiyBKBphKqintrObSHLGLgWmal1Fa+YqiEV83J
         Rw+4PcZXvcL9GDH1jdWXG5eVOCfqrMOz/NXZNBr/nCiAmNwQBvGCi/7u43/1prBNgyA/
         vJ/ljMBiCLiRK+nWY5qmOTFwShyokqLjLXY00M3KsBZ70l8fMTkSjkwh9WDBQ0lmufFa
         qqdQ==
X-Gm-Message-State: ACrzQf0+GSsGMo8a1V/sf5Tk5zhhPwUY5q0RZlwTrnmjIsUBKmlZtpOQ
	jIGT6JREW1UehwOonzVEQ34=
X-Google-Smtp-Source: AMsMyM6Xb/K1ndt+NgJjR40T4NnSZFahGn53K3pedEhA3ScDvPTqcSG72la0+XCdpyKaIbKodU2FRQ==
X-Received: by 2002:a17:907:75d1:b0:7a8:291:2050 with SMTP id jl17-20020a17090775d100b007a802912050mr25428508ejc.287.1667412504299;
        Wed, 02 Nov 2022 11:08:24 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gy8-20020a170906f24800b007317f017e64sm5677460ejb.134.2022.11.02.11.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:08:23 -0700 (PDT)
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
Subject: [PATCH v2 06/11] media: cedrus: set codec ops immediately
Date: Wed,  2 Nov 2022 19:08:05 +0100
Message-Id: <20221102180810.267252-7-jernej.skrabec@gmail.com>
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

We'll need codec ops soon after output format is set in following
commits. Let's move current codec setup to set output format callback.
While at it, let's remove one level of indirection by changing
current_codec to point to codec ops structure directly.

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  5 ---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  3 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  4 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  6 +--
 .../staging/media/sunxi/cedrus/cedrus_video.c | 44 ++++++++-----------
 5 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index a88ca89d966d..37b1df9a9d6a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -456,11 +456,6 @@ static int cedrus_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dev->dec_ops[CEDRUS_CODEC_MPEG2] = &cedrus_dec_ops_mpeg2;
-	dev->dec_ops[CEDRUS_CODEC_H264] = &cedrus_dec_ops_h264;
-	dev->dec_ops[CEDRUS_CODEC_H265] = &cedrus_dec_ops_h265;
-	dev->dec_ops[CEDRUS_CODEC_VP8] = &cedrus_dec_ops_vp8;
-
 	mutex_init(&dev->dev_mutex);
 
 	INIT_DELAYED_WORK(&dev->watchdog_work, cedrus_watchdog);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 7a1619967513..0b082b1fae22 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -126,7 +126,7 @@ struct cedrus_ctx {
 
 	struct v4l2_pix_format		src_fmt;
 	struct v4l2_pix_format		dst_fmt;
-	enum cedrus_codec		current_codec;
+	struct cedrus_dec_ops		*current_codec;
 
 	struct v4l2_ctrl_handler	hdl;
 	struct v4l2_ctrl		**ctrls;
@@ -185,7 +185,6 @@ struct cedrus_dev {
 	struct platform_device	*pdev;
 	struct device		*dev;
 	struct v4l2_m2m_dev	*m2m_dev;
-	struct cedrus_dec_ops	*dec_ops[CEDRUS_CODEC_LAST];
 
 	/* Device file mutex */
 	struct mutex		dev_mutex;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index e7f7602a5ab4..fbbf9e6f0f50 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -94,7 +94,7 @@ void cedrus_device_run(void *priv)
 
 	cedrus_dst_format_set(dev, &ctx->dst_fmt);
 
-	error = dev->dec_ops[ctx->current_codec]->setup(ctx, &run);
+	error = ctx->current_codec->setup(ctx, &run);
 	if (error)
 		v4l2_err(&ctx->dev->v4l2_dev,
 			 "Failed to setup decoding job: %d\n", error);
@@ -110,7 +110,7 @@ void cedrus_device_run(void *priv)
 		schedule_delayed_work(&dev->watchdog_work,
 				      msecs_to_jiffies(2000));
 
-		dev->dec_ops[ctx->current_codec]->trigger(ctx);
+		ctx->current_codec->trigger(ctx);
 	} else {
 		v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev,
 						 ctx->fh.m2m_ctx,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index a6470a89851e..c3387cd1e80f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -132,12 +132,12 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	status = dev->dec_ops[ctx->current_codec]->irq_status(ctx);
+	status = ctx->current_codec->irq_status(ctx);
 	if (status == CEDRUS_IRQ_NONE)
 		return IRQ_NONE;
 
-	dev->dec_ops[ctx->current_codec]->irq_disable(ctx);
-	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
+	ctx->current_codec->irq_disable(ctx);
+	ctx->current_codec->irq_clear(ctx);
 
 	if (status == CEDRUS_IRQ_ERROR)
 		state = VB2_BUF_STATE_ERROR;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 192d51397fd2..f6305ffe2c4f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -333,6 +333,21 @@ static int cedrus_s_fmt_vid_out_p(struct cedrus_ctx *ctx,
 		break;
 	}
 
+	switch (ctx->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_MPEG2_SLICE:
+		ctx->current_codec = &cedrus_dec_ops_mpeg2;
+		break;
+	case V4L2_PIX_FMT_H264_SLICE:
+		ctx->current_codec = &cedrus_dec_ops_h264;
+		break;
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		ctx->current_codec = &cedrus_dec_ops_h265;
+		break;
+	case V4L2_PIX_FMT_VP8_FRAME:
+		ctx->current_codec = &cedrus_dec_ops_vp8;
+		break;
+	}
+
 	/* Propagate format information to capture. */
 	ctx->dst_fmt.colorspace = pix_fmt->colorspace;
 	ctx->dst_fmt.xfer_func = pix_fmt->xfer_func;
@@ -491,34 +506,13 @@ static int cedrus_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct cedrus_dev *dev = ctx->dev;
 	int ret = 0;
 
-	switch (ctx->src_fmt.pixelformat) {
-	case V4L2_PIX_FMT_MPEG2_SLICE:
-		ctx->current_codec = CEDRUS_CODEC_MPEG2;
-		break;
-
-	case V4L2_PIX_FMT_H264_SLICE:
-		ctx->current_codec = CEDRUS_CODEC_H264;
-		break;
-
-	case V4L2_PIX_FMT_HEVC_SLICE:
-		ctx->current_codec = CEDRUS_CODEC_H265;
-		break;
-
-	case V4L2_PIX_FMT_VP8_FRAME:
-		ctx->current_codec = CEDRUS_CODEC_VP8;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
 	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
 		ret = pm_runtime_resume_and_get(dev->dev);
 		if (ret < 0)
 			goto err_cleanup;
 
-		if (dev->dec_ops[ctx->current_codec]->start) {
-			ret = dev->dec_ops[ctx->current_codec]->start(ctx);
+		if (ctx->current_codec->start) {
+			ret = ctx->current_codec->start(ctx);
 			if (ret)
 				goto err_pm;
 		}
@@ -540,8 +534,8 @@ static void cedrus_stop_streaming(struct vb2_queue *vq)
 	struct cedrus_dev *dev = ctx->dev;
 
 	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
-		if (dev->dec_ops[ctx->current_codec]->stop)
-			dev->dec_ops[ctx->current_codec]->stop(ctx);
+		if (ctx->current_codec->stop)
+			ctx->current_codec->stop(ctx);
 
 		pm_runtime_put(dev->dev);
 	}
-- 
2.38.1

