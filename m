Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5AC24F26;
	Wed,  2 Nov 2022 18:08:30 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id a5so27694331edb.11;
        Wed, 02 Nov 2022 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTX/CJSb7MB7yBzrjB/XPnpPEfJPqcJy2sRni4DNHhc=;
        b=BWwH0PLp6JQ9eYWdTML13I1KDHGFTpJL2HjwEIHw81SznXWlFHTHSGWOlc7rSeX503
         9wqgaJhi0gATwz9JUOCOVIlEvlOcAAxSSw4jpkKHc1XQj8MYdzptxvQQa10K74lJnjKO
         jYsqyFNonzO42fSV0aDTHyZcLt48Xwneh3+krvC2SQV75tXrTQ6zEY8ieSrftyVNXarC
         FxZCPMocPoPCtGFhYjDdZjDakeFDyxbJUOA5ueFmLMmXM7e5+tsZ8JllrRhSr7gjS0Tj
         QXKdq4b+3GH/aCvfMgDMokftvmjIQP3LAxTJP355QlPNg/lpS8lip99Qg0Ha4m7/3OA1
         daRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTX/CJSb7MB7yBzrjB/XPnpPEfJPqcJy2sRni4DNHhc=;
        b=CE83avwifKJXq0YI4idn9yIXBkgbEtQrP0ke22x2A0LMtIIJjCCKtN3QESGokP9TQM
         MBVjP2MJrQp/2s/rE4RO9Yrcx9QceFMCWR8NncLkGcAXMmOZb5N/s0+/5V+74dhocutQ
         UHePFuNA99JOvGCvPERUWHiynnBTRipKsmT359gYf4dhZCwAioaZuCrqNCwrhUmuanSI
         sPPH98Bbe6qwB9dROAzelb1JMr0CkRHByXeW5yfHKjjHcM/BmpveiI8SjN2E4uRaTVA/
         OFm33Tx3OMW/qhNnbbC37Vi9xzYHNJKjn9RKoVJnbOrwwKBb8N7XqiYDsQGFS+H0cgYS
         7+JA==
X-Gm-Message-State: ACrzQf1S08iIl9kxKxh/OI3i5anVMSm9Z/IwEOu/fu4WderiPT4GzHt1
	W1cnSbPdoJb+m95a3TlsWfM=
X-Google-Smtp-Source: AMsMyM7IKKboWbODn0dEZMDDWaIh2XhF9lJrzZnIHY8gQG+UF2lAOeAb//oR918UqPONo5aKDRZFjg==
X-Received: by 2002:a05:6402:528a:b0:454:8613:6560 with SMTP id en10-20020a056402528a00b0045486136560mr26656883edb.252.1667412508810;
        Wed, 02 Nov 2022 11:08:28 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gy8-20020a170906f24800b007317f017e64sm5677460ejb.134.2022.11.02.11.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:08:28 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 10/11] media: cedrus: Adjust buffer size based on control values
Date: Wed,  2 Nov 2022 19:08:09 +0100
Message-Id: <20221102180810.267252-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102180810.267252-1-jernej.skrabec@gmail.com>
References: <20221102180810.267252-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases decoding engine needs extra space in capture buffers. This
is the case for decoding 10-bit HEVC frames into 8-bit capture format.
This commit only adds infrastructure for such cases.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c       | 14 ++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h       |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c |  4 ++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6a2c08928613..c36999e47591 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -68,8 +68,22 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int cedrus_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct cedrus_ctx *ctx = container_of(ctrl->handler,
+					      struct cedrus_ctx, hdl);
+	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+					       V4L2_BUF_TYPE_VIDEO_CAPTURE);
+
+	if (!vb2_is_busy(vq) && !vb2_is_streaming(vq))
+		cedrus_reset_cap_format(ctx);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops cedrus_ctrl_ops = {
 	.try_ctrl = cedrus_try_ctrl,
+	.s_ctrl = cedrus_s_ctrl,
 };
 
 static const struct cedrus_control cedrus_controls[] = {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 5904294f3108..774fe8048ce3 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -162,6 +162,8 @@ struct cedrus_dec_ops {
 	int (*start)(struct cedrus_ctx *ctx);
 	void (*stop)(struct cedrus_ctx *ctx);
 	void (*trigger)(struct cedrus_ctx *ctx);
+	unsigned int (*extra_cap_size)(struct cedrus_ctx *ctx,
+				       struct v4l2_pix_format *pix_fmt);
 };
 
 struct cedrus_variant {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index dec5d3ae4871..dc67940f1ade 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -250,6 +250,10 @@ static int cedrus_try_fmt_vid_cap_p(struct cedrus_ctx *ctx,
 	pix_fmt->height = ctx->src_fmt.height;
 	cedrus_prepare_format(pix_fmt);
 
+	if (ctx->current_codec->extra_cap_size)
+		pix_fmt->sizeimage +=
+			ctx->current_codec->extra_cap_size(ctx, pix_fmt);
+
 	return 0;
 }
 
-- 
2.38.1

