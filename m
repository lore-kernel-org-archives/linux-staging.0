Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35F4C71
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 20:00:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id AEA9B1F438B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1648497619;
	bh=BQgi4WXn9GkaikKLBxnmXBJ9Op1ly9b7u96QvOVoYaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQy6Ul9u9ZNQiDPpimTjQGgDKJ4dMDUQ4QHsaH6Vtmdydoas4nbQmvrWD/vVrf/6p
	 Y8vXWtMlaovLs7s5bcR2TGA55jiDeiHt7oE5atDSNWmLCPtAvU9dAAE8oy0uGCbJAK
	 eORjbvoA3MGKEmj1cQ9EBllZ52/2Or5tpTLLIwClMzg2CrZ0CZV5FDkJJV2g+9oOBb
	 2YKnVer0ahF5asTI39s2dK0CAI756v9o04AvIxR2jUPP4FSJ1vxow6dUBx24PH/ZsI
	 6/j03Rhfs4mas3bS5A/U3P0UNrfJZYUhQEcG0bqtakc6I2n8i5/vuxc3a0b6kzqI/e
	 5Eb+8DiJGY0gQ==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 20/24] media: hantro: Enable HOLD_CAPTURE_BUF for H.264
Date: Mon, 28 Mar 2022 15:59:32 -0400
Message-Id: <20220328195936.82552-21-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328195936.82552-1-nicolas.dufresne@collabora.com>
References: <20220328195936.82552-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed to optimizing field decoding. Each field will be
decoded in the same capture buffer, so to make use of the queues
we need to be able to ask the driver to keep the capture buffer.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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

