Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246672;
	b=JlJ1LmHJuWvHsMYY7O2RI5j+kgi8HeDIbui4nGJ8fc+iqxkZjIbeDtgWzZdpJ2r1kvr4
	 3nLAuNDskXpIcpgu3OZTxyCIxelMu3PSIrpD6kIguiPjlrU/InPFDQMmHksHNXOtj1Tgh
	 Frru6mQ/y5DoyUIJNOgQ1fm0LsK0GCVfl30hOAY2hv6yR0m+ZsIuyAEi+JMoI38bks3rJ
	 xoT5rEHcgN5EW6X19dFh9xdpb7WwHpkhi77uD+YWxvCHsXBXZi+DywrlQQGJiUt3Y1uLJ
	 zwG0j2lE0eTmMgew1gpv1oOKJibbF3odWbdgoce4CbDPQMJL74dmVuBL+QH9aWVhx2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
	b=dNSPSDu6cTIPDfqF8Vzw3kDvxDuFDbykUGlqqGznCXUsEGNaiuVnJUhIqSS/IkV6bUZ/
	 cKbmFBWjB8lejucc0sqZ4fkUoA5U6qPyPVGEPwuuIwyZFAEkjYIMLTw7XySyLBqZI0x36
	 6VQV3a+FC/sq2FqzXXJ7aDK/WOJJafuKWxuFxhQsb00vaONYjTMy/bDwsvpYfsThbcaWn
	 3Dp0OQmZGV71YgRBFiGcw+gGCVvk9RsWOJ9JRK+V9k33xhThELBYfedhBEHMNdtNW5fRB
	 hBzk5S48vhywejcQXeNbUF0cOVKR68Mx1FQ9Z8RDmUQ6Jp11zQC065A6dM8gh0BdVkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5rcFrQ1;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6759060A263D
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6759060A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5rcFrQ1
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4910b863b84so754263f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246670; x=1794851470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=H5rcFrQ1WtL+NBo1kGIp4ghCzVIzMninnNrjHSTzQiXsWEI6XPFBPQjetNVZ+DNrpi
         AWmimF1XZHY/xMfNc5HDwssKzWSwIFZhe5ZBk+pyowXePoiFUE5azjshFRiDc4BivFsd
         9k4MmEDIJpbWUqa85K+5slBe150tzY4RFRkbMfRpNNafoZhrbHdcxJqMQNpwffQRuR1x
         qgBfwwdAQ4gCU/fjJWEM6jgI1I+FyHGeB/MTLOgChIxPLC6xzclGxFEFMN1dINLjlbs1
         jgtWu/y3RcJtkI0VCkhiYPnIpo1sm1dLrmsD4TYwjBJjFT7EgApIwBgvcTVmYJTsvdkM
         bPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246670; x=1794851470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRPAaRbuPiDQoNbXSXuTf0QKQZLyeuwtHbl0ZEG8jNI=;
        b=hWOwyPNNf3JYnmQqgDYzAW0bh9ASYdtDeiG9LmMKsEZY2WbXAnjuI2Ng12qqo/64HP
         9S3xwQr5xlhxUtgithocoL9W1WOg6nxayRqD9yTLcKuTxxLjEX9sXyDhFBXnWO0Q7SXy
         sOWS7hCCeSlDzxReiTn6CGMOY7Z4l6M7etU5etAdZIHg5Ks0j44SKZggcfiA7RVYvURU
         SrUxmIa1AzjuM4coAlg1XgqP9e4tdrxSPDbK0AJ4YKRXTEcgvS0Jq7pTxwTDGQctxT1A
         GY6ZEWpxmMQJk7tKCsuLg78rBKVL6+dcWSF1dWiF9d0LTiulCPSzQ6OZEKJdCC34kM14
         PXZg==
X-Forwarded-Encrypted: i=1; AL+hErE5BHabsCpHDYUHIMbwDwxW6DO1xjl+9P878aotquD1qOouK8Lul6RvrgEbW8kQTjZwwgVq1FYLpGmDVTig@lists.linux.dev
X-Gm-Message-State: APuU4Z/RKwMBvLa6dIDXUiuvC2LQMZy9NxRFiT4ihb3Jguj7KdwetkQ3
	xJMQRIiMHq84Zzo6ekPxhfyFfjsJ0YhuiPqx/u5YjOaNyo1iVdLEC7Jy
X-Gm-Gg: AYBFou2/57szd0iP/8MQSxT7Nn+Ump167XqouOybqJAryAyqBLjkfaMpfOjkfF4TQm9
	ZvyjuRpSwJAqL/onnGhFpv+MV+iCMkqIPnrMaQAkfnAgV1SVPK4JEE+u0r76zy96KVfJwFhPwuo
	lR0rU1Ewo1apNfQainO3yL32kbIj5ncTCcYS+tnxAhemMYYZk7wptZA323s696YPkroNdilHVgx
	gt6L3ONtFHFmWsYrf7HOuWjyJDChq+ccnsH75P/ucVkgCj8ZRy9iRJOUs/ld/7H+fbtwq3DOK6G
	chuL2HT3J82jgSkjYIgmHw1BhZI7CINUPds9FJTmKuoERiwTXnwq5YelV5HcJlWAWpw6BprXVF+
	LdSYU3Ivkju95rLF/UdiK5VhBKFTJjzMYCUGp3hH0LsT5sJhLgELh1c/GR5GK5nwC7STANvOHD2
	5bUZq3dhp1snnc/mFiasg4Eqav8A0dL9+RMRHYAn1VQIakvXBla4jyly7QbULIIiTupjUx+1CRr
	4RaZYx8yw+vYIeOytjMWX5n+ORVI6/BpmOI5sOJrNGsDi+JpAtynDqIq1oeEvo4brBdwHi/w38r
	QqM2OsumjToM0JSJ7YXzQ1nAVrPFZb7xa4nH7YTa4JX8QvMCsb+Faag4GhsKQYWSjtgMSvGKNXg
	BgXm6mJwS+2kW3H3k61YIigkWCjisCjSsszR9kEV9/oeWtLPOOiwCAfK7CC8k0OTaoXoZAmpE50
	XCM0AFrmOpskCCG+2isVZGXw2rutxG2dXRr3EFsAeN3aOJwfPWMUq0win594y1kzA9BmK1/ujOV
	GkSxYgLNMS7hi7WWx3tFFDY0VOAR7dUWjgPq0mmToJ1CACp+MA=
X-Received: by 2002:adf:e184:0:b0:495:b427:1e6f with SMTP id ffacd0b85a97d-4982e920d55mr359034f8f.0.1794246669666;
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:09 -0800 (PST)
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
Subject: [PATCH v2 03/11] staging: media: cedrus: h264: mark long-term references in the frame info
Date: Mon,  9 Nov 2026 18:50:08 +0100
Message-ID: <20261109175016.42061-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

Set it from the DPB entry of each reference. When the second field of a
pair is decoded into the buffer of the first one, the entry of the
output buffer keeps the reference type of the first field.

This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 24 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index e8229c60d3f5..97958ceee8d1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -69,13 +69,19 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_buffer *buf,
 				unsigned int top_field_order_cnt,
 				unsigned int bottom_field_order_cnt,
+				u32 ref_type,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
+	u32 frame_info;
 
 	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
-	pic->frame_info = cpu_to_le32(buf->codec.h264.pic_type << 8);
+
+	frame_info = VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
+		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
+	pic->frame_info = cpu_to_le32(frame_info);
 
 	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
@@ -83,12 +89,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 	pic->mv_col_bot_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 1));
 }
 
+static u32 cedrus_h264_ref_type(const struct v4l2_h264_dpb_entry *dpb)
+{
+	if (dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM;
+
+	return VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
+}
+
 static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 				   struct cedrus_run *run)
 {
 	struct cedrus_h264_sram_ref_pic pic_list[CEDRUS_H264_FRAME_NUM];
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
 	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
+	u32 output_ref_type = VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
 	struct vb2_queue *cap_q;
 	struct cedrus_buffer *output_buf;
 	struct cedrus_dev *dev = ctx->dev;
@@ -117,8 +132,13 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		position = cedrus_buf->codec.h264.position;
 		used_dpbs |= BIT(position);
 
+		/*
+		 * The second field of a pair is decoded into the buffer of the
+		 * first one, which keeps its reference type.
+		 */
 		if (run->dst->vb2_buf.timestamp == dpb->reference_ts) {
 			output = position;
+			output_ref_type = cedrus_h264_ref_type(dpb);
 			continue;
 		}
 
@@ -128,6 +148,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 		cedrus_fill_ref_pic(ctx, cedrus_buf,
 				    dpb->top_field_order_cnt,
 				    dpb->bottom_field_order_cnt,
+				    cedrus_h264_ref_type(dpb),
 				    &pic_list[position]);
 	}
 
@@ -174,6 +195,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	cedrus_fill_ref_pic(ctx, output_buf,
 			    decode->top_field_order_cnt,
 			    decode->bottom_field_order_cnt,
+			    output_ref_type,
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

