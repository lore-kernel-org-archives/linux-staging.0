Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E8259CA0
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709697; cv=none; b=kY6IGJtjb+oDX1Y/AWlPuDr8yLbPDqiVqpv9qBafu+6SalulNN6pRaRwRqshQD+yoYU/GieHAQxJOQYfhA75DdEztIkHKDwuECZpMOuAbkzkC4WU27lrcb38E3OiNR+Sebnb49QFxbDEu5M9Sb9xfJVySrN3gCEvrIID+ZJpapI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709697; c=relaxed/simple;
	bh=GLVelhT9h97w4m/gNH8OT9K8ySnZNsn+XWbkfCQ+VhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jj/JHB2E0YJF02SI1ZMmInblMQuHYj0wC9egQesZSHPX1JK5Zt0BOFzmj+LF2ZXPRAJNb7cq2iVtml7izxCgc48vPk+zReOooT8C19Ed9HaCq8O1xIgM9RTOlI5VZ8V3URi91MzmoEt2JcORGLg+GPiruVSLmqzGlP+RXgu5kHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgRbf9bU; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgRbf9bU"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so3558616a12.0
        for <linux-staging@lists.linux.dev>; Sun, 31 Aug 2025 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756709695; x=1757314495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oa4pEDtoHfy10lQMQvxNZ4KuYRDe8acSazEVNvbRXKU=;
        b=FgRbf9bUNm3LBMqQJY0ob4rkYcw9PSCIqELEzF6OzahicgZ82+dxLENt2+j4PsPGyf
         UHWyuvtqrzyyZxIt13dMC7upA9E+rQUxkoCOqbkIpdmY3uajT8MB+5qUYxxichVznbrw
         Xw+0geawfdDKxVXTgg3dKvz/Cc9thp6V6lLF5A2h2EmhnXX6gtuHV8Isg8LdEpgUlw75
         72oqR76gXoKUhwzppx6pwv79H7TR+4J5iw98zE0bxZd2g+VoAuuofsRYs9QiF6IpPxaT
         /Ilxq3xgLpyLnjDdEBbsWSnZQ7FTwjRoUh7as6DyPzyQzN5f7yUAMYsQfNq+Qhh27lzn
         Ccgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709695; x=1757314495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oa4pEDtoHfy10lQMQvxNZ4KuYRDe8acSazEVNvbRXKU=;
        b=u+MYdBw/5J0XKwjPVNiRKzV8mERNqguwaHXn5kEx4Hlf1hNxAZaR5lApLfu9/cJX9U
         JN3FAHZYJl8ZS4jWrDHH7qyQCDcOvSf+NYtxCvIMlP6dkjWnpHhu3RlRZu6hoO4HSO/w
         ZkPu1FTAr8uvrWZ9Hbsl9tSmfblFEcSHeW6cSRlN4l3qVjjcwoafltDiqF17Agfpm8nl
         vhkRQ8zY/ujx3ZpD/SYP04q0yiAmJFXfD4/f8W0OMdibNwqxgkNSEcuq7pN1TTuEt45Y
         54Ecgli7Xnqm8ojZ3Y/a+CUI5/p+xJsDfb7FCvwEccRaEW96TegFQDn5YzlCJpAz1Ef3
         6C8A==
X-Forwarded-Encrypted: i=1; AJvYcCU4wT/jx3uvK6K6Oh+4gO6ebagbX7yUi+2lGCagJAAwnXYTGWsJZo9P26AIsojm+9wJ4Nzci+keRQlVZOJY@lists.linux.dev
X-Gm-Message-State: AOJu0YwteHKPRccMXlNFts+gmKT75zIzMAiodWAzqgn7seoL13P7ukle
	wwXw4T7hB4Ga8EJjfjaQs3UGVvuOqVNq+1b8JBoB4f9iLg92WjmEMK1m
X-Gm-Gg: ASbGncsxW1wlInMY+cHCtkbLagD+C5+pR9nn6lrLwBbOGjDLBlIbAJd47MPwxVAEOz7
	4QTLzLY9gdIrC5kTjDdGoMOMZ3rMffzq4JZqa2kbaq3BOHzBHAuj6nB2xswp8B5L1vw4BZUNih3
	Gg2Tl45HlSCdB8uqPiqBMAwRtWGNn8tByJbhaqCjiPlw8U/hfYgIIAKBIVEoXvF4Eq3M6Q8QiZY
	T2fUKTNz4QOeURlgKk+a7/U/pUcZ81Rd7y+pnF5mwlXK++CbOii+BriAmWNM2ePQbfwicBYM7pJ
	CTUKVmX7T8syEMV1lxeuV7XJg8TFffIhCBeULUv00nda/9OdWP7iSeVZIbFC8V4hOp+Hqpf3dmk
	GLSutGWP2RA8NQh7QsnBtVhr+lC543iJBnJVbyMqsQ9XzaEfQlhY=
X-Google-Smtp-Source: AGHT+IGx4CAb9dEsJrZI4+wzP+TsLHMibKKDL7czFpcmBFKfNyGQfvm4hdxWScGcNpf1rbRO2pDqhQ==
X-Received: by 2002:a17:903:94c:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-2494486df45mr101928175ad.1.1756709695131;
        Sun, 31 Aug 2025 23:54:55 -0700 (PDT)
Received: from localhost ([77.111.118.146])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-249065939b0sm92717715ad.110.2025.08.31.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:54:54 -0700 (PDT)
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
Subject: [PATCH v2] staging: iio: adc: ad7816: add mutex to serialize SPI/GPIO operations
Date: Mon,  1 Sep 2025 10:24:45 +0330
Message-ID: <20250901065445.8787-1-moahmmad.hosseinii@gmail.com>
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

Changes in v2:
- Fixed mismatch between From: and Signed-off-by lines

Signed-off-by: mohammad amin hosseini <moahmmad.hosseinii@gmail.com>
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

