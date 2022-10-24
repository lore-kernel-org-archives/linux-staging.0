Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228586AD6;
	Mon, 24 Oct 2022 20:15:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id y14so7596359ejd.9;
        Mon, 24 Oct 2022 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aG8/ur0Br/iI3XrRIjCBua/JFahdxthZWhXGPmYrCVY=;
        b=b1VtBkfnMQzd5t4IFtX29bRFR2tFeeqSiyK+DgVMGnDMFkwI6Fdv3tQXaLqUfYRmBX
         LABuRSOpX3tq1jb12FjHU6AONUrmAIm6UtCJVjMth3JbjWKSa8lEGJFMsqhoLucJRxJ7
         1EQRVkRLurSwogDmO+oiR+aT3lFzKn3a4DnRIwKUet1oBYG6Fz4SbxU9i3VHYcZ06Uv1
         mJuSDGEYeBY+obEFffp+jSUTOioH8ymB9/SYto+FH+LiZl2eYtJHI9+gtE1oFz6Gg+Hc
         VX48riOkEnLyY1xyp2P1a+OZnxDJ+wZq8e6B6a3SiUZkzPuG8LBMUtruHPzNciDAdX1P
         Lt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG8/ur0Br/iI3XrRIjCBua/JFahdxthZWhXGPmYrCVY=;
        b=sjA/ZIWn4bc/QwBIfM3O7QD36vi2gWglRzqFG97G8sXDgkW1OEXMPVyz9SE8IO2Fng
         sciOB7sDll41DIFDinesNr22KbaZaiQ+GZM36vzNPedmlFj2FGvW+xf5hvk2pBnsN18s
         NdMnaLBUaq8TEI/fsWXSeaHUdIlhNfntLlIsBPMqDQalzaz4+nqhpRDiH1nx0FO0frNb
         vY3IS/tJ8Ehv4J184dF7SPJ1izWeUN4qt7ZykAap7jv3FHEPHmXJEFaCURzXT5Fs7L8S
         DeHXejCm99HFVvwzR4qoL7s+3NNKJBBfH5a7CNU17k8YeW2cMkLYc/dz2pwy2QMekQNy
         hkXQ==
X-Gm-Message-State: ACrzQf37F7zKMQjkZ5s0R1kbhHRKRvWy2XRFanrI13RUkQA7AA3G4Dpw
	np1ifLQFhfwcVjYMFp7HDec=
X-Google-Smtp-Source: AMsMyM65bNrzmT64/XilaVG1H03z+PxYZa+GqmEWO472GD+ya7NEER3wo36+wnZrO7ByhQJFAsbxyQ==
X-Received: by 2002:a17:907:7244:b0:78d:cedc:7a9e with SMTP id ds4-20020a170907724400b0078dcedc7a9emr28646077ejc.600.1666642540370;
        Mon, 24 Oct 2022 13:15:40 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:40 -0700 (PDT)
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
Subject: [PATCH 10/11] media: cedrus: Adjust buffer size based on control values
Date: Mon, 24 Oct 2022 22:15:14 +0200
Message-Id: <20221024201515.34129-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024201515.34129-1-jernej.skrabec@gmail.com>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com>
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
index 70b07d8bad2b..fbe3b2e7c1d4 100644
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
index f9f723ea3f79..53e65f74046b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -251,6 +251,10 @@ static int cedrus_try_fmt_vid_cap_p(struct cedrus_ctx *ctx,
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

