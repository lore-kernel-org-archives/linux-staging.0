Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472771A2540
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697930; cv=none; b=q43HVJASjRE3FCkMxUrWc8+J7bde7yRAx+rsVLzD8anvqUycWYG2WNK0JJGF9EbEQHV+G9gTeEyIOHqEcv/s5fiEXdUx75hKXpsJyXO9EM16569w9mr2OO7yoDx3uKClqQgtBzVauvPJMWizeQ95g+8bZoN8oCQJ+f647EtqnHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697930; c=relaxed/simple;
	bh=C1FeHCl55MtKfgHMCIuiQaToVMk1Xx41zJXxbZM8knw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btSnRxhKYx2Cxtrci9tv4U//L8ncEwr9r5O/SFFUJZgMAAwts8uTvkl/iwhK6W+KQlSeK+bhBH/5WK1TNceHKiY2buN654YPhMarFzXrjoIrNG2UKWwrh2URpJ2lR50GAbtEppBvDjANkabOTZQCbuS6M3kmH6DmOEyUUYaiy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nMH5zvlF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMH5zvlF"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cb2f272f8bso40068796d6.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697927; x=1728302727; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL1+Q9/ULYlU3CLmPIk9AVOdXWpb/NtMEppJq3PJtYk=;
        b=nMH5zvlFphz3ATCA6ReAitWzgbZ6TyRJCsewjbrp6mIfMwyycqiXwPfhmPyTtOkoJj
         pigy/wXwWHHRn6YJWVuQ5PjUnurciS1euyLrthC+6oWgUTWm4epaAsB7TbjuBPMU5jiH
         D5mf0iZpjVOtLiDXyo0MJAWMzyPvneC3vVpmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697927; x=1728302727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GL1+Q9/ULYlU3CLmPIk9AVOdXWpb/NtMEppJq3PJtYk=;
        b=uRE/utm70pWa3/qlP6rKVGbMP7cX1MuT/WMkMWtS9FyTudhUy/gFx3rHRNsGGIqzkR
         hQHvAFPjmx1sLgz/HMIibKtBKwo3/xTjawTH3+l3uiOiH6lczcdheHAJFoGXv6nYp5LE
         ReqHcHQKZ3waklb3K6u1rGIu5UmhYrl1PU6ddVT6QtKT15+v3e4HNLGZPmN2xbAvwZIX
         gopPiGTO7mLYPP2r7I0BPQdYv/6fMLfUyBn6QpmTmc9B5AhYYfnA4pAcUPb90YXemqEJ
         r6htmCh+RoYEH1XWaWzWAEVt5+PGzPbCWK6rU60YFE/s1kgyJSuBT4DDTw5UfNFh1wCi
         Wwvw==
X-Forwarded-Encrypted: i=1; AJvYcCUAcrdK8BOelQEf9xz7GF/8Sr2EjIWy41o0E1BJz6WtIanc7PIHWb8op8KwQvxsphB7UEafylLSt/PVU04o@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg/ADfjMe7dwuQM40jqcQf2MbiD0qmn/PAqlawpsapvxQamQZC
	gQKNYnt2UKurjqmuCTp5zrw9goDC25SSfGy8R2QYLSTCXSRGpR7dnCN2TYUDow==
X-Google-Smtp-Source: AGHT+IG/6are8ci6AYDSQshUu34zjFa2sn9Z7jhsZeKvJuNj89zUt3QMjrvn9kvAxF3Mp7T2iyMvYw==
X-Received: by 2002:a05:6214:5587:b0:6cb:3c08:30a0 with SMTP id 6a1803df08f44-6cb3c0830c5mr167635306d6.49.1727697927150;
        Mon, 30 Sep 2024 05:05:27 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:38 +0000
Subject: [PATCH 43/45] media: i2c: adv7842: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-43-81e137456ce0@chromium.org>
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
drivers/media/i2c/adv7842.c:2761:5-29: opportunity for str_true_false(io_read ( sd , 0x6f ) & 0x01)
drivers/media/i2c/adv7842.c:2754:5-29: opportunity for str_true_false(io_read ( sd , 0x6f ) & 0x02)
drivers/media/i2c/adv7842.c:2821:3-31: opportunity for str_true_false(( hdmi_read ( sd , 0x05 ) & 0x40 ))
drivers/media/i2c/adv7842.c:2763:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x01 ))
drivers/media/i2c/adv7842.c:2756:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x02 ))
drivers/media/i2c/adv7842.c:2765:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x10 ))
drivers/media/i2c/adv7842.c:2758:5-31: opportunity for str_true_false(( io_read ( sd , 0x6a ) & 0x20 ))
drivers/media/i2c/adv7842.c:2736:4-22: opportunity for str_enabled_disabled(reg_io_0x21 & 0x01)
drivers/media/i2c/adv7842.c:2735:4-22: opportunity for str_enabled_disabled(reg_io_0x21 & 0x02)
drivers/media/i2c/adv7842.c:2737:28-51: opportunity for str_enabled_disabled(state -> cec_enabled_adap)
drivers/media/i2c/adv7842.c:2812:4-24: opportunity for str_enabled_disabled(( reg_io_0x02 & 0x08 ))
drivers/media/i2c/adv7842.c:2679:3-30: opportunity for str_enabled_disabled(( sdp_read ( sd , 0x12 ) & 0x08 ))
drivers/media/i2c/adv7842.c:2730:4-52: opportunity for str_enabled_disabled(( ( reg_rep_0x7d & 0x04 ) && ( reg_rep_0x77 & 0x04 ) ))
drivers/media/i2c/adv7842.c:2732:4-52: opportunity for str_enabled_disabled(( ( reg_rep_0x7d & 0x08 ) && ( reg_rep_0x77 & 0x08 ) ))
drivers/media/i2c/adv7842.c:2768:5-33: opportunity for str_on_off(! ! ( cp_read ( sd , 0xff ) & 0x10 ))
drivers/media/i2c/adv7842.c:2843:3-31: opportunity for str_on_off(( hdmi_read ( sd , 0x04 ) & 0x40 ))
drivers/media/i2c/adv7842.c:2654:2-29: opportunity for str_on_off(( sdp_read ( sd , 0x56 ) & 0x01 ))
drivers/media/i2c/adv7842.c:2823:3-31: opportunity for str_yes_no(( hdmi_read ( sd , 0x04 ) & 0x20 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7842.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 014fc913225c..a43479c3ff03 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2651,7 +2651,7 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f);
 
 	v4l2_info(sd, "SDP: free run: %s\n",
-		(sdp_read(sd, 0x56) & 0x01) ? "on" : "off");
+		str_on_off(sdp_read(sd, 0x56) & 0x01));
 	v4l2_info(sd, "SDP: %s\n", sdp_signal_detected ?
 		"valid SD/PR signal detected" : "invalid/no signal");
 	if (sdp_signal_detected) {
@@ -2676,7 +2676,7 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "SDP: %s\n",
 			(sdp_read(sd, 0x57) & 0x08) ? "Interlaced" : "Progressive");
 		v4l2_info(sd, "SDP: deinterlacer %s\n",
-			(sdp_read(sd, 0x12) & 0x08) ? "enabled" : "disabled");
+			str_enabled_disabled(sdp_read(sd, 0x12) & 0x08));
 		v4l2_info(sd, "SDP: csc %s mode\n",
 			(sdp_io_read(sd, 0xe0) & 0x40) ? "auto" : "manual");
 	}
@@ -2727,15 +2727,13 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "HDMI/DVI-D port selected: %s\n",
 			state->hdmi_port_a ? "A" : "B");
 	v4l2_info(sd, "EDID A %s, B %s\n",
-		  ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
-		  "enabled" : "disabled",
-		  ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
-		  "enabled" : "disabled");
+		  str_enabled_disabled((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)),
+		  str_enabled_disabled((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)));
 	v4l2_info(sd, "HPD A %s, B %s\n",
-		  reg_io_0x21 & 0x02 ? "enabled" : "disabled",
-		  reg_io_0x21 & 0x01 ? "enabled" : "disabled");
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x21 & 0x02),
+		  str_enabled_disabled(reg_io_0x21 & 0x01));
+	v4l2_info(sd, "CEC: %s\n",
+		  str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		int i;
 
@@ -2751,21 +2749,21 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Signal status-----\n");
 	if (state->hdmi_port_a) {
 		v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			  io_read(sd, 0x6f) & 0x02 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x02));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x02) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x02));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x20) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x20));
 	} else {
 		v4l2_info(sd, "Cable detected (+5V power):%s\n",
-			  io_read(sd, 0x6f) & 0x01 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x01));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x01) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x01));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x10) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x10));
 	}
 	v4l2_info(sd, "CP free run: %s\n",
-		  (!!(cp_read(sd, 0xff) & 0x10) ? "on" : "off"));
+		  str_on_off(cp_read(sd, 0xff) & 0x10));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
 		  (io_read(sd, 0x01) & 0x70) >> 4);
@@ -2809,7 +2807,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 		  (reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
 		  (((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 			"(16-235)" : "(0-255)",
-		  (reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x02 & 0x08));
 	v4l2_info(sd, "Color space conversion: %s\n",
 		  csc_coeff_sel_rb[cp_read(sd, 0xf4) >> 4]);
 
@@ -2818,9 +2816,9 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			(hdmi_read(sd, 0x05) & 0x40) ? "true" : "false");
+			str_true_false(hdmi_read(sd, 0x05) & 0x40));
 	v4l2_info(sd, "HDCP keys read: %s%s\n",
-			(hdmi_read(sd, 0x04) & 0x20) ? "yes" : "no",
+			str_yes_no(hdmi_read(sd, 0x04) & 0x20),
 			(hdmi_read(sd, 0x04) & 0x10) ? "ERROR" : "");
 	if (!is_hdmi(sd))
 		return 0;
@@ -2840,7 +2838,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 			(hdmi_read(sd, 0x5e) << 8) +
 			hdmi_read(sd, 0x5f));
 	v4l2_info(sd, "AV Mute: %s\n",
-			(hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+			str_on_off(hdmi_read(sd, 0x04) & 0x40));
 	v4l2_info(sd, "Deep color mode: %s\n",
 			deep_color_mode_txt[hdmi_read(sd, 0x0b) >> 6]);
 

-- 
2.46.1.824.gd892dcdcdd-goog

