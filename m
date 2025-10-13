Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8642641FC
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364896; cv=none; b=qKmFSuj3uug169nqnrEkHWtVjXBkHDJwwhxWUP90WGJvxrqWt9hTRjdtvBCnz/OhBcCJerGpm4E/4VaiN0mMDHdbrbt+xdDx4VZUDI38HXkdrDkBuLOQZ2PgSjchwsecdQXCxGhUeW8vthfDSy8qH2nZBl7joqp9d5hxDesO3q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364896; c=relaxed/simple;
	bh=L4Qw/JWLTT0dmHppUcAHgP693zq94oqrBxXz4v7GMl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARluemX5i+BLlrN9AJPS4Dh1mjwizvVP2dFqNw7v5ohjGkGiuFPSiOuMBqB/AAQ8EB5tXtfBmhMjMXmGXzXRIW1Zs7aPq63QweztUZvW/6hpejU/OSSGX54FeQfUx3Ye2qpoK5luDmVoDcmmVEIHVoIIu4iv/Px/eFsGCItTiIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WosrX+kj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WosrX+kj"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57992ba129eso5322070e87.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=WosrX+kj6h0daO71YYlROXXUZpmfBqzeZltnkCB/k5AEoqpjfbxnt88U2q+jQ8Fp03
         /snVw0Gd9VF6zkft5IUhMNTYz8n6++oy/sPNVqgOP9wIqWeRS7Pz8xwHKkWpLu3y++GN
         GjdrtmD9+Tq0WbhxwXskVzXXuXldN82Pb09Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=Ha/qe2tm0pRrBoGCQl3fPEFGblurH3hzyWirXrSzREqtOw+rEyZxMBtAxH9g49pDMK
         dQIiILjnQilMH7FXxGfBL300tF52H0xpkgUXwJHWeVKMq0UsDPG8lSUGHynR1hvKqY1u
         Xt5hLPjUMTq7bcFHp4NPPiM1VqgmHqp9Hp9+I+vvdkDNn9c/tNkLIsDdAmtCUDCOdPIg
         mPFH0Njxvs5uEPLPjS/0/p4gXshaPbGz6UZ6cfrP3v5GwAyV1RYb7vC2ufc5avyXzYv1
         RwMjy4gFU3duHy+VW+DAb1IxEUxseKmegNSPzZPq/cvkDiUGflphdcsxENbwf7McOy2m
         ooTA==
X-Forwarded-Encrypted: i=1; AJvYcCWTibtd2A0uAPiCMjnSYeTCg/Id9VbftcEw/xqw/lC9+YYF9xxQJ9WkwW6akpfHyzWcJ2UH66xTlxbSt/vj@lists.linux.dev
X-Gm-Message-State: AOJu0YzG8S7FjHc6B8TJD5BrOuYGTmU2b8lp/wpqKLhKomEQ5BlDu7fy
	fBkcn3EKdY9EzYp1XTKS93cM9DQqB6x13sHP0aIud4P4Nxw6rHVt/8NY5ilZjjgA+A==
X-Gm-Gg: ASbGncv34gpp/N93Lh0NWjAD3x5uzWAWYo4IosNf86l7NdygmUXi0P1QMPkRJZclGjr
	myvalukXW5J1kb0P+5/H/L6wVmG/svB9E41bgWl7OPf/ZRv3l8MsGSvSsaUmfrtiB6dXYYZ4n4t
	fYKj5wGmswFYnz5PLoP0zcx7XNe7VYRqPamnUtn4lCQzyZm9DH4c/5y2cxmor7O4Z2N7KOk5QUO
	NU4wNL2PWPJfye8TDH3uS0yjCHk0N/7hNCWTmRunyAxiq1ccGrcmXmouO59Ht2qa0AWvGrHhT/u
	W22Iat+0zcok0jbZLK9cr7OCZSrJwUIiN24WWT/cBkUvo+sdHHwSFepKJZ84ZXBAAZUxAEcBzLR
	niUX1gGBbujsqWwHHyypOJxQzISPR5ef/3ZQxxsPfIoQACIKFQP1bio9IMfMlVoQPoALDePcyoE
	SOVlsbJ9+UxkGwwZCY0uOO7W1TARRs
X-Google-Smtp-Source: AGHT+IG5qmXDx4UbLHB42EHlB1t6C5RYlcWqyFNneQm/x2WKvXaXI+FP3no4d6C9H/LUJRdom0BMRw==
X-Received: by 2002:a05:6512:12c9:b0:57b:c798:9edf with SMTP id 2adb3069b0e04-5906dfa81aemr5323251e87.56.1760364891242;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:42 +0000
Subject: [PATCH 02/32] media: dvbdev: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-2-2c5efbd82952@chromium.org>
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
./dvb-core/dvbdev.c:575:48-55: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716aec54bab7fde2c94ac030696fe25f..8b980d371a45e4fec5368a7e90d4c42518b72e72 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -571,8 +571,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			       MKDEV(DVB_MAJOR, minor),
 			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
-		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
-		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
+		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
+		       __func__, adap->num, dnames[type], id, clsdev);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);

-- 
2.51.0.760.g7b8bcc2412-goog

