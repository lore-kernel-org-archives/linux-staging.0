Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246672;
	b=tV372/v3+V1sBo711hOuuCw6sKY5o/888uIzH3AWMMmrQNBJzYH0Ja1nTb+yaRW+H6ZL
	 kg+RhQdFpImWdd23KVffrWFpMIv3dw0dpKeBXt3/cepYCi2QVrLkmTgFhc0lbgQGB8/3U
	 zbAV3byOtntRJL0jDtgbB3HtdF+F9TjHpqGLipBdZfYqzZx/Yvthsli/772Hh5VPiCdvQ
	 Miy7vKNursCeqRV0v/2WvTTxVx39cdM8K8nBFhLbI8drm9pX16oiSlSjddDMOBnuQ6ztD
	 ylHtaGwMFHdMTaDv3tW78x6bvT5l8FDAmdKz+SeDbu47DM4goBXgoZnkjAzksenp/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
	b=j30OHGObgDL4cy0e460FyKa4h2nZKi7BzmkwrDuPolA/ePWvKbUTH06tdI9umAPuHZMH
	 Oxe3ouqm3aeBsp5iBySOHRIMzTBwHyHbTZfASHPLtFtXgmuKfHryL4aLF1AEe6o04URqK
	 Z/UD0/AQ37voF1IPZbcKRJvjg52bMylXMAQUGEQmlxVrkUVGQVuyyVhHjwxBRF9egWhE8
	 23Uo6V86u2GESjS9ntx2zeQ5LwvXLMNzwgIUGOm9GEWbQfGxaS/aWBwJkDXAg37NxqcWU
	 U/U5KjMhcjf2Cu8i//vq26q8xMeiv1bWG1Inz7PkpAftQSxSl+WTNVkFpWgLWIJtuZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJKxaNNt;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F07B60A3814
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F07B60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJKxaNNt
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso848873f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246671; x=1794851471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=KJKxaNNt29XPywCMdNPHTFen3lwR+ZsX0+kw1j1tcNCPAFqiz8X8zLcq+rlK9auKAR
         BJQjQp7oVhqAWZIlbzGRF8w16zj5t/9TNndyvDuEDQXsNzTy+UjnwsxfMMcg7LEF+0c6
         8uxdcoj+q2sufw24rab6PItjxgQmmwoMbx2D+TGeJZnT5rq+fzM1VuWChEf35DpcFCAK
         lk/GK9t91V+KLiwiqBg4QlRqZaGjexKoJ2C7M6rAJujnsp37/936N7VIK412I3UgV5oe
         2gt8u2vkMBsFN5PY6p0q4W1xm4/4LDZ5FavL1+GzrEOC5TpX6WqaVhxBiu/mywXgXdgQ
         Ms9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246671; x=1794851471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTdDMu4OoBto+glTh8K9JHA8DfuLt2NsMaDTZfUGp6Q=;
        b=d15C1jk35CWx5TiYCjcM51QLt2dgazU7Po6zj3cD74u50NVkCIc6ASdmdoSlpspBx4
         j7xe5GzQOBxcDiUrDXQxKv94LGAU3kNT+bMrFiEvG95tE2UV+imzECUkr8keyvx9+Pzo
         gulRPhgnOgH1aKwkouUrkTYOsQGstqdbAIEcbkOIS11ENs9b6k10zF3lL+NvRadIY2hU
         oYvdymY1o1JezzYGNrXtxeN9r1NV7sbxQIDx7GRL4ipFlJjkRw4g62X6uenOoP/BiHhP
         IVTbk5rrGZNSoURcH44AAO6ZiIUfwoESvJxgqlihNIpfaXtL39djedD3e28zu4E2OZjv
         RnCA==
X-Forwarded-Encrypted: i=1; AL+hErENGtwUsqFxOr8aK1yES96ok5IVREW4PmiIStZ7PHUnHkcZUXnnIKUjgbDdcWb4bHPu6yCX3wzrU5O0l3P0@lists.linux.dev
X-Gm-Message-State: APuU4Z9vBE0ue8gW1tERTx+GSQZXVhIje0qnAXCb/mjCHJIbJkq3T0Fe
	9fNZk2XkM71X7fDU+aNAhDTKtgNW3fkWpXY/uiOVjKRnWyPDeCUqbIc9
X-Gm-Gg: AYBFou0AOdjUZZ7sqRcBg8rw2brGdHiLsiQasDibygTAeqiNriJPrjDEfkVnAZMiThT
	7Dz1Gj6NxaZ4Sb+Vl49c0EgkOqTjQcruvajSKNY1QM8M43D8dO2OoevkonQb8W0SI57q25Gu7mb
	3a2hs/KQz38+5fHGu4xZkD1fqxHuiAVp7lw1f3Yi51eEOLvuJ7SvTBYwhgApcAmd7enmzNMiyf+
	3eyKF+7hEoPSznZQT7fGJvKhIO2Vc1pxxGsY9x+PHX3g9v+8sDMrk471OAlzJg2podv0/ok6791
	WMDXTIPS9MUZfaJX7C4c6Hsx/hCUKphnYn30u1hsAKq2puFLmll5dx66V1oG9a6lu0FOPY2BgoT
	WA2AhbiUmzS9CmWuUFAktPaqwzT6/c8IbkVlPHcgIxi/z5o8kMEE5ngLuAoVuKgBuC+7lsozFMh
	Mno4jkT2kDi+7yn7vUQGsGByZBM9zLFYHA5+5tjP9f+IXRxUUFJrbRxAZuAy2oLOFLkY3Neh56O
	Y5IiOKbHl2t02gNc3ZGpJj26HSfXz8zSJOq5DPK5Se8dMBr2j6dFy/zA79twNV8wjSW5aUTF839
	fO6GX3+p8NfB5Ys+9RbrRY8oNOhAbLPURHWShUQz2T+MqLzGdOq5iaNkq07YiivKB256XIFSDqS
	POdn58DWTVFJ8huh7PuoWd+BMO45Ha/f9SCj+WUUH0YqHPTDuoqBA19zatoQEmUC54pmOjfcyiv
	hGOIrF4Km0+X/auYPbDH1RWe34kwdxo1rgrFVC97KAJh67sCddR9hDxdhlvmVKpi7jEV5+n5ChJ
	muMAn/pbRP0X4Yrw31asCwfX+jzALs47VZWjTN8HVgZxSckPUU=
X-Received: by 2002:a05:6000:29cd:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4982ecf64f9mr225642f8f.17.1794246670969;
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:10 -0800 (PST)
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
Subject: [PATCH v2 04/11] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  9 Nov 2026 18:50:09 +0100
Message-ID: <20261109175016.42061-5-jernej.skrabec@gmail.com>
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does. Like the vendor library, halve the boundary height after
aligning it to whole macroblocks, so that the boundary of a 1080 line
picture covers all 544 decoded lines of a field.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..8252a47994aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,23 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height, the
+	 * latter aligned to whole macroblocks.
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
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ?
+			ALIGN(ctx->src_fmt.height, 16) / 2 :
+			ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0

