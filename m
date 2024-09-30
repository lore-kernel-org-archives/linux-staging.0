Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C719F10E
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697916; cv=none; b=PaEVnlLRhu1/Ff4jW1mxFZhgeFCjNnGwyWVIeoK+vcQ7d6VK8Xc8c0LUsoYcHVezxjVp5sctzfhB8jwhRGUvucy8jP1LHjkRjXoR05LUkv94zMo7FFEQ29JkttRFQ+OgujZGmWAy5k0kPYtllIR+GWJUrGCdpmu7RJdZs7d4h24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697916; c=relaxed/simple;
	bh=3h1xLkczeXS4EF70Q4dOKgJowO9hqNEwbJIxu3+uvHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9qb3beNjFVFsemxAeqibgvoiBiD9BTIQIYDeweM7pMs5PqJW6xxjVyGwIDwwXI470iNPNuwM7hTPl+wdfHmzpXLCtBJ30qe4SIzluWj3Xtu7QDnqj+DL1WXi25gR0tzpNQzsFWPEiTF3dgFydmwPGfTotJWmwDa/FnvBTAUJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fdjJbNAm; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fdjJbNAm"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb3ba0a9a2so24004456d6.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697914; x=1728302714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27WoLnk5gPTNJ0m2rtIWHwrzMjQJ4zxEXFjS8vXg2Uk=;
        b=fdjJbNAmOc7TAibTQhFmChev3S8Ozks843DlWt4jB0EDDGqTs4zDjBjYLwxuyl+i+p
         Ckh55Laz1Zp1DGJouGPtsZiVFLAf9flo8/8kMEqQcbDDw4MEx33dXq62xq01LrGf50pV
         oI+SUcr9SGmU78+uTCtDaSt4N4rXoHwIO37wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697914; x=1728302714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27WoLnk5gPTNJ0m2rtIWHwrzMjQJ4zxEXFjS8vXg2Uk=;
        b=J0yFwfwJzFupMDiq4x054iYiLvfMKQi9dWUQkyovMt42PVGRVs/XfkYeZOj4Q48Mwh
         uqj1xJ1SWI4AjhaaMdG1cS3cLECT5zTIaoPFvl2JhC3gZ4Ze4AZuFY2kNV8lE8MeEBMV
         874nLe2e8CM1OnVxUY53aU75Ezy89TK4QlGOZRcHV+ulqF1em0mjzxED5C84MwNwGN71
         IshgLoXd+LBwN7l+uRwVaNfJ0bBo9iS0S3IFEZSb+XWogBydxUyZhTPqoisdeLhoEgIm
         qEkVA5t1dx+pqzjObQlKbv7KyflNkXxBylpScELb4LsZ2dQRw9Vqrf3mkJW3PUd6qMR4
         30gw==
X-Forwarded-Encrypted: i=1; AJvYcCUh0EEfXeLetwQXYjWKp8q2NzUaBhz64p3un3kN1DAUvnf6qM3OgCtwyE/od7nRRRfDEhv2UUc0XhQfa/IL@lists.linux.dev
X-Gm-Message-State: AOJu0YwUZEwQ5BYSxTVl/VkY5b/Ct3Gl5+FTqiRcVkHNKjrH3FRkJbZl
	SvxYq3c1ZGy28aX0E+7HkgnXzsZRaHyg0nT9ZCod4i6Aemz2RWKUmf/qESSupw==
X-Google-Smtp-Source: AGHT+IEmtR/kCt9kuVkbj7/r3Fqa0DixhR1uM5cl6xJKRSOoPA3YSLhx2F2SjU4khmzc/KfhSVtoIQ==
X-Received: by 2002:a05:6214:4a87:b0:6cb:6059:92a with SMTP id 6a1803df08f44-6cb60590d50mr62400906d6.10.1727697913781;
        Mon, 30 Sep 2024 05:05:13 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:30 +0000
Subject: [PATCH 35/45] media: i2c: tc358743: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-35-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/i2c/tc358743.c:370:46-52: opportunity for str_enable_disable(enable)
drivers/media/i2c/tc358743.c:1325:32-63: opportunity for str_on_off(hdmi_sys_status & MASK_S_AVMUTE)
drivers/media/i2c/tc358743.c:1264:35-54: opportunity for str_on_off(sysctl & MASK_SLEEP)
drivers/media/i2c/tc358743.c:1187:14-19: opportunity for str_yes_no(tx_5v)
drivers/media/i2c/tc358743.c:1266:3-33: opportunity for str_yes_no(hdmi_sys_status & MASK_S_DDC5V)
drivers/media/i2c/tc358743.c:1319:3-32: opportunity for str_yes_no(hdmi_sys_status & MASK_S_HDCP)
drivers/media/i2c/tc358743.c:1281:3-35: opportunity for str_yes_no(hdmi_sys_status & MASK_S_PHY_PLL)
drivers/media/i2c/tc358743.c:1283:3-36: opportunity for str_yes_no(hdmi_sys_status & MASK_S_PHY_SCDT)
drivers/media/i2c/tc358743.c:1279:3-32: opportunity for str_yes_no(hdmi_sys_status & MASK_S_SYNC)
drivers/media/i2c/tc358743.c:1277:3-32: opportunity for str_yes_no(hdmi_sys_status & MASK_S_TMDS)
drivers/media/i2c/tc358743.c:1274:3-37: opportunity for str_yes_no(( i2c_rd16 ( sd , CECEN ) & MASK_CECEN ))
drivers/media/i2c/tc358743.c:1309:3-42: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_HLT ))
drivers/media/i2c/tc358743.c:1306:3-44: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_RXACT ))
drivers/media/i2c/tc358743.c:1303:3-44: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_TXACT ))
drivers/media/i2c/tc358743.c:1300:3-44: opportunity for str_yes_no(( i2c_rd16 ( sd , CSI_STATUS ) & MASK_S_WSYNC ))
drivers/media/i2c/tc358743.c:1268:3-50: opportunity for str_yes_no(( i2c_rd8 ( sd , EDID_MODE ) & MASK_EDID_MODE_E_DDC ))
drivers/media/i2c/tc358743.c:1271:3-41: opportunity for str_yes_no(( i2c_rd8 ( sd , HPD_CTL ) & MASK_HPD_OUT0 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358743.c | 44 +++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 65d58ddf0287..f2e1e55ae190 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -367,8 +367,8 @@ static void tc358743_delayed_work_enable_hotplug(struct work_struct *work)
 
 static void tc358743_set_hdmi_hdcp(struct v4l2_subdev *sd, bool enable)
 {
-	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, enable ?
-				"enable" : "disable");
+	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__,
+		 str_enable_disable(enable));
 
 	if (enable) {
 		i2c_wr8_and_or(sd, HDCP_REG3, ~KEY_RD_CMD, KEY_RD_CMD);
@@ -1184,7 +1184,7 @@ static void tc358743_hdmi_sys_int_handler(struct v4l2_subdev *sd, bool *handled)
 		bool tx_5v = tx_5v_power_present(sd);
 
 		v4l2_dbg(1, debug, sd, "%s: Tx 5V power present: %s\n",
-				__func__, tx_5v ?  "yes" : "no");
+				__func__, str_yes_no(tx_5v));
 
 		if (tx_5v) {
 			tc358743_enable_edid(sd);
@@ -1261,26 +1261,24 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 			!!(sysctl & MASK_CECRST),
 			!!(sysctl & MASK_CTXRST),
 			!!(sysctl & MASK_HDMIRST));
-	v4l2_info(sd, "Sleep mode: %s\n", sysctl & MASK_SLEEP ? "on" : "off");
+	v4l2_info(sd, "Sleep mode: %s\n", str_on_off(sysctl & MASK_SLEEP));
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			hdmi_sys_status & MASK_S_DDC5V ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_DDC5V));
 	v4l2_info(sd, "DDC lines enabled: %s\n",
-			(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC));
 	v4l2_info(sd, "Hotplug enabled: %s\n",
-			(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0));
 	v4l2_info(sd, "CEC enabled: %s\n",
-			(i2c_rd16(sd, CECEN) & MASK_CECEN) ?  "yes" : "no");
+			str_yes_no(i2c_rd16(sd, CECEN) & MASK_CECEN));
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "TMDS signal detected: %s\n",
-			hdmi_sys_status & MASK_S_TMDS ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_TMDS));
 	v4l2_info(sd, "Stable sync signal: %s\n",
-			hdmi_sys_status & MASK_S_SYNC ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_SYNC));
 	v4l2_info(sd, "PHY PLL locked: %s\n",
-			hdmi_sys_status & MASK_S_PHY_PLL ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_PHY_PLL));
 	v4l2_info(sd, "PHY DE detected: %s\n",
-			hdmi_sys_status & MASK_S_PHY_SCDT ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_PHY_SCDT));
 
 	if (tc358743_get_detected_timings(sd, &timings)) {
 		v4l2_info(sd, "No video detected\n");
@@ -1297,17 +1295,13 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Lanes in use: %d\n",
 			state->csi_lanes_in_use);
 	v4l2_info(sd, "Waiting for particular sync signal: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC));
 	v4l2_info(sd, "Transmit mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT));
 	v4l2_info(sd, "Receive mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT));
 	v4l2_info(sd, "Stopped: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
-			"yes" : "no");
+			str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT));
 	v4l2_info(sd, "Color space: %s\n",
 			state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
 			"YCbCr 422 16-bit" :
@@ -1316,14 +1310,14 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
+			str_yes_no(hdmi_sys_status & MASK_S_HDCP));
 	v4l2_info(sd, "Input color space: %s %s range\n",
 			input_color_space[(vi_status3 & MASK_S_V_COLOR) >> 1],
 			(vi_status3 & MASK_LIMITED) ? "limited" : "full");
 	if (!is_hdmi(sd))
 		return 0;
-	v4l2_info(sd, "AV Mute: %s\n", hdmi_sys_status & MASK_S_AVMUTE ? "on" :
-			"off");
+	v4l2_info(sd, "AV Mute: %s\n",
+		  str_on_off(hdmi_sys_status & MASK_S_AVMUTE));
 	v4l2_info(sd, "Deep color mode: %d-bits per channel\n",
 			deep_color_mode[(i2c_rd8(sd, VI_STATUS1) &
 				MASK_S_DEEPCOLOR) >> 2]);

-- 
2.46.1.824.gd892dcdcdd-goog

