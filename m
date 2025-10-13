Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1DB257828
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364901; cv=none; b=CRrfBBNp/ja5RI3upJ/8+HukFOz3vh2cu1bA1DeTR+z6Uj/NtxlLTUb8OnhZdtFKBpRQ6liSxC7rmHLOGUJ+P7M+RnUM65ZOk7eOGWHEAhM9D2Ht8ERhG1Svzy6Zc0Q/XK8RgMTBzS4X+4JtTB2jysPQSD1OXo6Cte39aJMb+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364901; c=relaxed/simple;
	bh=v1chswa10XA6p6iwQSk8q4C1sH6EpIjnX5wmdhMAOFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPpQGXMvfnSoF4VPoEJLyhkvJ19c8O40hdJGJg2O8sy7r8wuVniyuV6oM86NiXMqAfgc8j2M35baveyesIPrP5Bs/2O9x6YCHCdYzd2BLPOjgTVMln/NQ6hJJqrPjhpI7r4gqGtBfM0IHba1Zg4UmvRZ+RhPcjMpO2bCOkUaG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Up0jC7NL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Up0jC7NL"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso4965101e87.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364894; x=1760969694; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=Up0jC7NLZwWuLnhPA2SPc3dTlQbmBEjJr6FPZe9cSWFXFvTC7D519Ac6FyE3Z4CRNA
         wxs8iz62a3b14TNK2DNHWmRGNhAA6nJwNUgfa2fSuDCUfs/IN5CbLyZFMNJIkBdlYNXx
         VwyQHTjEXQBrUbBYoo23V9//gAh2ROvNIdPAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364894; x=1760969694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQOTcbEIyF8Gidv4VnpqffbURmu3SD1oIPY/sSQVQc4=;
        b=SDL4/GLwKAbuk6/7bnMEzCYTn9DthRvehZnyAUcWoyeax4EnQDHNJJ7tfgsDwvFItg
         S4FwkPS927wKR01N+0P/VBbXtdH8GbmccM1OF1Gof71TXUQLMH0yg5WCCyLmPxIG4hfC
         uxv3T1HBK9bNxSIDP0yjtNMbqBCQHQHyPFCQ7bBXq5KHqO8TItGkLQiAD0XIVIwvtRpQ
         1nvDk66r+8/v2x8GT4pCWjGy7J1OLJdUeyo9YULpIi72zxmfxks1jaI36JYTIEIgcSdH
         s6ZUq6n6hQZIDPbBcQsXWvizQOAdLcMtWgcdMN7IMr9zyCHoroMu7tUWzadFIyEDiFYu
         Xh+g==
X-Forwarded-Encrypted: i=1; AJvYcCVbERGGnYqMzwZj50tyzbOllQg3sG6Ws9cHEHqRMGgTfcfhBcf54EDhFqYglKAEecW3Ku0yIgSMwrhBb3Zw@lists.linux.dev
X-Gm-Message-State: AOJu0YyEHIRiJNfbuCPIko80jM+H6nr75IT0m5ffCwZRQXrwjLaoe6/Q
	gA6LogJvh1hlKx1Ej/KUKi7o2La6MpcejGYwDmF0r/Sf4HG4lY60xm08deCoh5UMrw==
X-Gm-Gg: ASbGnctIGVwdLCaIShceZmJSEnl0w/CPXuDJmQT3CDRg2+RWJ9hoAjFbTreXjIZKPB5
	XE8m4bEjqgAH2dTulEkjquoEqkP2F8/OtxlvhvyVMmdnXQRoUgNQ49XwfWXxnISjSNjAUfoQO0J
	PtS5MlrpV47CPS6eb6C8V5ofmuruvArQLHPtvVBv8+6mM3CRRFxpJxOKCrJCQXSFcAwym/K2RVR
	JIAKHhzaCYdP1xegoHB3dlNtSz3j90R1b3sOork2bPsPmjoFU1Jm5SwP01YbJ7kQWTCwn4LG5Dq
	FPDXG+C4+G1lRPwLhhEFuI7jKYPYQ1vZ7XNdkpTDFQfe6q34u1JNyBHgMmNI89xTKCIZrz3LXYD
	99Ya3ZrX5YyxdFwg2VF4t2svvDzqqmJfitiXbo9Hi4/MGgEqUOZ3iCW2gwAEvC0opIsuiMW6gr3
	+OGpnrDt1oq3QfSL6PDw==
X-Google-Smtp-Source: AGHT+IGDBA6vFVbdaAIVk4TqwO+W9UovYsrjETSu90SPXIb8+mEsMg943qVguajtHcsDf6ytgGLF1Q==
X-Received: by 2002:a05:6512:6c3:b0:57e:f60:2327 with SMTP id 2adb3069b0e04-5906dae8090mr6097318e87.49.1760364893949;
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:47 +0000
Subject: [PATCH 07/32] media: i2c: ds90ub913: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-7-2c5efbd82952@chromium.org>
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
./i2c/ds90ub913.c:625:44-51: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ds90ub913.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 73150061ea458937ae4ba7a937ea030b0d98bce3..e97e499b04e6c2700d7d433ccb4fdc57ff12b586 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -622,7 +622,7 @@ static int ub913_v4l2_notifier_register(struct ub913_data *priv)
 	fwnode_handle_put(ep_fwnode);
 
 	if (IS_ERR(asd)) {
-		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
+		dev_err(dev, "Failed to add subdev: %pe", asd);
 		v4l2_async_nf_cleanup(&priv->notifier);
 		return PTR_ERR(asd);
 	}

-- 
2.51.0.760.g7b8bcc2412-goog

