Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB8425D546
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364895; cv=none; b=KIMqYeY7QvRQAdtZQ02JXRk8tU9MPu0tX7v4fmXcoE86g+Vee11EfyqQbEif5HMA0X3qGdt5+lgOtTsamdtMkfxdSY9/DRy7VP2Qfm0A+r9GDaEkUT2GH3IjPAdy0L4yb21+YleLQUAMK0kGGJYmvmTAGJhZdkFdTrVkRRQIXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364895; c=relaxed/simple;
	bh=zXe/wxZ6QqQI33wXbnF9l5/N0aHMRBU3Aplzl5QTEmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYz76Z70BWOaN8lWw9I3KJU/fJu2zFbJiN6W2XraOs2sKyRsoEoAXpiUs3jBxxfv0HTgB3BVjCETbU8rtzg37zKsBDsFFNa79usyvjt0ynI1gMCR+O0UVv6ZlvGvAJa1aEQ90ClOsuGQcWGAUJSaZltllYWvDfm6snUe3otjPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B8QV2EUU; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B8QV2EUU"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so4306477e87.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=B8QV2EUU2WJJGBgiYgZGwcM+zWzreaCBwdXTX4ShYs/aYwpyYYR8IJM5gUm70Ed18c
         4OCGYnYCTir0KFaFScrjpC7Dam4f2pLkWkV0SKe00uLFXSMxgfa8YYm/eDti0SWuWBOL
         Kkh70klUmI4kPjB1ADhvzdFzsTBW0IsVwtsQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+YhCU9BSkNGYIn59ygfcOhebsOBGxL8NqrMakgbz3w=;
        b=aezE0g07it0K172DZ7bZnzJV6q6pATotBoczWvVmLbwYg80qmiDaob37F1ob13VmA8
         pwMLkuqB42kLM7N577zn6TIiMMGM5/L8l8KtQwTAJhRoq9ZMkWhxcBtfbmCLLw1cYlDB
         1yJSNT/VMaN2fyhxWN/IcYw0d59uXUk1IGq8I2hlOvTpbOwsKmhsTSm5M20nsB9LOuTw
         lKnoU6PVDitRGruqt+Baq0oTTvx2kxTAcm87a743dvcw+2TuiYq4LYLfXjZglAH1SJ6z
         roAcHLRgWFoyPFy86LP8fWRUWaR90ELenNhx0se96Nw1AgZCGvyMLwPdUR1w1lxd+SRp
         xWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBoRQncFjClKMLVYznEmFlcEGv6LWMLNs15tzxR9VBdyo9i0rnOOkAS3zuIuNbHj9LXsHxP8upzw/iMNxQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyuwMAcbCTNXybp19kJIBMqGeeDoD/ynKSzQq50XuzUtsAYF/uK
	ddFN6znfbTdVuSkgElFfWUL2UqFNY8nV6O13IzHCQQ/hK8OG2VtgPIDCnV26KEED/Q==
X-Gm-Gg: ASbGnctCt8Pn9G3YH+kqZPvcqjSYo6xd7NDHiPbJtTJNDPI+cv9EncxxpmgWCcWHoUr
	Wgo0fQDzO2PmdQJVUr1X/+x/kQcQZ45Y4u6xidK+Lol3zLOKJHdp2zFbkK6zYdN/Tcunp+ZyzYP
	AXhKLGYF5L//LvPYvebZKsUPChduwGNCVStcKtRN4cF2QCD8feWdPT8h1cpJ9Z9KNHSiLcJmTnv
	JM4keHTmLJfKtm9PrHfew6PSwHlyTRixRfIIfChz6RuFe3B8iI8xg+fBjkitrzeE6FI0iwYZ+1Y
	++wnZmSuaP0qXJmlvuYIxaGgnGjReTM5R6g1GrTn1b4qzV8sw99uD9J0mKcVV1DxZy3t/LSDsqO
	3HxeVVUAOo3HXYUJIBCQPduglq8pipa3mBjCoOXgb525Oirk2jG0Cqq5O/DACJfV8wWckuuy1dw
	Bj9k/lMD8ZaTDAC0s76/2KM/LPca3x
X-Google-Smtp-Source: AGHT+IG2QYB2+56krLBk85ko6pGpX0D4THrfkt1zz892JTpjDOUAww9G2kctwSbBGnVpsEQJrH5Ywg==
X-Received: by 2002:a05:6512:3f12:b0:58a:fa11:b7af with SMTP id 2adb3069b0e04-5906d782160mr6219748e87.14.1760364890722;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:41 +0000
Subject: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
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
omitting PTR_ERR()

This patch fixes this cocci report:
./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/input/touchscreen/cyttsp5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
 
 	regmap = devm_regmap_init_i2c(client, &config);
 	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap allocation failed: %ld\n",
-			PTR_ERR(regmap));
+		dev_err(&client->dev, "regmap allocation failed: %pe\n",
+			regmap);
 		return PTR_ERR(regmap);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

