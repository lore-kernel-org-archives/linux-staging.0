Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5842334BA22
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743692; cv=none; b=T4KtiS3YsbHAG9sxGeP542CsmtnNp8EHW0KT/MtvtROkfN4fKITocwzGcpaiwBUfTakx9rRoBsqDi8JVLTiKXSM9vVIlcGa/i35eFdcvkdcrrr8YBXO7zsKemW5C5TuRJnb88OhnSpLODR8TG+cdPqSTqtLFncyncyBxLmi8kQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743692; c=relaxed/simple;
	bh=RWpmJwgLuM2FIonYsAJTiC7gB8HKm6Y3f9332Ma3b94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7mp3GCRxg+ct/mRePHiMuHAP5MQj2YqqQuyOroyhWlufypXd5AaIO+Eaecto20ydYGIGqOYS/D07nkqc2eGsyshp4lW7eYAYcaYuI5Bz/TN7ouaQUKDD9PW8b318KmaO6WGoiGRHpch4yUMlWl0aHiPKZleFMDzb+YTfd14XBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUQe74lu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUQe74lu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-271d1305ad7so70954325ad.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759743691; x=1760348491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDWMO78/Sngggr60GZi/HLcWQ6AuAiwa+2vlLjX9o2g=;
        b=QUQe74lu4ThpHBm3TQqUtOM9u1wQZPqdhU9kMB17eJ0aAlkjD25npjtcWjCk2wbzTl
         6q76XTCk5Q+mNqQD5Kk2aCgqz6Qk6QyYP3pDr6wuM+Luhkj54NW3LbXe7ULzQWIqfxE5
         MEt8JZFdDXiT3G75OR0oUYfJV87LvpcHpqVBvMkzTQfa+LmHZcfBXYkInllKYdviJcxx
         8GY0x/6JFajzuR0OD0c2AJbja6xJiZcoVQK7Zbi5m9BFUoaJujSqR9g+TTcOq7lOXfMl
         OiQrNgM7w/HLSPXcC6uoamBn3iV/Xm6T3FP8aYuCrBIRWvjRDxXh5NwqsFmeYRPivaFH
         SzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743691; x=1760348491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDWMO78/Sngggr60GZi/HLcWQ6AuAiwa+2vlLjX9o2g=;
        b=GUNhBEa0Fw4hoc9HaErSignfVg2WczM+bHAFiIyCX/s5PSRTjZOcLjKuveWfIaWcoy
         IYwV/w0nZ1T3yibywDF12eQlV2SQpOitQ2m1a+tS7sJw0R2gsWBQSekhULTc+247gTOL
         6+CwwDi8RRaRzPjMKv5Dd3Eu+Oru7yvOlCpuy2HjSu9lFYxQj35rsdq7oWDss4C4YMQW
         XszpwwWxw0H5AHfwvivv9k8L2rNvNcTk4F+zjAYyFeDDeTBzyaOezBKDnC7NsmA88sj1
         Uat5kmezKUXu7ZB22nUGnL8iBIkeouukTaXqM5HM2eiCrmCBuY0JR+hjgs8LETG5Y1j5
         QiCA==
X-Forwarded-Encrypted: i=1; AJvYcCVvKZBUUQpf1T6vsuArsHYGrEzp/JxAaFKt3CFeCToXihCt1T74JsWyxD/61NEcxbaEqhKB0ZR7sRA5qcAw@lists.linux.dev
X-Gm-Message-State: AOJu0YwunOkl91xmgVIxcHvJaYhia7R0npiKb12Q/I73Pi+EgBMkUWf2
	UEPwmzSEh/V/PDrwT6WxyqUqejnMuTCfanP5K0kGtKioxKcBfSsyhKpN
X-Gm-Gg: ASbGncs0OJESF32gACeuvu7WAiBupRaliOmOh7MzrtlcjSs9teNufAHhbkDtFO15hKu
	Fl+eVs5PEDCxYoFNwR30BgkB9Qhsti9zbZWy5nSJPG2THP/j/Nu37o37t+ZqOQiZh7jJYPhW9VX
	op03KgGuXKAbTrApIQ8tf74G5ojJaU6PfXpSlivqf55G9uUCkrPsNje8a7L1LNh206yaFXmcffw
	6ZVp1lopo8I+GmpX/vD8pgrxszsv3bNfpQCR07zUcCwTlmjKsujNeXxIgFEhR4YFxNuNArsMyEt
	nrlcCvMBRGYwRT24eBIEUW3senF5hVjq0jqZYKQWimPxck9tN025vc/Cy+ZlUrmk1hKLm4stLsm
	jTETolLghPA8aRO305MdKeA67m1pyMju73J85KUBXp/uySdSD
X-Google-Smtp-Source: AGHT+IGVuyWx946HsYOHhKNOFxC/pycX88y2x4j3++pl8lUJfoEyLqORuWilWGcjs9C38G+O9ca/Uw==
X-Received: by 2002:a17:903:1a86:b0:268:b8a:5a26 with SMTP id d9443c01a7336-28e9a6b19e2mr157755655ad.54.1759743690647;
        Mon, 06 Oct 2025 02:41:30 -0700 (PDT)
Received: from ASUS ([119.63.139.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b609be239c5sm11325778a12.19.2025.10.06.02.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:41:29 -0700 (PDT)
From: Taimoor Zaeem <taimoorzaeem@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Taimoor Zaeem <taimoorzaeem@gmail.com>
Subject: [PATCH 2/2] staging: iio: ad9832: move struct ad9832_platform_data to ad9832.c
Date: Mon,  6 Oct 2025 14:40:25 +0500
Message-ID: <20251006094025.259440-3-taimoorzaeem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006094025.259440-1-taimoorzaeem@gmail.com>
References: <20251006094025.259440-1-taimoorzaeem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct ad9832_platform_data is only used in ad9832.c
so it moved there instead. With this change, the ad9832.h
file becomes empty, so we can remove it.

Signed-off-by: Taimoor Zaeem <taimoorzaeem@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 21 ++++++++++++++--
 drivers/staging/iio/frequency/ad9832.h | 33 --------------------------
 2 files changed, 19 insertions(+), 35 deletions(-)
 delete mode 100644 drivers/staging/iio/frequency/ad9832.h

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 49388da5a684..0517858bc5da 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -23,8 +23,6 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
-#include "ad9832.h"
-
 #include "dds.h"
 
 /* Registers */
@@ -117,6 +115,25 @@ struct ad9832_state {
 	} __aligned(IIO_DMA_MINALIGN);
 };
 
+/**
+ * struct ad9832_platform_data - platform specific information
+ * @freq0:		power up freq0 tuning word in Hz
+ * @freq1:		power up freq1 tuning word in Hz
+ * @phase0:		power up phase0 value [0..4095] correlates with 0..2PI
+ * @phase1:		power up phase1 value [0..4095] correlates with 0..2PI
+ * @phase2:		power up phase2 value [0..4095] correlates with 0..2PI
+ * @phase3:		power up phase3 value [0..4095] correlates with 0..2PI
+ */
+
+struct ad9832_platform_data {
+	unsigned long		freq0;
+	unsigned long		freq1;
+	unsigned short		phase0;
+	unsigned short		phase1;
+	unsigned short		phase2;
+	unsigned short		phase3;
+};
+
 static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout *
diff --git a/drivers/staging/iio/frequency/ad9832.h b/drivers/staging/iio/frequency/ad9832.h
deleted file mode 100644
index d0d840edb8d2..000000000000
--- a/drivers/staging/iio/frequency/ad9832.h
+++ /dev/null
@@ -1,33 +0,0 @@
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
-- 
2.51.0

