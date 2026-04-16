Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53839B960
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331990; cv=none; b=jixLPh2a0Ct5FHu6uoXPOjjKgIQf8yetXaKoANaWhLaLCx+/n7rCkr2yGkpkMGONyORmbWyxzrwb4TUWUe9ZZQuRecDEWWaPT1EqvRg9V13q8+dp4WhNXkhT5Z++CaEpW+yRJ3XF29aSBmNLwUQdsT4Ay4dbLkXp8zmjf0nFokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331990; c=relaxed/simple;
	bh=lJrC90Eolo02AQW1DBzzCXYNK9+dbxqvWdp0pp+6pkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkTl943POpiIQhqCW57XiiKcvbw2lJOjnG2a0WiqlLEKDTbMi1NspTVEfuio6/PSaD2vV0UbtBfu7aWEiAQqo2yCbFMdy04sXYV5aRfW3sFamy2GJBZUTKhPGTIyO4gHKIrirQGjbU39prF/UUvv2OzBz7MLgR4nqH9BAz50+6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvN7YlPJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvN7YlPJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8d7f22d405so1266454466b.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776331985; x=1776936785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/WLv29opBLaLg3QT02xeIvS4ydIjoZK67hcbphIn7M=;
        b=RvN7YlPJWkxw4l/3dnTj/VlFYqyx0Dn0DJsnd8+BxEWO0Iz/OQvA7k5rsgcND6CBM/
         6IgVlSvtfzlSEekueDQul1C0yikjUv4J7NEsfepwTgk2XQHnr2hJCimkXx6zBeNABTNH
         7tz/xeB3sV5cGNzBvCbiZQ8LtpNE7hWto6sQtGbLvnPd9rbaMLoM7PCCGxh1D6+nLwnN
         JcUkJXtKPSRE6kX3Uy5kJmJliWNdM5bFHsFnWmJRsCcpXjq/QoAmyjG2DFJztdDMU0MX
         rjomflWYmKdG4uAWJ0HXIcrciL4qqoNk8Vdb8/UKNkW+4/gTLYsNHTfFiM7PJ7FYBLxK
         utFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331985; x=1776936785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/WLv29opBLaLg3QT02xeIvS4ydIjoZK67hcbphIn7M=;
        b=Iuml2X9UKQFp4biLKeBJP3Zhmqean6bsTi2De1xUR+SjaSbca1+aDBbDblC2+0Dflt
         8OM0biuskomRntnzfMM31dV/54VaEJRrxK1F4vfskeFw2Ty9JTBwy3V9a+Ms4ufd4IdI
         TQeyaw9omEMFCuD7ctZlCEqt/ccsJPDeNCbBQguPaRQaj+ZIyH8A36QbPwUBc6Wp/CLt
         wWTxe6j9bOx8xg/4rGO352A8JqDsTj2RTr/5Sm9SPRUJltNxeaiFFLf5rWc8tSsJCnxr
         cA6LvjahpHUglX+MU8rm9i23ZUf2fs4WosHgKhRwlNl5WbDQOgfb0EZ7Ir8r67JnsWRt
         BJ2A==
X-Forwarded-Encrypted: i=1; AFNElJ9BJM8YwfbBa3CZmRVV+46LDzF2WR1UsyBoEZPzK+UvpW+rXumGkIzckw+5Y5WzOavZ+jFNHY1cTWNCy1br@lists.linux.dev
X-Gm-Message-State: AOJu0YwVHuz5vYqJpfnAvoHzVWaAacoHudO5L9rq1oKveiSMcWylND0O
	TXm1OgeDBgNhGpgybaMzSwhN6Kt4be3rJ3WmGq54os+5Yue2eE+9SZ5G
X-Gm-Gg: AeBDietCH3yoi/JjU5mbgkhKm5wo8tZaXFxqeEPLEZ/WvHDx4eyE2nqHhTiwVlQIVIl
	B5XOVT9sl5mvsUYb911yd+LdG0HCzAC8uNi+C0KF+1SKOb2BHLd2Ylk8X8L/Bqb+L09nAQxQQNg
	yL82EDQl0rQxkbHNB0EuHzUjxiOXF77jDkTV7AdEQ9HCfKKzUH7mpP2oX289pFH26m+F4TyNXOA
	l9DAnpHs9p8wwFYsoTTn+wzFxsdPPqkQy224NAbH8dI4O/yK7kgNHBab4mizprY1e+9M66drdCQ
	6jiFiqfg6HDY8uIxgpdG1kqdXjyB3SEP2bpkrwkTg9czXK/b/HuP96UbQjWH/wDiz67fsnlKjTb
	iWRD1dlFUj+CpwUQfwdasTccV1kuKNPaRdQUfQx9iiG1cvcvluFfyI3WUAZlRlhbX1YsXNLeA0G
	5mo5tiuQoG2sJWjB/PjRdKvfm25u1jMmWlPzgl/AiT9i+YjfZ9CsKHiSqhdAYqarw0FCZ+6XKsx
	aYdSVx7hqAR5z51mtp8IRh0VuPxKDlE4uBg0neWyamoQU2Mpsn67DSIxAigGZ86TxIEeW9Y1kpH
	IFjbzm1SSIBMKVyDvPM39XkekyiboDXbU0mDJ2dV8KAfs6jDlT03livSAedrktp4j7hEZ9gvOch
	HAJ5wowWjyyFf/zR3NwWC5lXrP/YXpDJ8HpvDjWX+Kv6xRc+jwncRChzQ2K1bp2WNMTv10BbORL
	WCQ6kw8HfTMg==
X-Received: by 2002:a17:907:c28:b0:ba2:5226:95f8 with SMTP id a640c23a62f3a-ba2522697b1mr191285566b.23.1776331984454;
        Thu, 16 Apr 2026 02:33:04 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (103.146.204.35.bc.googleusercontent.com. [35.204.146.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c352asm146591466b.32.2026.04.16.02.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:33:04 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3] iio: frequency: ad9834: clean up includes
Date: Thu, 16 Apr 2026 09:32:40 +0000
Message-ID: <20260416093240.1294-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup include headers by removing proxy kernel.h header and
unnecessary list.h, interrupt.h, workqueue.h and slab.h headers. Added
additional headers that were previously included from kernel.h.

Verified using the include-what-you-use tool.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index d339d5e8e0..9b65fbe1c7 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -5,18 +5,21 @@
  * Copyright 2010-2011 Analog Devices Inc.
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
-#include <linux/interrupt.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/list.h>
-#include <linux/spi/spi.h>
-#include <linux/regulator/consumer.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/kstrtox.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include <asm/byteorder.h>
 #include <asm/div64.h>
 
 #include <linux/iio/iio.h>
-- 
2.47.3

