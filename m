Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F2B2798F0
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364899; cv=none; b=Xjx1ZGcbPL2jmkArA3jzSGL+y0qJYqF/JPfByusCmEF7Aj11cfCEpNSUeNhY8zlJ8zDe0O8H2Du3LX4xryqgTgk6h/pJeMO2vB8yVYZtKftH9mMt3dwklQi/1Lz8RQrE0sOsgzQmDjX3nPjcgoBZGJxJPTbqCVQf3BI5YFm2skQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364899; c=relaxed/simple;
	bh=EWbKp6zVXKla0AyI4Ib0EFYpCMHe2Dydv7j+omIlI14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIMx5PlDVi1QHRh4HssvcI90RhoibiomatJAeJRwQdXncUCaTYPViuHy/xAAnp4VzGizLvRqja1JVyEncQSP1W0SpgvokgrgUMekiHx+2SGw8X0Fu2IPMWVUkDxfLyfFN/bLh0GLsh2CEZfw3tjb5FMtUto697Vxe5evQqJV3nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gpSPBRyR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gpSPBRyR"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57ea78e0618so4953155e87.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364892; x=1760969692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=gpSPBRyRL+5WKunlcHKyUDCXtWot545Z2LgI9WjYDeka7HuTn7nrxlqD3b6mztJaCR
         sWcCcALk9FJegYdYQ/dQOvEqH8zxYscBFnZjEslnqZTR75E03UWDPQbEAKEI35+499dS
         bSHRnhY+dHT83FYB//Gqt3Qy17yOa1DIyyQUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364892; x=1760969692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDkvCYuJbKI5HTEwyE65VkdYWfgRYyc1U+blXUUQVgU=;
        b=DhNC0Vf51BjZO4q7HWMEr4EsW9rX1YIV57yblUyoM770gUoWLWieMqJI+6dMo4I1ex
         39K4Gy2cb3g3hni+fqH3NFs+1J1RwYFQtU/UMYjs74s6H6VU0oosYJPUtz4ZJRC/EPe8
         Phk1SyuJ5h0SEXNFr4ZG4kAzPOrwIlxTFMZfW28t640goBrvyoDFu3vBjROBMBvQmKn9
         MpsubEi/OF9UU8eOsD5NOMFLPGLNpzmKA203BYw+hooOgOQauTBdxlr1Z4d2zHIw+Dwf
         /YzyFeo4KY/kgd2+t/jKEXs13UeqsLAqIe1CxcMVURIaDSX28sApi74ZL1NuYoO8j+a9
         cPLg==
X-Forwarded-Encrypted: i=1; AJvYcCXM+PDjGKcCCK+ZESlwTFCodL8ymUWBPNxBYGQL8GCWyIn+tzMOEP5+4tkvZ2vuDJ4fE2ihV0gmP3gi50NC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9OLamBEWUTCbmJe8cm+hHNFj88gmMBXTCDAgIAl+usU53b438
	gKxU8qxPK+0E/R3xfdh6FpfjWKK3leHFdoGce/TmnBQ0qW5G+QzKC5T9hHrIWs40cg==
X-Gm-Gg: ASbGncvmSzIyyBfNUxInBF5vAzK62SLwSze0F2INLsizwv11Kv5LuZ21vv8WqFW5Wtb
	ZBCWUfprLTVnYftt9QYcsT7OJL1LEj4t7k1DAtcFQEFvGsTwk0yiqeIqjhL9FTb73DnAtEfHtJk
	pUsEBnZXALCCLvJyq1yA17XIYZuOqagVawhEEljo2njOsYJXigzspHcp24ZAI1XzUNuJSILpGV2
	dpWImtfK34Wt+rx/SFo4tZ+Eq14qbJSwE38+HGnYvBqiSNIKCNf2+ZGN5FEQfqOtO7eUkYrOW0h
	nbBGh6KzL66BvOiXNbhMVDDD4fz4qpg0vck1kjCocyCP5Qjg8FBy4PfpiU7U66ewwg8JQxW+KZn
	yiSyw9N6V3HcXIRbn++ewsEyU1EjZ7JUj+TpYQMtGYF33tQNzPgvyPDU6r97uySbdreWoAX7+m8
	/WwhMhZd1zidSmw9yWMA==
X-Google-Smtp-Source: AGHT+IERp0UGzsms3m0FKqLtDNsdKrYzy/yeu64vwUTfcVOJBQFfqT4aKP9avdaubkT+3l9KavisJQ==
X-Received: by 2002:a05:6512:6192:b0:579:f4b3:bc3c with SMTP id 2adb3069b0e04-5906de86e2fmr5500248e87.55.1760364892337;
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:44 +0000
Subject: [PATCH 04/32] media: adv7842: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-4-2c5efbd82952@chromium.org>
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
omitting PTR_ERR()

This patch fixes this cocci report:
./i2c/adv7842.c:3470:16-23: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7842.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 9780082db8415a3d65860666d0dce8399f57e4e3..a35077178a0950090369e17b4aaf9904da041a00 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3466,8 +3466,8 @@ static struct i2c_client *adv7842_dummy_client(struct v4l2_subdev *sd, const cha
 
 	cp = i2c_new_dummy_device(client->adapter, io_read(sd, io_reg) >> 1);
 	if (IS_ERR(cp)) {
-		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %ld\n",
-			 desc, addr, PTR_ERR(cp));
+		v4l2_err(sd, "register %s on i2c addr 0x%x failed with %pe\n",
+			 desc, addr, cp);
 		cp = NULL;
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

