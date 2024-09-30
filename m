Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844D2192581
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697866; cv=none; b=gcf/hv/O8bEcL9rjcJ7BzAUXzJ/x6x0R9azvHi6x03x946DUevAV7n7qUsHjWGi5pcrSAGa3wa8OyiA67XZJ2T3qvfCS9PVVY0sO554nkpD0e9/cggPhUe0EonW+hybt7s7phxD2d3eRmcAF1OPLNDifeWhD3/hXjICcta85Ssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697866; c=relaxed/simple;
	bh=WfL92qRYRM/NN8550n/7vszyPNHtfWY3JGFtsXpdWIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9ktIXfO24HOz+ZMwK6gjHHASJQqd8yBSbfEDlSLDEFsAS8hV/H9AGoKH9XwtuQKmmFesQCnGktRikclfnR0V9Xgx1Jm8v6ao4GwiPBHTHO91DZRIj/wCWYQVEHYvSdjHz/DS/W7W3K3+jyY1gt2171lrs2hL6S/mzc15EggJF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oRIbCOwh; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oRIbCOwh"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a9af813f6cso405577085a.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697863; x=1728302663; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42a4vpn3QTtS0EhgGJlcs62eAaEwJVXQ21s4ykHFIBI=;
        b=oRIbCOwhZ/fjEIygtdfnWbDbZ3F1+Yo3iAKIPmOZ+F+ioROdMaZdGRnn51SLAMy1jd
         VqZaspQwCHlmbUyDWem7cdOha7D9tIm3BQ8ZbrV2/kVXRX6sVQMuuGtnk/qgysdVHPne
         JiYNEGyBXt0nejdC8GoTLJ4YPK4s/np8IAO/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697863; x=1728302663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42a4vpn3QTtS0EhgGJlcs62eAaEwJVXQ21s4ykHFIBI=;
        b=v9YQ+stzQ2vauACT4/ApT0en/tn01ofaTuJg5lESMxvFllP3W8glfAF/UscMtZtF67
         AVN/cXrzTG1evmZSuoaTZpEbUNVY2numdqZ8rUppbEMB0eEpInDRaXqlbypdcyPzGe7l
         fVU5IESqCSR/QugZ89D4FrlAO6gErxv7xCwAwoOh5il6NaTx1lwX5l2cqpU+VJPk2WWa
         li1gcyW65o8sQ4P976h/Qh732TR9egriGByZmVd+MI3u2HiZvYuGwXdgwSK81rHbAJl4
         p+2gkQGbcl9j9c3yYuZCpH8rwQhzENtXKWNBXCJsU2Rf6Ast0W2YvoIb7Ra1QhzLB19P
         a8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVLnqcWyUF7DUCCfJ/Rez4LJz8Vd9V9W9IltC6Uro4l8JRPYqoiJUnnWxcHk+qsebJYIHlDMlfsfuIGW1dj@lists.linux.dev
X-Gm-Message-State: AOJu0YyQwihTJPB+pZ4AD0BjvVvhstcRj2wuQRibCZFes7wUpUR75MaU
	2rnKIKGmtnIEDfVl9aqQk3ddmvWEL94ljtcPHfTgo8Lni/BEOZff49dgCcJQ+g==
X-Google-Smtp-Source: AGHT+IFlDabMazwXnqk+xIMlKgzFONIbVzdm9vY20CpqT4dLcojtxwjmPMueB5KKSCBhlfp1Ts2Ejw==
X-Received: by 2002:a05:6214:460f:b0:6c3:5ebb:9526 with SMTP id 6a1803df08f44-6cb3b5f2d1bmr196194196d6.29.1727697863111;
        Mon, 30 Sep 2024 05:04:23 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:05 +0000
Subject: [PATCH 10/45] media: tuners: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-10-81e137456ce0@chromium.org>
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
drivers/media/tuners/tda18250.c:110:3-12: opportunity for str_true_false(triggered)
drivers/media/tuners/tda9887.c:296:39-54: opportunity for str_high_low(( buf [ 0 ] & 0x20 ))
drivers/media/tuners/tda9887.c:298:39-54: opportunity for str_high_low(( buf [ 0 ] & 0x80 ))
drivers/media/tuners/tda9887.c:294:39-54: opportunity for str_yes_no(( buf [ 0 ] & 0x01 ))
drivers/media/tuners/tda9887.c:347:5-20: opportunity for str_yes_no(( buf [ 1 ] & 0x02 ))
drivers/media/tuners/tda9887.c:353:5-20: opportunity for str_yes_no(( buf [ 1 ] & 0x20 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/tuners/tda18250.c |  2 +-
 drivers/media/tuners/tda9887.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18250.c
index 68d0275f29e1..853600c80839 100644
--- a/drivers/media/tuners/tda18250.c
+++ b/drivers/media/tuners/tda18250.c
@@ -107,7 +107,7 @@ static int tda18250_wait_for_irq(struct dvb_frontend *fe,
 	dev_dbg(&client->dev, "waited IRQ (0x%02x) %d ms, triggered: %s", irq,
 			jiffies_to_msecs(jiffies) -
 			(jiffies_to_msecs(timeout) - maxwait),
-			triggered ? "true" : "false");
+			str_true_false(triggered));
 
 	if (!triggered)
 		return -ETIMEDOUT;
diff --git a/drivers/media/tuners/tda9887.c b/drivers/media/tuners/tda9887.c
index b2f7054c1832..f403dcf14aa0 100644
--- a/drivers/media/tuners/tda9887.c
+++ b/drivers/media/tuners/tda9887.c
@@ -291,11 +291,11 @@ static void dump_read_message(struct dvb_frontend *fe, unsigned char *buf)
 		"+ 12.5 kHz",
 	};
 	tuner_info("read: 0x%2x\n", buf[0]);
-	tuner_info("  after power on : %s\n", (buf[0] & 0x01) ? "yes" : "no");
+	tuner_info("  after power on : %s\n", str_yes_no(buf[0] & 0x01));
 	tuner_info("  afc            : %s\n", afc[(buf[0] >> 1) & 0x0f]);
-	tuner_info("  fmif level     : %s\n", (buf[0] & 0x20) ? "high" : "low");
+	tuner_info("  fmif level     : %s\n", str_high_low(buf[0] & 0x20));
 	tuner_info("  afc window     : %s\n", (buf[0] & 0x40) ? "in" : "out");
-	tuner_info("  vfi level      : %s\n", (buf[0] & 0x80) ? "high" : "low");
+	tuner_info("  vfi level      : %s\n", str_high_low(buf[0] & 0x80));
 }
 
 static void dump_write_message(struct dvb_frontend *fe, unsigned char *buf)
@@ -344,13 +344,13 @@ static void dump_write_message(struct dvb_frontend *fe, unsigned char *buf)
 	tuner_info("  B0   video mode      : %s\n",
 		   (buf[1] & 0x01) ? "video trap" : "sound trap");
 	tuner_info("  B1   auto mute fm    : %s\n",
-		   (buf[1] & 0x02) ? "yes" : "no");
+		   str_yes_no(buf[1] & 0x02));
 	tuner_info("  B2   carrier mode    : %s\n",
 		   (buf[1] & 0x04) ? "QSS" : "Intercarrier");
 	tuner_info("  B3-4 tv sound/radio  : %s\n",
 		   sound[(buf[1] & 0x18) >> 3]);
 	tuner_info("  B5   force mute audio: %s\n",
-		   (buf[1] & 0x20) ? "yes" : "no");
+		   str_yes_no(buf[1] & 0x20));
 	tuner_info("  B6   output port 1   : %s\n",
 		   (buf[1] & 0x40) ? "high (inactive)" : "low (active)");
 	tuner_info("  B7   output port 2   : %s\n",

-- 
2.46.1.824.gd892dcdcdd-goog

