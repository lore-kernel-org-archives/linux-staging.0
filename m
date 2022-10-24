Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E76AC2;
	Mon, 24 Oct 2022 20:15:36 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id m16so33195178edc.4;
        Mon, 24 Oct 2022 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jVp3CG27o9+HdXrqFxf0SW9oZkiMXAzJ2FPuuiQx3Y=;
        b=AtN2GbQYKT6lPoTuMCBqyujg/iuyMiylMdjB+nkJ73us1MGbIG6V5NCEdtNN48a3Je
         Z3QKpfNwo0N3X3fTZ8ijGu71yjluzrtZteqa+uIRMgxLCZ9n9+HhIPN5mE6sOdgAhuLk
         BxNBaxlN5ghjjysmLNPNH4+29o5Kfb/t2IyqglOHA0eu0Ybkp7gmAa4qWFtwiXb6+Zf4
         jVCCk50+1ermsEL3r1qkRWODvUsIySj0CDoiWmhm38Ov+El7TNFL9URXEShbQ3usuBYT
         8ItrcYb8/hOaZq1bJlJfSK7QQqDiGQizSwtncL3umvhsz5WoA/khIMoP3zmzwmbHcLIg
         bXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jVp3CG27o9+HdXrqFxf0SW9oZkiMXAzJ2FPuuiQx3Y=;
        b=w3X4gnc5rx7yyHgXAqy4XFSR65fQRakhcTRj3JHgoCdix+YgiQm00Ge6Xv40gpfn3Y
         6sMpt/sfRpkqydFOck8EiI10MCfR4reLqVCuEArfKbqizyRHsSEB3chPg4bDgV81j5yy
         Dtrmaq+WKFUso/nm541e4cc39VJTVjkE+mDUWAzF2S4N/6jwcpQiUtMjmsAgMt/H7BR6
         MAlm31wzCj3Q4qufJJ/ZrU+muVNaOsOK1X2CYjstswRS3Kl+NRFjXmxUq1tG6wY6MJGy
         TpxurtshIDhrpxx82MuY3ndD1Pnk0ivDzIuPzQtOyWxVAchFeu4znbgQonZ6qpmQ7XI1
         GPIQ==
X-Gm-Message-State: ACrzQf0C24yu6+7Q/FePps3FlUEiqhXgV3sVQRg2P0ZNgmD+mabcYBgt
	fPTzDnrZg8vbONAnswoMQ1E=
X-Google-Smtp-Source: AMsMyM5TZlmeIOe3i3DfrLsflw3y8/P19jMGoXJVrhuDfy549fh1803BHPep9M2rsrPSNmpLQGVrXQ==
X-Received: by 2002:a05:6402:b99:b0:461:afc3:9a02 with SMTP id cf25-20020a0564020b9900b00461afc39a02mr8405459edb.175.1666642534924;
        Mon, 24 Oct 2022 13:15:34 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:34 -0700 (PDT)
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
Subject: [PATCH 05/11] media: cedrus: Filter controls based on capability
Date: Mon, 24 Oct 2022 22:15:09 +0200
Message-Id: <20221024201515.34129-6-jernej.skrabec@gmail.com>
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

Because not all Cedrus variants supports all codecs, controls should be
registered only if codec related to individual control is supported by
Cedrus.

Replace codec enum, which is not used at all, with capabilities flags
and register control only if capabilities are met.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 45 +++++++++++----------
 drivers/staging/media/sunxi/cedrus/cedrus.h |  2 +-
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 2f284a58d787..023566b02dc5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,56 +77,56 @@ static const struct cedrus_control cedrus_controls[] = {
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_MPEG2_SEQUENCE,
 		},
-		.codec		= CEDRUS_CODEC_MPEG2,
+		.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_MPEG2_PICTURE,
 		},
-		.codec		= CEDRUS_CODEC_MPEG2,
+		.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_MPEG2_QUANTISATION,
 		},
-		.codec		= CEDRUS_CODEC_MPEG2,
+		.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_DECODE_PARAMS,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_SLICE_PARAMS,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_SPS,
 			.ops	= &cedrus_ctrl_ops,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_PPS,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_SCALING_MATRIX,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_H264_PRED_WEIGHTS,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
@@ -134,7 +134,7 @@ static const struct cedrus_control cedrus_controls[] = {
 			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
 			.def	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
@@ -142,7 +142,7 @@ static const struct cedrus_control cedrus_controls[] = {
 			.max	= V4L2_STATELESS_H264_START_CODE_NONE,
 			.def	= V4L2_STATELESS_H264_START_CODE_NONE,
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	/*
 	 * We only expose supported profiles information,
@@ -160,20 +160,20 @@ static const struct cedrus_control cedrus_controls[] = {
 			.menu_skip_mask =
 				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
 		},
-		.codec		= CEDRUS_CODEC_H264,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_HEVC_SPS,
 			.ops	= &cedrus_ctrl_ops,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_HEVC_PPS,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 	{
 		.cfg = {
@@ -181,13 +181,13 @@ static const struct cedrus_control cedrus_controls[] = {
 			/* The driver can only handle 1 entry per slice for now */
 			.dims   = { 1 },
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 	{
 		.cfg = {
@@ -197,7 +197,7 @@ static const struct cedrus_control cedrus_controls[] = {
 			.max = 0xffffffff,
 			.step = 1,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 	{
 		.cfg = {
@@ -205,7 +205,7 @@ static const struct cedrus_control cedrus_controls[] = {
 			.max	= V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
 			.def	= V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 	{
 		.cfg = {
@@ -213,19 +213,19 @@ static const struct cedrus_control cedrus_controls[] = {
 			.max	= V4L2_STATELESS_HEVC_START_CODE_NONE,
 			.def	= V4L2_STATELESS_HEVC_START_CODE_NONE,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
 		},
-		.codec		= CEDRUS_CODEC_VP8,
+		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
 	{
 		.cfg = {
 			.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.capabilities	= CEDRUS_CAPABILITY_H265_DEC,
 	},
 };
 
@@ -275,6 +275,9 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 		return -ENOMEM;
 
 	for (i = 0; i < CEDRUS_CONTROLS_COUNT; i++) {
+		if (!cedrus_is_capable(ctx, cedrus_controls[i].capabilities))
+			continue;
+
 		ctrl = v4l2_ctrl_new_custom(hdl, &cedrus_controls[i].cfg,
 					    NULL);
 		if (hdl->error) {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 1a98790a99af..7a1619967513 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -57,7 +57,7 @@ enum cedrus_h264_pic_type {
 
 struct cedrus_control {
 	struct v4l2_ctrl_config cfg;
-	enum cedrus_codec	codec;
+	unsigned int		capabilities;
 };
 
 struct cedrus_h264_run {
-- 
2.38.1

