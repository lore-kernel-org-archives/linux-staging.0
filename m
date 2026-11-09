Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246675;
	b=4C0BtbaOW8Qkk7iPJNCOyBQsrSKecJ5F823OYHgP/VtmdFi+L7zkUXSYaiX9jVFiySbL
	 ZTwE4IT8YLloKrfrrXIqNFpcEjqoLa5ZicnzEhZWXdiyZBzi1Z5DXaUCU+2f770al0Bw4
	 vjnGu31h2K5X60QzHIG30ZJFb9Ne2Ve6PtMQ/8hsrRY4IYLxj3Y2+qtVx5K0JPf08lLQo
	 Of7GjqwH0RFn9ndoJJDCEVToU9Q5bS3jIQDjPqonHORk7PXu2KWe3Pml+3y9w8shjcvVD
	 dMUcZziWRTXpmsDxkqYYT/xTifkOF01t9+MQc3r5KOyMP0Ui4fhYa3YEG2riNBbmpXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
	b=e45xj72G2+vF454xwVT54VBKjj1gaHv9YSRNF1eoED9X85TmAopIKLHxi9MMRejXpDTh
	 WtC4LG6JT1m995v8GpsABrza5jTXoqs1fMXMPh7Z5tCCIIzAm4LwM7GzGzlc3kyM7TjxM
	 ieAcGbnG4NYD6r4zEkDLmerVcpyWB08eUsp+bnyZmZstc9mZ6GulhJGCYO+MMj0FIhfO1
	 Slp59H72wLWx8SKsfX3O6Tkm1vyufWBN1JBlyaJHo3WVlyHVwXYLlWJMbDMEBYqSkOhv3
	 Yh9vrQ1Osz37wPTT3CFhOzCUt4449FysLQVCknzJamd/w6HpQS1sPze2Ng8JLBNaE1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcAimGOv;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF9A60A383D
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF9A60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcAimGOv
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so804428f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246673; x=1794851473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=DcAimGOv+DVqDW44D4KcTPnghgsbRyq+SRO0ODo4qAjcCmy5vXgs7wMh2Mgwhuqlbm
         tlq01njs0+rlAw1Ft4Xg6b5nt3g52Vw/S3ywH7X/xAGwkFuVMxfhJWtiud1PnnNrU1eO
         nx5J8JAxsoCUqQX7CLrmWh1emVvP6XeKfzGtmNIircpaa6cj2p/+W7Z/eXtD2lfXnkNr
         tfLPVg3Sy9CEMmsl3HqqFD6YeziZmM2ZRkthUK0eDR7BZcAMD7uT8wTq1jeP3V2MAbE6
         J9QXsE0Y0ppUnfTlL/IsXZkDGQxYCrhskzdMqQrkJeTU5cqjR7pYyP5xogE26BFh6BoW
         1utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246673; x=1794851473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=mErrmsx1EOQj1RxEn9kFpFFAKwCe9MK11yxu5T/RYDVewHJcc9/n+F+Y8Ptw1HDLVL
         rmI227HAVId1dVLkmN6CLUGeshQH37F60XdtvSVqdsOUnRXwZyJDCC50EmAn4RHvZH1g
         ZIo72F83xPwpQJh7MeMw6WDKWDopDI6VqnPwGE8WdpMm6FieD7GbMi9hvTVqfUwEkio6
         8dhgrTXzlW7zlqD2Wpt4BZ6f4OpU0H30aTNgCbTVvWpixNbimrrrkGLMv/gASNGaxiYc
         ceFkIS/q7Dq17g2ebwA586CdwB4FsVrFDi0OPRux6WPHE9Wzhpg4pnlKMFGXipMECsXE
         yfLQ==
X-Forwarded-Encrypted: i=1; AL+hErEkoWYdJhG+8xS56qsLxFHaKKvDYFvY9kcQP6asa85xM2fKZE7voysHgqPxn20LorTzqj53Intal/88wFYL@lists.linux.dev
X-Gm-Message-State: APuU4Z94XTyiYes42NY1amQxDX57gnETcxpzOnWVWn9XgPQf8W9AzXQY
	BZBhUHNmstsT0zsv7a3hxnbwVyHLLgYMAsEfF56r29C26AlL6zuG314s
X-Gm-Gg: AYBFou12y5xbRQ9peduafZTFzNXgzH+a+cgHQJxC3qZvLLSUEruiol1+8FrkG6R9oUO
	gVb95JFisZ/v0f3kAlhe2536D2PBqDAbDfms04omVF+CxTGczSWU7IiN7wjtKyJB6hwdsC/PDR2
	DhTErkxhE9k8M9JZSUMadV5i1cWmQpc+CiDdG2GuqSzzbCgz71/TkNOppkYX3zQCUZayd8G0rGq
	qnm9TCPQdySJZurKwNCNpl214QOb2M+RprRuEL3eAmG69PwHRXlpAgDUatHTaaAkWYEW2ll0fgQ
	aBUrH+khI0Tk36aN5ld++jbd/Vx77g2ydm4kAm+EngxwJ1opCIWkyKtZwHDsohCCJOFXnp/by1v
	KAFoaVao5r9D3OkaHqYgbodpll/sT+WOsj2SqG5955WMkOeEhbGhVRCUF20fVJKCGixPaOjwE1S
	whHLz2Joz6YfN0aFpC2STcmg8DW5Gj0zBVF5w1pI1Uluq9t820SpFQhskS7yHBGorGO8JQmACXt
	X8CL+j3CocCCR2lK1iU4FDuGQ/80w86xhOYEiWR++UUu54iKP+B0fOhK9KCXNlHU2p3ejkj0gr1
	PAm0LZ2mvALzIdwAFKlsoKqGVsmD5gtFPgMDjNW8WgLt0lACqcNdET8jHcQfooszfKRSyiOE2Aq
	Clh4z4AWCYNXShUK3BF7Rwx+VtnMd9AJnXzau4sK7NbbLYvgWq7x1eOCLWXEovLPsHaI6Rt1cTx
	lPSfw+33IpeJJYms69HGZ+N24R1/abPb7LoyZZ/gNr3I8J6iT4CKpGZI/0qpwwYIAUvSJMmFVw0
	9sXPoWOn+yiySMMV2nyUa5z/0Qmyy1xbD/DD2CO9J2bGXYx9OBE5wzVpHscpoj5fBiGzj5U
X-Received: by 2002:a05:6000:230b:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4982b28a797mr485950f8f.3.1794246673337;
        Mon, 09 Nov 2026 09:51:13 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
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
Subject: [PATCH v2 06/11] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  9 Nov 2026 18:50:11 +0100
Message-ID: <20261109175016.42061-7-jernej.skrabec@gmail.com>
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

The second field of an I or P frame can be predicted from the first
field of the same frame, which the hardware takes from the backward
reference. The driver programs the backward reference passed by
userspace instead, which doesn't point to the frame being decoded, so
the second field is predicted from the wrong picture.

Use the current frame as the backward reference of I and P pictures,
like the vendor library does. Also fall back to the current frame
instead of address 0 when a reference buffer is missing, so the
hardware never reads from an invalid address.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 315b0e5b3c88..9bd7f3ded83a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
+	struct vb2_buffer *fwd, *bwd;
 	const u8 *matrix;
 	unsigned int i;
 	bool field, tff;
@@ -149,15 +150,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-	/* Forward and backward prediction reference buffers. */
+	/*
+	 * Forward and backward prediction reference buffers. As the vendor
+	 * library does, I and P pictures use the current frame as backward
+	 * reference: the second field of a frame predicts from the first one.
+	 * Missing references also fall back to the current frame.
+	 */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
-				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
-	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
-				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
+	fwd = vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B)
+		bwd = vb2_find_buffer(vq, pic->backward_ref_ts) ?:
+		      &run->dst->vb2_buf;
+	else
+		bwd = &run->dst->vb2_buf;
+
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 1));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 1));
 
 	/* Destination luma and chroma buffers. */
 
-- 
2.43.0

