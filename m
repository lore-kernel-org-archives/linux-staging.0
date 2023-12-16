Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499EC219F9;
	Sat, 16 Dec 2023 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjzJxi8l"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54f4b31494fso2766133a12.1;
        Sat, 16 Dec 2023 05:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702732170; x=1703336970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n89IuR5gUSQ4BVQ0By1D6c8QjvjYZ+sxQ5eQOMT0DAg=;
        b=ZjzJxi8l+j3VXp4U26OS2VTxdwe79U3yyKZWDuR5tK8GiT1wPSwO7A33+0vUNwMb1T
         R1juNbbtgOQt1hzReld5vBcg5D4Y8iRmdlfP1aQELHHP/GbY4FZ1AY141a0F+3eg0CWs
         5PhFLo5FbPuRSLthN0fRb9gD38uzzgB3ccOGhbsJ7EkLwH/M74cKCkvhwZStcvgVvLbp
         QQSz6byM102pX9cOc43SoyCBrlnvhXrsjIGfMWBKGblgyUOM286uzA4f+Qph852CVPcc
         g4sYr/OshhbpCkd84ZGWrywzhu2HD57i9OROgPEAP3GeVT/PfjprEhUBBmOIUf6HBn1Y
         secQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702732170; x=1703336970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n89IuR5gUSQ4BVQ0By1D6c8QjvjYZ+sxQ5eQOMT0DAg=;
        b=YIwdynn/KKp5/xT/fmR7oPLl257BV32+JZr11g9qomMoDUNLozqM9yQnsm0QGWr+V/
         RWGqWgPTQRRbZEaDBr85jC99U9+QFYivuaYgGvbjOcp6FGJdwqoSqrOyh9jFNyPISOr0
         bUssztoJ1lmQzhi9Fdf5mQZM1eQt7Xkv1nbAXPra4h+k17mCp3wKsIaH4sdC7aRurWWV
         8EsbjLb3T3/qZ44GExteiKQOlh0zRajVExP0X4ihYRfz4YJLR6nkAKpPna3zQmwHPlVv
         VU9llAD3pSAfu+h7aQOX/2SmyWzO6ML6HzI5f6F1o8lFAEwC1D0q6takv+4V49eSqrGK
         l03w==
X-Gm-Message-State: AOJu0YyDV9/N4kB4VpVzEbxl80DPyGJmGhvGjW5oDWw62J0pdVNH0K7D
	n2cQZ2MvGL42SvigJJptpFw=
X-Google-Smtp-Source: AGHT+IHkWr7Mj3eKXJJud+PAc5UQeJZpEKzpZ43hzhunTp0Fynlbb806wfnWNJcKola3DEFkl9bo+g==
X-Received: by 2002:a50:baea:0:b0:54c:bb9c:4b88 with SMTP id x97-20020a50baea000000b0054cbb9c4b88mr13586805ede.5.1702732170257;
        Sat, 16 Dec 2023 05:09:30 -0800 (PST)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id ew12-20020a056402538c00b00552691fc7f9sm2628963edb.66.2023.12.16.05.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:09:29 -0800 (PST)
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
Subject: [PATCH] media: cedrus: h265: Fix configuring bitstream size
Date: Sat, 16 Dec 2023 14:09:25 +0100
Message-ID: <20231216130925.2533395-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bit_size field holds size of slice, not slice + header. Because of HW
quirks, driver can't program in just slice, but also preceding header.
But that means that currently used bit_size is wrong (too small).
Instead, just use size of whole buffer. There is no harm in doing this.

Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Suggested-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index fc9297232456..16c822637dc6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -427,11 +427,11 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	unsigned int ctb_addr_x, ctb_addr_y;
 	struct cedrus_buffer *cedrus_buf;
 	dma_addr_t src_buf_addr;
-	dma_addr_t src_buf_end_addr;
 	u32 chroma_log2_weight_denom;
 	u32 num_entry_point_offsets;
 	u32 output_pic_list_index;
 	u32 pic_order_cnt[2];
+	size_t slice_bytes;
 	u8 padding;
 	int count;
 	u32 reg;
@@ -443,6 +443,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	pred_weight_table = &slice_params->pred_weight_table;
 	num_entry_point_offsets = slice_params->num_entry_point_offsets;
 	cedrus_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
+	slice_bytes = vb2_get_plane_payload(&run->src->vb2_buf, 0);
 
 	/*
 	 * If entry points offsets are present, we should get them
@@ -490,7 +491,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, 0);
 
-	reg = slice_params->bit_size;
+	reg = slice_bytes * 8;
 	cedrus_write(dev, VE_DEC_H265_BITS_LEN, reg);
 
 	/* Source beginning and end addresses. */
@@ -504,10 +505,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_H265_BITS_ADDR, reg);
 
-	src_buf_end_addr = src_buf_addr +
-			   DIV_ROUND_UP(slice_params->bit_size, 8);
-
-	reg = VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_end_addr);
+	reg = VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_addr + slice_bytes);
 	cedrus_write(dev, VE_DEC_H265_BITS_END_ADDR, reg);
 
 	/* Coding tree block address */
-- 
2.43.0

