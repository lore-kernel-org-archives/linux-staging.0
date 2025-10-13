Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AA426E702
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364911; cv=none; b=DRuK6DafKNWPtJdIxwPGyNIfw3x9V2qNzSI6P4W+vjbGFH0sm+NCUYFN7MOhJnVgY49fVdQuqnqL9vWWVahoxLWaaODwfy3XYBBu5g5G7bA97M0gARbeZnsFySm+LZGNApAluhTFw8YPFCE8MeT2H+C2BXF/KLZL/aKmdeZA/o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364911; c=relaxed/simple;
	bh=wrKOMHwKlcYP29CWxnwwTT7eHQ4f28o/AjBtQYuk4qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNSPafgoeerCqSR8mDwydi0q4iQXU77lEZAYiEirJdbFX6ie4Aw49ZdIp+OnRRmVKg8wKKYrQ5pKODuONwkAYDEfLXRkd2I7dtBRlrvS2CjhWECiX+HQ+TueJQ4ilEso6zCjP0zu43i0Xp0mpeCLuQ+VGxqrOLyRCFcUthkVbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CozItVnD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CozItVnD"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5906665139cso5444415e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364899; x=1760969699; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8BE8cd4ehs+vvBX7b/XSqVzFH/A9VcJiWIwNhqGmEE=;
        b=CozItVnDo8afdfuyPPjGzSAASzdHBtmkJfTS64F1N7AFH6/1CuzW2Ve1RAp92HpJSa
         TeoamdjocZsjNH0lbw9ivMzc6oP5uy3i3C6k9JuBfFowe8q4G0c/yVcNV9BliM3aR170
         osAa9eN+pMfIHZ/UVrpJLMmUqvq9oyjdrOUB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364899; x=1760969699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8BE8cd4ehs+vvBX7b/XSqVzFH/A9VcJiWIwNhqGmEE=;
        b=PX2bSGTgAyadJini4pv03tkRq3trH1j+D6amtquK7r/G2LsJlxKO2hyVmkcK6gPdaW
         xQUDzadA+uKGB8z+IyKzugK93mK585kiY1L7BXEDcoHV/oSng36uykSbYBa4Qzl0pZQg
         d+anwLQ1EXxvu/fLPmNQA0cxiMAF5V0BgzLZXkMNJlaqK7jXY9giXENMCDDt6MnvlgS0
         31g7EwJA7OQZhm1LFK6IRagYnI/PPghihKjsvjfjqBqvt3h98pnvezAdLbSy+29mVqbL
         +qO4W5nxFI7aabdLA3OW/vJGrsoL3C3rdeUK4hFiZ7Rl9qA+HrFZ0Kb+nX7vihdB/6LF
         6sZg==
X-Forwarded-Encrypted: i=1; AJvYcCWEx1UGvdYRPvyJUEh4RRNav0sK0TPwTeR2Sx6Ml4u7v5QDMGXbUEI9j7HC24doWgaBCbSm6OY7x8dPjNHG@lists.linux.dev
X-Gm-Message-State: AOJu0YzvsJdZVraLii6P/C0gUIG2ihjvd4HdeswWMZANMHotDZCnzT9G
	J9sRsN7veM/3nUu3D/uvyYhwrexw4iJd6AqLtneOUotICwFHiqQz7pe7zC7MaBrEEA==
X-Gm-Gg: ASbGncvPU/N8MAPzV4pWlKVfKj5cDqaF6bXykbnsKCgaCBO+TcMeSEkkT1y5RAX13Un
	GY6euKEgI73AYn3RbWHcM9/aiaewtE0e3yQCY/qswlsxeDgshmFNY7xBP9j3kORGg59Yk09NtQ2
	dkMY7ySDzNBmIlLSgsPsNhgPbUp8ay9+y+PyUSBbe1f/wJp3JbUQ+z0Hs/SaYksbsRVFd21KHpn
	JENEb5qbTz2HO9iZXtbXsLKwD/qduK1Byhv5Kmt5/7u2DOwB2fhCrINI64bRszoszcDNSD28PVg
	7vQ9VNJHfoQ+mG22V4/G95y8B3S+MaDqRbUlCttSVWaMf8vEYdXCVJGmu0MrT8RoB3a8Dl1tby4
	n2uzol/AQow9y6bAlrJ2EVxY16e2ZQZfk+8xL6H1TbLQWNVcvJpn4Ia3ErmaYo3mbtkAxevQ9ux
	81+ZNuR9aDO81tCP6jASbe9A5Vj5Ar
X-Google-Smtp-Source: AGHT+IGpJ2y0KS2EDpbOsMnyHnkw2vKTe9VvDcatboc6qkM7xgDjulc/G8CRi01zrNhs6YMLw6/H1Q==
X-Received: by 2002:a05:6512:1053:b0:590:651b:10e9 with SMTP id 2adb3069b0e04-5906dd514d8mr6137707e87.34.1760364898568;
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:55 +0000
Subject: [PATCH 15/32] media: i2c: mt9v111: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-15-2c5efbd82952@chromium.org>
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
./i2c/mt9v111.c:1143:3-10: WARNING: Consider using %pe to print PTR_ERR()
./i2c/mt9v111.c:1151:3-10: WARNING: Consider using %pe to print PTR_ERR()
./i2c/mt9v111.c:1159:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9v111.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index b4f2703faa1854a3a5e7d92ef312d01a39879a5a..64a758c95ab7b767de452304615a8d1f986dd23d 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1139,24 +1139,24 @@ static int mt9v111_probe(struct i2c_client *client)
 	mt9v111->oe = devm_gpiod_get_optional(&client->dev, "enable",
 					      GPIOD_OUT_LOW);
 	if (IS_ERR(mt9v111->oe)) {
-		dev_err(&client->dev, "Unable to get GPIO \"enable\": %ld\n",
-			PTR_ERR(mt9v111->oe));
+		dev_err(&client->dev, "Unable to get GPIO \"enable\": %pe\n",
+			mt9v111->oe);
 		return PTR_ERR(mt9v111->oe);
 	}
 
 	mt9v111->standby = devm_gpiod_get_optional(&client->dev, "standby",
 						   GPIOD_OUT_HIGH);
 	if (IS_ERR(mt9v111->standby)) {
-		dev_err(&client->dev, "Unable to get GPIO \"standby\": %ld\n",
-			PTR_ERR(mt9v111->standby));
+		dev_err(&client->dev, "Unable to get GPIO \"standby\": %pe\n",
+			mt9v111->standby);
 		return PTR_ERR(mt9v111->standby);
 	}
 
 	mt9v111->reset = devm_gpiod_get_optional(&client->dev, "reset",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(mt9v111->reset)) {
-		dev_err(&client->dev, "Unable to get GPIO \"reset\": %ld\n",
-			PTR_ERR(mt9v111->reset));
+		dev_err(&client->dev, "Unable to get GPIO \"reset\": %pe\n",
+			mt9v111->reset);
 		return PTR_ERR(mt9v111->reset);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

