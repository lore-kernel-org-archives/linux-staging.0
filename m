Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246669;
	b=I/kDvXVDFwmkQohh3aEmz7QqQxyGEeq4Jmb7FfM0ss/tiZ+yAKbyLSGtJLEffGzjmRd4
	 NjmdJzQVXWvc10hJDkKRQGT0CDdHP/pezrPuMeMfDoe66A81024Sg+amCkUSsemHZnrvH
	 qe6nAOhn3wdmY4cyxeE76hmz3FkXUwuWSO2bWzSBEc5GV141p8j+b37GhXq3AyrXrJi0X
	 hDL9/cQuRsCvbXsABOmUMi5Q7FhQe2BfTVey0mkLIuqSBUMCi/Zo472tRLWun6MMfRUbv
	 +bzup2OwQYw5qMixS0JSCDvoinlsu9fk0OPRHHmn5tmAEI9i0wEz8JtNmYFK2a6vKMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
	b=VtYA4XxIu+I/Qp2yg48kGEdx2YDFVxnGORb0l67jlj0F+jZHgVRKhvXxA7TPZ6QN48PC
	 8o+4z1D5ul8wUX71PmZ3AJlTWQ0vcvQSW5zKbFvWizvnMh19Tnc/qB2peiOSTpyy06VNN
	 GJAeuO3eWQb5ekP/fac+apx72Xo4Lf6JVzkfgRqBenDfnJAIqOZoYQPjsXM61unBqgFn7
	 Ga4Uq2E7yhwXEvJ1az/aysY9RfPLswVIspF7s9HwPugpqYQE5UURS8UMDDsHnK00EP2JW
	 cgL83ZC4gt4CYOBtgiTgaooPsR3KhdwJ6hAUKkqCE11+xEt0C4w0HbQrvtj1HHUbIsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2sSRnxt;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583F60A2601
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0583F60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2sSRnxt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492690dd5daso829671f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246667; x=1794851467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=v2sSRnxtVLVXn62j8lI/G3D+FSs9liIWpWCm1QsysqOdTklzT3e54Aj29fJri0ZLHw
         9NXUps5sHjywXSajSNxV7+72eqnST7GZW6D5U0YrSk8YrF5+W62ztZh1Mno4+lXK3Qkj
         +yYDBZWlIYOW0rDKh6yPPj33dJZAWRBuwhhyoEvwfN5K7tw4kjZ5nxJV4HV8oJH3cgrN
         OJ7HEGOdc+WOZMwzBH9ww+1NvQT++fhlVhE3HZ1eiOsJHLP5oD9gDH0tGUtAaMSuJeVt
         2HZW8mPQMuoUTPtfbfUfWw2s/SRCFieCexpJAMtqMIuOouC1tubSGfsrCIoUQdUyLQZ/
         ZeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246667; x=1794851467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHFCx52QXB+dxM1oRGEYW8olq3Iv2zM5Gz/ZhK7pFLA=;
        b=2oCF4DiM1N/3udidg5pstpyT++78Fb4csKNA11DVToR1Aqb8LbTRWUT6EdqUT4as4T
         g/h5H97c9PVumcK3YmoPUcESDPIJHzLiEvtSKptAJ0X7tvqYTH+ICr4uRE09C4gfMiPb
         HOFhNK6uQFzAFQE27IJ9bLER5kEbHQX2+lhtmhsMvaC/ax58gSf5M2asvXnZ4QT1TD5K
         rQQTnLfnthaErriR0tVRrPB542bBxWU/1R2Tfs44dL3JLZn1R6iQhsg1NVntvFEP+7nB
         sNpS3NgI6aKeq5hB+YvarknqEOzquLmqx5iJ/0zrdMNQ9tZF9yg3prGEABet1o2S8LiB
         paGw==
X-Forwarded-Encrypted: i=1; AL+hErHOZwkXU6bJq+xJgEV1I/QqVKV5IMv2GkgOZj/1himsVAhzzF/8yjxDuPlmj1wtlMPzhhKeXpYShdqegavb@lists.linux.dev
X-Gm-Message-State: APuU4Z8NSNW+LA3n4aYeGbH3JsQVR/JJlGJu4T409IfqMMXadCuYCh/b
	c8S8an6aDKtLSt15PbcSHcIBwt3ImogAxlmqDVF/cPFaWjTnjW8iNKQT
X-Gm-Gg: AYBFou1wWdER/8B/iCvHzPwzQB+AIbxHq4oxUrkGsjR+v3mf3WoatN9oJp4VH3EZOiB
	KwMOlTq8KPrnF5wF7xkBUEkHGM7BJ8Ra/OB5qcBOis1kR3ZJShM1LcwtvtNG2glpR756VN/QlZW
	HiTLmK7ZB6FpTT2ap9agryCnhtkB7obLdKscWtmVk0GHudvIBM9AmuRYubzofUjiEjepgU8vwCX
	oYTs/FQeazTD1XqN8pwqBUcjqUNxafmeT2q3yw5VAJX8vQgLvJRJls7hxCOH+WAUVOgry4v04O8
	aSZQ6JPwIDTAxfdLNtkW0bPYk2OH4sqmPqQOmkQoAxw7lZ8xPcktd6Z6TTxgi3H6rDB6EACnFif
	aFbTIOY0BQg9jUOxPeFC8xTdFXtTDAt2aa6+F/QoHnWDJ76y24voUzIDEOu1IgoT0GAJa9P1Zbk
	EEv1HCNOIREWNSddObd3xaoODLscxSLJXVDA6NGTe9QjfusEfo5eeiKzjZGgjoHE4J4PYRHXVEc
	M68YI05J1akhrFC9Glhslc44689wXkAviAq5i/GLx4lNowRAOwmBqVVy+hF0cvViTv0rBwMTA58
	uDafebcrzpSDkNEm6cOz6wNkVlrQFBei3HZgkv97WcdCQgps/iVohV8Qe9KjUkemmc8GGne138G
	e8NNlJnw/w2qCNiEyhSfGFv/b7voGvHzZsf74YaFYpNm19DnBKMb7fb4yJ75b50OlW1CInuFjll
	1X0pfxi2LKx74xQnqjOfMv9XfrVmRAYHFP9slUtiB/Fr5RArQjgRUcQHaWwX6VwSudmNo1YEQnw
	hVf61osOnL59lwiVrnahB2LpnEiB49ItRTu+J1uR5kvXKcVZvYKiOlAxQ==
X-Received: by 2002:a05:6000:26cb:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-4982eb0b774mr396069f8f.26.1794246667071;
        Mon, 09 Nov 2026 09:51:07 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
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
Subject: [PATCH v2 01/11] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  9 Nov 2026 18:50:06 +0100
Message-ID: <20261109175016.42061-2-jernej.skrabec@gmail.com>
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

v4l2_m2m_ctx_release() releases the CAPTURE queue before the OUTPUT
queue. When userspace closes the file handle without STREAMOFF, the
CAPTURE buffers are already gone by the time the OUTPUT stop_streaming
calls the codec stop() callback, so the per-buffer H.264/HEVC MV-col
buffers are never freed. This is easily reproduced by killing a player
during H.264 or HEVC decoding. Each killed 1080p session leaks about
2.3 MiB.

Add a buf_cleanup codec op, called from the vb2 buf_cleanup of the
CAPTURE queue, and free the MV-col buffer there. stop() keeps using the
same helper.

Fixes: fec94f8c9954 ("media: cedrus: h264: Optimize mv col buffer allocation")
Fixes: 0ee952c2f484 ("media: cedrus: h265: Associate mv col buffers with buffer")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 +++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_video.c | 10 +++++++
 4 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c4b1217c14b6..54f867949fba 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -167,6 +167,7 @@ struct cedrus_dec_ops {
 	int (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
+	void (*buf_cleanup)(struct cedrus_ctx *ctx, struct cedrus_buffer *buf);
 	void (*trigger)(struct cedrus_ctx *ctx);
 	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
 				       struct v4l2_pix_format *pix_fmt);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index fc54d993b11f..892193c12b2f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -647,10 +647,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	return ret;
 }
 
+static void cedrus_h264_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h264.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h264.mv_col_buf_size,
+			       buf->codec.h264.mv_col_buf,
+			       buf->codec.h264.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h264.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -662,17 +675,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h264.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h264.mv_col_buf_size,
-				       buf->codec.h264.mv_col_buf,
-				       buf->codec.h264.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h264.mv_col_buf_size = 0;
-		}
+		cedrus_h264_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
@@ -710,5 +713,6 @@ struct cedrus_dec_ops cedrus_dec_ops_h264 = {
 	.setup		= cedrus_h264_setup,
 	.start		= cedrus_h264_start,
 	.stop		= cedrus_h264_stop,
+	.buf_cleanup	= cedrus_h264_buf_cleanup,
 	.trigger	= cedrus_h264_trigger,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..6c643862ab73 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -858,10 +858,23 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
 	return 0;
 }
 
+static void cedrus_h265_buf_cleanup(struct cedrus_ctx *ctx,
+				    struct cedrus_buffer *buf)
+{
+	if (buf->codec.h265.mv_col_buf_size > 0) {
+		dma_free_attrs(ctx->dev->dev,
+			       buf->codec.h265.mv_col_buf_size,
+			       buf->codec.h265.mv_col_buf,
+			       buf->codec.h265.mv_col_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+
+		buf->codec.h265.mv_col_buf_size = 0;
+	}
+}
+
 static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	struct cedrus_buffer *buf;
 	struct vb2_queue *vq;
 	unsigned int i;
 
@@ -873,17 +886,7 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 		if (!vb)
 			continue;
 
-		buf = vb2_to_cedrus_buffer(vb);
-
-		if (buf->codec.h265.mv_col_buf_size > 0) {
-			dma_free_attrs(dev->dev,
-				       buf->codec.h265.mv_col_buf_size,
-				       buf->codec.h265.mv_col_buf,
-				       buf->codec.h265.mv_col_buf_dma,
-				       DMA_ATTR_NO_KERNEL_MAPPING);
-
-			buf->codec.h265.mv_col_buf_size = 0;
-		}
+		cedrus_h265_buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
 	}
 
 	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
@@ -918,6 +921,7 @@ struct cedrus_dec_ops cedrus_dec_ops_h265 = {
 	.setup		= cedrus_h265_setup,
 	.start		= cedrus_h265_start,
 	.stop		= cedrus_h265_stop,
+	.buf_cleanup	= cedrus_h265_buf_cleanup,
 	.trigger	= cedrus_h265_trigger,
 	.extra_cap_size	= cedrus_h265_extra_cap_size,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec3490775..adc7f255d7cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -560,6 +560,15 @@ static void cedrus_stop_streaming(struct vb2_queue *vq)
 	cedrus_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
 }
 
+static void cedrus_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct cedrus_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
+	    ctx->current_codec && ctx->current_codec->buf_cleanup)
+		ctx->current_codec->buf_cleanup(ctx, vb2_to_cedrus_buffer(vb));
+}
+
 static void cedrus_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -579,6 +588,7 @@ static const struct vb2_ops cedrus_qops = {
 	.queue_setup		= cedrus_queue_setup,
 	.buf_prepare		= cedrus_buf_prepare,
 	.buf_queue		= cedrus_buf_queue,
+	.buf_cleanup		= cedrus_buf_cleanup,
 	.buf_out_validate	= cedrus_buf_out_validate,
 	.buf_request_complete	= cedrus_buf_request_complete,
 	.start_streaming	= cedrus_start_streaming,
-- 
2.43.0

