Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57B2FB978
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364916; cv=none; b=eHVNr0YAx195oi1vfIvtd3y5IqfzDtehHx6RoY9TiDofVqbrJLJlrM7Aq/gsvStT3E2lZOmqvIeEsWfaU+93Cud1lLMiDmINGDqFqnR7z5arghKEJbu0FZiUwxaAtwyfPGnEypitI+Fuvliqm7cOexuFLh5563gkdeGckYfL2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364916; c=relaxed/simple;
	bh=/OmRUoPBoEYkKTL+GrsA3lQ6tTfUILZu4X7YtVySLKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lb41jhxbVU9eziBD2ftb1GTp9RddWfetLKGF+G67yvtLYnDuAHbLqPsoqsU5EghCGRwmJMs1mZwugCp0GytSeYeN1zLk/zr9buf30i3bh+fq6Hx6w7N+URdxYfAKJ9l7cdRYVaO1odEHr1bne5fBkWfgl4j8Dwy4xVV4JDa8EJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FNecVESX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FNecVESX"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-58d29830058so5245555e87.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364906; x=1760969706; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VLNzWiaaayGbLPJ+CR/kQopGEdhcg7BnTJUn+bNJDA=;
        b=FNecVESXQl5byqICaqs1dSVmwtMXfod4MPofiWAuflB3XyVrgb3ETLHN+ZJbPjMw2J
         hLXGU+omT83WNbspTz3m1mO4/ctlYPgjnzaiKpDuA61cHAM3ItorYI33QPapiuD5tcXO
         VJFUQU9as/+iun6D8A+zjAtlFanq45fbUAse8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364906; x=1760969706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VLNzWiaaayGbLPJ+CR/kQopGEdhcg7BnTJUn+bNJDA=;
        b=bA3BSN4EwKG8OBVSCVWkclq7UpfjaVSooYGmZxwsCP+lN50iY98h6Gde+IqFXBJm79
         3kKam+Oc9EsaH/F144/HMDTyee5nDfE2Mu1jIvh5WK9C7EOkJpTQ6GkyRd1wThNXEYNb
         pNjNB8JepYDlzR7mR0rR6EA3M5LHBAo0QUz+bDXxqFXPeR/qgOHwfD4bEHeRR/ZdRZmA
         DVeUaJ9NxgCSDfbBvZmvSuEFo995a2rr54jvEnwMStUS1xDUg482KNfdUDi9Zivq33Rn
         UwWv8SVgpkKpkeUDYbLpJbRF+IM7MJGAebVVQMCfKESJ1RBaS2D6ge9X2bUcxyzfCMJm
         /VUA==
X-Forwarded-Encrypted: i=1; AJvYcCVH1CKU9sYyi8A7yGS9sXHznj6sQwWsqYOvxlV00ex/a7SnPhNsLMMlmUP41dT/Dtc87tyGNATp9pOundam@lists.linux.dev
X-Gm-Message-State: AOJu0YxZRLqzE8EKprqJsFQX8IwpJUG0jkgT1TZFjVCMbqdgbX4OyrMW
	UfHxquE69sLSYSOx4aVAOqEiCU36AUTZOXHDjEPrE1Y0wm8PYCal5f2bLZtdAjbewQ==
X-Gm-Gg: ASbGnctsTFGoXK4u2l9wg7NXe5e77KU5XfQReDNxzR3HYLbMZqtLmqreicjImZjyRYx
	6gUwmHP8hjdFYuFZdHHU1/ogiacYqALRW5nlnTEhlZu28EKRw7kDRDTJzEDJi6e2FMchP6gfdfW
	4gwXBj4fy5gfm/bc16zATf3JC8FoGC1TB6FO+HK2ubZHK/jseZYqa4eJw7/6jb/xfyA7tv3qHPs
	dw8Mfh3ErQg1jo84XFjEjENaa7KC2cLqWaqeujCZy+zNysAxSfQovjhtQFql1Mt1wtRbeb4rHUo
	w1M56hgMA6qRIJ9ducWvPrZ6nb1kRAmJLMlZNnWM/wXpRIXKbOyzasVAc2tHLe4PWYc7MlwB17n
	GMMTsD3KLj6HAhSEyAoWkCPlxi2jnNv+y9cw99zp30am5sXRm1OiHyCqGK6uD+58CFqNAcNro3E
	JzTHpkBVzZyeXkES/BBA==
X-Google-Smtp-Source: AGHT+IHgQ/WMhPa6rwn8Aka868vYVRu77lc4adXi44XLWG27weltH/9eVYPP+kQHy8I85fd7fOXyWw==
X-Received: by 2002:a05:6512:3c87:b0:58b:23e:5ec with SMTP id 2adb3069b0e04-5906d8e5b43mr6011775e87.26.1760364906103;
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:08 +0000
Subject: [PATCH 28/32] media: rkisp1: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-28-2c5efbd82952@chromium.org>
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
./platform/rockchip/rkisp1/rkisp1-isp.c:940:3-10: WARNING: Consider using %pe to print PTR_ERR()
./platform/rockchip/rkisp1/rkisp1-csi.c:372:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 841e58c20f7fcb484643138627413425a049d1fa..ddc6182f3e4bdacdd1962c86f6259334b16aa505 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -368,8 +368,8 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 	source_pad = media_entity_remote_source_pad_unique(&sd->entity);
 	if (IS_ERR(source_pad)) {
-		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %ld\n",
-			PTR_ERR(source_pad));
+		dev_dbg(rkisp1->dev, "Failed to get source for CSI: %pe\n",
+			source_pad);
 		return -EPIPE;
 	}
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 8c29a1c9309a846152d212dcb50b7bf991d4f422..147d33eb6ee0d975b257c5df2997b811ba3a62e1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -936,8 +936,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
 	source_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(source_pad)) {
-		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
-			PTR_ERR(source_pad));
+		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %pe\n",
+			source_pad);
 		return -EPIPE;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

