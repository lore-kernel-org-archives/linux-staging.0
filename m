Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8334B183
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874529; cv=none; b=mSVwxxXoWMLQB7UcfQ/jnxqPSfDOi/6lcz+MoF6+/POOhg6mXQX4sfQD9wKDn7uLWxpFSBxkCeKr3laUc9hJwdqMsYiaRQcM/ShlH53QRb8qh417fKPkvJNXsAXmqiKBf2KRH3L5bt7kz09TgZtgeZvQat+mC85gm2cO/k0QdHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874529; c=relaxed/simple;
	bh=/zCl0HuPLWjC7Sa6krfiRVgt0gQ+G9nABtH88tweDYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mUiOX7EjYKv05PNjEBof1/Qp5ICEmLGOdLpb1Cv0iRPL7KmnUj3enhQii7ma9ZsLZm5xuAZSse8LvxaQavtTZ7Mz+JYuo4dsmP/phZh7R6kz0R1TuIob7Y1UQSQQ+T2tlYo6mabtGQ9JsH2Khj8SaPKT02Zl9SYx0JlCSxlVhoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/HrVdyV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/HrVdyV"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso2049362b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764874521; x=1765479321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2RVHBZV4NpZC/dFubhuGIj8Sf/h6laSe7o6mJh9Dj8=;
        b=T/HrVdyVlod6YtQdLl5YncpSe0ZeVGb3gnJohD8KmYAE2zh4BjNwzLlxI0aeVg8sus
         sVnn7ThgIDLrihEe8WYvPXkN8vU7x6lYEtkHy9TV/vGA5XFZBWqJ81AxkYrppGfQgcqf
         s2UauLtIqCH7auQ2ARYzLz13oDIG0XFf2uHePvh9Pneu4FXRiVDrOwodcN3gb7lnLbZt
         EcgQq0kOK2JCaV4HwDmfmgCT5+4Zs918oIJyNrs4UxooGLV0cqIiipvI7ZgA3Byy/TQt
         BaeGKkc/dNHGWOi2eAoR8I4zYqgza3NAmOhUgDo9e7jyzNNRePdKDportQfSZizwUsZy
         Q1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764874521; x=1765479321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2RVHBZV4NpZC/dFubhuGIj8Sf/h6laSe7o6mJh9Dj8=;
        b=wr4gNk1qzYys9A4Hnr/VhokxnrM9GTbEksOGypu6o0yZBfjTQU1vqo4CECLx/3jaSc
         b/YQvziJd8b9pWwSsssvZKT7yxrVkdV/rOv1CZ/yB7zN1dv07E8p1PFC/U44ZgxLOuhB
         sMcTYpZ1yAzGCWQvigRaoKaZYtUwgW1yEMDoeTTJlFkdgWfjfh9gomqMtG4rzSh/jeKY
         H8SxnN5ozNFgKxJJ6EJFKKbrgaYEl1hqlggiYxMXzwgQ+tTBPohplkPhu+C+8tgCDidS
         hxuSYsvUDiGz8HoxbPinaxIM1P3x+6nDE6fhMXkWPc7InD7w5u7STs/BTCCJ2B/wiIYc
         /cug==
X-Forwarded-Encrypted: i=1; AJvYcCWz9m89MC1Jws5cvrPoKXKGwgYOxx5LMNp/M6BDdy1+2a1i9ofBoURioaGAQzMETYWZU64FRL2DCGWsXT2s@lists.linux.dev
X-Gm-Message-State: AOJu0YweX5wQ0UUlz3SHQXbm+mJVbyfhXDkyv33VGz1YZ5lA9lB8tBvK
	xlpxC1myeOseCNDw8MsrAiT7/xwa5EFwtharqoTkoH7szGkJtnRGABN2
X-Gm-Gg: ASbGncvNxcDzLEqvb3isWPdEYjIF9QaCEJpwURfQL96n2udB91EKnpRLaNk31P340K6
	uA+1dPjn6G/jQ4NkWBf0/mwESoq/5tBLCEOGsLe5WlfifMGnCzVelX8kGG+oJNf1mTonpC7PFGf
	eWqrCwUDEUSIxgoWuRpO1ZK8Z0unKBAwXVLOabALon443+Poi6v41uKQc+SY9/N26aE1Q5hJ7DZ
	1XgazWqqpS7ChN+HBqXBgbcecZ8BNeHhAW1xHYepsVYanRFIG0iV9ueIsobSoWe19G0zHjAhvWD
	vomZs9X8l9QWYKFk6Qdx91XuaKEOmpAFcbcqIQSt4hNrDQ54/2lIjPIqFtw1hLcodWO3pYFAvks
	9MbHyearefPSCAo9BRPr4z4N241pxll2SZ2wNRBWwYaHM0e1HCuA0vuEUy7eWKn3Q/CD1k9c22c
	6KeQiK9SL9aYl+7JgqvJ+5HMw36iPRc2YAtGoyNTHOKhKTpkWwLZICljYPzK4FJHzgrJQsZWCa6
	VSvRQEnNVjq7qdLFdF8YFUNL/OfpGyWmzJj/Z3vaFPCwVnxG79SVszuYACY7SS6bhyFTw5A
X-Google-Smtp-Source: AGHT+IH9CgxiAXHcIB0H1EEjX3dtHjvletPsU8kPNx6CZxFd8Hf18KX/AyuG1/Mmw94t1QG1VOAinA==
X-Received: by 2002:a05:6a20:3d0b:b0:34f:28f7:ed75 with SMTP id adf61e73a8af0-36403763a2bmr4844083637.8.1764874521517;
        Thu, 04 Dec 2025 10:55:21 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2af93d910sm2851475b3a.67.2025.12.04.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:55:21 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH] staging: iio: ad9832: remove platform_data support
Date: Thu,  4 Dec 2025 15:54:34 -0300
Message-ID: <20251204185434.4542-1-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove legacy platform_data support as there are no in tree users and
this approach belongs to a long gone era. The policy decision on what
to output is a userspace problem, not something that should be provided
from firmware.

The driver now initializes the device to a safe state (SLEEP|RESET|CLR)
outputting nothing. Userspace can configure the desired frequencies and
phases via the existing sysfs attributes once the device is ready to be 
used.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
Original discussion: 
https://lore.kernel.org/linux-iio/20250628161040.3d21e2c4@jic23-huawei/

 drivers/staging/iio/frequency/ad9832.c | 32 -------------------------
 drivers/staging/iio/frequency/ad9832.h | 33 --------------------------
 2 files changed, 65 deletions(-)
 delete mode 100644 drivers/staging/iio/frequency/ad9832.h

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 49388da5a6..e2ad3e5a7a 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -23,8 +23,6 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
-#include "ad9832.h"
-
 #include "dds.h"
 
 /* Registers */
@@ -299,16 +297,10 @@ static const struct iio_info ad9832_info = {
 
 static int ad9832_probe(struct spi_device *spi)
 {
-	struct ad9832_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct iio_dev *indio_dev;
 	struct ad9832_state *st;
 	int ret;
 
-	if (!pdata) {
-		dev_dbg(&spi->dev, "no platform data?\n");
-		return -ENODEV;
-	}
-
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
 	if (!indio_dev)
 		return -ENOMEM;
@@ -379,30 +371,6 @@ static int ad9832_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = ad9832_write_frequency(st, AD9832_FREQ0HM, pdata->freq0);
-	if (ret)
-		return ret;
-
-	ret = ad9832_write_frequency(st, AD9832_FREQ1HM, pdata->freq1);
-	if (ret)
-		return ret;
-
-	ret = ad9832_write_phase(st, AD9832_PHASE0H, pdata->phase0);
-	if (ret)
-		return ret;
-
-	ret = ad9832_write_phase(st, AD9832_PHASE1H, pdata->phase1);
-	if (ret)
-		return ret;
-
-	ret = ad9832_write_phase(st, AD9832_PHASE2H, pdata->phase2);
-	if (ret)
-		return ret;
-
-	ret = ad9832_write_phase(st, AD9832_PHASE3H, pdata->phase3);
-	if (ret)
-		return ret;
-
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
diff --git a/drivers/staging/iio/frequency/ad9832.h b/drivers/staging/iio/frequency/ad9832.h
deleted file mode 100644
index d0d840edb8..0000000000
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
2.43.0

