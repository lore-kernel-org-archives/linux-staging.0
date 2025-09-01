Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DCF1DE4F1
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756712284; cv=none; b=Nr3+rQWuIpFg0xS2UK87T+kGrDWeR+rP7KSh/P2Ri3V+mmjGV0MCNKYudowKdWB6y3EqpCnzaD5T7WLlol++S/1rQ9KDfp5ksu1QVJUszJosjbYew2zq1tJ0xQSql4RHX0R6Hb2YohCjlBS+FX0e4Y6NkgYS1qPK8NmuQDYII7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756712284; c=relaxed/simple;
	bh=jAfgCrmovXTASeSG0seHoaOGT+mdDgAHBM64F+u2jtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZfKkcJatu3c+AN7RoqYhh0T2RqL9jHhGE652Ms4awlwGzMWTXt3b7RZ82rQ9NVu4d5aqA6TwNwjAYpfYJF8DmGnyb54BC6otsWaYTnO/dvMzS03MiPX/t/nE+x1U02FYgWUxv6nnFuCEp6iJO8YdSvxavS/s1wKh/uQIF08Jk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8LoL3Gl; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8LoL3Gl"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4df220483fso1416782a12.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756712282; x=1757317082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlS6s9xBoj0Gsoj15IeDcSfwqpbtZrjtwfLutLxFrM0=;
        b=V8LoL3GlV/vCww7SiP77PcIzQ41bq6mrdXFW90Nold3T/0409mxOLO2EmaL64K3xGP
         RpcGo/kC7POgDal/wJkmFacefmuIbAWUkQ45gK5Gxg/aNx1aD712W+gs4CNExXNk4CDX
         pHLBT3x+99OMjk1MrfHTr5w9yMEAcwcNzOl6+bXqoA2ZmjEtuV/LsEcQ/iTWM9na3sFx
         00M8di1+Ql8gPjcLNE4XIqlB+Ia5FlW0n59Dv5XV6TQ5j96W8tfYfwM1jtUvhj/sAc8K
         rS0r5VeO+ZtBCVu5eyDkKwyp4RNVuYSNnO3EpRkVVEajJAAsjaM0CGNIi1ztj51isDkr
         omnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712282; x=1757317082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlS6s9xBoj0Gsoj15IeDcSfwqpbtZrjtwfLutLxFrM0=;
        b=LDcRReLVUe4jgstd9kMEl+LsECaOdjlbvwqcYsFb9ea+4OuRT2kN2LvOOigzieUmOh
         VO53lKRAe9mZ0V38hbU4R0yoTzLEnvJAB8/4uU5fOvdQbxXqhioOCy4HdHlDflpCyvw3
         KetMcnfLjWFq/L2mKkkisHguvNLial+8rFH4LPw6nNwkygT3bGkArmFUtEfqA6Fwnir0
         lUizWsHZ5Z4TM6QVIsULpAUfKhNgtHVdUnP6SC/9Sx4ok/yMy1a2LAOBAPAXePOzqXfB
         9tl/vWcRNFEpRTG/s+oyfJCZJdhOF3dPvSAKsZuM1+/SMQ4pky4zxaWB75H9JePu2GIK
         GQIA==
X-Forwarded-Encrypted: i=1; AJvYcCUgmRyiV9HRnJQJctxm7WW8Tzu9mtckP600jWHUM3K27ddqDOE6/1C+jFzQEjRNpDIn6H0Vo+wNoDIsHiAl@lists.linux.dev
X-Gm-Message-State: AOJu0YzmLgfLZVAsCiqh5S2UDqJ61ZsWl1AYXXfVJ3FIjYH1UuYXZEd4
	PWqp0xl3YDAbCiqCZrkrMsfPjg4Wa6/NNRVa+SZZZoIjjFdf6TnFdFys
X-Gm-Gg: ASbGncuBNoTswiFl+5IfxfWidAHIBAAlO0tLtM6coBEMy8fgji0rs55qUZbCVo07Kr1
	TsHHRfMIk5sDSjRqOZAh2eHAvcCKWofGsc0tYCSMiqhecYEJDrWFMtHTErFRdFwXxtfw7S3cZiG
	57OFJstqirSzNT/e+hVV2aMuNLJDLRngJ95Rhrko3fHjLfNUnWJGVRL1lseVQfgy8L0UbGEBrAx
	Iz5idM3kSJmj7E+nD/gdt02+JvI9W9/PNoDFyP1oomhLT0C5cSsSs7fUgQkoicJS5I61G1MWg/t
	rIiuffuCGgh325CoLkwApoVoFKibjBWtpbzsbSnOxsqfyVH0OmyeKFOExB3BzAZTemRv8cpxrF/
	1wGvLSs1D8svpnxHRT1lLP+qRCkIRYbdtjlBqUuoeczRuKh0Mbbs=
X-Google-Smtp-Source: AGHT+IFBa9YIxUxfvPklfq7ICZ6Mprmrrg84pYsUW/IV/7FZKdeJpVxqGnCn7Cgi5itSIo9WzCI4Zw==
X-Received: by 2002:a17:903:1211:b0:246:ceda:ebeb with SMTP id d9443c01a7336-24944aa2848mr85094795ad.33.1756712282012;
        Mon, 01 Sep 2025 00:38:02 -0700 (PDT)
Received: from localhost ([77.111.118.146])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b4de04a9ea7sm6489148a12.16.2025.09.01.00.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:38:01 -0700 (PDT)
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
	Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
Subject: [PATCH v3] staging: iio: adc: ad7816: add mutex to serialize SPI/GPIO operations
Date: Mon,  1 Sep 2025 11:07:50 +0330
Message-ID: <20250901073750.22687-1-moahmmad.hosseinii@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Changes in v3:
- Restore proper capitalization in From:/Signed-off-by lines
- Move v2 changelog below the --- line

Changes in v2:
- Fixed mismatch between From: and Signed-off-by lines
- Verified style compliance with checkpatch.pl
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

