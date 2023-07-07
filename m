Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC1B1775B
	for <linux-staging@lists.linux.dev>; Fri,  7 Jul 2023 21:15:56 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1b0748bc78dso2219849fac.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Jul 2023 14:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688764556; x=1691356556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o55RwUJuXKY3r9gG6aD9I7YM7CsRDP5cAsKlf5uWgUk=;
        b=UWTyfGbFM9ua95PrFcks0NE6hsYUmSVj2466XRw+BTY1zqjKfKwx2PGU/1/kuOStoo
         cU7ZE27V45LQEhReWRrIX2f5ADI9Nr7rNaKxvHcnqdh0q9Es3mwJK8CoqUlFtWECx1KY
         9ap84c86T7LW29B1ijPC8vQb4BLb7sXAo00t4Rh7RQ+xwyzgtdpQQl/Kvt1e3J2/tnV6
         MKJT82XNvf8qvPaSsM0zo749D9qSxONQiI6608vJL5nKAs+7dssleexBzSFgBBNDyIYN
         nekeHZb26B8+T1NNFup6dNetydrEFdo5YWzHkmfzwYIuWXRDAVb7Exn6h56VthmHtT3p
         LYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688764556; x=1691356556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o55RwUJuXKY3r9gG6aD9I7YM7CsRDP5cAsKlf5uWgUk=;
        b=FNL1wDt+/uBG40hzVPInpdRFSNT1mw+ty7jfHJweeHnvU9S5rwZTh1j4f051Aax/m0
         IDxYdKDP/lqiFLzXENwq/5zpeykPi9u7wug3cYnXSgrnypjq83n1BY/4kJPvfwTNcY6Q
         rz1JzwHW2s8whmnoLS1dxlZ1Q4RHWQs7lItxmyCnNyDDSybj73Np46Yv+jK9eDs0Fif3
         bCdrN5IZO22fErcFJ67l8FVJ434omO4+UeVYehdMTVG2XUNkf6djMYQbknJErZV/AijO
         VqvZGzVvXIzEdEUnXk98iKrqXdUmRtI3mfVMayjYBXAEIEZ0n/DEzpTMNOS+xfGj8F2W
         nPag==
X-Gm-Message-State: ABy/qLYBV0P1l6sEu4R8G7fvTOR+Npvsluu1eoTaAHQOIm+zGb1LJJ5z
	JMp08crEH/36FkqVif+e3HE=
X-Google-Smtp-Source: APBJJlFjE+nuPlRO/M/P4aUGLoAAFMQspI16TJMD3W5TSdipZfRhBo4B14UbW2bS61kYw3BfvYfTiQ==
X-Received: by 2002:a05:6870:2054:b0:1b0:2a6b:edf2 with SMTP id l20-20020a056870205400b001b02a6bedf2mr5110225oad.4.1688764555442;
        Fri, 07 Jul 2023 14:15:55 -0700 (PDT)
Received: from madhu-kernel (99-145-207-128.lightspeed.austtx.sbcglobal.net. [99.145.207.128])
        by smtp.gmail.com with ESMTPSA id di22-20020a0568303a1600b006b58616daa1sm2053188otb.2.2023.07.07.14.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 14:15:55 -0700 (PDT)
Date: Fri, 7 Jul 2023 16:15:53 -0500
From: Madhumitha Prabakaran <madhumithabiw@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH] Add struct ad9832_platform_data to the include/linux/iio
Message-ID: <20230707211553.GA110890@madhu-kernel>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add struct ad9832_platform_data to the include/linux/iio
for maintaining code organization and clarity.

Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c |  3 +--
 drivers/staging/iio/frequency/ad9832.h | 34 --------------------------
 include/linux/iio/frequency/ad9832.h   | 30 +++++++++++++++++++++++
 3 files changed, 31 insertions(+), 36 deletions(-)
 delete mode 100644 drivers/staging/iio/frequency/ad9832.h
 create mode 100644 include/linux/iio/frequency/ad9832.h

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 6f9eebd6c7ee..675adfb07b5d 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -19,8 +19,7 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-
-#include "ad9832.h"
+#include <linux/iio/frequency/ad9832.h>
 
 #include "dds.h"
 
diff --git a/drivers/staging/iio/frequency/ad9832.h b/drivers/staging/iio/frequency/ad9832.h
deleted file mode 100644
index 98dfbd9289ab..000000000000
--- a/drivers/staging/iio/frequency/ad9832.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * AD9832 SPI DDS driver
- *
- * Copyright 2011 Analog Devices Inc.
- */
-#ifndef IIO_DDS_AD9832_H_
-#define IIO_DDS_AD9832_H_
-
-/*
- * TODO: struct ad9832_platform_data needs to go into include/linux/iio
- */
-
-/**
- * struct ad9832_platform_data - platform specific information
- * @mclk:		master clock in Hz
- * @freq0:		power up freq0 tuning word in Hz
- * @freq1:		power up freq1 tuning word in Hz
- * @phase0:		power up phase0 value [0..4095] correlates with 0..2PI
- * @phase1:		power up phase1 value [0..4095] correlates with 0..2PI
- * @phase2:		power up phase2 value [0..4095] correlates with 0..2PI
- * @phase3:		power up phase3 value [0..4095] correlates with 0..2PI
- */
-
-struct ad9832_platform_data {
-	unsigned long		freq0;
-	unsigned long		freq1;
-	unsigned short		phase0;
-	unsigned short		phase1;
-	unsigned short		phase2;
-	unsigned short		phase3;
-};
-
-#endif /* IIO_DDS_AD9832_H_ */
diff --git a/include/linux/iio/frequency/ad9832.h b/include/linux/iio/frequency/ad9832.h
new file mode 100644
index 000000000000..517d954636db
--- /dev/null
+++ b/include/linux/iio/frequency/ad9832.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AD9832 SPI DDS driver
+ *
+ * Copyright 2011 Analog Devices Inc.
+ */
+#ifndef IIO_DDS_AD9832_H_
+#define IIO_DDS_AD9832_H_
+
+/**
+ * struct ad9832_platform_data - platform specific information
+ * @mclk:   master clock in Hz
+ * @freq0:  power up freq0 tuning word in Hz
+ * @freq1:  power up freq1 tuning word in Hz
+ * @phase0: power up phase0 value [0..4095] correlates with 0..2PI
+ * @phase1: power up phase1 value [0..4095] correlates with 0..2PI
+ * @phase2: power up phase2 value [0..4095] correlates with 0..2PI
+ * @phase3: power up phase3 value [0..4095] correlates with 0..2PI
+ */
+struct ad9832_platform_data {
+	unsigned long freq0;
+	unsigned long freq1;
+	unsigned short phase0;
+	unsigned short phase1;
+	unsigned short phase2;
+	unsigned short phase3;
+};
+
+#endif /* IIO_DDS_AD9832_H_ */
+
-- 
2.25.1

