Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612601;
	b=ktTQuPz+V9Xex3lDkTBGw3vsmYJr1aKKppn1HiSpX17GmFA4sl83H9rX3+qPHTw13a3K
	 lgtLVKUvknHJIQEAKER140KWYXHMXoFxe9owwnP6xQsEkZgMeRWutT7g8LnHXIVlwr5za
	 CMNJ7e3/hk5BhwBapiTSJiyuRi/gtiWxNrEc/FMm+2uiWldexU7RIWwyNBl3Sz4z6Kg+d
	 5Dzox/Tj4gwyoxoXsP5zC0n4TcEjiYXYZT/wN4sVqM46JuU90wzdoGxCFt5ZVk+CkvB3A
	 Y8RqkU/Ofttu4bvPnB5ht1gBrdLIcMZBaT+rznCueuD9fRDyBK9e/MANPWof/VTgC5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0zuRXRGdsCMZO3tCr5/uvz2iu/+zzw+UAMTABxMn/ko=;
	b=xjscfGu4yTQTQ8koxOTN2rckpFhYKrpxth8p1Qx24Z9vrmCmhtMvqa5KSUrwj5bXOpTo
	 mLVSzal4AwGOmN8eDucuNEgfiaoAGx3Fxavm8bxjqG0lREnXBx4fEQXL2EyAsjZG6nhXA
	 wjss/EFuEEeaYFD2vfzHjQpl1wROc5KCttsetaxyLPrxknlRbBASBuBwPlyIe76PMC8mn
	 ylFhOWjuczE7Y3hHT0wKJZXiRNpZMlymWUrUMH2oh5uA04sv1WrxMYJgrfErEF4G4oLV0
	 CdrX3cBOZ60xu9bTZzGHU9Z7yoamBE33ky/t0mihzQOSRWGt/M146fZr5eAaTVDEqhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cAhmsAT7;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615D606A32D
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 09:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7615D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cAhmsAT7
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17564035e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612600; x=1794217400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zuRXRGdsCMZO3tCr5/uvz2iu/+zzw+UAMTABxMn/ko=;
        b=cAhmsAT7JfV885FEkbDL55IUA4/fFu5T3l8Y/lklm+jNZfkjZlafWYGhoMVbP0Sz7F
         My22WS7UKo5Jb7OgjBsqRoheCFTySI5AUcmKFNEA2w/khTylZbvaJr9B2d1zdhQI2l9b
         D0CjmVaZ1Z2yQTo/W3XCELnwZszdkSqZUlB2O30uaZKAemzyuXgQPQZJrC7TBal6XNvB
         9m+YA/Es/V8oUUYdNgvoZdqZ7eXm1vwsxMMz3MTnDmxBf7HdA3ZQApe6Ss+0jupN62/T
         t4YCL9KQteINKbp21/k+wR0EBlsYgfPLhRSzy+9TkeHHqzeEURSYse0xAlcDH40+WX3T
         3gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612600; x=1794217400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zuRXRGdsCMZO3tCr5/uvz2iu/+zzw+UAMTABxMn/ko=;
        b=BbRVk7g5OwxIr0k5FwahglFu2J5KA6mG3uWYbUZ7Pg4gFlNPvPuRKDzA6wOnXkecdD
         qHKW+CdfplZgKlmApwBrqusV3oEt9BLpF9P40hhzSYIgFKwYoByJd2wh4MTRpIS46hlE
         jDTawBXJvunNLw/XcdYFIM1Nu+l7SO4U08I1CdMQ05wKZIMBU8lUc1NmCWUAfpAkBG29
         BUmpVvtybckHT4ATHToAFhthFSSxH3BoZCxSgq9EyUdL9gh7NiYX0Dv95uF4AIrY9FKo
         61ONE3gUJGXpJ7GVCzLb+3d2nTNIBGP8jYMUcTHg6F2Cjpco6hn73PSjFYWOOKFj/0Va
         /TwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHMK1qaGsTJsQhdGNxdyjpSFSF6j8MKZ2hjxJ1jmcI2k44tsbBFmGK4vUv2MALs4uU4cYmXhJqJx2YeQuy@lists.linux.dev
X-Gm-Message-State: AFq9FYJbb1KaZgcBuN3CdoftpUk/KAAjX9gJ4G2UDu6MalX4SfAoTpmL
	2Fvzdb4BWh92HhRa7msNgNZtWlgwJ7TY79bEftETPgzEJFl970N3MfRy
X-Gm-Gg: AYBFou1KXzqZoIbmAPgbcYkXRPPvlPAfxSgfkv+TJxi+YTJITMyECP4i3m7OtZ5I4HQ
	o4q2fST8IeZA2KSMQ+lLOnGGXz7u6Fx1nZQ+WUFE+TkTrLKoy36GvN+wouRxKn6gfO9b5rGfLWX
	DX2g8nlOyjfU+UeQokw/8yrkM2twjGN1yZj91xGiG66R5LksFzVZKlzg9Kvbb6rhd8zbqdbxloz
	6wq9YF5KplK1N0QK70Ar62F65MtcbHlKxojoYdlrprX6qV7Ra1orpn10OAAOc4WwF64BI7r9TTd
	GtksXFcCPcLsTSM34pBwLhz4K/DkSUFOghuh8sdy2n09H/9vgh5SI7HNvx7Y/0uWjl4hzmKo7lT
	ZKnBjZX9JK1RLN87QCdKHL5Lo6s6Hxu1mV6/PwJ0f8ERNQvY5yoKs2iTXhpjDJ8VrnEUPkAPzAv
	YOIw1hlPwF/uJZkikg5VzGA4MMEV442RpDu75VIzBoGC+J7rjBEbpNqe3uKIQxyVUrIDCV7sERA
	G/TKwh5lVsTRUBEpjL+E7T5ZoMw4FtU5FVwveoUfFzvUIBmgGaIyzumodayIZMDOZGou2ZpoGd8
	azdVT50kWUJbihXg1OtXFmIhBTdCdUnTVyfCjfo=
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr227970295e9.4.1793612599312;
        Mon, 02 Nov 2026 01:43:19 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm332507285e9.7.2026.11.02.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:43:18 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3 1/2] staging: iio: addac: adt7316: sort headers alphabetically
Date: Mon,  2 Nov 2026 11:42:35 +0200
Message-ID: <20261102094236.57757-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
References: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort included headers alphabetically without altering the list of
inclusions. Keep the <linux/iio/*> subsystem headers separated from
the <linux/*> group, and add a blank line before the local "adt7316.h"
header.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
v3:
 - New patch in v3: sort existing headers alphabetically without
   additions or removals, as suggested by Joshua Crofts.

 drivers/staging/iio/addac/adt7316.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..515f1fdae46b 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,22 +5,23 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0

