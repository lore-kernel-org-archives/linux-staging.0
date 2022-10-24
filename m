Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C5E6AD4;
	Mon, 24 Oct 2022 20:15:38 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id k2so7689875ejr.2;
        Mon, 24 Oct 2022 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYPY8eOn0zkxqUP4mUno/SYzJ1DIlxFXrIT859K9TgU=;
        b=EJa3gJX9kpMHCgLySDmPpfU47pQabWL6PyiJcpU4NaqTOR7QqHeiCspctIO6x82Yl4
         N87S3YjLt3Z10rirNDAv7RISUFTpqlQN1+amxqjyzKrwG3OB26uEzso5FhIZMkkz73yG
         iXLo/0lKQ/Of/I6RilPU5vunfpHg3CweixhF9xKG+lUGyQ5UWrpI0LwxoIq1w93XipTd
         CyfotY3hUJHustjs43cbxZ+9lgOTBErByMtqy20tYIA+VntaDriOGDAc74ChF0qK0nrl
         Ch/swzSdOWk1udjpQQnJg+L5yd6g1xE7J0c4xWI56R0enWi31p6PdCvwmne9n1v+PwD4
         LhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYPY8eOn0zkxqUP4mUno/SYzJ1DIlxFXrIT859K9TgU=;
        b=rkiwxbpHW2ra1CWcHI/E0fekqDkThjnPA/qn4jHIDsuas5caRZNl1/sFfdC7zdbVp4
         2JTmUNZvjElKwACus2SPfax7Y2gCjI46rjv5XJHtTuoCULhJ61ezPE0q2E1Jsdfe+o1F
         fJN34s1VaSaLHqlpN0zl33ofiBJbQTJ2VWNwVcumaQQMgOjNOD7R24ASsg0ga9s6N+wd
         pFXKY2M41fWFBHqUKX1OfM69I12yWoXlcYMLxZT5rVWmZJC6kFtZ2L4vkYpJAqdAfD0e
         AU54DjB1LGsLGv24bLAqllhtTC6wChYK3q6MeaGqZA0JSSkCjzuxNkZIEw2xPYB9YnQ+
         MUog==
X-Gm-Message-State: ACrzQf1kDLAduJR8dXV6wtplcHrWF3FXQCPfcRHbGpvdmof9lhCe8KBe
	qI3++v80YXn4PQQcnZ7J0UA=
X-Google-Smtp-Source: AMsMyM4PvZf0jAyv0mttuEvx1QNQZNnkovUvS2t7IMk9if/3+tHnh6GVwn7xGI2X3dNHMUCCF/wmJQ==
X-Received: by 2002:a17:907:2712:b0:78d:a223:729b with SMTP id w18-20020a170907271200b0078da223729bmr29546597ejk.443.1666642537061;
        Mon, 24 Oct 2022 13:15:37 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:36 -0700 (PDT)
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
Subject: [PATCH 07/11] media: cedrus: Remove cedrus_codec enum
Date: Mon, 24 Oct 2022 22:15:11 +0200
Message-Id: <20221024201515.34129-8-jernej.skrabec@gmail.com>
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

Last user of cedrus_codec enum is cedrus_engine_enable() but this
argument is completely redundant. Same information can be obtained via
source pixel format. Let's remove this argument and enum.

No functional changes intended.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h       |  8 --------
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c  |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 12 ++++++------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h    |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c   |  2 +-
 7 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 0b082b1fae22..5904294f3108 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -35,14 +35,6 @@
 #define CEDRUS_CAPABILITY_VP8_DEC	BIT(4)
 #define CEDRUS_CAPABILITY_H265_10_DEC	BIT(5)
 
-enum cedrus_codec {
-	CEDRUS_CODEC_MPEG2,
-	CEDRUS_CODEC_H264,
-	CEDRUS_CODEC_H265,
-	CEDRUS_CODEC_VP8,
-	CEDRUS_CODEC_LAST,
-};
-
 enum cedrus_irq_status {
 	CEDRUS_IRQ_NONE,
 	CEDRUS_IRQ_ERROR,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index c92dec21c1ac..dfb401df138a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -518,7 +518,7 @@ static int cedrus_h264_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct cedrus_dev *dev = ctx->dev;
 	int ret;
 
-	cedrus_engine_enable(ctx, CEDRUS_CODEC_H264);
+	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_SDROT_CTRL, 0);
 	cedrus_write(dev, VE_H264_EXTRA_BUFFER1,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 7a438cd22c34..5d3da50ce46a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -471,7 +471,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 
 	/* Activate H265 engine. */
-	cedrus_engine_enable(ctx, CEDRUS_CODEC_H265);
+	cedrus_engine_enable(ctx);
 
 	/* Source offset and length in bits. */
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index c3387cd1e80f..fa86a658fdc6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -31,7 +31,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec)
+int cedrus_engine_enable(struct cedrus_ctx *ctx)
 {
 	u32 reg = 0;
 
@@ -42,18 +42,18 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec)
 	reg |= VE_MODE_REC_WR_MODE_2MB;
 	reg |= VE_MODE_DDR_MODE_BW_128;
 
-	switch (codec) {
-	case CEDRUS_CODEC_MPEG2:
+	switch (ctx->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_MPEG2_SLICE:
 		reg |= VE_MODE_DEC_MPEG;
 		break;
 
 	/* H.264 and VP8 both use the same decoding mode bit. */
-	case CEDRUS_CODEC_H264:
-	case CEDRUS_CODEC_VP8:
+	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_VP8_FRAME:
 		reg |= VE_MODE_DEC_H264;
 		break;
 
-	case CEDRUS_CODEC_H265:
+	case V4L2_PIX_FMT_HEVC_SLICE:
 		reg |= VE_MODE_DEC_H265;
 		break;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
index 7c92f00e36da..6f1e701b1ea8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
@@ -16,7 +16,7 @@
 #ifndef _CEDRUS_HW_H_
 #define _CEDRUS_HW_H_
 
-int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec);
+int cedrus_engine_enable(struct cedrus_ctx *ctx);
 void cedrus_engine_disable(struct cedrus_dev *dev);
 
 void cedrus_dst_format_set(struct cedrus_dev *dev,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index c1128d2cd555..10e98f08aafc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -66,7 +66,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	quantisation = run->mpeg2.quantisation;
 
 	/* Activate MPEG engine. */
-	cedrus_engine_enable(ctx, CEDRUS_CODEC_MPEG2);
+	cedrus_engine_enable(ctx);
 
 	/* Set intra quantisation matrix. */
 	matrix = quantisation->intra_quantiser_matrix;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index f7714baae37d..969677a3bbf9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -662,7 +662,7 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	int header_size;
 	u32 reg;
 
-	cedrus_engine_enable(ctx, CEDRUS_CODEC_VP8);
+	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
-- 
2.38.1

