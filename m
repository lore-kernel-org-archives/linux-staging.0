Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DF2CB3
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:51:00 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id i6so3706294ila.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hdJ89QiMEvN3VGs2DFynThgfT2ETzQmQafALw9z6ufA=;
        b=BZvVdS+LC5Kq8GGv8p0rF08hRwd5fXxBjQHWcaVL0zCr6b7qnv0mKs6RrGj0CY4HlW
         YMaUyYT5Zi/RUWVfolzS9c/zPH3BQtHPG5/+XDDTdlVM8UN7DOEGlXIJm1NQEc+m1tYM
         4MUsiIiBWvHee8OWqdAskMcDgAgWEe8Q0BFQIhPuJ00Mm4l6Wv0HL5IaP1wGXooWyKFm
         LrnGEjso0C07827b6UDc34mOGub6ZTuf5O0fFWhf9zlCY6yYk5iV0ivGCcOGayUk2k8n
         okladLKCnnlC27c/ijLrPuITJmcidaAjPe62XHwJ42DFI/kiN/+0F9HeugBK+hx8B0KU
         LVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hdJ89QiMEvN3VGs2DFynThgfT2ETzQmQafALw9z6ufA=;
        b=uUSzMjOdAHl6TFsKoToYmqm4PaLhULjfjs228ezeZemQeaPOEkem6bTYvR+PPJw9DR
         xVB8sBbgPJsVL0FXLCTbpfpS24z4dzWpPPST3FxtoR+WpJICl4JBJ828CHVQ2yuWkGn9
         tHPiq/pLWsKU9QOOaBZe+j9Li+J/Vw/IEsw69A/S2xJ7FK+d3Uyj9O2i466YKbW1TnQu
         ySgcvuQoTH6xz6wNEau+dHGSKddWdgI9hea4gqwqa6qx+zQLWq38ONptKN8HS/yyUYqv
         vpz+TcSQCeSjwnIJJSfEvehAGfFQyZ8fG/g1MET8ZGf9xyaNcovb+PYseOec1W++TQC2
         7AiA==
X-Gm-Message-State: AOAM533yaGjbngbtozR3hPfLGe++U8hOxhSQ4kuA7LrvgR8n8kP6jpNA
	W/yiAu2HhyktOVcmxQ4yBRA=
X-Google-Smtp-Source: ABdhPJzHxIGfj2xcbAZPXs0NHLze6piLYIoq+N8EHlF0Bz33z0T9C/q5u3c6+hKZAolZnZr2kuz0Qw==
X-Received: by 2002:a05:6e02:18c9:: with SMTP id s9mr9705872ilu.86.1639003859402;
        Wed, 08 Dec 2021 14:50:59 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:50:59 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/10] media: hantro: Add support for i.MX8MM
Date: Wed,  8 Dec 2021 16:50:28 -0600
Message-Id: <20211208225030.2018923-10-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208225030.2018923-1-aford173@gmail.com>
References: <20211208225030.2018923-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8MM has a G1 and G2 video decoder, so add support in
the driver for it with the post-processing removed.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c   |  2 ++
 drivers/staging/media/hantro/hantro_hw.h    |  2 ++
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 28 +++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e7afda388ee5..118c4fa3d556 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -608,6 +608,8 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
+	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
+	{ .compatible = "nxp,imx8mm-vpu-g2", .data = &imx8mm_vpu_g2_variant },
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
 	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
 	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 96b14b43a4af..6ae1aeed2e16 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -299,6 +299,8 @@ enum hantro_enc_fmt {
 	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
 };
 
+extern const struct hantro_variant imx8mm_vpu_g1_variant;
+extern const struct hantro_variant imx8mm_vpu_g2_variant;
 extern const struct hantro_variant imx8mq_vpu_g1_variant;
 extern const struct hantro_variant imx8mq_vpu_g2_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index e0af4b93d3c6..65bb6f464dc9 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -351,3 +351,31 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.reg_names = imx8mq_g2_reg_names,
 	.num_regs = ARRAY_SIZE(imx8mq_g2_reg_names),
 };
+
+const struct hantro_variant imx8mm_vpu_g1_variant = {
+	.dec_fmts = imx8m_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
+	.codec_ops = imx8mq_vpu_g1_codec_ops,
+	.irqs = imx8mq_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
+	.clk_names = imx8mq_g1_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mq_g1_clk_names),
+	.reg_names = imx8mq_g1_reg_names,
+	.num_regs = ARRAY_SIZE(imx8mq_g1_reg_names),
+};
+
+const struct hantro_variant imx8mm_vpu_g2_variant = {
+	.dec_offset = 0x0,
+	.dec_fmts = imx8m_vpu_g2_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
+	.codec = HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
+	.codec_ops = imx8mq_vpu_g2_codec_ops,
+	.irqs = imx8mq_g2_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
+	.clk_names = imx8mq_g2_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
+	.reg_names = imx8mq_g2_reg_names,
+	.num_regs = ARRAY_SIZE(imx8mq_g2_reg_names),
+};
-- 
2.32.0

