Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7F918F2F8
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697853; cv=none; b=nlhJ1rvZSi1/ZMITX4v8YFFUeil9y/HU9kal1lMdFlq/q10uUUKmL95NfvCIPvHFRtH4gZjRyQi/QgMskhYeT5o7fxtFJN97L03aLgmD14PYPXTMVTf2+GEkiGOb/4XXLq9Izz375VlhO8ROQjEDyVaHK+jSEwfo76XenqBtCus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697853; c=relaxed/simple;
	bh=TBylZ8SaoziYjUVhpT7D5LPjCQTvsm3WiWvgxJj6GRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHjdUBFHFtXxncjt9//p+vl/nl/1PWgy1vc7PZQjW6FsI/SDmmk4K99db+iXvIOTXN9qqUUThS6+aM2L97WF1cytaCtXj1mPwCWPKZANhkBO+aOwtIKaTTBOAuJzlX09CtPnXbBW0ycqjUm6YA9k/+RgOg/jRGNEPZOYofAG2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OAxdEwfd; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OAxdEwfd"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7ae3d9a93c0so308125085a.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697851; x=1728302651; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHKPhMgVbBroKUSOZVkcpmjIQRoUB/Pllvr3HK97AsI=;
        b=OAxdEwfdVNPWJLJWLBxywAhAudd89kUuhhYuYkNQwvaM7vk+WGqdK6Yg6fALapCrH4
         v2qlfxS57SSrDhDXKDsXzMEHgscLK6XcFAKE16pxRZH+7mCfeYfvZmydaEyySP6z5Ovb
         3Nyz0V3dDUjU+mnR4ofqZ6x4YxaB/x3PB/GRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697851; x=1728302651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHKPhMgVbBroKUSOZVkcpmjIQRoUB/Pllvr3HK97AsI=;
        b=fDxH35U8PgvHjv5fDts+4xmJdIgOfQjddwQtWMI2qCMBVRuNYP2qFPBjKKmITEalu8
         +di38DZseduPNpERzeNwebVPaksTW+8eukgRoy7NBsxLhdZtU5NP5VAeHTfIb8+rMqHk
         SDs/GEDQv1abLMI5ibU/AM+m4tjBAUnxYnaRCuuHOGx4beTcYrShEIP3UBaTLkOP9sKa
         P5DSBMMo8HteRtC+M7qvnwHxsDhWM7oip+2jNII2Q64t6H3R8rGhCa4Is3MKtylH0Wwy
         acx/wtMEWccrR+ao/w2rrBzxbXoO27I1JXMNkgDQOEAIl5EKDWe2XP8a2CH4OAv+B6Yk
         /Jiw==
X-Forwarded-Encrypted: i=1; AJvYcCVOHxQjtOrpNJKIxTXHEHR3hqM+oQoXN6ej0VylNq2kPXYV6r8dwK2nAktEnJO8Jvogc9nldPA9+Tm2GSZE@lists.linux.dev
X-Gm-Message-State: AOJu0YwVtK6DW3q/bP3VrIhWGClaD0ZP4W1AJtEbPuKyUu8g+DTgo8R9
	W9dSiawd51pCZMvdRuPN2F4C3pIMR1+Dxkbvk+AyyJnfcceB1SI0Z98upRy4Cw==
X-Google-Smtp-Source: AGHT+IEk2U+7gH+P0zkQD3jLvaacsDuUtudGo2qx4V1eWgV4awKOL7SjyupKFoxi8Ld99dzK+gKdEQ==
X-Received: by 2002:a05:6214:4a89:b0:6cb:2adf:751e with SMTP id 6a1803df08f44-6cb3b646986mr155979836d6.31.1727697850717;
        Mon, 30 Sep 2024 05:04:10 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:59 +0000
Subject: [PATCH 04/45] media: pwc-ctl: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-4-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warning is fixed:
drivers/media/usb/pwc/pwc-ctrl.c:492:5-10: opportunity for str_on_off(power)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pwc/pwc-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pwc/pwc-ctrl.c b/drivers/media/usb/pwc/pwc-ctrl.c
index cff64d872058..a1b4eeb41cfe 100644
--- a/drivers/media/usb/pwc/pwc-ctrl.c
+++ b/drivers/media/usb/pwc/pwc-ctrl.c
@@ -489,7 +489,7 @@ void pwc_camera_power(struct pwc_device *pdev, int power)
 		SET_POWER_SAVE_MODE_FORMATTER, pdev->ctrl_buf, 1);
 	if (r < 0)
 		PWC_ERROR("Failed to power %s camera (%d)\n",
-			  power ? "on" : "off", r);
+			  str_on_off(power), r);
 }
 
 int pwc_set_leds(struct pwc_device *pdev, int on_value, int off_value)

-- 
2.46.1.824.gd892dcdcdd-goog

