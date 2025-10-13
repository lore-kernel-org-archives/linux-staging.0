Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0A2F7AC1
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364920; cv=none; b=oweNpik3bLb2f406+KxWkEX/jhankh8zOZ4H/Y1OM8aVzRCM6VTPuHkHFv/iSYJoMAXZ2Ny7bmlCbPvXbRa7VP8jT4r7FtoNaAUkUcY6l1QjPMqrHxTJTxtKSXZAPaAN3jHEP3OVqFQdZqGTvvXG5VE4ugnOHUaPUdnuIVwySuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364920; c=relaxed/simple;
	bh=8Y3wF3Ogu1PTCQAe9QDSmk3/csBKQwAsoOPfpiyO1ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3gsImdaLetMRUhSeaApKwcJYME6L1u9QSW8midox5zyOd417QOq4vwYZe/m6LaDesrEqheOYNU4+oJvmik9BBkPcrYAOu7JLSJ+PV+Hf+bZlrModBUswS9Zl3BJnOrIsBv/wmGbqnu2GyAGnkHIp5nc2EAup3Jw24kcnafayjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VIWLo0Ar; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VIWLo0Ar"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322379e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=VIWLo0ArRkBCOYeoc7G2R0KrnXzAXmTapQGWYzzIC6Flu8nn5K6V6eKbZJAEUIVHfL
         TNnFwJPaDTAD3sHknCWP1gcJW6RC1l0QwYQcpTtWdcDrjzAvgdDbMVYzZn9EK9vztjPI
         yqc8iEPUWZxwG6ZGmUURdmEXruIQ33973b6nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUxX/9XhZ4PnNBB1T7MELmfGG4IHXE3ZwCx+Au9dRPU=;
        b=YfaB77YAW0ETPK6Aj3IZdLN9cE7S8r9XhFXXOwan2n2lGAxZb6uwXcp3/B2IiE0yOa
         qsRPX1FeXQl3MSYXN0jcoITP0uTUtGMbnxmm7YV3WtTviCJd5k11PcVQ39Du7B1fzFXE
         Xf/v5ACi4MHSbPehf1ez8Q+Yae80mB1DMftPuvJ7WKKpHFJPHWbFLLDvdzUqtwynDywN
         daeANHt3p3iDOaCarvDn50MA+IlHsb+O8FcBZQzhP77cymL0F7JtsueeE6ik7ZX3+31j
         oDd/qjaUSiCJLNYKyIroTJLEmR6kX8n5qiae0Czhlc6/7iAmVWuBvvNAHHwFPYZfJK7+
         /FLA==
X-Forwarded-Encrypted: i=1; AJvYcCVm4ApPZq0C6sm0N23fsbGgG1QWA1ma07agCHtb2PRJ5BTjTkDwcdMqcGPpit6PnuUsrMTcqo6I7gI+yqz1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5nd4RHTcKWW2Og82Ne1nkO6hr1D441GL+t9TfJWMSSmV1Mago
	RPgIbz6ons/4HKR8uKZ9mYrutrgkXmLRO/pMPSYsPux+5nPyL2tiOtL0jlAjVbyL9w==
X-Gm-Gg: ASbGncvZ1BBO+J0Ax44njN1QS75hzAKJX+JfQUsSToDY3g0rCTlGVhwPQsAj6v2ts5y
	bBXCJtS2hTkyRdHl0thKNbh2TCZIKJK86gA2+aZVl9/583F+2QAMnPo79LGJAEHQFCTvX3W4W5J
	h6f+cQvihih1x94vTDVeEDGR37ErkUgTgkJMo7YWQikSlgupO8w8/5q2NJc/vfAhq2pgzZYm4Nb
	Y3fxt4/MdXLr76059b1nEZ7cK/UzYmu13htOIkC3VcWL06xmL4aPGvs2MHH9U90JPK9aNhiAw2h
	+FNnIRXSO5ak3P4e6NwS7GqqmRrlEoZ8riNjWFICjD0TbyUXl1MlgebUbbMdq72mS0mR0pb/mBR
	CdArn42WgLXmtA0jAcbK4sAy6n9rg75beBE9tQGi4z9OV4zhf+qQBTrfSSGmwxLCA6eOOqrcd7M
	1KTeOX6q72FaztOcbSIg==
X-Google-Smtp-Source: AGHT+IFTTHLDJWS3Dn9Gd32yhET2ji8RYegzhadBkm4NFBADg/24WPxUjewhK5Qa14H7toVcPkN+hQ==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d11f with SMTP id 2adb3069b0e04-5906de88e60mr5677489e87.44.1760364904333;
        Mon, 13 Oct 2025 07:15:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:05 +0000
Subject: [PATCH 25/32] media: imx8mq-mipi-csi2: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-25-2c5efbd82952@chromium.org>
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
./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..d333ff43539f061b8b9cf88af2cda8c44b3ec2a9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -418,8 +418,8 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(state->dev, "can't get source pad of %s (%ld)\n",
-			sd_state->sd->name, PTR_ERR(src_pad));
+		dev_err(state->dev, "can't get source pad of %s (%pe)\n",
+			sd_state->sd->name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

