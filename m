Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945652F83BA
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364914; cv=none; b=cggRPBaSRfQtNc7YSDkhmaOdujiN70Ug70tdN8aFSzWD93LukLkR5hNO1Kuun5qvfjVwzd1s3rjkEWjfFLLMWQBmGbevLYrb3uNTj74dFLYn4JdyvH2qNykuYVmpAgjYpUKuGfve/LEjyorzYf9LEYv6PrTdkldTOvXY3D7VMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364914; c=relaxed/simple;
	bh=Pzzu7GhYxyifz0hH0hqoTi5DPNxH7bOKzjeCFjKc3co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ijva2a1pmzJk3LvMkqfTX/Ktqgjzw9oYsYts1ZlQ4AV2wl6iFlAcHgQKOS6PGxAMnkoqSJXr3HtRd76P5ZUf0WEO+iej5HQ63kbgHHs8JtdvI4uwVNwLXMZzy74+Yk17S/xsxu8My/AoGyG/3ZqjHOd2VCgMimJdmqSlzL9PM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hHG69T3G; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hHG69T3G"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390346e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364901; x=1760969701; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQZvCnP1P0SuqiqaQUtwVRm3JfcVlv6UnYBLGV8/TWE=;
        b=hHG69T3GQmce+Aweb4IcfpXc0eeYOBVLkFruWil4AaRk6OoWJejuCXD0UVPBs2uIom
         8QfvmuNHrxhc/D16QEC0f/CHEA1J/peR9LPPSlVMnHfjd3DgACpirXvjFBWXs6AQYLOt
         IIBtU3DhgunSVn9MeT6vSUJdcS8zWkUihldX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364901; x=1760969701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQZvCnP1P0SuqiqaQUtwVRm3JfcVlv6UnYBLGV8/TWE=;
        b=JKrMU/Eq2O9yKkZycLBJvhFlI92XNUUId9Vdz/0DyTLn8dfxAmBId+FcrWfP3CSeIs
         7kfr0Z4sV1ggHzU5JhkV3FCQxbt/Yv5VJX3jt1KHgmcqlHVL2k4iAvhak1BJwXLSXBaa
         YX1MzcnFtZVgfl1kzJE1joljemsdrnzbKnrB4zVDSMoNYZnA9+NaIfeYlgqEDDs8WNpB
         pgnVZKpSZDkS4zDvxEGFuWCDWyJHJR+9Wg+FaLIGjMBI7g/Ut0sMns7WeAJRbFCfebZ6
         knGWUkLDWT3M96807oyF2oXWKkNOOXKwmghMNshfp+txiXy8jfMbkeuWTmF//YlLaNiK
         7cZg==
X-Forwarded-Encrypted: i=1; AJvYcCX+lUDG6rxaNlaHaqGNsHTRUt+ZtijKZqkfWt0FJjCGpx27RXHcUcaSvTrKnELh/1Pis8q67XiHB4Z5TuvR@lists.linux.dev
X-Gm-Message-State: AOJu0YxnxVjZcBPEFEbJstGgqGy+TV7+Xoh+9FepuaXMCIKOF5WA/Y9m
	5vucBt1Osc5JkUgiE8DGpsk4rf4x54Lt7h4L/vZbL8rQwo8+/fAChJPn9E/i8ktY3A==
X-Gm-Gg: ASbGnctHpd9yml4wCUbl+Lec18uZTd5XALH6iUlGBM29Fv6afxcc1K2NFTVQUM8LzNF
	nDGPfdjfkYgwxP1VoU97QcPOV3SGAL0gjObLFr2nN8ns7zxhFPtR2AtoTIGFUIXq3/g3UnKrf7X
	bzda3iCBqXlfD9Gey7ss0knY3QTqheaB4bkMdTCzLD449DbraYchZgzFAitcbwjI9yAdBESzoQT
	ASbdW0scbT47dtxe4o5ofjvasqmCyATQqOwhURg5LAzx/U5ZKXvurghb9KYDkXVSzMMb/VvzFx9
	+MnbefDcc98RvglxCvBKMe1Xj0VywjJf6++qzBEeq2Jn/5XPHu/Nwny4arnpGpPrup/B9/kilNb
	AfhGLZ57dXAyheNagcAjkF4vUS2G0iCqSw/yfPSryepewFXLGK67kk+BZ6uT2Si1G6zKY3Dxvxn
	WrlHJk9ZIFLJ8M9gGJbzFzild5qWSs
X-Google-Smtp-Source: AGHT+IHp8qUEbZiZFjcq8gL768jxh7/txPc1OJzdAQ1KXrMavPh6zmcAuzYCqI5NGEMHZ2sFOcmEXw==
X-Received: by 2002:a05:6512:a90:b0:55f:6759:a792 with SMTP id 2adb3069b0e04-5906d8ed836mr5438343e87.34.1760364900643;
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:59 +0000
Subject: [PATCH 19/32] media: rj54n1cb0c: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-19-2c5efbd82952@chromium.org>
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
./i2c/rj54n1cb0c.c:1361:4-11: WARNING: Consider using %pe to print PTR_ERR()
./i2c/rj54n1cb0c.c:1370:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/rj54n1cb0c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index 6dfc912168510fb1bd308f834911f9de705844b7..e95342d706c39a853e8c18de1ce447a5fa508565 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1357,8 +1357,8 @@ static int rj54n1_probe(struct i2c_client *client)
 	rj54n1->pwup_gpio = gpiod_get_optional(&client->dev, "powerup",
 					       GPIOD_OUT_LOW);
 	if (IS_ERR(rj54n1->pwup_gpio)) {
-		dev_info(&client->dev, "Unable to get GPIO \"powerup\": %ld\n",
-			 PTR_ERR(rj54n1->pwup_gpio));
+		dev_info(&client->dev, "Unable to get GPIO \"powerup\": %pe\n",
+			 rj54n1->pwup_gpio);
 		ret = PTR_ERR(rj54n1->pwup_gpio);
 		goto err_clk_put;
 	}
@@ -1366,8 +1366,8 @@ static int rj54n1_probe(struct i2c_client *client)
 	rj54n1->enable_gpio = gpiod_get_optional(&client->dev, "enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(rj54n1->enable_gpio)) {
-		dev_info(&client->dev, "Unable to get GPIO \"enable\": %ld\n",
-			 PTR_ERR(rj54n1->enable_gpio));
+		dev_info(&client->dev, "Unable to get GPIO \"enable\": %pe\n",
+			 rj54n1->enable_gpio);
 		ret = PTR_ERR(rj54n1->enable_gpio);
 		goto err_gpio_put;
 	}

-- 
2.51.0.760.g7b8bcc2412-goog

