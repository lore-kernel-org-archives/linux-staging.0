Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795255856;
	b=p2Z6TL/Ub445/2FmFzgPyReNjDNtZWINZ9gj7X74HzpfJkGFhX/ESC1a1vugp3g3Gj37
	 4przOIdRrpfl7JUFETo9o93VZpQp0yU3Hc1SmFQasY6Zofrjbddrbk8Kwr0PQpBznQzep
	 omAA3ObHt76ay/mmezotlTyibsxGiZs9d4cTj77ydfd3l59iygMWTWSb4GSpUY9E1x8XQ
	 ZspMhQOaojrS9567JE1r0fVobhMBhLyDmK3rz/t7NnTCXOLI2DauLPcpoAtXJ3g+INl7k
	 y+ca/lOhmOjAKuDIJ6/QLTm/qvO1JoRy18p0xOlGqc17DLfIaO1OTJtuw2BRqpswxUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255856;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B4YHsAoHyJKwkFBTxKLpr1lA7OsEShL43buMSm7NE7g=;
	b=IM28qaPBf+mI1K2hgcuidCkUXQNBR9PmQT1LRPvAqfE6cWMjDfoYHFdza8Lm39O/OvBb
	 Scm9hPL17Evv1vfqNPy35eyROHn/Ty6uN5R2jcsPiVFXNPSe1zIe9pTudgunvtPcxRUKi
	 tXXuZjHWzQHfObe7WvG5yI7ncY2OLpAhu7IZsVQovMmvL/gQAJBTGeqjAxGj+zCOTwdkX
	 oAwV3SBHM+ZMaDnR9ZieBdOTgBBbJ4SU86sAFFZ60nHhPkYhWa6DKwa/7NlSy+2UN6d5a
	 PDm3UwN/VVPuVk365JrUlUkMNnv+W6a1SP6AbT5aldxmcc48GJGHubH1PM3j6EYCSsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8AKbIsO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE6E606A33B;
	Sat, 21 Nov 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F8AKbIsO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795255856;
	b=FR7hq2yN4iJ6BzJZO150WFrBXvwutgsv+v4IN9s0IC+RUVwKyJ1jenKAyF8gub2qU+FN
	 HCT1zpfUyQNHOrh3AGfdaZBNti6FYsmwAut2rTfDw5GsUPlmm2g0/FcoruF/aX6Wu2zr4
	 XM2e72FlJM5tvZnXj+zHzAimz6GmhMQACiyz9LyUxGQ3JTQSCdiBy//T9yvOo3u9BeOb0
	 WHd4CyKPFnvLyij/muYEvv2mhM91rq8FVGMYlxMqFp6TvFWHMQgBcVINY9/KC0jJZaI13
	 ArIrQwH4iZfByQga8ztozwJS2gACKZ/v/4Aqxw3FA86rAoKpZSQrsBN/3o0q343JEiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795255856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=B4YHsAoHyJKwkFBTxKLpr1lA7OsEShL43buMSm7NE7g=;
	b=JKEWiidVx9F1aUFaGF0V+l0DYbCRKEZ1ZOEjQrXu2zHD7yYx8hSiLuDJEtQrrMcdpmSC
	 UFrPeKfFv0bks1oEprAHq8cNPRHh5fnZxJSnxJwUyjr2LvbOzEq4u6rI35XcMxUvjI022
	 AClYrDTlZk0AyqgwLO4uLQZfK74aSIN5JZLG0QjS+7Xeq2R04x6voQR5Or2NnSU3cIUnX
	 UdICEmw5MWUfsOoLRaiSUfL6OfksR89mGLD1+kyGu+Ck7wx5+n2220Lu5/GBRUNCwTmlx
	 3bqo88iOA4TUKr0cVVpl6Uuj1/2ABTgMestfW0K0tC8GXvqMqjlJdA5OzeOWLoG1d9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 555201F000CF;
	Sat, 21 Nov 2026 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795255856;
	bh=B4YHsAoHyJKwkFBTxKLpr1lA7OsEShL43buMSm7NE7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F8AKbIsOYYhRu2GUIgxy695fHCbk1rNXbdQpuZHglQYtzSdKoLYIUb7zIb64Q5Hi0
	 EwAL+LyfcDSzMxQ9gEELjY3ZaJAr+gS1r/GpSGipiecUdgrORJ9qAhDWFcm6Wlhbm9
	 ZDG6EZvTOIaeLtEbsmNNVX5HvMaodhaxIk/VAq16e4alRMJr7zeAbYvoMtTNBTZQvY
	 K/cdMBPcSA8rLPm5rD5E4D/LaJVPs1tfoWsOEs7FNa5XZ5IDwIyoCh/NJiLbDQJinn
	 +1lO/I2QBPs9c9AKDVlRNjCFxMOJ1QfFb5/l17Mf+BHdsRFl2QrKySLSqfgFVECjG3
	 bjXW5+cnxn5tA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DBBDF4BBD4;
	Sat, 21 Nov 2026 10:10:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 10:10:56 +0000
Subject: [PATCH v2 3/3] media: cedrus: mpeg2: decode MPEG-1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-b4-cedrus-mpeg1-v2-3-95e4decf03fa@gmail.com>
References: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
In-Reply-To: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795255854; l=3799;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ENgCu+1MFMZtAJZUuEt0T+q6P9F/T+1zchxBMroIOiw=;
 b=i5C3tVNnGqk1IrEyGSmXdZ2XEwdhU7cGA82UV4f11t7RXP0HNEAvQEtdnKwP2DzacRy5m35Pa
 xZgEqCOj6eQAg8Am49A4qiLCCykWgl3+ChPpmm6D961m0tS721fJQu5
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The engine has an MPEG-1 mode, selected with the MPEG-1 decoder type in
the trigger register, and takes the full pel flags and the picture
coding type (D-pictures included) in the picture header register.

Select the MPEG-1 mode when V4L2_MPEG2_SEQ_FLAG_MPEG1 is set (every
variant with the MPEG-2 decoder; tested on H616 only). A job fails if
an MPEG-1 sequence has field pictures, or an MPEG-2 one has D-pictures
or full pel flags.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h       |  3 +++
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 27 +++++++++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c4b1217c14b6..9c35078ef02f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,9 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		mpeg1;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..557e3d029318 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -48,6 +48,17 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
 	cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
 }
 
+static bool cedrus_mpeg2_pic_valid(const struct v4l2_ctrl_mpeg2_sequence *seq,
+				   const struct v4l2_ctrl_mpeg2_picture *pic)
+{
+	if (seq->flags & V4L2_MPEG2_SEQ_FLAG_MPEG1)
+		return pic->picture_structure == V4L2_MPEG2_PIC_FRAME;
+
+	return pic->picture_coding_type != V4L2_MPEG2_PIC_CODING_TYPE_D &&
+	       !(pic->flags & (V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD |
+			       V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD));
+}
+
 static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_mpeg2_sequence *seq;
@@ -63,6 +74,11 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	seq = run->mpeg2.sequence;
 	pic = run->mpeg2.picture;
 
+	if (!cedrus_mpeg2_pic_valid(seq, pic))
+		return -EINVAL;
+
+	ctx->codec.mpeg2.mpeg1 = seq->flags & V4L2_MPEG2_SEQ_FLAG_MPEG1;
+
 	quantisation = run->mpeg2.quantisation;
 
 	/* Activate MPEG engine. */
@@ -101,8 +117,10 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_VLC_FORMAT(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC);
 	reg |= VE_DEC_MPEG_MP12HDR_ALTERNATE_SCAN(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN);
-	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VECTOR(0);
-	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_VECTOR(0);
+	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VECTOR(pic->flags &
+				V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD);
+	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_VECTOR(pic->flags &
+				V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD);
 
 	cedrus_write(dev, VE_DEC_MPEG_MP12HDR, reg);
 
@@ -183,8 +201,9 @@ static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 	u32 reg;
 
 	/* Trigger MPEG engine. */
-	reg = VE_DEC_MPEG_TRIGGER_HW_MPEG_VLD | VE_DEC_MPEG_TRIGGER_MPEG2 |
-	      VE_DEC_MPEG_TRIGGER_MB_BOUNDARY;
+	reg = VE_DEC_MPEG_TRIGGER_HW_MPEG_VLD | VE_DEC_MPEG_TRIGGER_MB_BOUNDARY;
+	reg |= ctx->codec.mpeg2.mpeg1 ? VE_DEC_MPEG_TRIGGER_MPEG1 :
+					    VE_DEC_MPEG_TRIGGER_MPEG2;
 
 	cedrus_write(dev, VE_DEC_MPEG_TRIGGER, reg);
 }

-- 
2.55.0


