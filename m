Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BCF191F81
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697864; cv=none; b=CkvUfl/ysliopzcEwy2sY6R92uWSkgmdrdoLmp6Lt+3o9I1n7x9TMfkVIqi+7qwTibcABCYgYetamrefQgibS1y8MJLH5WPmKF+Q8wBL6rt71lnmoEKQpk9ydShVp1qdAGnJ//8MKCCpY9y7l3IG5xao2POqJBRcWzpyi2Jx9Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697864; c=relaxed/simple;
	bh=GRNRTE3KFYZCTqmHqSQFYdbDtQolStbwq9AxxoNYcUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tlLCBJHOTq5crtCdgVjTQtHYOCMrao1LOJ1Gss6KdxdPI7jMAYYodvGPB0/9ciOxzrgWMRltSIasYcNnbkn47wDs7wlyzz9BTtxGBphKnj5KXOTPbVjyWrNezZkjha/rIITfuUlUcPkSpqKbdMPfGqEfOLUow7PTO+EbbfhaEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FwYyskmE; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FwYyskmE"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cb3062d9a6so36150886d6.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697861; x=1728302661; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0DduMWqX0LlLrfJFzeOwfQDx0mBLtEZV9WrRhA8PwA=;
        b=FwYyskmEE7n0nyFQn5vKKQ7xvvJfMweRl4Jj3eqq01hZXdzy3XKbc/4tZDjQGdoO9k
         iTYz+XPfG8J/PJ/PXi+2Lqi+ajmUntgUaipP55fLrTqlNspjEIZvT61ImVySPpQDBBIH
         yLWSd5h8XBr4zzhAqPE9KanwGpjxKFChcECck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697861; x=1728302661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0DduMWqX0LlLrfJFzeOwfQDx0mBLtEZV9WrRhA8PwA=;
        b=JLoSza7Yt3nv2RI03iiPS6bF+2o/nwMM0lob3lRigTlngkhHMlznTdHrE0PNTmhwl7
         Jd5S93A1rVGIK98F+NWR3fs5TDA9ba/8T03pDkEKgDwNdKrJTiBn9oisc1iP3FAJjgLs
         zgs2Iekc5AP7aeWxADKk0YUBbKnNN2LYOzaLSidXXAMtNDM6mm/w+3364IoZC9Cnfa3+
         Yk44GMu1vcv70MNwsD0qreIahg6BpTm4pqL0LZ8oLIeZmNQEocYb3EkbhmXKei9CzoJH
         tcPeHu1j8K3bcuczkHRkpJIor+y3a//Lzi+DdkIlnwzVm1gLga3en5ARzjbLHERporFB
         ax+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi2D7PsQ2G7ONNBeANoRnQ04uOzto82lpsgUgiEsv8RvA8q6AU22Sdy5vtbQxUadIv5RUx0o8+1E7RRSrt@lists.linux.dev
X-Gm-Message-State: AOJu0YyxxV03vXd8IhMM+5W+qvNCO2wKpByTVSFd62fHzynE1WkW7dYU
	fFoi9MvII2q2I7Sg/o5WtZ+gvvrndAZOZO43hVW4BeMcAFDkOt2qXRkUNZa4EQ==
X-Google-Smtp-Source: AGHT+IFW5o76WLto1m5OIr01yojLQTVPsUEplusVOtBKeM+zgF4Mr8Jjm4ekkrZvP/8oEpp3jj7xuA==
X-Received: by 2002:a05:6214:3a88:b0:6cb:35ea:a343 with SMTP id 6a1803df08f44-6cb3b5b60c5mr157899696d6.5.1727697861311;
        Mon, 30 Sep 2024 05:04:21 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:04 +0000
Subject: [PATCH 09/45] media: cx231xx: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-9-81e137456ce0@chromium.org>
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
drivers/media/usb/cx231xx/cx231xx-video.c:144:4-9: opportunity for str_enabled_disabled(flags)
drivers/media/usb/cx231xx/cx231xx-i2c.c:373:4-30: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/cx231xx/cx231xx-i2c.c:402:4-32: opportunity for str_read_write(( msgs [ i + 1 ] . flags & I2C_M_RD ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-i2c.c   | 4 ++--
 drivers/media/usb/cx231xx/cx231xx-video.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-i2c.c b/drivers/media/usb/cx231xx/cx231xx-i2c.c
index 6da8e7943d94..6d8b70562f6d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-i2c.c
+++ b/drivers/media/usb/cx231xx/cx231xx-i2c.c
@@ -370,7 +370,7 @@ static int cx231xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 		addr = msgs[i].addr;
 
 		dprintk2(2, "%s %s addr=0x%x len=%d:",
-			 (msgs[i].flags & I2C_M_RD) ? "read" : "write",
+			 str_read_write(msgs[i].flags & I2C_M_RD),
 			 i == num - 1 ? "stop" : "nonstop", addr, msgs[i].len);
 		if (!msgs[i].len) {
 			/* no len: check only for device presence */
@@ -399,7 +399,7 @@ static int cx231xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 			/* read bytes */
 			dprintk2(2, "plus %s %s addr=0x%x len=%d:",
-				(msgs[i+1].flags & I2C_M_RD) ? "read" : "write",
+				str_read_write(msgs[i + 1].flags & I2C_M_RD),
 				i+1 == num - 1 ? "stop" : "nonstop", addr, msgs[i+1].len);
 			rc = cx231xx_i2c_recv_bytes_with_saddr(i2c_adap,
 							       &msgs[i],
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 435eb0b32cb1..4cdcfe635ad7 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -141,7 +141,7 @@ static int cx231xx_enable_analog_tuner(struct cx231xx *dev)
 			dev_err(dev->dev,
 				"Couldn't change link %s->%s to %s. Error %d\n",
 				source->name, sink->name,
-				flags ? "enabled" : "disabled",
+				str_enabled_disabled(flags),
 				ret);
 			return ret;
 		} else

-- 
2.46.1.824.gd892dcdcdd-goog

