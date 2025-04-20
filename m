Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D178F44;
	Sun, 20 Apr 2025 01:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745113756; cv=none; b=J4s2F6HWrcg7jL6QcF8XUdD7C0INZ5FTgxVpffV8X+Ypdql4ZiXGqAroskBhnO1vavRjzIhzr6CjyBapOSb47nNAnvErP9F5zPyn9u9xLHVvQbLsOqFLXPzovLsDsXKgIdxKv/REWoK8FIysNwzMVcL8Z/UuyC7QxDYwh4Bn4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745113756; c=relaxed/simple;
	bh=ZtWyf+85ZAZuuUdke/D6KK+1edjKVBiOUFx39D2hd6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBJqBtBTjxYyxHWOOHf6a+HYT2HQPLSy8P967zo8BBHSyG2dp/hg+lBeMi+ju+KGhsuOxdMHdNNuQl+F8ciyA/CJw/ufpZPhpa/h4w4k+rHsPArB4g4mr8J4esIKMJBUSghoT9nLTIpTK/KZzuF0gykn4lc0zv9oI3nJiI/wlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X21eF0zK; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X21eF0zK"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8ffa00555so25896166d6.0;
        Sat, 19 Apr 2025 18:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745113753; x=1745718553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de216G9QJ9z5gWQFLLYUZKYI5uHds9pgvjd/vVy9J+I=;
        b=X21eF0zKKHFAMLywEq2+FH10mtbPcAe9L0dfTLQ8SCtbPqDFBiyTc2GApCbOW72z7v
         /9onuDGeOmzwZ/BjsDhbHKvc4S1Cv8odOufgKWsrpQJeemStL8YMLunqlqYAcpcEM1u2
         DoZ3dcApBmoHQs8MC3OxaGq0hivMvrPmtJ3TIOzIzpTu+RiXhiAV97rbOS3h+tNZSJrk
         1r201YhnJLBfrbm2jFdXYeDyAINWSwkvAkyqzH5T7cg8ukfn7w2iKP4Hiv7Zjoxo6c1H
         cpA6CR9RDLszRUDQ53irYZOLX0Wl35Ux4wOGkuBcIK4mFgtTPPWiaF/Qe17nHvEfX9YM
         D2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745113753; x=1745718553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de216G9QJ9z5gWQFLLYUZKYI5uHds9pgvjd/vVy9J+I=;
        b=cxXa4eCi9IzZGuYB+deG2mhHbwBfWQqansxE/o8yu5qWH8kyxS8L4cXjbPtDvuGcr6
         Mg1zzl7pHt/EAi3zIPYWIkwHUPGyLL4ebngBHlYCirGQrXIxHTihZ0GvkFA39X0NFUbU
         qajjW0xbcCYWVX9McgU0doI173MwJDxO90fLREX1ox7QryViaN276Zqb4/rAtQm3swGu
         +L6/XSnGAQliEKdvG4ewVWIvY15P0hfWaiiECr0VJcGH7WByrfwSBjs6kvL+8K6cJVI5
         /Uu3PSqbmvpUnGiNBvBNGIF1ARBWGDUzVqYWRaMVkNkE08/xhVHkn9gNoNVUtbFx4nmr
         sIXg==
X-Forwarded-Encrypted: i=1; AJvYcCW4lq4h0OxqaLvrSLCmqnbr6XeAJhn1YkMD3RLztIRxTRMhz+pp3ZxUA7qCUsI8e+aMt0Bn+ptV3C+QCf86AA==@lists.linux.dev, AJvYcCW7uAIfqwOgTIerMMfLOIORYzfMJdkJWwg5R8aPdu8rWn1h7FvSnB1WowBEEz6+rmCqL9Wxg9HVF1pRrYIVCRKm6WRoZA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3ypJvpJVUeFBKlqXiUXL78ONcc7k8Y/aEo1Y3tpa42WcXaMN5
	zHBvfB301x2GrYvgOWCAX4wSr7aBpIZOOF6C00h22Z30q5piBuzj
X-Gm-Gg: ASbGncsanuCrQ1gDyDAeS7C3deYA1EqlFlJaxGS306OOYUmWCqJOAKl3OaWiW9mWmAM
	tSCmU9JAMq0FgtsgLLBNEfVQW/oIUI8Q6AJcg87aGfl0DkhCEGTzQgTxieI3tiaIJ3zhLIjbmP/
	pr/4Mn1zo2zfeOhsmH+bHoukUue8QBtcWzI/dw4yAUK1cyHGgS1sZR4GlNjNYZ0o/s1YBbxDnxt
	eDnbDjDPvCNGQahLUPqzh647uaXNtf6kbJy8wgAKALlTHwRhRZswDPZJc1NKs+LLjCV3pEfVa/e
	Bu42DxpcLUYZsA8TnrD4oEjsy+aYwY0Q/1M8g+9m+noOxf3BfAnMTRPYwr013wEykJmcVY1cRNa
	7m0LaPyWOj7MTKxLutlA=
X-Google-Smtp-Source: AGHT+IH8VO4vXzl0rubJg0RyzomASRe17nj48diM7NE29nTOhklwT9EqFA+/1DRk9ANTDDCdzpLPwg==
X-Received: by 2002:ad4:5f8e:0:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6f2c4656a9amr154919086d6.34.1745113753379;
        Sat, 19 Apr 2025 18:49:13 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1283sm27583846d6.23.2025.04.19.18.49.12
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
Subject: [PATCH v5 2/5] staging: iio: adc: ad7816: Rename state structure
Date: Sat, 19 Apr 2025 21:49:07 -0400
Message-ID: <20250420014910.849934-3-gshahrouzi@gmail.com>
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

Rename the main driver state structure from 'ad7816_chip_info' to
'ad7816_state' to avoid confusion with the upcoming structure that will
hold static, per-device-type information.

This is purely a mechanical rename with no functional changes.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index a44b0c8c82b12..cad2e55aff3f9 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -38,10 +38,10 @@
 #define AD7816_TEMP_FLOAT_MASK		0x3
 
 /*
- * struct ad7816_chip_info - chip specific information
+ * struct ad7816_state - chip specific information
  */
 
-struct ad7816_chip_info {
+struct ad7816_state {
 	kernel_ulong_t id;
 	struct spi_device *spi_dev;
 	struct gpio_desc *rdwr_pin;
@@ -61,7 +61,7 @@ enum ad7816_type {
 /*
  * ad7816 data access by SPI
  */
-static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
+static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
@@ -102,7 +102,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	return ret;
 }
 
-static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
+static int ad7816_spi_write(struct ad7816_state *chip, u8 data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
@@ -121,7 +121,7 @@ static ssize_t ad7816_show_mode(struct device *dev,
 				char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 
 	if (chip->mode)
 		return sprintf(buf, "power-save\n");
@@ -134,7 +134,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 				 size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 
 	if (strcmp(buf, "full")) {
 		gpiod_set_value(chip->rdwr_pin, 1);
@@ -167,7 +167,7 @@ static ssize_t ad7816_show_channel(struct device *dev,
 				   char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 
 	return sprintf(buf, "%d\n", chip->channel_id);
 }
@@ -178,7 +178,7 @@ static ssize_t ad7816_store_channel(struct device *dev,
 				    size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 	unsigned long data;
 	int ret;
 
@@ -215,7 +215,7 @@ static ssize_t ad7816_show_value(struct device *dev,
 				 char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 	u16 data;
 	s8 value;
 	int ret;
@@ -271,7 +271,7 @@ static ssize_t ad7816_show_oti(struct device *dev,
 			       char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 	int value;
 
 	if (chip->channel_id > AD7816_CS_MAX) {
@@ -292,7 +292,7 @@ static inline ssize_t ad7816_set_oti(struct device *dev,
 				     size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 	long value;
 	u8 data;
 	int ret;
@@ -351,7 +351,7 @@ static const struct iio_info ad7816_info = {
 
 static int ad7816_probe(struct spi_device *spi_dev)
 {
-	struct ad7816_chip_info *chip;
+	struct ad7816_state *chip;
 	struct iio_dev *indio_dev;
 	int i, ret;
 
-- 
2.43.0

