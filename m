Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525A42B324
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750604; cv=none; b=q9EVNdeh1n+xqW4bDakT05gHNvVvXkp9mZNYSOwluTJHNB1S6CaMvG5ZvBEyfmf6hgyBiu+vlAlNgALaXLKpe7SI175MRzXjP6N7duMrfvLOXPoEe0gqAZBZpvnRqvKeXqmhAmfoUZf6nY4TSH4JwjhLzKRckMzxmk8qQkoWEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750604; c=relaxed/simple;
	bh=THMn0luMX4cku0CmD3upSa4VhiQXQXukK48ACXoBa6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7nT6/JErqHpQjIoud6wh1W5skexjS0HCGEtOh+G+HqhHASHrAAKY8KHWHvzz6ftG7vidGPSVaOFUvP8/GJR+0BFGujGkVqAGXKG6yLi42RVHjaIas+M9aKF7rlU3qR0855ixFcee4L74FXzgKJT+tuUsaQ3Lg0sFpT+wFWt2Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVB1BB9p; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVB1BB9p"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so1270653a12.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750596; x=1788355396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BJDJIpJZRxZ10l5Jed80WVNk6QVcCkQrV78n6UBbUM=;
        b=EVB1BB9pGnVj3vzwIlKC9KZTjvunORkN9ilVf1sBvPP1rFpjuOPqYUnyXHc8IAXz2k
         ypMmz9yEY9qCui5+cNQpIb8Fl6K/7sm7mKRJC9psowhRdA8fpuaDgbkftKfobOYCYhRP
         NUjEEmu3zmmxjqY1/baPonBWHsg6NcaEglhdqqca09/un2HCe9E3mzDvyvNPrjq0sM1I
         MaABjkOD1VtyEG3t3bzgAGxzDNi6yASeiwJ90KBhfstMTIvucqr/1KR00gk/gzL3hTkH
         vhVD3OkVSjH/IqRA7xzut1UxhDUSrhSdFm9iQtLH4iWnT08wfdoB2j47WBgs0odM2WjO
         a+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750596; x=1788355396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BJDJIpJZRxZ10l5Jed80WVNk6QVcCkQrV78n6UBbUM=;
        b=Kim5Kuzd++m8CQ1PGrgictDkPNFviuGs9GtEnjMcswxZn8ksxTpmFANHQk2VoBv+QV
         alFIqy6/wAFYcZlSlpN5ChXWXjHZUcM8mKT924xHQkIhel5Ld+bhbBpHoSS2vqSL362t
         6PM2Ydrv1SWqnDE00DASYfBlvr1ldQyiilMAkhPKWbXnxAWmofQjDziD58OEpaGfEq+Z
         5mW7Ndv5DbVENH5TSrBpXKLm/GoB1WRUIcfYokafNJVmwQPGybe7e/ON9ty0kzRNy52Y
         k3mbaA5Wmqb6jxc/NHMSLevu9x8l6SVA4B0V8/QxBK2Ipf4drpnSImQJbU6xv/hraiRT
         D7Ug==
X-Forwarded-Encrypted: i=1; AHgh+RraR57kRu7AjM5q+Tbqo7zq+EQRS4j2X4wyFPHzEWtEE87aJh+ZCYQDo7tQyGjYdI2zeHvg+9gXCE+w2nt0@lists.linux.dev
X-Gm-Message-State: AFuF++n1+9mTju7Pu/a/uWPohrFXft7DaYwlX2cTezH5eeYWSfumctHO
	eSMp+bz9jimQWH24yvF2WJI8SkYu4krjfHpVEtoFZ4OBCF+ZpaTBkcd1
X-Gm-Gg: AR+sD12Y/V1L01I73xWpc8naL8faWQtGAhpIfwcVZJ6Yyhr7dORPT5DDdIEGIPJR18I
	J9CjG48UQmUfGR55YNZ/slGnNQZrby4Sh8jBtNu14zD/KSfabI+/qMyqxuAm1pmFOOe/vpp42Vq
	3S2U3Mx0Yspnsz2Oua4TH+ztG4wElhOf2I71Yw6/Eahzac8zkQjjjKMUhmkMmm5x5K+35h+AUqQ
	dxMo5iU4wXFDy/JNYnwwMOQSlsrqL0sq0J6ZUNDXcOMKjigVwbGrxpMySgHvnh0pfVEe8ByZAVG
	I73NEhgE8y1USY+TJjt77jEEUiaKgjA/X9zAy/HkkWpqOsY1wjFCtnT+IIqfQfV1H2XVyTRGq5B
	fEe4Lqp4swKyDcveg1/hEaAJ3v+stPR6fkddZYcq2AVR4yOvuYZIti9KK8Dr6C4MjBreFoIyWpl
	Y49ViEL9F9H0MwUc6s4vKUMflR87Uvn5u3aTLCuymuXq3t4uV2gX4iU5VxoQbspATAQAloYUcmK
	0fJZRM5OixsiNNLooNfzr7rXSEvNblzhZC4A0bYsKw=
X-Received: by 2002:a05:6402:538b:b0:698:ecf:d18a with SMTP id 4fb4d7f45d1cf-6a5df6535f1mr9483609a12.9.1787750596381;
        Wed, 26 Aug 2026 06:23:16 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:15 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 6/8] media: ov2740: add manual white balance controls
Date: Wed, 26 Aug 2026 15:22:54 +0200
Message-ID: <20260826132256.3343451-7-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor has separate red, green and blue manual white-balance gain
registers, but the driver currently writes the same digital-gain value
to all three channels. This prevents userspace from correcting the
strong color cast of raw Bayer capture.

Expose red- and blue-balance controls relative to the digital gain,
update all three channels under group hold, and always release and
launch the group even when a channel write fails.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 71 +++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index b760d4dc0e68..7651443b28c1 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -607,6 +607,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -736,35 +739,46 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
-	int ret;
+	u32 green_gain = ov2740->digital_gain->val;
+	u32 red_gain, blue_gain;
+	int end_ret, launch_ret, ret;
+
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = min_t(u64,
+			 DIV_ROUND_CLOSEST_ULL((u64)green_gain *
+					       ov2740->red_balance->val,
+					       OV2740_DGTL_GAIN_DEFAULT),
+			 OV2740_DGTL_GAIN_MAX);
+	blue_gain = min_t(u64,
+			  DIV_ROUND_CLOSEST_ULL((u64)green_gain *
+						ov2740->blue_balance->val,
+						OV2740_DGTL_GAIN_DEFAULT),
+			  OV2740_DGTL_GAIN_MAX);
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, green_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
@@ -805,7 +819,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -846,7 +862,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -881,9 +897,22 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV2740_ANAL_GAIN_MIN, OV2740_ANAL_GAIN_MAX,
 			  OV2740_ANAL_GAIN_STEP, OV2740_ANAL_GAIN_MIN);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
-			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->digital_gain =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_DIGITAL_GAIN,
+				  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
+				  OV2740_DGTL_GAIN_STEP,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->red_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_RED_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->blue_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_BLUE_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
 	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
-- 
2.53.0

