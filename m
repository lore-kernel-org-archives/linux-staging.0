Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639005;
	b=z2XBv9ZOl8W3f5/VC4T/ghasC9xUMYdIa5At4xoIM4qn5e6gtGHOiDNCP8v9biDk6YJv
	 c+cd/Bw37r9j2chkZ7Xl6hFTvAjVuOGMm1/kMpXAkj03iqmJGSN8ay3icjdbUL8yVfj09
	 4Ff2xvDLavWAOcgu8Qwo/eFWQnWxrbsFqMtgpU7XlV1tApCymLFl3hdGFDEbzOxbn74QM
	 AJYjFYfXFkFHL3z4m+hEvqxhazN4gPk2ye7DHNnQeGSEKYSFmlysThh5QsOG751jL5OMU
	 2gQbsg6O23J+pwAChOTYKC+5HYWryY++FM56qJMOrcg20hk5swIk+JJ9r755QY7tlew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
	b=BneXFYhqF6CBsyYv54JN+h6HyJNJWyWbmnWvtn3yCexqDT0hGS/ogKZBuoEAifL5Ah6d
	 PQI/2FfG99JsvGa7y0vNhHdx1Z7qUuHOzOVjHswQ4WBMMDwodp7VWthPCSIwhxdd+1Vno
	 BMwpW3ePxQdWNOTQ+VfHLvsxF+S1c7iXPuVKecQZNpQHFqy7/LzW3I+OkJRerS16m6Z6B
	 lI3uLtmBj6sAQbzg8neAnOgW7IODIIwWQweUrccE8NYhWFX4TSk9+u1rn1izIKHodzFi0
	 UxnbqmfOOR3Upe4Ng0i/rSKfJKscAa+I/mgx/8+v9vnYUmQ93pPhwDRwj8arDTPWn8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q10I0hXw;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EAA606C57F
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0EAA606C57F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q10I0hXw
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1917731f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639003; x=1794243803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=Q10I0hXwNDUTlpX+lCpdZi8emmGpy7cPHx3i8Xm0rNB+xO/Kw0CIY/iKBVblFKzzS5
         DjIYBc1N41hzL0sO9jZyxxC/zVvvG+h2jnWSODIuJOs7bM0b+mNB9v/mJcWq/WfiJMXp
         P448Ae5R4n2C9vGh+cim2xmSACM3cxNXcCyRI5CuEXhDG5lmY9WF9FP3RHe3/eZHLrhe
         NtoN/PYL4Eyu+09s4rUFpwX1YxcZjlDDjTknc6Oj4s/nYw/hc/Ti2AtriLJdlEr8POE9
         g7pxOiitLhQqfqGTj0iyX3r2St6yAuRkZ8lOPI/giiUr0GiB5fZD/WQ+f0Pbpfk58HMm
         +V0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639003; x=1794243803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=kPkj7ofMp/ipqtpM6m8G/YabGnFCpfUcejh63oDKQutxWPlyX+HKNe9I/utHIMaY0b
         KcY07fsEsSe1iHmfPLjeaVpppNc6xAIuzvCHvWRDZjL9dsvMNGZ1Gu9g6s4lLwgnAMCW
         hSrxAGVoxIqh8k/Cs4C9TInan04uOEsbf5c4g215TUcWSrUZl4n+f7WAfDhrXiBmYfxw
         rXYmAyewlabNJq/SP5b6Lfzl2MUzn7+nwpTCcpPVjyMwPOdXb4ifFsuRNm9SjnuRrmqu
         ErVLZH5qqG+q5YWCFgq6q1YlGTgFCs+Ym36NIz7BU+i42D1nx1KgkiO0pHdiV2a7gQpf
         FfFQ==
X-Forwarded-Encrypted: i=1; AKwUvByHLtqeu70CgJ+A2MAuYWAKSJJItsdS/TwE9hnsvHRBl1y4Dv9wJf7rOfYJn7TKbd0WFvOIfyRQP9e0MNbz@lists.linux.dev
X-Gm-Message-State: AFq9FYJURpOY+2onIaFEmgZYpKxNoAKqEbXf3JQiO3Hcg189bm9uziN2
	z4371ZmOmBwrZnD7xr851fZdV3KuwEdS4/aJOGg2Cq4lovB2/v8Ogo5e
X-Gm-Gg: AYBFou12F6oWHGnQQNPGnvhLfkgsgzSgqGHF5X6PxMlsC/2x7zU/fjdRp/upHJxOGec
	gCunBRp7I78Pvhk5PGY45Lm7mQRO8KILMyQcwA6BnS3IxApEbIV1vUgmcCWPep2Py+BDehHYvwa
	cV1x+TNS4W73KQj9PyuncT2Pww468wmOHLS/5aoHB01oApq+3MHuqDNBeqfNkYqRTNRpmWKoLpq
	PwTtkEQsYyFT0Q0wjFjH/qxkzQnr4k/Bd0++Whbxy1/EJpi79K5C+dFEmofdRiVH6JnLyJhKQV0
	QeU5ySP/NCTVRiYUbDDmBKuSyGJY0QL7U3RDdT2Ry3tPvQM3MIsxZmLBaOnIuu9KZSXrN+uCPer
	Lq78cDnlaeMiESHrD8heBFjTso+fZvWxXMEAcpcPh9Md76nGmUvh51uPHUto3+hpVmSfyi5BxXQ
	9GuOtcqWTk7iTTX5ObeXNolKMMYRW07vg774fAvvtiTAX1bYVjbQJX308k7ce0meP8yeBX0WMKN
	3ieaZuK4eQexgfWIwQ5KAl11N1JLQpSiVpyKWJBj/QgRtf+B6otVlk5CBbnQljBRApHtWi7X8eW
	v25oMB56kyn9EVUlW83mQA9SEvcMskYJI3UMl8pc8Y0DGKIG0gxo2Enn2Cf6znWVT570UkDPb7T
	zhRPZTsUyFd6afhueDzCesLzr4T4uhMbZuOhmxFTJkxS7rr+tpZk7tqlyw8WgTZASkaYu7H83MD
	iAYbcvX3wAYSNtaNFBJ4MXLE3lmw5dhoAj9gbTVcATbuj+EErwMvPeZq/vwdPtkEhgFX2OSL9R5
	Ni18wdLXfvcZY3iciSq4pYZVfSlofE6QNVN+HyT3GP/p3e7CA==
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr241875865e9.27.1793639003332;
        Mon, 02 Nov 2026 09:03:23 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:22 -0800 (PST)
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
Subject: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  2 Nov 2026 18:02:57 +0100
Message-ID: <20261102170303.1973892-5-jernej.skrabec@gmail.com>
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..ca66a3c6b830 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height.
+	 */
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+
 	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
+			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
 	reg = VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
-	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height / 2 :
+						   ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0

