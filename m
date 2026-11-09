Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246682;
	b=fJ76bjJVawuZVdkddtH5Zx7Ve1IFnUCUB6xzLgNbwFk+XCKzGAOQEQn1rHvuCgZsiC8P
	 iMspSksKelovFW0JAQz/RWuv6yKaKxfqOZGZFELNMs7er+ErcLkvI9mZ06irm5MA7zIIG
	 8AiaIpttgjgwQjVdZ6kiIYtxPG8Oc4ArVJCl1EOKx//oBeFz53U5rG8gArVxfuzTlZEIf
	 PXs1Ld//T8EWDuI5uuGz4nhtk4gYpL7D5JhNaZIt+lFtAjc7mlOGF67ECkVKTGvkhiRIK
	 fTn3XHoVyB5rB1AuJNE2yD8Iv/AFpGka5DvTUg6PGoIgAsO8mFBb6TceM1r5iJtVjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
	b=YY1mGNILrSZvLHMhmoF58FJMEpbZDmQD7jmCWfh9xsFPbixyC4YaSfznQfOpdlj3Qveo
	 Iira4Yq7DNaFlABBG09JfZTXN91oX1Lj+vkgkW+wiAKneWiZQJqYWtqQhZEp9y9+3Lewi
	 8EJbISHd4kAGiSxLh2cHCm0B/Urkuft+cSZpho9PFfABR+O/g6ipMFGrv/6FCiaVHP99/
	 uYOUJ15k5RlHXo+C6sI/mtEWiBJkBfAf/IBN0/rek3IXMsgQdvc9gcL3oc2vtL2DVcVO+
	 1lomKaBKWIaM/0R4lp9UnjWaHk0o8Cg7TuCza9ovvTjiBdw7mDEZqQd3U9tAwBn48aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KufMoKX9;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17335606A8E0
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17335606A8E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KufMoKX9
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e4831c028so1266330f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246680; x=1794851480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=KufMoKX99ft0G8RJJxauF4oCBhq2d+bVnpT6QfjVx/L6WDkelgIv/dFWNXKd8+pv++
         YF6AVSp3oW7szSvLn9GaC+Rp7GOP2j/XEjPwFMCI022WXsGMyd9vkJWwmYZ3LEfiaDOc
         Ex6+qZjKgOLXPOELrd71cZClOOHTTDtFXOqOkY2jhjKp/PYNNnaPYUfFeDy092HZHRQO
         wQSxMVhZy3Eeh9y3fzYGOjh2+PyAL3J6akiOkvlltn7HILBSbgF/qoFigoEVQLpEkMX0
         gYAkCxaCISw7ddan7VglW1oPeXBD5SxNejhCeOV8CiXf66MmpOUqnDWXIpg9zwnDEG8X
         ONIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246680; x=1794851480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=fGdqVy5xurV4JmztGzITa0ZTgaU0qLXLhtBoYG9eG7NyjuvXSEzkcAMdkGEte8cYCD
         JXYFlH3HS7LflFWeS96C9fjrRNY9gHnlNo6H2zLLRAdTUUN3X8MwtgPyRI8wF6Dfofjw
         blClvEDOPwUZez45NSO8yDI/Xm45SVWXVu6d+US+JzTtewJ2pv+NL5E6NasBSVFGiuUA
         7yL+a+tjZasTiLUIAVfz67SxObBXjgtmEk0UYFKC2Kt4J4Nr+akQlyJCL4/qc5NshU33
         8P0F0yiXqOaaRLoD0hMBny6ChWDojGnDkRMuCGKKHwqZ2my822sTqY4KShBFXxCJZ948
         9QiQ==
X-Forwarded-Encrypted: i=1; AL+hErGgFPU0Nl3e3aoEmKRx4LwJ601OXLVVo7UFWdpLbLd/HbpbDzir7JiLIr+EidBNxStE+QAGZhZ4u6PZ4rdK@lists.linux.dev
X-Gm-Message-State: APuU4Z+Hi8cZnJ+LFbcJOhD6kufmzJ8XNVSrft9h1qcMyIbMuc2yHOLX
	NEJ4x7jDp9X7P6CWbI9KZO5ucXCjmCJtMiJisWYOWNVPcmywI1Ovmovy
X-Gm-Gg: AYBFou0nohod9jMbESk8kd9irdHfkh6PqM8rAkJZgDeJJRq3GddPgR20QAsua39i+r4
	bZIu36DG7+SoB9Q4TuWAmovf2zqihqbtq2BsXkYE2B+qcPKoFSULEvmCtkxRCHsjoQF44Fx+DVa
	oQqA4LKkOCHBogQOiV92My4H1UhLqZe38BCNzf4G16Mxgoe0Li/1Qmm/FXY6QaWrjRxz5YJn90V
	Gntshl9FJZtMHCP0KEfHbQEXFYrWwTdoGRfBrtRt2+RpHjuyM3LmMB8RHqNvqjt6THXG/L/WIBd
	Nd/snfo3MwuzWXmDvWtAaqN1vxFoyciRNBsNvDD6D/OHzz1PggEGyBg2mn27UASVNeZoSlMZDBL
	Bsq+scWKVgr7qaT3oPC4QnyUK70ijCiwySURB04q7OjEPPnZSnmT11478NFDr/AQ83WP8qoBEXu
	PphUw4LVjfjR6pFIAqrWnmhULrP1hjg/CES4fDi77K8vUQRAwlxGpbWnqxpZ/0VMbZFQUxmJM43
	wC5uA+jselgyK8auXIWMOFauXiZ4uJE7jzCAE8JH73zmMUtFXVmbzo+gw4cj394EVMKOoaAkFDe
	qF40pUun7f1in56pRqHYboZdZYGjiwj36OlxkMi2o+AtJ5wgr0MyArMvPNPKDPO1S4gkVRTp47p
	/O8SvsW1kobqgo6ENu4D1kTFdseyY8ngxzQLDsiW8oe0TekhYUAQe0fL7ggSFkYDw6NFA9HHkHR
	F63sSBkeAGnoxtRayDR3wtuNEb+pVBBNqQBuEY+CsHdollIV2yGQIP1Nsus6GXmE5YGuS/wl0mx
	IO2RtTnjlF+zIcVWIng51HXzLvDwT1wenZ6yWuI/S2T+Bz4UMY=
X-Received: by 2002:a05:6000:469a:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-4982f968989mr173933f8f.31.1794246680224;
        Mon, 09 Nov 2026 09:51:20 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:19 -0800 (PST)
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
Subject: [PATCH v2 11/11] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  9 Nov 2026 18:50:16 +0100
Message-ID: <20261109175016.42061-12-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

The buffer sizes also tell whether the buffers are in use. Set them only
once both buffers are allocated, and clear them first, as the codec data
is shared with the other codecs.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 67 +++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 78efd3938c77..e26bbbf2e55d 100644
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
index 84bf18fd231d..bb32232d37ff 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -669,6 +669,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
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
@@ -837,6 +851,11 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
+	unsigned int deblk_size, intra_pred_size;
+
+	/* The codec data is shared with the other codecs. */
+	ctx->codec.vp8.deblk_buf_size = 0;
+	ctx->codec.vp8.intra_pred_buf_size = 0;
 
 	ctx->codec.vp8.entropy_probs_buf =
 		dma_alloc_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
@@ -852,7 +871,42 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		deblk_size = ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, deblk_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		intra_pred_size = ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev, intra_pred_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+
+		ctx->codec.vp8.deblk_buf_size = deblk_size;
+		ctx->codec.vp8.intra_pred_buf_size = intra_pred_size;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, deblk_size, ctx->codec.vp8.deblk_buf,
+		       ctx->codec.vp8.deblk_buf_dma, DMA_ATTR_NO_KERNEL_MAPPING);
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -864,6 +918,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
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

