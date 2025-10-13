Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F113081A7
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364909; cv=none; b=m98pYR61cJUh2IzD3Z3+ogJS7AYHeO0jFkIoGbnHkSR01yYMIOrq4JcbnMkkD8c37DMvLUzSEueZsegFN/4kkWBf2u2BSRg8y8En1e/VmKzfF6y22cj8ZQJBjUJuFgzPn3WGuQVzjKZbEgTzcM20/wv2iPtnVEnGcSJx3m3N+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364909; c=relaxed/simple;
	bh=WDrjkEkP4ilF+TE+CToBnzSz7Z1VpjDMiO15zLgsPrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOVjYTTSvz7rfYBMg6CpQ6y6Tu9mvYPliafIAojXBAOw/J5Qpzw1FncymI7o4q5OWO1CAbmyCuFNVRkHVpOgwfOg+ATplaCAm6uGf6TZgFD7tyVTsqDaHRFpKOumuYqGcsoA8zp1kJoz0SZdGNCmbIqJ4HP+5axKb61Q6JM5HTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mTzl1hUY; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mTzl1hUY"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711505e87.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364896; x=1760969696; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=mTzl1hUY6nAbukQoLukfzGIbp/hkK16QlT7eHPtpk7+w6BDQSrJ5WqM1dVa6/n/u63
         cislNEUtDBrxMN2SoB030X4NTbnTXeOl4WuNcoU0bCKjuq7cZ3SrQKM3B36iwgvmZF/D
         BMWRjZS6Pa7kE8SbM99hlfyoEXyIWvlQ0Xctk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364896; x=1760969696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxwItL4tz8pq3Mzmh9A8flAtdwuQ+oH3jrE+Iyzt0C8=;
        b=cYPy6wCZxKckAbL045NOb+7Aq+ZNvQ4K5TFHqfSGHeKUiTN/wTi25wahF0ibYEHUCf
         oCcd3BgIBBeJU4/Dv9iY1oyBP9KBKIyoJipkRR2pAnCxMhBJSkqGJ1qnzZvuFy4C4xmE
         8d/dMbWivz2PDXZpeeqVL71e9K6OOIs8Mm7UVb3V+4IMvFGJPSTuXaEtsm8eUYXRCXFi
         0NNBFGvcEaMcRP+1wlQ4gJSUm3KQUd/ItR//fvD6HH5lKiIaVglbZQnIprFfI6dmy9aX
         ffsoZPbPp9anGBRlld1QWlGqzwCsR7LnlJfyEEL255klvtcJ49jEwDpOJfvz6GoQiZNb
         jJWg==
X-Forwarded-Encrypted: i=1; AJvYcCXvPylRbXDZxB6ZyKSKq4VngcfaTomSW7xKL4MyEpAKBxTz31nCtjx1gDz2WovQyCwI0WCLlIjIfzdnZu1I@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5Iw+TfmM6W9z4d15w72+1Wr/BX4cXA3aOqc9sogXDzKL1ddH8
	K8gWg6tBhsuQqdR00Eg5i1jWCH+sIuLZYzHk/ABUIHIMqIvbWtVzsq8YGuoHvBx+Rg==
X-Gm-Gg: ASbGnct5PBvGzGx1pVTwkvuFEtzO8E1tz+KX9ZXEmYEiOQog4Xn3o4pg/ZO1NJYDUqA
	gkqtuDrGeLSZ9v+UCHj0irt7p+cGYgdtTdU6rL5379BAdqc8N+jQX7K/veNJH2PQ78eBubY0IHR
	BmvhWpeD7W8sHRRTE7cu6Wj5QKmoSiDJoAEfVbqVFL0Oycy14jFvea4z57I7pnIN8KQPvf8uIc5
	CLRTwTjhXXGW85Cdosscz0GDbDCv8Wkfz4zbYAip5hvYWTM397mVj9fm52JjdMTbxjL+ecUv0+x
	KVNkTDYSonHhnGrD1qkBfPZci1TkBqD82wSGs2jO+iioBp4xtP3J6fs94VkSuKtXxdpaghWzaEk
	Hx1voDQ24emtocuTEiGY8SZFVAJacR4WHxPIHvGOv7yNod8zieROGf3IyzBrW8IKFk6CNLbQss6
	WpU0aOkZ/YzbHjmqOtSQ==
X-Google-Smtp-Source: AGHT+IHRStcb5/UNrBSpVyOQrSmM6wvY4Sq5I8E4EibgafKAtbziLGF8qFxpeqrq8sYvK0QOKhdKZw==
X-Received: by 2002:a05:6512:308d:b0:579:ec3a:ada2 with SMTP id 2adb3069b0e04-5906d7738b2mr6908772e87.4.1760364895693;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:50 +0000
Subject: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org>
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
./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
 						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
-		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx335->reset_gpio));
+		dev_err(imx335->dev, "failed to get reset gpio %pe\n",
+			imx335->reset_gpio);
 		return PTR_ERR(imx335->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

