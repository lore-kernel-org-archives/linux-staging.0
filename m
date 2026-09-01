Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC74A207F
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289512; cv=none; b=q3d2rGaywdKo7DdBjxVrChm4Fetj/9NdHkeaO+ihA4kM7Ww01feMBtKNZR5u6nyw1uw6NlaVORBtc2OlgQqFpnZQEz+bzXdbqkcvSBut741XcfgS01vOjVUDvtPaomMB/v/5df6F6f376RJ1JcTggnBB7liNq0dhx2j5k6yanlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289512; c=relaxed/simple;
	bh=yy7NqzFTCZj46zAWpwdiPyZCalfwq4poxZvjcHNMIH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uk7/x8k7c3BjueCbpJc2wgivHc5NNPiJN0V9gc/mXs3z4GNnI2pmiYaiAiewMrZnLujBP1dEZEvVQ3fruSQZweV26n4WMRTQ7YoTuN6K3fQD4stVd+PEzZ2Upqlou+JCOyC0gM9ZnpaiVzrjbt5mLgsqmxNwDt69rg7WmO433AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IifJs7C7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IifJs7C7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8687630fso1026775e9.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289507; x=1788894307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=IifJs7C7QGBpPk8qymraweQzPf1DlVAgUK/nHJkeq73EMpFcDE6l/KPgIDmgNaZak7
         yYfMRfMHbIDvEzshlRe7IFlIZ2WN+b2W5kCvwptixf+i/VdgvRIkjj5COKCgvdSiAd6f
         sHhOHkHog2GfI33ly3Qz1Ae8aqiBcZ9N1PYnC3jsKNdx/na8IGPZlk7K4QyF59z2ttih
         49sehZXW5SZbpM2jTGqz0jQZ0gvWtXbIa+gmks/SRgcjQ1u418Ymqmj1DF9ADd1v4PkV
         Py8nxHVsFaFin/HIj7RTT5Z93eUkQoXB+hqsvTPctYfLPa42J4z/VrrJLbR8ImeA9nrX
         B5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289507; x=1788894307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm5sUM7FjiWcwv7SFl7EV+zS0klFRC7hu81VsxS1+dg=;
        b=hlYtIWTC1uG9DHcOi9l0lADfhE5OgkbDZWlG+zDr6iwgwxKeSdcJC84swqA+lwEfoz
         8Pj9sMOCCkzowJIYLNyUyuBBignAbiQaKNdSwKUV7WG4tM8mMJukGEyrYGMOJDl7OG3s
         kUYH1VNHhwzDhviJxOEKZR/4qSwABBjAGHOilTXnL15c2a7RUbGerJzzM+MyF+P1h8q3
         fJ+mqkepgomyUIa5qkZZOYjGd4pX4JhCHWjLmRMzRotNMMFDLVQ4WLdJCQeeFigR+LO/
         2MbyfyOS03e+qELt2RVm1W+CU9WyypkTnG4ANr3sSPITNeUBfDF4GIgQ5XvfIeWAZLmd
         dGjw==
X-Forwarded-Encrypted: i=1; AHgh+RoSmZmQXrfeNqhcOpL/7wsS/ubJiYWh82FlOpq7d0KYWzMzfd3IOAt3Wpn+lhJluJ+rUhcx4kcnGLeKvwCp@lists.linux.dev
X-Gm-Message-State: AFuF++l87bsnipzC2bhoeU5ehkY+6sr/snzp4nbVKnQSB0BKt3v0F8AS
	I6ncIf3xKjIclsKHZ9w5S1xxn0KVhmA+KL06h3JVLPZ496l9x102yVpu/2fLkyusIqkOaA==
X-Gm-Gg: AR+sD11xHgfGJwcp1d9ierYu+01yDdHK3GTs8X+g+jRcSpZZ0vNoBkea+t8GGuUZXV/
	7L4AcJZ4oV8/+V2dl5yD0bh1DSZ0RDTVxuviEjgoOusRt40cD/mr/NKmTrV/hJDlATzaWmRi3L+
	Bk3tpJfyckfMZkpQW4xToR6vOG/Lx7la4UCrdyIbZlKFE9KB/umNvt2DZOeaYMsdS18xskaTUXl
	NFxYiTbCVKdC6SzKf5qWWFowRmvtDGRsSsHY4jHmzPQEhWucOz8gDMgndfuD2sff37GzlW1aNPA
	n9eFyaM+L9bYMlgJr83GfJt46qd1DxSkz587QHUK0Q+ycftSvrheBfrbN2bARsFSetQpuHT+Sak
	hei+siYKXEvkNJbcmdbGRmzSGq2UPu0YrGJV3NN/gUgLCBkOtb8hVHiNxi3/rm2HMDYilIg02Za
	E7i0IoGawK87iQfdlJuUxNvwv17loT4bM4Qi07OLfmHt6MZIzu/mrUcTBXHh/TPdBq0Ye1tzI7s
	9U4qqNzvJy8cUYaBA79EciyOlMce/552wPdm7iOlA==
X-Received: by 2002:a05:600c:870e:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cdc43f461mr233533705e9.12.1788289507179;
        Tue, 01 Sep 2026 12:05:07 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:06 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/16] media: ov2740: add manual white balance controls
Date: Tue,  1 Sep 2026 21:04:35 +0200
Message-ID: <10f597f1911de1d3cc43b5aa7a4b3a13aff4e63b.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

