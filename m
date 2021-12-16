Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4A22CA2
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 11:13:38 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q72so34616236iod.12
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 03:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVwaRVsa/dCilPzHdFqGN9Zx3nJSGjB1MUq/Bb2332o=;
        b=cZVEJud2C0aEg+ZduYDuA4QjJMzZ2lC3neSwmZNaVBq6FvNN6qPcLZSYvbclDlSyU3
         AXZdMyrKQh9LariRRwTHSiGtGItJYRXHkY99B7zIBitRVwAs++9b+laiCYJHitzJly3w
         83cVRWIkpw+z7PKysXYz0Ao/g/CIkw7Y7ys+tsxsm8CGszJ8xz953p3w9/z4wp9nDvoz
         hwL4kFybhHqESG+/J0ZyMBdtTKyVCEmvwxnzPoKH98/v1snfM36ouIW2XAEfvVd7ky2l
         BMo+E7QiQLnv81f7NiKI/4kXngLJX8CGScY50USh/VwmlNYSUSEE6KLhQXeHAG27ztVw
         X0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVwaRVsa/dCilPzHdFqGN9Zx3nJSGjB1MUq/Bb2332o=;
        b=u98iDfsuGzJVO5H8bxdZpbuTYjPzHzCCr7wb1wf99Bk+fK0RZV/QJZyD1BUxDi6bso
         Xf0RcPfQxZGwNA7epztOIKdq+XPGHPLY6g8wIU6fKmpruW412U93hNjTu4WAi8ajaBTd
         96fHRVnK6ICdtiSrRklBlW3pfdUG3HlOrcd1dklDL+74Jy+jFOU3i3/n9B2QLPaCg3hR
         CxRbrTl/4sUEMO4a7gNBDBCJkOKxxGA1htnl7VDGbqw8I+CfhMdsWmrPOM46r89vV67d
         h+XTGqCGXNiI3FWAur29a9bNB/RBnU/mbD0KoGW0Bz0imr7ad7mSZr8qXS8M/CN+d71k
         m55A==
X-Gm-Message-State: AOAM530hMGth94DAo+A305VcOR+2GdYnT0duEnss9UXXSDM6mXEHEz2h
	SI+4pmjV6y0JcytltRoNu6k=
X-Google-Smtp-Source: ABdhPJy4sVeIMJwIQeYCLkxihsRkUDA6hNdXUFrl/38M/QwdiwK4gdsBdINrQVePG+rQxgbfDGuQSg==
X-Received: by 2002:a05:6638:3784:: with SMTP id w4mr9112168jal.144.1639653217362;
        Thu, 16 Dec 2021 03:13:37 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:fe22:1652:55f7:5197])
        by smtp.gmail.com with ESMTPSA id h1sm3090946iow.31.2021.12.16.03.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:13:36 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: abel.vesa@nxp.com,
	aford@beaconembedded.com,
	benjamin.gaignard@collabora.com,
	hverkuil-cisco@xs4all.nl,
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
Subject: [PATCH V2 09/10] media: hantro: Add support for i.MX8MM
Date: Thu, 16 Dec 2021 05:12:54 -0600
Message-Id: <20211216111256.2362683-10-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216111256.2362683-1-aford173@gmail.com>
References: <20211216111256.2362683-1-aford173@gmail.com>
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
index 4925f2a07d4c..dc7fc19283e8 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -347,3 +347,26 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
 	.clk_names = imx8mq_g2_clk_names,
 	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
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
+};
+
+const struct hantro_variant imx8mm_vpu_g2_variant = {
+	.dec_fmts = imx8m_vpu_g2_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
+	.codec = HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
+	.codec_ops = imx8mq_vpu_g2_codec_ops,
+	.irqs = imx8mq_g2_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mq_g2_irqs),
+	.clk_names = imx8mq_g2_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mq_g2_clk_names),
+};
-- 
2.32.0

