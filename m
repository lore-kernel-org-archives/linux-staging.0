Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E32EC08A
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364903; cv=none; b=MRHqs5ebRfxpSlGu6p8l3o8kgQczjMmt8D5z64sIrnYUkEs8xNdFE9ouiEs6+3IuZP3dMMQbW9sM892mIjcq81d4sASyfkGiAfANS2oGrYm5VoSEHcky3N+wc+42QPgSNfUIFGRPnEuOjifLWMeq8iCa7BRgb2J8ox6NE/07wN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364903; c=relaxed/simple;
	bh=UX1suooorPOW+0wpmL90mAmcoe3Uhg6r2V2q7D2u2Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1gBVgetE/iEi0mbvLxFXnf7doxGDjBynk/iwRybw0/RXR1OXmNsSaOM/nvw/ZsJEh4N0KfvywXGwesE/cBGBywxSzQikFKvXpbQin1bnOramAGHN53VUQpHVNwhQH9fSjKOfbp85SVEA6nC5ujmKf7CI2onP26F/s6Qi/5ksGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n0PrxoU+; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n0PrxoU+"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-578ecc56235so3649573e87.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364895; x=1760969695; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=;
        b=n0PrxoU+5IS6mdZ95IJo9eGVkdx0OvbU/8tBTXEcRnaPYc0FCOXrn4VkNCCrCzI9zj
         ZNeI1Q5Mqv5iz8NJSB2YpQgGN8yu0BhIxK2goxLYiFTq+FKOXx6/By6SmnIkSkB/Mzwv
         R5Dnv6PieMB4KdJypspA3Wyg9fvqieIV0SGBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364895; x=1760969695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtOz2kIfaFHaB3b4Ap3srNj5aje/vDsBh7jaOB3MjlI=;
        b=tU7fwVHbvd7r8RmJ83yddK4/8zsGb/w/U3scR99lWIGQBK1LmwzcSIfXvCimVRJNC5
         AZ3QDSf5TqDG1RQ6ufDuLYZ/UaMeaX5tJN01mT1EToQqlC4rB/nwKv90T+w0O6j5sZN9
         5FU+oCLUfxikmXTte8OdL+c/kQaZh/VR7k64wI/7Ew5Bgmn06JYxh+mgHbM24E1yHsLp
         AVFrGcatbhZnXEJr8FGTp7UyYHMj6skA5/ZruIdKA1nwVbyMKfOqd7FkC/YVD0Bm2YuH
         zS1ebooGLUMxYeK58ftU4UxDuaNhwOjbFlKBN18YWu+PMKW3XOBKYcT13ne4BUhwz+Dm
         HPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+YPsOH+Tibjm1ndg+IhXNvGCK4ClOra17Nz4bG0llCnkJ/f17a/8lzFbDvUzYPC7unPWq1FDuEbCMoJKV@lists.linux.dev
X-Gm-Message-State: AOJu0YyKdlbrhL1fVizPd1h2TIH0M8oBWsvg8LXIhrinN20pEwAzGh0x
	NlM9kVYfJlL3ZKQ/eAZQqIPQRGwU4cxrxioY1UHELFc/WSxYO3DYYzSxrLxgHkrz2Q==
X-Gm-Gg: ASbGncv7ouKyvIK7v6tChjnyV/8q7FSQWJTjD8BezfcJdkeea3En6rgMAZ0IDI/owpc
	5p3ln81Iyw6rNaR7gFoOu65EnnuVZrEr+1Nw/n0CI5B36qhhPMrqfhklYcw25v1mBN2MUxXXhm1
	NNq/aiZa04vG5NVfBhZA3LGdLUBhw6bHMOXsTgBdU7TVW2hqdNK6/hP9fHSGvfw5JAbNiAhq6Zl
	mqbZZZB+o1V2R0aB79bb69pQc4vWA2Zeb26xzHxYeIzoTsk97ZVHekSTbWbT8gXDwkM6n/R8CA+
	cOZzHt2M0SqkigFbYVQSRSDRuV7Y2GqTQXFA7CLuGLrdiwXoIk27FRy7fMBeg8oDa0+Ub5ABTv2
	ZRCcW2Q8ShjvwSJnh+TUPtEw3aqyMYxQ3tllbWRhl5yQLK+dYrbhTB9RDmK1uUBKLBxHLNK1z3I
	LtAT07M96uh2KFkcBGfg==
X-Google-Smtp-Source: AGHT+IHgj8C7exDJvyPI6OyYwB6RVmsRdyW2/dMuvAdiNw0oCeaD3q0MVrstbMSTaMktl9t7RYe3uQ==
X-Received: by 2002:a05:6512:3caa:b0:586:8a68:9c4d with SMTP id 2adb3069b0e04-5906dafe47cmr6138791e87.52.1760364894546;
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:48 +0000
Subject: [PATCH 08/32] media: i2c: ds90ub953: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-8-2c5efbd82952@chromium.org>
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
./i2c/ds90ub953.c:779:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..087bb4ea555977692c66387a43dab54c12134e60 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -776,7 +776,7 @@ static int ub953_v4l2_notifier_register(struct ub953_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog

