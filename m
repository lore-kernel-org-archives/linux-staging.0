Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762538;
	b=emhhaqFax/YDTIxJOaIcEBGZfkKj4dfgUIzzEuFzqbl2kez/s0qqUWngNAjkIFef/6jS
	 c5hkuLncg0Q9LAq3qhEiCoNjkZPD/v0mg5lJ07gM/48HY5a0JZh11B+4QUMMdjjm9r9SF
	 B7puFSxqY4KlXE1QCSTubLOt72AtlqmBKbSGaEjbZhlWyzn2nEPZTPbrkkdLe8SeJZnFE
	 D2wKMyQh83QbV/fcdgMz60aroJrv35eTd4fWFdmuYVvQ+NNCHM+JzOe1Bwj6O6q7XammM
	 SbV/8febecg5NS9VtvNkiA35J+3TC8kKenldg0MAcyGGyF4y6dQcWtK3UpKQh/5BgBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CC7b24c8kJPE1iRMFB2CmHTWgeYoDzWmk2S53YK+ybA=;
	b=QB6fveNaTJ22Wwj3UIyE5/SqRW1peM/AGoANM8lWqTCvwKLI7TgjsZSc+yQljiHX5Gfp
	 IbxTxYhleIKv9NNaXjEJd9MZaNsOwSuDjDgypwjDbqoMqPhvgX5lthZPT15FgMuvem1/C
	 Bz2juDRIDcUcVQNX4oMUeo1QdZEL4omj6iW8eLVcBlK31VOcZ+ZYsFAqqHoyEWlTcqOHZ
	 Qb8aaFiGzJGT0fj81YfBNNaZic6ptuigIE4PtVEVTqi1FFW4XkWTusu01PzAsKnHeEcAB
	 Yoi0C3g1qocUy56vBi9ZmofsIuFk3zeY6/w+fGbVs0jM6clGf3k3jXg7hj+zeduW1FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgbX08g3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A1606A337
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 06:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D39A1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgbX08g3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so4708700f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 22:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762534; x=1796367334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC7b24c8kJPE1iRMFB2CmHTWgeYoDzWmk2S53YK+ybA=;
        b=XgbX08g3drxccgHQ7uktlXyx/DIaCGygJBPPRRwVXSgOgdxQPw9NqPcnqzXupvfuzX
         uY7cYVD3OJR0NeG3rHz0BKHY2VZXDTFkL6w2RUesUOIeZ6I/98hkXfzXjF4G5SakZEh3
         dwFOXBp2dFatKG9TZn2sNXJuNnZC4xRyUUJwihrSj8Bp6dZ/XuZlJPOxwpZm/Mb4PR2p
         VPsj2w4KJZt+zVIix8KYyRoUEU1IjQK48eutgo+9b6EUSDYbr+I2MXEpTJc0esrAQ3nE
         J1mV64F/AUp0ORePRiy0iuyP90fVHAzA6tcS1AD6j6iejCHjqptzMhZ9tcx4bN9rxKqk
         pKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762534; x=1796367334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC7b24c8kJPE1iRMFB2CmHTWgeYoDzWmk2S53YK+ybA=;
        b=u17crBGWUyG5jBK3DzfbkibuaOnBv9CakBBWbRqDrHWfKi9isTub3thRKjlP4nytf3
         H1R6HEMEf6LF69izeFJejwkRHyeqPdFXN5iHTVlfvRs3fqNcLlsFOqEHnjvH+EYKHO5m
         OtG7LS5JJZVbDR8jDfamkQl8wu1KzZ69zs7u5z+IdGlgNPn2AEvXqZInjumWnIIOpEf7
         QIBwk8IZKrAfKQTvQM2Pv/soxpQCyJDwb2rFZrsf12ENsVXZzgeGCg2rZhVGBjKVnUpX
         5AWRvV2A5R7eVxl0AiD54qtpIcZzFgF9+jN2T1//0Yd1g/5JsS+ujS1Uw5JQF63TxLT0
         ib+A==
X-Forwarded-Encrypted: i=1; AL+hErGsQqIPhNwx5HyUy+dUYutIvEWlHgWM+RqUikgU5ypMJe0xM2MfyvekIc/w7UpaROvmmMYpfaKtWhIENJQg@lists.linux.dev
X-Gm-Message-State: APuU4Z9EoUj7zOZKKjOaeh4td4vgfsiPZyBRA0FZtRI+SciXKuL/n9V0
	hcqdhgL5PgIgPq8p9UA0GqUDl07zRRkAwJbpSWgd5JcNKTV4/SEkymZ8
X-Gm-Gg: AZFdTZcjuTex2H5f77LrWa93bv9G521JpytNZv9T8GYIuCCcsaiLOi4uqeTs8zKdDj9
	No0zWcc7CEeT6Z4ImJSAIW87wf88bj9aim4GaEr1cW5yqbfzKoxHP/2HhbNY+UdA+bzD5PrDhv9
	g7/gVQSy8k5toBTCdAKPi2HewDECOIl4NGyOXF3qy2hkL2FfimkL/88RQzymFpvObimSng9bfOj
	7D2OhPn/3ZXoC4c4xdGI17RXN0dGBBhcSm5LthBwWVzi7Wz2J7GSaNbeHCWb5qOt+HKiy3bWXTF
	ZiPYE0G4JAxxiZR4u07N+kIqoajcQzEtJHhBld/sHgJjn734sww6TPLmn2h9lvkWOI/Wyxw5Zt8
	T9RIQiwMrFV1ua/nNozjmOK/Ee7jNByyjj71ZqdrVugxadsZF88balm5yMti+H/G1F/gYyVuFnJ
	B1eDzsWfvrOjp//iRDlJ0Tu/qd7keCryBruQjYGJ/6n+045wyXaypoTrYh9AVk0huTY9XZ7l1AV
	5z1oIVRtBXJeHf3TTxKQfzXdPxZ3/KqCoS6ONCf0RozVwxovg7ROB6hFmfE+GiXzGvg67NMwi3d
	b3Vg3xxF1nrsfoaV5hiqdA7YEaaQWuNrebi5IqU06pxFzLeQ2FoRIRx/Uv21WNtdvcNmUFmsmvN
	beVnLjK2dkc6ci2yoIHYBCCcuReFkqqyGaFRzCkQkHHXI3ED3SdYeRTCvIYD1CpJF5ChzmJ4f3q
	mKddGgDwA0bu1XIuswGGo1nzIJY0ROpU5kmgph4uuX1YySkGBPw5uBiVz2h5wUhfNBkRMXCwo/l
	l1S2aC1aRLnuj0GXTY8pawrG4QsGQpWzIMqXDb7wUk=
X-Received: by 2002:a05:6000:983:b0:4a8:8e3f:92b1 with SMTP id ffacd0b85a97d-4abb9085022mr42220652f8f.55.1795762533828;
        Thu, 26 Nov 2026 22:55:33 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:33 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/3] staging: media: cedrus: add VP9 decoding support
Date: Fri, 27 Nov 2026 07:55:23 +0100
Message-ID: <20261127065523.3685726-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add VP9 decoding for the H616 video engine, which decodes VP9 in its
H.265 engine. The backward probability adaptation is done by the
driver, from the symbol counts the hardware writes back.

Limitations:
 - Only profiles 0 and 2 (8 and 10-bit 4:2:0) are supported, up to
   4096x2304. 10-bit frames are output with 8 bits per sample.
 - The hardware derives the line stride of the references from their
   width and a power of two alignment, so the capture formats use a
   stride aligned to it. A frame can only be used as a reference if its
   width, rounded up to that alignment, matches the line stride of the
   capture buffers, so reference scaling is mostly unsupported.
 - The tiled NV12_32L32 format is only offered for 8-bit streams, as
   the hardware can put the plane of the two low bits of 10-bit frames
   inside its chroma plane.

The engine keeps state of a VP9 frame which is not all in registers.
An H.265 picture of another context decoded after it fails, its setup
reads back zeros from the bitstream. Reset the decoder core after every
VP9 frame. Clearing the registers is not enough.

Tested on H616.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/Makefile   |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   53 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   35 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |    7 +
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   20 +
 .../staging/media/sunxi/cedrus/cedrus_hw.h    |    1 +
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  131 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c |   31 +
 .../staging/media/sunxi/cedrus/cedrus_vp9.c   | 1253 +++++++++++++++++
 9 files changed, 1531 insertions(+), 2 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp9.c

diff --git a/drivers/staging/media/sunxi/cedrus/Makefile b/drivers/staging/media/sunxi/cedrus/Makefile
index a647b3690bf8..6660898ad80f 100644
--- a/drivers/staging/media/sunxi/cedrus/Makefile
+++ b/drivers/staging/media/sunxi/cedrus/Makefile
@@ -3,4 +3,4 @@ obj-$(CONFIG_VIDEO_SUNXI_CEDRUS) += sunxi-cedrus.o
 
 sunxi-cedrus-y = cedrus.o cedrus_video.o cedrus_hw.o cedrus_dec.o \
 		 cedrus_mpeg2.o cedrus_h264.o cedrus_h265.o \
-		 cedrus_vp8.o
+		 cedrus_vp8.o cedrus_vp9.o
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 09b789640646..5bd2892a2718 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -103,6 +103,43 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			ctx->bit_depth = bit_depth;
 			cedrus_reset_cap_format(ctx);
 		}
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
+		const struct v4l2_ctrl_vp9_frame *dec = ctrl->p_new.p_vp9_frame;
+		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
+		unsigned int max_depth;
+		struct vb2_queue *vq;
+
+		if (dec->profile != 0 && dec->profile != 2)
+			return -EINVAL;
+
+		if (cedrus_is_capable(ctx, CEDRUS_CAPABILITY_H265_10_DEC))
+			max_depth = 10;
+		else
+			max_depth = 8;
+
+		if (dec->bit_depth > max_depth)
+			return -EINVAL;
+
+		if (dec->tile_rows_log2 > 2)
+			return -EINVAL;
+
+		if (!cedrus_pic_size_supported(dec->frame_width_minus_1 + 1,
+					       dec->frame_height_minus_1 + 1))
+			return -EINVAL;
+
+		if (ctx->src_fmt.pixelformat != V4L2_PIX_FMT_VP9_FRAME)
+			return 0;
+
+		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+				     V4L2_BUF_TYPE_VIDEO_CAPTURE);
+
+		if (vb2_is_busy(vq)) {
+			if (ctx->bit_depth < dec->bit_depth)
+				return -EINVAL;
+		} else {
+			ctx->bit_depth = dec->bit_depth;
+			cedrus_reset_cap_format(ctx);
+		}
 	}
 
 	return 0;
@@ -262,6 +299,19 @@ static const struct cedrus_control cedrus_controls[] = {
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_STATELESS_VP9_FRAME,
+			.ops	= &cedrus_ctrl_ops,
+		},
+		.capabilities	= CEDRUS_CAPABILITY_VP9_DEC,
+	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
+		},
+		.capabilities	= CEDRUS_CAPABILITY_VP9_DEC,
+	},
 	{
 		.cfg = {
 			.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
@@ -686,7 +736,8 @@ static const struct cedrus_variant sun50i_h616_cedrus_variant = {
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_H265_10_DEC |
-			  CEDRUS_CAPABILITY_VP8_DEC,
+			  CEDRUS_CAPABILITY_VP8_DEC |
+			  CEDRUS_CAPABILITY_VP9_DEC,
 	.mod_rate	= 600000000,
 	.ve_mode_ddr	= VE_MODE_DDR_MODE_BW_256,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index e26bbbf2e55d..e3c45b298485 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -34,6 +34,27 @@
 #define CEDRUS_CAPABILITY_MPEG2_DEC	BIT(3)
 #define CEDRUS_CAPABILITY_VP8_DEC	BIT(4)
 #define CEDRUS_CAPABILITY_H265_10_DEC	BIT(5)
+#define CEDRUS_CAPABILITY_VP9_DEC	BIT(6)
+
+/*
+ * VP9 needs 1 KiB aligned chroma planes and derives the reference stride
+ * from the width aligned to a power of two.
+ */
+static inline bool cedrus_vp9_is_planar(u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_YUV420 ||
+	       pixelformat == V4L2_PIX_FMT_YVU420;
+}
+
+static inline unsigned int cedrus_vp9_stride_align(u32 pixelformat)
+{
+	if (cedrus_vp9_is_planar(pixelformat))
+		return 128;
+	if (pixelformat == V4L2_PIX_FMT_NV12_32L32)
+		return 32;
+
+	return 64;
+}
 
 enum cedrus_irq_status {
 	CEDRUS_IRQ_NONE,
@@ -81,6 +102,11 @@ struct cedrus_vp8_run {
 	const struct v4l2_ctrl_vp8_frame		*frame_params;
 };
 
+struct cedrus_vp9_run {
+	const struct v4l2_ctrl_vp9_frame		*frame_params;
+	const struct v4l2_ctrl_vp9_compressed_hdr	*prob_updates;
+};
+
 struct cedrus_run {
 	struct vb2_v4l2_buffer	*src;
 	struct vb2_v4l2_buffer	*dst;
@@ -90,9 +116,12 @@ struct cedrus_run {
 		struct cedrus_mpeg2_run	mpeg2;
 		struct cedrus_h265_run	h265;
 		struct cedrus_vp8_run	vp8;
+		struct cedrus_vp9_run	vp9;
 	};
 };
 
+struct cedrus_vp9_ctx;
+
 struct cedrus_buffer {
 	struct v4l2_m2m_buffer          m2m_buf;
 
@@ -109,6 +138,10 @@ struct cedrus_buffer {
 			dma_addr_t	mv_col_buf_dma;
 			ssize_t		mv_col_buf_size;
 		} h265;
+		struct {
+			u32		width;
+			u32		height;
+		} vp9;
 	} codec;
 };
 
@@ -164,6 +197,7 @@ struct cedrus_ctx {
 			dma_addr_t	intra_pred_buf_dma;
 			ssize_t		intra_pred_buf_size;
 		} vp8;
+		struct cedrus_vp9_ctx	*vp9;
 	} codec;
 };
 
@@ -221,6 +255,7 @@ extern struct cedrus_dec_ops cedrus_dec_ops_mpeg2;
 extern struct cedrus_dec_ops cedrus_dec_ops_h264;
 extern struct cedrus_dec_ops cedrus_dec_ops_h265;
 extern struct cedrus_dec_ops cedrus_dec_ops_vp8;
+extern struct cedrus_dec_ops cedrus_dec_ops_vp9;
 
 static inline void cedrus_write(struct cedrus_dev *dev, u32 reg, u32 val)
 {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 9f8b0555b7dc..476c063d3bf3 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -86,6 +86,13 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_STATELESS_VP8_FRAME);
 		break;
 
+	case V4L2_PIX_FMT_VP9_FRAME:
+		run.vp9.frame_params = cedrus_find_control_data(ctx,
+			V4L2_CID_STATELESS_VP9_FRAME);
+		run.vp9.prob_updates = cedrus_find_control_data(ctx,
+			V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
+		break;
+
 	default:
 		break;
 	}
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 7e742cbb1cdd..dd265ca5f2d8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -62,6 +62,11 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 		reg |= VE_MODE_DEC_H265;
 		break;
 
+	case V4L2_PIX_FMT_VP9_FRAME:
+		reg |= VE_MODE_RAMPD | VE_MODE_H616_VP9_RESERVED |
+		       VE_MODE_DEC_H265;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -81,6 +86,21 @@ void cedrus_engine_disable(struct cedrus_dev *dev)
 	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
 }
 
+void cedrus_engine_reset(struct cedrus_dev *dev)
+{
+	u32 reg;
+
+	readl_poll_timeout_atomic(dev->base + VE_RESET, reg,
+				  reg & VE_RESET_SYNC_IDLE, 1, 1000);
+
+	reg = cedrus_read(dev, VE_RESET);
+	cedrus_write(dev, VE_RESET,
+		     reg | VE_RESET_DEC | VE_RESET_DEC_REQ_MASK);
+	cedrus_read(dev, VE_RESET);
+	cedrus_write(dev, VE_RESET,
+		     reg & ~(VE_RESET_DEC | VE_RESET_DEC_REQ_MASK));
+}
+
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt)
 {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
index 6f1e701b1ea8..aeef2a1e1781 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
@@ -18,6 +18,7 @@
 
 int cedrus_engine_enable(struct cedrus_ctx *ctx);
 void cedrus_engine_disable(struct cedrus_dev *dev);
+void cedrus_engine_reset(struct cedrus_dev *dev);
 
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 961fe023bb43..2885911ad7d0 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -35,6 +35,9 @@
 
 #define VE_MODE					0x00
 
+/* Unknown function, required for VP9 on H616. */
+#define VE_MODE_RAMPD				BIT(31)
+#define VE_MODE_H616_VP9_RESERVED		BIT(30)
 #define VE_MODE_PIC_WIDTH_IS_4096		BIT(22)
 #define VE_MODE_PIC_WIDTH_MORE_2048		BIT(21)
 #define VE_MODE_REC_WR_MODE_2MB			(0x01 << 20)
@@ -46,6 +49,15 @@
 #define VE_MODE_DEC_H264			(0x01 << 0)
 #define VE_MODE_DEC_MPEG			(0x00 << 0)
 
+#define VE_RESET				0x04
+
+#define VE_RESET_DEC_REQ_MASK			BIT(17)
+#define VE_RESET_DEC				BIT(16)
+#define VE_RESET_SYNC_IDLE			BIT(9)
+
+#define VE_DEC_COUNTER				0x08
+#define VE_DEC_COUNTER_EN			BIT(31)
+
 #define VE_BUF_CTRL				0x50
 
 #define VE_BUF_CTRL_INTRAPRED_EXT_RAM		(0x02 << 2)
@@ -722,4 +734,123 @@
 #define VE_AVC_REC_SLUMA		0xbbc
 #define VE_AVC_MB_INFO			0xbc0
 
+#define VE_DEC_VP9_HDR_SYN		(VE_ENGINE_DEC_H265 + 0x04)
+#define VE_DEC_VP9_HDR_SYN_TILES_EN		BIT(0)
+#define VE_DEC_VP9_HDR_SYN_INTER_FRAME		BIT(1)
+#define VE_DEC_VP9_HDR_SYN_DEPTH(d)		SHIFT_AND_MASK_BITS(d, 4, 2)
+#define VE_DEC_VP9_HDR_SYN_BIAS_LAST		BIT(5)
+#define VE_DEC_VP9_HDR_SYN_BIAS_GOLDEN		BIT(6)
+#define VE_DEC_VP9_HDR_SYN_BIAS_ALT		BIT(7)
+#define VE_DEC_VP9_HDR_SYN_HP_MV		BIT(8)
+#define VE_DEC_VP9_HDR_SYN_INTERP(v)		SHIFT_AND_MASK_BITS(v, 11, 9)
+#define VE_DEC_VP9_HDR_SYN_LF_EN		BIT(12)
+#define VE_DEC_VP9_HDR_SYN_LF_SHARP(v)		SHIFT_AND_MASK_BITS(v, 15, 13)
+#define VE_DEC_VP9_HDR_SYN_LOSSLESS		BIT(16)
+#define VE_DEC_VP9_HDR_SYN_SEG_EN		BIT(17)
+#define VE_DEC_VP9_HDR_SYN_SEG_UPD_MAP		BIT(18)
+#define VE_DEC_VP9_HDR_SYN_SEG_TEMP_UPD		BIT(19)
+#define VE_DEC_VP9_HDR_SYN_TX_MODE(v)		SHIFT_AND_MASK_BITS(v, 22, 20)
+#define VE_DEC_VP9_HDR_SYN_REF_MODE(v)		SHIFT_AND_MASK_BITS(v, 24, 23)
+#define VE_DEC_VP9_HDR_SYN_USE_PREV_MV		BIT(25)
+#define VE_DEC_VP9_HDR_SYN_HW_EN2		BIT(26)
+#define VE_DEC_VP9_HDR_SYN_CNT_EN		BIT(27)
+#define VE_DEC_VP9_HDR_SYN_DEC_EN		BIT(31)
+
+#define VE_DEC_VP9_PIC_SIZE		(VE_ENGINE_DEC_H265 + 0x08)
+#define VE_DEC_VP9_PIC_WIDTH(w)			SHIFT_AND_MASK_BITS(w, 13, 0)
+#define VE_DEC_VP9_PIC_HEIGHT(h)		SHIFT_AND_MASK_BITS(h, 29, 16)
+
+#define VE_DEC_VP9_LAST_PIC_SIZE	(VE_ENGINE_DEC_H265 + 0x0c)
+#define VE_DEC_VP9_GOLDEN_PIC_SIZE	(VE_ENGINE_DEC_H265 + 0x10)
+#define VE_DEC_VP9_ALTREF_PIC_SIZE	(VE_ENGINE_DEC_H265 + 0x14)
+
+#define VE_DEC_VP9_LAST_SCALE0		(VE_ENGINE_DEC_H265 + 0x18)
+#define VE_DEC_VP9_LAST_SCALE1		(VE_ENGINE_DEC_H265 + 0x1c)
+#define VE_DEC_VP9_GOLDEN_SCALE0	(VE_ENGINE_DEC_H265 + 0x20)
+#define VE_DEC_VP9_GOLDEN_SCALE1	(VE_ENGINE_DEC_H265 + 0x24)
+#define VE_DEC_VP9_ALTREF_SCALE0	(VE_ENGINE_DEC_H265 + 0x28)
+#define VE_DEC_VP9_ALTREF_SCALE1	(VE_ENGINE_DEC_H265 + 0x2c)
+#define VE_DEC_VP9_SCALE_STEP(v)		SHIFT_AND_MASK_BITS(v, 4, 0)
+#define VE_DEC_VP9_SCALE_FACTOR(v)		SHIFT_AND_MASK_BITS(v, 20, 5)
+#define VE_DEC_VP9_SCALE1_STRIDE_ALIGN(v)	SHIFT_AND_MASK_BITS(v, 30, 28)
+
+#define VE_DEC_VP9_FUNC_CTRL		(VE_ENGINE_DEC_H265 + 0x30)
+#define VE_DEC_VP9_FUNC_CTRL_FINISH_INT		BIT(0)
+#define VE_DEC_VP9_FUNC_CTRL_ERR_INT		BIT(1)
+#define VE_DEC_VP9_FUNC_CTRL_DATA_REQ_INT	BIT(2)
+#define VE_DEC_VP9_FUNC_CTRL_MCRI_CACHE		BIT(10)
+#define VE_DEC_VP9_FUNC_CTRL_DDR_CONS		BIT(31)
+#define VE_DEC_VP9_FUNC_CTRL_INT_MASK \
+	(VE_DEC_VP9_FUNC_CTRL_FINISH_INT | \
+	 VE_DEC_VP9_FUNC_CTRL_ERR_INT | \
+	 VE_DEC_VP9_FUNC_CTRL_DATA_REQ_INT)
+
+#define VE_DEC_VP9_TRIGGER		(VE_ENGINE_DEC_H265 + 0x34)
+#define VE_DEC_VP9_TRIGGER_INIT_SWDEC		0x7
+#define VE_DEC_VP9_TRIGGER_DEC_FRAME		0x8
+
+#define VE_DEC_VP9_STATUS		(VE_ENGINE_DEC_H265 + 0x38)
+#define VE_DEC_VP9_STATUS_FINISH		BIT(0)
+#define VE_DEC_VP9_STATUS_ERROR			BIT(1)
+#define VE_DEC_VP9_STATUS_VLD_DATA_REQ		BIT(2)
+#define VE_DEC_VP9_STATUS_BS_DMA_BUSY		BIT(19)
+#define VE_DEC_VP9_STATUS_MASK \
+	(VE_DEC_VP9_STATUS_FINISH | \
+	 VE_DEC_VP9_STATUS_ERROR | \
+	 VE_DEC_VP9_STATUS_VLD_DATA_REQ)
+
+#define VE_DEC_VP9_DEC_CTB_NUM		(VE_ENGINE_DEC_H265 + 0x3c)
+
+#define VE_DEC_VP9_BITS_ADDR		(VE_ENGINE_DEC_H265 + 0x40)
+#define VE_DEC_VP9_BITS_ADDR_FIRST		BIT(30)
+#define VE_DEC_VP9_BITS_ADDR_LAST		BIT(29)
+#define VE_DEC_VP9_BITS_ADDR_VALID		BIT(28)
+#define VE_DEC_VP9_BITS_ADDR_BASE(a)		(((a) >> 8) & GENMASK(27, 0))
+
+#define VE_DEC_VP9_BITS_OFFSET		(VE_ENGINE_DEC_H265 + 0x44)
+#define VE_DEC_VP9_BITS_LEN		(VE_ENGINE_DEC_H265 + 0x48)
+#define VE_DEC_VP9_BITS_END		(VE_ENGINE_DEC_H265 + 0x4c)
+#define VE_DEC_VP9_BITS_END_BASE(a)		((a) >> 8)
+
+#define VE_DEC_VP9_SDRT_CTRL		(VE_ENGINE_DEC_H265 + 0x50)
+#define VE_DEC_VP9_SDRT_LUMA_ADDR	(VE_ENGINE_DEC_H265 + 0x54)
+#define VE_DEC_VP9_SDRT_CHROMA_ADDR	(VE_ENGINE_DEC_H265 + 0x58)
+
+#define VE_DEC_VP9_SEG_FEAT		(VE_ENGINE_DEC_H265 + 0x5c)
+
+#define VE_DEC_VP9_NEIGHBOR_INFO_ADDR	(VE_ENGINE_DEC_H265 + 0x60)
+#define VE_DEC_VP9_NEIGHBOR_INFO_BASE(a)	((a) >> 8)
+
+#define VE_DEC_VP9_ENTRY_POINT_ADDR	(VE_ENGINE_DEC_H265 + 0x64)
+#define VE_DEC_VP9_ENTRY_POINT_BASE(a)		((a) >> 8)
+
+#define VE_DEC_VP9_TILE_START		(VE_ENGINE_DEC_H265 + 0x68)
+#define VE_DEC_VP9_TILE_START_INVALID		BIT(31)
+#define VE_DEC_VP9_TILE_X(x)			SHIFT_AND_MASK_BITS(x, 8, 0)
+#define VE_DEC_VP9_TILE_Y(y)			SHIFT_AND_MASK_BITS(y, 24, 16)
+#define VE_DEC_VP9_TILE_END		(VE_ENGINE_DEC_H265 + 0x6c)
+
+#define VE_DEC_VP9_COL_MV_ADDR		(VE_ENGINE_DEC_H265 + 0x78)
+#define VE_DEC_VP9_ALTREF_CHROMA_ADDR	(VE_ENGINE_DEC_H265 + 0x7c)
+
+#define VE_DEC_VP9_FIRST_OUT_OFFSET	(VE_ENGINE_DEC_H265 + 0x84)
+#define VE_DEC_VP9_10BIT_CFG		(VE_ENGINE_DEC_H265 + 0x8c)
+#define VE_DEC_VP9_10BIT_CFG_STRIDE(s)		SHIFT_AND_MASK_BITS(s, 11, 0)
+
+#define VE_DEC_VP9_CUR_LUMA_ADDR	(VE_ENGINE_DEC_H265 + 0x90)
+#define VE_DEC_VP9_CUR_CHROMA_ADDR	(VE_ENGINE_DEC_H265 + 0x94)
+#define VE_DEC_VP9_LAST_LUMA_ADDR	(VE_ENGINE_DEC_H265 + 0x98)
+#define VE_DEC_VP9_LAST_CHROMA_ADDR	(VE_ENGINE_DEC_H265 + 0x9c)
+#define VE_DEC_VP9_GOLDEN_LUMA_ADDR	(VE_ENGINE_DEC_H265 + 0xa0)
+#define VE_DEC_VP9_GOLDEN_CHROMA_ADDR	(VE_ENGINE_DEC_H265 + 0xa4)
+#define VE_DEC_VP9_ALTREF_LUMA_ADDR	(VE_ENGINE_DEC_H265 + 0xa8)
+
+#define VE_DEC_VP9_FB_ADDR(a)		((a) >> 8)
+#define VE_DEC_VP9_BUF_ADDR(a)		((a) >> 8)
+
+#define VE_DEC_VP9_SRAM_OFFSET		(VE_ENGINE_DEC_H265 + 0xe0)
+#define VE_DEC_VP9_SRAM_OFFSET_DEQUANT		0x000
+#define VE_DEC_VP9_SRAM_OFFSET_LF		0x100
+#define VE_DEC_VP9_SRAM_DATA		(VE_ENGINE_DEC_H265 + 0xe4)
+
 #endif
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index a46820a90d87..6de89149ff45 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -50,6 +50,11 @@ static struct cedrus_format cedrus_formats[] = {
 		.directions	= CEDRUS_DECODE_SRC,
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
+	{
+		.pixelformat	= V4L2_PIX_FMT_VP9_FRAME,
+		.directions	= CEDRUS_DECODE_SRC,
+		.capabilities	= CEDRUS_CAPABILITY_VP9_DEC,
+	},
 	{
 		.pixelformat	= V4L2_PIX_FMT_NV12,
 		.directions	= CEDRUS_DECODE_DST,
@@ -86,6 +91,12 @@ static bool cedrus_check_format(struct cedrus_ctx *ctx,
 	    !(fmt->directions & directions))
 		return false;
 
+	/* The 10-bit VP9 2-bit plane would overlap the tiled chroma plane. */
+	if (ctx->src_fmt.pixelformat == V4L2_PIX_FMT_VP9_FRAME &&
+	    ctx->bit_depth > 8 &&
+	    fmt->pixelformat == V4L2_PIX_FMT_NV12_32L32)
+		return false;
+
 	return true;
 }
 
@@ -133,10 +144,14 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 	case V4L2_PIX_FMT_H264_SLICE:
 	case V4L2_PIX_FMT_HEVC_SLICE:
 	case V4L2_PIX_FMT_VP8_FRAME:
+	case V4L2_PIX_FMT_VP9_FRAME:
 		/* Zero bytes per line for encoded source. */
 		bytesperline = 0;
 		/* Choose some minimum size since this can't be 0 */
 		sizeimage = max_t(u32, SZ_1K, sizeimage);
+		/* 1 KiB end address granularity, rounding up could wrap. */
+		if (pix_fmt->pixelformat == V4L2_PIX_FMT_VP9_FRAME)
+			sizeimage = ALIGN_DOWN(sizeimage, SZ_1K);
 		break;
 
 	case V4L2_PIX_FMT_NV12_32L32:
@@ -265,6 +280,19 @@ static int cedrus_try_fmt_vid_cap_p(struct cedrus_ctx *ctx,
 	pix_fmt->height = ctx->src_fmt.height;
 	cedrus_prepare_format(pix_fmt);
 
+	/* See cedrus_vp9_stride_align(). */
+	if (ctx->src_fmt.pixelformat == V4L2_PIX_FMT_VP9_FRAME &&
+	    (pix_fmt->pixelformat == V4L2_PIX_FMT_NV12 ||
+	     pix_fmt->pixelformat == V4L2_PIX_FMT_NV21 ||
+	     cedrus_vp9_is_planar(pix_fmt->pixelformat))) {
+		if (cedrus_vp9_is_planar(pix_fmt->pixelformat))
+			pix_fmt->height = ALIGN(ctx->src_fmt.height, 8);
+		pix_fmt->bytesperline =
+			ALIGN(pix_fmt->width,
+			      cedrus_vp9_stride_align(pix_fmt->pixelformat));
+		pix_fmt->sizeimage = pix_fmt->bytesperline * pix_fmt->height * 3 / 2;
+	}
+
 	if (ctx->current_codec->extra_cap_size)
 		pix_fmt->sizeimage +=
 			ctx->current_codec->extra_cap_size(ctx, pix_fmt);
@@ -365,6 +393,9 @@ static int cedrus_s_fmt_vid_out_p(struct cedrus_ctx *ctx,
 	case V4L2_PIX_FMT_VP8_FRAME:
 		ctx->current_codec = &cedrus_dec_ops_vp8;
 		break;
+	case V4L2_PIX_FMT_VP9_FRAME:
+		ctx->current_codec = &cedrus_dec_ops_vp9;
+		break;
 	}
 
 	/* Propagate format information to capture. */
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp9.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp9.c
new file mode 100644
index 000000000000..3aef8566ff9a
--- /dev/null
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp9.c
@@ -0,0 +1,1253 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cedrus VPU driver
+ *
+ * Copyright (c) 2026 Jernej Skrabec <jernej.skrabec@gmail.com>
+ */
+
+#include <linux/log2.h>
+#include <linux/types.h>
+
+#include <media/v4l2-vp9.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "cedrus.h"
+#include "cedrus_hw.h"
+#include "cedrus_regs.h"
+#include "cedrus_video.h"
+
+#define CEDRUS_VP9_PROB_TBL_SIZE	0x88000
+#define CEDRUS_VP9_PROBS_OFFSET		0x4000
+#define CEDRUS_VP9_PROBS_SIZE		0xafc
+#define CEDRUS_VP9_CTX_OFFSET		0x4b00
+#define CEDRUS_VP9_SEGMAP_OFFSET	0x8000
+#define CEDRUS_VP9_NEIGHBOR_BUF_SIZE	0x1f4000
+
+/* The hardware reads up to 4 rows past the 2-bit plane. */
+#define CEDRUS_VP9_2BIT_TAIL_ROWS	8
+
+static u32 cedrus_vp9_stride_align_field(u32 pixelformat)
+{
+	return VE_DEC_VP9_SCALE1_STRIDE_ALIGN(ilog2(cedrus_vp9_stride_align(pixelformat) / 8));
+}
+
+static const u16 vp9_dc_qlookup[256] = {
+	4,    8,    8,    9,    10,   11,   12,   12,
+	13,   14,   15,   16,   17,   18,   19,   19,
+	20,   21,   22,   23,   24,   25,   26,   26,
+	27,   28,   29,   30,   31,   32,   32,   33,
+	34,   35,   36,   37,   38,   38,   39,   40,
+	41,   42,   43,   43,   44,   45,   46,   47,
+	48,   48,   49,   50,   51,   52,   53,   53,
+	54,   55,   56,   57,   57,   58,   59,   60,
+	61,   62,   62,   63,   64,   65,   66,   66,
+	67,   68,   69,   70,   70,   71,   72,   73,
+	74,   74,   75,   76,   77,   78,   78,   79,
+	80,   81,   81,   82,   83,   84,   85,   85,
+	87,   88,   90,   92,   93,   95,   96,   98,
+	99,   101,  102,  104,  105,  107,  108,  110,
+	111,  113,  114,  116,  117,  118,  120,  121,
+	123,  125,  127,  129,  131,  134,  136,  138,
+	140,  142,  144,  146,  148,  150,  152,  154,
+	156,  158,  161,  164,  166,  169,  172,  174,
+	177,  180,  182,  185,  187,  190,  192,  195,
+	199,  202,  205,  208,  211,  214,  217,  220,
+	223,  226,  230,  233,  237,  240,  243,  247,
+	250,  253,  257,  261,  265,  269,  272,  276,
+	280,  284,  288,  292,  296,  300,  304,  309,
+	313,  317,  322,  326,  330,  335,  340,  344,
+	349,  354,  359,  364,  369,  374,  379,  384,
+	389,  395,  400,  406,  411,  417,  423,  429,
+	435,  441,  447,  454,  461,  467,  475,  482,
+	489,  497,  505,  513,  522,  530,  539,  549,
+	559,  569,  579,  590,  602,  614,  626,  640,
+	654,  668,  684,  700,  717,  736,  755,  775,
+	796,  819,  843,  869,  896,  925,  955,  988,
+	1022, 1058, 1098, 1139, 1184, 1232, 1282, 1336,
+};
+
+static const u16 vp9_ac_qlookup[256] = {
+	4,    8,    9,    10,   11,   12,   13,   14,
+	15,   16,   17,   18,   19,   20,   21,   22,
+	23,   24,   25,   26,   27,   28,   29,   30,
+	31,   32,   33,   34,   35,   36,   37,   38,
+	39,   40,   41,   42,   43,   44,   45,   46,
+	47,   48,   49,   50,   51,   52,   53,   54,
+	55,   56,   57,   58,   59,   60,   61,   62,
+	63,   64,   65,   66,   67,   68,   69,   70,
+	71,   72,   73,   74,   75,   76,   77,   78,
+	79,   80,   81,   82,   83,   84,   85,   86,
+	87,   88,   89,   90,   91,   92,   93,   94,
+	95,   96,   97,   98,   99,   100,  101,  102,
+	104,  106,  108,  110,  112,  114,  116,  118,
+	120,  122,  124,  126,  128,  130,  132,  134,
+	136,  138,  140,  142,  144,  146,  148,  150,
+	152,  155,  158,  161,  164,  167,  170,  173,
+	176,  179,  182,  185,  188,  191,  194,  197,
+	200,  203,  207,  211,  215,  219,  223,  227,
+	231,  235,  239,  243,  247,  251,  255,  260,
+	265,  270,  275,  280,  285,  290,  295,  300,
+	305,  311,  317,  323,  329,  335,  341,  347,
+	353,  359,  366,  373,  380,  387,  394,  401,
+	408,  416,  424,  432,  440,  448,  456,  465,
+	474,  483,  492,  501,  510,  520,  530,  540,
+	550,  560,  571,  582,  593,  604,  615,  627,
+	639,  651,  663,  676,  689,  702,  715,  729,
+	743,  757,  771,  786,  801,  816,  832,  848,
+	864,  881,  898,  915,  933,  951,  969,  988,
+	1007, 1026, 1046, 1066, 1087, 1108, 1129, 1151,
+	1173, 1196, 1219, 1243, 1267, 1292, 1317, 1343,
+	1369, 1396, 1423, 1451, 1479, 1508, 1537, 1567,
+	1597, 1628, 1660, 1692, 1725, 1759, 1793, 1828,
+};
+
+static const u16 vp9_dc_qlookup_10[256] = {
+	4, 9, 10, 13, 15, 17, 20, 22,
+	25, 28, 31, 34, 37, 40, 43, 47,
+	50, 53, 57, 60, 64, 68, 71, 75,
+	78, 82, 86, 90, 93, 97, 101, 105,
+	109, 113, 116, 120, 124, 128, 132, 136,
+	140, 143, 147, 151, 155, 159, 163, 166,
+	170, 174, 178, 182, 185, 189, 193, 197,
+	200, 204, 208, 212, 215, 219, 223, 226,
+	230, 233, 237, 241, 244, 248, 251, 255,
+	259, 262, 266, 269, 273, 276, 280, 283,
+	287, 290, 293, 297, 300, 304, 307, 310,
+	314, 317, 321, 324, 327, 331, 334, 337,
+	343, 350, 356, 362, 369, 375, 381, 387,
+	394, 400, 406, 412, 418, 424, 430, 436,
+	442, 448, 454, 460, 466, 472, 478, 484,
+	490, 499, 507, 516, 525, 533, 542, 550,
+	559, 567, 576, 584, 592, 601, 609, 617,
+	625, 634, 644, 655, 666, 676, 687, 698,
+	708, 718, 729, 739, 749, 759, 770, 782,
+	795, 807, 819, 831, 844, 856, 868, 880,
+	891, 906, 920, 933, 947, 961, 975, 988,
+	1001, 1015, 1030, 1045, 1061, 1076, 1090, 1105,
+	1120, 1137, 1153, 1170, 1186, 1202, 1218, 1236,
+	1253, 1271, 1288, 1306, 1323, 1342, 1361, 1379,
+	1398, 1416, 1436, 1456, 1476, 1496, 1516, 1537,
+	1559, 1580, 1601, 1624, 1647, 1670, 1692, 1717,
+	1741, 1766, 1791, 1817, 1844, 1871, 1900, 1929,
+	1958, 1990, 2021, 2054, 2088, 2123, 2159, 2197,
+	2236, 2276, 2319, 2363, 2410, 2458, 2508, 2561,
+	2616, 2675, 2737, 2802, 2871, 2944, 3020, 3102,
+	3188, 3280, 3375, 3478, 3586, 3702, 3823, 3953,
+	4089, 4236, 4394, 4559, 4737, 4929, 5130, 5347,
+};
+
+static const u16 vp9_ac_qlookup_10[256] = {
+	4, 9, 11, 13, 16, 18, 21, 24,
+	27, 30, 33, 37, 40, 44, 48, 51,
+	55, 59, 63, 67, 71, 75, 79, 83,
+	88, 92, 96, 100, 105, 109, 114, 118,
+	122, 127, 131, 136, 140, 145, 149, 154,
+	158, 163, 168, 172, 177, 181, 186, 190,
+	195, 199, 204, 208, 213, 217, 222, 226,
+	231, 235, 240, 244, 249, 253, 258, 262,
+	267, 271, 275, 280, 284, 289, 293, 297,
+	302, 306, 311, 315, 319, 324, 328, 332,
+	337, 341, 345, 349, 354, 358, 362, 367,
+	371, 375, 379, 384, 388, 392, 396, 401,
+	409, 417, 425, 433, 441, 449, 458, 466,
+	474, 482, 490, 498, 506, 514, 523, 531,
+	539, 547, 555, 563, 571, 579, 588, 596,
+	604, 616, 628, 640, 652, 664, 676, 688,
+	700, 713, 725, 737, 749, 761, 773, 785,
+	797, 809, 825, 841, 857, 873, 889, 905,
+	922, 938, 954, 970, 986, 1002, 1018, 1038,
+	1058, 1078, 1098, 1118, 1138, 1158, 1178, 1198,
+	1218, 1242, 1266, 1290, 1314, 1338, 1362, 1386,
+	1411, 1435, 1463, 1491, 1519, 1547, 1575, 1603,
+	1631, 1663, 1695, 1727, 1759, 1791, 1823, 1859,
+	1895, 1931, 1967, 2003, 2039, 2079, 2119, 2159,
+	2199, 2239, 2283, 2327, 2371, 2415, 2459, 2507,
+	2555, 2603, 2651, 2703, 2755, 2807, 2859, 2915,
+	2971, 3027, 3083, 3143, 3203, 3263, 3327, 3391,
+	3455, 3523, 3591, 3659, 3731, 3803, 3876, 3952,
+	4028, 4104, 4184, 4264, 4348, 4432, 4516, 4604,
+	4692, 4784, 4876, 4972, 5068, 5168, 5268, 5372,
+	5476, 5584, 5692, 5804, 5916, 6032, 6148, 6268,
+	6388, 6512, 6640, 6768, 6900, 7036, 7172, 7312,
+};
+
+struct cedrus_vp9_hw_nmv_comp {
+	u32 sign[2];
+	u32 class0[2];
+	u32 class0_hp[2];
+	u32 hp[2];
+	u32 classes[11];
+	u32 bits[10][2];
+	u32 class0_fp[2][4];
+	u32 fp[4];
+};
+
+struct cedrus_vp9_entropy_counts {
+	u32 tx8x8[2][2];
+	u32 tx16x16[2][3];
+	u32 tx32x32[2][4];
+	u32 eobs[4][2][2][6][6];
+	u32 coeffs[4][2][2][6][6][4];
+	u32 mbskip[3][2];
+	u32 inter_mode[7][4];
+	u32 switchable_interp[4][3];
+	u32 intra_inter[4][2];
+	u32 comp_inter[5][2];
+	u32 comp_ref[5][2];
+	u32 single_ref[5][2][2];
+	u32 sb_ymode[4][10];
+	u32 uv_mode[10][10];
+	u32 partition[16][4];
+	u32 joints[4];
+	/* Column first, unlike v4l2. */
+	struct cedrus_vp9_hw_nmv_comp comp[2];
+};
+
+static_assert(sizeof(struct cedrus_vp9_entropy_counts) == 0x3398,
+	      "cedrus_vp9_entropy_counts size mismatch");
+static_assert(offsetof(struct cedrus_vp9_entropy_counts, coeffs) == 0x948,
+	      "cedrus_vp9_entropy_counts coeffs offset mismatch");
+static_assert(offsetof(struct cedrus_vp9_entropy_counts, joints) == 0x31f0,
+	      "cedrus_vp9_entropy_counts joints offset mismatch");
+
+struct cedrus_vp9_nmv_counts {
+	u32 joints[4];
+	u32 sign[2][2];
+	u32 classes[2][11];
+	u32 class0[2][2];
+	u32 bits[2][10][2];
+	u32 class0_fp[2][2][4];
+	u32 fp[2][4];
+	u32 class0_hp[2][2];
+	u32 hp[2][2];
+};
+
+struct cedrus_vp9_ctx {
+	void		*prob_tbl;
+	dma_addr_t	prob_tbl_dma;
+
+	void		*neighbor_buf;
+	dma_addr_t	neighbor_buf_dma;
+
+	void		*col_mv_buf;
+	dma_addr_t	col_mv_buf_dma;
+	size_t		col_mv_buf_size;
+
+	/* [segment][DC, AC] */
+	s16		y_dequant[8][2];
+	s16		uv_dequant[8][2];
+
+	/* [segment][ref][mode] */
+	u8		lf_lvl[8][4][2];
+
+	struct v4l2_vp9_frame_context	frame_ctx[4];
+	struct v4l2_vp9_frame_context	cur_probs;
+	u8				frame_ctx_idx;
+
+	struct v4l2_vp9_frame_symbol_counts	symbol_counts;
+	u32					tx16p_padded[2][4];
+	struct cedrus_vp9_nmv_counts		nmv_counts;
+
+	bool		pending;
+	bool		decode_ok;
+
+	u32		last_flags;
+	u32		last_w;
+	u32		last_h;
+	bool		last_valid;
+};
+
+static struct cedrus_vp9_ctx *cedrus_vp9_ctx(struct cedrus_ctx *ctx)
+{
+	return ctx->codec.vp9;
+}
+
+/* Error resilient mode implies frame parallel decoding mode. */
+static bool cedrus_vp9_parallel(const struct v4l2_ctrl_vp9_frame *dec)
+{
+	return dec->flags & (V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE |
+			     V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT);
+}
+
+static u32 cedrus_vp9_2bit_stride(unsigned int width)
+{
+	return ALIGN(DIV_ROUND_UP(width, 4), 32);
+}
+
+static int cedrus_vp9_seg_qindex(const struct v4l2_ctrl_vp9_frame *dec,
+				 unsigned int seg_id)
+{
+	const struct v4l2_vp9_segmentation *seg = &dec->seg;
+	int q = dec->quant.base_q_idx;
+
+	if (!(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED) ||
+	    !v4l2_vp9_seg_feat_enabled(seg->feature_enabled,
+				       V4L2_VP9_SEG_LVL_ALT_Q, seg_id))
+		return clamp(q, 0, 255);
+
+	if (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE)
+		q = seg->feature_data[seg_id][V4L2_VP9_SEG_LVL_ALT_Q];
+	else
+		q += seg->feature_data[seg_id][V4L2_VP9_SEG_LVL_ALT_Q];
+
+	return clamp(q, 0, 255);
+}
+
+static int cedrus_vp9_dc(int qindex, int delta, unsigned int bit_depth)
+{
+	const u16 *tbl = (bit_depth == 10) ? vp9_dc_qlookup_10 :
+						     vp9_dc_qlookup;
+
+	return tbl[clamp(qindex + delta, 0, 255)];
+}
+
+static int cedrus_vp9_ac(int qindex, int delta, unsigned int bit_depth)
+{
+	const u16 *tbl = (bit_depth == 10) ? vp9_ac_qlookup_10 :
+						     vp9_ac_qlookup;
+
+	return tbl[clamp(qindex + delta, 0, 255)];
+}
+
+static void cedrus_vp9_build_dequant(struct cedrus_vp9_ctx *vp9,
+				     const struct v4l2_ctrl_vp9_frame *dec)
+{
+	unsigned int i, num_segments = 1;
+
+	memset(vp9->y_dequant, 0, sizeof(vp9->y_dequant));
+	memset(vp9->uv_dequant, 0, sizeof(vp9->uv_dequant));
+
+	if (dec->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED)
+		num_segments = 8;
+
+	for (i = 0; i < num_segments; i++) {
+		int q = cedrus_vp9_seg_qindex(dec, i);
+
+		vp9->y_dequant[i][0] = cedrus_vp9_dc(q, dec->quant.delta_q_y_dc,
+						     dec->bit_depth);
+		vp9->y_dequant[i][1] = cedrus_vp9_ac(q, 0, dec->bit_depth);
+		vp9->uv_dequant[i][0] = cedrus_vp9_dc(q, dec->quant.delta_q_uv_dc,
+						      dec->bit_depth);
+		vp9->uv_dequant[i][1] = cedrus_vp9_ac(q, dec->quant.delta_q_uv_ac,
+						      dec->bit_depth);
+	}
+}
+
+static void cedrus_vp9_build_lf_lvl(struct cedrus_vp9_ctx *vp9,
+				    const struct v4l2_ctrl_vp9_frame *dec)
+{
+	const struct v4l2_vp9_loop_filter *lf = &dec->lf;
+	const struct v4l2_vp9_segmentation *seg = &dec->seg;
+	bool seg_en = !!(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED);
+	bool abs_upd = !!(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE);
+	bool delta_en = !!(lf->flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED);
+	int scale = 1 << (lf->level >> 5);
+	unsigned int seg_id, ref, mode;
+
+	for (seg_id = 0; seg_id < 8; seg_id++) {
+		int seg_lvl = lf->level;
+
+		if (seg_en &&
+		    v4l2_vp9_seg_feat_enabled(seg->feature_enabled,
+					      V4L2_VP9_SEG_LVL_ALT_L, seg_id)) {
+			s16 d = seg->feature_data[seg_id][V4L2_VP9_SEG_LVL_ALT_L];
+
+			seg_lvl = abs_upd ? d : (int)lf->level + d;
+			seg_lvl = clamp(seg_lvl, 0, 63);
+		}
+
+		if (!delta_en) {
+			memset(vp9->lf_lvl[seg_id], seg_lvl,
+			       sizeof(vp9->lf_lvl[seg_id]));
+			continue;
+		}
+
+		vp9->lf_lvl[seg_id][0][0] =
+			clamp(seg_lvl + lf->ref_deltas[0] * scale, 0, 63);
+		vp9->lf_lvl[seg_id][0][1] = vp9->lf_lvl[seg_id][0][0];
+
+		for (ref = 1; ref < 4; ref++)
+			for (mode = 0; mode < 2; mode++)
+				vp9->lf_lvl[seg_id][ref][mode] =
+					clamp(seg_lvl +
+					      (lf->ref_deltas[ref] +
+					       lf->mode_deltas[mode]) * scale,
+					      0, 63);
+	}
+}
+
+static u32 cedrus_vp9_seg_feat_reg(const struct v4l2_ctrl_vp9_frame *dec)
+{
+	const struct v4l2_vp9_segmentation *seg = &dec->seg;
+	u32 reg = 0;
+	unsigned int i;
+
+	if (!(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED))
+		return 0;
+
+	for (i = 0; i < 8; i++) {
+		u8 fe = seg->feature_enabled[i];
+
+		if (fe & V4L2_VP9_SEGMENT_FEATURE_ENABLED(V4L2_VP9_SEG_LVL_REF_FRAME)) {
+			reg |= BIT(i);
+			reg |= ((u32)seg->feature_data[i][V4L2_VP9_SEG_LVL_REF_FRAME] & 3)
+			       << (16 + i * 2);
+		}
+		if (fe & V4L2_VP9_SEGMENT_FEATURE_ENABLED(V4L2_VP9_SEG_LVL_SKIP))
+			reg |= BIT(8 + i);
+	}
+	return reg;
+}
+
+static bool cedrus_vp9_valid_ref_size(u32 ref_w, u32 ref_h,
+				      u32 cur_w, u32 cur_h)
+{
+	return 2 * cur_w >= ref_w && 2 * cur_h >= ref_h &&
+	       cur_w <= 16 * ref_w && cur_h <= 16 * ref_h;
+}
+
+static void cedrus_vp9_ref_scale(u32 ref_w, u32 ref_h, u32 cur_w, u32 cur_h,
+				 u32 *reg0, u32 *reg1)
+{
+	u32 xfp, yfp, xstep, ystep;
+
+	if (!ref_w || !ref_h || !cur_w || !cur_h) {
+		*reg0 = 0;
+		*reg1 = 0;
+		return;
+	}
+
+	xfp = (ref_w << 14) / cur_w;
+	yfp = (ref_h << 14) / cur_h;
+	xstep = xfp >> 10;
+	ystep = yfp >> 10;
+
+	*reg0 = VE_DEC_VP9_SCALE_STEP(xstep - 1) |
+		VE_DEC_VP9_SCALE_FACTOR(xfp);
+	*reg1 = VE_DEC_VP9_SCALE_STEP(ystep - 1) |
+		VE_DEC_VP9_SCALE_FACTOR(yfp);
+}
+
+/* The SRAM address auto-increments with each data write. */
+static void cedrus_vp9_write_sram(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	struct cedrus_vp9_ctx *vp9 = cedrus_vp9_ctx(ctx);
+	unsigned int i;
+
+	cedrus_write(dev, VE_DEC_VP9_SRAM_OFFSET, VE_DEC_VP9_SRAM_OFFSET_DEQUANT);
+
+	for (i = 0; i < 8; i++) {
+		u32 v = (u16)vp9->y_dequant[i][0] |
+			(u32)(u16)vp9->y_dequant[i][1] << 16;
+		cedrus_write(dev, VE_DEC_VP9_SRAM_DATA, v);
+	}
+	for (i = 0; i < 8; i++) {
+		u32 v = (u16)vp9->uv_dequant[i][0] |
+			(u32)(u16)vp9->uv_dequant[i][1] << 16;
+		cedrus_write(dev, VE_DEC_VP9_SRAM_DATA, v);
+	}
+
+	cedrus_write(dev, VE_DEC_VP9_SRAM_OFFSET, VE_DEC_VP9_SRAM_OFFSET_LF);
+
+	for (i = 0; i < 8; i++) {
+		const u8 *l = vp9->lf_lvl[i][0];
+		u32 w0 = (l[0] & 0x3f) |
+			 ((u32)(l[2] & 0x3f) << 16) |
+			 ((u32)(l[3] & 0x3f) << 24);
+		u32 w1 = (l[4] & 0x3f) |
+			 ((u32)(l[5] & 0x3f) << 8) |
+			 ((u32)(l[6] & 0x3f) << 16) |
+			 ((u32)(l[7] & 0x3f) << 24);
+
+		cedrus_write(dev, VE_DEC_VP9_SRAM_DATA, w0);
+		cedrus_write(dev, VE_DEC_VP9_SRAM_DATA, w1);
+	}
+}
+
+static void cedrus_vp9_init_count_coeffs(struct cedrus_vp9_ctx *vp9)
+{
+	struct cedrus_vp9_entropy_counts *cnts =
+		vp9->prob_tbl + CEDRUS_VP9_CTX_OFFSET;
+	struct v4l2_vp9_frame_symbol_counts *sc = &vp9->symbol_counts;
+	unsigned int i, j, k, l, m;
+
+	for (i = 0; i < 4; i++) {
+		for (j = 0; j < 2; j++) {
+			for (k = 0; k < 2; k++) {
+				for (l = 0; l < 6; l++) {
+					for (m = 0; m < 6; m++) {
+						u32 *coef = cnts->coeffs[i][j][k][l][m];
+
+						sc->coeff[i][j][k][l][m] = (u32 (*)[3])coef;
+						sc->eob[i][j][k][l][m][0] =
+							&cnts->eobs[i][j][k][l][m];
+						sc->eob[i][j][k][l][m][1] = &coef[3];
+					}
+				}
+			}
+		}
+	}
+}
+
+static void cedrus_vp9_init_counts(struct cedrus_vp9_ctx *vp9)
+{
+	struct cedrus_vp9_entropy_counts *cnts =
+		vp9->prob_tbl + CEDRUS_VP9_CTX_OFFSET;
+	struct v4l2_vp9_frame_symbol_counts *sc = &vp9->symbol_counts;
+
+	sc->partition   = &cnts->partition;
+	sc->skip        = &cnts->mbskip;
+	sc->intra_inter = &cnts->intra_inter;
+	sc->tx32p       = &cnts->tx32x32;
+	sc->tx8p        = &cnts->tx8x8;
+	sc->y_mode      = &cnts->sb_ymode;
+	sc->uv_mode     = &cnts->uv_mode;
+	sc->comp        = &cnts->comp_inter;
+	sc->comp_ref    = &cnts->comp_ref;
+	sc->single_ref  = &cnts->single_ref;
+	sc->mv_mode     = &cnts->inter_mode;
+	sc->filter      = &cnts->switchable_interp;
+	sc->mv_joint    = &vp9->nmv_counts.joints;
+	sc->sign        = &vp9->nmv_counts.sign;
+	sc->classes     = &vp9->nmv_counts.classes;
+	sc->class0      = &vp9->nmv_counts.class0;
+	sc->bits        = &vp9->nmv_counts.bits;
+	sc->class0_fp   = &vp9->nmv_counts.class0_fp;
+	sc->fp          = &vp9->nmv_counts.fp;
+	sc->class0_hp   = &vp9->nmv_counts.class0_hp;
+	sc->hp          = &vp9->nmv_counts.hp;
+
+	cedrus_vp9_init_count_coeffs(vp9);
+}
+
+static void cedrus_vp9_translate_nmv_counts(struct cedrus_vp9_ctx *vp9)
+{
+	struct cedrus_vp9_entropy_counts *cnts =
+		vp9->prob_tbl + CEDRUS_VP9_CTX_OFFSET;
+	struct cedrus_vp9_nmv_counts *nmv = &vp9->nmv_counts;
+	unsigned int c;
+
+	memcpy(nmv->joints, cnts->joints, sizeof(nmv->joints));
+
+	for (c = 0; c < 2; c++) {
+		const struct cedrus_vp9_hw_nmv_comp *hw = &cnts->comp[1 - c];
+
+		memcpy(nmv->sign[c], hw->sign, sizeof(nmv->sign[c]));
+		memcpy(nmv->class0[c], hw->class0, sizeof(nmv->class0[c]));
+		memcpy(nmv->class0_hp[c], hw->class0_hp,
+		       sizeof(nmv->class0_hp[c]));
+		memcpy(nmv->hp[c], hw->hp, sizeof(nmv->hp[c]));
+		memcpy(nmv->classes[c], hw->classes, sizeof(nmv->classes[c]));
+		memcpy(nmv->bits[c], hw->bits, sizeof(nmv->bits[c]));
+		memcpy(nmv->class0_fp[c], hw->class0_fp,
+		       sizeof(nmv->class0_fp[c]));
+		memcpy(nmv->fp[c], hw->fp, sizeof(nmv->fp[c]));
+	}
+}
+
+static enum cedrus_irq_status cedrus_vp9_irq_status(struct cedrus_ctx *ctx)
+{
+	struct cedrus_vp9_ctx *vp9 = cedrus_vp9_ctx(ctx);
+	u32 reg = cedrus_read(ctx->dev, VE_DEC_VP9_STATUS) &
+		  VE_DEC_VP9_STATUS_MASK;
+
+	if (reg & (VE_DEC_VP9_STATUS_ERROR | VE_DEC_VP9_STATUS_VLD_DATA_REQ)) {
+		vp9->decode_ok = false;
+		return CEDRUS_IRQ_ERROR;
+	}
+
+	if (reg & VE_DEC_VP9_STATUS_FINISH) {
+		vp9->decode_ok = true;
+		return CEDRUS_IRQ_OK;
+	}
+
+	return CEDRUS_IRQ_NONE;
+}
+
+static void cedrus_vp9_irq_clear(struct cedrus_ctx *ctx)
+{
+	cedrus_write(ctx->dev, VE_DEC_VP9_STATUS, VE_DEC_VP9_STATUS_MASK);
+}
+
+static void cedrus_vp9_irq_disable(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	u32 reg = cedrus_read(dev, VE_DEC_VP9_FUNC_CTRL);
+
+	cedrus_write(dev, VE_DEC_VP9_FUNC_CTRL,
+		     reg & ~VE_DEC_VP9_FUNC_CTRL_INT_MASK);
+}
+
+static void cedrus_vp9_pack_mv_comp(u8 *buf,
+				    const struct v4l2_vp9_frame_mv_context *mv,
+				    unsigned int comp)
+{
+	buf[0x00] = mv->sign[comp];
+	buf[0x01] = mv->class0_bit[comp];
+	buf[0x02] = mv->class0_hp[comp];
+	buf[0x03] = mv->hp[comp];
+	memcpy(buf + 0x04, mv->class0_fr[comp][0], 3);
+	memcpy(buf + 0x08, mv->class0_fr[comp][1], 3);
+	memcpy(buf + 0x0c, mv->classes[comp], 10);
+	memcpy(buf + 0x1c, mv->bits[comp], 10);
+	memcpy(buf + 0x28, mv->fr[comp], 3);
+}
+
+static void cedrus_vp9_write_probs(struct cedrus_vp9_ctx *vp9,
+				   const struct v4l2_ctrl_vp9_frame *dec)
+{
+	const struct v4l2_vp9_frame_context *p = &vp9->cur_probs;
+	u8 *buf = vp9->prob_tbl + CEDRUS_VP9_PROBS_OFFSET;
+	unsigned int i, j, k, l, m;
+	u8 *coef;
+
+	memset(buf, 0, CEDRUS_VP9_PROBS_SIZE);
+
+	buf[0x000] = p->tx8[0][0];
+	buf[0x001] = p->tx8[1][0];
+	memcpy(buf + 0x004, p->tx16[0], 2);
+	memcpy(buf + 0x008, p->tx16[1], 2);
+	memcpy(buf + 0x00c, p->tx32[0], 3);
+	memcpy(buf + 0x010, p->tx32[1], 3);
+
+	coef = buf + 0x014;
+	for (i = 0; i < 4; i++)
+		for (j = 0; j < 2; j++)
+			for (k = 0; k < 2; k++)
+				for (l = 0; l < 6; l++)
+					for (m = 0; m < 6; m++) {
+						memcpy(coef, p->coef[i][j][k][l][m], 3);
+						coef += 4;
+					}
+
+	memcpy(buf + 0x914, p->skip, 3);
+	for (i = 0; i < 7; i++)
+		memcpy(buf + 0x918 + i * 4, p->inter_mode[i], 3);
+	for (i = 0; i < 4; i++)
+		memcpy(buf + 0x934 + i * 4, p->interp_filter[i], 2);
+	memcpy(buf + 0x944, p->is_inter, 4);
+	memcpy(buf + 0x948, p->comp_mode, 4);
+	buf[0x94c] = p->comp_mode[4];
+	memcpy(buf + 0x950, p->comp_ref, 4);
+	buf[0x954] = p->comp_ref[4];
+	for (i = 0; i < 4; i++)
+		memcpy(buf + 0x958 + i * 4, p->single_ref[i], 2);
+	memcpy(buf + 0x968, p->single_ref[4], 2);
+	for (i = 0; i < 4; i++)
+		memcpy(buf + 0x970 + i * 0x10, p->y_mode[i], 9);
+	for (i = 0; i < 10; i++)
+		memcpy(buf + 0x9b0 + i * 0x10, p->uv_mode[i], 9);
+	for (i = 0; i < 16; i++)
+		memcpy(buf + 0xa50 + i * 4, p->partition[i], 3);
+
+	memcpy(buf + 0xa90, p->mv.joint, 3);
+	cedrus_vp9_pack_mv_comp(buf + 0xa94, &p->mv, 1);
+	cedrus_vp9_pack_mv_comp(buf + 0xac4, &p->mv, 0);
+
+	if (dec->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED) {
+		memcpy(buf + 0xaf0, dec->seg.tree_probs, 7);
+		memcpy(buf + 0xaf8, dec->seg.pred_probs, 3);
+	}
+}
+
+static u32 cedrus_vp9_tile_offset(u32 tile_no, u32 mis, u32 log2_tile_count)
+{
+	u32 sb64s = (mis + 7) >> 3;
+
+	return min(((sb64s * tile_no) >> log2_tile_count) << 3, mis);
+}
+
+static void cedrus_vp9_write_tile_list(struct cedrus_vp9_ctx *vp9,
+				       const struct v4l2_ctrl_vp9_frame *dec,
+				       u32 mi_cols, u32 mi_rows)
+{
+	u32 rows = 1 << dec->tile_rows_log2;
+	u32 cols = 1 << dec->tile_cols_log2;
+	__le64 *entry = vp9->prob_tbl;
+	u32 r, c, n = 0;
+
+	memset(vp9->prob_tbl, 0, CEDRUS_VP9_PROBS_OFFSET);
+
+	if (rows * cols <= 1)
+		return;
+
+	for (r = 0; r < rows; r++) {
+		u32 rs = cedrus_vp9_tile_offset(r, mi_rows, dec->tile_rows_log2);
+		u32 re = cedrus_vp9_tile_offset(r + 1, mi_rows, dec->tile_rows_log2);
+
+		for (c = 0; c < cols; c++) {
+			u32 cs = cedrus_vp9_tile_offset(c, mi_cols, dec->tile_cols_log2);
+			u32 ce = cedrus_vp9_tile_offset(c + 1, mi_cols, dec->tile_cols_log2);
+			u64 rect;
+
+			if (n++ == 0)
+				continue;
+
+			rect = (cs == ce || rs == re) ? BIT_ULL(31) : 0;
+			rect |= (cs >> 3) & 0x1ff;
+			rect |= ((u64)((rs >> 3) & 0x1ff)) << 16;
+			rect |= ((u64)(((ce - 1) >> 3) & 0x1ff)) << 32;
+			rect |= ((u64)(((re - 1) >> 3) & 0x1ff)) << 48;
+
+			*entry++ = 0;
+			*entry++ = cpu_to_le64(rect);
+		}
+	}
+}
+
+static size_t cedrus_vp9_col_mv_size(u32 width, u32 height)
+{
+	return (size_t)(ALIGN(width, 64) / 8) * (ALIGN(height, 64) / 8) * 16;
+}
+
+/* Temporal MVs aren't used across a size change, the old ones can go. */
+static int cedrus_vp9_grow_col_mv_buf(struct cedrus_ctx *ctx,
+				      u32 width, u32 height)
+{
+	struct cedrus_vp9_ctx *vp9 = cedrus_vp9_ctx(ctx);
+	size_t size = cedrus_vp9_col_mv_size(width, height);
+	struct cedrus_dev *dev = ctx->dev;
+	dma_addr_t buf_dma;
+	void *buf;
+
+	if (size <= vp9->col_mv_buf_size)
+		return 0;
+
+	buf = dma_alloc_coherent(dev->dev, size, &buf_dma, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	dma_free_coherent(dev->dev, vp9->col_mv_buf_size, vp9->col_mv_buf,
+			  vp9->col_mv_buf_dma);
+	vp9->col_mv_buf = buf;
+	vp9->col_mv_buf_dma = buf_dma;
+	vp9->col_mv_buf_size = size;
+
+	return 0;
+}
+
+static void cedrus_vp9_write_first_tile(struct cedrus_dev *dev,
+					const struct v4l2_ctrl_vp9_frame *dec,
+					u32 mi_cols, u32 mi_rows)
+{
+	u32 col_end = cedrus_vp9_tile_offset(1, mi_cols, dec->tile_cols_log2);
+	u32 row_end = cedrus_vp9_tile_offset(1, mi_rows, dec->tile_rows_log2);
+	u32 reg = 0;
+
+	if (!col_end || !row_end)
+		reg = VE_DEC_VP9_TILE_START_INVALID;
+
+	cedrus_write(dev, VE_DEC_VP9_TILE_START, reg);
+	cedrus_write(dev, VE_DEC_VP9_TILE_END,
+		     VE_DEC_VP9_TILE_X((col_end - 1) >> 3) |
+		     VE_DEC_VP9_TILE_Y((row_end - 1) >> 3));
+}
+
+static int cedrus_vp9_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
+{
+	const struct v4l2_ctrl_vp9_frame *dec = run->vp9.frame_params;
+	const struct v4l2_ctrl_vp9_compressed_hdr *prob = run->vp9.prob_updates;
+	struct cedrus_vp9_ctx *vp9 = cedrus_vp9_ctx(ctx);
+	struct cedrus_buffer *dst_cb = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
+	struct cedrus_dev *dev = ctx->dev;
+	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
+	struct vb2_buffer *src_buf = &run->src->vb2_buf;
+	struct v4l2_pix_format recon, out;
+	dma_addr_t src_dma, src_end, luma, chroma;
+	u32 src_len, hdr_off, cur_w, cur_h, mi_cols, mi_rows;
+	u32 hdr_syn, fc, reg;
+	bool intra_only, resolution_change, use_temporal_mv;
+	int ret;
+
+	if (!dec || !prob)
+		return -EINVAL;
+
+	if (vp9->pending)
+		vp9->last_valid = false;
+
+	cur_w = dec->frame_width_minus_1 + 1;
+	cur_h = dec->frame_height_minus_1 + 1;
+
+	/* The hardware writes whole 16x16 blocks, 8 lines for planar formats. */
+	if (ALIGN(cur_w, 16) > ALIGN(ctx->dst_fmt.width, 16) ||
+	    ALIGN(cur_h, cedrus_vp9_is_planar(ctx->dst_fmt.pixelformat) ? 8 : 16) >
+	    ctx->dst_fmt.height)
+		return -EINVAL;
+
+	/* The 2-bit plane exists only in buffers sized for 10-bit frames. */
+	if (dec->bit_depth > ctx->bit_depth)
+		return -EINVAL;
+
+	src_dma = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+	src_len = vb2_get_plane_payload(src_buf, 0);
+	hdr_off = dec->uncompressed_header_size + dec->compressed_header_size;
+	if (hdr_off >= src_len)
+		return -EINVAL;
+
+	/* The bitstream end address has a 1 KiB granularity. */
+	src_end = ALIGN_DOWN(src_dma + vb2_plane_size(src_buf, 0), SZ_1K);
+	if (src_dma + src_len > src_end)
+		return -EINVAL;
+
+	mi_cols = DIV_ROUND_UP(cur_w, 8);
+	mi_rows = DIV_ROUND_UP(cur_h, 8);
+
+	intra_only = !!(dec->flags & (V4L2_VP9_FRAME_FLAG_KEY_FRAME |
+				      V4L2_VP9_FRAME_FLAG_INTRA_ONLY));
+
+	resolution_change = vp9->last_valid &&
+			    (vp9->last_w != cur_w || vp9->last_h != cur_h);
+
+	use_temporal_mv = vp9->last_valid && !intra_only &&
+			  !(dec->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT) &&
+			  !(vp9->last_flags & V4L2_VP9_FRAME_FLAG_KEY_FRAME) &&
+			  (vp9->last_flags & V4L2_VP9_FRAME_FLAG_SHOW_FRAME) &&
+			  !resolution_change;
+
+	/* Like vp9_setup_past_independence() of libvpx. */
+	if (intra_only || resolution_change || !vp9->last_valid ||
+	    (dec->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT))
+		memset(vp9->prob_tbl + CEDRUS_VP9_SEGMAP_OFFSET, 0,
+		       CEDRUS_VP9_PROB_TBL_SIZE - CEDRUS_VP9_SEGMAP_OFFSET);
+
+	dst_cb->codec.vp9.width = cur_w;
+	dst_cb->codec.vp9.height = cur_h;
+
+	vp9->frame_ctx_idx = v4l2_vp9_reset_frame_ctx(dec, vp9->frame_ctx);
+	vp9->cur_probs = vp9->frame_ctx[vp9->frame_ctx_idx];
+	v4l2_vp9_fw_update_probs(&vp9->cur_probs, prob, dec);
+
+	cedrus_vp9_build_dequant(vp9, dec);
+	cedrus_vp9_build_lf_lvl(vp9, dec);
+
+	ret = cedrus_vp9_grow_col_mv_buf(ctx, cur_w, cur_h);
+	if (ret)
+		return ret;
+
+	ret = cedrus_engine_enable(ctx);
+	if (ret)
+		return ret;
+
+	reg = cedrus_read(dev, VE_MODE);
+	reg &= ~(VE_MODE_PIC_WIDTH_IS_4096 | VE_MODE_PIC_WIDTH_MORE_2048);
+	if (cur_w == 4096)
+		reg |= VE_MODE_PIC_WIDTH_IS_4096;
+	if (cur_w > 2048)
+		reg |= VE_MODE_PIC_WIDTH_MORE_2048;
+	cedrus_write(dev, VE_MODE, reg);
+
+	recon = ctx->dst_fmt;
+	out = recon;
+	out.width = ALIGN(cur_w, 16);
+	out.height = ALIGN(cur_h, cedrus_vp9_is_planar(out.pixelformat) ? 8 : 16);
+	cedrus_dst_format_set(dev, &out);
+
+	cedrus_vp9_write_probs(vp9, dec);
+	cedrus_vp9_write_tile_list(vp9, dec, mi_cols, mi_rows);
+
+	if (!cedrus_vp9_parallel(dec))
+		memset(vp9->prob_tbl + CEDRUS_VP9_CTX_OFFSET, 0,
+		       sizeof(struct cedrus_vp9_entropy_counts));
+
+	hdr_syn = VE_DEC_VP9_HDR_SYN_DEC_EN | VE_DEC_VP9_HDR_SYN_HW_EN2;
+
+	if (dec->tile_cols_log2 || dec->tile_rows_log2)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_TILES_EN;
+
+	if (!intra_only)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_INTER_FRAME;
+
+	hdr_syn |= VE_DEC_VP9_HDR_SYN_DEPTH(dec->bit_depth - 8);
+
+	if (dec->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_LAST)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_BIAS_LAST;
+	if (dec->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_GOLDEN)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_BIAS_GOLDEN;
+	if (dec->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_ALT)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_BIAS_ALT;
+
+	if (dec->flags & V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_HP_MV;
+
+	if (!(dec->flags & V4L2_VP9_FRAME_FLAG_KEY_FRAME))
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_INTERP(dec->interpolation_filter);
+
+	if (dec->lf.level) {
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_LF_EN;
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_LF_SHARP(dec->lf.sharpness);
+	}
+
+	if (!dec->quant.base_q_idx && !dec->quant.delta_q_y_dc &&
+	    !dec->quant.delta_q_uv_dc && !dec->quant.delta_q_uv_ac)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_LOSSLESS;
+
+	if (dec->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED) {
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_SEG_EN;
+		if (dec->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP)
+			hdr_syn |= VE_DEC_VP9_HDR_SYN_SEG_UPD_MAP;
+		if (dec->seg.flags & V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE)
+			hdr_syn |= VE_DEC_VP9_HDR_SYN_SEG_TEMP_UPD;
+	}
+
+	hdr_syn |= VE_DEC_VP9_HDR_SYN_TX_MODE(prob->tx_mode);
+	hdr_syn |= VE_DEC_VP9_HDR_SYN_REF_MODE(dec->reference_mode);
+
+	if (use_temporal_mv)
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_USE_PREV_MV;
+
+	if (!cedrus_vp9_parallel(dec))
+		hdr_syn |= VE_DEC_VP9_HDR_SYN_CNT_EN;
+
+	cedrus_write(dev, VE_DEC_VP9_HDR_SYN, hdr_syn);
+
+	cedrus_write(dev, VE_DEC_VP9_BITS_OFFSET, hdr_off * 8);
+	cedrus_write(dev, VE_DEC_VP9_BITS_END,
+		     VE_DEC_VP9_BITS_END_BASE(src_end));
+	cedrus_write(dev, VE_DEC_VP9_BITS_LEN, (src_len - hdr_off) * 8);
+	cedrus_write(dev, VE_DEC_VP9_BITS_ADDR,
+		     VE_DEC_VP9_BITS_ADDR_BASE(src_dma) |
+		     VE_DEC_VP9_BITS_ADDR_FIRST |
+		     VE_DEC_VP9_BITS_ADDR_VALID |
+		     VE_DEC_VP9_BITS_ADDR_LAST);
+
+	cedrus_write(dev, VE_DEC_VP9_PIC_SIZE,
+		     VE_DEC_VP9_PIC_WIDTH(cur_w) |
+		     VE_DEC_VP9_PIC_HEIGHT(cur_h));
+
+	if (intra_only) {
+		cedrus_write(dev, VE_DEC_VP9_LAST_SCALE1,
+			     cedrus_vp9_stride_align_field(recon.pixelformat));
+	} else {
+		struct vb2_buffer *last_buf, *gold_buf, *alt_buf;
+		struct cedrus_buffer *last_cb, *gold_cb, *alt_cb;
+		u32 last_w, last_h, gold_w, gold_h, alt_w, alt_h;
+		u32 s0, s1;
+
+		last_buf = vb2_find_buffer(cap_q, dec->last_frame_ts);
+		gold_buf = vb2_find_buffer(cap_q, dec->golden_frame_ts);
+		alt_buf  = vb2_find_buffer(cap_q, dec->alt_frame_ts);
+
+		if (!last_buf || !gold_buf || !alt_buf) {
+			dev_warn_ratelimited(dev->dev,
+					     "VP9 reference frame not found\n");
+			return -EINVAL;
+		}
+
+		last_cb = vb2_to_cedrus_buffer(last_buf);
+		gold_cb = vb2_to_cedrus_buffer(gold_buf);
+		alt_cb = vb2_to_cedrus_buffer(alt_buf);
+
+		last_w = last_cb->codec.vp9.width ?: cur_w;
+		last_h = last_cb->codec.vp9.height ?: cur_h;
+		gold_w = gold_cb->codec.vp9.width ?: cur_w;
+		gold_h = gold_cb->codec.vp9.height ?: cur_h;
+		alt_w = alt_cb->codec.vp9.width ?: cur_w;
+		alt_h = alt_cb->codec.vp9.height ?: cur_h;
+
+		/* Like libvpx, fail when no reference is within the limits. */
+		if (!cedrus_vp9_valid_ref_size(last_w, last_h, cur_w, cur_h) &&
+		    !cedrus_vp9_valid_ref_size(gold_w, gold_h, cur_w, cur_h) &&
+		    !cedrus_vp9_valid_ref_size(alt_w, alt_h, cur_w, cur_h))
+			return -EINVAL;
+
+		cedrus_write(dev, VE_DEC_VP9_LAST_PIC_SIZE,
+			     VE_DEC_VP9_PIC_WIDTH(last_w) |
+			     VE_DEC_VP9_PIC_HEIGHT(last_h));
+		cedrus_write(dev, VE_DEC_VP9_GOLDEN_PIC_SIZE,
+			     VE_DEC_VP9_PIC_WIDTH(gold_w) |
+			     VE_DEC_VP9_PIC_HEIGHT(gold_h));
+		cedrus_write(dev, VE_DEC_VP9_ALTREF_PIC_SIZE,
+			     VE_DEC_VP9_PIC_WIDTH(alt_w) |
+			     VE_DEC_VP9_PIC_HEIGHT(alt_h));
+
+		cedrus_vp9_ref_scale(last_w, last_h, cur_w, cur_h, &s0, &s1);
+		cedrus_write(dev, VE_DEC_VP9_LAST_SCALE0, s0);
+		cedrus_write(dev, VE_DEC_VP9_LAST_SCALE1,
+			     s1 | cedrus_vp9_stride_align_field(recon.pixelformat));
+
+		cedrus_vp9_ref_scale(gold_w, gold_h, cur_w, cur_h, &s0, &s1);
+		cedrus_write(dev, VE_DEC_VP9_GOLDEN_SCALE0, s0);
+		/* GOLDEN_SCALE1 has the scale factor in bits 31:16. */
+		cedrus_write(dev, VE_DEC_VP9_GOLDEN_SCALE1,
+			     ((s1 >> 5) & 0xffff) << 16 |
+			     (s1 & GENMASK(4, 0)));
+
+		cedrus_vp9_ref_scale(alt_w, alt_h, cur_w, cur_h, &s0, &s1);
+		cedrus_write(dev, VE_DEC_VP9_ALTREF_SCALE0, s0);
+		cedrus_write(dev, VE_DEC_VP9_ALTREF_SCALE1, s1);
+
+		cedrus_write(dev, VE_DEC_VP9_LAST_LUMA_ADDR,
+			     VE_DEC_VP9_BUF_ADDR(cedrus_dst_buf_addr(ctx, last_buf, 0)));
+		cedrus_write(dev, VE_DEC_VP9_LAST_CHROMA_ADDR,
+			     VE_DEC_VP9_BUF_ADDR(cedrus_dst_buf_addr(ctx, last_buf, 1)));
+		cedrus_write(dev, VE_DEC_VP9_GOLDEN_LUMA_ADDR,
+			     VE_DEC_VP9_BUF_ADDR(cedrus_dst_buf_addr(ctx, gold_buf, 0)));
+		cedrus_write(dev, VE_DEC_VP9_GOLDEN_CHROMA_ADDR,
+			     VE_DEC_VP9_BUF_ADDR(cedrus_dst_buf_addr(ctx, gold_buf, 1)));
+
+		cedrus_write(dev, VE_DEC_VP9_ALTREF_LUMA_ADDR,
+			     VE_DEC_VP9_BUF_ADDR(cedrus_dst_buf_addr(ctx, alt_buf, 0)));
+		cedrus_write(dev, VE_DEC_VP9_ALTREF_CHROMA_ADDR,
+			     VE_DEC_VP9_BUF_ADDR(cedrus_dst_buf_addr(ctx, alt_buf, 1)));
+	}
+
+	luma = cedrus_dst_buf_addr(ctx, &run->dst->vb2_buf, 0);
+	chroma = cedrus_dst_buf_addr(ctx, &run->dst->vb2_buf, 1);
+	cedrus_write(dev, VE_DEC_VP9_CUR_LUMA_ADDR, VE_DEC_VP9_BUF_ADDR(luma));
+	cedrus_write(dev, VE_DEC_VP9_CUR_CHROMA_ADDR, VE_DEC_VP9_BUF_ADDR(chroma));
+
+	cedrus_write(dev, VE_DEC_VP9_SDRT_CTRL, 0);
+	cedrus_write(dev, VE_DEC_VP9_SDRT_LUMA_ADDR, 0);
+	cedrus_write(dev, VE_DEC_VP9_SDRT_CHROMA_ADDR, 0);
+
+	if (dec->bit_depth > 8) {
+		/* After the chroma rows of the frame, not of the buffer. */
+		reg = (chroma - luma) +
+		      recon.bytesperline * (ALIGN(cur_h, 8) / 2);
+		cedrus_write(dev, VE_DEC_VP9_FIRST_OUT_OFFSET,
+			     reg & GENMASK(27, 0));
+
+		reg = VE_DEC_VP9_10BIT_CFG_STRIDE(cedrus_vp9_2bit_stride(recon.width));
+		cedrus_write(dev, VE_DEC_VP9_10BIT_CFG, reg);
+	} else {
+		cedrus_write(dev, VE_DEC_VP9_FIRST_OUT_OFFSET, 0);
+		cedrus_write(dev, VE_DEC_VP9_10BIT_CFG, 0);
+	}
+
+	cedrus_write(dev, VE_DEC_VP9_NEIGHBOR_INFO_ADDR,
+		     VE_DEC_VP9_NEIGHBOR_INFO_BASE(vp9->neighbor_buf_dma));
+	cedrus_write(dev, VE_DEC_VP9_ENTRY_POINT_ADDR,
+		     VE_DEC_VP9_ENTRY_POINT_BASE(vp9->prob_tbl_dma));
+	cedrus_write(dev, VE_DEC_VP9_COL_MV_ADDR,
+		     VE_DEC_VP9_FB_ADDR(vp9->col_mv_buf_dma));
+	cedrus_write(dev, VE_DEC_VP9_SEG_FEAT,
+		     cedrus_vp9_seg_feat_reg(dec));
+
+	cedrus_vp9_write_first_tile(dev, dec, mi_cols, mi_rows);
+
+	cedrus_vp9_write_sram(ctx);
+
+	fc = VE_DEC_VP9_FUNC_CTRL_FINISH_INT |
+	     VE_DEC_VP9_FUNC_CTRL_ERR_INT |
+	     VE_DEC_VP9_FUNC_CTRL_DATA_REQ_INT;
+	/* Same condition as the vendor library. */
+	if (out.width > 128 && out.width <= 192 && out.height > 64)
+		fc |= VE_DEC_VP9_FUNC_CTRL_DDR_CONS;
+	cedrus_write(dev, VE_DEC_VP9_FUNC_CTRL, fc);
+
+	cedrus_write(dev, VE_DEC_VP9_DEC_CTB_NUM, 0);
+
+	vp9->pending = true;
+
+	return 0;
+}
+
+static void cedrus_vp9_trigger(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+
+	cedrus_write(dev, VE_DEC_VP9_STATUS, GENMASK(31, 0));
+	cedrus_write(dev, VE_DEC_VP9_TRIGGER, VE_DEC_VP9_TRIGGER_INIT_SWDEC);
+	cedrus_write(dev, VE_DEC_VP9_DEC_CTB_NUM, 0);
+	cedrus_write(dev, VE_DEC_COUNTER, 0);
+	cedrus_write(dev, VE_DEC_COUNTER, VE_DEC_COUNTER_EN);
+	cedrus_write(dev, VE_DEC_VP9_TRIGGER, VE_DEC_VP9_TRIGGER_DEC_FRAME);
+}
+
+struct cedrus_vp9_tx_skip {
+	u8 tx8[2][1];
+	u8 tx16[2][2];
+	u8 tx32[2][3];
+	u8 skip[3];
+};
+
+static void cedrus_vp9_save_tx_skip(struct cedrus_vp9_tx_skip *out,
+				    const struct v4l2_vp9_frame_context *probs)
+{
+	memcpy(out->tx8, probs->tx8, sizeof(out->tx8));
+	memcpy(out->tx16, probs->tx16, sizeof(out->tx16));
+	memcpy(out->tx32, probs->tx32, sizeof(out->tx32));
+	memcpy(out->skip, probs->skip, sizeof(out->skip));
+}
+
+static void cedrus_vp9_restore_tx_skip(struct v4l2_vp9_frame_context *probs,
+				       const struct cedrus_vp9_tx_skip *src)
+{
+	memcpy(probs->tx8, src->tx8, sizeof(src->tx8));
+	memcpy(probs->tx16, src->tx16, sizeof(src->tx16));
+	memcpy(probs->tx32, src->tx32, sizeof(src->tx32));
+	memcpy(probs->skip, src->skip, sizeof(src->skip));
+}
+
+static void cedrus_vp9_adapt_probs(struct cedrus_ctx *ctx)
+{
+	struct cedrus_vp9_ctx *vp9 = cedrus_vp9_ctx(ctx);
+	const struct v4l2_ctrl_vp9_frame *dec;
+	const struct v4l2_ctrl_vp9_compressed_hdr *prob;
+	struct cedrus_vp9_entropy_counts *cnts;
+	struct cedrus_vp9_tx_skip tx_skip;
+	bool intra_only, refresh, parallel;
+	unsigned int i;
+
+	vp9->pending = false;
+
+	dec = cedrus_find_control_data(ctx, V4L2_CID_STATELESS_VP9_FRAME);
+	if (!dec)
+		return;
+
+	/* The counts, MVs and segment map of a failed frame are garbage. */
+	if (!vp9->decode_ok) {
+		vp9->last_valid = false;
+		return;
+	}
+
+	refresh = dec->flags & V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX;
+	parallel = cedrus_vp9_parallel(dec);
+	intra_only = !!(dec->flags & (V4L2_VP9_FRAME_FLAG_KEY_FRAME |
+				      V4L2_VP9_FRAME_FLAG_INTRA_ONLY));
+
+	if (refresh && !parallel) {
+		cnts = vp9->prob_tbl + CEDRUS_VP9_CTX_OFFSET;
+
+		/* Keep tx and skip of intra-only frames. */
+		if (intra_only)
+			cedrus_vp9_save_tx_skip(&tx_skip, &vp9->cur_probs);
+
+		vp9->cur_probs = vp9->frame_ctx[vp9->frame_ctx_idx];
+
+		if (intra_only)
+			cedrus_vp9_restore_tx_skip(&vp9->cur_probs, &tx_skip);
+
+		for (i = 0; i < 2; i++) {
+			vp9->tx16p_padded[i][0] = cnts->tx16x16[i][0];
+			vp9->tx16p_padded[i][1] = cnts->tx16x16[i][1];
+			vp9->tx16p_padded[i][2] = cnts->tx16x16[i][2];
+			vp9->tx16p_padded[i][3] = 0;
+		}
+		vp9->symbol_counts.tx16p = &vp9->tx16p_padded;
+
+		v4l2_vp9_adapt_coef_probs(&vp9->cur_probs,
+					  &vp9->symbol_counts,
+					  !vp9->last_valid ||
+					  (vp9->last_flags &
+					   V4L2_VP9_FRAME_FLAG_KEY_FRAME),
+					  intra_only);
+
+		if (!intra_only) {
+			prob = cedrus_find_control_data(ctx,
+							V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
+			cedrus_vp9_translate_nmv_counts(vp9);
+			v4l2_vp9_adapt_noncoef_probs(&vp9->cur_probs,
+						     &vp9->symbol_counts,
+						     dec->reference_mode,
+						     dec->interpolation_filter,
+						     prob ? prob->tx_mode : 0,
+						     dec->flags);
+		}
+	}
+
+	if (refresh)
+		vp9->frame_ctx[vp9->frame_ctx_idx] = vp9->cur_probs;
+
+	vp9->last_flags = dec->flags;
+	vp9->last_w = dec->frame_width_minus_1 + 1;
+	vp9->last_h = dec->frame_height_minus_1 + 1;
+	vp9->last_valid = true;
+}
+
+static int cedrus_vp9_start(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	struct cedrus_vp9_ctx *vp9;
+	int i;
+
+	vp9 = kzalloc_obj(*vp9);
+	if (!vp9)
+		return -ENOMEM;
+
+	vp9->prob_tbl = dma_alloc_coherent(dev->dev, CEDRUS_VP9_PROB_TBL_SIZE,
+					   &vp9->prob_tbl_dma, GFP_KERNEL);
+	if (!vp9->prob_tbl)
+		goto err_free_ctx;
+
+	vp9->neighbor_buf = dma_alloc_coherent(dev->dev,
+					       CEDRUS_VP9_NEIGHBOR_BUF_SIZE,
+					       &vp9->neighbor_buf_dma,
+					       GFP_KERNEL);
+	if (!vp9->neighbor_buf)
+		goto err_free_prob;
+
+	vp9->col_mv_buf_size = cedrus_vp9_col_mv_size(ctx->src_fmt.width,
+						      ctx->src_fmt.height);
+	vp9->col_mv_buf = dma_alloc_coherent(dev->dev, vp9->col_mv_buf_size,
+					     &vp9->col_mv_buf_dma, GFP_KERNEL);
+	if (!vp9->col_mv_buf)
+		goto err_free_neighbor;
+
+	for (i = 0; i < 4; i++)
+		vp9->frame_ctx[i] = v4l2_vp9_default_probs;
+	vp9->cur_probs = v4l2_vp9_default_probs;
+
+	cedrus_vp9_init_counts(vp9);
+
+	ctx->codec.vp9 = vp9;
+	return 0;
+
+err_free_neighbor:
+	dma_free_coherent(dev->dev, CEDRUS_VP9_NEIGHBOR_BUF_SIZE,
+			  vp9->neighbor_buf, vp9->neighbor_buf_dma);
+err_free_prob:
+	dma_free_coherent(dev->dev, CEDRUS_VP9_PROB_TBL_SIZE,
+			  vp9->prob_tbl, vp9->prob_tbl_dma);
+err_free_ctx:
+	kfree(vp9);
+	return -ENOMEM;
+}
+
+static void cedrus_vp9_stop(struct cedrus_ctx *ctx)
+{
+	struct cedrus_dev *dev = ctx->dev;
+	struct cedrus_vp9_ctx *vp9 = cedrus_vp9_ctx(ctx);
+
+	dma_free_coherent(dev->dev, vp9->col_mv_buf_size,
+			  vp9->col_mv_buf, vp9->col_mv_buf_dma);
+	dma_free_coherent(dev->dev, CEDRUS_VP9_NEIGHBOR_BUF_SIZE,
+			  vp9->neighbor_buf, vp9->neighbor_buf_dma);
+	dma_free_coherent(dev->dev, CEDRUS_VP9_PROB_TBL_SIZE,
+			  vp9->prob_tbl, vp9->prob_tbl_dma);
+	kfree(vp9);
+	ctx->codec.vp9 = NULL;
+}
+
+/* An H.265 picture decoded after a VP9 frame fails without the reset. */
+static void cedrus_vp9_irq_clear_and_adapt(struct cedrus_ctx *ctx)
+{
+	cedrus_vp9_adapt_probs(ctx);
+	cedrus_vp9_irq_clear(ctx);
+	cedrus_engine_reset(ctx->dev);
+}
+
+static unsigned int cedrus_vp9_extra_cap_size(struct cedrus_ctx *ctx,
+					      struct v4l2_pix_format *pix_fmt)
+{
+	u32 stride = cedrus_vp9_2bit_stride(pix_fmt->width);
+
+	/* The 2-bit plane is written in whole 16x16 blocks. */
+	if (ctx->bit_depth > 8)
+		return stride * (ALIGN(pix_fmt->height, 16) * 3 / 2 +
+				 CEDRUS_VP9_2BIT_TAIL_ROWS);
+
+	return 0;
+}
+
+struct cedrus_dec_ops cedrus_dec_ops_vp9 = {
+	.extra_cap_size	= cedrus_vp9_extra_cap_size,
+	.irq_clear	= cedrus_vp9_irq_clear_and_adapt,
+	.irq_disable	= cedrus_vp9_irq_disable,
+	.irq_status	= cedrus_vp9_irq_status,
+	.setup		= cedrus_vp9_setup,
+	.start		= cedrus_vp9_start,
+	.stop		= cedrus_vp9_stop,
+	.trigger	= cedrus_vp9_trigger,
+};
-- 
2.43.0

