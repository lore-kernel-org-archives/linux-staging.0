Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DB118E358
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697846; cv=none; b=jZmhyCeXG/DetDNHmcdkei6VfmAJ4lnE5TSbAlfih1rDXVXG1jaVtL/zEcKR90QSKD/XXwv0Za5xXA1YhmHNACyD2giK5l/VFr+92rDvOifGXRs6mzmvaTui3vtH2LhhUvM9tKYW2GVB+ZBtQOC2Q5M4sIpD5HZLafEvf+SypB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697846; c=relaxed/simple;
	bh=5CcZFwY67VUyfBGEeXQ3+4Q+ziORs1PEInvOEq+lE04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lgbg7QnApfuRj+4uPm2jSynh4L8Gj7+0XUiBagOxp5Sa6ibnm+G9TCrg1yEDwzfmk+FAQY2ZPP3bChNnpkRQluEc5sKL9ceJ3vShuP15zHeh/4xFB0bQUFZ+WXQHcFf2ZHPshaQ3RPoeYBWEoY5jxRhjTaPod+/erMdyig41E9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lpofV1T2; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lpofV1T2"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5e57b7cac4fso2522922eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697844; x=1728302644; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=lpofV1T2EL6T+1tcJkFR9MC0Te4sqQFn3TjuiuL/MuRngfsSW9nNtvsfhWg/rloOU2
         0dEClCyrTfw/KknsaWbOzCJ4WY700VuqxK362W66qKjtSXaR9M68srm1Eu3AgxNzBM5/
         IrTnnr1bElnsHxiTqiDqjnZmFkC+OV8pP4Ilw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697844; x=1728302644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=jNviKCAyoEhyIPdPmYbbvi0PUycjfhL4RFSQ+yU4uhjEMj9SJuOOUy8vDbYihXAycB
         E+RhHXfZJnbXWdWwqDECXKJg5l8TWx1DtQnlNpVDBD0Um6q9snZn06CXFlL+Yxo6Rfpt
         r1qLiPuGrLR2WgYp7Fz9DBDoV3M+NThWHDmf0lMBZYqg2VvzX5H1jFNtaXc7FkmXJOHX
         QZE7AMBtDmKWgDocTd9i+xpuQAuZYYdCK+avh6ys9i9pXm9mpceUc0QkhvUM4cNlblHe
         lkXbUZLldeKwrMLsm/avUSOoaKoyFTJfRD9M1GTk6Q80Y8bEHEqLx2q/8FtyqX/2EZ/8
         R2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWvGeKKzADIeG+funC0mYdiBppmkYeQPKO2kcdJhrtbRw1jggmmZEkQxOB3izv5+Dfm4C8+h8iV8j1umbYZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyye+Vn95OXL79F1HGmIV6xDTgqTrguJZDWjchlvEguXfu7YXrM
	tXaIcC2RgB2QrI4Q9P1tTX8NwPaPK76OQfGPz8RBuJ7yl7han+uYHs1SpVZ1Xw==
X-Google-Smtp-Source: AGHT+IG/KAG5rLZearz2Wa+2ErVyBcttWaRGk175qbpKywxFfy3PRamVmOosYeNbd61Fqm2746wGGw==
X-Received: by 2002:a05:6358:4314:b0:1b1:ac2e:af69 with SMTP id e5c5f4694b2df-1becbd0a143mr332064355d.17.1727697843926;
        Mon, 30 Sep 2024 05:04:03 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:56 +0000
Subject: [PATCH 01/45] media: staging: ipu3: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-1-81e137456ce0@chromium.org>
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
drivers/staging/media/ipu3/ipu3-v4l2.c:290:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)
drivers/staging/media/ipu3/ipu3-v4l2.c:305:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e7aee7e3db5b..443067ad0a50 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -287,7 +287,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -302,7 +302,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

