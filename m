Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE2E3093A0
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364916; cv=none; b=oPGPBZbT7AP25SaTztho6pdAJ9J2J0VR8C/NoQSZVoP7erYqC3eaZDnUX0wwVIWOuNk9MDXJHfkozO9x/pAjU/EWTeqf4uf8x++tFsqWBD9vxUikwjmER1xQrepjg54fl6+BLLDy2bOYHj8ZKKHnEY88rJM3xQZR4tftZYSb4U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364916; c=relaxed/simple;
	bh=Pr7uYtACvfrJdA0iTcAeWQURuxIqSlR2/8LxrEHEZVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqBsIRPFd1mTF1FXJ2n+Kobva9C5rZDtAxgxYU0lfR35LRut43UQsK9domklp+VJNenVHqHh7WMaPaRTslzt8wInqPmbpXOrp1ddPLQqIpOmRoqzRCigSv9OY1TF3MfSJwoG3ohNKwTRH3YFC8pOIj5fdccPZeCCQAwk+i6AN/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YtyyEZJe; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YtyyEZJe"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso4245561e87.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364902; x=1760969702; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp5+d2aM9HDmwL1D3Ee1aFLEQL7phGBi28Bq8ZC4kWY=;
        b=YtyyEZJe7VFf4S6yzwKPf7Y5NLV4KMBh/Wdzyn9F0lgWS3S0TmoAAASsnLIZI3Sh3u
         UBs8NUycbQDtA4s1o/xJ1Ra4PwT+ypXLEAWmG4H65yYQ9A9yQS4jtZZLI4lhCiJy6xhU
         tm7ndHBbnrUc4gpkNVsxXvHFwRGBMpyVmCkZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364902; x=1760969702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp5+d2aM9HDmwL1D3Ee1aFLEQL7phGBi28Bq8ZC4kWY=;
        b=WK1TARmqjyr36PI5QPxrBDdUHG7e/NsDRe8jthCjpERR7MggLKVBDfa9k8Q+ev3VrX
         LBAZkC/OVsSB5CIsStuzNPJDQ10AUkyWEdE4X5wOKVglR/1xJaKDiSpV5s2OLuTCcrA8
         jWCUA3zeGeQ3Kjt0kd8ykxe2zzPt2+maq1IXOHG2iHYDWiZeT5oaGnBSLNON/gqYrEgD
         qeuGAoSEZNG9s16H3SUy3GCsgkWIkhiRWm1CNDsZYahG8xeBXN4XJCRiZoNZwtKOCKxu
         iJqbx2nea21M6wznES/G5hNkmT9zyO9cL729qHtr913lo7D77X+ynP5Y6Q504eM3ZSe0
         fhmg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8/Hx0doY4QV1RqbH+hvIaQukE7o+T+DMAfV6m5cc0GFK6G/XQMbLCkubS2RDWeT7M7cB48RSSUIyoH9H@lists.linux.dev
X-Gm-Message-State: AOJu0YwBbntPEWD7Qv+6uHOC/3d2wW21Vnz1dPEznOyb7Mcy3FTa6oV4
	vLwlfLzbY0Qiv/6umC8t8+Q+n2uRZ/o4TOR+QYKus6yTTi0rHZFYYDVZGBpIQ/VEXA==
X-Gm-Gg: ASbGnctPLd0E9W5AcpwafyEMjpSyA2/vJCFuNVjOQQ8HEQ8UEXgrPKI2QaQZPlZBZzL
	1RQZbhIT0i03Yh0tQzwc6aCsTz0xU0/qTZRnutFQvV9tMFqBlY89TTVNieY4l0bqaNMqZiGdBq8
	/N4C220Fr4mLcssnYIkjoSQ5jRt/rhQLnJlMu+k/Tnjrgp7SL6H5bejBxIRIq+y1coSz/maDxs/
	IYOwOmz4p9NBxLZwW8Wy/A8aZXNYsAC5gSYmox2A1Q++rL5WpaqzPBwSugc6ZNEf5zCtf3KxXKZ
	9qPsZmhBDI/du8eiiE3GAGozVKQMX3AdJVflVoR/tL6ynutbw1UTLV9/FrrjVM4fWUMRQfwjHH+
	Yqm+cM4cjszi+Kjt8r3UrDDrurnHZAgiMkq7UjFDjWlP62bh2aEpIgqiM7qV3MDSThy5LJBcYWY
	F7m5xBlj014zOEKAxVX+oQFR+93Nvi
X-Google-Smtp-Source: AGHT+IG5Jbn8AREYVQz4yshVmuRi7HcTs/B5++Cc/GK88THJwh0ZT5hT0MoIErPfPNNX7o2ai5GIJw==
X-Received: by 2002:a05:6512:1389:b0:583:ac7e:4e07 with SMTP id 2adb3069b0e04-5906d89243fmr6542710e87.14.1760364901812;
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:01 +0000
Subject: [PATCH 21/32] media: ipu-bridge: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-21-2c5efbd82952@chromium.org>
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
./pci/intel/ipu-bridge.c:567:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 4e579352ab2c0be656576fa223429432940747d8..153b2f3685b447130b7ddfc2f971ffca8acd68aa 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -563,8 +563,8 @@ static void ipu_bridge_instantiate_vcm_work(struct work_struct *work)
 	vcm_client = i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(adev),
 						   1, &data->board_info);
 	if (IS_ERR(vcm_client)) {
-		dev_err(data->sensor, "Error instantiating VCM client: %ld\n",
-			PTR_ERR(vcm_client));
+		dev_err(data->sensor, "Error instantiating VCM client: %pe\n",
+			vcm_client);
 		goto out_pm_put;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

