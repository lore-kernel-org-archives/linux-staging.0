Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D8B6AA6
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 20:25:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id x5so3695778edi.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c51uSHfgqT7k2tNIUrV7H5ZGpfbVeRCQDNTR1sStdEU=;
        b=L3+y2cfgiuRhq96BHGnNqyeRx/XMEpL25x9wgJBvclTYkGg6RYjrl24zyj7C6tiims
         P5UbFV4B7IDi9KpQII6HsfbAiGMzC22pGi4uiUki5jUZng/DyyJhIPdtkZiG8YZfB6rH
         ygK07BDIOlVhdv+t5ti+eE5UFeVOE1s/zJQw96954cxFqsApxnhfTkB1/ano10RP2qRX
         Cu13FWKRzCgMIr6RVAofZBx2hveQnNiItEnO0N80Ik/OnGdfj5DmMUtc/ByjIcONEAHC
         NzP4Aw9c+RuqXhWDmjmWWBrmFkUwVLKZg31F+pr1LgN2AyEId5MyFIRSlamBwHEzxYRP
         Mljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c51uSHfgqT7k2tNIUrV7H5ZGpfbVeRCQDNTR1sStdEU=;
        b=EXXZS74k+Wz2gGBb0ymZ+Y7YdhBpMuZwOsuJn7hMvttutSrqn/FYyI/P5UUbw6nt/D
         1AZg2XuGwGy3NG9EYE6LdFxpAT9g+KuNBZlAC4zOm0ac5qWya1f8SbB44snLsDaZP21c
         ulp+rbMOnw8ECXgwHCzViXLy1BRWVquIQc5AEM3GIMJUSJepuUTcNiYwcZTJJh1/WyFv
         S3kvagfWpn39LEkIkLKWHyrw1/8axltKzME97Tu+vpJdytbLwZI0KcOAXlGEOMXQWeSE
         gV8w1SnJ4DpVFMG+c3OMCfLHoFkof8LbnCVqGDkV7rNB1IEImu9CiroYPqoK7sZCaSUw
         317w==
X-Gm-Message-State: AJIora9VvIw+ax3dVMuRpPWHW4wq9cPD52heiHaGIP6TvqrefSjE8ZhU
	EuyWHeXkXtB19pjbJPul8uQ=
X-Google-Smtp-Source: AGRyM1vh9C1ul0iScKiaQcmQyapU/KGOT+AQ/VECIth2VmkKurQiB4c5R1Voce8qZyY8LUBvHM6tHg==
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id fe7-20020a056402390700b00431677664e7mr8718052edb.0.1655411122500;
        Thu, 16 Jun 2022 13:25:22 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b006fe8a4ec62fsm1186760ejw.4.2022.06.16.13.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:25:22 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/7] media: hantro: postproc: Fix buffer size calculation
Date: Thu, 16 Jun 2022 22:25:09 +0200
Message-Id: <20220616202513.351039-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616202513.351039-1-jernej.skrabec@gmail.com>
References: <20220616202513.351039-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When allocating aux buffers for postprocessing, it's assumed that base
buffer size is the same as that of output. Coincidentally, that's true
most of the time, but not always. 10-bit source also needs aux buffer
size which is appropriate for 10-bit native format, even if the output
format is 8-bit. Similarly, mv sizes and other extra buffer size also
depends on source width/height, not destination.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/hantro/hantro_postproc.c    | 24 +++++++++++++------
 drivers/staging/media/hantro/hantro_v4l2.c    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.h    |  2 ++
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index ab168c1c0d28..b77cc55e43ea 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -12,6 +12,7 @@
 #include "hantro_hw.h"
 #include "hantro_g1_regs.h"
 #include "hantro_g2_regs.h"
+#include "hantro_v4l2.h"
 
 #define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
 { \
@@ -174,18 +175,27 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
 	unsigned int num_buffers = cap_queue->num_buffers;
+	struct v4l2_pix_format_mplane pix_mp;
+	const struct hantro_fmt *fmt;
 	unsigned int i, buf_size;
 
-	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	/* this should always pick native format */
+	fmt = hantro_get_default_fmt(ctx, false);
+	if (!fmt)
+		return -EINVAL;
+	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
+			    ctx->src_fmt.height);
+
+	buf_size = pix_mp.plane_fmt[0].sizeimage;
 	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
-		buf_size += hantro_h264_mv_size(ctx->dst_fmt.width,
-						ctx->dst_fmt.height);
+		buf_size += hantro_h264_mv_size(pix_mp.width,
+						pix_mp.height);
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
-		buf_size += hantro_vp9_mv_size(ctx->dst_fmt.width,
-					       ctx->dst_fmt.height);
+		buf_size += hantro_vp9_mv_size(pix_mp.width,
+					       pix_mp.height);
 	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE)
-		buf_size += hantro_hevc_mv_size(ctx->dst_fmt.width,
-						ctx->dst_fmt.height);
+		buf_size += hantro_hevc_mv_size(pix_mp.width,
+						pix_mp.height);
 
 	for (i = 0; i < num_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 334f18a4120d..2c7a805289e7 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -118,7 +118,7 @@ hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 	return NULL;
 }
 
-static const struct hantro_fmt *
+const struct hantro_fmt *
 hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream)
 {
 	const struct hantro_fmt *formats;
diff --git a/drivers/staging/media/hantro/hantro_v4l2.h b/drivers/staging/media/hantro/hantro_v4l2.h
index b17e84c82582..64f6f57e9d7a 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.h
+++ b/drivers/staging/media/hantro/hantro_v4l2.h
@@ -23,5 +23,7 @@ extern const struct vb2_ops hantro_queue_ops;
 
 void hantro_reset_fmts(struct hantro_ctx *ctx);
 int hantro_get_format_depth(u32 fourcc);
+const struct hantro_fmt *
+hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream);
 
 #endif /* HANTRO_V4L2_H_ */
-- 
2.36.1

