Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A91A3B6341
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421012; cv=none; b=oCCcU4IjYjwKr+UIhKS8F8lD9pHWFlXmW7We2ClA4/EALQDJlYpUf1AnJuuEhDQhp84t/pxwegy3H4B2KztITvoC4eXd1aP6MtWVKXOB1yjborNQFbFhtZkNDaHMBP29J13rwZIetGtcpGYgV7GZf3HKwPUiWbLfVKYAq/0i+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421012; c=relaxed/simple;
	bh=lJIJxbvQURiXsSatZoyGsKXZNQ0AisVAxB4bL995vZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CoQbFs2Y7Pfo2PeQFYo6/zsio9VthUoNYbpqS+8tcbrfxusSUzcZpES7KKfKCl/E7V0QKg8+SRJSrQIOc+VsFnO4YdS1ghSuDyn+FtZnTae2+61P9Oh3u8dXRrkdheyUr+ezF8hAwnql/RoVrXGc2sd8MoRPyHQRHjT4wrBOvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfRXxwgp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfRXxwgp"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso644526a12.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776421009; x=1777025809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8SAmev4VJJf4i5t8EUbInGL1AJKkZdyx8tFeJUEXIQ=;
        b=VfRXxwgpzDn4Oawp9ll27lL6WE41u3NshFEJyeNt0QsaXZhp+hLkznyHdDZZSZHzTy
         gI3hztFbE69C3S/B3VFtER9C030wWb3DJuhU8W+UkOWzTcvtTPN6AmhYcHFHQvvpIXKo
         Ft71eF9xvph7JIRqWz2gbW2U9nusJ5zxNmsX2aN8Rez8aOGDGq8MyKz9IOYc+vD8/4Gn
         U2wuMwSxc+TJBgV3Y4Ohp6EGhV0QlO/1YhobjgXYhYlM0UdEIYa15EKRMLjduz+/12UE
         YUR1eMW81S04XxrWoGT9qkXcuIVj7rfOh9VE895P+McCPHAt3wKW1qD6VgoLkETyuGRQ
         Gq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421009; x=1777025809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L8SAmev4VJJf4i5t8EUbInGL1AJKkZdyx8tFeJUEXIQ=;
        b=daqbVZMB+fQswnbFTw7+Lj/pxRxeYR9NYz4SonIpHkZGujJET6BmXBJWTyR05LsUlh
         bp//XPRvMTZAiknSkvFqDpaa2fQyggT7+GWPMNQqeg9/KkkN+f0nJ889NyUMQHkusBSQ
         KT+lopCgKl6q3nJ3ZHnv89shbezQSs1GvINxBOaKNBoVTprVv2usuP6rjhDNRqUsKU3x
         FX4tN/rIcHhpCS1BT5ZxFklbKt0v/kNBmsuUgBQSX72e+ElQn3zvFoQfu4VG0XOIsDFM
         kGXxeXZeTe5QPaPEl4Mdb1mtolSY/xiBQnFxx0/hVRUxEMpLHTd8MX3sHogEvSOIu7UX
         0tAA==
X-Forwarded-Encrypted: i=1; AFNElJ/AZW/G8r+mP1pVZSv7GpmqqVQyU+QJ0s/h6iHGbPyFidKZMSlEYqJuyrCWrQU9iKJS8o8n3CHAtnIXs7ms@lists.linux.dev
X-Gm-Message-State: AOJu0YyoCR+3pT3zqIWaW00mmpSdp0K602K5Tz5RDX5rU/plqxTs72Rr
	Z4r4XUvMa6XTWWhhqPk5f2ylPqUgckJNrk3Lz4t599qD24PNn9C48YEY
X-Gm-Gg: AeBDiesx8v5e246f6/WvhpgdPCL4q2RUm91c+z22YkpkcwWG5Ma8AOYa5Doq2c8wRkr
	yeIZ535lxNvCLmiEQg5b+J0dEn16tBMzkGi36xcIxFmPkZ/dLbsVy7ByiUSDeRQdyAmyebcyh/Q
	XveeSFAB1cvnlAx2x5WRp7ZjoJb7seS+DL9YC9wScdc+J5aXHX8owTtjd9m/EyzC6J2BqYJ718F
	Y9Thg/wkML4AB75+nQXfLYHiER3xooiVojqANmd9z0Ux37rzEeiZ15grrSi5swTCHwLJaJHjyQ0
	D4/Zj7TbwBTWUJI4GrbDQRx9KW1MRWW2xK3NcOa8IvHEScZoRNorZhQKkk0LyFooYDaoZDVh54Q
	blJO69hS6X6IFvLGoc2HH8Dez6IfcywljFmiaoR9yuqyK9yEDZv+F71NLGIJdAtWDKPc1dCwM1P
	MXZn8FLS1OtxzpHsXDdGSGezCMVk9V3Q8CYLxQhg8O76FBE+CfrKQKOdzF2XppqPbqM6TWyBuO6
	ilnECPFguUwYBOkJ3fejfdylzep9ecuVDtkkTiu1IyfMKk9NChJHC99ctipTK+E+Pq3/7vYeKu/
	vZCjAPuu74FkZ3cH2zgm+zyruqEKn/u/LeZysyBo1Udn4OTR9EpSPcyJDWv/iI3iCCTQl2wycyY
	qpsRklC6aAuIVZuOvRQSl/NB3aLpuf+PguPOK/KVG5Hova8PsFOvIODOBedOBj6PsdxvekAuZ/9
	+WAKRJZZk=
X-Received: by 2002:a17:906:5190:20b0:b9d:166f:ff82 with SMTP id a640c23a62f3a-ba41916f331mr89383766b.6.1776421008575;
        Fri, 17 Apr 2026 03:16:48 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (125.133.90.34.bc.googleusercontent.com. [34.90.133.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm38937066b.63.2026.04.17.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:16:48 -0700 (PDT)
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
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v6 1/2] iio: frequency: ad9832: remove kernel.h proxy header
Date: Fri, 17 Apr 2026 10:16:22 +0000
Message-ID: <20260417101623.1281-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417101623.1281-1-joshua.crofts1@gmail.com>
References: <20260417101623.1281-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove kernel.h proxy header and add replacement headers (array_size,
dev_printk.h, kstrtox, mod_devicetable, mutex, types, asm/byteorder) to
maintain atomicity. Moved asm/div64.h header below generic <linux/*>
headers. Additionally, add bitops.h for BIT_ULL() macro.

Audited using the include-what-you-use tool.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/iio/frequency/ad9832.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b..c0b7852f1c 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -5,21 +5,25 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
-#include <asm/div64.h>
-
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
-#include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
+#include <linux/kstrtox.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regulator/consumer.h>
-#include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 #include <linux/unaligned.h>
 
+#include <asm/byteorder.h>
+#include <asm/div64.h>
+
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
-- 
2.47.3

