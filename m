Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E583C28C874
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364909; cv=none; b=uaPSykSVyJ/z0/EZzBVkzgqI8XBqQiBVtV5Z0oSwF0AfJN+5PIYq0LcIn+jvoQu7RoNd2SvYdq5GmxXCPx+TtPBxQ1NH3uDHfrbVuWijqicYZshoi+y5sARTyBn1yJTfQM7UVHLJwrDpSSjA6ANLCZTaMYkkoh8iFQDIKdIPN+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364909; c=relaxed/simple;
	bh=8RLalehrPbI0nVV069+gt8p26w3tCNH5+ujATmPll/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Io6JpmJSoEdq4HPtsat7EOCgp2Upse63Mg79ieqPWgwAzhcwny76DUVFLS+HMocPxtcIB/i8b6QZsScpaygtRS7eTM9uYkZowen4teuXrxOFnP08Caps1SCI99FbWXmzl4j0HY17uk9aI0XWwnN8crZksQ6N9576Om797AN2KKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HTQAFEjm; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HTQAFEjm"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-375eff817a3so41582081fa.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=HTQAFEjmYex4PkoeZ6ONl61cb0hs1/d9ZvCMY/HfPGuwiLGMCWF7Ohc9cdPODXUa7w
         ta/gBGNmg/WFjMUYml/v8qCC2zHUaLCFv1PuzpI9ceYprD4gHk9L4pzMJjSwSKqaWAas
         OTCL49IipZ6ZUZ2got+GYn+aj7C9YRdUjXubM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSJdC/O4+ZsAqBeRWK64BAxaBhpHQ02dQ2HoRNMjbAI=;
        b=bvU+uLZ1S/Nu0jOFcYCFTTlaweE/sJFDwVP4019pGGpMuAmlAhP8lL7Gar0YLsUi1T
         Nc7pJmZYQEdKmGsQFEOBYt4ADaQcNCT7xJJ3zVs2RX/XVa1DFBuzmKcK4HvKuOwv4d7T
         HK6op9cKWKGj8CDa+u46+ERmjVXHakg49tus8VXIgJiiSwQtPtK7uJry5xBbdBBxkkMa
         ISVG4GHwtMKJMTNc7Z+ElTI2lRxSl7hP88e3g4hVUUZQE6+5KrRakD0GZstQcrc9drY3
         iK5/ShA5SeYsS1ZgZv3WkE/CRvAMpLkPdRw/4nkNjrLL1fw2ufnMTVZm7COnw472Dntm
         j1+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0BJOY1xOVUAzw4XAHdmcZtzo+h9jFjqVyGoloR2nLZkwcMLnOotnwMy3ZBc4x1wenp3ilb3yomPkw73Jw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1I8YI8kk/2LppzaNEgUfgPPvPFN8FKv5pKD5dbgEfjEBRck2P
	cJ2DxqVoGmL5C73OS7i6+dPTYQkgcabxx2cm1YSHA2srh/aTWCLLRynlkYFnz/py1g==
X-Gm-Gg: ASbGnctu/3dfm9fSjV+kfWa2IxIDum1g6zdVLHKKk3T+Pbxv1SFg6Y6i34QEu3+5C/D
	uT9Hj2uvZaiY3SBOABJVAR9/83fuS2pRBCWBYpL//zQ7c2SrMwYikwFVfo5Gl6IZni2LXNLxl1I
	+h2cIaoTbDkcIu48sxf8ODX2PWxUUabKJHZt6cTcUwBLdzAEHPSQlJzzP7IIM0WqUbfKqPF9GDc
	RQX4XFHOGX6BnzmzKoC8D9DXbmTf84CQOqjF02vngtgi2Ky+SWJYSkZH4fAUzUQkDgR9PLxnMBX
	cw9VSqcQaN6aiglLZRw/IOI9h2wlTqy5dkjpNjPNd8hSqBsAqAMRk0ekQO/0vB5XN/7YeuupskQ
	eAiMgCZS/fwX36101G8FvuL3q8N992QMvasuReNSu/SEAH9Ms0pJSCCGo0t351Jad6aDS9fsYKn
	k1MBr+mmp4l0df4KoGjZnTg6lg67d87feyZsdfeY0=
X-Google-Smtp-Source: AGHT+IHaXYtEGcC0lCeqZAPaJ1Eba36sEUnGMYsHL1RWVLLcW4i0NjVadIfSh/QN3FLm+/VJwSwBng==
X-Received: by 2002:a05:651c:3617:b0:36d:501:76d8 with SMTP id 38308e7fff4ca-37609e5e0b9mr54139201fa.31.1760364901230;
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:00 +0000
Subject: [PATCH 20/32] media: i2c: st-mipid02: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-20-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./i2c/st-mipid02.c:751:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 41ae25b0911f02517f137d6b5307d13154266e07..4675181af5fb00df837c8b796fc32d50e077a480 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -747,8 +747,8 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	of_node_put(ep_node);
 
 	if (IS_ERR(asd)) {
-		dev_err(&client->dev, "fail to register asd to notifier %ld",
-			PTR_ERR(asd));
+		dev_err(&client->dev, "fail to register asd to notifier %pe",
+			asd);
 		return PTR_ERR(asd);
 	}
 	bridge->notifier.ops = &mipid02_notifier_ops;

-- 
2.51.0.760.g7b8bcc2412-goog

