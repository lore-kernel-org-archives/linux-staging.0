Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E353A2
	for <linux-staging@lists.linux.dev>; Wed,  6 Jul 2022 18:29:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f2so17852543wrr.6
        for <linux-staging@lists.linux.dev>; Wed, 06 Jul 2022 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aRhpgcalr07YkEQC06e4quRgCbSsA86eLkAqCnDRLp8=;
        b=pcydag+pErwwrdcsmjf+nFIVxjSqKs3nSu05sEc+DitNQRoW43UAfrWUOvZR5eJbGU
         XiE5mJ2bYJ+uqPX+b6HKuNlkKSZ8SzLTaugHjQgkcOmwONArnOB0T8++e71Lti63s8Nt
         NMO95ub8vty+cf7GwftldTDIx+6zgB9/9LC92KBVy/UVMlYotWQBrlAbC70r15BU9oSM
         sYfr+n9/93qVCTRXS1I7tbqY2SaacHWmGwYnmm51IqDpuZHDCiw+8dFoekXyiinSQMES
         Lp1IEXFlwhXbJEHpKVbM1Y2LAYKKVuTxdP+C/lBxjgRZrDfnEat17Qzxq7G4Ghwl7FUn
         3sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRhpgcalr07YkEQC06e4quRgCbSsA86eLkAqCnDRLp8=;
        b=4xWDgG53ZkOIr8bRQcSfVrBHOBjOKaf6obSOot8fzN4LUilE/5oiIyAT88F5CderiU
         gImyHJRsFnE+L9jmsIgKiTdEau0+f+MkgkZFoXc2YR4NOWBsEVqR7BEc25LwvNOaTkF2
         Gltg3e6E54MOrtW2eiWQD/H5zzGHzw+t6I4LN2sH2Iy7Y1VYj5eG4V02Ng0knDTbWfTD
         Xs+i7v/FP+2L1sUE/xkfDudg8NdoyIFpXmqTvbyjUh/tKQSKRg5LLKXlTvuFx+9NkYfA
         OtPm+gzkaoX54mWJpmnSoNWMgANXQoY2t0UMnUq4xr0v9zSwRor8k5ztaFDi94ahgAjg
         dorQ==
X-Gm-Message-State: AJIora8ZZglUW4JCVvxiFMh0oqAe7RUCGuTOI0YtykNKbRFLh+tFVQTh
	5nowxTn1NSjqKhFSSUVg00E=
X-Google-Smtp-Source: AGRyM1vqDJph0zXaYU+mKDtrGOKYY+x7Ui4yKgelPc1/miuilxQ3TdUsAbj7Z1VEKJsMxiRYhuCZ9w==
X-Received: by 2002:adf:dd82:0:b0:21d:62e3:a51 with SMTP id x2-20020adfdd82000000b0021d62e30a51mr21961682wrl.324.1657132159236;
        Wed, 06 Jul 2022 11:29:19 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm5142406wru.28.2022.07.06.11.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:29:18 -0700 (PDT)
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
Subject: [PATCH v3 6/7] media: hantro: Store VP9 bit depth in context
Date: Wed,  6 Jul 2022 20:29:00 +0200
Message-Id: <20220706182901.78949-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220706182901.78949-1-jernej.skrabec@gmail.com>
References: <20220706182901.78949-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we have proper infrastructure for postprocessing 10-bit
formats, store VP9 bit depth in context.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 01d33dcb0467..afddf7ac0731 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -324,6 +324,24 @@ static int hantro_hevc_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int hantro_vp9_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct hantro_ctx *ctx;
+
+	ctx = container_of(ctrl->handler,
+			   struct hantro_ctx, ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_STATELESS_VP9_FRAME:
+		ctx->bit_depth = ctrl->p_new.p_vp9_frame->bit_depth;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
 	.try_ctrl = hantro_try_ctrl,
 };
@@ -336,6 +354,10 @@ static const struct v4l2_ctrl_ops hantro_hevc_ctrl_ops = {
 	.s_ctrl = hantro_hevc_s_ctrl,
 };
 
+static const struct v4l2_ctrl_ops hantro_vp9_ctrl_ops = {
+	.s_ctrl = hantro_vp9_s_ctrl,
+};
+
 #define HANTRO_JPEG_ACTIVE_MARKERS	(V4L2_JPEG_ACTIVE_MARKER_APP0 | \
 					 V4L2_JPEG_ACTIVE_MARKER_COM | \
 					 V4L2_JPEG_ACTIVE_MARKER_DQT | \
@@ -503,6 +525,7 @@ static const struct hantro_ctrl controls[] = {
 		.codec = HANTRO_VP9_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_VP9_FRAME,
+			.ops = &hantro_vp9_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_VP9_DECODER,
-- 
2.37.0

