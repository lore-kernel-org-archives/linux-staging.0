Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B0A199951
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697893; cv=none; b=uD3R3M5tJozlLGotbdtAOKyHBEAida3FweUMEheAd0CFuomnSv2wOFLy7rMK2rGjqRRQWQg84hPBVV22rmCe1i3KPNfWdqYloI1im95VJqtW+bp6NAbp9uVTNATcEQn4ED8dNM/OopeSB9AvW/DpFX0yQ5ns+xFf+WRfeBEOfgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697893; c=relaxed/simple;
	bh=iATwc6ufGXARE+6lG0pR6BzacdyrfLO5QVcrh6ufzXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p7sEtCp4o6HqN2qRlZ1mc2XqRC5RKjpfJBgvdIjVgyCfpfJHslAFtRDCeP/d3/An3kHmXB5ZRi0eJ4F2+xgjtgcIwByj461UloZMaDG8oEq//taMybcNSlsazYcAQan7nT/TYuYegeS5Lky0LaH18aFQlR/0poYVeeXZau6+wmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CcGDxu6w; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CcGDxu6w"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb27e974ceso26203246d6.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697889; x=1728302689; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aurzIxhre/dA6wUpFHCHveAY7utZWkXC/gGbqMcXk0s=;
        b=CcGDxu6wY8a2pM8gTe8LWx10hV4+hiz+QTOUXZn3JvLp4WFQ+JvKJcapoYAR1WvG/E
         Ab0raf34m5WkqghhinX9u+TuW3lXeTLWwjnuIkzwSD2t2Zx2yNycWc6vAFKRSFhXcccp
         WRS0wn5pZUZZSfmSnCJ5bq7tfQFN8GYmW1dRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697889; x=1728302689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aurzIxhre/dA6wUpFHCHveAY7utZWkXC/gGbqMcXk0s=;
        b=AV9sWwyZNjw0UHdkF/vNISIEvvPYB64qYpZmpxxwV/GhovX1Z+NdApLsOeTfj8Ww3W
         NZ5xl4PybKN4WRgT+Ky9oysRVuAQuGH3iNZVrLuTqYO72PFOxHGPXsbW/FpNNTqGTwsI
         wYFbw1J6vUh4SzkP+22Woo3IAjn4cY4Zk8XpEKV98JwiSYyJVb2AqAecGKfAR8tXLhPo
         WxzWi498M711u2ItoRKedkFOmAHWNJCK3ha5TkunXViul9X/vqbAjhbEyF03KKjSzw1h
         5M9fyZn46owLQCvXJypCFyESRHGhkkYzS+Bv4Fwqy9f73pw3+e+JxUUIIJVlNkXDA5sw
         xR6g==
X-Forwarded-Encrypted: i=1; AJvYcCXloXG5/Q16bzp6fg2xx3IQoItZuyW92dT7KO9mcDyM7DitnFq7MP7A+HNYZNTpk/TCxuWRwzrAHHj+w+iz@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd9Q2ZhH65KXB9jQwn3KchwguKbNjYU20w/cEhGImLL60eVuvS
	TZBB9fpw5AqdDy8dSlTc33/RdLvwHiqpSeX5LHW29Lc09iW+87UJwEaQHTy2bw==
X-Google-Smtp-Source: AGHT+IGIOHdh67nNwgDel6paDE35Eb29KwEMX4XzmiYgJj7qtD9+Z/d/ZNDrc9s0mVLpMYI/GTz7DA==
X-Received: by 2002:a05:6214:53c4:b0:6cb:27e6:393f with SMTP id 6a1803df08f44-6cb3b63d1cfmr165544066d6.36.1727697889388;
        Mon, 30 Sep 2024 05:04:49 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:17 +0000
Subject: [PATCH 22/45] media: aspeed: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-22-81e137456ce0@chromium.org>
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
drivers/media/platform/aspeed/aspeed-video.c:1944:6-16: opportunity for str_on_off(v -> hq_mode)
drivers/media/platform/aspeed/aspeed-video.c:1230:3-17: opportunity for str_on_off(video -> hq_mode)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/aspeed/aspeed-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index fc6050e3be0d..9c4a47d7a442 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1227,7 +1227,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
 		 video->jpeg_quality);
 	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
-		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
+		 str_on_off(video->hq_mode), video->jpeg_hq_quality);
 
 	if (video->format == VIDEO_FMT_ASPEED)
 		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
@@ -1941,7 +1941,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 	seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
 	if (v->format == VIDEO_FMT_ASPEED) {
 		seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
-			   v->hq_mode ? "on" : "off");
+			   str_on_off(v->hq_mode));
 		seq_printf(s, "  %-20s:\t%d\n", "HQ Quality",
 			   v->hq_mode ? v->jpeg_hq_quality : 0);
 	}

-- 
2.46.1.824.gd892dcdcdd-goog

