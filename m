Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0773EA955
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872681; cv=none; b=Rj46MeNT8KLwzvkQRGljEk48INIXRsstKjbSHMoKhJxJKZdgwAFRsoB30yUqLBxIXDpoV/6kxu18t5qEILdHIonnKHm54emg2Esta+yb4pLTkVZcUInwztV/zle/nMXUDsAYCY6qsREVS6/+FmURmhmc5izM3QzxZ2mfhabdMIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872681; c=relaxed/simple;
	bh=A/AYxGDhE/Ex2CqZrYjDja9gLs4eklMYsN3ZXwfQQ1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eex3x77n3YHsE4wTKnJVzWYKgslv9R7cGRbZX+tExjf346rIcq4/3MG7ZSlhQAV+gkbAQIcdK/rbLKKobxgTEwanWZ06YootW2ce+cqPZbg9m9KWj/7SVBDnuxaJiOhp71wf0KjFYd4NuYvKe6O6RtdMOVGugL/GCX7/vQ8RvLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bND97OF2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bND97OF2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8687630fso2214755e9.3
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872678; x=1788477478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UET8U7EbccYF8hlqBlyOGBwSEMl/AgFZY7jlxT3lfR8=;
        b=bND97OF2kvkx16rfg/RQx6dvMwmw31m1gI6040n9NPA1xz20IUs4c3NmUwarO+Qlsa
         uHIy0D36hi9x1UI0hM4+hXdZesWpQmc35jUiTFryC8Luc+/IAiw2cX2NEk13eXdXB+xy
         V116paTlDvIsabvtzmtVkWkU7OwD5YyfKzBRpkpyNeuuGwGX5Xmp8vJe21FaL1ogLtxT
         lYiCcfRIKnxcsG/czBjipblcQLs2NC3FuBrbTp2mkkeisRFtHenQG/Yo92KUUgb8+54+
         lKS0xI6Ei6RX1xxoZPRVb3hxgW1TCojvvNdmGHgkN+hljaVBGZKMN83RS0PFEHKtnXJh
         ImbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872678; x=1788477478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UET8U7EbccYF8hlqBlyOGBwSEMl/AgFZY7jlxT3lfR8=;
        b=UoMZ42MR6IHYl8+BWTtri5+MMEZJvqZnPQJs2RNVDPGEHgsA8kUSxZOb5Tn8TOtGNs
         UT+wK8PY5OQTsUs1VXmOJ919W5F5qLlDYj7LDw+Xa1p/vBTY3/90DJVMP1f1a2wtCp87
         tcceGsi8McInkFkCFOEMqH5pRXFOvvHU4ZuDwLuxCWyrSBNDDVKnmcPH3rsdUUF8VxmN
         Bt01n+QhVu7nvO2P0CEs4TpV9inVJ91AymzB/iKtTiv3q5rFa51Ige6xY8TYrMz4m4zr
         KpnKqUskzqnGiA0vp7XqUBuUaytce/BJU7BgMy5KJ1GzCwIEoNAhp3vWgOWL9OT1kQTk
         lg7w==
X-Forwarded-Encrypted: i=1; AHgh+RrXpd2dJUzbSyXZVmCZMC6md0irarvIJt/KJRQ9qPlILTsMLHf1XAJQMODJh078olh2U0YuRYKjS2qdgf2C@lists.linux.dev
X-Gm-Message-State: AFuF++m2L+4gohraW+f3FezaSpHJHFPi9DVHDHTqyEIhQfbLSD151+TF
	xvgqqwGkr3UcMDVlQZELAI1QsK9N7RUqwweTHJewoilS8XOChQ+Cgpg7
X-Gm-Gg: AR+sD11OYf8H4LbBp+xDzAl7QcpFDn21oTa8tPJV9QRhEqxFer5C05IpKpAuQfAAGGf
	j/ZvSMCzXDJt9wSr40EjxGldMjOn0mSsdYrwIUCdZiyyNs7nUgjUU6ZyQWKhwRnSC/GlMqblEoH
	qWqHsknpnlBgthZ7YOnMTrncv4gvl3ERU+GI7Uik2icPeRfNkkFRTQQlplSEP0bTh1uBNiREU5M
	KPDgM/06h6HsbztM4aJyFx01wFLeQYN7W+brmTVgF0nIxjD1L+ANkSHtQAI7Jo/VmQLoLAnxUPC
	RQvFKBu+bK9zHxnPvEE8j55cy617nuWnf0/zEy3QvXbRMGGURxIs9QhpsNbtSrrX4hOGiiKAzL+
	xf3+HqI1lia5UOuLBMlWBA0zq6rQh7wvEV66RIF4irmuLOcTYv0hjH204iDLEjTvMvN/Vtbj/38
	DG2C2WjVZQt8mpEEVHS3tM66uYk+jv8yE43t7qugqX1GoPurLAuWSyAX3fjC6nMU6eVI361xsEM
	polZC15QJmO1AsAPgOdVsepbf7AAvp5vqY0F+wcUUvh
X-Received: by 2002:a05:600c:5299:b0:49b:8e8f:a409 with SMTP id 5b1f17b1804b1-49b91c6481bmr28112425e9.13.1787872678554;
        Thu, 27 Aug 2026 16:17:58 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:57 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 09/12] media: ov2740: add manual white balance controls
Date: Fri, 28 Aug 2026 01:17:27 +0200
Message-ID: <296394867b779cfcf979c590ef873c2fc19416a0.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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
 drivers/media/i2c/ov2740.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 6083dd28e4ad..ae8074cb7443 100644
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
@@ -737,35 +740,41 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }
 
-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
-	int ret;
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
 	if (ret)
 		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
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
@@ -806,7 +815,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -847,7 +858,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -882,9 +893,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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

