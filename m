Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757E1DDC07;
	Sat, 19 Apr 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745071006; cv=none; b=WWhRXtIiVcczv0rPrQLObyETH4Y9unMoniuclcirVH5Bj3TarumJGQI5jHYn5rUq2MJvdkdj3YDyQDw5KYPTGlWqGUrZTCtYnrq2TewHK1mJ3yFCmZWlII/eRMWGkFTWEPEqYH+pIAS5Wecu/FcslWZEd5xsCWrNTfqsYgv4phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745071006; c=relaxed/simple;
	bh=FS5Q98qLID6FAQ/N12FPnFMlE/nozAWlI7CwtVF5bKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BV8w4GPSvsV9hRkHtDaI0HQaHDCxiRmgjlZhUD3sWa0fcBIspjUFUUsKUAJj9CYDQU7a+tHZdS7+cO15a+X7FXE3j7NMRXhqUxHaeGyAjtNe/fRjOGCHY4ySaXA740H6ruPSalao1VmraaTcKPfgEH2x9C03INuE23ygE3vCgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDvligUb; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDvligUb"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5ba363f1aso348224985a.0;
        Sat, 19 Apr 2025 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745071003; x=1745675803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd8epHvveGFvAa9vnuKQvCxPWBU3eQ5S8aYIg7aa9r4=;
        b=bDvligUbVdLS3PvwvuGOD/NTf65+DDs1VF8Ll8ZSO6yn2MRrricgY9MNQE03+XZHKN
         Hr9EFpAb+Oo7GD9CMatClGwtAPPOjgPz2+U8zuM9RRimL2ylRB7Orufk2Md2vdYR5Auf
         wrkwbKwkOwyTlqJBLBtOdU6RMnyvcDFraOc3Wln4yHuDFdcVd1zMNORRejrzAJWjWA3n
         Qs5r0360kxhuLbNmgekZCaj73CjLU3AC75EJQROKthlOORus3xukpO7speN4fXj6C+Fn
         Zen1lacbaU6+PfGIXmZ1M3EWsJcU44HzRX9RqLcnkOgmeut8JuoMJabHbvorC6YRB+uM
         pCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745071003; x=1745675803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd8epHvveGFvAa9vnuKQvCxPWBU3eQ5S8aYIg7aa9r4=;
        b=uGre44yPiVJy9dzrNSgUhqyXHtJTmDjdMiGp3MK18RDKBulAGbSu1KXzxxYz8Ji/ft
         YaIKXMD/MxQ9EXqscp6p28R2SYlvbjCCuekfgYhGCjZjtCYOjbKD1g0YbYjVDVPqetrY
         FwjthMKHr+QO4dcwXDsik41qge3OWmYMtnvjlCPQJmq6yiSdnfaSDUYY+z64BRtrCbyU
         bij3IZ7HHw2sAqPcAbaajCFm/bZVmODMiJd3KfUHE1hV0FK2eyK0DlNud81fwj/zlGBC
         cAlfh/XVR/VpHkT6mLMRby4Ifnv96Ezfk6TEzXn8QneQ7GW12B5Tys5MWS3OyKqHX0G0
         rl9g==
X-Forwarded-Encrypted: i=1; AJvYcCUSfn/RVHSPSivPL2GU8yrcQwqB3v/P5IKBNMI5mA/jlrBd9slR0+HAQzJWxaDCGpChlVoLANf1NclRhvr+TWB1C5jZSg==@lists.linux.dev, AJvYcCWh9m9AXwokP64YTA6Edf/x/0B7ojY4/owB9zC3e4g4uzAfptzNrlbAVk7ZvPc45bMU9+PSD/Fek6a/nJudSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxftBT4GER30683monY7sqibPROB5N8ain5W488yslu72h/L4r
	PGtrpsMbX1m2d4AgrxZm/C0YQYiiFnQOaEOLD8z2iMZm6d1+wi/R
X-Gm-Gg: ASbGncv18rxnFCxOB2UHI5k0zslnBlX6Jki9k35TFRboBGbRH3lFU2NCMJ5XgqD4+Na
	BxH7QgglatiIsVg9CU9hxw81hILjrkc3fsw8CsYDGoEczy+xBufYWNHGYW6+UBbwoW+h8qmSHY4
	nOY1qayyGfpAXqCP4ckDttk21KVOSAU3Uqe612LSGeOBbQ6KOwrdqLQHJ1N+UO0lOwDKOKDfT5V
	44GLuPmNfRmpkjz/tM0tBrWmZ/bad2HWgprOj4IkiL/ViaRhxnVwRPGHUdvd8IQ7SdlD4inVa/J
	2KwydTrrc78WSTNkXd6GeWYS62HEhRBuo3+yLErD30my1NJ2qIaYI/k=
X-Google-Smtp-Source: AGHT+IFVmEYILIl7Bx9bPOG6d33ZGT/0pPwV1G1+NPCc5IPhW9OYdHlwxHRMX0my6CmQO0+vJtJu2w==
X-Received: by 2002:a05:620a:4153:b0:7c5:a2de:71d3 with SMTP id af79cd13be357-7c927f92045mr827457885a.20.1745071003444;
        Sat, 19 Apr 2025 06:56:43 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac4749sm214350185a.59.2025.04.19.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 06:56:43 -0700 (PDT)
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
Subject: [PATCH 3/5] staging: iio: adc: ad7816: Introduce chip_info and use pointer matching
Date: Sat, 19 Apr 2025 09:56:36 -0400
Message-ID: <20250419135638.810070-4-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419135638.810070-1-gshahrouzi@gmail.com>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
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

