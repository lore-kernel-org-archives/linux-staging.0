Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7922C9E
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 09:35:15 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so5987053pjp.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 01:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GMnNxOVPdXzMfPknulPEnJPfMLKNc3bQyvDsss2ILoA=;
        b=SQOfsqu/dTsrW4Rh30S050hhBuAno4qMY8keBxE7AeP2blOAkVtr8166QXlMCquZbL
         EXE7PCbtLHdRGuJlnaekl8QvBtSA+T2fhNfa3f7AIgIiaUnRst4YARLjvaLh3XXln5dz
         FXS+1C8FFj6VMVZlufqphj5b4ErQeSQ/QrmiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GMnNxOVPdXzMfPknulPEnJPfMLKNc3bQyvDsss2ILoA=;
        b=gQW0xbW1Z9dYhgIcglEpDm8USc89QkfUt7o9aYPaFLtuceniw4ysJyWK7vyraHXR0e
         SwVQCY0WgVO5qca7ienWdT6iHbhIHiwSahmLvUAkSG1aertcmh5VdtQeUhaEzTlSAXA1
         QIrJwJXkvNcUotLKNliXl71qFWesWIyVcKB9PoF+yZMHlD1RqVLukzjjm3fIa/hwTACM
         91xPX2NQ2K4b5yyHuQluEM7s41as8aqVoTJsKpDGAqipjHTgurWKxUUlNYAI2Hx7Jwa1
         aq146HOmjjkCRSjAVfYSQC6IQajGxRxUL3Ro4RA5XnIGTVVXDAfL1XteKBZ0OgxN5e8g
         eq6g==
X-Gm-Message-State: AOAM5317GJ8H9tSGo2+ArzhSNXnWaYx4paF7q2UK4EhqONi5cC9u27ik
	BcwJSH5+gU3MZfxspkJ6GmCFXw==
X-Google-Smtp-Source: ABdhPJz2DHgRtXL8o0aUKFZg+E1A4xv2/O6qvFArtKHRvQeL73J/2Bshk583jXCoFWRB9NYatEWTcw==
X-Received: by 2002:a17:902:9a8b:b0:149:be04:40ab with SMTP id w11-20020a1709029a8b00b00149be0440abmr21318112plp.159.1641548114894;
        Fri, 07 Jan 2022 01:35:14 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8f6b:ee:64d8:ae81])
        by smtp.gmail.com with ESMTPSA id j17sm5269192pfu.77.2022.01.07.01.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:35:14 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 4/8] media: hantro: jpeg: Add JFIF APP0 segment to JPEG encoder output
Date: Fri,  7 Jan 2022 17:34:51 +0800
Message-Id: <20220107093455.73766-5-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220107093455.73766-1-wenst@chromium.org>
References: <20220107093455.73766-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the V4L2_PIX_FMT_JPEG format doesn't specify any requirements for
the APP0 or APP1 segments, it would be nice if the output is JFIF
compliant. While some programs can read JPEG streams that aren't, some
guess work is involved.

Add the standard JFIF APP0 segment to the JPEG header, so that the JPEG
encoder output is JFIF compliant.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_jpeg.c | 21 +++++++++++++--------
 drivers/staging/media/hantro/hantro_jpeg.h |  2 +-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
index df62fbdff7c9..7d4018bd6876 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -12,15 +12,15 @@
 #include "hantro_jpeg.h"
 #include "hantro.h"
 
-#define LUMA_QUANT_OFF		7
-#define CHROMA_QUANT_OFF	72
-#define HEIGHT_OFF		141
-#define WIDTH_OFF		143
+#define LUMA_QUANT_OFF		25
+#define CHROMA_QUANT_OFF	90
+#define HEIGHT_OFF		159
+#define WIDTH_OFF		161
 
-#define HUFF_LUMA_DC_OFF	160
-#define HUFF_LUMA_AC_OFF	193
-#define HUFF_CHROMA_DC_OFF	376
-#define HUFF_CHROMA_AC_OFF	409
+#define HUFF_LUMA_DC_OFF	178
+#define HUFF_LUMA_AC_OFF	211
+#define HUFF_CHROMA_DC_OFF	394
+#define HUFF_CHROMA_AC_OFF	427
 
 /* Default tables from JPEG ITU-T.81
  * (ISO/IEC 10918-1) Annex K, tables K.1 and K.2
@@ -144,6 +144,11 @@ static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
 	/* SOI */
 	0xff, 0xd8,
 
+	/* JFIF-APP0 */
+	0xff, 0xe0, 0x00, 0x10, 0x4a, 0x46, 0x49, 0x46,
+	0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01,
+	0x00, 0x00,
+
 	/* DQT */
 	0xff, 0xdb, 0x00, 0x84,
 
diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/staging/media/hantro/hantro_jpeg.h
index 035ab25b803f..f33c492134e4 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.h
+++ b/drivers/staging/media/hantro/hantro_jpeg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 
-#define JPEG_HEADER_SIZE	601
+#define JPEG_HEADER_SIZE	619
 #define JPEG_QUANT_SIZE		64
 
 struct hantro_jpeg_ctx {
-- 
2.34.1.575.g55b058a8bb-goog

