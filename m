Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871C163D
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 12:58:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id DCF2E1F439A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1650977922;
	bh=OT93d1YFbCsPl7b/q8Q9Ng7KBwuAX7su/L0Pt2JnS6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cBZN0vuWa0CQYiFTtznCmJ69cnWWpBJjUsOTglusEeiqSVayUvm4THtei/qrnz+XU
	 sxKfjpwT+fa/HTO2lmpV7wL724s3r+9mMdahR1qJH2P8t1iXck7NuGbaxaJly5vKqm
	 +CnjtVkTT3iaegGldibqCE7Vq/khasZDDfEUwlJxfHfFV8bcR5uN90Z9I3HPpzsrwr
	 H5DMc5649WTvQ9vq9OrnHgzL20sr2Z3Y9i6F2AjFq/IVQ6dGlbdqjLCg5i3ua4vQp1
	 94j5HRwXA2ySzWD6Zqm1P5Cu2nEMfyBeoAfYWvwy7OQ8HM7PJJY/Mr1lI+iWwHPo40
	 nEC1lF3RULBxw==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nicolas@ndufresne.ca,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 24/24] media: hantro: Enable HOLD_CAPTURE_BUF for H.264
Date: Tue, 26 Apr 2022 08:57:50 -0400
Message-Id: <20220426125751.108293-25-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
References: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed to optimize field decoding. Each field will be
decoded into the same capture buffer. To be able to queue multiple
buffers, we need to be able to ask the driver to hold the capture
buffer.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 67148ba346f5..50d636678ff3 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -409,6 +409,30 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
 	}
 }
 
+static void
+hantro_update_requires_hold_capture_buf(struct hantro_ctx *ctx, u32 fourcc)
+{
+	struct vb2_queue *vq;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+			     V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_JPEG:
+	case V4L2_PIX_FMT_MPEG2_SLICE:
+	case V4L2_PIX_FMT_VP8_FRAME:
+	case V4L2_PIX_FMT_HEVC_SLICE:
+	case V4L2_PIX_FMT_VP9_FRAME:
+		vq->subsystem_flags &= ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
+		break;
+	case V4L2_PIX_FMT_H264_SLICE:
+		vq->subsystem_flags |= VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
+		break;
+	default:
+		break;
+	}
+}
+
 static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp)
 {
@@ -472,6 +496,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 	ctx->dst_fmt.quantization = pix_mp->quantization;
 
 	hantro_update_requires_request(ctx, pix_mp->pixelformat);
+	hantro_update_requires_hold_capture_buf(ctx, pix_mp->pixelformat);
 
 	vpu_debug(0, "OUTPUT codec mode: %d\n", ctx->vpu_src_fmt->codec_mode);
 	vpu_debug(0, "fmt - w: %d, h: %d\n",
-- 
2.34.1

