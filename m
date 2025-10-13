Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BAE3093AD
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364918; cv=none; b=lTu5tLxIE8GfCWwMk1GNVqWPy059TzlQvTQkAH5uMSwqKGdImGANnsZecvvTnPHdxkhdOZQepqv7x6dbOmOCZgyjkzEnvRf2ALKxc6FzRcLf8nhkJpVqFSyvc+GEuffcQh5nY4SOEcIwi3DMWXn+Zxkq11ZToFutIL5/KWPwyGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364918; c=relaxed/simple;
	bh=1KGLnwkNkXZu6CtEdNPModZR1Vc28L95VShr6d6uVXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmmUTgf08HiJdQ1B6KM2PQtjUT174IQprawJAJ9AD66+gs2S8N6o3sX0twc1W0hQ+PajFu9Qo1DXMYscZY+68olVJ8c+zBcdZMa6YlSAg6AZ8C6Xqdwl0MIKX6yqbpEbIA3mVeqaGHC3sran2Fs47yKp7r5yqWu7cQJvkXYt85o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gEaDcJD3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gEaDcJD3"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322308e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364902; x=1760969702; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=gEaDcJD3RizhwCT6+IiJNrggiLgReOrrrBtvZFd4phyHt3lnXtIUaA7tamesuRw17r
         BNTh/H1YNKMU+d4jEB3pyt4zr1I/ijhoc+K/Ms3E8kkoXM6CnYiHe0/aJQ3RGbkrQK5B
         Yp8eE3K2WZ0DqGr3Z1+RMEg5F0vsBgDT1GUpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364902; x=1760969702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTfgrP773mTzuIwpFbkRpkdwa1sJQvDkaUU5vsQzRTQ=;
        b=fu+4GersNzMJHEnuBXtygeS+zmo6U+yisCMO5jRDtwWrO5/7PBkVsUhMmpc+mt8n+V
         lkRK2DMd3AxEWTvE2YqY46O5zDjBpE/lWjLNPBMhRhrnhm41L/NZCnlThdLfrggHJLgq
         HZyvbx1SETDH6cJ8a/bQozzQGtDexem4H1VClMTYCgD7ZCucXRpHJ4R6wUxB9l9/f9ZH
         hxRDsa+uFKt85Il0F780K32kwuwcsdeZCxpk8CDLlv5eaxYdYem7VcFdN8hp/CmI0y0+
         JKOzS468JIopC1eXC0HOOQ0hsGUCQyyK5wkd0rjM1lvQFJX4GTOtQqQA7mFTX+w9DLXD
         awbw==
X-Forwarded-Encrypted: i=1; AJvYcCX58NHN0BXP0TqP0Vo5N2aeRi8DEj4FjHkaAsCH3JfhDYQX+WBonVjGaHtcu975Kc/kP9C9w0smHwJB3Ry8@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ6+ADjpyS225btPa+bnWOIz7JEKbzLcDckIZb+Lb1mJosgSDE
	VvZGLqnO6IFOxHCX8bYlm/ICXCbkUJ/wyDCuC46dSKOyJdGdH6JHc05GWznGBaVyGQ==
X-Gm-Gg: ASbGncsyzQQrMm13droIsvhWbB0wyWiZHCysPdH9DPYJdEhZnPg2+hMbAq6Zan8IQrj
	WfjzyZmMcXiJkPBfhkeM2cKnmRYzFB8vVVH8AetTghpZ8qZYlFLkIPSu5lK6cTRaTGAbZdA+ebs
	og29s2oRtO5KQz3eHyt6nQ1LTna5jEfMgnKGOhpvdJWH6I/K2P0GAuTlGoy4/gPS719zCOVJJmK
	XkXAZfzjdnmYxaj9OcFiS/JQH44KVEBsiCUy67up84RVbPT+epuUK40SYqD3uOzeBGS2fQRuarH
	rxijLHZxgdEpozzZ8n0W4l2nZUnNJJ/LqBL7qtgNr5HiKJfQa/ehgP47oFnJ1FJSAhwJHMk8JsL
	N0Qh3J+KwPsdXpms4S5mgOiYkg7N09OJ2pD+9/pJWEYJMpXStzkr/9AZsTj0JW9+10VNMCl9Y5W
	navxpNNamX4aZHjlipwGeM+UESFohf
X-Google-Smtp-Source: AGHT+IEmYSyu4nHTtG8vRgmb2LccUUeX39k0JKnrkMfDo77UUQwM9CrYH1frfefAQcn5JPDuzUf+OA==
X-Received: by 2002:a05:6512:104b:b0:58b:394:fd4c with SMTP id 2adb3069b0e04-5906dd6fb89mr6060927e87.33.1760364902483;
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:02 +0000
Subject: [PATCH 22/32] media: ipu3-cio2: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-22-2c5efbd82952@chromium.org>
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
./pci/intel/ipu3/ipu3-cio2.c:318:19-26: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index a87f105beb5e267fd450b8a36ef9b0e0ecafc598..986b9afd7cb5b6a07c796b4333f93d427a8c4fbe 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -314,8 +314,8 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 
 	src_pad = media_entity_remote_source_pad_unique(&q->subdev.entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(dev, "can't get source pad of %s (%ld)\n",
-			q->subdev.name, PTR_ERR(src_pad));
+		dev_err(dev, "can't get source pad of %s (%pe)\n",
+			q->subdev.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

