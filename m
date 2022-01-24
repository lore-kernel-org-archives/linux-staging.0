Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3379B2CAB
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:44 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id a18so12640937ilq.6
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=29a4zcS3pHxTyHJK2Q3LXBcB6ssRU9X7b70+ZfuDhkk=;
        b=B+HkZrzqHPwuLVtXpEO62WdGobbgIQ47rAPYherwmXm8Q1WRwHdfbo4AsIq5VsZ8Td
         //1rz6lrb1tyG35o8yKNmPejdgCbU8IE8PfGwQhH/ojDz3rjJ58wL56ezle8rmaZ5KNk
         rY32VN/gG2lB1m7PA+n+aJ/EeA8fphJV8NWKs3ROI4mxmupb7lOzYn0thH25+BWreMm3
         7UBHCWoxu+EgubelI2bPSJ0H5OK74ngZtE3hMiU9SbtByRR2TvqkUDt2ZHlHhnRDsNdD
         rK3Yzglw7Xgp5nV7KRxHsio2llvO8pIRsUHHHjRIKpvMY4mMCtSZl84AbGsPgRb5nP+s
         8QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29a4zcS3pHxTyHJK2Q3LXBcB6ssRU9X7b70+ZfuDhkk=;
        b=TFsH7X1Cws1cLo+DczWW1d8Mvfnb4ktetZrCUPt1ZDnZDZVHzBoOqDjVxmy7GomBVs
         fPWdYdnTk/n8IelgIgIo0+rdQ7t8zvw51cY48tyTt+JBIJaEviYG+wug9nr2YJFcqZ1b
         yFCVMm7vAMzlyZhqSabg+asBEYbixRegKM+mf0CyvxdvcO1nHirXFFE3XZ8kTkOtSc0B
         i8KuNZu/cd8fYCb7MEg9cfN2wcM7F75zwQQ1u1Wmyhy1Vnd8QEPiaBtEHBaqmTwCJO/k
         ul/xtH+5guRAdIQDzXVg4Vw2+6ht62GTQIdnmvCBXoZFEkeQBj7RWt1cf7SkSjR9yQgf
         EZbw==
X-Gm-Message-State: AOAM533kfhNJN7UbXXps89GgWo5fnZCMldXeSz10WpB7Bt1Hp60C6ZdI
	9LQBTLEeIC8U02tLcVywDPY=
X-Google-Smtp-Source: ABdhPJyItfx9GIj1M0VNQJ4+FnHEk65zMmc2hyl51OUsipN+3WMxQ5OaFTfLpwOO+uyCetM2XuNghw==
X-Received: by 2002:a92:c563:: with SMTP id b3mr7819309ilj.150.1642991503292;
        Sun, 23 Jan 2022 18:31:43 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:42 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V3 05/10] media: hantro: Allow i.MX8MQ G1 and G2 to run independently
Date: Sun, 23 Jan 2022 20:31:19 -0600
Message-Id: <20220124023125.414794-6-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124023125.414794-1-aford173@gmail.com>
References: <20220124023125.414794-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VPU in the i.MX8MQ is really the combination of Hantro G1 and
Hantro G2. With the updated vpu-blk-ctrl, the power domains system
can enable and disable them separately as well as pull them out of
reset. This simplifies the code and lets them run independently
while still retaining backwards compatibility with older device
trees for those using G1.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 6a51f39dde56..a670ddd29c4c 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -616,6 +616,7 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
+	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
 	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 4a19ae8940b9..f0bd2ffe290b 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -299,6 +299,7 @@ enum hantro_enc_fmt {
 	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
 };
 
+extern const struct hantro_variant imx8mq_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
 extern const struct hantro_variant px30_vpu_variant;
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index f5991b8e553a..849ea7122d47 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -205,13 +205,6 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
 	imx8m_soft_reset(vpu, RESET_G1);
 }
 
-static void imx8m_vpu_g2_reset(struct hantro_ctx *ctx)
-{
-	struct hantro_dev *vpu = ctx->dev;
-
-	imx8m_soft_reset(vpu, RESET_G2);
-}
-
 /*
  * Supported codec ops.
  */
@@ -237,17 +230,33 @@ static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
 	},
 };
 
+static const struct hantro_codec_ops imx8mq_vpu_g1_codec_ops[] = {
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+	[HANTRO_MODE_VP8_DEC] = {
+		.run = hantro_g1_vp8_dec_run,
+		.init = hantro_vp8_dec_init,
+		.exit = hantro_vp8_dec_exit,
+	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = hantro_g1_h264_dec_run,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
+};
+
 static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
 	[HANTRO_MODE_HEVC_DEC] = {
 		.run = hantro_g2_hevc_dec_run,
-		.reset = imx8m_vpu_g2_reset,
 		.init = hantro_hevc_dec_init,
 		.exit = hantro_hevc_dec_exit,
 	},
 	[HANTRO_MODE_VP9_DEC] = {
 		.run = hantro_g2_vp9_dec_run,
 		.done = hantro_g2_vp9_dec_done,
-		.reset = imx8m_vpu_g2_reset,
 		.init = hantro_vp9_dec_init,
 		.exit = hantro_vp9_dec_exit,
 	},
@@ -267,6 +276,8 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
 
 static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
 static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
+static const char * const imx8mq_g1_clk_names[] = { "g1" };
+static const char * const imx8mq_g2_clk_names[] = { "g2" };
 
 const struct hantro_variant imx8mq_vpu_variant = {
 	.dec_fmts = imx8m_vpu_dec_fmts,
@@ -287,6 +298,21 @@ const struct hantro_variant imx8mq_vpu_variant = {
 	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
 };
 
+const struct hantro_variant imx8mq_vpu_g1_variant = {
+	.dec_fmts = imx8m_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
+	.postproc_fmts = imx8m_vpu_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
+	.postproc_ops = &hantro_g1_postproc_ops,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
+	.codec_ops = imx8mq_vpu_g1_codec_ops,
+	.irqs = imx8mq_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
+	.clk_names = imx8mq_g1_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
+};
+
 const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.dec_offset = 0x0,
 	.dec_fmts = imx8m_vpu_g2_dec_fmts,
@@ -296,10 +322,8 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.postproc_ops = &hantro_g2_postproc_ops,
 	.codec = HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
 	.codec_ops = imx8mq_vpu_g2_codec_ops,
-	.init = imx8mq_vpu_hw_init,
-	.runtime_resume = imx8mq_runtime_resume,
 	.irqs = imx8mq_g2_irqs,
 	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
-	.clk_names = imx8mq_clk_names,
-	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
+	.clk_names = imx8mq_g2_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
 };
-- 
2.32.0

