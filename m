Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4F279DB3
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364922; cv=none; b=Wh/Q0i6HeL+k2GUSF2EDjeQL/2EDcTpSpOmxV4eZZHDvmMJLC/UT7aXx/u0FLV0CURc5cYiyiRtsGg1koKVun5d+2IWUoMnMLfenERJ4LYMJR3S5Vpvl9CVlf2BL0ffgozd9V/b9GfFD31UAhEEXj5xRqzHWBr4VfXEubdLOeUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364922; c=relaxed/simple;
	bh=c9Kb2b0T3BLAmckMzo48k+Ue6UmlyuOLb1cyxCq4tlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHrI/7q9alSMeleUBJj3JHSh4l6X2xb8U3eGUgJyjgCxFlhhzb3lMnJayK5LYIa9Uicnu9mWSwEnTWX95+4wnyCPwwUKrvlvCLqP9iURpE1MLVc50O3qD3SESkZZt1rfpPV7VprbefC6lcExiU9NO3JqWe5tjBDlBC4WWnQ26X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zw01FyRk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zw01FyRk"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso5390509e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364907; x=1760969707; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=Zw01FyRk3JMx2ezfu8rT6cyUz2+BIiSc7/XHkiaeI1DIMDQR8s+FY550xKGVfShSra
         qhIc1DA+7oP13bRpfcdLJjZQlPMwx/E8iA3lRnYMAWUgZOTaiMqcHF9wfe4+ESMINCIw
         qWHSDZS6feIoLDwis7ZKGiy7qCr7gYUenlcP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364907; x=1760969707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Smwvmk+cDkyGjYaS177QmxkSssvQt/cgmiOzwIecscI=;
        b=i/8XzK8wEe7G6mSR+MfxXYkgH5y9KutlYwfl0kehQ3CkZutm2TweSUEJK03eze00hL
         5wmk/yuuDAJ4bx+YVBAdS/ZPgWSX8PSiAwxUGZn9WHvi4789GdeMYfNb6B5uCWtW8Qi3
         AWu0CIDjqsptf/WzblFkvOBbeiQ6zUaKGsUC/fyl8ylSlOw8gN3eW6LM3HybkJZ2T4ef
         OJcC26YnzpcXadd9X2Xn+zU+KDoZTj7IfBl8BJa4QpKDUmmISRhgBE6Gamo8soCQgj2A
         pcwcwNmmkUjopWAUOgjCVm7fdjLaPzBoQk1LWh0ZGvF6ndEy4GVWEpFKasw7LJoN8i6b
         Yk6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWry0MFxlfWPpIIWBbyWq8P5drXDybs5prgKLrNpnJopRPyVBdxRI+tCyioZZpGdarLwQu4V6yRxKKl7fGo@lists.linux.dev
X-Gm-Message-State: AOJu0YyKTZ9osRJNDsj5GQiOU3x9WMRA0uYpQOmnZkUCKQPW1V3auXXu
	nV+e9rmwriEjC7+2z700C3cS4JeU/JrQg7bpVU30PoEgEzUbdP+25lGMgj9xmt6XkQ==
X-Gm-Gg: ASbGncs5Ui8B+9AxFZmgJylRSr5yYH0NCl95G8RYFI5z5OIRG+a3uKt7Zfae/yLFopM
	eanb6WxI0R1gN+ZpQlxHSx9arZU2HztYPnx9mkA+e8s7y03QpUy0uySjHqgFGEml2iHO1LYWFy5
	ugTHXTUVozhIK7WBdUT6foKibclHOfqKHbGbgDe0AaGMrtY6xRpA1g7IlgCmxE+hsPHRQiyu4NP
	hW2Kl8mmsztDTY2ieLwIXrKQZIAUWcAHMS0M8gvw9ggqn1nghGv3jWGAGFGyqmK51KeWltst2V1
	z0NStmBSm2x6pidX34vzsuBWCQ/riL2jO86pt/N458AxkcfaridCz6qvixCt2gOrFauDAlSWuyc
	N8c+Qw9uzzQMdyIpwvvC34bvnCTdMpbEcU7QtP91OxASLgl6ZnVoR2BFh6xRW+Wo/+EyivsBeVO
	hds01xPniAH6BcsZIUHA==
X-Google-Smtp-Source: AGHT+IG0XyykaxSpAJZEJBiMkxB//rHuKsliNYYIqdi4qrxeJQYdIviCb9iwNXvzzJnUAUziWI3Chw==
X-Received: by 2002:a05:6512:ea9:b0:585:bc5e:237c with SMTP id 2adb3069b0e04-5906dafca4dmr5906081e87.49.1760364906745;
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:09 +0000
Subject: [PATCH 29/32] media: samsung: exynos4-is: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-29-2c5efbd82952@chromium.org>
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
./platform/samsung/exynos4-is/media-dev.c:1337:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index c781853586fd21996105c050e587bf8079cfc095..d6f7601de597e3d3517ef9195d728deb578e74f1 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1333,8 +1333,8 @@ static int fimc_md_register_clk_provider(struct fimc_md *fmd)
 
 		cp->clks[i] = clk_register(NULL, &camclk->hw);
 		if (IS_ERR(cp->clks[i])) {
-			dev_err(dev, "failed to register clock: %s (%ld)\n",
-					init.name, PTR_ERR(cp->clks[i]));
+			dev_err(dev, "failed to register clock: %s (%pe)\n",
+				init.name, cp->clks[i]);
 			ret = PTR_ERR(cp->clks[i]);
 			goto err;
 		}

-- 
2.51.0.760.g7b8bcc2412-goog

