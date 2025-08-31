Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6607F2080C0
	for <linux-staging@lists.linux.dev>; Sun, 31 Aug 2025 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756654675; cv=none; b=KQ5IfjO0VXEBATVmP2vhrcKV6vDbI/HY1h14JaDGujgQhtCn8Sf1t+UjcbzUVISZwz6lNXi7YfDm+RuFvmJ6v1YV9zBWXWmpX+9tfSvt8VU+ZgUeDXWiF1TkCbkDZEZhMg2lezCzHupmZKmq9Nc+fljmfQ5JvYQXftgbbZLCGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756654675; c=relaxed/simple;
	bh=GWYrJHPDh7pVNYHyuvB0gKyzXu4ERH+DBshpNI7vJmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdBltnPu0eydJK/IYT+oZ7vaMh0P6nql8Y0LWEdzKUSLXSuwjE+/PK3AsQ+xd4Rzt6IsdEzIVkxWZDA2c7OIcfFW+mHONl8HHgKnMNLRSXpzpQacBFqaDRyJxML5tdxjhtLrZa3mNWKDCVp7fYK2Io29JwWZTM4lWU65tA3QdIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtR3RFy7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtR3RFy7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2445806df50so27838065ad.1
        for <linux-staging@lists.linux.dev>; Sun, 31 Aug 2025 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756654674; x=1757259474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFDEYQJ8obf6Fs8A+TsKrId3W5WmbK7rR7VQyl/qxPk=;
        b=OtR3RFy7LUNOXbkV5GliAEJNSlr4dYqkPoz+UKgBF4Amxm2UAio08D0oU09qubgurC
         01aYV2GZlSZ8IKq61u0lRpWNOw/FFgSIs096KsvGI2g2Y0Go9AmBAeUmSE+JB/MxF+1i
         WhwEz5X3GmwzQbKern95771rscK2dHCq3HO/+apdYJNSsLL7vnbA2qBi8ac4cMwbQpZP
         njIIPFztHMfhZ/JTQmf121jBPMBl7kYDKxPPUNCDP5yV0uqBcMNJNOYIpRi/hCcN2YPy
         OEF2uTuE89moN+0k2MRMPA1N14tFxRe8GjqIClYSrkwCa3ZocgPITRb4wjUp6LdVx8cP
         0syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756654674; x=1757259474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFDEYQJ8obf6Fs8A+TsKrId3W5WmbK7rR7VQyl/qxPk=;
        b=ksHLfjIya5RvuxSZ7NPfEocvK78oIAbIeAvQF/Ufg/NurCVicSN69vlH5hRepW+l98
         ExLqgogm0PfKsBqCA5Lzfr4W584SFm6j6ZA2UIpNszo8VwHcvQQdhKMHokRkeIX1FzvJ
         bVvqpAIFf4r9ZOyX91y4HbFuwkyUWe3pFa2K0bJCO2sf3+ZqyHoI7WNl7HccfqsMuba1
         HPstg90x8qR0bgJmGbTCZ/gxL4G08O7Rb3YpQmbhHVMxtEwSd0zEiyxDPp3EExjsW4eq
         VKuxOgZihoUSIwa8XAEX91sa2tYvAzSo3GBnf0qAQq0MHKdsLU+WFN8qLvD9z9XQh6iF
         Y2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWhz+PaQ0o5BsOkdkJntQuzu8hClumZwuedtJ6BSmrihXM2BHWyaYIccYCrqJQDvbg0/GnEF3xLTEsDmWMA@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo2Dcir9CLYOXYSAP3uIbey6FEs1ieFThROTr7TfPY9zHrHrAQ
	zRRvfhu6D2Vb5ZX6sTu6SdQqS796uXXP486K0lgEWcRrfZiyDzUXa6JO
X-Gm-Gg: ASbGncvd7R2Vgx4dHwpt8ZfmPCxer3CZegS87LbcKYXMqY/IJCRhu8YRoCxXUVFTQZS
	Y1OV9qFAuuG+AKK72xU+UIgKp9pQGWvRF8mKXSVgUfkMKM+VrrqIb+IYrjNTg7vAawS1LmRNum8
	E8HJRw6Wf7CouuKzh0kjuXexr8M5H3sxdv7/zkqLG/d8FkzF1nCM0rLpxyBqkpJukzA3Zc1s5sj
	x0AJVuST2DrrZTRPb7NjG9d0KNpF6ZG+kI8Pgq0jaSL8N2M3x5G+gz5/4SdfJuo0dEiW8GNPQn4
	zfvSkIC5KvJDQb/VmJ0ZXnWKpycNXnEvYcHpSiqHGPwA9g8q/usqCHcGk+UxZY28WZXWmCNmRYO
	kIj1/MSL5UF8h7SaUJBBD0T30Gn+y/Wk8k29zuQ1K
X-Google-Smtp-Source: AGHT+IGpbBF5o4IXojUbE0bOixBdQ9gLAAiA5oWG1d3jT5tqYR85dQTBK6f/cjTSAmGcDu4G8TE8LA==
X-Received: by 2002:a17:903:38c7:b0:249:2d84:f416 with SMTP id d9443c01a7336-24944b766eamr65600685ad.58.1756654673646;
        Sun, 31 Aug 2025 08:37:53 -0700 (PDT)
Received: from localhost ([77.111.118.146])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24a92f897d8sm38927595ad.24.2025.08.31.08.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 08:37:53 -0700 (PDT)
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
	mohammad amin hosseini <moahmmad.hosseinii@gmail.com>
Subject: [PATCH] staging: iio: adc: ad7816: add mutex to serialize SPI/GPIO operations
Date: Sun, 31 Aug 2025 19:07:41 +0330
Message-ID: <20250831153741.8820-1-moahmmad.hosseinii@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: mohammad amin hosseini <moahmmad.hosseinii@gmail.com>

The ad7816 driver was accessing SPI and GPIO lines without
synchronization, which could lead to race conditions when accessed
concurrently from multiple contexts. This might result in corrupted
readings or inconsistent GPIO states.

Introduce an io_lock mutex in the driver structure to serialize:
- SPI transactions in ad7816_spi_read() and ad7816_spi_write()
- GPIO pin toggling sequences
- Updates to device state via sysfs store functions (mode, channel, oti)

The mutex ensures proper mutual exclusion and prevents race
conditions under concurrent access.

Signed-off-by: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 4774df778de9..06567d048a6d 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -50,6 +50,7 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+	struct mutex io_lock;	/* Protects SPI transactions and GPIO toggling */
 };
 
 enum ad7816_type {
@@ -67,13 +68,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	int ret;
 	__be16 buf;
 
+	mutex_lock(&chip->io_lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
-	if (ret < 0) {
-		dev_err(&spi_dev->dev, "SPI channel setting error\n");
-		return ret;
-	}
+	if (ret < 0)
+		goto unlock;
 	gpiod_set_value(chip->rdwr_pin, 1);
 
 	if (chip->mode == AD7816_PD) { /* operating mode 2 */
@@ -92,13 +93,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
 	ret = spi_read(spi_dev, &buf, sizeof(*data));
-	if (ret < 0) {
-		dev_err(&spi_dev->dev, "SPI data read error\n");
-		return ret;
-	}
+	if (ret < 0)
+		goto unlock;
 
 	*data = be16_to_cpu(buf);
 
+unlock:
+	mutex_unlock(&chip->io_lock);
 	return ret;
 }
 
@@ -107,12 +108,13 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
 
+	mutex_lock(&chip->io_lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &data, sizeof(data));
-	if (ret < 0)
-		dev_err(&spi_dev->dev, "SPI oti data write error\n");
 
+	mutex_unlock(&chip->io_lock);
 	return ret;
 }
 
@@ -136,6 +138,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
+	mutex_lock(&chip->io_lock);
 	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
@@ -143,6 +146,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 		gpiod_set_value(chip->rdwr_pin, 0);
 		chip->mode = AD7816_PD;
 	}
+	mutex_unlock(&chip->io_lock);
 
 	return len;
 }
@@ -200,7 +204,9 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		return -EINVAL;
 	}
 
+	mutex_lock(&chip->io_lock);
 	chip->channel_id = data;
+	mutex_unlock(&chip->io_lock);
 
 	return len;
 }
@@ -322,7 +328,9 @@ static inline ssize_t ad7816_set_oti(struct device *dev,
 	if (ret)
 		return -EIO;
 
+	mutex_lock(&chip->io_lock);
 	chip->oti_data[chip->channel_id] = data;
+	mutex_unlock(&chip->io_lock);
 
 	return len;
 }
@@ -363,6 +371,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 	dev_set_drvdata(&spi_dev->dev, indio_dev);
 
 	chip->spi_dev = spi_dev;
+	mutex_init(&chip->io_lock);
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
 
-- 
2.43.0

