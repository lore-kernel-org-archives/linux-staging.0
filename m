Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAB02248AE;
	Thu, 17 Apr 2025 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909278; cv=none; b=SuqLWm6o70O1fL/+XifmGIGK+QPe853nrs7wmzMpZTf2Lyq+iE9qPMwPBwuzegoHMLHX7a2MHsJ+bx/nt0w+xZx8/yKm/VVN9OhX8yP3hhh/OnIKpU9AeMqI9wVBK0DsG/i2mkzCzkJP77xknOZSnqrMaF01NKJ0X8BwypEjQn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909278; c=relaxed/simple;
	bh=9oEB2dkP3S7X/B2dnDJe2lnfHeb3jiQQLugvRc19tac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/GQ1h75UNkm6bcKbsxgyBfEq/QkdwRYvCm9vqPNRTG4k8gxSRctMoYuCqKyGx/1FOJWHbtgG/MttI+VTa8U5sEouk5ImglukKzH84++TIA+5q+OpnC3SaDultlSd6Kq0csSMHnvOlJWEtRRLSIZBkdU48BYivs+1N9gNFsxvzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG0+PLg0; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG0+PLg0"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so11086436d6.0;
        Thu, 17 Apr 2025 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744909274; x=1745514074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXWRs1cTjol07xpBkUHs8BYxQsZJt8nnKpT27OeCG9Q=;
        b=jG0+PLg0+rOs2axKZd5aefE/oop9b2gLMA6VpdzJjfENgtGIoszvu1xGlyny9j6e0/
         PhvZKR6RAeP24tMc0BbMNGOapk5+Afo67VUNC0dHxYgcvI5rtG11/lcGHJCY38zmqQf/
         GhiqIxiQt0cRjGG5ghzdAreZloZ93KCrBPigWIXH8exeUppPongsyX9HJfZAyzo4d2sg
         kDnvKyleCRNPHmCheKLRkHoIEWXZgyNhLT8KKLOIy7s++RaSqdNlPWCaEyBGi2Sx9RnC
         ghpc1A1eZ+T/LOHe9+Qn7z0TzqP1/7mjQ03XbLAG3PylM0NAb1REueRHQn8E03f8TKUB
         pYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744909274; x=1745514074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXWRs1cTjol07xpBkUHs8BYxQsZJt8nnKpT27OeCG9Q=;
        b=VdK4V3eQU6bsLyZrovsLehBhp1UZai3vEongdgO4De9PKesRVH26yAs9ibVq8aDy0c
         dWQ6jWPoKnsJxKwlMQW3nlGv5CrbWR/14ND/p0AxCyFB3bXNCaKYVSV3HAnQ2unnUTm8
         K9s7Q0ZV+X2wGfuFJc4TafA/O4pzpjKaDRquGVqh7gV6r9tznKKgdeOc27iVqdc8lymK
         oZNCEMGzIShxxvmgZoyTL+PI3QaXCMMZxVhhaGklDg8K3JwrBocFvkcvAq5zb4SCfUo0
         4xi+WNCCsdur779zzPF1I/kzi47d/59CkrR2io1eA5INnpO9Lk7/E0XJwrupZjMGwyRG
         QoVA==
X-Forwarded-Encrypted: i=1; AJvYcCU0o2lpqLWSww+QATVHrOT7BkGtzlfPfu42WwrtgLeWQGAipMhb9h60lMI3FGvW+9aRrtZD8QnOu6kcIi+xyRjHiqUItQ==@lists.linux.dev, AJvYcCWN2db/rQY+xPEVBVTgiYwzM07PIUpQf7yDSbCqKfySin65HLFIR6gKTxZzqChJH5diSuHc3Jg1trv8DG7ehA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZxa/W+pENd2KN0ray1ggdtHdCxPGedHyx+xVAUqpQ0XUJHu5t
	BV/l4P314SYTFNs0RoQHsN1kXGUZVNjG224C9UBQz4c+Jd+X8FJU
X-Gm-Gg: ASbGncvvQuRckWJG3t6UOX19VMT4EY08S/sS/ShBuArEnJySeY9hv9yv5WmtWSf4Iaa
	/UK7F67AaI+e9yf/t/IU8paexq4ghorco7Vc/KwshzUSE9OYnQic1BSpSNu8oyMWx/uw8gL8111
	bapkmqOi5j6Lv0ZYsfpAwcNbcLcijoMqPLoJhuQYt9NOguJ0BNf4AJ56JWakfpKFbGj4WrvIs2h
	vZSO0uK5gI5stKhWEzd70P9cVnbs3oK0MNrFUt/OQfyp2+tG9te4+CXThYM199x5bN0bZCuqUi9
	XoeQLfv0D0DApo7BFHVDzE9+jejxGu4elARg5diTB0dAkIwYfWgWm1c=
X-Google-Smtp-Source: AGHT+IHYzgvyals3Cpf2qth3nNDQ//h870rA/XXk4zzkO6uy9etL5tq59U7gkjqSLQAvzlKJg1Ozaw==
X-Received: by 2002:a0c:ed52:0:b0:6f2:bcbf:101d with SMTP id 6a1803df08f44-6f2bcbf11f5mr39617326d6.38.1744909273730;
        Thu, 17 Apr 2025 10:01:13 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcc26sm1082906d6.92.2025.04.17.10.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 10:01:13 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2] iio: adc: Include valid channel for channel selection
Date: Thu, 17 Apr 2025 13:01:09 -0400
Message-ID: <20250417170109.602659-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the datasheet on page 9 under the channel selection table,
all devices (AD7816/7/8) are able to use the channel marked as 7. This
channel is used for diagnostic purposes by routing the internal 1.23V
bandgap source through the MUX to the input of the ADC.

Replace checking for string equality with checking for the same chip ID
to reduce time complexity.

Group invalid channels for all devices together because they are
processed the same way.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes since v2:
	- Refactor by adding chip_info struct which simplifies
	  condtional logic.
---
 drivers/staging/iio/adc/ad7816.c | 68 ++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..ec955cbf06c17 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -41,8 +41,20 @@
  * struct ad7816_chip_info - chip specific information
  */
 
+enum ad7816_type {
+	ID_AD7816,
+	ID_AD7817,
+	ID_AD7818,
+};
+
 struct ad7816_chip_info {
-	kernel_ulong_t id;
+	const char *name;
+	enum ad7816_type type;
+	u8 max_channels;
+};
+
+struct ad7816_state {
+	const struct ad7816_chip_info *chip_info;
 	struct spi_device *spi_dev;
 	struct gpio_desc *rdwr_pin;
 	struct gpio_desc *convert_pin;
@@ -52,16 +64,11 @@ struct ad7816_chip_info {
 	u8  mode;
 };
 
-enum ad7816_type {
-	ID_AD7816,
-	ID_AD7817,
-	ID_AD7818,
-};
 
 /*
  * ad7816 data access by SPI
  */
-static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
+static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
@@ -84,7 +91,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 		gpiod_set_value(chip->convert_pin, 1);
 	}
 
-	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
+	if (chip->chip_info->type == ID_AD7816 || chip->chip_info->type == ID_AD7817) {
 		while (gpiod_get_value(chip->busy_pin))
 			cpu_relax();
 	}
@@ -102,7 +109,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	return ret;
 }
 
-static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
+static int ad7816_spi_write(struct ad7816_state *chip, u8 data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
@@ -121,7 +128,7 @@ static ssize_t ad7816_show_mode(struct device *dev,
 				char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 
 	if (chip->mode)
 		return sprintf(buf, "power-save\n");
@@ -134,7 +141,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 				 size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 
 	if (strcmp(buf, "full")) {
 		gpiod_set_value(chip->rdwr_pin, 1);
@@ -167,7 +174,7 @@ static ssize_t ad7816_show_channel(struct device *dev,
 				   char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 
 	return sprintf(buf, "%d\n", chip->channel_id);
 }
@@ -178,7 +185,7 @@ static ssize_t ad7816_store_channel(struct device *dev,
 				    size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
-	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	struct ad7816_state *chip = iio_priv(indio_dev);
 	unsigned long data;
 	int ret;
 
@@ -186,17 +193,10 @@ static ssize_t ad7816_store_channel(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (data > AD7816_CS_MAX && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
-			data, indio_dev->name);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1) {
+	if (data > chip->chip_info->max_channels && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7818.\n", data);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7816.\n", data);
+			"Invalid channel id %lu for %s (max regular: %u).\n", data,
+			chip->chip_info->name, chip->chip_info->max_channels);
 		return -EINVAL;
 	}
 
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
@@ -345,14 +345,22 @@ static const struct iio_info ad7816_info = {
 	.event_attrs = &ad7816_event_attribute_group,
 };
 
+static const struct ad7816_chip_info ad7816_chip_infos[] = {
+	[ID_AD7816] = { .name = "ad7816", .max_channels = 0, .type = ID_AD7816 },
+	[ID_AD7817] = { .name = "ad7817", .max_channels = 3, .type = ID_AD7817 },
+	[ID_AD7818] = { .name = "ad7818", .max_channels = 1, .type = ID_AD7818 },
+};
+
 /*
  * device probe and remove
  */
 
 static int ad7816_probe(struct spi_device *spi_dev)
 {
-	struct ad7816_chip_info *chip;
+	struct ad7816_state *chip;
 	struct iio_dev *indio_dev;
+	const struct spi_device_id *id = spi_get_device_id(spi_dev);
+	enum ad7816_type chip_type = (enum ad7816_type)id->driver_data;
 	int i, ret;
 
 	indio_dev = devm_iio_device_alloc(&spi_dev->dev, sizeof(*chip));
@@ -361,12 +369,12 @@ static int ad7816_probe(struct spi_device *spi_dev)
 	chip = iio_priv(indio_dev);
 	/* this is only used for device removal purposes */
 	dev_set_drvdata(&spi_dev->dev, indio_dev);
+	chip->chip_info = &ad7816_chip_infos[chip_type];
 
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
 
-	chip->id = spi_get_device_id(spi_dev)->driver_data;
 	chip->rdwr_pin = devm_gpiod_get(&spi_dev->dev, "rdwr", GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->rdwr_pin)) {
 		ret = PTR_ERR(chip->rdwr_pin);
@@ -382,7 +390,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 			ret);
 		return ret;
 	}
-	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
+	if (chip->chip_info->type == ID_AD7816 || chip->chip_info->type == ID_AD7817) {
 		chip->busy_pin = devm_gpiod_get(&spi_dev->dev, "busy",
 						GPIOD_IN);
 		if (IS_ERR(chip->busy_pin)) {
@@ -393,7 +401,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		}
 	}
 
-	indio_dev->name = spi_get_device_id(spi_dev)->name;
+	indio_dev->name = chip->chip_info->name;
 	indio_dev->info = &ad7816_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
-- 
2.43.0

