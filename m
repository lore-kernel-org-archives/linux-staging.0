Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638998;
	b=qpdTx4qLiktFx8wFPj2hXrP8/dQLggwjtR/hNnyQJyD1AYzZc6yE7r8ByJuw7izK2cVn
	 hoXiesAj9oNvNZ/BKKXin5iXinnVZywnJK3djW5VpM5YbDZsEYynBIUazSp+uvOJIi0X9
	 86NAnZgeho2eTsPZcEndg8gyyB1IpQgKLUgFiN1UB55W9BpekAoEn8AMxd73wlkX7Ywky
	 jeAqqHkqXPTZsMt6zwTouyq6ylONDE7660QBlMpB6maxTDvCyzhKpkwhEGxxL2uUYAfMj
	 8MzghMcSJUwssK6JhzWA2zz3eATfzjtudx+MykbF+ZGj4r9xoxZL6MuOQdRy7jRUaxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
	b=RQ4E2OPmG/sk0WKz9gZQxOpXJQtMhlWBkVkIeQcwL7+NbiOZgTURNpJYrkKr14Kvf6rV
	 GgUda8tfngrfQllCImKltS8XYJtBrlNg2wvM6hjZ78iHUrF4aIUwtsv5qHvHQIFWz5GP1
	 HN9e/9B0nCUeMqBSo1US5SsQ8PzT53rYteHY9dI4Z58nD7VHDNiElkaFeOyRgJ4DA6yhF
	 xfsiHf1u2HHQEIDAh5+oMaTxOn+fz56Zs7rOck+pPsBPb9tHX4bE+Zsgc6VPAl1SuWoa0
	 0XEA68r9B7s+l/oR7BBFOLQV1EKoAYTJU0yQQgYyhODlyAcLvxSgCuYbtoBjee7M8Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUI2mtfe;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD8D606C542
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD8D606C542
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUI2mtfe
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so34238555e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638996; x=1794243796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=iUI2mtfe5maCWhewBplCFR++kOxcjTwyrrua80x7Fq41c/9VEmZd2FcXj4M7vEzZKd
         EWD36SF1GwWj1Kfuf09rmPc7drYosTd699FEEevNjDYwo85Kft70zVZ9cvrAmbBT5To2
         Zc2zwfVTlB89EdIwzeFsHrweIcY/AZaceXve1Q9RoEkjmm/M3dRAFlGyY7Q7BY56ybEG
         WxDRLqR0uPF/jNIZukps/B/zZ1f/7YxtC475q/OzHfG/7IdtfJzUwgLzs2MrXWtbp73D
         7ec8c8rzweE+RMUV4E+mS6pead9I2gXy3qpF0NhprE58Ak+MzzCJ5DeKC3ZFr1TPuqkO
         gVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638996; x=1794243796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuM2x27esv9HJJ72txAMjkLX+sEnXEmUVgCjirEtUA8=;
        b=sJoT4Ijfp3sbTP6/X6n5qZcw4GsRINICC5AI1w8406am8baVpYv++EWQKGLF1JJeg/
         Nph0Gd90RTZ3Gnfpfb74zRXT7BGeWcp0tRklplLc++FDy6hCyp3TrC3KykRSbPaaAjhE
         M5s1KO36aR/Pooj7wGUIfPvJ/3qoBjUN/WGax/T7JeqaikCVRMqphOWvAadud4bkLJlm
         j4YpkIN0rN49IJD7S8FNJqSxXZd372kkhSZ90rsBKBlD4H8iNdVVRpvriSh1/O1tpm1V
         Zqajx2DjI/E9bctc3yvqeDJQPT8qjWR5Toml0oC6jN+URYMeAYd1bIiAppKxMpGrY9+L
         ehZw==
X-Forwarded-Encrypted: i=1; AKwUvBy+R4EHszNqtSfDJPfbXKWIwOl+f4dp66yjFyENEgfxCUVlxHa3xO+DgjjDPBTyVKPUxNhvsrJ/SOz6/BZn@lists.linux.dev
X-Gm-Message-State: AFq9FYJH4nEBxFYcoaLPJfGw3/JvSnKFfw8eBPlhtp4y6yn3TnAZ9R/1
	mSWdJvYYiKrSITB6A0aFYUv++FID+KGksI3Ub/YKPISrmh3zHG4J7btp
X-Gm-Gg: AYBFou0rdiSUzvdBY6mCHfa/NusG1lD0Kv+tYz4JQIQxgydjb45TUngb9iKnS9NXwlg
	G1+oVkSi/PSQ6Tw6AXyVCjk5vQl42E+X4RXyz6nY71t71lJhWrRRP9blpy/OOHjNnI+rIM9iKG1
	03bNpEEcW8LXWVHImQgbmo0I0YzMW2bAuJsOnxSNZyfFpzAwY0kTX3VzfmCNCFJKBhkkSSSH7yr
	S/wBNB85xdYNNezGNxvCcLTQ2m1jAYdVwcAOpM94964BmL2lYNOthrBes/Ud/TH4kiNdVuqwWic
	goYGiT2RMErsuW+NQKfw9u8eb3QeVZTw5/VmuK7p8NCxJFpyBD8m5DR8zDVWtD++djAWVjGUfDs
	xNFDzT5UtKlkLJZmiAPY2tpLDFemNjSPN/FQczb4a9nVrqfUBry7L7ra95MSattr1BcYQRxIFU+
	daULqc4gdOKlktr0euOIrc+eaPIVsB2CTIh1C9wUcxIfyhDBqM4MBQVqRIK+fXrbpJ26EpRSXn7
	YSKyhd/3D1k2LKGgdresM28z5iVBHby3iC0xl1PHIwAyZkDsQIqutojNkTMqVcynMTMZ6JQ67iT
	yIWCydx/27zCBwLa/t00RW1Mc1gRoEktUpmSkX8dGQ+kQc1Y5hgUrFbhsvidyI7BXgZ0N4UspLl
	6iJkTq/9r3acJiFABn5LSdBqtmMUwNQIs/xa0rb4za9iR67wevmDccoL0buqfvpmPO74VlTz50d
	dFRb9itSc58QTMv4JvQyukNL2gmr0pppday5Z5AmvcEBtLVBIV6+1NIKwShtBzIhvsInN6YVKuR
	BHZrvJSqwO1OaYiNGy2vh+1J0akFZkptlaxSuKO5NFfzZx/dA==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr260803075e9.17.1793638995840;
        Mon, 02 Nov 2026 09:03:15 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:14 -0800 (PST)
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
Subject: [PATCH 01/10] staging: media: cedrus: free MV-col buffers in buf_cleanup
Date: Mon,  2 Nov 2026 18:02:54 +0100
Message-ID: <20261102170303.1973892-2-jernej.skrabec@gmail.com>
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

