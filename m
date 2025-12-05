Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5462DF709
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764966505; cv=none; b=mr/c3VmGpMupt8i1BZLme2MNHxIzvzqf9CSDSviKJ/Xqg9tGhZhwCuTRRflmAGtCSS4fmT5mA302fKgFp01QzloWN8Liq5Qovtz3R4QSq+kRxt4xOncqG2ppWdyHvEQlH4uC2W3trI/2GTdRpp1MOzDe7mBY0eAQUWegDCFiRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764966505; c=relaxed/simple;
	bh=VhjRdW4KfUHyNC/C+mtuazEPEEU4C1nG1wSKWcNKCz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5R6gHAm6whbuNKEmU/9sp3gtT0dFlfJydzXakcTuH/0MAlcIkjd5k55L95+uE6Z2Y8qwXlUs0HTjx30aqrcDuTBpXPJrO2a82zW80DFP3WkaB4ToLqiH8iovcw07ZYfguZisUEzbg/QggDjZX6NK+RvwnhUiyqbE+8Ez4AG6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGAHvFJt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGAHvFJt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2955623e6faso34666695ad.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Dec 2025 12:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764966502; x=1765571302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1kT6K3Ob3aEghOazhmPBd7i4Md15BQDt3Jsih2JLy4=;
        b=XGAHvFJttHkbBxiZowpLd13oi8evUq4sSl2YvcGtMTlYOSi8L+/0dCNztTkTjuQVAV
         mlJshavYnipWVT4N1AEHXZ1b+2fzVcLgRWH36jw2Ed8hNqe6Nia49YkfO7L1kYU0ZujE
         h8l6RhRV/IayljBtwDKtXFvVrhhbqZsRmymXpJ9Ai0tR0Hit4WqimqNof0yHZil2pBvB
         lFb3VB5NGm48x5RBTmQ94H9cSTm5b5U2VcPr/YBlImfjeto3vccEgC9ck/DA6UaEe8ky
         aeUKnBhrPaoo9FNTXxcMw98JF4hDtmVDZiUZItETWZiUHF3e46NTu5++iNRotJt4sC9U
         oCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764966502; x=1765571302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1kT6K3Ob3aEghOazhmPBd7i4Md15BQDt3Jsih2JLy4=;
        b=fbFavdARL28yxb2K9p6u1LgGf6L07fowXpzxGQFvl/h74FwMMHQEgzpF0McCLUxqvE
         X/hT8S06AdX+0m6wKtJJQu6xUV/whU0QYP7+H2czVvzXGMd3Mr1FhVhR4PZ+4+wpDy0c
         ZJqcwgalyxTIEUJqPkEcwhZx2qeJzph+2DDZkHuJHJbbeBwdmSbekkW/q2cbHlRB+ig/
         2w5LHoQomq4OSiKoMIpm9BePdFYL+PrJkPIhfcLr/rh8YEEvf9lum/1xNbKwPieRA5/H
         jP4jrf/sob17AnCtqwwlV8RdWZIgwkjIZZa7Sx4gUKp973IGh9qHCqe3HfOCxK8wFBDq
         YGLg==
X-Forwarded-Encrypted: i=1; AJvYcCUp6m3G7pCtPQGnSJ3jCX59p9hbQettCBk5VZgBw+yUoN5Yvoq7yQSqSV0d6AY7B6uNa+ihnkPqR2JOuRi1@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn5GcQ+KzCDpchcPBrqmsiK8DkD1TcPncX5OsDDnSLvRsN8SAK
	NhtHYVKlD5U6b91+o2vPrn1aOI+i8I4jjJ5XbEr9jJUnapCN/qRZGd+3
X-Gm-Gg: ASbGncvNSBSxib2ufADZ3TxIHBzmX7wXft/rKyPY4N20JL2T+7H7kGukwbw9UW/oUHq
	TKh5utPoPO8asltm4aXW5AXATAkBoKje3SKhZbQgFIRsA3FsfN6kRabUhcXdsiIXSp3e/SypeQW
	+mbHnRBJI5DZDbe345eXPCQ323drhEVG5Ykl4AMbKTn1fOjUucqJGqGddOaoob6lsmibO24JztM
	Woq2Bs9zzXis026ZJUNvq/y0GrdNfyJCeC+T8USPPvQuQCLfPt9Eqw8Xf6PqtHp+pgyNpz9foZo
	XGoAY6eHjeQfkYFc2x9g2jMs/6yRyz76UZGd0l/M8+O+m7JraWOl2GLs37tnWAhcG3R1cphwXKu
	iHq0ZWsUd+meqM0bsy4kOrvhjRWgOT6IQYPQUPcHp3hf7nTI6BuBjSv33RceQo7JoOAwguwyo0e
	C07trPzdewoJUUnnv35v6tCs4WQ9pcMyICph1IdQiAGnCSNMzNrHnsSDNdx+DyCBvxFwwXPAuFU
	hZWZ5qCnC+dAf+vO3FRvcTOxjBXjVFZZxRrDlY854lMBn1iQ7k81VHOZ+slRPtE/cOwg714
X-Google-Smtp-Source: AGHT+IFTMT5Gqt3zxUUZz4Uief0KidTbdHtVVj8Bdg+zDGW3adOU9RZX8JRZKLTJtpJNPMg3XEQQqQ==
X-Received: by 2002:a17:902:e783:b0:296:3f23:b93b with SMTP id d9443c01a7336-29df5a9d23fmr1726475ad.2.1764966502353;
        Fri, 05 Dec 2025 12:28:22 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm57256845ad.58.2025.12.05.12.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:28:22 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [RFC PATCH 1/3] staging: iio: ad9832: remove platform_data support
Date: Fri,  5 Dec 2025 17:27:41 -0300
Message-ID: <20251205202743.10530-2-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205202743.10530-1-tomasborquez13@gmail.com>
References: <20251205202743.10530-1-tomasborquez13@gmail.com>
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

Original discussion started here [1].

Link: https://lore.kernel.org/linux-iio/20250628161040.3d21e2c4@jic23-huawei/ [1]
Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
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

