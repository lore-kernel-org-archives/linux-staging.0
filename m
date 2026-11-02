Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639007;
	b=X+LwYZKTzYWOknph70+uoKLztM2r21AJrFvY3tJ6oKtZgd1cc2BaVXaoUz1q/eNYS0tX
	 NgILdsBJbmihoIJOEin/rsz2eYImNhHjCvQyuP/vpXKz7hjm39bbI0s8cZFhKiyRJQ6q5
	 W6BP41yx6QUl2uD3hVnegc4ecO1bQqVlf8sOABCpVbk2dQklfF7LERILGAcFzOBIMEatk
	 OlzEqoDBi31bMIAU38dkG6ykHhRUzse0pDkV3JrC+udvUvGWwnaPeHRYuHkfrxMBGM6PC
	 ES1lUG7qa8vaDLWiQmDqGXxJFUE4UC/LU/oef6o8jmrl2K1ZhToI+YQJo/xVa4xXNKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
	b=qEJok0yUkEcg25kTiaBLew0er9fS2QkMQrsEcOS1aqhgpCvEnJk9OaZqza+BZKOe7VIR
	 yv3JuOxj7puz+D97EdFk9bA1oxSN3Ed13Z9tIUasVCHZwXRe6profndXUluJ8cuTpo7Se
	 NKh2s+gjvrCgB+UNptZbwqD5KKBrGmNOck8Fh4rz1+VSAkEhZUSBhEUvpTsfYKLMOJsWe
	 OhFDG8KBSMZOvZlXkfi15mBU8qJXUg3oLBMCP1U1UtHPzAnA/J1ahyhJObb9E8ggKHa2l
	 hJUtotFHFBMx/jmzHsD8fFScgmxbYYWaJZWaVKk5N8EIJg8AMkikYyo3lnX2yh3ikMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFHDkv1h;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F0F606F3F0
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F0F606F3F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFHDkv1h
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2255553f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639006; x=1794243806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=zFHDkv1h7d7lUtX8hfMlkLimS7F9pEmAHiBJJvkRkz3WXGCvKufuQUdF3UnZrFfHk6
         dCBWX8dDLQRaeVHb6JWN4w7PDy6lwUMdrEPmlQmWPZwL8vnq9Rt/5yBcwLxqQ3/Urn9/
         fa4Q/cgwRWkGfL1Iny6GvFMtWNmL8heM5MlPOrczT96U7HhvUo+H6+rRqbBg1F1wge+E
         SWYG+3++W1M5vlazOQTDlTdI41g8lIUU+LmD9kdQ3K0Vn5l4ZuWpN9qRF2C0nYCoOETc
         Juzzj4j2f8WLptq3Fx7qufBncpwuxMIfuD1EaPF+cRyUjXbHxxRpxhRdASjW91nBl4Kg
         TKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639006; x=1794243806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifkMz93jDcWFK+TugNjNJ0UJbkiZmfoGYcbnJzIO7y8=;
        b=Zogwm92323+hzRHZGge8kN/zyUE6UNNZpQCIPExsd/e/V3wu9nx9VjW6c3VEPpL2PT
         wQmH4aYV8aqVy0jcZm5pfvtUsjjfd9f4jdpdIItWhTyRGwhd25GhkqQgSzyKALGWdaJE
         QhKZlePGXm/soz97AUSYKj5ui1J+sFMaIetcnVGEF0K+zJX0CW3av+zHkmBE00DsydQC
         V0nx+nP6Q8cuPZYHVty4IzTTk6YcHvgc7jityxN6tz0cgT7im0UzWvLKI9SGt0BX17qs
         mOK1JbggIrAwm2X/LKZPJldUjEb5NURmIED3uF1/x4iyM6lvxz8i6JnRUNaoWDQYHeL8
         ol8A==
X-Forwarded-Encrypted: i=1; AKwUvBxy2PIhiBa7Pri37Ulh+l77Z8ey+zQz4FuDvUw10D3TVENHKfphlAeHWCTxBlROxSKf8tIr/guXad33Q77p@lists.linux.dev
X-Gm-Message-State: APuU4Z9omcnALSJmJAoSgtEQVmbAmputF9EQcAwuUfMwyPHJz8pHGqV/
	81wAUijQuH4Fts8/NKMchHbqgoxSsjiI15cXvnE5ieFtM/G2a+JOmygA
X-Gm-Gg: AYBFou25rb8R7IzBZNLWLvRUGLvlcZjKbjK12Oog4OGYBlmibup/F/Szo90yNBe/xiW
	Aij80YhnA7RTgF+1Sdl8Dp/A7b7CYdBRWkSCserbDuJLhmTVhTexpBlaW1kJ/8UhfJf9r7QD4qU
	a47ic+Goj0ETV8pXPgrWPojDd+TpRoVYXz+stFVr92LBG0zu7SIv0ld0lAm0QuWs9QpDJCRK3u7
	l4dm34Swd3GkpVsU6EFPQ7qAbFKFA5rb3K5lpqhPYqsinYA415qllzI7/wp5J8Lz0ELuak0WZSZ
	wWj6OjQ4+USw9tL64Yh1H1AdGWJxSmh341PismOr5J6Tzrtj0g4IGcpIDb6+EgqgPhTvGvYG7U2
	MhxTwK0cXZR2ZCmR0didNl42pRmSm5JF5oeN/mStPnsq7ODxLfX/LE17nbqcL9E8IRFdYE5BmUV
	pMbAYYH1SxMI6WoUwfIn6O2+io0uX4sVTeyUVLu6nP/55hv4gXx97Tbx55P6cvVMkG9wHbiKKqb
	qUOuqX3aKRpAdu3j+vMR+ej7wSZrgtkK1FIerbkkfK5KBh8qLWs3jqLRvqpDnRp6CG9OGchCmS5
	uyvWhnN/QNvSnFv1ph6frf8Ti0ReqG6b2HYGwlrcc5UBoOZYJhL3rVQJZGQszveQv6xTs4HylfM
	/7q5VJtYyk3Unk7y1BeZok88ZMSrEffJg/HgxMVKuTUIEivyIUXBF2TfDh9iihtdronF5mHP3kY
	WQ0sN/h4JXpaaczls1d0FsxbQEtFTn538SxhqwwZQ3elv8t5euOqxiE4JwzBGZJLt8swkSWW3Az
	YU6toslewtiNzd1J8KI/54rwfuwOflYFjgeHaNeJFpy4mnfNw==
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e6e4f561bmr25233093f8f.21.1793639005534;
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:25 -0800 (PST)
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
Subject: [PATCH 05/10] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  2 Nov 2026 18:02:58 +0100
Message-ID: <20261102170303.1973892-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 54f867949fba..a523b56a9b8c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,11 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		pair_pending;
+			unsigned int	pair_dst;
+			u8		pair_structure;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index ca66a3c6b830..4c8accee5389 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
-	bool field;
+	bool field, tff;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
 	}
 
+	/*
+	 * top_field_first is always 0 in field pictures, but the hardware
+	 * uses this bit to tell the first field of a frame from the second.
+	 * A field is the second one when it has the opposite parity of the
+	 * previous field and is decoded into the same capture buffer.
+	 */
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME) {
+		tff = !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+		ctx->codec.mpeg2.pair_pending = false;
+	} else {
+		bool second = ctx->codec.mpeg2.pair_pending &&
+			      ctx->codec.mpeg2.pair_structure != pic->picture_structure &&
+			      ctx->codec.mpeg2.pair_dst == run->dst->vb2_buf.index;
+
+		tff = (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) != second;
+		ctx->codec.mpeg2.pair_pending = !second;
+		ctx->codec.mpeg2.pair_structure = pic->picture_structure;
+		ctx->codec.mpeg2.pair_dst = run->dst->vb2_buf.index;
+	}
+
 	/* Set MPEG picture header. */
 
 	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
@@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
 	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
@@ -186,6 +206,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	return 0;
 }
 
+static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
+{
+	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
+
+	return 0;
+}
+
 static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -203,5 +230,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0

