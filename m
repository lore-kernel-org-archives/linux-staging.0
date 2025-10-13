Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679903081B9
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364907; cv=none; b=OK3km62RX/0QdTRN9kS1nHmjDl1UkXdH7DWRBIkHvwNnh53gsUdJck5DB2PzQWPoFBXLYyv0iaT9MDQ6DwSJLvP0vb9hoAhRDc6HoLSkmXVwZZp65EKKyN/JmCoxma0lX8Tdi1eooG1ATXmYh5wR3GGwwGtCZSJOIos3OeYwgPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364907; c=relaxed/simple;
	bh=cjTbphg5ydQRNNF0zGsMKQ9PfRKUomJXS0y++m9uD5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qm1x7I6Sb7IIdNWEn96piAB8K8xw2vToKDHeE5pR57eVkJfFxtRlbcLCOFl04CpnkD8ix48x3BNXUFfvt7S7+sOsOZJFY0F1OMWLmW9tFEh2gupjCCcvLgN3L5BXvouUwhAIxvBFgDr0VKeoiqKgWBg5jEghJNiKSA7njd9CcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aNMUqAap; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aNMUqAap"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso4608772e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364897; x=1760969697; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gx2Nk8bbTBBYhN943GhcMzv342eYq6Mo/xpbKyZ7/rI=;
        b=aNMUqAapQlBoHPOH8ciuKo3OSn04UwCkS3hTmYbsP5N3AjwWx3WL0VRynKwP3lRweA
         yqgG+KzBagqzQNz0qNWzFK3oxveIzqtnopgNSKPm0IFilEcLW7lpViR8/67m+xlgHG4w
         2SA74I1xaZxWcWPRfl3dDtOWI1ioC+Of5k0do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364897; x=1760969697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx2Nk8bbTBBYhN943GhcMzv342eYq6Mo/xpbKyZ7/rI=;
        b=u9RvZyf1Hf7QFR0H3b9cafsiOReJ8ZXvTzXg2LEW1kplFTbTD/djtVcx18jUHkdSN1
         vvXgFcwMcmpFcDV0ezzCVtkkPg+Yrqm8uicR+3qpTzISM6Qq6cvTZbP2R3ZS0GogZBGU
         sILBKvZCpGt//CvRTd695c4TrQUWjVziEXPDDJ6mDtuDbEOFln2rJ4JVUOz4XRGoeGM3
         GUFYGJJ9p6dm9KGC9qAtK9Iu1Qke5SsCO7qoQpE7uNrrz0EF2xDVkqPny+k9N9tAiLwH
         YziGMchthOqKpzOG9WSckheSkcBqn6I/cHexOzh6DmHEVygAIZjZ8pl0l2AXhXQ8yw2J
         Cf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4rxy4Gpoquz8vWc1rraTZP7a1bhpFaJ8JP7LGPFoMZ1rDWxTQAfZqPyzpdhJ1zyJhTy1B0DjuFGQmWU7k@lists.linux.dev
X-Gm-Message-State: AOJu0YwbWqz+XbxCE1uhIiiQikPCAoCtIkMVFtcZIzqlyxhis03SWIzo
	uOSiJaJ140e6+XeQi9DyQmxEDLhxiiFi3UvvUs9aYWa/+B5KoZPe954nuORHs4e40g==
X-Gm-Gg: ASbGncuvkxyvMGmSJa9+8Onh9spDa+j3oMv10YQlY2GBBOtw5itXwGqozSw2cJ9KSoV
	mmHFKnC38JOtlyLx7p9KfVWdizMnIaT7mgjVUuVvcAyx1+/8eKkgWPQ8jASW1Scfv2BbAlYx0MI
	uL6VZEuipeYxELhks3AMorFgpx+59nI2smwylfsXQs5Ezzadwf54cKC7FpnrtKM63InDtOH5YUt
	s85UGIw26ozkSudR/VkxG3aCaBNPT2OwRUa0pkpSLwLOgTmYBvToCgful2FVW/TxhB7HEq/6roa
	VMIpHQMKD5G+OVFsAez+Mxm7S2ZtkwFsJqrc0+tDQxp/FflLcx4F+glQP+g2rVBkLCZNvCWNwv/
	6VFYrqgpi28V6fSW6pann6/1S14t1XVpi7mX38vn3/rP+e/6yJpW8KkUWvj/EBDhG5rqmPJwj/t
	YLYolQfjoPmPQIcnmGeFqBJjwZQ7BGVemFDSutnhc=
X-Google-Smtp-Source: AGHT+IGza3WB72u87Qc/jc2dtqKhHQX3673S999Ht+Uo4ar3zMBnJvEIFFWeIrwIdWwBJ84BunwKvw==
X-Received: by 2002:ac2:4c45:0:b0:57e:9865:d6a5 with SMTP id 2adb3069b0e04-5906d9e7318mr6028332e87.40.1760364896522;
        Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:51 +0000
Subject: [PATCH 11/32] media: i2c: imx412: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
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
./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx412.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 7bbd639a9ddfa7fa76d3a4594be1e1c4d002c98a..b3826f80354703b17b416dc233854da3f5736e38 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -927,8 +927,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx412->reset_gpio)) {
-		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
-			PTR_ERR(imx412->reset_gpio));
+		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
+			imx412->reset_gpio);
 		return PTR_ERR(imx412->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

