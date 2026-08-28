Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BC6451993
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933732; cv=none; b=PGdhgohtLcO/a21XzZbz6ESnti5yEvNNWlvYcczFC1TwDhOWo9iPhWi2kaDeg4ORVjICCSyvwwc6DonA1zqnJGqukFvKj1phzS1yZbIhvScWff6Yu1hFqTCA00G7PeoSg4UssVe4FxveJ2mztjHOiol3eTbivLsRmfgFXdG2pAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933732; c=relaxed/simple;
	bh=BODxtu22bMbCeaCPm4r8rZD3W2Qadd/rUd5ROI9uEaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPbkOzx3oF6UPkgdxllFR2IxHOn33gjtpLLpSDQWDMU5GFIQscUQcmcqsKW6/EfgDtyQ21mgS5ox5ujc0FoNHdQKi4186kuereW9uog1ItWDTqp9H5yOIrUNrHFGIDUFtqC78jqW7HLN1p3ND7+Ydc4tt8l4Ns1Jjn1ErN/6uUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7tF7s8E; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7tF7s8E"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e4998d28so834873f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933729; x=1788538529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCkwaqt6mT/Mgi3LcK6pYptNejEWdk/2Ric0vWmObaI=;
        b=r7tF7s8EChqBZyYYBwVrOz3PkZeXiVaGMMt0KzUlXoNvlE3VW2oRup/3rLhrL3rmID
         MQuJYA5yGHvIUT6A6kNV/00qMrXchI/YY76keQgcJo7rVsfiB0kOJR6fWg0DhzzNcEWT
         5J5uPmfdGpdhSI3DiHkgQixXaQ0iDUxLcpyJsjvOXbdY4FGlLkoCJ0S2uJry+d3gj0Bn
         08wQqZJ1EAUJjg1TRhmj/dM6xPTL9+eq/1GlT+4iP1QTgFXnegGaMeP6kw/YDk6qaCJ0
         nUwDZTcdffuFB4axFWU45pyJI+LfCmaeyw8ToQNSdJnotrtC7t4DMrHv2J+GFgKdkBF5
         5z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933729; x=1788538529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCkwaqt6mT/Mgi3LcK6pYptNejEWdk/2Ric0vWmObaI=;
        b=JvDRNTpwBFimuc4XKuOGxnH5xceze5D3QgCIgKmffp5PHO4UkX6tWbRZ8V6+3Pl6oM
         lUhlaHgJvOeLI9hecl5pBEeiywL8+aFJHZEhSoUh8HgNd9ryXM+9m73gXYHxrmdz3jTR
         3QDCpTUPgmZt3qPiukkaPySJvq1MYOlcPmNDKX/O0W1Fuyv3Y1z3sAS0/RDCtKA0XLTH
         XzGUWEvnqZihUW1hYMLSveA6xVQIytrK5GK4MmalnNZXRs3Z/SoOAraX/NxlZw052l1w
         66ZsHZFLcL7Mc3qekh182jJapZ1f7v9xgfP4uANy0jpLlOImRkToFRem4bnAktq7gqfl
         uczQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Lpr1B6DD1CmGsxK449SJgUeQ3pQ0L8ZwFD/8TiJDYU/4Yfyj5LDLkZPvAl/qJVUwq11EbDUkEwTGYqb0@lists.linux.dev
X-Gm-Message-State: AFuF++lgTSiVCMSvwfsm+UyqVfOeUzgNY9COPCvnqKB8fuGvx8maWpNA
	6EPUqaAcl0HxBbgp68zBMYGPv5GN8NZO/nZt+vN6sEzRVeLYJKrF+shi
X-Gm-Gg: AR+sD12I1y+9CIUl535wMi+ZaPIbIBeRqA8E1UAo3QiGW7RxUO0IkKd8tgpVwfoDPSe
	2t+1Ry3XOjvoAlrJWtozi27r+ohut3e60gv4Ecsefx6qMMnHA5H9e5K9397yzhUI6KM9tQTkxci
	MjwJSfWQcK3YAFLR+zsZx3se63lEusssOZCXgnuZEPJERnGwlOlkMPFRSnxO112qjF3Yv7+hPd6
	gFUH537+HAXdah0LNCUCX7/Wp7NeK0Z41/0IY4HR8B0UpsX16M0+Y+VVG9xMBryjnMvgmfTSzXs
	guoCDiihA4RQl47cF4TLTT/coO5N2pMRdz2thfyFt+lV8KOsmiS9KT6u/IcOX977WIbhI4Uy/WZ
	hkZ78jr3jVjKS+KSlfSonDg2pFNjTlUxE1OEJi2wM+f0QjE67AoayKIigIfnzTXjw55g8X+8mou
	dCoZrRcZnjJPx6UL29nMBpN1uCdQvUHtTIPufm0b8d4OKqvuxJOPBeHQj8f13fBw0PXUqG3puIf
	t2XtcOyFqtADKx70dxDojqEeUv91durO3G2RsY5YA==
X-Received: by 2002:a5d:5d05:0:b0:482:e6ec:4ee9 with SMTP id ffacd0b85a97d-482f79947cfmr13628325f8f.7.1787933728667;
        Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
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
Subject: [PATCH v4 12/15] media: ov2740: add manual white balance controls
Date: Fri, 28 Aug 2026 18:14:54 +0200
Message-ID: <a34bb1a2647d85de407b4c93627981ef0577cc75.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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
index c67fcbad5bdb..c7f85c47bbd7 100644
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
@@ -694,35 +697,41 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
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
@@ -763,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;
 
 	case V4L2_CID_EXPOSURE:
@@ -804,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -839,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
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

