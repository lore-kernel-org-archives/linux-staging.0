Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9C519D8AA
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697909; cv=none; b=UMgUbDcXruxMPfIqjs+04O4A1bbBpYoQ0x7+AIm+FJlxppy9CdHVR1+HCuaB3rnBtA1C0UpfTuqQ8zjf2UFgInyA+VbyvsyPkkEQF+NkTYL9mpe3anq/X7xxffOfb6XekT4QwS5GpX9RowlrwLdSbmBWxA8dQ/aecjhYxByhD1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697909; c=relaxed/simple;
	bh=4z/LssQ02GJNR8bA1yxT0qSzeZ6+9fo+8Pg8B3PGX2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=depQl1leJUM2S1XBG7Wk0hi0NNDlg9KSSZOUvmIzdlKXe+MHs1lm+4paX5E+NmSxo+xLhO8uMv4q33g7pXzEFblXMrYZMJNddnYxtnikQf9JbCNjkFU30KV/uz2DAz/3gviw81RuEIXWQwjHXLiP8qU30+k7uoay3oiBwcqcm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oamac5fh; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oamac5fh"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cb4f1137a8so13032676d6.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697907; x=1728302707; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeZpI3Ra5CG7IMhE/CKrUPUz5revSFC/2gaO36DfqMw=;
        b=Oamac5fhOb8o0MSSeG49lQ8abYntP8QHiTR3Wiu2Yct9inkzHqxnbzCojw1epHGdYG
         r+sadzeG+cO4aCs+sLEqZz/ttHVsGctppcTY13ji1mJKPW/RszqMAzjRyPlRi+qm8Shu
         DOEAbfU5uzn6IhWJh2CrfWjgTu2RHwn1m1mZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697907; x=1728302707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeZpI3Ra5CG7IMhE/CKrUPUz5revSFC/2gaO36DfqMw=;
        b=cnkFtOgXKvt/JU5shThDmkvI04PQQe2SpgffND42YlQqm/g/cQiA7o7qgQs39otGwc
         Vg6PzdzTmHEeymtNOlCX4QQV1BVNYdheQDA9o0u2MPjY8cPRdNyBufuzq55mXluOrz1c
         JMUV0f9xOzG+b25f16ZRFe43bxbnuyr65L5/XCZnWUGfcWatPiRDej9d6ApC4S2ml7JN
         DHkIVKEF07ktauc4jyUWu3M4E7nCStK0jwUKpL/8pv/KgBQijJXtSprC7llhh68QpDvq
         uw7PtCz2hplkOWAxzodzRlpDS1pSHPW6awOFs7+reiCdptejoQ53/9bJ+BZPIeq8RLVr
         3sXA==
X-Forwarded-Encrypted: i=1; AJvYcCWSS9t5WHIfS3AfbGQ70nMqnoPpQxeZmJJ3TE0Nx6t2pDck1L25MkE7pdZapt4Pa+2EAxWZkpE8duYIStyx@lists.linux.dev
X-Gm-Message-State: AOJu0YyhSSqceIorCOSRRk6ikOvTjoTxmoa1lxU5yyYCJ6JjKfuoeaAk
	Y5+GUtmPL7BL/w93PZp8/JNfF/fqqSPMtqrc6nSPoR1qoGRyJ1R4LuB7suNPaA==
X-Google-Smtp-Source: AGHT+IFyOtAPK8xGQ/QMRxJMYu6WDsr9USOQ8VSoGNgApI/9s4N+ulaKyT/ysJasxumVieqsjFFOrQ==
X-Received: by 2002:a05:6214:3f84:b0:6cb:455e:da5 with SMTP id 6a1803df08f44-6cb455e0e83mr174779006d6.45.1727697907195;
        Mon, 30 Sep 2024 05:05:07 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:26 +0000
Subject: [PATCH 31/45] media: i2c: vpx3220: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-31-81e137456ce0@chromium.org>
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
drivers/media/i2c/vpx3220.c:404:41-47: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/vpx3220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 5f1a22284168..c5b031dd59e7 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -401,7 +401,7 @@ static int vpx3220_s_routing(struct v4l2_subdev *sd,
 
 static int vpx3220_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	v4l2_dbg(1, debug, sd, "s_stream %s\n", enable ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "s_stream %s\n", str_on_off(enable));
 
 	vpx3220_write(sd, 0xf2, (enable ? 0x1b : 0x00));
 	return 0;

-- 
2.46.1.824.gd892dcdcdd-goog

