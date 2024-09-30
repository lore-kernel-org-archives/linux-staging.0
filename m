Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05819B3C1
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697906; cv=none; b=Z7/uQn/EuhLrU1J0lT/fu+opuSaV5JnRuU7kk978eLEO5xwo/xl/s9m6d7wtUbEWpA3WqC8sCL5hi27VEeXGHaFDkrRMoItrTqM8dCuxN3UopSHXC0cTu63SWbKxL9Zq7UkWvROsZtXrax7LNFUWxMIhmm42hg6qdlGMIoIsjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697906; c=relaxed/simple;
	bh=fSPAVO9ZDOlfM+yvKGofjzMlsnwmS7DOHpFwVZfy/5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gifTaa6JLHs22dk1SqEgbYtDIzwpFF9+D2E8frhJVh7nC+P1j+gJTTmFoQiWdO+uK+EctaCVotuJZ5UYuCqrov2EcwZMoAZW6Ki4TWoLOBsnGyAkF1fkEn54EmRBUcbzs7Knu6dJgMgaG6GcTf5dbzmzNEG7cQVgpJc8vWMilso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R0tBfSng; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R0tBfSng"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5e5568f1baaso2414350eaf.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697898; x=1728302698; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+lDXyICIHcG+x83IY7Td9H+I+izyCveuIAoXyx8Crg=;
        b=R0tBfSngL2dVzw2ovg0FHyZP3ya1DPIW8OfC5bBSc88g8DBUjgVG5uc227XKmcYDBD
         hdwU+dEr45X0Z/3fcPRMM1HsW5dBhQ0tznVWZYFu5KXlOxEgg0rhGWBwzULw9f0l8Fde
         1tjQJc+jiTwxjEy5JUF1iBOqnUPrNq3mh8L/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697898; x=1728302698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+lDXyICIHcG+x83IY7Td9H+I+izyCveuIAoXyx8Crg=;
        b=t4IVtH/xwIHmr4ANhNfyxZWLSqhZW5GK9q6SbnFJgVBUwH9GzRLdP9nVD2+1nYBWg1
         Azi+yDTm4xizCm/LJTCO3L2mdWqsHGdbgJ01tQOWD/Qa7Z2U+2A3qsvK5w2RzKqcK0G4
         bLu/SF5hmQzFUsIH9TT3tyXqnGzbBlWQ6dwzHuar7j/MXfk6KlYF33k50tWMXNmWpsiU
         xBnjC5Moiv+fxsaiZaSoji89NpgqWyDbj2SDtE7Bf0NbTFuVI/CmeOZYTcgqhyz/ceFz
         ijbHNnFtLf5Q2ZBSUiOGwXrLui9f2Rq0BPQDVkQPEoDDcjpdeOhEBdhK50GEsNbBuzgj
         rE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpa9eiF9++XUHibzXRurJ+GH8MqhVhhyab9Z9ZNV7cDR80CmyV0ak+9aMv9FKxWLfa3G/oUVushEgOOkRq@lists.linux.dev
X-Gm-Message-State: AOJu0YyYiLTyS3mH6JW/UH1YuRTcEHp5qDJOq4L1At9BAaAs/JkLGGOG
	0YdwffCDydfPx7+IOfKPZi3ascG6OkRMAWkyJys9nh+zG3OKAoOkqB9UoNpPWw==
X-Google-Smtp-Source: AGHT+IHpSAOikj0Pw9qUy/ufav5/H94vhYgLdOZ5ZWws6VuRg45Il/9rM3D70mqQT4nS8RcavrRJ/g==
X-Received: by 2002:a05:6358:7254:b0:1b8:322e:3db with SMTP id e5c5f4694b2df-1becbc887d8mr566945055d.14.1727697898629;
        Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:22 +0000
Subject: [PATCH 27/45] media: cec: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-27-81e137456ce0@chromium.org>
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
drivers/media/cec/usb/pulse8/pulse8-cec.c:698:2-9: opportunity for str_on_off(data [ 0 ])
drivers/media/cec/usb/pulse8/pulse8-cec.c:705:4-11: opportunity for str_on_off(data [ 0 ])
drivers/media/cec/platform/cec-gpio/cec-gpio.c:138:6-22: opportunity for str_high_low(cec -> hpd_is_high)
drivers/media/cec/platform/cec-gpio/cec-gpio.c:141:6-21: opportunity for str_high_low(cec -> v5_is_high)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/platform/cec-gpio/cec-gpio.c | 4 ++--
 drivers/media/cec/usb/pulse8/pulse8-cec.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 98dacb0919b6..49160a15272b 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -135,10 +135,10 @@ static void cec_gpio_status(struct cec_adapter *adap, struct seq_file *file)
 	seq_printf(file, "using irq: %d\n", cec->cec_irq);
 	if (cec->hpd_gpio)
 		seq_printf(file, "hpd: %s\n",
-			   cec->hpd_is_high ? "high" : "low");
+			   str_high_low(cec->hpd_is_high));
 	if (cec->v5_gpio)
 		seq_printf(file, "5V: %s\n",
-			   cec->v5_is_high ? "high" : "low");
+			   str_high_low(cec->v5_is_high));
 }
 
 static int cec_gpio_read_hpd(struct cec_adapter *adap)
diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index ba67587bd43e..0167f21cb116 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -695,14 +695,14 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 		return err;
 	pulse8->autonomous = data[0];
 	dev_dbg(pulse8->dev, "Autonomous mode: %s",
-		data[0] ? "on" : "off");
+		str_on_off(data[0]));
 
 	if (pulse8->vers >= 10) {
 		cmd[0] = MSGCODE_GET_AUTO_POWER_ON;
 		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
 		if (!err)
 			dev_dbg(pulse8->dev, "Auto Power On: %s",
-				data[0] ? "on" : "off");
+				str_on_off(data[0]));
 	}
 
 	cmd[0] = MSGCODE_GET_DEVICE_TYPE;

-- 
2.46.1.824.gd892dcdcdd-goog

