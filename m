Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1C1A01DE
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697924; cv=none; b=Y6rlpzeWFYjR1X3kx6TqDJXvLc3LEJUnDDmG9VSs4FQTfVMpaiG/XphE1CyO4gamVtXO4PcitPHyAZ/4lddWYTrh2L+ybsfhu+Gf8BIL9c4hGqw0QybNAvanWkJIHKCAobBgzS5pI9qORM8abN6ChhkIc7T0tHHblU9fGJyb5CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697924; c=relaxed/simple;
	bh=r/6qUwtilPc6aiGRZZVb8lZs3Le7IbP8kJgI2X5FyiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l5f2wIKDf4ZuN84Uc3cQV02PK80SllKBNnp5fMNXLtviuX8rn/mhof0QZsvhxBwtddl+QSKR2H9ffl0TXe0RP0lUwvrsSwkp2UU9ozCCC4mC4BRfa3wxUn9FXSMkpxuVxLQoo/nf4v9NlqfAjREhX5jFZ+zr2J8DTyzuEPujhY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PiaUP7B/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PiaUP7B/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb2dffcdbbso37875536d6.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697921; x=1728302721; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JU7U+YsXwNUN3GXi+lZlabPGhAkg1lZuiKZFCmpVa4Q=;
        b=PiaUP7B/WD80DPEFcMFLdPYamaOQfsZKZ4nVxDh1CPY3ME5iq4NAZZOfjJ5x4M3onE
         cTv5ymS2w6DZpQFKGgnJcp+hxCJ7fRQmkrb5iw4hVC6ZGBV3xly7ks8PsGdY+E1Lu4XC
         R2wesu/rcmOUnC/HyFDaOb+/BIcArIDij4ssM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697921; x=1728302721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU7U+YsXwNUN3GXi+lZlabPGhAkg1lZuiKZFCmpVa4Q=;
        b=Q84w4n9he5iSWVUXyETEKNSLQY5fu4XNOcvfASpSbFGPz8FksP6a47PWJhEAuDumoJ
         NwkwYjUKyKdVD03tBEM1T6PggOybpu4Hu4nOXXaU1IF80/IZQjVqTkqaXeBaKO3hNVtH
         IW/bXwBFUIwMHp3hrziCiOfplc6XHADwXDivd3tlt2bOfw+9iDStFxjLqPhLPPXgXi2S
         pXL0e5yAz7oMDs0Udz/8KFQioLRnYRyFVP6yzWDBrSRKBjL1YQ24TAomU5qTXzL6bhoG
         6Em2fX86IrXYSjd0Ai/V3fBz+xyzxUjdyjTK+c963/P1fpT61LNVkCSDUbXJZswD6Syu
         irnA==
X-Forwarded-Encrypted: i=1; AJvYcCXiDdfE30MQ+KAmjOSJawI6Av2S82U1pG2fYrudHrT1AuSy83iB5ZGSIcbmrgwTKFWFsTYlc6HE4AHoo/k9@lists.linux.dev
X-Gm-Message-State: AOJu0YzXLLn2//HphedfTnHTALnPQ1sMe13C50LaLsYOcaHJ5rZu46eS
	zamRVW7DTBg9EBf0JvQO8zR2PXs2oUt1lecC4uL7EYSkfPucXOgV3w/vzKAzVg==
X-Google-Smtp-Source: AGHT+IFo7OOUc+eOD+KctwzfWQcOtVnWKBIl/eyXC/k7ALK2/LWIOZekEy/aM6hhFvO+98exx2mm7Q==
X-Received: by 2002:a05:6214:310a:b0:6cb:52c9:b91e with SMTP id 6a1803df08f44-6cb52c9bbcbmr87563466d6.35.1727697921599;
        Mon, 30 Sep 2024 05:05:21 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:35 +0000
Subject: [PATCH 40/45] media: i2c: saa7127: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-40-81e137456ce0@chromium.org>
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
drivers/media/i2c/saa7127.c:678:33-49: opportunity for str_enabled_disabled(state -> cc_enable)
drivers/media/i2c/saa7127.c:677:33-50: opportunity for str_enabled_disabled(state -> vps_enable)
drivers/media/i2c/saa7127.c:379:19-25: opportunity for str_on_off(enable)
drivers/media/i2c/saa7127.c:346:49-55: opportunity for str_on_off(enable)
drivers/media/i2c/saa7127.c:430:42-48: opportunity for str_on_off(enable)
drivers/media/i2c/saa7127.c:405:42-48: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa7127.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/saa7127.c b/drivers/media/i2c/saa7127.c
index 818ed19cf37b..1ea5e4b9019d 100644
--- a/drivers/media/i2c/saa7127.c
+++ b/drivers/media/i2c/saa7127.c
@@ -343,7 +343,8 @@ static int saa7127_set_vps(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 0 || data->line != 16))
 		return -EINVAL;
 	if (state->vps_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn VPS Signal %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn VPS Signal %s\n",
+			 str_on_off(enable));
 		saa7127_write(sd, 0x54, enable << 7);
 		state->vps_enable = enable;
 	}
@@ -376,7 +377,7 @@ static int saa7127_set_cc(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_d
 		return -EINVAL;
 	if (state->cc_enable != enable) {
 		v4l2_dbg(1, debug, sd,
-			"Turn CC %s\n", enable ? "on" : "off");
+			"Turn CC %s\n", str_on_off(enable));
 		saa7127_write(sd, SAA7127_REG_CLOSED_CAPTION,
 			(state->xds_enable << 7) | (enable << 6) | 0x11);
 		state->cc_enable = enable;
@@ -402,7 +403,7 @@ static int saa7127_set_xds(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 1 || data->line != 21))
 		return -EINVAL;
 	if (state->xds_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn XDS %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn XDS %s\n", str_on_off(enable));
 		saa7127_write(sd, SAA7127_REG_CLOSED_CAPTION,
 				(enable << 7) | (state->cc_enable << 6) | 0x11);
 		state->xds_enable = enable;
@@ -427,7 +428,7 @@ static int saa7127_set_wss(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 0 || data->line != 23))
 		return -EINVAL;
 	if (state->wss_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn WSS %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn WSS %s\n", str_on_off(enable));
 		saa7127_write(sd, 0x27, enable << 7);
 		state->wss_enable = enable;
 	}
@@ -674,8 +675,10 @@ static int saa7127_log_status(struct v4l2_subdev *sd)
 			output_strs[state->output_type] : "disabled");
 	v4l2_info(sd, "WSS:      %s\n", state->wss_enable ?
 			wss_strs[state->wss_mode] : "disabled");
-	v4l2_info(sd, "VPS:      %s\n", state->vps_enable ? "enabled" : "disabled");
-	v4l2_info(sd, "CC:       %s\n", state->cc_enable ? "enabled" : "disabled");
+	v4l2_info(sd, "VPS:      %s\n",
+		  str_enabled_disabled(state->vps_enable));
+	v4l2_info(sd, "CC:       %s\n",
+		  str_enabled_disabled(state->cc_enable));
 	return 0;
 }
 

-- 
2.46.1.824.gd892dcdcdd-goog

