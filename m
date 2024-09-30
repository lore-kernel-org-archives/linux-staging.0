Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD519CD1E
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697907; cv=none; b=IDpYYie1jrw3yebhgln43HXVZ/kBJX1F1925Z5h2uMOej3sfD7rqajd8yvLm7Dxeac3SFXAXPjgWpKVTVvQYu010cql4Hqev9Mv7Svp4iWFNezjhLFnX+AXJvbCA7twUrpUKIsehez18FpuAzzW/RMHQpjlU9ctIFjjd/EOwtuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697907; c=relaxed/simple;
	bh=kKpr508Yau4A6DM1O58ZKid3P/LjCOEsyTEfHMo66Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kCZTUlHC0O/s/0qX0rnrolF9GaBqSTzTUa8AMk+PWH22t7EotRzTjX5pjjezJbk39KDtLERbPLPc9muN9//bITmCxqAxVZw5MOVnk5q5zFzEtks7SUsh+ibWYOHPF8hggbYM6QHFWg7StEWGls+MbqFnzBaxv1B8fxIrWiLv+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TSvigwrp; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TSvigwrp"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb2c5128d5so31325546d6.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697903; x=1728302703; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF9yJ7oppQKnmh5ZAzfDc5uXy0x2qr1GXsQ4Q40pH48=;
        b=TSvigwrpqd1u8WrKop4jjmZ8KPP77si5j49pYeB7R3dcbC7By1rBdZBYUlQh7iwvHx
         5IRvxZl+V0kVValIhHAVWxAqPdz46J3Iczo0g7ZMDvNs0Pa8y908jHQOl4XwAE5a+K4K
         3ANM0WmstbZ37nXkF/JSxZq1cxsjigsjxvRa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697903; x=1728302703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF9yJ7oppQKnmh5ZAzfDc5uXy0x2qr1GXsQ4Q40pH48=;
        b=VDDiTJke2QiOiaDTtibgMltuvBFDAW1Dakol5jaVBoZZIkDoTZi3E2CurRil7RoyrR
         8AlqbBRpAIkS7PRt6+DYInwNZ7fprvJutGvP42121hVNqiwLDLsLgPXIGg1fiQuFBfjm
         7vyTnBLxL+RYyKxkqmK3XvAZQQuTwOkvzQFTB31KbNdzOLmVL2xcVkp31bYR1TfPd8ds
         7f6+engga0ZnZsKRcNMMMwbdAK5f/CURG/TiOcMTYVj4xlITEz3vuBFbi2SpU4R5MCcR
         TxICK2/l8rYDXj/WVrfNQq3pn9mpNbygMT0wJ7wTTBwpE+n3zTG9y/9KHoDXkC2Stbqg
         O6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV+QOl6/Eu5+oGEWJkCEwa4nT/fNHygTJHaXs8cSAP3hXwlcgEKka+ycqJtzDS0n5QRxCYyBkOyg7Q1w/i@lists.linux.dev
X-Gm-Message-State: AOJu0YzkRlamGReF8i7SfgYJnyMUCtzCZ4Z83vqRf8XXRTeAcmvD0nd0
	xhN3WRmaNNhluvjDzHxsQivQ3/w43nWVjWVaeK7dRC+iZ7q9aRRbpu/T+RMacg==
X-Google-Smtp-Source: AGHT+IEAFwwRA71MkCRUwImfi9uBIeNCYwuxiEwHafmSSDdtTJviDnVg18iocWAWeF5m9aVEXLwnZA==
X-Received: by 2002:a05:6214:5a08:b0:6c5:b709:55c6 with SMTP id 6a1803df08f44-6cb3b63b3aamr219594876d6.42.1727697902571;
        Mon, 30 Sep 2024 05:05:02 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:24 +0000
Subject: [PATCH 29/45] media: siano: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-29-81e137456ce0@chromium.org>
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
drivers/media/common/siano/sms-cards.c:329:36-41: opportunity for str_enabled_disabled(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/siano/sms-cards.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/sms-cards.c b/drivers/media/common/siano/sms-cards.c
index d4a116ab6c88..e9aa95233ff1 100644
--- a/drivers/media/common/siano/sms-cards.c
+++ b/drivers/media/common/siano/sms-cards.c
@@ -8,6 +8,7 @@
 #include "sms-cards.h"
 #include "smsir.h"
 #include <linux/module.h>
+#include <linux/string_choices.h>
 
 static struct sms_board sms_boards[] = {
 	[SMS_BOARD_UNKNOWN] = {
@@ -326,7 +327,7 @@ int sms_board_lna_control(struct smscore_device_t *coredev, int onoff)
 	int board_id = smscore_get_board_id(coredev);
 	struct sms_board *board = sms_get_board(board_id);
 
-	pr_debug("%s: LNA %s\n", __func__, onoff ? "enabled" : "disabled");
+	pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
 
 	switch (board_id) {
 	case SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD_R2:

-- 
2.46.1.824.gd892dcdcdd-goog

