Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF5F1A08DD
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697927; cv=none; b=HtzS+t/zh0ebo4GklsjB/HfqowVASsxJ7DZOs6tUiPOHvVxeYnfg6mimr7uz+MofVIpRhpGxFO0zbUSn0JAb8HV4lubSqkLVtYPxeZpIVXqQ/cpu6mhJeboa+ifuDbpmD/SuzzYb4w/RHanjNWrOMyimsm3h6X+PUb3InDuHso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697927; c=relaxed/simple;
	bh=DU6huE3ypM4gV1uvRmGnz4MowVjE75GaWBSN46h3an4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6nmNkMYc2MxY8hG4IAzr6LDTpeZqLk/mHarx5aBruNB+H04vWFBaJ/Ys9pCfZ1uhflu3Rm+NbMQEkkROOZK9wyAGgitOT5YnWZUu2YcbdfrDEpLq9wxuwKoIohhfAApN6Go83B8DxHGz+fWmyDD2HCZEmbOwxdaqhdCN0bnR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ilc9yg+q; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ilc9yg+q"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cb37b34a87so30621576d6.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697925; x=1728302725; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azNmlM3B7hyMNMP40kUqke3tzTp1ln1Edxwu7YerKBg=;
        b=ilc9yg+qTzWNfOgwktqWpjEeiriMpKCSgrONsljtZcX1apAs59BzmNl/bm6IUp3ju5
         i2Z9avEsKG6qZVfSBGkvhO5Tlod4CwZTpz4URDIYV5H0q+oOj9ZFS4+yVNvRzpSod4ox
         ZVfG40tb/67whvxYfDRPD2UrFiUSkBvmEcCgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697925; x=1728302725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azNmlM3B7hyMNMP40kUqke3tzTp1ln1Edxwu7YerKBg=;
        b=wh3XtRAjiuMl7U7CWtqyKnWTmYrcEkslPBF2UcCcS3C1JtdDBDJdqZraSQ73U3Yomk
         93p+lOsnjDVnCHUJHQN3ZQx/GUIMWjxjB5z7uDJzQm4Kv/BqG+ecbYTvo+cnpGK3vstO
         Phqs58z9Ucu5hvbjKeATyN6pPIfLDBdhJCJEBnoXBscZzrdQLCZwvDqwfkr7IClxJVJ7
         oOxC5SfnKOcHJXzxfbpjEb9MDCAc/1Y+qUHo2NgUlT4YERFhPL8XBTYyVncuVcIvIGma
         3ybUZySrTzQhwY0KjhrGRQhIF1OmOtrXJONS/0P+EnOsfg6temVUsaFPWzKx02yTNHfS
         eNOg==
X-Forwarded-Encrypted: i=1; AJvYcCWEWXIgsh5OvOKVZuxq+OGRuUPt2WE7NV7YwwpfsP+13eo4obiIFCMjVCgze0TtZSVTHD77lRbjQmlp8C+e@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/M5kpq1N0wJ7rVTgJBqEj6KoBp02rjhDGp69u3xNv+y1z5/yA
	qitsQRjYsD0l0nT4VetqHHj5uFKo3ywv3vKtofTgQOGO9ExTTe2h1xoRBYSRSg==
X-Google-Smtp-Source: AGHT+IH+OoBvU1VpQTPHiaktqSzIksNgZvG/jG37uysXmmuE+j75SqTMgbPUwFz7aDU3AoUz/9R6MA==
X-Received: by 2002:a05:6214:450a:b0:6c5:60a1:d99d with SMTP id 6a1803df08f44-6cb3b64c714mr169599236d6.47.1727697925305;
        Mon, 30 Sep 2024 05:05:25 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:37 +0000
Subject: [PATCH 42/45] media: i2c: saa7110: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-42-81e137456ce0@chromium.org>
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

The following cocci warning is fixed
drivers/media/i2c/saa7110.c:313:37-43: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index 942aeeb40c52..15134ac706d7 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -310,7 +310,7 @@ static int saa7110_s_stream(struct v4l2_subdev *sd, int enable)
 	if (decoder->enable != enable) {
 		decoder->enable = enable;
 		saa7110_write(sd, 0x0E, enable ? 0x18 : 0x80);
-		v4l2_dbg(1, debug, sd, "YUV %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "YUV %s\n", str_on_off(enable));
 	}
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

