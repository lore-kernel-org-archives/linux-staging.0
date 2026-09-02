Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768C44A8403
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360857; cv=none; b=GE9d42jAe9oZTEHMB84YmaH9E3nlQFmdEygCsGihcJTHegEP5ub/pFI6C0uvXa9TO/WhxMw3asG2i8LlvCgxOPEP1/+5uUAUoQItmaHfopTupBPLldCss3xRlpowyGmtbVd95OSt31RInIpoa3gZ4ra+Qf12h4cqnwrgvNyIToY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360857; c=relaxed/simple;
	bh=yy7NqzFTCZj46zAWpwdiPyZCalfwq4poxZvjcHNMIH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mySiyZuSVdTjjn3+2kKf2LHNHqp4gcXS35JFYJ5SXyR/fMbqmuKUAT5Jk1KCFMerb5dE0VvEasfKfeis/615vdTfxbVJHk5R8M8wgSDCNMbV/uwqIZAKYpe9r24O46gHDFejzYm5BEqZvdLH6mAqUKBselcl2OaoZj8h9Y8Pgrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pF7DTbPZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pF7DTbPZ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48431648f33so1708398f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360853; x=1788965653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=pF7DTbPZa9aT2z+tGmYJtghe0onO9uoeDkJaBCrxQAvwcV2DFdt1tqEWDGxozzMnFC
         OG6+leXuUwDzWiUINu4rja22evQpckRzTT0QuBYm8BRy/mwbVNgqpoXgViALtfTP5XB6
         hANGHZniTVV82E0ju34eAwDtt32wW/f24ReQy5FWH4bt3fsHAO0+1DixoHzzjBaV2Nea
         ENmkMLnlkwztzSpXhRxQAy65zqvCaZx+e1PgmmLtau0sECFa/CW9rYgFvrfflatAQ4cx
         ebMQjxkiQBfvDrvxxqcmAyYZ/sW5yBFcurN/2xuqyst7vGDoVaQ1U4vXNU2FwC8Q2usn
         SJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360853; x=1788965653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=OrHKv6HSPreCE0bVwblg7g2ADzBrfkouyHHbwSGbFkjiQjbSHo5xIFaDsjbHZcp0zm
         XhYWtYffAxtf/epAOYnLpPYMQeq+gIkggrOVCp4ywDdYUJle33P9c0jtBzUbDhmaVaMe
         VLyv1L5nb2n1ctGOSulRKQH32+2QXH33RDcMBvP+Dp2MY7Pkz3lxE0km3JS+GLVSlQSx
         jM7zdUQgEtOisNCgTImMHn5cFdobpCo1YhCEEejdQHMs0vxo+sycl5cdQ6mLc3RQOE9U
         pWlumTbqd0iXtlYgn9buwaaKTyMciuy/PAgvWRkdU4Q+JONuiQ5452UDBaffs0Dw2KIn
         AEQA==
X-Forwarded-Encrypted: i=1; AKwUvBy6elkE9tzp7ymh9OTKvyhv72w5hQJ8xT11mHsYhv+lkycy2P4Wf4kYA/RWJhnMFaCsvWkT7nhWyplmIZO2@lists.linux.dev
X-Gm-Message-State: AFuF++mceLxSfzb4v5AlwzI4mT7RBnBibJzGY7Q6gnhWd5cNOI13p2he
	SQKwMn31e8SNfAVj5IfALQiqvoUZQYRSA9z7qSZMuD+T6ao4Km6oyrEj
X-Gm-Gg: AYBFou1oj0BB8jyO6DK9Pf43JdzdH3L2xhNLNzN+d7Db8TK7c96Y0ErrcS9OobwkAE5
	Ay2CxQLOLf1GXcXUUAnhKw/7PN8M7jFzsBwLjnV9FSL38fnjcqQ1RoaLTIr9h5f88U9JZzxgEcB
	EQ5JVo93TneSsja6Pz1+RDCJREvKniVycO1LYBxhDrL6iq7xbKq+osz9dJKkkNZ20UIiBoal5gX
	zPUEMvVOMZTfk3+Q5B7WEQWd54xGeyjTEgX99WWXqjpnedXXcWwrLvVPJOIp5fOe2LyAKE2XHPF
	lqwJnzBGVMdOEDdEIRHWsqR3dH6roogugeTYdt9ZO2zWEu+tBJqZ6zeFZwQwwDXlYDc7bmSfA9H
	y2wcoJsG2N+d1Nx6sAOHl80zoCkO6peUHxAmBCOYen5gvJn27vi61mzNxLCVJl0WTNkAC97RPxJ
	Vgqrazyk2XzcyACtHo5m7RjR7s1NFdsIpHxFXoQRPi2uWFbYTwX/FnrJ3d0XLlcoYHE0zHSs+d/
	x3uDUkExLmlfJrK6lqAFkgJYRjoulW742Z9yhPyRYyi
X-Received: by 2002:a5d:5f8b:0:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-485781f5357mr7781856f8f.7.1788360853430;
        Wed, 02 Sep 2026 07:54:13 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:13 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/16] media: ov2740: add manual white balance controls
Date: Wed,  2 Sep 2026 16:53:42 +0200
Message-ID: <3cc40ef9fd6aec21cfbb13f238d547b9852a2bae.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

Expose red- and blue-balance controls relative to the digital gain and
update all three channels under group hold.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 44 +++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 5f381b7972bf..4600bbc90293 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -565,6 +565,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;
 
 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -694,8 +697,10 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
 	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -703,7 +708,11 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
 		goto release_group;
 
@@ -711,7 +720,10 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);
 
 release_group:
 	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -760,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -801,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -836,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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

