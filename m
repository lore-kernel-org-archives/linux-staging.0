Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA644DA541
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854704; cv=none; b=cA5rl55W9mUqhmexY9Dg5CKTXiIDNClQvpuSJQbZkh95riRnF75SfcYY1JmEDn7pzbr1mtnJaT+0WPt2JHhkQ235bBqMXj9Ue6uhb9+qmz3C/LNVmqpW01sCIE7vTcxW2wF/ImZUQSj+/ENOQCOtwrl6pudDjTRVb+jxBPLFR2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854704; c=relaxed/simple;
	bh=q4QyCAxtft+YL/amDh4uvcwfSmyXggOPe+Bo7Y39AoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rT9E7d4FBt3UCq7SEBbj+sRXsvNCjzlAtYf4KpWEI8p6lCF0Ey7Zr7G6XPeFTZgYNblHA0ljZCjfOYRI1FoWHOjFvUoxFAHg9VmoGkebZMvCv/d6CN+s1wSTFt7ITlwapM/DTpgdgOYRCu9P9rWGJA5PJm6hg9JyJAs7Sx1EjaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7MHiRxS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7MHiRxS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so539025e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854700; x=1788459500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hgz0BB40fX6hY+eQd47OjT3VIMJyYIXbhigyIL4PMGo=;
        b=d7MHiRxSzv7w6ti8Hjm4LHYvvZmxrDEqm2HgM/KTiphhsFb0v9yx8uZBM9X4Fm35vu
         nSi94n9tfTOqyJiUM8Bs+xwnpCVopqCUh4f1dBmEPcxcay5NvvTDXawZPdRV5Ye4Gs2Y
         MNm9nKWtZIDCWYG/c0Gy+UMcXvU7qVgdALctIp60Q4hM3sj3tInJp4+484ABBxbHvw2u
         PrZPUKATKdrtCftLR5hTAWIwFLuHgw8b+3MYFrZg1JsrAvvT66H43Px2enlwnGBC7DNL
         UC0UHqxndbNc53HaEpNke3bT236FhY2Yy6dh4Zpc34FsXMiEeWfc1LRK1TkfP6PnCN8b
         HD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854700; x=1788459500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hgz0BB40fX6hY+eQd47OjT3VIMJyYIXbhigyIL4PMGo=;
        b=gZUlpHh6BONVKGftDzF2VPM4OcHQZJWpm24Na2rXt9Npk4ZbxKtZddI+b+CsSXrCpl
         ll6JPV3KGMmpVJUU2B7OJRXLwqWCtg8E6+yLv0DI4r/kiB+NLtXSZs1QVkaVFFDzfxye
         sAla8qS1YbZToa4OjjkALqJBnwo7O7/J0kSYFwB2N1RMajLkhzvSjypjiQFjeBe5bB/1
         zr5c7296JmX6qCvxg76Phte4KZHkNybou8cZiqJW5V1wEk66cqLhhFVXAOM7lVgu06i2
         +vo4aLKa8DhDEZ0ET/l+a7lFWCy711phZX//TWkj9IsMR5XOG2ztp+8cVv2CBm7ecJau
         Oghg==
X-Forwarded-Encrypted: i=1; AHgh+RoNEsvHVEgKg55GbFn69wZ3aWubgMdnGBwkzdOu1KuYM0z7Jq4kRQa9OWxWOIm3P0FRuRZaO0ZI+3QGWeQg@lists.linux.dev
X-Gm-Message-State: AFuF++kYKaZD2ArkEAbaPC0s5WsJjfwuflmgoECs77lhmrZ0s7m8MjLp
	yUl6rt+upcCw1CLOMH2TdN/CQKiyPq37+VfdYLrDQOwUeDgnr4SC9xPH
X-Gm-Gg: AR+sD124qsZsGqKemx2HG/oAy3CnWOVf96RXXIyeA10yMstnBJwybLcpFDVML9avlFw
	cV8oL+hOsNPWhQMrVRJN57cmBTP8Zn1EedLMklAlBZ6MPKIYijxuRrXXL2yNH4I94NRuBfCV0Ab
	NDZVSmGdBTnWx7tiC5TWe8Tiq6FdOIWqXzEJy5J0E/7BLp3dkCcZPbHEnfAupsCB2uVkJYX+etS
	MFESpW1Gv2a28oV+iP8Vg2C5I2E9c0MH6fn6NKieYplBrGI7NAIvFBHLtU8jfZvIsj8r/QCoMLs
	vHx80QwxW18coKJ2LdAIsM0aciei++iPQipLkcLPSav6JHDmT7mncUFMQL4z3pjTzKd8BVsGLae
	tJ1k/DmCXZvjVAZVI/Cl3bhSVUk3pDLEU1+9RR0KIjRZ8YF2ZZmL4tZrGcSrTpdKgXfkXFlF4X3
	zdVwh2SYzPO/j6nPu2jYNrrDd7W6Yv2moD1d0jFHlxAdHyV9br5Dt8zed2xq7RfqMSqUoBOTtQK
	v8/Bc9jS3Zsh3pTlBHO9HLmEc8+oGFphtgplslO8yPS
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id 5b1f17b1804b1-49b91c1df21mr13112225e9.3.1787854700424;
        Thu, 27 Aug 2026 11:18:20 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:19 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 09/11] media: ov2740: add manual white balance controls
Date: Thu, 27 Aug 2026 20:17:54 +0200
Message-ID: <20260827181756.2430054-10-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
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
 drivers/media/i2c/ov2740.c | 68 ++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 6083dd28e4ad..2d46d8685971 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -608,6 +608,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -737,35 +740,42 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
-	int ret;
+	u32 blue_gain, green_gain, red_gain;
+	int end_ret, launch_ret, ret;
+
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	green_gain = ov2740->digital_gain->val;
+	red_gain = DIV_ROUND_CLOSEST(green_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	blue_gain = DIV_ROUND_CLOSEST(green_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
 
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
@@ -806,7 +816,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -847,7 +859,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -882,9 +894,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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
+	v4l2_ctrl_cluster(3, &ov2740->digital_gain);
 	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
-- 
2.53.0

