Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883BC19D069
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697912; cv=none; b=h81lvNjyYiSsMYj9nCYNycRu0Wv99ul8EwFqhYIPJ6BK1E+sUQXYV58wOWB7XNlEB1mNhsWdg6ueHfY7mlHboBjYtQqFPjPdvnHN+/P2lCTDe1zYgiGSPjDvuDJroLlw82ZMF2RzfLEDTo+cj1hZjIYOKedFclmXk8SSEEUwvOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697912; c=relaxed/simple;
	bh=uih8QEqTTkP4DXsgDAU2UHGmO9M1hExX6/d1paS6Nuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PT6m/mAdkQbFMheLhS2zSkBlu+rEB8y8NCofGgUgXJ8ns4TVKcV9hOzQZ0f7RuSOJePjgo7pQEXeOZ7MRrW8zFjqtO8r1V8CmwbLN00KdgAeCfljJiG40l/FA3X6nsTZ1CxuPugCkPMvkqZVXkToG8Pk5GathMWmX/XLTkxzDZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gWo+ANUE; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gWo+ANUE"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cb2ad51162so36887076d6.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697908; x=1728302708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tASyZsxMamepS+/aqpGaV+hKbka/53sBNF0loAvAB9A=;
        b=gWo+ANUEiHHQkfwCoEaMiBC2JoZAJ9CNqf8wuQYp6zt9MhVKuJXObyVTgVb8J5oTea
         6zhPnjAbnjQLksAhuhS72LgAZR9ScerNlE2KlYXRj/qW7EadbyOr9L4OMOkBFgI7sCBV
         Cq7/lBL/32lKCNBI3aDiiQu/1OJgewwWJO1Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697908; x=1728302708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tASyZsxMamepS+/aqpGaV+hKbka/53sBNF0loAvAB9A=;
        b=HPHUnI9x7kf4jpIpRgpiePMHrSEoRVd+JIA3kCl0HkKCJ/aaBK1FLnsvsE0Iecmuhl
         fkBYbiEKdLMFhNS22SGHMu92ZzDb7W9gvrtEb6zCx9U9R0WzAUXzZqrn/9ZD8MwaJL91
         lm+hYU+K/zhR6nuf4d9XDUGH3Sph+j38OJYFVd82wLkQa5MrEJ7gkqt9+slthCaChNoB
         x7PaJWyxpojM15h92a8WPaaJOglWEB0QZrvIqu7Mw8fSl6I9UC93q1KgfctsVAu7Un40
         nv+N8mkJ7I5aXPln+yyG8q7qs2DP67PdeBZ/hqOuz2n4VxrZ+FpgIKPXMQcsEvESh3jh
         V1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxnKn47yFs+3eguR01jCDOdehRF2IJbNLWI0bD2MdFSA2qrWmkwEsFHxUjZnlO+Z89tjZVOPDge6rwMEvf@lists.linux.dev
X-Gm-Message-State: AOJu0YwM34AwD3GNZfaLgqLRjUTp+b2PQrsuu81wsYw6OPZZx/j2+EE8
	ok4LXXnOzZlzzfxGjpOpQJNtDN1xnwjSbCjCSKyYyC/sZU+twnrItaWGHyF1Pw==
X-Google-Smtp-Source: AGHT+IFjm/EtrgyOgYzJ6FCtv8A70AwY6h/u/nfabbLzk2VgNMjTcGoqCqNUVQwkIEHXuuvTS3xGsw==
X-Received: by 2002:a05:6214:4881:b0:6c7:c645:df60 with SMTP id 6a1803df08f44-6cb3b686f6cmr211008966d6.41.1727697908426;
        Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:08 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:27 +0000
Subject: [PATCH 32/45] media: i2c: tvp7002: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-32-81e137456ce0@chromium.org>
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
drivers/media/i2c/tvp7002.c:775:5-22: opportunity for str_yes_no(device -> streaming)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tvp7002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index c09a5bd71fd0..2acf93a90c34 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -772,7 +772,7 @@ static int tvp7002_log_status(struct v4l2_subdev *sd)
 				bt->width, bt->height);
 	}
 	v4l2_info(sd, "Streaming enabled: %s\n",
-					device->streaming ? "yes" : "no");
+					str_yes_no(device->streaming));
 
 	/* Print the current value of the gain control */
 	v4l2_ctrl_handler_log_status(&device->hdl, sd->name);

-- 
2.46.1.824.gd892dcdcdd-goog

