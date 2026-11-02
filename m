Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639015;
	b=gtoaHuS0CszXocA/mhV08OqNOh/kzB8p0l0QbZVp1Fbo4EHR9qFmtfjlmqDygBKYDvH5
	 8XvezaEmIoUS38eDhZO0O3E5nNSrKbfqdvah/IToLeB02pPdg+aUuVXuR1UCaIewprHJS
	 iGvBQsuDM3XVW8sAZoP8yYZhSLnwOxOH/cYHMv+uBNf24hwbxwCTpksPInuvvGgGWre+x
	 UOPN5c/cSBK451oBByXX4kk0g5x7f1xmuj91P+Qi2BzFztXJtQ/gbcJVYhVcVdtZtVZg7
	 PkCnhFOMqu+H6qINtt/Z9YQ2qq6wkwLvBzfF7D+AyNQiD7H0ETAstgLszF9aV/BARtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
	b=tQqwA6Xkunssw4x7qJI5hJqMjcm9c/8TrAJDuqwhN+/iuMVFUrX91Nevv+DCSRyw+IWi
	 EDjtt8aQSvV9zyHRA9mGF+oUgvWwg03EZk47IO6MGrD/uibPJfZ7WAoIMNGGamhnF55iw
	 FZIjwzLsR98JqlpldlhIoqAEBjkvz3PuWEzdNPcI5eD3WmtQqCDknk/SDqTp3hn2ox3WW
	 ZQq9ivl3+xnH7K7lUM3Kbw8/83QsHEt7qzo4+NTj5p11aws9UuP6ZVwv+uIgXT60kbWmS
	 fIfsgUz8pPGEkF7VWDgds083sqb51z7utXmFybdzOh2raEKs8+HqfWssbcMIxxBTjlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c97hZHWD;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952B560AED20
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 952B560AED20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c97hZHWD
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3347172f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639013; x=1794243813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=c97hZHWDzibT7SBKPcheelIKPryry4iyrFiIeh1pRTxzwmd9PFPB2m/03PRwr03GaX
         2536nwFGGP8pkPClYz/eqwn32F+XzvYtfWgrFwAbX4T180W4nKug2kwttLreHEZX0MqG
         EGleQFvBY1jRFH7lEaqrmciz1j5vZwcfHqDnP7dpaqT5rIr6LDyyyvKVg8NGp9sZLpPA
         CHPeMLTIRMaUEOICk/F/Q8FWS/oQLV3V1/Ek3nyGTCcEJkmooARLK0044A2Pt2ILQhnW
         AO9QjzeVf6Hlf2qU6xqBlIZ3UBe3TKFXT9iqi1SxNzBVPczUcHUJ0gEh5GB0iR7WjqMj
         4S1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639013; x=1794243813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=edj58/ffxhTBQjKl/aZE7lf+in1iFK7AbuMBMbZEtSMCKmzUpBE0V0gywEJ+f+YrLk
         cp/gDc/yrLBrboffQ8CXDgrSPw+yXbfUCjC6M4SjNZKKPTjvOO/lgrD6QVIHlOarax7T
         FJNe8HjXoAqw+tom3XLlM6Dc8p/FPqfP4GRr9WKU/R1c1p8x3JCSJ3GrB5R4soWKZgr0
         +FNcnXDMjUDhtm5Varaqs4BjioNp6AxOuBrAQW69CLD2aQaXpbkRuxC5K1DaX3KlNiXh
         XUYhvcNhCWggqcYmraFU+a2bhsgrnfXBD30X7ErCnlIND9hTTcwZKeskYl5Kcc9a5aYq
         MEeg==
X-Forwarded-Encrypted: i=1; AKwUvBzvlttgJRsMYeuzpQ7VfELhLcZ6oyYJCb6eGs/4uTi4esTCsK9rfAPk8FDwi34p6wtWnEoLMJ6NrvU+lFjN@lists.linux.dev
X-Gm-Message-State: AFq9FYKTSwdI7ZROHavXRjWBQidtt4irBw0rxoW/NvopFsuBIK9Jx/6e
	eSvz69ttOVPPZKpqQvGm+1e/6oGdTh7g/lB/ycCv+WUXOz0ha8GWq9S1
X-Gm-Gg: AYBFou1P24ZQwkwzs+onrJryRhjTt9XJB0xvo/ekX7jQVG2tyb1RgG/EYOzYf+QRdMA
	NGg4T3bwLGKQlb1f13KhwBJsVw5FKs/CPjfmkfjba9ypoJ3THCz1zsF2dOT2pWn/kkhO9ZXn/TP
	lVrAQVwCLXK2+KOSj3obr6i7bTDk5156ugU4Z0IqMrzua9+7NSPhFhVEV4YJHhOlmTUBI4D8nFs
	MRAbX3SBT/qKeX0LJMqk8KR1Fbc0rls1o8FXvfpypeBCCRx6ayNaGzh7+cdAZZLC1FfKTVXecYi
	ma2uhlTF8GZI5YpSECCGP8GicrqFq6SB3zXZPPhHvZfiEXEiJWq3unq3yrInw4TsTYLOuDtalfJ
	+gD3wc1nnXFsl+NMcJ+20nwP/bZLiwm71v4tctOLNc/uClG8N0lov3sos4Yp7eXO5MlAMkayhxB
	mRDOuYLNvbiIOA4aDPg+khFKgBmceAZAcuMvCiVkDciWOWYrLAb01gH9VEwZvMJ3KaTx7MyLs/v
	BxsXe6lfXX5uSc4v8AMsDLC/vBLfFFjclFkYsYmqtSKSceFrP4HmQIDrVcUncX71RbvNc9FlS/G
	eaeZOw7w1XFmdVGFJTe/BZFU4eFZx/iR79CMXSHMiiXaBpCp/Yz95lM6QPzc1P82a9eCOD6/9jE
	HDA3ZOjWY4xGJEIaUDJlb7o/vF2+64e+ILJl4uxsCIBWqo6FuVitPbwKuoOVrXVarcOP8rn3QAv
	4KvXHljTQCoQugCVU518VnKMjNW00L1P+wbmCkGxV9ubwu9gI5fUMdAbywO2ySbPt9Y6hN7IqBi
	LFwTaVJAau+bvCA4WkvmuvkM8JfJD396FMGX7Er4abk/Id2mg==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr244438125e9.17.1793639012878;
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
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
Subject: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  2 Nov 2026 18:03:03 +0100
Message-ID: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 64 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index d28fe91562d1..ca4efa9302fc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -156,6 +156,13 @@ struct cedrus_ctx {
 
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
+
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} vp8;
 	} codec;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 6b00efa77c22..954c0ceb98ed 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -666,6 +666,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
+	if (ctx->codec.vp8.deblk_buf_size) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
 
 	reg = slice->first_part_size * 8;
@@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		ctx->codec.vp8.deblk_buf_size =
+			ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		ctx->codec.vp8.intra_pred_buf_size =
+			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.vp8.intra_pred_buf_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	ctx->codec.vp8.deblk_buf_size = 0;
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -861,6 +912,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
 			  ctx->codec.vp8.entropy_probs_buf,
 			  ctx->codec.vp8.entropy_probs_buf_dma);
+
+	if (ctx->codec.vp8.deblk_buf_size) {
+		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+			       ctx->codec.vp8.deblk_buf,
+			       ctx->codec.vp8.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
+			       ctx->codec.vp8.intra_pred_buf,
+			       ctx->codec.vp8.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		ctx->codec.vp8.deblk_buf_size = 0;
+		ctx->codec.vp8.intra_pred_buf_size = 0;
+	}
 }
 
 static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)
-- 
2.43.0

