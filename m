Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D6269D06
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364906; cv=none; b=CvwSP8Al71gTSdj01kxmxzy9BIAYWF5xFqkymQRj0MQHYTEwO6R6PZFeC4oD6chA97h5S31r4g2r8ekjmTkRf7CngLFB6vjwqFbrxvp0sG7bR3ZF4XUINB8Eh3sfR4zeDoGjvGu2B3WrrwRd+5RbEWiP91yY0D8imbDpyOA0q5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364906; c=relaxed/simple;
	bh=pmGQL7z0+U5zmtLLLSlcQCPIG/Bd/l8NvjVo2rUdVUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBqOZxeQP3o1MYhaLx8C4v5QFkItYjrCX9tv6DFAxSR3KUHND4xxRw1qIm3asTDiMV5pKul5x+/ZJB1LZ1WpverWKvRXYTZaCLtbWFM8SExHf/TzBb859Ui24aE59P0n2ZyIPhaOY971nRLHcP5MH+m9WMTo5b15Q/sr3EeqvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NUfks61k; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NUfks61k"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390186e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364895; x=1760969695; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=;
        b=NUfks61kWAbRV1hgfDqv7LTllsVJIlNd5euCO09svu+5B8q5Zc1dF2a90qAPoDMbnG
         ajwVIelcWTgZYFxUyUVRhISB5H1W1en4OZULJW78ZGk/kJ+tPr8SNXjHwsUSlrL7oO5S
         xvpnkynxRqK6grm5nMgjyWJ6IdG1aYb5van8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364895; x=1760969695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d45bLyS6OUqH7RU6UEzRVYwiTiUKaQxVUhJVNzyYRQY=;
        b=GBwOxTcUqPp1jGsOpEh8SgB3NaKrbqcDY6gW8Vbjbwk4bw5izjQpemMAz9++q0VfOt
         Fs4J8ykYRiJsh84bhDhBIN9lrjaaK6ojzCsgrHPbZw0gUpTJm9WYJ4DdAjcjzdZPyk8E
         0QlWHmfXflA85YUsukV0NvSGGVo8vkJd49hwAAY2DFA6qaZIEEc1excK36xFEMdmkJMy
         mjgUGpNgDkwqHORKSlJM7a0VwX/U0id10LWVbY0qiPfpwsT6RZbZr0bSBKTtFPD7mywl
         Q9fU+IgoF1TGG06kHnFBgKQ6nIILn/RsC0hs0JpxHVVWxGtvv0qMW5uW8ltyiTPAAj20
         4MNA==
X-Forwarded-Encrypted: i=1; AJvYcCVxXIv6CAa6pcU49rmDD7JOg/hDbk6PPuBWnyCmwy3+LFeXVJ7hEjZWQTGQrfH6hPRB4oerLc+VNbnfnZ3D@lists.linux.dev
X-Gm-Message-State: AOJu0YzLjOMBmA0r81iiRkbz5yvaajaiNNjykKqitVHrvpwRNlV4cQhK
	kb74TGlusPRxdgQq++BOgnpod1eW4rVCwxFtQB76LP+5XW5z1tWEKq169YRJoFUupg==
X-Gm-Gg: ASbGncsel+ZHdCtDVplV6s/J82lSbz04dqi2tkdOBYFKOMB96O4Szh/mk1kMDzDNt8p
	OAIqjNA5fIEiixse4+ELZ9D7QZK1xVeTbXcOQeS86YwhbHg0+/y8P1AiHT5D/w6VJ6uSvNwD34f
	6C3/8TVLHlCR+nuSYphlN2GZtcLqwQve98WhglHwEiWe1pyi3qplYtNgR3jKWTmAwcdn4xcJ/UG
	0w4N6gTwQJj15YsX47ZJQhkRcWKxIicQzXCMRwTLagLyFzBBcwBDXnWdQnDPC9Rn0SJfbwz4pAG
	h5cX4YSlLC7+6KHNwzhmoRpLSLF/kubVBWl7gTuFXcMDX8KTp4p8d0hD1U5owc3xUVM6SGw2pwp
	m/NKsLOxRc+Nv4lbNYJmWBqRXScjawK1JYmm9eFq/lxAmdEvUfJJL467mL/NI7/Q78ztDzYW8UI
	Sa6D6rAmOo3kD6Sl19+8DWigkTto5N
X-Google-Smtp-Source: AGHT+IHgHmnkM5LbjRZWE+rax/DE80YYaaKxmy85wL7to7vxyhdrC5Nac5EP5ziTh632ueTTsgzZbQ==
X-Received: by 2002:a05:6512:2388:b0:57a:6d7d:dd7b with SMTP id 2adb3069b0e04-5906d773bedmr6253929e87.8.1760364895143;
        Mon, 13 Oct 2025 07:14:55 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:49 +0000
Subject: [PATCH 09/32] media: i2c: imx274: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-9-2c5efbd82952@chromium.org>
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
./i2c/imx274.c:2038:32-39: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/imx274.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index d86d08c29174584b26e109a7858542313219c19a..8ec78b60bea6d47d2088b8251b679224e0d34980 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -2034,8 +2034,7 @@ static int imx274_probe(struct i2c_client *client)
 	/* initialize regmap */
 	imx274->regmap = devm_regmap_init_i2c(client, &imx274_regmap_config);
 	if (IS_ERR(imx274->regmap)) {
-		dev_err(dev,
-			"regmap init failed: %ld\n", PTR_ERR(imx274->regmap));
+		dev_err(dev, "regmap init failed: %pe\n", imx274->regmap);
 		ret = -ENODEV;
 		goto err_regmap;
 	}

-- 
2.51.0.760.g7b8bcc2412-goog

