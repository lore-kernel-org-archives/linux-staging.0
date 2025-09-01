Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A65B16F265
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744223; cv=none; b=Gr/LKsmoFJHDY1Upz9lGrf+CkkCu6wIEnMm0be6L7SY2WeWh7OXF8ezKZewf8FMzJXM9S73UUxh58Xkf3Da3eA0WSUGQEP59UNrHkdfNwT3YxHseefrytCLVOlzed5NtzrRyulGlKHWIqgj3knM7HTT+8KYUI2Hi+DaU5YzATE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744223; c=relaxed/simple;
	bh=5MbhYRR7ia2Bp43TUPq4uWWsrrgfE9gSOjX0JBp/ffc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qf1ys4w5pvSNXGBzv/EAMoLCg6BcYp6CY7ySOelnce9imyol4HbjbhxELfyGcgZAhe2HPSIsjx5V86chfteOsdYOy8PJiDoWmvVqg1gN0u2ff3UT5PixowE7fes6wlfNhoiOrUs56PzhIfEFS+AqG8yHq6MgW/lqwtiZmBniDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egs1hSba; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egs1hSba"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7723bf02181so1473544b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744219; x=1757349019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQbwh9gW/KCMF3I3nRMdjid1pOiXqMevll3f8gBU79M=;
        b=egs1hSbaEyGs5DZMPIp2pHaQptQltRln4Mp5QFNDLhIzNDZ1uar4nfuZofFwi6io54
         OaRm/wnZgOleohP/9Aa78gMjmFu0IEJ8Q2t0nbgmTvNSlYKFB9TOx3IJgyvxfgx3Rq98
         3xH0FHHL26ziIFKkrZIC2hRJF9+BLLdow2+PqNRPay3AVpnxXl/DFWhrOvJ3mga1sX3F
         j2nAtWia2nqjjtNwOl5YvnNErIknqgR76qJqi04U5PKMI5+K0Ppg9vbDTdDXsfPEkcuH
         6ZX+YyCoOHk72xSM5I4P0LWsG0jxgkvCqItJio5xlU55+64DMVOiydWPcXUEvlsyUMQO
         sgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744219; x=1757349019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQbwh9gW/KCMF3I3nRMdjid1pOiXqMevll3f8gBU79M=;
        b=s/oJmIEpyh6fEpbhIFb7Fm0B+VHZionZfzchzeyeM/Oh8PI9LqrJekVIgxax42R4fk
         hz5ranjN0dO6Kk3TJl+P00Y8L6QQ64Moq3jFserBp13mc6EEK6MMQ9UI3bDU2894wGwI
         dGis6qM8eeVoSIssmTTfT58/I55PsVCIMo0YQH4iDsmkmIj4VHDypIUX3lGsRfPG1G2p
         TNZ0OdFtVjwCZIN0GGxJ2Viy4dA3ekQXj27KOCowICdCdxGWWK//dQexPCpaRb7cJMYS
         f7lMt92toompnqYDXyB9qbqpYg6c/z9TktejMhca3L2dyk7J36+yhvTdNyMNmMQaitU4
         3v/A==
X-Forwarded-Encrypted: i=1; AJvYcCV+Funw9ixeIFNHrVbGm/X3pl+JfDkxTaGGtnbWoMzg7wNCu/ymi6JMbNeolopFPl7OwkqsQVzaVMpsmjoF@lists.linux.dev
X-Gm-Message-State: AOJu0YyiDbwjikSAzeND1dwO0Whia8cvNbi5QvcTIpLJ+d8sh1Ta8KQ7
	qwdeTLHgWncYY1oZcubZl4QhJ/FB3kHiSEcyq3gxu0ofF4q+20rPo3bu
X-Gm-Gg: ASbGncu/zwgfF/5x4LvaDrnOwVjpKgZomSvq40uOWbLrxCkalzRdognjyydc9Pv34aU
	Cie5sTq9Oj9iqrT6gtIHWWtAKCR+BmCNvEG8+WDv1DvGXUb/spBYk3ck4VQId8E4/iQqBEk0sU0
	I4cfaPLJFkK2gwdt1UABIdLHXzyud0KDF0cU+aPabwOfqxgltEM1rIME4Bs+Z60UypBHUtq/veN
	86OQRp2Zx8uwNy/7cq2l92LR/5RMN/WwdUZrqgUPSKSyMJ0wM8P6J62UHmEesBqPPSRktI1zbdD
	PIy453bHFAenbzG60CiYIF78XJ3O6N+O9rIHPoQMgHN+EVkYY7nj7GJQRM0fWjtbrsi2JSr8tsD
	bkly8LROIeeen6RNYluC3WOyzM+vX3TRPdgV68AM2TSx97E0k730=
X-Google-Smtp-Source: AGHT+IF9shMssr20uteXd5yIgsFVl8e6wjoDha0bCciLIbcU7tpP3dq9+ctu/AhveciwjTC5ez1/Mw==
X-Received: by 2002:a05:6a20:72a4:b0:243:d121:67c9 with SMTP id adf61e73a8af0-243d6f37d74mr13520229637.46.1756744218741;
        Mon, 01 Sep 2025 09:30:18 -0700 (PDT)
Received: from localhost ([77.111.118.146])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77241f08b45sm7234480b3a.22.2025.09.01.09.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:30:18 -0700 (PDT)
From: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	sonic.zhang@analog.com,
	vapier@gentoo.org,
	dan.carpenter@linaro.org,
	Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
Subject: [PATCH v4] staging: iio: adc: ad7816: fix race condition in SPI operations
Date: Mon,  1 Sep 2025 19:33:10 +0330
Message-ID: <20250901160310.399-1-moahmmad.hosseinii@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816 driver lacks proper synchronization around SPI operations
and device state access. Concurrent access from multiple threads can
lead to data corruption and inconsistent device state.

The driver performs sequences of GPIO pin manipulations followed by
SPI transactions without any locking. Device state variables (mode,
channel_id, oti_data) are also accessed without synchronization.

This bug was found through manual code review using static analysis
techniques. The review focused on identifying unsynchronized access
patterns to shared resources. Key indicators were:
- GPIO pin state changes followed by SPI operations without atomicity
- Shared state variables accessed from multiple sysfs entry points
- No mutex or spinlock protection around sections
- Potential for interleaved execution in multi-threaded environments

The review methodology involved tracing data flow paths and identifying
points where concurrent access could corrupt device state or SPI
communication sequences.

Add io_lock mutex to protect:
- SPI transactions and GPIO sequences in read/write functions
- Device state variables in sysfs show/store functions
- Concurrent access to chip configuration

This prevents race conditions when multiple processes access the device
simultaneously through sysfs attributes or device file operations.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")

Signed-off-by: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>

---
Changes in v4:
- Added locking to reader functions (show_mode, show_channel, show_oti)
- Fixed incomplete reader/writer synchronization that could still race
- Ensured all device state access is properly synchronized
- Replace sprintf() with sysfs_emit() in all sysfs show functions
- Use sysfs_streq() instead of strcmp() for proper input parsing
- Implement locked/unlocked SPI function variants to prevent deadlock
- Use channel snapshot to ensure atomic read operations
- Fix sizeof() usage in spi_read to be more explicit (sizeof(buf))
- Make oti write operations atomic (SPI write + shadow update under lock)
- Fix race condition in ad7816_set_oti() by taking channel_id snapshot under lock
- Fix return type consistency (ssize_t vs int) in show functions
- Use chip->id instead of string comparison for channel validation
- Add explicit cast for narrowing assignment
- Add default case for unknown chip ID validation
- Use cansleep GPIO variants in sleepable context
- Improve lock documentation for protected resources
---
 drivers/staging/iio/adc/ad7816.c | 210 ++++++++++++++++++++-----------
 1 file changed, 138 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 4774df778de9..49a67e1b76f6 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -50,6 +50,15 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+  /*
+   * Protects:
+   *  - SPI transactions
+   *  - GPIO toggling
+   *  - channel_id
+   *  - mode
+   *  - oti_data
+   */
+	struct mutex io_lock;
 };
 
 enum ad7816_type {
@@ -59,60 +68,71 @@ enum ad7816_type {
 };
 
 /*
- * ad7816 data access by SPI
+ * ad7816 data access by SPI - locked versions assume io_lock is held
  */
-static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
+static int ad7816_spi_read_locked(struct ad7816_chip_info *chip, u8 channel, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
 	__be16 buf;
 
-	gpiod_set_value(chip->rdwr_pin, 1);
-	gpiod_set_value(chip->rdwr_pin, 0);
-	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
-	if (ret < 0) {
-		dev_err(&spi_dev->dev, "SPI channel setting error\n");
+	gpiod_set_value_cansleep(chip->rdwr_pin, 1);
+	gpiod_set_value_cansleep(chip->rdwr_pin, 0);
+	/* AD7816_CS_MASK: broadcast/all-channels per hw programming model */
+	ret = spi_write(spi_dev, &channel, sizeof(channel));
+	if (ret < 0)
 		return ret;
-	}
-	gpiod_set_value(chip->rdwr_pin, 1);
+	gpiod_set_value_cansleep(chip->rdwr_pin, 1);
 
 	if (chip->mode == AD7816_PD) { /* operating mode 2 */
-		gpiod_set_value(chip->convert_pin, 1);
-		gpiod_set_value(chip->convert_pin, 0);
+		gpiod_set_value_cansleep(chip->convert_pin, 1);
+		gpiod_set_value_cansleep(chip->convert_pin, 0);
 	} else { /* operating mode 1 */
-		gpiod_set_value(chip->convert_pin, 0);
-		gpiod_set_value(chip->convert_pin, 1);
+		gpiod_set_value_cansleep(chip->convert_pin, 0);
+		gpiod_set_value_cansleep(chip->convert_pin, 1);
 	}
 
 	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
-		while (gpiod_get_value(chip->busy_pin))
+		while (gpiod_get_value_cansleep(chip->busy_pin))
 			cpu_relax();
 	}
 
-	gpiod_set_value(chip->rdwr_pin, 0);
-	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
-	if (ret < 0) {
-		dev_err(&spi_dev->dev, "SPI data read error\n");
+	gpiod_set_value_cansleep(chip->rdwr_pin, 0);
+	gpiod_set_value_cansleep(chip->rdwr_pin, 1);
+	ret = spi_read(spi_dev, &buf, sizeof(buf));
+	if (ret < 0)
 		return ret;
-	}
 
 	*data = be16_to_cpu(buf);
+	return 0;
+}
 
+static int __maybe_unused ad7816_spi_read(struct ad7816_chip_info *chip, u8 channel, u16 *data)
+{
+	int ret;
+
+	mutex_lock(&chip->io_lock);
+	ret = ad7816_spi_read_locked(chip, channel, data);
+	mutex_unlock(&chip->io_lock);
 	return ret;
 }
 
-static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
+static int ad7816_spi_write_locked(struct ad7816_chip_info *chip, u8 data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
-	int ret;
 
-	gpiod_set_value(chip->rdwr_pin, 1);
-	gpiod_set_value(chip->rdwr_pin, 0);
-	ret = spi_write(spi_dev, &data, sizeof(data));
-	if (ret < 0)
-		dev_err(&spi_dev->dev, "SPI oti data write error\n");
+	gpiod_set_value_cansleep(chip->rdwr_pin, 1);
+	gpiod_set_value_cansleep(chip->rdwr_pin, 0);
+	return spi_write(spi_dev, &data, sizeof(data));
+}
+
+static int __maybe_unused ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
+{
+	int ret;
 
+	mutex_lock(&chip->io_lock);
+	ret = ad7816_spi_write_locked(chip, data);
+	mutex_unlock(&chip->io_lock);
 	return ret;
 }
 
@@ -122,10 +142,13 @@ static ssize_t ad7816_show_mode(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	ssize_t ret;
+
+	mutex_lock(&chip->io_lock);
+	ret = sysfs_emit(buf, "%s\n", chip->mode ? "power-save" : "full");
+	mutex_unlock(&chip->io_lock);
 
-	if (chip->mode)
-		return sprintf(buf, "power-save\n");
-	return sprintf(buf, "full\n");
+	return ret;
 }
 
 static ssize_t ad7816_store_mode(struct device *dev,
@@ -136,13 +159,18 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	if (strcmp(buf, "full") == 0) {
-		gpiod_set_value(chip->rdwr_pin, 1);
+	mutex_lock(&chip->io_lock);
+	if (sysfs_streq(buf, "full")) {
+		gpiod_set_value_cansleep(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
-	} else {
-		gpiod_set_value(chip->rdwr_pin, 0);
+	} else if (sysfs_streq(buf, "power-save")) {
+		gpiod_set_value_cansleep(chip->rdwr_pin, 0);
 		chip->mode = AD7816_PD;
+	} else {
+		mutex_unlock(&chip->io_lock);
+		return -EINVAL;
 	}
+	mutex_unlock(&chip->io_lock);
 
 	return len;
 }
@@ -156,7 +184,7 @@ static ssize_t ad7816_show_available_modes(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
 {
-	return sprintf(buf, "full\npower-save\n");
+	return sysfs_emit(buf, "full\npower-save\n");
 }
 
 static IIO_DEVICE_ATTR(available_modes, 0444, ad7816_show_available_modes,
@@ -168,8 +196,13 @@ static ssize_t ad7816_show_channel(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
+	ssize_t ret;
 
-	return sprintf(buf, "%d\n", chip->channel_id);
+	mutex_lock(&chip->io_lock);
+	ret = sysfs_emit(buf, "%u\n", chip->channel_id);
+	mutex_unlock(&chip->io_lock);
+
+	return ret;
 }
 
 static ssize_t ad7816_store_channel(struct device *dev,
@@ -190,17 +223,34 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
 			data, indio_dev->name);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7818.\n", data);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7816.\n", data);
+	}
+
+	switch (chip->id) {
+	case ID_AD7816:
+		if (data > 0) {
+			dev_err(&chip->spi_dev->dev,
+				"Invalid channel id %lu for ad7816.\n", data);
+			return -EINVAL;
+		}
+		break;
+	case ID_AD7818:
+		if (data > 1) {
+			dev_err(&chip->spi_dev->dev,
+				"Invalid channel id %lu for ad7818.\n", data);
+			return -EINVAL;
+		}
+		break;
+	case ID_AD7817:
+		/* AD7817 allows all channels up to AD7816_CS_MAX */
+		break;
+	default:
+		dev_err(&chip->spi_dev->dev, "Unknown chip id %lu\n", chip->id);
 		return -EINVAL;
 	}
 
-	chip->channel_id = data;
+	mutex_lock(&chip->io_lock);
+	chip->channel_id = (u8)data;
+	mutex_unlock(&chip->io_lock);
 
 	return len;
 }
@@ -219,21 +269,25 @@ static ssize_t ad7816_show_value(struct device *dev,
 	u16 data;
 	s8 value;
 	int ret;
+	u8 ch;
 
-	ret = ad7816_spi_read(chip, &data);
+	mutex_lock(&chip->io_lock);
+	ch = chip->channel_id;                                   /* snapshot */
+	ret = ad7816_spi_read_locked(chip, ch, &data);           /* same lock */
+	mutex_unlock(&chip->io_lock);
 	if (ret)
-		return -EIO;
+		return ret;
 
 	data >>= AD7816_VALUE_OFFSET;
 
-	if (chip->channel_id == 0) {
+	if (ch == 0) {
 		value = (s8)((data >> AD7816_TEMP_FLOAT_OFFSET) - 103);
 		data &= AD7816_TEMP_FLOAT_MASK;
 		if (value < 0)
 			data = BIT(AD7816_TEMP_FLOAT_OFFSET) - data;
-		return sprintf(buf, "%d.%.2d\n", value, data * 25);
+		return sysfs_emit(buf, "%d.%.2d\n", value, data * 25);
 	}
-	return sprintf(buf, "%u\n", data);
+	return sysfs_emit(buf, "%u\n", data);
 }
 
 static IIO_DEVICE_ATTR(value, 0444, ad7816_show_value, NULL, 0);
@@ -273,58 +327,69 @@ static ssize_t ad7816_show_oti(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 	int value;
+	ssize_t ret;
 
+	mutex_lock(&chip->io_lock);
 	if (chip->channel_id > AD7816_CS_MAX) {
-		dev_err(dev, "Invalid oti channel id %d.\n", chip->channel_id);
+		dev_err(dev, "Invalid oti channel id %u.\n", chip->channel_id);
+		mutex_unlock(&chip->io_lock);
 		return -EINVAL;
 	} else if (chip->channel_id == 0) {
 		value = AD7816_BOUND_VALUE_MIN +
-			(chip->oti_data[chip->channel_id] -
-			AD7816_BOUND_VALUE_BASE);
-		return sprintf(buf, "%d\n", value);
+			(chip->oti_data[chip->channel_id] - AD7816_BOUND_VALUE_BASE);
+		ret = sysfs_emit(buf, "%d\n", value);
+	} else {
+		ret = sysfs_emit(buf, "%u\n", chip->oti_data[chip->channel_id]);
 	}
-	return sprintf(buf, "%u\n", chip->oti_data[chip->channel_id]);
+	mutex_unlock(&chip->io_lock);
+
+	return ret;
 }
 
-static inline ssize_t ad7816_set_oti(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf,
-				     size_t len)
+static ssize_t ad7816_set_oti(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf,
+			      size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 	long value;
-	u8 data;
+	u8 data, ch;
 	int ret;
 
 	ret = kstrtol(buf, 10, &value);
 	if (ret)
 		return ret;
 
-	if (chip->channel_id > AD7816_CS_MAX) {
-		dev_err(dev, "Invalid oti channel id %d.\n", chip->channel_id);
+	mutex_lock(&chip->io_lock);
+	ch = chip->channel_id;
+
+	if (ch > AD7816_CS_MAX) {
+		dev_err(dev, "Invalid oti channel id %u.\n", ch);
+		mutex_unlock(&chip->io_lock);
 		return -EINVAL;
-	} else if (chip->channel_id == 0) {
+	} else if (ch == 0) {
 		if (value < AD7816_BOUND_VALUE_MIN ||
-		    value > AD7816_BOUND_VALUE_MAX)
+		    value > AD7816_BOUND_VALUE_MAX) {
+			mutex_unlock(&chip->io_lock);
 			return -EINVAL;
-
+		}
 		data = (u8)(value - AD7816_BOUND_VALUE_MIN +
 			AD7816_BOUND_VALUE_BASE);
 	} else {
-		if (value < AD7816_BOUND_VALUE_BASE || value > 255)
+		if (value < AD7816_BOUND_VALUE_BASE || value > 255) {
+			mutex_unlock(&chip->io_lock);
 			return -EINVAL;
-
+		}
 		data = (u8)value;
 	}
 
-	ret = ad7816_spi_write(chip, data);
-	if (ret)
-		return -EIO;
+	ret = ad7816_spi_write_locked(chip, data);
+	if (!ret)
+		chip->oti_data[ch] = data;
 
-	chip->oti_data[chip->channel_id] = data;
-
-	return len;
+	mutex_unlock(&chip->io_lock);
+	return ret ? ret : len;
 }
 
 static IIO_DEVICE_ATTR(oti, 0644,
@@ -363,6 +428,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 	dev_set_drvdata(&spi_dev->dev, indio_dev);
 
 	chip->spi_dev = spi_dev;
+	mutex_init(&chip->io_lock);
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
 
-- 
2.43.0

