Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2FB2BEC34
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364911; cv=none; b=CpFzabc229LEqS0H3aMcKwGYiPG7k8bUUTJFfA+NavNweFH9HuOamNZuBQpDfMfsYi3NF0sHmN4Y6QR0QrTh9rQXz29rMLMfKCrh+ZUgK47ugumr0QOMuN9lXbVhFKKY/DTeqKvjsEsGOsdpY3iJ87Btxg16GyXM1fcTpPnkaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364911; c=relaxed/simple;
	bh=+oAwKYsKZnmMRNeirjVFyUXif+/X/1l4gmdnVjVso4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9rABpuI+HXRdoM1TLP3vjgI9inFdiD+hON/nU428Pd4Fur353E7TBgp1ekLdp6jQe+SQUrltBVxZp/cy+MTPiDvvnjIVhcXczLYiz2PnZYtDNbw31BEsHjIVYt9+jD1uZDug/L/msetngp1ZGKPyjXDcXgnKZZ/yuIIettYECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WxS57jzu; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WxS57jzu"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5711556e87.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364897; x=1760969697; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=WxS57jzuCCR/3M05B8BYtl7TxHYy9VwABU8TplMnhEJogk4ZWjR/qCHzB+2a8keADw
         lRutYnVUwg+hIyvQg6frlrDQu5gPYH2KNwmTrQBFn6+YFRirfLVc4cC/V0Y/n8kP51K+
         bjYPVjrDw47JfqS9FGsqP8FNxJo+d0cO3OSn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364897; x=1760969697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weMrn1P2Dmx5cKyBfIFsmXsJRg2imt8oYjxSbIy2C0c=;
        b=PMNBrAdDvt0cGTwqsX+THKtZrJkNsYAFSR0BSN5slsQ/Y7iwZ1wAbDCbBeikMCoNdC
         pZP1v5rgTYUCvaZzncgmO2dlM7hlvE5s/8dQDdfs7qpyI/bW9lH9KyKM/PNjAXAO8Xfm
         AFPcXBfEW3HqVxQOe31sJjyh8mY+VWiBC6dH8swcPxTCsx2Bq9bwEYNyzQFJGMHSZExz
         Mdw51S+l8B6AQDasKWt8LJRMJlnkwXOQkQaSGKKc66UL7eUAVsDMpW1EfiHLHlqtbfiN
         c9QHunsX0QxGP7OYNiTq8ekSreJn5OqM9Laxs8FJDNg0d55hMu5+/Ej7DqxaqRFts7UG
         AqNg==
X-Forwarded-Encrypted: i=1; AJvYcCXuyMHgMmDcaREZv2qwqdOM5KInv0F1yhldMY1arFG6kS4HbMQANiVrSZVrF2Yyg2liNs3wbGLgEaAf+60P@lists.linux.dev
X-Gm-Message-State: AOJu0YzXusANSMvoNqo4nmgNGz4hffckWgSQrLWBX79a5d/y2IoZHeoV
	ZN/m511LyjPMkM87FkFBRmSKEFKBIEby/OKC/AX3kIHBiIlMgzrqH8i8XhFjWU6SIw==
X-Gm-Gg: ASbGncuYr08Xw+siFKstT52SYIkH0sm7kKm+niiI4sV7aQD/PumNW8fmOtR/vPv9lTl
	9NxUEUKYj6OBWuTbGGTzvp54C6aCTN1JR9pbY41bwXO584MeyKL6dwSsZOSlhVUC77/kexUdCE3
	M0mVw7RYvTXwKbxpU6wYMaVrKr2EdZ1omcpqaWCOjtFfhGowdt47mHVn0mCEjC09LpYEJUoBcrV
	JYCS/cd2OLb1hK1ER+HHxHeoCneKTeJThdIESN8fh/DVkVQRmOOhgHUdIjMp+nK8R5ZU+FSzEhU
	gD15clmt2HdsBrXkll8A6Vwx57XaKVbyV3b+qFhz+z52L0iE72J13WFP75r0i72THtHxnczsLFa
	IUdrr7CSExo1HZp3ybtQjqlboOK8oZb4RGNlkHp/JnHWbh9Yl5Z5hFxihWZM1txfeNChu4zlP2C
	r69amZEMW/jdcUdPSyiA==
X-Google-Smtp-Source: AGHT+IHVv3VTrmCgUzT/cTkypfMtCAEj51jzL57PRvYw0rG8gIadeWnRbBvldcFvBGl05DoGVFZcMA==
X-Received: by 2002:ac2:4e0a:0:b0:55f:503c:d328 with SMTP id 2adb3069b0e04-5906d8edab9mr6287769e87.36.1760364897004;
        Mon, 13 Oct 2025 07:14:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:52 +0000
Subject: [PATCH 12/32] media: i2c: max9286: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-12-2c5efbd82952@chromium.org>
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
./i2c/max9286.c:755:7-14: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max9286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c0961688d6173843f3ae846253d4a8669ae762b..e6e214f8294b83105be02f29966e1d3ed72f8dbe 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -751,8 +751,8 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 		mas = v4l2_async_nf_add_fwnode(&priv->notifier, source->fwnode,
 					       struct max9286_asd);
 		if (IS_ERR(mas)) {
-			dev_err(dev, "Failed to add subdev for source %u: %ld",
-				i, PTR_ERR(mas));
+			dev_err(dev, "Failed to add subdev for source %u: %pe",
+				i, mas);
 			v4l2_async_nf_cleanup(&priv->notifier);
 			return PTR_ERR(mas);
 		}

-- 
2.51.0.760.g7b8bcc2412-goog

