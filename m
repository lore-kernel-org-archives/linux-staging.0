Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B2D2C2365
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364911; cv=none; b=bFzLesTspGQWtylRTEUzKXqyETFILQPhuQj1BDgTtwQia3TQqc8HADL2OS4vxq20fxWzQ2W7G3GoaxvxbScO7vG/51o+I7LpGqf/7A3GfdKqpwZOrvpjyQn+jXWwvwXZqond+nN96yaKXEN2me9Unyj4FxrJ4dSticHqhKe+IrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364911; c=relaxed/simple;
	bh=nBAqAoz5fuJ6xQXtbwYZsAnoOFC+ZH9eAjSHPSKxyx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzMDBgF0jjaXGQYig7AVhkJfSs25x7VG5BGnUyKkq9gdIdaE70xJdiL02ObnDieGGSE85I6NS19CIF9Hbxmubg3mLZpnexMiRZ96ibFXMFxeoQPZ4HKYsyfnwg1sbgMkkpfJMH5+varcu5lZYc1l2FO3qoybkLfn4dBjAvJHs2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kydvAjsX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kydvAjsX"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso46171041fa.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364900; x=1760969700; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=;
        b=kydvAjsXQNQ5TJVhEj4nBb74Z1j4lyPp3gEAT6doAMIOp4xIMwXUfxq720x6nrWV5j
         2qUQ+p7EvAQw6kXCT3U7N3eHs18ACmW/cp9hU6VM1PNp0hQrWW7Ai6YZd0oRZTO7kIu4
         9+0gfiEijm/yJCjzgCBBrGwdQeMZgIQv2uEK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364900; x=1760969700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWalVF0nnSBnNQ4jdDd+P85V6zyjZ9PX8Y+NqBliTWQ=;
        b=sgg0hhJcZRsWanNiFYF6+kbRh1Fa09VAytg32OsMHYfJg2nm7+t94APKSLhYfr6yBI
         tCyRmKtFfELM7Th48wQ136j5L4ilsTQxAGcW4l5iJ/kya2UHvoa6TMQie82RE246BNod
         kJTqGoqunhq4LH3ACCRhA5a0UhiLf9h/VHLMHlxtjsM9wNN/UB5mJ7Br/gOZPBKhRusd
         Lhizf+CfrPBsi2zfpjuv5nJAkq4UvsT0/4g2NQO9SmhQb0f0jMuqZ1QxqBnMcsHJda2P
         hPl4bc8Hd/XGWMRJKT5A71oXOr8jRqg9NfhoA45nLCzuKGMBqqKg/zRhmuJhChvjBfPg
         ZZ/g==
X-Forwarded-Encrypted: i=1; AJvYcCX+sFRUzEC+h4E62RzHgrqaFL3bGqy7poJ/6p4lxxn1kKDHbfglyIHeB6wExMm/tt6B8sjItJ7v23nsWyyb@lists.linux.dev
X-Gm-Message-State: AOJu0YwiInm2P0JyTQB3oNk/uxvJGXKLD+I1YkjAIviGkbnixg8iJYHo
	+MMXPBYETTig7QCV7enaycPcv7aXeCndsN11KLa2kCPCYX8ao8EwygSdPu+0BSPHxQ==
X-Gm-Gg: ASbGncu0n+roeFIpWmahzlN/4j45OS6C4XBdX0JCiDQrebaM6KqLhRaSqH8dDfe+/vq
	thXEQVPJnt6oE99AlEB92JliEzdvwtDizjomm3AqwzFLjlmNBZFwvR/axNJ4xV8lCthVQXThli8
	qtlMXvEIM8dIqQ7VuHQL0VUhbd2hQbwDRHby6OMzVlKOJVNZ6FoW6aRALldJJxa4U/DAsevIa7U
	eB+u60vV+HTju/DZG7omTN8wHIffpVUirh4/fisFXZ9yeXcNwfrgKwraTTNhYQYNR97n7abDlEx
	+soY94jyclo1ZbHf82KJ9JbKMcjQSyCfPDEBgoLzy1Tx0eJ40RtN+BN76JYwwceCT+zFgynal3Y
	NAjloVhvUMLI7D1+IEq2mqXa4Sax/b3EN5cKP2ODjiIF1iZRoc83sLfiTQtZb7SJIy4Yzg7z8/n
	rcQGzDp2G5E2rBMrrABg==
X-Google-Smtp-Source: AGHT+IGPZ0GBnGH+/De00vLY51zTi7j6Ya9EGY1cvcSTJfIjXM0TP8WRpiQmjBMOUob4MSX3WpygTw==
X-Received: by 2002:a05:6512:a91:b0:58a:f865:d7a4 with SMTP id 2adb3069b0e04-5906d5da909mr5473662e87.0.1760364899579;
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:57 +0000
Subject: [PATCH 17/32] media: i2c: ov5693: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-17-2c5efbd82952@chromium.org>
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
./i2c/ov5693.c:1296:9-16: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5693.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d294477f9dd30704d2e43a0ed3e222aff3af365f..4cc796bbee9263c032384d8327961b5cee52b9e7 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1292,8 +1292,8 @@ static int ov5693_probe(struct i2c_client *client)
 	ov5693->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 	if (IS_ERR(ov5693->xvclk))
 		return dev_err_probe(&client->dev, PTR_ERR(ov5693->xvclk),
-				     "failed to get xvclk: %ld\n",
-				     PTR_ERR(ov5693->xvclk));
+				     "failed to get xvclk: %pe\n",
+				     ov5693->xvclk);
 
 	xvclk_rate = clk_get_rate(ov5693->xvclk);
 	if (xvclk_rate != OV5693_XVCLK_FREQ)

-- 
2.51.0.760.g7b8bcc2412-goog

