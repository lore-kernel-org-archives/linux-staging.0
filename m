Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639009;
	b=S0zCZtch7dw5VcZvhc75hpEv1ODUMgMGYZKgdkSIG8ZUffemot7iIYe/zjhbyVonvmGl
	 zLAH+IrgvXFoh4AafocQsYITqTbf3Sd4mQRDMiEtjAIsaWwaS2teLkB6U2jp3S6HgTcc7
	 6OZf0ZbSobOZrxri+SZGzKrUxnv7IS+vl72swrcJWZqENbdkQVDmR37ZUpCwVYgUSbAkX
	 EFa6VOHXHForeNcO/AlotbRdDExRH51S/P16yFeBS8Yrb9xqYjxaHAqOf9qmol4cMQo6a
	 AVxXlE08FW1ydomquzjLUR3/ejyuO1Y61EjJ8e74JjY0YYgS6i7GMGE4NPmo6joD8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
	b=yYzhmsUW5gBlrE3NOllicM44KDqyxaCpPOnELvU6nBmgPUgVpQcDoAJa4p5g/HzeBONP
	 DLkrwO8zu/X3A1Tq+xIezqWOA75uOiJqCCaIL+vCD0PO2ICYJUlyR1TVuSxOTV6va9W7S
	 apXw7nIog3KLuQYABr0Ybmho5LyuBQe1KEOQmEpoertfLycFwlGXw9hPRs8iiZUsyXvzm
	 2qUvnLgyKViOtugoMzU3KI2J13N2xOt+9onGOa/n5+7276Pkf5sRKkJQhFkIw7TmDLO2Y
	 lZpeJGJSXVtS83fbUei2S44ZvlajRmRHDhBkngQchwV1TS+LNcXlK9XuQAdKSAFpw8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCL3Mwq8;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5E6070393
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F5E6070393
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KCL3Mwq8
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4ceaee6770so41491266b.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639007; x=1794243807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=KCL3Mwq8UkLAxCHfpo2k0X7U5kA/LPaflNY5kGoBHgHB1/LSAGkFFL4e2sKKDNQHSR
         OALxbI58OWc0R64yR8hTKwqjkoPUnOFwWDKGrlzSD84r3pwbpF3DZehAqsScTy3tdZ+W
         X7bT3ChJQXOaR0Hvgt9FlpB5jbmJRJMmIwwOPpHY+CozNrYyPXxU8tUOOICozmsOe0/W
         TXzrCWBupIN6d+Mh3G7J49Uzsa5Z0WH+RaSp99YrRb6g5UHUy7CEkYmNu1hYijIYfIIB
         mremis2Jf9KTPB+qGf830eANds5VZIiTr/G2+/1pPSWmrzIGkQmo3ee1SG3Swyxy1E2T
         DU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639007; x=1794243807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=NTPlUCa5CY11XXV6drd3qUjXlXazX8BgZasF2oRE2KrbmUGxH6osZmyHyEbLC2c4bZ
         L4DFS4ubif3ngDuXTmaf6DMu3sIpwRXP+OIUb8XbWFCA7EU4VU0go+Lh0AtOi3mDcXFs
         xSe3/EEmZnm/nVazWiC6VNuNEAozjmg8TJmsGtImZNO4mj41WPm3R2cT7bn8M7LactO0
         5OOsa0oa/FYCqNTEvhtVXjubxTtFWwJw8ROa4rs06OpJYm1hkeH7/K1a3h9ssZDLRb6P
         +tswDZOO9y4js/KXwZbnIZMaV+uKHkNxto2zottMs1sHE+L/n/JrYV7YvnDR64ym+xoY
         H6yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO5noCJMtLl1vF1DQhKM7mcYPK/oECKm9CRrM7zXYkRs/jY1PsYwcOBggiO6s0e84d2NnHn4aFe7x61SCt@lists.linux.dev
X-Gm-Message-State: APuU4Z/qGb/BGMvHThKQ3Fxa+rcxJtHgPuEkncXiYYHdzCek+XQq6Vhi
	J4SricW2z9R5KYpBoriC2A32uiGxhRCwZt0rBKtMN2SAduJ0bFNgQmfI
X-Gm-Gg: AYBFou0P0uERqbFU53not4Uqe+ItmmOp7BNJsK6WKKGsznBbVgj/ir/oI3B9McW1x47
	dlzuftUVuHqWS7GFlm7YisvPnwY3at3o6CI4kqXH1HT8/oJzNNW0AlrJRp58/K4spa7mEioTpwW
	d34QAM4xrZ3a48VZN/H/YRMaag85jM9V4+tPoAuzlSvM1wi55/N0w/90abGotS8guIYt3hxBghM
	XM9wpOneJMdtetQt+JQ1xQClZ3pP1k3yQphxAxJO9kFJWVNAi3NKQ2wNIBnFJBN8DtSVwB7ll7Y
	YT34PkuamJtfcaf4R/p2yI3PxM8sCdQkCILeOSXGXfDYK3Bq+CO90BfscIpAZPq7D8ZHLo4dHLH
	mUyb7FdTfi+/xL+ropZ1O43tWgM4gf/1/j/EqiCnSKaJkhcItEqmR4WYTiFRjf++xETJAOcH51L
	5nmD51zVjtgZkWQKB4JnnkODN2yFqXpeCwBN3yB1BrU7lKzo90TuDzAXj3ThnCLKqkkxsu7same
	q3AM92Wsp5hCt9FGumRXs5FbpqZcON/Y3Z1XF2sl4UpBqIgm+NtrFPDbthLbl585dLqLk11c15W
	6ggkjO66e4BBqkFjx+I8uzztoHVK/fKpMjRCaMgOA5dSBD0X8uXIsM+kIAo1dooi22OKEb2vKGI
	AKbTwJ1jrCBKQm73zVU0UnxhS25HV0ZkBpZaTgYYuoay/8Yo+ZhmxL6YSUx1+tFJFVUUFKrWERh
	1X1YqJF1vAF85y6jD77KLCkw25xs7vk+LEK5vYjCCEaN9JTIur5sa8IxgH+U5w7ZW1i3Y9ATNZi
	cKOX94Z8gL5Ik1s9JWMMzpWk/Zv7tyCV2oClCGHyqQgo5CK5A==
X-Received: by 2002:a17:906:ef0a:b0:c3e:cb50:b7c8 with SMTP id a640c23a62f3a-c4ca7a1997amr921711866b.12.1793639006912;
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
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
Subject: [PATCH 06/10] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  2 Nov 2026 18:02:59 +0100
Message-ID: <20261102170303.1973892-7-jernej.skrabec@gmail.com>
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
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 4c8accee5389..0a2f8e77fb29 100644
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
@@ -147,15 +148,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
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

