Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E31513A41F;
	Sun, 20 Apr 2025 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745113757; cv=none; b=dXiN3I9KBrU6M33XdUIT2d2je7d2u4uHbzykYutpNyKaHoyxxWRbB2vKGd4X/d6ficGrl3WZSRJqtxDlzKzMo69ZmIm85k46VyL4hS25F6AD/RKb6CDJS11jx84IpNK1MP2iOA7OI0xwacti78H9Vdz77SE744APTALRkui60Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745113757; c=relaxed/simple;
	bh=FS5Q98qLID6FAQ/N12FPnFMlE/nozAWlI7CwtVF5bKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btmwMwh3n92dBw/whepZbnS0a8wI/yYuFCGKNCALHYKNknK/G2Kcm4YSHSp60oAw3a3fJk/piDD4v1M7b073MCJI1SFFVWfXgGN8FhGB74Vg25404eHBYzbTegzaYdL2d9hxxBm7iSK6q/tJFIabD5+X2ZCO72stOvs4jSQdZ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBvT5IgH; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBvT5IgH"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so32006696d6.1;
        Sat, 19 Apr 2025 18:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745113754; x=1745718554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd8epHvveGFvAa9vnuKQvCxPWBU3eQ5S8aYIg7aa9r4=;
        b=fBvT5IgHQE1eRDg1QmGOC83rn2olcOQR7ki9PKA5oevQtlVNnw1zFg3g+osBC3+2TH
         47w8ssW9STE7dxbk+NSR7+iePF3YJ77xLqbK0AV+VqwcsMZexieRzpvUAQyzLZbOp+dp
         XQg9ycPG0kS70YJWpPGoynCfBHWOcZ7Yggb6MyOW57jY8DmpiGYz9el8prjrBEaEZYrg
         C0VrbU1DLnRxfzNkKJLfEUsuJ1i9mrQORLD2xl1Ogmy3jLmAW1nefdmBMngXwFKJ9VAO
         f3kPNqFYqnhG/obdsYYAZsWNnKfS7HpSaqfFQYpi6w7i8rHesLmQnBvpHPHzJK0uDutH
         PhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745113754; x=1745718554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd8epHvveGFvAa9vnuKQvCxPWBU3eQ5S8aYIg7aa9r4=;
        b=vqDg3jQ/nk7Et7eNih58H3VCdE/xBE2xhBG1lZQLZG5AX+Uwf6FZybWE7lFAP7Br4p
         KxbEHg2IbNrLB5vPFz3P2/NLt1QdC+yiKOvo8g0HM97RoPYKY7nQ3wVB6hy33OSzl+Lm
         gNfxuSNLHMtW+Z7+lksv6q8seMCQeuoj1qXoNuw+wzIrK0ZFeupfcT08bANwRNJYzwZG
         xAUx66lOrLHB0ZTvmAzC17T6S+Z+8Wq+sUGN5JVs1CtxCuuWs27f6YwjWakXjiNM/rUw
         no68a2LvO5sDE/hJY8ehTYFCXZPuEGLpWau1Dab046AWZhMfCKSbCVFHYtS9r6SZgF4T
         n8ag==
X-Forwarded-Encrypted: i=1; AJvYcCWdKx1psZ6jNhdD+aFOUFU/+Ldd8zZpuT5rFEz+jUTH79EcYbgBk8aXE828LifL+f8kT1vJfQeZeKLnCCncanFu+YjQDw==@lists.linux.dev, AJvYcCXC3iwdgFCXabEEzCCFKzjsneaGM+3GTGb44tvAUhexxi/pHyZutFVb9JWazEfqJrAbwSHB3kzjqP6HfgoJbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuZvo6dnhSTUqajzMJ9dkA0wV2LeaqKBpsmSWZY8UeQtI7YE/T
	jwnDLjlH9n6FKOxs/M5jD5tQ6bDh15LSnhXZxvZpWcSQzwpDz6Md
X-Gm-Gg: ASbGnctGX1Z1N49Ew2LHKQ0vcUJt8edievdZb9BbBKSd/24oCiPZSMX5+Z72pub3ydD
	UATDE92iyDlvAmgqA6flneX8KYvgt3krVwysiO3J0fJ92txWK6+BCp7qXNpOEOK3tQbY3qlVyeY
	elfQy/9K9hjhGKzm1Vzlr+KQKH2MNFY2rgJ0KtUQCxpVBkqQdy5qDLwqViq1KItoc9CoPKdCYRh
	nzIPwiraIsYFJ5zWeDQUC1TVkLU2pkfIEmP2U+/jBHyZcH8ud49fJTPjoZt6ElYSJJVbH2wjd5H
	T9td8i0mkkRkDIJdQah+Mm2PgIlmFmohuo7bDlO7gG8etlmDqeAO8DiS9VU+654DeZZMQjZLMIX
	rdwyYq1BJdxiIhCOiPeIiwR6XAsGJxw==
X-Google-Smtp-Source: AGHT+IE8QhtT14V2rzTMTBv+XClz9Lo8X3jPZXkIOiI7VIkejQCyQnS53LwCvsx93xyvO0wCQY0mjg==
X-Received: by 2002:a05:6214:f06:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6f2c26c9d2emr136152386d6.8.1745113754262;
        Sat, 19 Apr 2025 18:49:14 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1283sm27583846d6.23.2025.04.19.18.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 18:49:13 -0700 (PDT)
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
Subject: [PATCH v5 3/5] staging: iio: adc: ad7816: Introduce chip_info and use pointer matching
Date: Sat, 19 Apr 2025 21:49:08 -0400
Message-ID: <20250420014910.849934-4-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420014910.849934-1-gshahrouzi@gmail.com>
References: <20250420014910.849934-1-gshahrouzi@gmail.com>
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

