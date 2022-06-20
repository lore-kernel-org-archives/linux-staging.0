Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D853205;
	Mon, 20 Jun 2022 17:55:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k22so9252663wrd.6;
        Mon, 20 Jun 2022 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oDUyLN4Pryhtw9N4iCwOXaC7LwBCPSfNWeiXJOlMPkg=;
        b=j/IwIO3a0ts7j8gthEBmCMeJ6vuYBo7HD3mAfvcgjHRCoMpwlDgxlGwUcshfULkvl4
         ux3FYylaS1HAhyCbCRfcmlKK1iAcVIKdHj+yrmEOFmbCiXy6V4a+wtYGsPZNyzriN7gj
         qibFoseY20ti4Hsd7U+99+ibAKfJP5EBKJdU/FlP9ttzN48lcL6Bq6/z2ymORhORcBwJ
         BXN+XPG9XT/9ERCFxVBGFR0BZ0k4DrArLCAsL4vyu6pZqBPvD491gJMHWamNmvy2eHEg
         mgeSu4G8QcNhmdcgLErLyKtI1w09RHh+nQTOnlXS8hnZ04a5zgRLlkN+ELVwpZTw1k7V
         lzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oDUyLN4Pryhtw9N4iCwOXaC7LwBCPSfNWeiXJOlMPkg=;
        b=yhiwv8RHS/yYHdOLPv38PpOFCh5FXAWtPIWkOWMUD7yeW1nac+/DxbpL5rfw85NQKk
         L+EoyWn4Qx344e0+9zo3pRQFhupbzdNEe8s5LQmByof/TEhaPSfqact9uWNAhc7aL/nf
         ANV7GpDjg9zY+A0ywJddnlHqv9uZRBPsAaPYA9p2VPzq8hejax9cs4obrs7QxZwVWSuP
         6iy5Tg5Kzw3CuYTuEbm6bPO/ZTUBfsUg9NSyMeInEE9PjyM5R9HSE/1FDSLtt3B/nqvU
         L6vGk9Sp9lnwNYODDNAWpH/hnFabWWVcCZijHjpm6riIyg6kWNo/Xrsqn3Q+QjjqEpI9
         5yTQ==
X-Gm-Message-State: AJIora/D9KWFC195ApD5IKZFIjRmPKN4qqDYSbY7EVMc7al81+1aEPPJ
	zUxOAaDrwQz4tuL0PAZVAgk=
X-Google-Smtp-Source: AGRyM1vzYBSQFI6blw/ovMZUI5R79+0X2OmRbBajL6gKqGWCQJxqwYvaZKB0wzV66Sh9rKiSy4aM9w==
X-Received: by 2002:a5d:5c08:0:b0:219:e5de:72af with SMTP id cc8-20020a5d5c08000000b00219e5de72afmr23720384wrb.513.1655747733393;
        Mon, 20 Jun 2022 10:55:33 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 184-20020a1c02c1000000b0039db31f6372sm19620752wmc.2.2022.06.20.10.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:55:33 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	samuel@sholland.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/7] media: cedrus: Improve error messages for controls
Date: Mon, 20 Jun 2022 19:55:13 +0200
Message-Id: <20220620175517.648767-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620175517.648767-1-jernej.skrabec@gmail.com>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently error messages when control creation fails are very sparse.
Granted, user should never observe them. However, developer working on
codecs can. In such cases additional information like which control
creation failed and error number are very useful.

Expand error messages with additional info.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index b12219123a6b..99c87319d2b4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -242,7 +242,8 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 	v4l2_ctrl_handler_init(hdl, CEDRUS_CONTROLS_COUNT);
 	if (hdl->error) {
 		v4l2_err(&dev->v4l2_dev,
-			 "Failed to initialize control handler\n");
+			 "Failed to initialize control handler: %d\n",
+			 hdl->error);
 		return hdl->error;
 	}
 
@@ -257,7 +258,9 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 					    NULL);
 		if (hdl->error) {
 			v4l2_err(&dev->v4l2_dev,
-				 "Failed to create new custom control\n");
+				 "Failed to create %s control: %d\n",
+				 v4l2_ctrl_get_name(cedrus_controls[i].cfg.id),
+				 hdl->error);
 
 			v4l2_ctrl_handler_free(hdl);
 			kfree(ctx->ctrls);
-- 
2.36.1

