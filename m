Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1231448DA;
	Sun, 27 Feb 2022 14:50:37 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bg10so20082339ejb.4;
        Sun, 27 Feb 2022 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4pmLOZiHwkHk74rBhVutCXZ7DM+WmiqJLeo0YFOJ70=;
        b=FXv4REFbBkfc0m5qyfEujO0JGMnojRG5hR4dsvRLsEJ75GA57elwyolO200jUPuS3X
         +495TTzbW3fGbTIOJzY3U5eB5rtPwRfeOQtDykJrzjgIDBUgB4Z6Yw6a4hXd7GthWnVa
         C9iH7oo9SoPsvNhSMNyNuZJe8cypIDbbNepqYxpRrKnDu5MfAZibZZprlc/H281eDHTa
         9v2DbSDvhJpZQrHnHWrw/r9PGJEDF0fq8+6IrTNNuJp7VYapzL5IiIgYGUGcpgyGops6
         3eSgUoMqzBSuna7WlR2TkDB5tFMfUOhazQ6AQPWEl/gp6D4xdSsqyUMjlAvLF+Nm/hPF
         0M2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4pmLOZiHwkHk74rBhVutCXZ7DM+WmiqJLeo0YFOJ70=;
        b=feLTmUrw+7YNvrl468ESQ2ou598wuaBuT7lcTi9esq16d+Tnh/0q82DyUp+jntXtL9
         tRnrksmN9kRJukFyRpU/YJNcOPUnJtw9IUH4l3dq8CP5Glw5HPsD5OaQfsEdM4t2ikgH
         ETfxo9t1rxCYvtPaPpgBIISxXBlBQMyYgDNYK42xArYVEvXQHXhohKRRfP0yqlskxlgR
         +r0e965dPFyl3nynaAJCC1F4icSKv9rk4EOgFRbio83Vo8YoCY0LUAwzZlqF0HGTpNOo
         DKmwb9Kxqa9IehlaVr58d8g8OQXoIKFSMT9h+Csp//mxGSfLazA/2yEVu1K+4TYTU7BD
         mNmA==
X-Gm-Message-State: AOAM533vkU8KA6z/EEbM9QGSqCd31hYYBCRAbkUc6HpWehIta0j/v9EZ
	piTOoCHMuPhTz1b6RQJ7pTU=
X-Google-Smtp-Source: ABdhPJz7b0SKhTXBjs0rS08oJaEy68HRnT3gkOVNb9lfTI0Os0GoXnzvKwvmvEfx3CIQyLG6wudkcQ==
X-Received: by 2002:a17:906:fb8a:b0:6b5:d269:bb48 with SMTP id lr10-20020a170906fb8a00b006b5d269bb48mr12677338ejb.91.1645973436442;
        Sun, 27 Feb 2022 06:50:36 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3501887ejj.142.2022.02.27.06.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:50:36 -0800 (PST)
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
Subject: [RFC PATCH 6/8] media: hantro: Store VP9 bit depth in context
Date: Sun, 27 Feb 2022 15:49:24 +0100
Message-Id: <20220227144926.3006585-7-jernej.skrabec@gmail.com>
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

Now that we have proper infrastructure for postprocessing 10-bit
formats, store VP9 bit depth in context.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 6a51f39dde56..305090365e74 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -320,6 +320,24 @@ static int hantro_hevc_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -332,6 +350,10 @@ static const struct v4l2_ctrl_ops hantro_hevc_ctrl_ops = {
 	.s_ctrl = hantro_hevc_s_ctrl,
 };
 
+static const struct v4l2_ctrl_ops hantro_vp9_ctrl_ops = {
+	.s_ctrl = hantro_vp9_s_ctrl,
+};
+
 static const struct hantro_ctrl controls[] = {
 	{
 		.codec = HANTRO_JPEG_ENCODER,
@@ -478,6 +500,7 @@ static const struct hantro_ctrl controls[] = {
 		.codec = HANTRO_VP9_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_VP9_FRAME,
+			.ops = &hantro_vp9_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_VP9_DECODER,
-- 
2.35.1

