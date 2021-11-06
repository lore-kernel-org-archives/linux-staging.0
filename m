Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB50C2C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 18:38:32 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id b203so11040346iof.10
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 11:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rgiz15qYX3oEufyKXbQCuXrDK3Q1VWC1lY06kwDb9uA=;
        b=Pdy/fAbBPGgnB9d8h7vSQwsHYEe1V9h6UucxVA1D6ty//nVA+aQoK47FPUw+STsqyI
         zV1brbquXV3HfSbl2qvZ6GkzN6m7wWtU6nGP2Cth4GIqTQkKYqS4mNQLCw5cMU0YUvO8
         EKcFtaQ3OvTw6Cgpt4ozdrVXUMldcOEOCSQ5tVjLnTTzWALkeYayX7VWeGyZjfFQGHLy
         v+nmTSIXl/dRblUwLJ3XrBLwlIi3LwBwJeu4nahKUZIDltg+rh/0snEgGOhj821rbJp4
         ZMi8p4ljukWYn8Iw5xDZGxlXQoSTn4JUrz9Pye9tzKcsTJQpOkQukp63azWHvEClVNrW
         Ky2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rgiz15qYX3oEufyKXbQCuXrDK3Q1VWC1lY06kwDb9uA=;
        b=Mo0stKbOKJ0w9lbQYZY/dO4v8fRAA0wi10sC69nEq3KjFdfKj4WOaH1DTzUHTb3aCY
         r2/yICATUMV+VE2EPgStyKHzTgqRc+oYf6FA0cz8sHAgGb6sByGcwwKGNEpEcTuZbg3s
         soCPNGXHAvrpAwLDN2XobnzS1mnsFasdV6JSzieQqhnzWY5rpRKAwECyLRgTRYOOi+TK
         annY3gDJDbJuIK46cs5EKcru22Ok3SuCLskVQ5rMmqkzEHsroMflfo4tsQTcILNuPznx
         imGJwDdCymOFYrvDR7UTN9OtImeMinOkpmZnjdZXVhu6O04X+8PecRdhxyHLU8ESQx6k
         J0rg==
X-Gm-Message-State: AOAM532IhyV3R9pRmf9OAZMKb2kRXKp5rYrJK2i/4YxW8QOUVxpDEzcv
	Sybwys9tRXeNJ2R1ZyNsj9A=
X-Google-Smtp-Source: ABdhPJxv6RK3Ow5lFD8v0rWXtK/tue2/IC9cGteE5D1sQHZ/alZ94eoGOc8QtRyW04SbWj8D0MMetA==
X-Received: by 2002:a6b:5105:: with SMTP id f5mr5060039iob.216.1636223911922;
        Sat, 06 Nov 2021 11:38:31 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id o10sm7174077ilu.49.2021.11.06.11.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:38:31 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: tharvey@gateworks.com,
	frieder.schrempf@kontron.de,
	marek.vasut@gmail.com,
	jagan@amarulasolutions.com,
	aford@beaconembedded.com,
	cstevens@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Alice Guo <alice.guo@nxp.com>,
	linux-rockchip@lists.infradead.org (open list:HANTRO VPU CODEC DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [RFC 3/5] media: hantro: Rename ROCKCHIP_VPU_ENC_FMT to HANTRO_VPU_ENC_FMT
Date: Sat,  6 Nov 2021 13:37:59 -0500
Message-Id: <20211106183802.893285-4-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106183802.893285-1-aford173@gmail.com>
References: <20211106183802.893285-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H1 encoder used on some Rockchip devices appears to be the
same or similar H1 encoder used on the i.MX8M Mini, so let's
rename the supported formats to a more generic term like
HANTRO_VPU_ENC_FMT.

There are no functional changes.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/staging/media/hantro/hantro_hw.h      | 16 ++++++------
 .../staging/media/hantro/rockchip_vpu_hw.c    | 26 +++++++++----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index ae7c3fff760c..c276ecd57066 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -199,16 +199,16 @@ struct hantro_codec_ops {
 /**
  * enum hantro_enc_fmt - source format ID for hardware registers.
  *
- * @ROCKCHIP_VPU_ENC_FMT_YUV420P: Y/CbCr 4:2:0 planar format
- * @ROCKCHIP_VPU_ENC_FMT_YUV420SP: Y/CbCr 4:2:0 semi-planar format
- * @ROCKCHIP_VPU_ENC_FMT_YUYV422: YUV 4:2:2 packed format (YUYV)
- * @ROCKCHIP_VPU_ENC_FMT_UYVY422: YUV 4:2:2 packed format (UYVY)
+ * @HANTRO_VPU_ENC_FMT_YUV420P: Y/CbCr 4:2:0 planar format
+ * @HANTRO_VPU_ENC_FMT_YUV420SP: Y/CbCr 4:2:0 semi-planar format
+ * @HANTRO_VPU_ENC_FMT_YUYV422: YUV 4:2:2 packed format (YUYV)
+ * @HANTRO_VPU_ENC_FMT_UYVY422: YUV 4:2:2 packed format (UYVY)
  */
 enum hantro_enc_fmt {
-	ROCKCHIP_VPU_ENC_FMT_YUV420P = 0,
-	ROCKCHIP_VPU_ENC_FMT_YUV420SP = 1,
-	ROCKCHIP_VPU_ENC_FMT_YUYV422 = 2,
-	ROCKCHIP_VPU_ENC_FMT_UYVY422 = 3,
+	HANTRO_VPU_ENC_FMT_YUV420P = 0,
+	HANTRO_VPU_ENC_FMT_YUV420SP = 1,
+	HANTRO_VPU_ENC_FMT_YUYV422 = 2,
+	HANTRO_VPU_ENC_FMT_UYVY422 = 3,
 };
 
 extern const struct hantro_variant imx8mm_vpu_g2_variant;
diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
index d4f52957cc53..7c8dc211dbc8 100644
--- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
+++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
@@ -21,26 +21,26 @@
  * Supported formats.
  */
 
-static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
+static const struct hantro_fmt HANTRO_VPU_ENC_FMTS[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_YUV420M,
 		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
+		.enc_fmt = HANTRO_VPU_ENC_FMT_YUV420P,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
+		.enc_fmt = HANTRO_VPU_ENC_FMT_YUV420SP,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUYV422,
+		.enc_fmt = HANTRO_VPU_ENC_FMT_YUYV422,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_UYVY,
 		.codec_mode = HANTRO_MODE_NONE,
-		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_UYVY422,
+		.enc_fmt = HANTRO_VPU_ENC_FMT_UYVY422,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_JPEG,
@@ -478,8 +478,8 @@ const struct hantro_variant rk3036_vpu_variant = {
  */
 const struct hantro_variant rk3066_vpu_variant = {
 	.enc_offset = 0x0,
-	.enc_fmts = rockchip_vpu_enc_fmts,
-	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
+	.enc_fmts = HANTRO_VPU_ENC_FMTS,
+	.num_enc_fmts = ARRAY_SIZE(HANTRO_VPU_ENC_FMTS),
 	.dec_offset = 0x400,
 	.dec_fmts = rk3066_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3066_vpu_dec_fmts),
@@ -498,8 +498,8 @@ const struct hantro_variant rk3066_vpu_variant = {
 
 const struct hantro_variant rk3288_vpu_variant = {
 	.enc_offset = 0x0,
-	.enc_fmts = rockchip_vpu_enc_fmts,
-	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
+	.enc_fmts = HANTRO_VPU_ENC_FMTS,
+	.num_enc_fmts = ARRAY_SIZE(HANTRO_VPU_ENC_FMTS),
 	.dec_offset = 0x400,
 	.dec_fmts = rk3288_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
@@ -534,8 +534,8 @@ const struct hantro_variant rk3328_vpu_variant = {
 
 const struct hantro_variant rk3399_vpu_variant = {
 	.enc_offset = 0x0,
-	.enc_fmts = rockchip_vpu_enc_fmts,
-	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
+	.enc_fmts = HANTRO_VPU_ENC_FMTS,
+	.num_enc_fmts = ARRAY_SIZE(HANTRO_VPU_ENC_FMTS),
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
@@ -551,8 +551,8 @@ const struct hantro_variant rk3399_vpu_variant = {
 
 const struct hantro_variant px30_vpu_variant = {
 	.enc_offset = 0x0,
-	.enc_fmts = rockchip_vpu_enc_fmts,
-	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
+	.enc_fmts = HANTRO_VPU_ENC_FMTS,
+	.num_enc_fmts = ARRAY_SIZE(HANTRO_VPU_ENC_FMTS),
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-- 
2.32.0

