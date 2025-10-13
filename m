Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA21308F3A
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364914; cv=none; b=hh3xT0bI2FZe/gCjUNucxBE8xdTrDnNmLcMSigbGcm4CgVztlD6MybnUNH7nbo2okWAsT+Wy4Pa+sbiWyuurrZP83abAeElAF+a7WgWNPOG/SJFWkZGm4hlmqseBIX7isDGIW2kId8CEiLyo6/MM3ISQQhTW0+UX/FvubTjzVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364914; c=relaxed/simple;
	bh=JPx0giLNBAPr7LhNStN/lfffepZheYGDJQPhVGzb+6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaFPiM1B2scniI7TCep3pKs9EelDbSFo3LruX8zCmWsd9lsLGVeltfsfs4jIn7CQIb3XpFTiZC74a5/JchwFbpBSg07ZwqISV7An+L1HrqJSEorLeJgYe0OwoPVyohi+SYk2Ypw9oURz0UtPdPaUB8CPX1LK1jyW6Bk6Vper7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AbQrNZtY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AbQrNZtY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390331e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364900; x=1760969700; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=AbQrNZtY8vvw30MduTOCNkf0hL3R/E2Kk18l+RMkzq1FqV7kLB/oDM2X3MT1eyEakz
         2ijakAsgSTcCgG+M2mltUTArzDJFiaB1mGkDWvLMvj9L5KNvhcXixGdkP4p+9q5WpjHC
         NtJPBv6FK98pG6MuVOnM//KFuUOIL7ILpCZso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364900; x=1760969700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8uWudxYngdjU1rcL6v5EBbp/gDU20W7uHc3A+q35uM=;
        b=mL44yytZW5HcWScd7xP0itCf09ZApTmC33wXMsvVs4AgV1kH96EMFGOy4+dg+QkKMN
         7vWdveOeD4lBbor/lqqS61Efa/7lYlsoU+ube9W/rvRdRWvJR3iqMTE8OsXiG5SMKlJW
         bGpiOOj8FdyIoMGfLnSGSC1S4THKRueeiqIKtBfL0QI+3zPzThq7fqHr0HV/Df3FsVJZ
         LkPSw3BfEsQYE26gD5/T1evCHwSyFyUkyp4RdBfBxCE/C0ulYIK7XZLoQT49KMgnJnni
         8BPOGmyc7GH1xAwcSOqmKQZBEukl3z6CCXGejjuBy2CoWsN9TjBwUvQessq3G0qho3CD
         4H0g==
X-Forwarded-Encrypted: i=1; AJvYcCWSkVrDf8mLp1wrkBt4wSqrDbtBUgZLo/wtao070cCR/9AsholkqFKUOEo2kCTSQrUVb9B94f97OhmTq4ve@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1JoRG5K7gEY+YYlTMHTf88eCp5sqK654sSmmlF0PR3yX8Rfoc
	1Iv5UaUh+SSovOKx6Y9Bh7JpBX+FIFf3alo5/0LiToQbLagh4v8WNF52vjv8eXjWWg==
X-Gm-Gg: ASbGncuUmxi4AfRttY3u1Rj6ip5lOteKbhEgQleCySMY6xV5GTw1cJ+V9l5kWmLhUZL
	yuLwCBk29HHJJscJvzBlCQd4bL9tp6RSwFKu2O5nNOwGV0188d8FvQ0IRapyiqOsWgJNCFmaT/M
	5ev6WWSVSYxUE+YLXEkcq9VmyGgjlMTmdRo+QIvOKhoPbXVQRVvmt4PM8yTRH7vUbEEAXTFJXJs
	bjARZeDSra7h5imb9lZXQbiUw1hm/z3+syssAc6IUfWaYunbc6qdeQlp39UJ2Q+hfeFxVUuukGX
	w8D6KeJva6P2VseoVOE7ciPOqSoBNUlhoEamkQ248VnUCxTBDLtqTXfyjYmmzGCuPPqMGwJlbIY
	XVA+4kx8ZPA8PSSWkYAW/Ae2ywdDrxhoGpSediIbkGRHkiwd37t9OvVIBZhY9o9RVuUJKWIQk8l
	DCwpNCxpnpA7fWmjbr3w==
X-Google-Smtp-Source: AGHT+IEH9NSSx39JZw7O8X2sLmRDHl36VtDy7qnNgdDgO7X/hYoH/eK9oEmeokNHWwuJqGEVp7ffAA==
X-Received: by 2002:a05:6512:2388:b0:57a:6d7d:dd7b with SMTP id 2adb3069b0e04-5906d773bedmr6254025e87.8.1760364900095;
        Mon, 13 Oct 2025 07:15:00 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:58 +0000
Subject: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
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
./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov9282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(ov9282->reset_gpio)) {
-		dev_err(ov9282->dev, "failed to get reset gpio %ld",
-			PTR_ERR(ov9282->reset_gpio));
+		dev_err(ov9282->dev, "failed to get reset gpio %pe",
+			ov9282->reset_gpio);
 		return PTR_ERR(ov9282->reset_gpio);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

