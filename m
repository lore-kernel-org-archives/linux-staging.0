Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180648;
	b=Bwto8pFwdQlDDuEBM0UFsTtgZgBghjrqDYpEVfJfzPb3ywpZWu7nW12WhIInAIISgYW2
	 /WvmExIOLB/hWEt91JLxudUfUF6oKSI0YseLPjQndJd4M7ZlDCTfzujXC3b9oBxU/A8yF
	 y9hTC8+W/F1pIiMXm3XinaTaFux+suw2EGj7IAnYm1v4snoRJsqHzIIlsTrAS8uBkTPyk
	 UDKEzZKjsbUs7wkF3/KWc//DcJ7sWf5dxFU634cvxrJJedn2OO9YfhX1ITvR2ThyC5jMu
	 Pe7eU1W18e8wlvGcc4Dnm0oPs2JGOy2YRLzS+cyKlASBUm+qpK63aXE2o+ub6XaUZdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BZ1KJWzBPUbk3tJbiYcox2qZA+SWKs+VXWNl/tiELj0=;
	b=pWVHty+Hswv9/LxYSF1xkgqLHvHk4g9RSkUOdDoMfmnYojLRJxwxBGd47dAzDWL7JaPL
	 4EjMgCMM0/b0fTm13iWbp4zw0GZXZtrrhTi3acsOt7TQ4IvYhUASpGq7Hk64A1KQRk+o/
	 333jD7rFRMIexkl18ser8a0tHIoOTnqmkLjJcHLgpZiG8mrl1b4bQPONhu78iR0Jp+mAQ
	 WuYU0S1G+dSFCZiGHSoA2vilKTBcJ0Fmf7mrVbenWYYrRKpITp361sSm2YDDluMdznkcK
	 m+nbVrB9M4b564ReO34Yw6ImKbRjk/gWc9w9vAqKjU/9yppdwON8NLFukiJv9RDwy2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uom5wfgS;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27657606A31E
	for <linux-staging@lists.linux.dev>; Wed, 28 Oct 2026 09:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27657606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uom5wfgS
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso6233885e9.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Oct 2026 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180645; x=1793785445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZ1KJWzBPUbk3tJbiYcox2qZA+SWKs+VXWNl/tiELj0=;
        b=uom5wfgS5kO/d2ZuUj0+w4sLDFriOqjRwbHoRCitX3h2QxRaz7RuP3tC6+pmWiAs/m
         nWIZgt8eW5fqu3dQRPFdunSnTziANTfPX6eF59U7npMuEuizHzeafDS2MNi+thSIIGoS
         TceDaS8kFI3on0U5aFmrHJI56pF0nQiGmYIn/7/sw8MhT92jJ3a8swqefz4f9GlVC4O/
         tMl0Lk0Ta0MEDb4PA498dBkbUp+53MtLNEoHAbwo7cR7m8EWz5eUO7YFwdo0prKlweni
         zql3Q/WZbv7gmv53HW7aGINpzaOyy2Ub9CTs8qecsHUOltr/5G9+iFGZO5KkU7HWoCQ+
         LCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180645; x=1793785445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZ1KJWzBPUbk3tJbiYcox2qZA+SWKs+VXWNl/tiELj0=;
        b=APAiOI+Lb7tIsvX0YZbeCN3IiM8e5rDyZSUtaFi83HVPtcWEeqytfhBjfc3jH8mDEH
         9NBQIcue8Grp2ZF0zSLKYfEqy0PXO6Bti14bdAENRqsi8/4bydhZ1UntWaq9li5gBKF+
         F/hIPagJ+nal3pqOb1V828A+ty03U4B0NgqjPB0z8hu/K3W70TnBBUoXfvWhDETv4/WO
         FBjNqnQYLsH0T+rriuDrVzLC+Is7k5z6ZgawZtdlYee0oj5Tptmg8qcJhP8OFj+w3p6S
         lbEqBNCAKjQlSnDOS6dxhDgcQDIxyz3yUiG5zb0YRRnwj5NWZpj68yrERbrHdFS+F5S/
         nvrg==
X-Forwarded-Encrypted: i=1; AKwUvBxKF6GioJXGf2prjEiPfTI/zGKx60iXu7wiUNZ/IJbPSk3lQo8L7H8gcrqhLncDkE/2UzMScsY5PeXGyZc4@lists.linux.dev
X-Gm-Message-State: AFq9FYJxW39PRvF3eapfccVIF6ucyG9UqfkEyYaIakbcjchSx39mLCX/
	Uh0pb8KbMLZgSy7+SPE5nccNVzbNIugIoSwWvd76RU4c5bGWW2e5Rg7aJ0kRow==
X-Gm-Gg: AYBFou07KCH4V7J1SHvoXhBtHvrYfetLlb7O27ujdgoZlV0Kj2MMTC7DhuvFr3jyJnh
	sGFdaesqf1NLLNskNNbtnFUFAdiYHtYEtQF6afOd9vu0SFC6KxOOilHKCxyhLQpgnT/3vM6GMSE
	BP08e4/S5q9Qo3HNPYT9UU97+rSySdE11/Z+BZjZlwb+8q6Q6jLHBpD4RKFUWqU9M1uBkdGBY9h
	tbppAojklzNaCqGekuYISV+7DPlZx07TWb2BnDCcjGj0c7PH2MlZfbzqBPX3XuMr/4fZYYbGezZ
	1I2ZSuAHLrfnsvpEIzvmqw0Ln/+yj0aCRxWj5BLfkWPpUbJS+GF++O7++5UdvYBKOwewPhOqkOu
	B/Hq5DQZ32kI+7vbMes4RoMpXlI6+tfu/R+GffMv4ywmVLsMaIeFiLJoLlogFZg3BB1MPk3e7lB
	eLwEeTgXbaT0XMA/kt7rLttzF6v8yxk4Jm4xRNmt6mZg0lIB+EafSMHPBMBM7ppytsrMuiU67RO
	iPMGqm7q4/cphplo3ODbKvIQ3jI4nF1D4bkEtVwkesLeuW3KL472KUsWC3P7qHlAv+U5AoUR1Hr
	u+IaiKL4ui9rcrL59Ao9Lrp2kCjDlIEUZkr3kMcigwnBmNlMdEa7w+xN77b/
X-Received: by 2002:a05:600c:37c3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a96701830cmr35730755e9.25.1793180645227;
        Wed, 28 Oct 2026 02:44:05 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d6besm31962265e9.4.2026.10.28.02.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:44:04 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: iio: addac: adt7316: clean up and sort headers
Date: Wed, 28 Oct 2026 12:43:07 +0300
Message-ID: <20261028094308.27811-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Remove unused header files and
add linux/pm.h and linux/string.h and
sort the remaining include directives alphabetically.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..e30d978fea56 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,22 +5,20 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0


