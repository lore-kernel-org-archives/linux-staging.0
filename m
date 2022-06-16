Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749A6AA6
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 20:25:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x62so3662934ede.10
        for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HUtwgF4GgsHpYDtVHC8Pb/yKV/u5JGnJVytpp+Tyji0=;
        b=VIBDDCUA7EDMjVpT7zkHkhn7oucpO9dZAr5RdMH8gLUJQNdX3s4Brv/8/b4gDkHChp
         trvTGuGn0WbWO5iyJ3yO2ZcLMyvit3ym4DojDUX4g+U05h36fR1Q3lv0bgzcMKZ0rE4g
         muKKz08J638DasHXxeksMC4PJNMCGDq+c1J420zvrZ3SZ2/6icHBpNB++uCf1/uGeiIv
         uaYDK9NrM5YldDGbYZR1mKiqexWykA/Jjo+lC8qK/wKX36/HlMmkduUXDE07ZgLQLXVP
         h/bd7fOU1a7kcJS5M8XiEk0FbE9I1n1kehh2GS2o/fj28Z3wZz31hY0oUuzd2Ht67ps+
         8L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HUtwgF4GgsHpYDtVHC8Pb/yKV/u5JGnJVytpp+Tyji0=;
        b=2DsFGibLNgzyRBolUvAqw6CMKy8XQyyIwUAvWO0HsM0EVvcWQlTIoUAcgdQfpJE9Tv
         0Kwu52GzRGZnSxrzZlkuo+VmXzDtu3++IMMdy1oAYCc3k2ZztH2dPaIgquC6HFxRp+mt
         BdOJ2i4Rr0S+uPrNBXp7/tUKCPTPboCjQgcPnZV3207KqO/epZBKKluhw3gnCH/MFWhQ
         rx8yqIy4bALWz7LjduVmmc9SFSLDkNgAwAMRQcUerZKfdjEsQfPdjsiRm0OWTFMWil36
         qkyRblKpNHQm1lRRwJzHg9J8KR3bsvUYe3zobKR3+WFie+lbXPHc5oMJRqy2dEutKyfa
         vVPg==
X-Gm-Message-State: AJIora+Dim9YHohdC/5vTcHlQsESHtGOPbEY0TZ4Af588FPlP17VTxoJ
	UXz3FK071t+pbzsZwUqvO3o=
X-Google-Smtp-Source: AGRyM1s+LCS6ApVWlV0wlYNA8FpbdeKqTi9OLHoLWn7sfH9jMC4sAuP2R7t34r/FaNjWdPfi107VfQ==
X-Received: by 2002:a05:6402:5114:b0:42f:b5f3:1f96 with SMTP id m20-20020a056402511400b0042fb5f31f96mr8758001edd.260.1655411125683;
        Thu, 16 Jun 2022 13:25:25 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b006fe8a4ec62fsm1186760ejw.4.2022.06.16.13.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:25:25 -0700 (PDT)
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
Subject: [PATCH v2 6/7] media: hantro: Store VP9 bit depth in context
Date: Thu, 16 Jun 2022 22:25:12 +0200
Message-Id: <20220616202513.351039-7-jernej.skrabec@gmail.com>
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

Now that we have proper infrastructure for postprocessing 10-bit
formats, store VP9 bit depth in context.

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
2.36.1

