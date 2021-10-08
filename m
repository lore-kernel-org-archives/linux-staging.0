Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB352C85
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 10:06:11 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id s16so7839171pfk.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0tE+OjKJHdX0YaSq/SP0LPgcFSSGhc57aktXdnN08Jk=;
        b=gOYHix4WHmVCBUetpODWqRHCtKw2zkRnlOzILi/AukbRmbFzIF1A3ycyJH5Uic3j49
         /kAhOSbW2sTpnedQcMvZ5FWgr/YAuVFNZuMd12Z5tSVWB+vGT1a5SazFy1uhjMuCZP4h
         d37OVXxIsaoh1xvhKMJvG9b2iq4QG4qjX47Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0tE+OjKJHdX0YaSq/SP0LPgcFSSGhc57aktXdnN08Jk=;
        b=DcB9aep6B1B/v7q6yAcqRU7r+raNTYUQ85pfnX1TEbM56dkqqmATpk3A/pvS+50xer
         spteq2f4TJA1SbqDzuAy0voIylTGQmnsWOCfvZShFsMcJfkGfWHfJlhBFyWfwT1/ij2q
         UdxG38EwlVbwHqNlO1bXlc5FBdUSvwN6FVaJRxS0t6s1jPOpuCOh7VemgOZvLqVRAaYE
         PmPmsdON/wb0K/NEAJZ3fzafURmtmyva4qmuEOyE1P7BWtLCSwLZ1zBwOi0oSTWLu1ui
         yRCAK0SywXnK2BhcplL+2bWesoam7kDhCPFU+CYCSwYH6Vvl/mNjaCah5ryn41v/fh+4
         R28Q==
X-Gm-Message-State: AOAM531kskKrUE69mgP1dOtsmd98IBobr7BybdE3/O0PLi3zsjyRhklf
	yUpiWAX2QsV8EwNsLIvlMFWlCw==
X-Google-Smtp-Source: ABdhPJzc7HT14HLpHSLUpV1/gyAWAvzuj5fhMf9NUQpi8wdgeaB/B5vf3GAOwmoRaa36zy9hWqZPcA==
X-Received: by 2002:a63:d34f:: with SMTP id u15mr3879802pgi.200.1633687571528;
        Fri, 08 Oct 2021 03:06:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad8d:f936:2048:d735])
        by smtp.gmail.com with ESMTPSA id a7sm2082255pfn.150.2021.10.08.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 03:06:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: rkvdec: Support dynamic resolution changes
Date: Fri,  8 Oct 2021 18:04:23 +0800
Message-Id: <20211008100423.739462-3-wenst@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211008100423.739462-1-wenst@chromium.org>
References: <20211008100423.739462-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mem-to-mem stateless decoder API specifies support for dynamic
resolution changes. In particular, the decoder should accept format
changes on the OUTPUT queue even when buffers have been allocated,
as long as it is not streaming.

Relax restrictions for S_FMT as described in the previous paragraph,
and as long as the codec format remains the same. This aligns it with
the Hantro and Cedrus decoders. This change was mostly based on commit
ae02d49493b5 ("media: hantro: Fix s_fmt for dynamic resolution changes").

Since rkvdec_s_fmt() is now just a wrapper around the output/capture
variants without any additional shared functionality, drop the wrapper
and call the respective functions directly.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/rkvdec/rkvdec.c | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 7131156c1f2c..3f3f96488d74 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -280,31 +280,20 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int rkvdec_s_fmt(struct file *file, void *priv,
-			struct v4l2_format *f,
-			int (*try_fmt)(struct file *, void *,
-				       struct v4l2_format *))
+static int rkvdec_s_capture_fmt(struct file *file, void *priv,
+				struct v4l2_format *f)
 {
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
 	struct vb2_queue *vq;
+	int ret;
 
-	if (!try_fmt)
-		return -EINVAL;
-
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	/* Change not allowed if queue is busy */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	if (vb2_is_busy(vq))
 		return -EBUSY;
 
-	return try_fmt(file, priv, f);
-}
-
-static int rkvdec_s_capture_fmt(struct file *file, void *priv,
-				struct v4l2_format *f)
-{
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
-	int ret;
-
-	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_capture_fmt);
+	ret = rkvdec_try_capture_fmt(file, priv, f);
 	if (ret)
 		return ret;
 
@@ -319,9 +308,20 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct rkvdec_coded_fmt_desc *desc;
 	struct v4l2_format *cap_fmt;
-	struct vb2_queue *peer_vq;
+	struct vb2_queue *peer_vq, *vq;
 	int ret;
 
+	/*
+	 * In order to support dynamic resolution change, the decoder admits
+	 * a resolution change, as long as the pixelformat remains. Can't be
+	 * done if streaming.
+	 */
+	vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (vb2_is_streaming(vq) ||
+	    (vb2_is_busy(vq) &&
+	     f->fmt.pix_mp.pixelformat != ctx->coded_fmt.fmt.pix_mp.pixelformat))
+		return -EBUSY;
+
 	/*
 	 * Since format change on the OUTPUT queue will reset the CAPTURE
 	 * queue, we can't allow doing so when the CAPTURE queue has buffers
@@ -331,7 +331,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	if (vb2_is_busy(peer_vq))
 		return -EBUSY;
 
-	ret = rkvdec_s_fmt(file, priv, f, rkvdec_try_output_fmt);
+	ret = rkvdec_try_output_fmt(file, priv, f);
 	if (ret)
 		return ret;
 
-- 
2.33.0.882.g93a45727a2-goog

