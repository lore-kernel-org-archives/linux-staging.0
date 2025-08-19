Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A5234573E
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605825; cv=none; b=i9ItylHBRn6aGKaFAxvaVERb8MMe4JuD56tlUZ6dOOceklZ7JOYiYoE+N63RORso9PmsItRZDjL+HwOgbP6W1O2xzg/VVohUNlkUs8AsCJlcc5NOEGFg+6aR05P1eampBP9vG0P8VXrJi7qpdfij063L2e5RrTzWMLjV5xdBJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605825; c=relaxed/simple;
	bh=Aulklx+X+Ecd2UHuEmFTkzfiktgCXEuIjcoFVF2HmI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u161OiPXsgBQfszlcJzfNCrsBRIli9TZ6fUZBu4xg2WM6YdOG1rOlrwBieFY9/PtZ/7O7knmwQIeIi95QwRnlf/9Ttm3C4RWwgH1A5/8Zfp1WLE+QlI86/ri7zgZ7flxoJmrOtHo7oHSUkoJ3GkFgIvv0hXCFrbNQylybeET78Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdpdCGO9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdpdCGO9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb731ca8eso835381466b.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605822; x=1756210622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shQaKXu/njlANO2DVrc7DiO3su78TsC3dLkVV67F9Z4=;
        b=NdpdCGO9edjUpJAHuRd+VPuBDemkT5GDXP4ryjgmkhIzxFPV4nDGAWvRP12fe0qwz1
         CBK1A8IKnLDutl97iruY5E99m74x2u+jt4XgSrQr4ycKDK/ny/LTaWgdHkVVyg2Hi5Zj
         Et2Zje2dminJi3bjfKU9H6vBQ1KFpIvvWr7x+xdRZ1h8iOn9VgRpTK0bcJHd53aXkVwz
         R/MLP0AlxNKDKk1zwAswTpRBv7BkgHmyuEPsisPPTpRJVBeilLjiN7h9fmQSTOkJo+r4
         DNnokdqYVVGtLIpD7YyFazGglUmZAClUl2HqLdS0qHa2a2nKspKARn34TdlaIQhrV4kc
         mhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605822; x=1756210622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shQaKXu/njlANO2DVrc7DiO3su78TsC3dLkVV67F9Z4=;
        b=QNe8v3WGO6rBmPaGpRozA2MkbyNY77X1UD6Cz4G6vfybmlrm6H1sDaB4hZezWsPvot
         bpCnyWhXt3JEfxM7yks7l3kqX2pm3DD40utl9M6tYxrvU+7JQYR3WWFmPoQi2CzGTDWr
         KmqOtuJA2lfDr6L7isPum0d/hCdZcY7o4KSqKSC8aRDR19AEgDBujYI/UVakg6gHvX24
         VFFt1WeGYmumnkTEAcyuCBu/zQSdVONkDHzY+Mr2fhONf3qDhqAs9XD8wNURcyKxvXyN
         VWC1otqD6j8QurzWglNKVEH2cY/gVikEjnVn32Hgi/Z5I9M65R1Teu4gdODfflef1NHE
         X8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Xo8+6NnRy42JF7rsimCD4myP2OTT5+hQ7lxPO0/VW5zVG5DT6Z/5UDhq7PvzsUUeyawC/wej5jKgf8fy@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+ZOTP/oAigLUyszCBzSA9rOrLEIxfjk97oMtIKB/xQc5jXO+9
	ADYe6j92+5OHXSmF8jWZhUr8M0j5JhA3+yZMNXgXj2Dgi3+uBBaUPgkj
X-Gm-Gg: ASbGncuediOkRbQeOHSad8AGJ0/rzGRa8e/PIWgUUZyRB+dDvd61hRR9X2iwbsRpgEZ
	aXBucKQLRXAi9AOSuFqF/dkrDmx7DkcvK2qQMos1bElCTmbJaAQRpPZaaPmlADep9xWa9Ma+QVl
	WWDGuD7urcuQSxZnSVxfpobviiitUGAt7rOvhw3rNkUEReWdjEPUnOifFWIb0h+YHAm+Dvw/Y2p
	dLRq0NPMGwvsQ1ndjOdq7olZXHudBRwrZE4S3Y+M/5QzPa6NrsuhV+Zr+ZdYNyewor3Q1PvAcvx
	8pUNXqmAZD7xJOclBUDcXK4/29jigPa92DLvNQIT+PELemny9cdE9uQJy4R+44iCzD/6SoXP78P
	SFv/VSLbUVgtd2wO+IyUvi+TY
X-Google-Smtp-Source: AGHT+IGHQNk5sEHbSAt0c6aQxUV1mNpgXt8T3nzwF45TY8RuVQeGldiAsO8epN25S9EOAnkHPe3uew==
X-Received: by 2002:a17:907:72d4:b0:ad5:7bc4:84be with SMTP id a640c23a62f3a-afddd1eb116mr214034866b.52.1755605821572;
        Tue, 19 Aug 2025 05:17:01 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:00 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 11/19] staging: media: tegra-video: tegra20: add support for second output of VI
Date: Tue, 19 Aug 2025 15:16:23 +0300
Message-ID: <20250819121631.84280-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VI in Tegra20/Tegra30 has 2 VI outputs with different set of supported
formats. Convert output registers to macros for simpler work with both
outputs since apart formats their layout matches.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 80 ++++++++++++---------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 3e2d746638b6..54512d1ecf83 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -28,13 +28,19 @@
 #define TEGRA20_MIN_HEIGHT	32U
 #define TEGRA20_MAX_HEIGHT	8190U
 
+/* Tegra20/Tegra30 has 2 outputs in VI */
+enum {
+	OUT_1,
+	OUT_2,
+};
+
 /* --------------------------------------------------------------------------
  * Registers
  */
 
-#define TEGRA_VI_CONT_SYNCPT_OUT_1			0x0060
-#define       VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT	BIT(8)
-#define       VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT	0
+#define TEGRA_VI_CONT_SYNCPT_OUT(n)			(0x0060 + (n) * 4)
+#define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
+#define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
 
 #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
 #define       VI_INPUT_FIELD_DETECT			BIT(27)
@@ -46,6 +52,7 @@
 #define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_INPUT_FORMAT_SFT			2  /* bits [5:2] */
 #define       VI_INPUT_INPUT_FORMAT_YUV422		(0 << VI_INPUT_INPUT_FORMAT_SFT)
+#define       VI_INPUT_INPUT_FORMAT_BAYER		(2 << VI_INPUT_INPUT_FORMAT_SFT)
 #define       VI_INPUT_VIP_INPUT_ENABLE			BIT(1)
 
 #define TEGRA_VI_VI_CORE_CONTROL			0x008c
@@ -66,7 +73,7 @@
 #define       VI_VI_CORE_CONTROL_OUTPUT_TO_EPP_SFT	2
 #define       VI_VI_CORE_CONTROL_OUTPUT_TO_ISP_SFT	0
 
-#define TEGRA_VI_VI_FIRST_OUTPUT_CONTROL		0x0090
+#define TEGRA_VI_VI_OUTPUT_CONTROL(n)			(0x0090 + (n) * 4)
 #define       VI_OUTPUT_FORMAT_EXT			BIT(22)
 #define       VI_OUTPUT_V_DIRECTION			BIT(20)
 #define       VI_OUTPUT_H_DIRECTION			BIT(19)
@@ -80,6 +87,7 @@
 #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 
 #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
 #define       VI_VIP_H_ACTIVE_PERIOD_SFT		16 /* active pixels/line, must be even */
@@ -89,26 +97,26 @@
 #define       VI_VIP_V_ACTIVE_PERIOD_SFT		16 /* active lines */
 #define       VI_VIP_V_ACTIVE_START_SFT			0
 
-#define TEGRA_VI_VB0_START_ADDRESS_FIRST		0x00c4
-#define TEGRA_VI_VB0_BASE_ADDRESS_FIRST			0x00c8
+#define TEGRA_VI_VB0_START_ADDRESS(n)			(0x00c4 + (n) * 44)
+#define TEGRA_VI_VB0_BASE_ADDRESS(n)			(0x00c8 + (n) * 44)
 #define TEGRA_VI_VB0_START_ADDRESS_U			0x00cc
 #define TEGRA_VI_VB0_BASE_ADDRESS_U			0x00d0
 #define TEGRA_VI_VB0_START_ADDRESS_V			0x00d4
 #define TEGRA_VI_VB0_BASE_ADDRESS_V			0x00d8
 
-#define TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE		0x00e0
-#define       VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT		16
-#define       VI_FIRST_OUTPUT_FRAME_WIDTH_SFT		0
+#define TEGRA_VI_OUTPUT_FRAME_SIZE(n)			(0x00e0 + (n) * 24)
+#define       VI_OUTPUT_FRAME_HEIGHT_SFT		16
+#define       VI_OUTPUT_FRAME_WIDTH_SFT			0
 
-#define TEGRA_VI_VB0_COUNT_FIRST			0x00e4
+#define TEGRA_VI_VB0_COUNT(n)				(0x00e4 + (n) * 24)
 
-#define TEGRA_VI_VB0_SIZE_FIRST				0x00e8
-#define       VI_VB0_SIZE_FIRST_V_SFT			16
-#define       VI_VB0_SIZE_FIRST_H_SFT			0
+#define TEGRA_VI_VB0_SIZE(n)				(0x00e8 + (n) * 24)
+#define       VI_VB0_SIZE_V_SFT				16
+#define       VI_VB0_SIZE_H_SFT				0
 
-#define TEGRA_VI_VB0_BUFFER_STRIDE_FIRST		0x00ec
-#define       VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT	30
-#define       VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT	0
+#define TEGRA_VI_VB0_BUFFER_STRIDE(n)			(0x00ec + (n) * 24)
+#define       VI_VB0_BUFFER_STRIDE_CHROMA_SFT		30
+#define       VI_VB0_BUFFER_STRIDE_LUMA_SFT		0
 
 #define TEGRA_VI_H_LPF_CONTROL				0x0108
 #define       VI_H_LPF_CONTROL_CHROMA_SFT		16
@@ -136,7 +144,7 @@
 #define       VI_CAMERA_CONTROL_TEST_MODE		BIT(1)
 #define       VI_CAMERA_CONTROL_VIP_ENABLE		BIT(0)
 
-#define TEGRA_VI_VI_ENABLE				0x01a4
+#define TEGRA_VI_VI_ENABLE(n)				(0x01a4 + (n) * 4)
 #define       VI_VI_ENABLE_SW_FLOW_CONTROL_OUT1		BIT(1)
 #define       VI_VI_ENABLE_FIRST_OUTPUT_TO_MEM_DISABLE	BIT(0)
 
@@ -366,8 +374,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
-		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_FIRST,  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_FIRST, base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset);
 		break;
 	}
 }
@@ -455,6 +463,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
+	int output_channel = OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -472,33 +481,33 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
 	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
 
-	tegra20_vi_write(chan, TEGRA_VI_VI_FIRST_OUTPUT_CONTROL,
+	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
 			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
 			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
 			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
 			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
 
 	/* Set up frame size */
-	tegra20_vi_write(chan, TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE,
-			 height << VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT |
-			 width  << VI_FIRST_OUTPUT_FRAME_WIDTH_SFT);
+	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
+			 height << VI_OUTPUT_FRAME_HEIGHT_SFT |
+			 width  << VI_OUTPUT_FRAME_WIDTH_SFT);
 
 	/* First output memory enabled */
-	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
+	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
 
 	/* Set the number of frames in the buffer */
-	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT_FIRST, 1);
+	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT(output_channel), 1);
 
 	/* Set up buffer frame size */
-	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE_FIRST,
-			 height << VI_VB0_SIZE_FIRST_V_SFT |
-			 width  << VI_VB0_SIZE_FIRST_H_SFT);
+	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE(output_channel),
+			 height << VI_VB0_SIZE_V_SFT |
+			 width  << VI_VB0_SIZE_H_SFT);
 
-	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE_FIRST,
-			 stride_l << VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT |
-			 stride_c << VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT);
+	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE(output_channel),
+			 stride_l << VI_VB0_BUFFER_STRIDE_LUMA_SFT |
+			 stride_c << VI_VB0_BUFFER_STRIDE_CHROMA_SFT);
 
-	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
+	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
 }
 
 static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
@@ -607,6 +616,7 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
+	int output_channel = OUT_1;
 
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
@@ -637,10 +647,10 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 			 GENMASK(9, 2) << VI_DATA_INPUT_SFT);
 	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INVERSION, 0);
 
-	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT_1,
-			 VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT |
+	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
+			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
 			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
-			 << VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT);
+			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
 
 	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_STOP_CAPTURE);
 
-- 
2.48.1

