Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BAB247298;
	Fri, 18 Apr 2025 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009432; cv=none; b=C+KzDuHZROI99Dr2oOkJb7WDewyN/dYM04RynuqrlFt3HqxdMdXtLWcGtoL6ngYc6QVUg4z5eEAnd0KeSWWLqIDrVrS3/BEIkVitAfIsVDjOFnrTg9evT14+Ch/1riCVZQ9PUru7/kQIsxfrFYjsMZLv5pttGvENrXPpVjA0+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009432; c=relaxed/simple;
	bh=FS5Q98qLID6FAQ/N12FPnFMlE/nozAWlI7CwtVF5bKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDt9EAJ/DyrcMMdrD3wDxyiFB5WAeXWWWdoZq8ixH/61ViXsC2DgXvKtPOdzlqQR9vsTbAJ3kyixiDpbkpv7o4Z6Q0xh3vJor8JxHEMF2vEAdYVAJ+/fHlRR5hY97LWINlS+G8J5FL2x9b73VYKAbTS0SXaW1LW1afFwzrEbh8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHmFIAZD; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHmFIAZD"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f8657f29so20583406d6.3;
        Fri, 18 Apr 2025 13:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745009430; x=1745614230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd8epHvveGFvAa9vnuKQvCxPWBU3eQ5S8aYIg7aa9r4=;
        b=EHmFIAZDOeKruqIOKfBkfWlYisG57G1Say6RlefByyK3l0rEg+x0sWAG0stkYYaLLf
         Z+jkB/q0nTlNYesE8npt2lrk82jEjO9AqO9qnFx1q+zPJJZIgu0IAmuYAPrEYbEimnSU
         wtSmbnvMieo90mraVoAvMuX0tzcBRy3/wrBk4+E3FGJbMAuiV96NIVv4R/mkjxObSOCs
         xKnlIpWNVKW892kzILFptRZkuJDeZb7IjU1rw+kTpR0By5kU3uSfIuJv3wiICpNo7zEv
         Iz670Mn+Z+qNfD7dchhZ3bji6NpJH6wFJLmoTavF762Wi5f0L1FuDtACwfvdULiYyzns
         K2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745009430; x=1745614230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd8epHvveGFvAa9vnuKQvCxPWBU3eQ5S8aYIg7aa9r4=;
        b=flYEjwtyIbkUTlk9Qad0DrquvgVFt+fsUq76XfcE8XgSdU+cKsvdIZ5EtcYuvRX+/T
         KJRBRnZHpQOIaNr9t+tb5rc1T5+AJt8c7UmWB8l9JjUepdHzv2HUnGJ9Zrhp3J75Lg17
         2mMJ8KxPLi2Nf6v3BE8ETV80gcRtBkHl4T54Kuz7vrQmb9jj8BxvKf+9Yq/ZXBjhafAy
         pjgPGs+7hQ2wxuVZVyOVqkIfoUk0QLdiHksimZgwyP+b/oPUTZJTpUbLCkpk99apRMMo
         LDAmCjgf7P7IFejZcXEEUdWv6Ytsm9Y2UCbol2yMFZD0JGSKk220PDQNol95J2wqxTxg
         m9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUsIUn2bN7fK5qU4F/Q8s3ZoxjxDK4LCC/0GnoHMbxHnCpCwgOTvXElb4vl0ZeN+3pQC3v1DTOwv4kPdTZGR45aSQuSmQ==@lists.linux.dev, AJvYcCV+uRPamcR5fLwKGYOXfa8lpoBhHIXzZZA9dxjFVBuWpprrGcSJ1zwViyv+iAGRSpnoyl1A+usR5ioP4YO/XQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGTuQm9Vf5nf0E0HnsUXaiU0pPHISn/Yja+TN600D5wPeR4lfB
	4vQXDsqGvY4aLJ5/0jsNIhrpNum2bfWBu92G+Qmyu3kiacjLknT6
X-Gm-Gg: ASbGncuJfqX6FFWX9n4yBOqhC9yDVMm1xgS5FpggFNo3Bc2eAmaaNfvGiiCQe3Bof1y
	g+19T86GOHlXw0mWtUO4hiTnBlgjwW3Rbe9mFpBg8orUyecLcgGcfmpuwgwN3cK9seqIXR79cQC
	fzZtH4WV0QuG6wM/of+/oqAdF+lRwZdcFPzojJGK4cwCPMpIEtD8Yk8tYM6rkma6qzlWc42CCbH
	JeDAzeVP38eIiVaUsaro+lQOA7RHOTIIjQtA5tDmFlzs1EiBDLVgG/w9hVPCLXIdVgCGgHBoC4j
	+VusnwPjmTWjZjSjBamdTMH0BMC/a3mP/rHBw2MnaRT03ZZOjs6gGMIyRQ/Ji+ZbZSwpKXRQ7E6
	znt463xzA/7TQqjjzM2w=
X-Google-Smtp-Source: AGHT+IGDmHTGhruK6wW4y9Jl3xhk5kCK95hI0Cft5V7xjnVFOw31DW5QPpTuy/nGifTpriStN2f6PA==
X-Received: by 2002:ad4:5f8e:0:b0:6e8:c713:321f with SMTP id 6a1803df08f44-6f2c4655d5fmr77521476d6.35.1745009430109;
        Fri, 18 Apr 2025 13:50:30 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af11d7sm14355906d6.6.2025.04.18.13.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:50:29 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 3/5] staging: iio: adc: ad7816: Introduce chip_info and use pointer matching
Date: Fri, 18 Apr 2025 16:47:37 -0400
Message-ID: <975a52c4713491be77e2f1dcc73a872017293550.1745007964.git.gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745007964.git.gshahrouzi@gmail.com>
References: <cover.1745007964.git.gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct ad7816_chip_info to centralize static properties (e.g.
name, max channels) that differ between chip variants (AD7816/7/8) but
are constant for any specific type.

Store pointers to these instances in the of_device_id (.data) and
spi_device_id (driver_data) tables. Retrieve the pointer in probe()
using the firmware-independent device_get_match_data() and store it in
the ad7816_state struct.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 55 +++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index cad2e55aff3f9..39310ade770d0 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -41,8 +41,28 @@
  * struct ad7816_state - chip specific information
  */
 
+struct ad7816_chip_info {
+	const char *name;
+	u8 max_channels;
+};
+
+static const struct ad7816_chip_info ad7816_info_ad7816 = {
+	.name = "ad7816",
+	.max_channels = 0,
+};
+
+static const struct ad7816_chip_info ad7817_info_ad7817 = {
+	.name = "ad7817",
+	.max_channels = 3,
+};
+
+static const struct ad7816_chip_info ad7818_info_ad7818 = {
+	.name = "ad7818",
+	.max_channels = 1,
+};
+
 struct ad7816_state {
-	kernel_ulong_t id;
+	const struct ad7816_chip_info *chip_info;
 	struct spi_device *spi_dev;
 	struct gpio_desc *rdwr_pin;
 	struct gpio_desc *convert_pin;
@@ -52,12 +72,6 @@ struct ad7816_state {
 	u8  mode;
 };
 
-enum ad7816_type {
-	ID_AD7816,
-	ID_AD7817,
-	ID_AD7818,
-};
-
 /*
  * ad7816 data access by SPI
  */
@@ -84,7 +98,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
 		gpiod_set_value(chip->convert_pin, 1);
 	}
 
-	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
+	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
 		while (gpiod_get_value(chip->busy_pin))
 			cpu_relax();
 	}
@@ -353,6 +367,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 {
 	struct ad7816_state *chip;
 	struct iio_dev *indio_dev;
+	const struct ad7816_chip_info *info;
 	int i, ret;
 
 	indio_dev = devm_iio_device_alloc(&spi_dev->dev, sizeof(*chip));
@@ -362,11 +377,15 @@ static int ad7816_probe(struct spi_device *spi_dev)
 	/* this is only used for device removal purposes */
 	dev_set_drvdata(&spi_dev->dev, indio_dev);
 
+	info = device_get_match_data(&spi_dev->dev);
+	if (!info)
+		return -ENODEV;
+	chip->chip_info = info;
+
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
 
-	chip->id = spi_get_device_id(spi_dev)->driver_data;
 	chip->rdwr_pin = devm_gpiod_get(&spi_dev->dev, "rdwr", GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->rdwr_pin)) {
 		ret = PTR_ERR(chip->rdwr_pin);
@@ -382,7 +401,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 			ret);
 		return ret;
 	}
-	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
+	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
 		chip->busy_pin = devm_gpiod_get(&spi_dev->dev, "busy",
 						GPIOD_IN);
 		if (IS_ERR(chip->busy_pin)) {
@@ -393,7 +412,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		}
 	}
 
-	indio_dev->name = spi_get_device_id(spi_dev)->name;
+	indio_dev->name = chip->chip_info->name;
 	indio_dev->info = &ad7816_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
@@ -420,18 +439,18 @@ static int ad7816_probe(struct spi_device *spi_dev)
 }
 
 static const struct of_device_id ad7816_of_match[] = {
-	{ .compatible = "adi,ad7816", },
-	{ .compatible = "adi,ad7817", },
-	{ .compatible = "adi,ad7818", },
+	{ .compatible = "adi,ad7816", .data = &ad7816_info_ad7816 },
+	{ .compatible = "adi,ad7817", .data = &ad7817_info_ad7817 },
+	{ .compatible = "adi,ad7818", .data = &ad7818_info_ad7818 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ad7816_of_match);
 
 static const struct spi_device_id ad7816_id[] = {
-	{ "ad7816", ID_AD7816 },
-	{ "ad7817", ID_AD7817 },
-	{ "ad7818", ID_AD7818 },
-	{}
+	{ "ad7816", (kernel_ulong_t)&ad7816_info_ad7816 },
+	{ "ad7817", (kernel_ulong_t)&ad7817_info_ad7817 },
+	{ "ad7818", (kernel_ulong_t)&ad7818_info_ad7818 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(spi, ad7816_id);
-- 
2.43.0

