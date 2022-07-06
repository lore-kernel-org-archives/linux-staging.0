Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE8539E
	for <linux-staging@lists.linux.dev>; Wed,  6 Jul 2022 18:29:18 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h17so10072047wrx.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Jul 2022 11:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=axeXih7SeM9/ugL1UWf/GDJrKgStc8RtYqCA88OQ2Yg=;
        b=GEE8ZpCc8FXkrCHX5eQwIncrLFXq34Zy6zTjlv8Q301MOYjew8C5/GyEAcuD6dfVMb
         4OhTtl53jymyQxtHW68z0HEYxxPXHoNvOo6yKcqm8xcOecPoaKUZvGJAMoCm1/GOai+U
         cLFIEoxhKYPcx2MmWz2tuZVn73w8Iv0Dxch4lAALfpfLKNdbnZ7VnW8fsnzg5IOyZiD+
         PyLYHNASqlLfmUIuFlsM7JgGubEWOAwBGkF5rSCzMWC9wVUFG6E22LrqoXbZ4bdzXH6F
         6rnGBdNqXVnsZ7Lmc9VA+SCAbGSNbJobN3XWw4aKH7LJ4qzB0LgUESpD2c5sg0Lqq2N2
         7vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=axeXih7SeM9/ugL1UWf/GDJrKgStc8RtYqCA88OQ2Yg=;
        b=Egh7WLmN03Yk8WD/eM4xooKiVaIoT7705cvb1qlzpscAMyHesbWzDRMFqR9usUNtVm
         WiJh6dwWjnGXhX/ORoFCQbbU8QBaJJ/BzQH9JB7UMp2tNUsND9WP+LyF/RGmIWMcX+Cs
         irtf4PmasduIB5Xiyp+jlEQ6xUlaTJS8Oka9OfrDRtk5RZnGY6i65BAk6BpEIHY/Le+N
         fwDHPtuQn1OgRJgJgay4cBQL7RzTFOS/Z2ZPd8bEXHw1Mvc3C2RmcbS5ZEJvhZ1Py8Te
         2kmCRpGG6EkFcjTqV9f9KgMNrVNDafP1WwroHMPxJ6eB19L5PBEoTbuP3WB3NuuVItne
         f+pw==
X-Gm-Message-State: AJIora/ncPjU920BT0a+D0ANWgmQTsPB2SPWCZ56K0uOeHVG2+XxiGTr
	Pbw3M7Gbcg3qhpzJoChUw741haXQMrFKUA==
X-Google-Smtp-Source: AGRyM1tdxTCLVWVsXypOgTsU6+moB+5RKDV480P4q68cBOI2NFPAdvqY2nz/DXtQNpd4KWr4sAzPHQ==
X-Received: by 2002:a05:6000:2a5:b0:21d:2204:134a with SMTP id l5-20020a05600002a500b0021d2204134amr38870805wry.67.1657132156848;
        Wed, 06 Jul 2022 11:29:16 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm5142406wru.28.2022.07.06.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:29:16 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 4/7] media: hantro: postproc: Fix legacy regs configuration
Date: Wed,  6 Jul 2022 20:28:58 +0200
Message-Id: <20220706182901.78949-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220706182901.78949-1-jernej.skrabec@gmail.com>
References: <20220706182901.78949-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some postproc legacy registers were set in VP9 code. Move them to
postproc and fix their value.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c |  8 --------
 drivers/staging/media/hantro/hantro_postproc.c   | 10 ++++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
index 91c21b634fab..c9cb11fd95af 100644
--- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
@@ -515,16 +515,8 @@ static void
 config_bit_depth(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_params)
 {
 	if (ctx->dev->variant->legacy_regs) {
-		u8 pp_shift = 0;
-
 		hantro_reg_write(ctx->dev, &g2_bit_depth_y, dec_params->bit_depth);
 		hantro_reg_write(ctx->dev, &g2_bit_depth_c, dec_params->bit_depth);
-		hantro_reg_write(ctx->dev, &g2_rs_out_bit_depth, dec_params->bit_depth);
-
-		if (dec_params->bit_depth > 8)
-			pp_shift = 16 - dec_params->bit_depth;
-
-		hantro_reg_write(ctx->dev, &g2_pp_pix_shift, pp_shift);
 		hantro_reg_write(ctx->dev, &g2_pix_shift, 0);
 	} else {
 		hantro_reg_write(ctx->dev, &g2_bit_depth_y_minus8, dec_params->bit_depth - 8);
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index b77cc55e43ea..8933b4af73ed 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -130,6 +130,16 @@ static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
 		hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
 		hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + chroma_offset);
 	}
+	if (ctx->dev->variant->legacy_regs) {
+		int out_depth = hantro_get_format_depth(ctx->dst_fmt.pixelformat);
+		u8 pp_shift = 0;
+
+		if (out_depth > 8)
+			pp_shift = 16 - out_depth;
+
+		hantro_reg_write(ctx->dev, &g2_rs_out_bit_depth, out_depth);
+		hantro_reg_write(ctx->dev, &g2_pp_pix_shift, pp_shift);
+	}
 	hantro_reg_write(vpu, &g2_out_rs_e, 1);
 }
 
-- 
2.37.0

