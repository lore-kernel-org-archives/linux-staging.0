Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616C30AAAF
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364929; cv=none; b=BEed0MydCGQ5MNpRZIixvK3eL5nIJz1sIz1+P6b7ox9Mtbo+xyPac30zGW0mgFEjYY4gqE6wL4q0hprlUC/3M1Xnnh8M4MobJNIkR5AxhgOUlBK8pCKf+AKZ3THfrNBoJ68zijAXYcGaJzSYmFCvWgWvPYyEqnwP5Do5jq5Dlbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364929; c=relaxed/simple;
	bh=13OLz3ayUSOskJ/koG5Yo/gq8bsy35PH0jrjBKE+QnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zp1L1bIhWigKpncmfBdrh+NcwWeV7ewbbxrxGDR/z2d2BrOCxjvR7VLgka5pxlGzaGxFaPiWiO6mPDb4V0q+/DxLsgo0nSNNMDGa+ELi3ex5pk8E2vPJ9TyTQsCy+W033PC/1Gut0fksj0S6y7Soa2AW+CkB6yvV5CiBRWXj26M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QkcKyJXl; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QkcKyJXl"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-578ecc56235so3649858e87.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=QkcKyJXlBJ+vV7DDC2ZgbXwny+Cv26cvtE9N47nhgN+Bz5UmPuEODDi+xQ2DlOxNu8
         vKsuGfSjnrki+4DkgILo05sGomuQSkOxPskLoVgKSPFQmmy580i4kqWPg497JKXTrCl7
         cVwy+KtK2biNHI79WcPq6Govd3OvrzfaBsMkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P2qDb2fF8LDzF+Q7SobVA0m4pVGtYbfI8YlHA3qkzo=;
        b=hKhT7Ptx6d5tcA2pKIFMBNwFEoX4SNTo1cOd20nZvOkGXCRypf3/ZI8EIQaYQygQLH
         YoxONgpWOsQBLoMadesD3u2s/uCLSxq7cC7qMeKCYo53NzYddnkn68npLAD1C4Jt3LKN
         8FqnnOh4x2h2l1BYZ6sflewhY8O6ubT2xLZa9ch+KpO4h6ezXKI5VBN4oWdSYhRbasBv
         Eph0PwcidP0PotynJFs2QZiVvBsli8ww8BEpDk6G+OfJQVA922oMXDdQrSvGQr5UBsEr
         aIv7B1gzA9p4/NeLDuhAxADrdCPUZLNbbOwpKlHMHCq5vKOIqTdVpHFyE2VVP1k7ga0/
         1EYA==
X-Forwarded-Encrypted: i=1; AJvYcCU0TYwNv03OMjc1fgWzQ2DzNQ4iQLiBwnAlHI5qdEzL7OmWe5eh9N4fzK/VisSqCcthZw5qs07lY66DvvQb@lists.linux.dev
X-Gm-Message-State: AOJu0YzM1JHLzgH94U1vUapUX63dAiyyi8/nRyiO6nghSkoZDm4SqFo4
	+5T41fm2d0bO8ajmS4mOGM0bT0SAUv+l+H9cKxGOvCZ8+f5Tq1L0ytgT72DtdWScVA==
X-Gm-Gg: ASbGnctc9rzZGfImrZ0KvqlPUNU05Dg/BRSfRykkgED876D4iJH6PA8F+mReP0aZBAT
	CbsR2WOlyDV3NvntFOrAB4ITyHLrI8NhPpbpL3GPe2AxKg524gNSLnxR0HUnSSZ/tLlaoZ4PphB
	N3kgT/q0WiFgHf2G+rniNOLe0IcVlbF1Iy2wtCYm8D3EM8ThDB/kZCNGQHfnXptVM0A/b3bpouP
	BPIvuMWUabzR+RtPcvqpNkCfGnaq9h+PYE7yiWEin9fu18VSoS6JTQ0it4eamaRwjHkLAejE8iO
	L0zA1vTi16FWvQmfmVTca1WVL3Pzik5Y29+yIY08L1fe5aBvt5cnAd0QQO3A4bbQI3gKLIWA6yx
	acvTr/Fd17YRp4ZLIZ+0bM6DQRG1VcbvT/+A5xKiWRIM6Nna3U807AGpNCueQ1EgSq4Cp4XY34M
	uaGQkWEyIdwWCWMoZ5Ng==
X-Google-Smtp-Source: AGHT+IEQsTtyBvH7wA40gxhWBW3oPtbImGl+YQPk0oKm5qusk9oOE9kCkc6erWew+lMrb0jYwU0vow==
X-Received: by 2002:a05:6512:b19:b0:579:8bbb:d61b with SMTP id 2adb3069b0e04-5906dae8e6amr5727710e87.46.1760364907237;
        Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:10 +0000
Subject: [PATCH 30/32] media: ti: cal Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-30-2c5efbd82952@chromium.org>
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
./platform/ti/cal/cal.c:1111:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/cal/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b644ed890412104887ce3ec32b5024a02a9676c8..3e25ce0c3c3bdce3434d19c416481bd8d8b838f5 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1107,8 +1107,7 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 		return 0;
 	}
 
-	dev_warn(cal->dev, "failed to get ti,camerrx-control: %ld\n",
-		 PTR_ERR(syscon));
+	dev_warn(cal->dev, "failed to get ti,camerrx-control: %pe\n", syscon);
 
 	/*
 	 * Backward DTS compatibility. If syscon entry is not present then

-- 
2.51.0.760.g7b8bcc2412-goog

