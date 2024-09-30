Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FDF19AA57
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697897; cv=none; b=FphhOvLVoObj7hbONaxckwZzAyOHZ/Szl+1Yne2jQosYAF2tqa+hj8u3AoAHFcdV46jB9HRpF2UFlqlwzOTYwjOah0blvRP9Q9hCZmf76nsHvWasjyrlI/KcIONWcngQwilyWNLyMBddobLsoe7UuO9k+YhbIudG26IIqSeKMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697897; c=relaxed/simple;
	bh=1g0+rmMwCDuGWvS2q/K/LC+NTqBE6pcQhTrh1e6y+HA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjylaoZitDBST7426kogHvvSHeruhL4+j9ggDMVu/RioUy4YUjfu5P8EZed6560hIoU2R+jNobJkGme0V2YSyKeuWgPQkNat3zV2DqmBgiTATXi70DpmScprKgNEzB6yDk7Z5m+x9syNYohPpkhCMFB1OYwyGXU6sI++DTVdLmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=USBXmoI2; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="USBXmoI2"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cb2e5d0104so32209566d6.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697895; x=1728302695; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IxOY0fJQbV1pYrixFE+l++vJW3v3+bYS5tnnmoYTEc=;
        b=USBXmoI2kq6ZJd1amXyIBp9NEfW9OSsOmqGk57Om//CAzeFnU5XpY3w37GEAd/JcNt
         oYMnOoaZ/UZMQYSwXC9iG8giO8IHlZTSmHghfuGNDco2xpofrbjkK+jgY1K1MQrNfs9u
         46/9De/xEgf0/LM/nonCMgbjADhAyp2VYH5LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697895; x=1728302695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IxOY0fJQbV1pYrixFE+l++vJW3v3+bYS5tnnmoYTEc=;
        b=BNOh7nOzOnpigykz2D3InK4Tsvu1Hq4L1HnOx0Mf1hupTaHB/vDzD+RXBWRjdMMkvn
         RlqjDb7sIbgedRipyeFSYJlNrZ1mIKZB0YgkN2uU+Vd+MkCSzPP1UpzuTDYNC/mXfm9C
         Znmh9JUKOKl8dnUOn8zJFPunoX23u7vkvRIF+oSYc3y+W8044BfUA2lk1xZDvWpZUeVb
         bWwKR0MGu5n05FR8uizIsJrKsrh+zpLq2iXao49Ooc7BnUFTy5T2hysnZJVscW6PxqXt
         ++0soR8QzyWgjQfEtJpMFqEhtM7TO8VUZKK/tbD6q/k1jXqA77/3lksNpMvg0Z8Ej6I5
         guIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjpu2ANI2LiKNrTH6ZEzbv2wlBkkzQicgbpuTGTKuI0EBmkLMAMwOz0ZG0JyRwXi6D8tMlhaGxb2nwigfI@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1GBBNy1AMGAgnBwqP8naf6PjQuMIfaHowJjMmmwGDm+wiBtaM
	M6frv/Ip42L3sGBqgKqkvrOGnXeodBekrtdBvr80/qWap7ZXmKtQ/F1sz9zt2A==
X-Google-Smtp-Source: AGHT+IH66496SEOv3j8ygYtL4JJVB2nn5gkUmde7+6fS5LT2xRJFvFwOVG+MRgiMM8u5XXNXcxJVyg==
X-Received: by 2002:a05:6214:5b07:b0:6cb:5dd3:a3ce with SMTP id 6a1803df08f44-6cb5dd3a78emr68541006d6.14.1727697895340;
        Mon, 30 Sep 2024 05:04:55 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:20 +0000
Subject: [PATCH 25/45] media: cobalt: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-25-81e137456ce0@chromium.org>
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
drivers/media/pci/cobalt/cobalt-driver.c:263:25-33: opportunity for str_enable_disable(ctrl & 1)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 6e1a0614e6d0..cff2d29410d4 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -260,7 +260,7 @@ static void msi_config_show(struct cobalt *cobalt, struct pci_dev *pci_dev)
 	u32 adrs_l, adrs_h;
 
 	pci_read_config_word(pci_dev, 0x52, &ctrl);
-	cobalt_info("MSI %s\n", ctrl & 1 ? "enable" : "disable");
+	cobalt_info("MSI %s\n", str_enable_disable(ctrl & 1));
 	cobalt_info("MSI multiple message: Capable %u. Enable %u\n",
 		    (1 << ((ctrl >> 1) & 7)), (1 << ((ctrl >> 4) & 7)));
 	if (ctrl & 0x80)

-- 
2.46.1.824.gd892dcdcdd-goog

