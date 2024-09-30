Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1488A199FDD
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697896; cv=none; b=bRRo7be8SwiY32ciaCa7WGY0ScE1IKGiBy6V1IX1ttVAJ+2qny7sAHLaU6Wk1jsyt4V5g+z0Mwqq7O2FVnnMtenwONMBiAIE0wjpNcC1RlfYSoT05NXWGuxA2I6Qv39RzF+vQ6aix9HXDGDR1uvzIFS91P1BgbsBJYF83xF6g4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697896; c=relaxed/simple;
	bh=Wy7Skzwx1Of9aMKIpNRDdVVt/EfLoQQHwwrlTgvOSQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m21ze9/1JyE1xLdRhTa6605Qvhq0awWml0wH7gYbgnaU1WDjTsnWUonItRP0Rw3feUjMGL38OSW1/aL1atBAdK7mdKcnT3Wkl1wuLctzj1tDUZ1GESL1pno3zSJEJdSJVgdKEU3lbf/YjXYs3/vjEpZ2zz1M8RezrolAharNofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OpJAkCBS; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OpJAkCBS"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cb2aac40faso38500516d6.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697894; x=1728302694; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=OpJAkCBSMgq9uJcdtOa/XAcfWcZ+dbye8e3ZpmTSTv8/JsVS+3GFSfdkvUdpW034is
         HZ8K73JBEW4olwgIKnpjgrbLj05tremn6YGig4KHRxBLqt7ywJXfNiXHzG3atvZpyEP9
         g50CG1T8dVQZ7iMoCYdv6OITl2B0Fh20dHt4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697894; x=1728302694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=hpRDs7WgD5SG48kAunqIDfgwHC/sbdVv3SNjGzqzz7bzX8MToBbO8ej9X0DbfPWUfo
         eqQwfGG2Mmv6JjMyy0ZHYb+sMhosCKOTiQcszZFdTeehMAdByqMkottgZ0ZtRc22zaKJ
         ePH155NOD1Kk9liGW3BW/2R259cbsJXNDAn4j56dc8nqtI2N9P/nBryu0b6ZItjVW/OR
         KRlFGXUK+dfper9wtnNkoU0L6ZRaVHTsQeKiDdBaTMZCCDAtxABX6VxI/mVdiODgIR6i
         DFUxfGgFrdsIJ49yE6gSQ8swA4N+YWgNDyjgKK7mr9dBbsr8g9sQTwbrm47BFcgy8Qpx
         pZQw==
X-Forwarded-Encrypted: i=1; AJvYcCWUlxVSNnu+AawuoUoWozgrG0qKlvN0Zg3dtDNJ4QwpwjhpiNqRqJ38gAR5KpDY05H03kcMjRJ8z7bMduEz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6nE9zbHHoyXPmDvQefkVVGpQRv/05hjlyKBzMHBFmFAmEdQDp
	DC+MS6INb08BgqSa6zms0Qn2BLOqiw+Sqv3j5yIcEXrDOKA+qF/7v/71XAeLNw==
X-Google-Smtp-Source: AGHT+IHvTtSCRFSBPeJou8A8lJWRExB8EwT4CA/+ss3rMSh3j0C8PX4s4DLpZYrCskrdUJWUEmVJfQ==
X-Received: by 2002:a05:6214:489:b0:6cb:2de5:d7a1 with SMTP id 6a1803df08f44-6cb2f270becmr284661826d6.8.1727697893842;
        Mon, 30 Sep 2024 05:04:53 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:19 +0000
Subject: [PATCH 24/45] media: cx18: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-24-81e137456ce0@chromium.org>
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

The following cocci warnings are fixed:
drivers/media/pci/cx18/cx18-av-core.c:1013:40-46: opportunity for str_enable_disable(enable)
drivers/media/pci/cx18/cx18-av-core.c:1118:8-24: opportunity for str_yes_no(( mute_ctl & 0x2 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx18/cx18-av-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index ee6e71157786..5701abdf9427 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -1010,7 +1010,7 @@ static int cx18_av_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
 
-	CX18_DEBUG_INFO_DEV(sd, "%s output\n", enable ? "enable" : "disable");
+	CX18_DEBUG_INFO_DEV(sd, "%s output\n", str_enable_disable(enable));
 	if (enable) {
 		cx18_av_write(cx, 0x115, 0x8c);
 		cx18_av_write(cx, 0x116, 0x07);
@@ -1115,7 +1115,7 @@ static void log_audio_status(struct cx18 *cx)
 	}
 	CX18_INFO_DEV(sd, "Detected audio standard:   %s\n", p);
 	CX18_INFO_DEV(sd, "Audio muted:               %s\n",
-		      (mute_ctl & 0x2) ? "yes" : "no");
+		      str_yes_no(mute_ctl & 0x2));
 	CX18_INFO_DEV(sd, "Audio microcontroller:     %s\n",
 		      (download_ctl & 0x10) ? "running" : "stopped");
 

-- 
2.46.1.824.gd892dcdcdd-goog

