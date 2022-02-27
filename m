Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0248DB;
	Sun, 27 Feb 2022 14:50:35 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id d10so20015674eje.10;
        Sun, 27 Feb 2022 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s8aw+CVJhbPdtKJ/NAqmQwDMpbWRqHJhFsfgMUPvA3s=;
        b=ZBLgtAq/fKqU6MUfgFta33PAUJZCPtqDXaxgjx//ZMHxknKd49GqYoSCksucKePkDr
         mfK0U/GB9BFvAXkttisbzMW0HcftXUglKgRGms55jgQXt39QwaTQRwjTyeh7BsvM1miq
         q/fSUttom0AQfj2XntgWtSF74LeWeVpkSG5ARpPt670rOhFKNyixOnMrr75DGdE3/Fbh
         PdBMRxkJFmWx/NU/jdZi2nG4RBpVVN9z1vD00qhl2b1TNIw5xo8yEuJfb/NbUx2hiV4X
         dmiwaYZM7RDY9mhhEembjTyF2yOc9lYDhM4XrhX9Qh0KbPn6hD5X1it9GfRw814b6ctU
         E0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s8aw+CVJhbPdtKJ/NAqmQwDMpbWRqHJhFsfgMUPvA3s=;
        b=7YmVt7xVY3EeVEORDlxqFh8NZDEjNEI7yTT2KqK2sfQ7DPwgv8cSG1BYRTWMBku2tz
         KXbguC8mKLWrateftkpzndwP6zAAqFAkdOqDB8v/Vsr43fvWuuv6vivDi0nerUR9R0r3
         QzlfGWzHatBFoS+lt1npM+dqvAcr3z8YqFdWQTCocL5LMlPZovszuxmRxggmrkj/C94s
         Bq+3iXlqYHkXroNyXLAd+BthPu3eOjKnr/SSUv+mwdCVYlyFRkG+ldQSAcW5p0VKac2V
         DyHp01F3Ug9JDT8t4KBWdnujk0vHvxe+lZrUsPbfAUeSue5X9WaA6I7hA5m8h1W1Vcl7
         Q6zw==
X-Gm-Message-State: AOAM531h/emiXWQ6EkcgETg7//HvV+jeIfaP35ZC0Xewx9aGpoGHxVG0
	NkbGOrpqRrs6Lxvpbu/8Cz4=
X-Google-Smtp-Source: ABdhPJwJj07ONhhuMWXyHUXJvedtR6OfuCrdqZCSxd+tPU4hIGiprZ+jf5YCICbZwsJDHDbZaU8NcA==
X-Received: by 2002:a17:906:30d1:b0:6cf:c116:c9d3 with SMTP id b17-20020a17090630d100b006cfc116c9d3mr11689773ejb.245.1645973433800;
        Sun, 27 Feb 2022 06:50:33 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3501887ejj.142.2022.02.27.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:50:33 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [RFC PATCH 4/8] media: hantro: postproc: Fix buffer size calculation
Date: Sun, 27 Feb 2022 15:49:22 +0100
Message-Id: <20220227144926.3006585-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
References: <20220227144926.3006585-1-jernej.skrabec@gmail.com>
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

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/hantro/hantro_postproc.c    | 24 +++++++++++++------
 drivers/staging/media/hantro/hantro_v4l2.c    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.h    |  2 ++
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 248abe5423f0..1a76628d5754 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -12,6 +12,7 @@
 #include "hantro_hw.h"
 #include "hantro_g1_regs.h"
 #include "hantro_g2_regs.h"
+#include "hantro_v4l2.h"
 
 #define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
 { \
@@ -137,18 +138,27 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
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
index 1214fa2f64ae..69d2a108e1e6 100644
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
index f4a5905ed518..cc9a645be886 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.h
+++ b/drivers/staging/media/hantro/hantro_v4l2.h
@@ -23,5 +23,7 @@ extern const struct vb2_ops hantro_queue_ops;
 
 void hantro_reset_fmts(struct hantro_ctx *ctx);
 int hantro_get_formath_depth(u32 fourcc);
+const struct hantro_fmt *
+hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream);
 
 #endif /* HANTRO_V4L2_H_ */
-- 
2.35.1

