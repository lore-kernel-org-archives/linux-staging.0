Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC1388E6F
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527391; cv=none; b=P6EH+6kiedwOr9JUWO5QwZlD4sn9Gjn8vSbJXORkWp0rsNr06nAA/0aGQX/PJ5q9+N1f84Iv2CTMGTqRu3v6dIZaknE6RjQ8CmlHraPFh4EoXVuAxmdufkTq3C6uG0P0gmLGBfDbQEBkbjxJm0UHKVTBM0vNnQLZLwi5vcCM8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527391; c=relaxed/simple;
	bh=Wf0dy01upHUUUcUAKy8dIbGY/d5SUS2MJZNikXi5lc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gG2dFdZ0qh+Cr1HHznNh+WDhRbIvv23pQ01LjbbDLrAMMlcLBD9S9FK+a+ZixMXhf99nwiq4mMzzEHc07BvxRcuOF6Xq4k/VPAqUqhW5w+s1N7uuY+GJYhsURNCWyfaY4GkC2d/jHo5ZK8uTXHbPxgBuzSn/IU3X9idd/5lMQdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAjDfZvz; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAjDfZvz"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-387090ae5b1so89223431fa.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527383; x=1773132183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6KZvaBGZ/GU736NZrNzu56KlpQD0HwXdD7kW+frTF8=;
        b=eAjDfZvz3LwPgrVadUy9v91ArBBuxoO4SsK8emXV+myRHnGJ9lC7i2ejAkwYxG1/FZ
         auV23Gpz1eWwKDh7pJHODQwPmFSd7JwXWx699VcuPNczeZsUczai0tnTPknfp1ISoCzA
         E1Dny0vbys9eEFCAvKTym0FjIfBDkVuX9RuWRZ69ADzLJkCKk69443DFGY/PoERDfA/o
         Vd2EpNVqxnhL8AjTKwwhVRieoNc0zxwiSHC2DjHjIp0WfNBCM5ZxRQIKEdwNKBTg/T4t
         fnl/mD/C7wXbonCt2flucq0YRrKiEhst21MuzlvWJV8A+FO/1hnIjkNRNQo9Z7ZIRzR3
         ukdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527383; x=1773132183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6KZvaBGZ/GU736NZrNzu56KlpQD0HwXdD7kW+frTF8=;
        b=OrXB8aybdSWxEQLnQ2aWfKgB9GAXRjS+OX9A4V2Yk0ZYfq5oM0HEt+9qdozeUe5hvS
         2kPfSANd31lHCRzYLGadN9pVmzyo/DpeMFOLbGK3Sgsx+X+oK76+GvGXtlPoBbtzw/A7
         pB3GxAKglNv0/QYOn2JgLtql3V03SOlRAoPQp6zihX3TdvX2H7J8iBW3Nhwjysu69cjo
         r1Dd+OyQyYuHojL7MMwvi+Mka3II9IBeWGCEDGifWvzAWZ7Wt/JQkEXj1dwKC9xRP1mz
         h7MYH5x40SINMgddq5c4mmqDM4hE+c+HSjbn2BQYC0sOFLCDd71YzAkukGLe87H8qeoJ
         Y4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0tsSlXlxzUQJ29PMeonANeeTn1Ixu/BLtwV8BzanWRMEg3KgOriYQrWNlT9U1xMV2A8WdzQ0EAQ+yQI+D@lists.linux.dev
X-Gm-Message-State: AOJu0YxLix+uPi0jSMGTuKWgNsNclMVIUFxxMjS8HzswG6jEoV/cqBln
	X1A5/XUKvPz5wgCGl+TPHHv2HOd4OUOUpE+ZiI4IP5pcBKF9gRQET9VK
X-Gm-Gg: ATEYQzzk7nyrn4iPdFuqR5GZN0QpgLrGq+8RgmMZGJEvY9cgW1HW3HluMqL2hanN0Qj
	fV2d6dY7ED2nMA57iYQRMsSxJyEgxYJS+MRmnyOTIWmOGZv24RwrDTyR6++/kl853HpRGgEhulc
	scbJlNHQY7a6WKZvTk2agVdxASuY7Z/tsNGzo2UekOnjXzWlPvr5oki+lyK0jDpcROlC36uxUt5
	G2RsE7CQpiOPwqri5hg42Vf8L9Z62BywVrl/Bq/LUE/ZVM3cC/lyPGmvlwjrHl9NQNZtz/NmJq2
	Zy/DKvoFH/17EhufzOlMKfGcFgvTRWmeEyCr5D8T6xjDGcfBHmifuwVl6xpAGlQrxeN8U+7xKPN
	GBAw1rJN8RkCaTUlN+kMpU2U6ctnJ8c19XEoungUnJotVfe8qiTGsNLTcEaHWLiGLYBlOnOLyMM
	pSm1un3PTXSKAWtRgRQMhkSzU=
X-Received: by 2002:a2e:94c4:0:b0:387:2df:f3ee with SMTP id 38308e7fff4ca-389ff34ee5amr91156871fa.33.1772527382459;
        Tue, 03 Mar 2026 00:43:02 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:43:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 09/15] staging: media: tegra-video: tegra20: add support for second output of VI
Date: Tue,  3 Mar 2026 10:42:32 +0200
Message-ID: <20260303084239.15007-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 83 ++++++++++++---------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b2e706fa727b..c8afc6f2adf2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -28,13 +28,19 @@
 #define TEGRA20_MIN_HEIGHT	32U
 #define TEGRA20_MAX_HEIGHT	8190U
 
+/* Tegra20/Tegra30 has 2 outputs in VI */
+enum tegra_vi_out {
+	TEGRA_VI_OUT_1 = 0,
+	TEGRA_VI_OUT_2 = 1,
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
@@ -80,6 +87,8 @@
 #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
+/* TEGRA_VI_OUT_2 supported formats */
+#define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
 
 #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
 #define       VI_VIP_H_ACTIVE_PERIOD_SFT		16 /* active pixels/line, must be even */
@@ -89,26 +98,26 @@
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
@@ -136,7 +145,7 @@
 #define       VI_CAMERA_CONTROL_TEST_MODE		BIT(1)
 #define       VI_CAMERA_CONTROL_VIP_ENABLE		BIT(0)
 
-#define TEGRA_VI_VI_ENABLE				0x01a4
+#define TEGRA_VI_VI_ENABLE(n)				(0x01a4 + (n) * 4)
 #define       VI_VI_ENABLE_SW_FLOW_CONTROL_OUT1		BIT(1)
 #define       VI_VI_ENABLE_FIRST_OUTPUT_TO_MEM_DISABLE	BIT(0)
 
@@ -366,8 +375,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
-		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_FIRST,  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_FIRST, base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
 		break;
 	}
 }
@@ -455,6 +464,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
+	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -472,33 +482,33 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
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
@@ -587,7 +597,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
-	.vi_max_channels = 1, /* parallel input (VIP) */
+	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
 };
@@ -607,6 +617,7 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
+	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
 
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
@@ -637,10 +648,10 @@ static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
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
2.51.0

