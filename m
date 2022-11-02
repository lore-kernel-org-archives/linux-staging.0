Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1A24F24;
	Wed,  2 Nov 2022 18:08:30 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id d26so47413278eje.10;
        Wed, 02 Nov 2022 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnsNN7r2W9xkEzjhO5QJbPuVldjOL5oHt6w+pHrcgpM=;
        b=HYcMm0Ufc9sLUzcVbUacmyLCBSPMGFY2g3U1wwwC0aff82njCuumTTQn90EMAJyhT5
         XtEslqT4EgC6fr87jXNwXsVWmNLbsM8n88TM6jgrt/JATwt6q6Q6jI+FKV2+jpEqNfxi
         6/GPUfQJ8brJyJuMYl3eemNdXiXZYVqzAOJhfOCU8IYe/cI5e+7w4uk0GagWQNcw60rl
         SK1h+ZTRmv+TyC1it+zzwtIbF7rgPrc3W3pHtEyHSFwNhUEUqeesk4ng7okbObhNoHh6
         rVCnMmf6ydzErb+2kxT9X0yvfwMFMwT5TOlfwWPPmLG+Y0kFLGx4wfou7c0NzLx/q1E1
         PWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnsNN7r2W9xkEzjhO5QJbPuVldjOL5oHt6w+pHrcgpM=;
        b=mYWCFnD5c3xdhtp5VmaOLi0wZ2JfyGOt5ATj5/4QkvnxIzP1/n7kgoaUeMKgOCmuO4
         YIxySjGzZfmQCLG4zLTDlLnT8s1YjYpJlMitAQ324kYMkAT6rCP41A02z+mZnObWJ6ZI
         YvCXig/XVA1tpoH4XXgBCHx0cV54ydHp8b/PsegcSgR3xNvfS3QoeYTf/pmNR0DO6/dl
         dZpes5gVZMy/1zTE8iV9L169SnHmadYK2BfPz7PvlrGc09ACnGWhlgaui8bAPWayQHbh
         zij/sOZHptYf1rNsXXRXlXUIFZ0AXnDn7yMxJdLPb3h18RHdbJ0wvMXY3TabXNkAlDmK
         +vcA==
X-Gm-Message-State: ACrzQf2lyrhjdTsUwBzHrTZ/uHiMHqVGgJKy2mlHR4ZAqxIXtnRxSPzf
	BRM/OOLGZxC6m5vu+U/cAqI=
X-Google-Smtp-Source: AMsMyM5KASGBahil6cWvOOQ33GgPmn+YKHhSuh2FkeXY0JHcuKHQXj8pBygQZFJ+xHd50o0EsJoFIA==
X-Received: by 2002:a17:906:8458:b0:7ac:a48d:a680 with SMTP id e24-20020a170906845800b007aca48da680mr25750562ejy.105.1667412509956;
        Wed, 02 Nov 2022 11:08:29 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gy8-20020a170906f24800b007317f017e64sm5677460ejb.134.2022.11.02.11.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:08:29 -0700 (PDT)
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
Subject: [PATCH v2 11/11] media: cedrus: h265: Support decoding 10-bit frames
Date: Wed,  2 Nov 2022 19:08:10 +0100
Message-Id: <20221102180810.267252-12-jernej.skrabec@gmail.com>
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

10-bit frames needs extra buffer space when 8-bit capture format is
used. Use previously prepared infrastructure to adjust buffer size.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 ++++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 35 +++++++++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 16 +++++++++
 4 files changed, 59 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c36999e47591..909f769b3ede 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -75,6 +75,13 @@ static int cedrus_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 					       V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
+	if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
+		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
+
+		ctx->bit_depth = max(sps->bit_depth_luma_minus8,
+				     sps->bit_depth_chroma_minus8) + 8;
+	}
+
 	if (!vb2_is_busy(vq) && !vb2_is_streaming(vq))
 		cedrus_reset_cap_format(ctx);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 774fe8048ce3..522c184e2afc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -119,6 +119,7 @@ struct cedrus_ctx {
 	struct v4l2_pix_format		src_fmt;
 	struct v4l2_pix_format		dst_fmt;
 	struct cedrus_dec_ops		*current_codec;
+	unsigned int			bit_depth;
 
 	struct v4l2_ctrl_handler	hdl;
 	struct v4l2_ctrl		**ctrls;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 5d3da50ce46a..fc9297232456 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -41,6 +41,19 @@ struct cedrus_h265_sram_pred_weight {
 	__s8	offset;
 } __packed;
 
+static unsigned int cedrus_h265_2bit_size(unsigned int width,
+					  unsigned int height)
+{
+	/*
+	 * Vendor library additionally aligns width and height to 16,
+	 * but all capture formats are already aligned to that anyway,
+	 * so we can skip that here. All formats are also one form of
+	 * YUV 4:2:0 or another, so we can safely assume multiplication
+	 * factor of 1.5.
+	 */
+	return ALIGN(width / 4, 32) * height * 3 / 2;
+}
+
 static enum cedrus_irq_status cedrus_h265_irq_status(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -802,6 +815,18 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 						      VE_DEC_H265_SRAM_OFFSET_PRED_WEIGHT_CHROMA_L1);
 	}
 
+	if (ctx->bit_depth > 8) {
+		unsigned int stride = ALIGN(ctx->dst_fmt.width / 4, 32);
+
+		reg = ctx->dst_fmt.sizeimage -
+		      cedrus_h265_2bit_size(ctx->dst_fmt.width,
+					    ctx->dst_fmt.height);
+		cedrus_write(dev, VE_DEC_H265_OFFSET_ADDR_FIRST_OUT, reg);
+
+		reg = VE_DEC_H265_10BIT_CONFIGURE_FIRST_2BIT_STRIDE(stride);
+		cedrus_write(dev, VE_DEC_H265_10BIT_CONFIGURE, reg);
+	}
+
 	/* Enable appropriate interruptions. */
 	cedrus_write(dev, VE_DEC_H265_CTRL, VE_DEC_H265_CTRL_IRQ_MASK);
 
@@ -874,6 +899,15 @@ static void cedrus_h265_trigger(struct cedrus_ctx *ctx)
 	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_DEC_SLICE);
 }
 
+static unsigned int cedrus_h265_extra_cap_size(struct cedrus_ctx *ctx,
+					       struct v4l2_pix_format *pix_fmt)
+{
+	if (ctx->bit_depth > 8)
+		return cedrus_h265_2bit_size(pix_fmt->width, pix_fmt->height);
+
+	return 0;
+}
+
 struct cedrus_dec_ops cedrus_dec_ops_h265 = {
 	.irq_clear	= cedrus_h265_irq_clear,
 	.irq_disable	= cedrus_h265_irq_disable,
@@ -882,4 +916,5 @@ struct cedrus_dec_ops cedrus_dec_ops_h265 = {
 	.start		= cedrus_h265_start,
 	.stop		= cedrus_h265_stop,
 	.trigger	= cedrus_h265_trigger,
+	.extra_cap_size	= cedrus_h265_extra_cap_size,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 655c05b389cf..05e6cbc548ab 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -498,6 +498,22 @@
 
 #define VE_DEC_H265_LOW_ADDR			(VE_ENGINE_DEC_H265 + 0x80)
 
+#define VE_DEC_H265_OFFSET_ADDR_FIRST_OUT	(VE_ENGINE_DEC_H265 + 0x84)
+#define VE_DEC_H265_OFFSET_ADDR_SECOND_OUT	(VE_ENGINE_DEC_H265 + 0x88)
+
+#define VE_DEC_H265_SECOND_OUT_FMT_8BIT_PLUS_2BIT	0
+#define VE_DEC_H265_SECOND_OUT_FMT_P010			1
+#define VE_DEC_H265_SECOND_OUT_FMT_10BIT_4x4_TILED	2
+
+#define VE_DEC_H265_10BIT_CONFIGURE_SECOND_OUT_FMT(v) \
+	SHIFT_AND_MASK_BITS(v, 24, 23)
+#define VE_DEC_H265_10BIT_CONFIGURE_SECOND_2BIT_ENABLE	BIT(22)
+#define VE_DEC_H265_10BIT_CONFIGURE_SECOND_2BIT_STRIDE(v) \
+	SHIFT_AND_MASK_BITS(v, 21, 11)
+#define VE_DEC_H265_10BIT_CONFIGURE_FIRST_2BIT_STRIDE(v) \
+	SHIFT_AND_MASK_BITS(v, 10, 0)
+#define VE_DEC_H265_10BIT_CONFIGURE		(VE_ENGINE_DEC_H265 + 0x8c)
+
 #define VE_DEC_H265_LOW_ADDR_PRIMARY_CHROMA(a) \
 	SHIFT_AND_MASK_BITS(a, 31, 24)
 #define VE_DEC_H265_LOW_ADDR_SECONDARY_CHROMA(a) \
-- 
2.38.1

