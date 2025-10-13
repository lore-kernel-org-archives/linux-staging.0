Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E1306481
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364928; cv=none; b=uyCA41mvShbThqcEeXsjKuEG1srT8hh8aFj45DRPvzp6YunXuUvb4MYPBmnNGbcbCXLyihD0xoFPTouctXieRxWG5yOmlNhIkv+g3Zq+O34GMNq2Kt50JqS3NAnFm2Ik5810cQDvATPL3YtkAauusHGFeZnDaXkLJ0RwqJ2Hlyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364928; c=relaxed/simple;
	bh=5KNyjJbgRQNGFLo6ZpLtI2lNcxP1iC+T2TtMMI7Vg6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3ALdyna6FKNBnOLm+CY+2ZFM90A0fUiHjiImrDZ/IR3WqoAtpto4bHbSRseEHou2s7ARFDhYGwlefN8Bpk60Qwu4vU0bl+TzDqkESADWHjljNkyr+3wFveuZun3k2bfQ76ugGEL7L+xuJesEPs1/TT1h4p8O2g9vij6kVCQL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dvCqoiLJ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dvCqoiLJ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57a59124323so4619947e87.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364908; x=1760969708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGG/+lvAfLoFYTFsHBbdKee0g975J4ynYIjn3miRvz8=;
        b=dvCqoiLJBf6DG3qUA2rSV72cDJyjWceIVVnnv97NANVwnczp1nmtGnbFzb4DJzgvVs
         7WsgWqky+a+U8YXdLRKeJdeHlGH6g83I7HXlxI23scDhiEx8xqYGGjGHW2tPfH1/xVDX
         Vn9DrvOPoUK3ZuFHGoQoC8OArj1hryav6RqYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364908; x=1760969708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGG/+lvAfLoFYTFsHBbdKee0g975J4ynYIjn3miRvz8=;
        b=aT4puhn8FvZ+qqQvnU9KEXx6FmHBW0DGltxK1lYMYWUTulantPyHXbLLc+77xSTLZs
         1IvFUCmxgFkc0Ys8Rp6JDMis6A5ws5rthxXSr3kgEU0+P9kNyb4FW/camn3fNKAqs1t3
         X878Z+KtIiMKdVAE28Ce37XEH0GEOrPxy3x9ZKz7VgWHjMUjqpZGSveJdWSWPOBnwD9K
         wqIGbMl2RMr6U9kCy1UmyaLSqFk9Hleuw2vrt/mpjhV53gANejOc0sm223aK2Fbe80IP
         qspIMdv+1dg5Snl+6d3ZVZh7ES3Krx6lxVjNZ1PHUc4eTDiaBQ4W/hE/tUsXsGqrAAH7
         0LOg==
X-Forwarded-Encrypted: i=1; AJvYcCVwlQrZQpz8z0jJ1BZF/s+zMowYMj5/jax7biPtJ0mUKSH9+3ZEMs83DH7sQjNIGpaSLEd2SNJYPTWLFYNV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6sZpZyfp6cfAyGRmN0X4by0ShEiNsb997v+9iy6v4d51YFPPq
	yJq9vnTxpUGMbzaOdXMrF+IIN7ziZG9EXkmsYIu7ygo2ZcpL69/9kqRsLcEK7DCyIA==
X-Gm-Gg: ASbGnctA2C3wmW2al7q+n/xqg/YlCvdwIcmuIFUHzu3MDENx+XDjIXZ71psIFyrL6Ia
	K5LGDrVUxX33asXVShNwmG9p3I2P+ZqsWloLjfOla4drTJ9Qh8EYavucCB8LTZksaOvEfFulOfj
	LtNmum0jYlsH8ZV5s8uLjLqyvSGRBPHZibmcb2mJCVla+sf/dI2N+f95NFoYKYsskrwKKduGEvf
	Ux28NjlVt6JAXhUBIeV1fxgFyqbP88oYaxElzwmjq2tFDNWrL0Go0VZyFNHLn0OM+1caS36PQD4
	5IiGKIfzXxlxE4RKrZCc1jM5lZHhZvbUMWbmJdPomn/sWLmCVTmLEpaCJL3Mioef0dnQE/zMc4z
	+/TqpHlqSbHw6gSUJFoqLNtrrRNPLa9K0X4ssv6HU9lZpW37WL4DPC8OMuHrzmajARobSUt0xvl
	mqaDL9K91PCL8hqHEQeP3+Icx89tXMjUEt65Gevvo=
X-Google-Smtp-Source: AGHT+IHonGCa8by4IRlUhFwqne0G+xChLaB77A4Elu7KHX/ytkwCKxhNDSfo6zsqaOoV+Q8fGGx9SA==
X-Received: by 2002:a05:6512:1093:b0:587:a4fa:1e50 with SMTP id 2adb3069b0e04-5906dae5b56mr5886844e87.41.1760364908274;
        Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:12 +0000
Subject: [PATCH 32/32] media: staging/ipu7: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-32-2c5efbd82952@chromium.org>
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
./ipu7/ipu7-isys-csi-phy.c:311:23-30: WARNING: Consider using %pe to print PTR_ERR()
./ipu7/ipu7-isys-csi2.c:59:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 4 ++--
 drivers/staging/media/ipu7/ipu7-isys-csi2.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index b8c5db7ae3009e16264d7aaca6d4d237c1402ab7..2d57178835188a44b002b38712437cbd551751a5 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -307,8 +307,8 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
 
 	pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(pad)) {
-		dev_warn(dev, "can't get remote source pad of %s (%ld)\n",
-			 csi2->asd.sd.name, PTR_ERR(pad));
+		dev_warn(dev, "can't get remote source pad of %s (%pe)\n",
+			 csi2->asd.sd.name, pad);
 		return PTR_ERR(pad);
 	}
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
index 4023db4a6466dd57f0ac007847bdd74bcdf394f7..f34eabfe8a985f29fa48b4a8896a058fde2f2b2f 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
@@ -55,8 +55,8 @@ s64 ipu7_isys_csi2_get_link_freq(struct ipu7_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

