Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639004;
	b=v5nnjxuUQV+PJM+znQQVxF8qTvF8Ei9uiDV9vi1I7DCWmcujxsHuo4CTATsc0Q3JLVXv
	 xIHn1K9NUd3tRoLCkIIK3UIHfTEHmf0wqxoHpFetHGOTEY2Z1efBMj7EEtKyUO9u2rkhf
	 eJQAimkeKspe2IvjpXDR26aG7TCWKWY16NCNZlER9a8nkbVfh7fUS0uJ4W+AshnuIg1WV
	 sydCz5dZbBS9GjD3Jwg2tqmm+jWr3oumvThpLwAKq6PkbV0QbD16v+ppRj7LDxfq/o924
	 DaHSnx722EMGoXSlXVZt2DmiMQcUI8wf1dMD53E/jGLPwv0d1ga8FrP0i0wuNqtm0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
	b=EVBpbG8dVPdgYngajewkjBzlndjW8iYGGBV8ms/MndQ7oE/jDKzXW8IN6GM49zn8Ph12
	 U2jdmo+fpvtSvmcL4wKaAqK0yaWehnhn1KLAp+OeflWOCfikKxPzmT0dVv3q5oiATJVmZ
	 CJVMUhG4X8dk22gU7bSCvcKFNg/Ly6m2zZ8hNafZH6D8Xw2Mr+6nypn/ExGvn9r8xRpY+
	 vKUP/pL212OIiPrGTB5mkjHA9nkuhnkgHIwimV3w6R42NpRlJpvwNu6uAUV6TC+rQaQ1Z
	 iktjxpV+rG5FhYjho9gK+sNUlCDmEV2l1yJ0+iLsqb5W34ngo6Mxn6T0wyMu3AsfTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3UT0rCj;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C15606C56E
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C15606C56E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3UT0rCj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1645232f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639002; x=1794243802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=G3UT0rCj1iBXy7FDUShUTSETpGHEjmKraLcN+E1+5ZgdP1sA3GpMlnc7+kSjMjOZD1
         SXmgK1Fzmysnyx/S07IaIedChSp3zcJvQPqT1aOE9siDbO60w//cYHydbIWfcH6QcKBK
         tG77AD1XzCxKnvaQpAb3tw8JSrFdhgGE6DfAFIXlhNQkVcPo3nXRTLtJ+u8ykn72YDKY
         fSNm1l8TgXDaQaayG69M2VQKcfuqohSMUPGYSGSBJmWIcAmeXBTXx6nK/BbAuy1mln6r
         pScl1PB1b9oeuhLk6MZZk24q0VT7lnTx8zd9cgkcKW3nYGWDkJYVqVhWIXIKweaDnieP
         ZU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639002; x=1794243802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWiUrUc26qsUdMY2n/PhpO+pC2qChhSw9kx320KNwbA=;
        b=t0UYdCNOwgugO1eeHDDKXJWkiuezHl5pkF7HR0mi3sebOrpCCwVRa1VEZIUtKTbDFn
         lARcy0DfYnyY37AlQuQwLKaBvkCcmMXSw5bYWVciU6eZtwdViEmwAvYFQE5WmP8J0a6r
         XiBdS9tPiYLs/ZRaWAEmVa/VK1WkERCu7PSe7KLY3oTKSKtGBBY2S1JeFm73XFqXDS0W
         onsKPY6w0I+NGGUVFVdCBlvxfbnCUz2VFHVqK08Niml0dJVPwiV+r0mihskrNfNgyj4l
         fyWOyyhuFSCiCvhG3LpZDaJcLEgeWm8qBdpOzCJ10yh67BgiCC0GUHLmIpAf3E5wKnvL
         E2bg==
X-Forwarded-Encrypted: i=1; AKwUvByxuQnvuaoZJf/3skORdYPymm1xyzKVZd4BP5txVxZ4GpMYrCP5WhBEm8yy0XCsVoZX/cWd7ddOrpMQ+tWu@lists.linux.dev
X-Gm-Message-State: APuU4Z9tBQRXt3oA8DRiRRIT1LWA0dbFDvIUIz5IXnuIlrKaLZuKB5Y/
	VdDcZPdvbYjMuZpSpQ/3+cEXxVMxlFg2YtCS+evzf5hxlg8+pTgwqP46
X-Gm-Gg: AYBFou3R3A0Il8oDZnbOJNbRk4LPcT2KZNx7cFEgJeh1aI5f6+ZN7YsJVFbRAYcNN+l
	hpaiEC3IhJQ2QgmenzyX9pBVGMG8aDo7enexT/7iaAncDQklAb/YZkjDkQfREsqRaWJHyR9Yg/B
	Dx34Ev2u6ZTDoKcLFM0bfkSa0hvOzalOP4gPxaRFRMctiqCNGxQ6mju1FmZHs07KvpzIToc02+A
	WcuV5Yr4dNoczR3VJQYoiJ72eqXVH51aznkFNaEKemYcI7LllyHoIGAqg/oFrLOHhhVu0jVrDGt
	iGjcxoSXTjTGTZwVoMnDfq+u4sF6483F4SmfU4s1TJxaRScMwC8zho2b/DoAbjMXSuTVE5A/9Lg
	2w1HDGWjIPRNvZm4w6dx3jvUSd3zesFLS7poDTIj98OEJX54Wn1L1QR8zX9+bUPr0uOeFsUsBz7
	hgfQHqDG2d6ABTXOMb4HpD2GGnc+4CxrogwInfHEZ9MyiTxSp7o/yvOArXRQz0E9+aPx7aH3q9U
	CFvZEnQQ3ZO3u52mFhQS82+iCDEDbMnBF58/JCy9dk3L+96EeqbLGIrnmv8eIaHXJUtCnAiU0cc
	YETMP1ZlTORPc7k8ulZDt4MjVIf5/128915GwXNTdoXTabTj0jHCwqL67O1mfITDWTn9IRVzFRo
	TAsGtH/T5YKFnky1iS2RErbinRFxKu4hcWegIgljJBFtkvR2z6JA9cJBWriEbz+FPxVMYVhzxKN
	cK1ZpXP2dY94CNUsakWKGmLhbokcK8K3n3mIvteRAn+GVl9MNSt28q+EqggRwPoO28o6O0d0Taz
	5cOzljGa7O8KsUITX4e6v1U75C95Y5oBI60y2tE1SAM23jxOt1W9d0sF+40trgCWs8M9K8=
X-Received: by 2002:a05:6000:1acb:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e6e4f56dbmr22985553f8f.41.1793639001832;
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:21 -0800 (PST)
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
Subject: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  2 Nov 2026 18:02:56 +0100
Message-ID: <20261102170303.1973892-4-jernej.skrabec@gmail.com>
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

The frame info of a reference has a reference type for each field, in
bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
long-term reference. The driver never sets it, so the hardware handles
long-term references like short-term ones, also where they differ, like
in temporal direct and implicit weighted prediction. The vendor library
sets it.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 892193c12b2f..a716955655f7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				bool long_term,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info, ref_type;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	ref_type = long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
+			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
 				    &pic_list[position]);
 	}
 
@@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    false,
 			    &pic_list[position]);
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..961fe023bb43 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -616,6 +616,14 @@
 #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
 #define VE_AVC_SRAM_PORT_DATA		0x2e4
 
+/* Frame info word of a frame buffer list entry in the AVC SRAM */
+#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
+#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
+#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
+
+#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
+#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
+
 #define VE_VP8_PPS			0x214
 #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
 #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, 28)
-- 
2.43.0

