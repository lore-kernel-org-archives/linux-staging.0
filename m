Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8D448B9E
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199295; cv=none; b=PO2e8DPkEUenHxaaV/a9d98AjrFSBnKLqlRrHM1l8pCF3eRHCteLKHCvr9KqhDQKZHA7Lz+f4hxZQmhfG9ZqH6vudjuM+V6vVZrv7hOlAplTvr9LDq1utj2RP2KAKChZZ2nUGQNaXWHExR2hkmOtou9779K2RD++eaCh80cbdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199295; c=relaxed/simple;
	bh=oLflI2lIWaedlQfh7py6if9FMg6ErqlHPns57DR1I38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DW5qjB9WZaPGZ+vKP/8Lpvb9pWTE0kos+Tj9h8L1FR1sXnYlmJ39EIz80Jd5MxkXEVnOSVwvFzUvEeH/Rf/Ve7pl5v59Pr9vWkeX0aKV/QGIMmsCntTBD809H95j5WvI3QlJ4pek6O5kwzkJxT17ASokJQsekY06eegjwtGw9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbFByIgB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbFByIgB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso53450065e9.2
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199292; x=1788804092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MemavacMmy8dnLfi03Bks7Tye/ONeVO/Ogj/0TC3Kco=;
        b=hbFByIgBtNu24bzAxPlK+3I3mByIBdQlfIjV5KkTq+1h6/vSg3rgnxkzKjv2021YLJ
         t1WMWvOUr8LOpqIpn28PaPbN5A0WVgSkUpOgWuLLjMUBEEwQHKAV6oRp6Er0WSr4GvWM
         8a605rtov6e9+NWtMJd1+NpY3zt5BSetEmCE8/NZHdEqmGhsSrEMazXTN3oteQJOyI3S
         W78bbj1NWG+RqSh2BxaRS1NTUoEqsCv7EahB6pqoxCJ/mee74DoNLE7b50ecbbq9b4Kh
         Z6mvBWg+OT/cCxRf5qnyZubLgoK0aT6LnCrA1OoHtZyP5UmmlcEwRqKMPYd8NDFfldya
         Mx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199292; x=1788804092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MemavacMmy8dnLfi03Bks7Tye/ONeVO/Ogj/0TC3Kco=;
        b=Z3Ldu1YarCsPbPs258GFsqoAsQGc4lYscmSHAvqd3869eYgcMawYliR9nSjje7Jmr9
         zepMvKT9Z9o2yT3V0t6bfy1UPjVyepFdyijyyvtXvWVCdP4dnz/pL6iMiMDJIypJCPRo
         8c0FRTqRq4SCm7ICLCg5cJzlGqzxmDiCZmqjhGPKPyCTunyoP7XczdjS2s0YvHivMEfk
         BBiGiNY/Pfokgyzmj4AV/dqt3fLTPacvAdv0TnDkxXzUIuc1wMupYPK2bLz/XzVw+0HX
         IwlgzswbqzxT/PSNEo0HR8+bkWgR2QeoYaxsyog9cn1VrUX+URbgHbplAODPtvDxvNgT
         WO6w==
X-Forwarded-Encrypted: i=1; AHgh+RpN0gCvl8CU5L4ejitxcnDgM+aeIAqIfpcOOgd1CL72RwDAZ+erhAotpF2YnXh8vFeGU1Tb/TrFd06VPvpl@lists.linux.dev
X-Gm-Message-State: AFuF++k8kdO+KXFXL8qwLqDNSVGPhNdJLXqRjfDiKZ9N3WaXx9mpMDDg
	p599sBqRFP4J2rsF2YnNHF86LafIHL5deNOV6t43Z258kOjjtkw87OAPZewxdFVbWIk=
X-Gm-Gg: AR+sD10Y7gKChNtUlM1pQcGxjo+/TSkYyhhuj8pe0bvHDqW5wamq0J25/msIaZ4MALl
	4ksTVTrhLmiLVUHSuKgJ3arqPVyqsfx4WMoUx42yXzL9dXdq1WnaiqH8h38DGL0xvVUba5eqOEw
	Q0i1BZZ/q/BmkW4bn2Wytw4hCj+hleAzPJpr9p/P/8NJL24n1KlFphvOiEgaZ6sPKItUxOWZsZN
	8R4HcDmoapEHxjS5a1sc455yMPGzEIzPdVXkEck2EH5x02F3qaO/G4QRf2beXF3JvHShslufCrH
	umZSQf5RgIQaIDhim58oQCvnbICY9GZ9HWruJu2N9rDxR37XPNrobB9M1VkIkW0PlmYYr8sKv5k
	81/88c70lpDqexLg7gPOVoEqEdRdZBnlFzcapltn1i+tu3R5djelqYUwtLLwKBwwty9x01eV6+w
	BxkeHBsoME/pc4cAOe0q9Fyvc3itPB7TVCum75szD31wg9iM4k8cXzHO8wreDYSKGvaRk5Hd0bG
	rO4bko98maWXWeN3KMtA+RuCI13qVPVG7qwZeJWwqs=
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr494023035e9.5.1788199291582;
        Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
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
Subject: [PATCH v5 13/16] media: ov2740: add manual white balance controls
Date: Mon, 31 Aug 2026 20:00:58 +0200
Message-ID: <20260831180101.3109854-14-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

