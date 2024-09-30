Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228F192B67
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697868; cv=none; b=u4JCYG/huwBTZ+NOaT4DX0bkt9WJZfqVEsHVKoq1zc95b3hRiIS530fiX4YVrKwhLYhIE6lHND7vVVDSkiJ7LM5cgWyw8INaexrW+9ZN8Q0LW+A5FMb0c9lqufeSrK03HrAQ0RzK3VclteZKgO3qzLSid6k9Szi90c4N8oIxLK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697868; c=relaxed/simple;
	bh=cnDoJb8yt4N23hqgVqtt6DugifeR9k05ai5VXwEP3n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z68NhxQ2/lb5YJUE4vVfK8dZ/+QifV790cGgZcqoaVirc/afk9PUxGKbc9tW04IcsDwZbsevLFV9U4fsE5/o1WtxbwQqZ5dZ9caX92uMiLKYHENoGtP4XrIeBj1fbN0GRaHh29mfVj539ymDZbJc+gobK70IgFYx6sU4ZVqd5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cA7/OcfF; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cA7/OcfF"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cb54eef205so14798326d6.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697865; x=1728302665; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2tB8sFg/5a2I4zeaxxZR6pf56+tHkpHPezEUEsu9lc=;
        b=cA7/OcfF6+CEN93lilnuAEgHT3VOwYTELSVMWG1cvz4nPDkCVxBHDkeNyy0J6ZcMtt
         ic6UBg//Ok+d554WhJ4V3W8Uwoa5exD4LiliqTmVvUtC62pE8HXcGRoqEuxBUznp19/C
         3nJLT/Y7bbzWKoOTd6qmvR2VLRR5bOfCIWGEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697865; x=1728302665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2tB8sFg/5a2I4zeaxxZR6pf56+tHkpHPezEUEsu9lc=;
        b=KnpN+31x99tG8usSfgMguBvw5gNQE6hU5CMf8jl6OfgvQlFrN7vZw5QF0uzbCL44DB
         ufTtZplX8lv2r4xNgrvKJMzvLnxFUXHWl8qiV+xqYSe0ZMvjIWcrc9jPg4XvfP4uZJZx
         mscxjP1bcpAnAohfEcw4+vR1MMQE1mpgsXLIU7cq3JsCxKiXJGctkdpyzFyN/aLdV5Wy
         zdO8qrWwOp9ra1v0IAeMvQ0QnuPnOvLJmasPiIvuEPSiqgPjUDNarKOayAFm5u3pz/yw
         W+Gz8kzFitnnV0lCeKAVd5+7sxa2idSe6gkhNPKw5FpvjrHaLFuyQcb+pSoak64rHtzq
         CHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzmfGQak1i2iQHKLi51udxPFiwGw3eaI+Hwir7FD5zXRhfqMroDc3/SbxDknOUI+XUakfqtCuohocufsDv@lists.linux.dev
X-Gm-Message-State: AOJu0YzpQT4L+Tfahaf7uh4nm2CX0snA4E/qAONzymAL9jIxuPTeQA4g
	L4reCXxWCPFKwEXV3G7dfX8CYPxRPzCLQ3NS2x+RzrOfh4VaYBBx0Kp1FsnnGQ==
X-Google-Smtp-Source: AGHT+IHhNN24sJCIubgfbFA4VGeLvNv4RKY7X5IqP1ufDg/rjxIUh41wM/wPVdTOII53M0RqAZGVpA==
X-Received: by 2002:a05:6214:3982:b0:6cb:3e26:bcaf with SMTP id 6a1803df08f44-6cb3e26bd60mr117592306d6.32.1727697865303;
        Mon, 30 Sep 2024 05:04:25 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:06 +0000
Subject: [PATCH 11/45] media: rc: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-11-81e137456ce0@chromium.org>
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
drivers/media/rc/mceusb.c:1130:2-8: opportunity for str_enable_disable(enable)
drivers/media/rc/ene_ir.c:1121:22-28: opportunity for str_enabled_disabled(enable)
drivers/media/rc/serial_ir.c:591:4-9: opportunity for str_low_high(sense)
drivers/media/rc/serial_ir.c:594:4-9: opportunity for str_low_high(sense)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/rc/ene_ir.c    | 3 ++-
 drivers/media/rc/mceusb.c    | 3 ++-
 drivers/media/rc/serial_ir.c | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 67722e2e47ff..90bee860a8a1 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <media/rc-core.h>
 #include "ene_ir.h"
 
@@ -1118,7 +1119,7 @@ static void ene_remove(struct pnp_dev *pnp_dev)
 /* enable wake on IR (wakes on specific button on original remote) */
 static void ene_enable_wake(struct ene_device *dev, bool enable)
 {
-	dbg("wake on IR %s", enable ? "enabled" : "disabled");
+	dbg("wake on IR %s", str_enabled_disabled(enable));
 	ene_set_clear_reg_mask(dev, ENE_FW1, ENE_FW1_WAKE, enable);
 }
 
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index cd7af4d88b7f..7f932f0f5750 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/workqueue.h>
 #include <linux/usb.h>
 #include <linux/usb/input.h>
@@ -1127,7 +1128,7 @@ static int mceusb_set_rx_carrier_report(struct rc_dev *dev, int enable)
 				    MCE_CMD_SETIRRXPORTEN, 0x00 };
 
 	dev_dbg(ir->dev, "%s short-range receiver carrier reporting",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 	if (enable) {
 		ir->carrier_report_enabled = true;
 		if (!ir->learning_active) {
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index fc5fd3927177..f9ec2f043529 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -25,6 +25,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <media/rc-core.h>
 
 struct serial_ir_hw {
@@ -588,10 +589,10 @@ static int serial_ir_probe(struct platform_device *dev)
 		}
 		sense = nlow >= nhigh ? 1 : 0;
 		dev_info(&dev->dev, "auto-detected active %s receiver\n",
-			 sense ? "low" : "high");
+			 str_low_high(sense));
 	} else
 		dev_info(&dev->dev, "Manually using active %s receiver\n",
-			 sense ? "low" : "high");
+			 str_low_high(sense));
 
 	dev_dbg(&dev->dev, "Interrupt %d, port %04x obtained\n", irq, io);
 

-- 
2.46.1.824.gd892dcdcdd-goog

