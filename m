Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58BD39A067
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289648; cv=none; b=Y//13CnnvMKoxVO30mlVqbZxlbpyKOv+WsdF/PHHazDjxGxx6G1ZMqqAwobdJz2Y9ibCvR9DUw+ArWNb/TuWtmt+jx1zqPmMYlnvipG8VuJeLaerT2ZKLU8yxT6XlGoyNcrR87oMmR0LvvDe7O5bWg14wKDvLKGZJqveRFogbmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289648; c=relaxed/simple;
	bh=VPxwzLREslsbpmwkvkwJ+oSeDvr9GufTBU2tE5gVVLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPeODKGXp7JNTrNeNunxXGYTReigPjrOFOb7Nw6sg0+dtc1AjNblTUceon4w8B0mFlVTmMnhDR/lfQfzj1F8gcZElhaBYJy0bjilPA9qYZL7v8eSMnRff8u+Lf4LKFtdsgL/mmVt9sKQdrFcsEpOwlY4E+LE7Gt1jaVW3FgZSPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lasl1N56; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lasl1N56"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so816202f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289645; x=1789894445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0OWEY6i3wEnrwVt7jMGeVNMMCw4YyaXULhY7agaqrk=;
        b=lasl1N56bKROkKszw6zrOmglo42MCB/bDktmT5Fwrp5wZMgaTS7wrwQDu5Y+IJwyjI
         JyQncOWTmwgqSQ9qQrZy8O4We2FXaBXGp2wqX+1n0HhWDhcfRTW+4KscL3xp+7kQQr6H
         Odau7O34wK6woYgjwusukRS3BhEEgs3EbgRIvaa8mBBzijXCTSocA2gTyB/qXGDBmABD
         n1CWUpWJvJuvOqYU7SvEANkdo3psvnvH3KaZgImYY08BNd8P+4YhBtauQ0hsw+v+wJ1E
         0kN49ZBVt5c33zPjlG/eWFVq9d9He2BY+IgzJIFpUvoX61s+yHFly72pXdWVwcVmeOLW
         NwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289645; x=1789894445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0OWEY6i3wEnrwVt7jMGeVNMMCw4YyaXULhY7agaqrk=;
        b=J8H5XVzZfu4qWbTSEY/zsDAczIh6cCQE11Osws/7P8bcDIV/v2ed4Nkh+OLP7la+Rq
         XpzyrR5BrDEj8gEOE/17J1+Q3nmZMgnTQyb0AtTaG59lJQKVZhVKMeTfkQPdajxO/uIy
         LgmRapl+HyH9320gGUF2JDOALGyFeYwwtdClqDDXSrFjh0P3vD9NwdOmsnkrxj9nCxSc
         aafK8laTsIvNJdwR1XHAHhBvzxt73ZCp+dlcI8QXK03zgnXaMfDW79M652KaKYMxWOFd
         V1GWv5zTmYpJuHK4vEpDtVbpHd2ojo2DiXI8NzEc2xhyrOeNC8LV4c1tXkBepnWl8hkg
         ejaA==
X-Forwarded-Encrypted: i=1; AKwUvBwZvifyKHG/xkKIecv9KPCksaHpbePMK5CMYbqeGWc5fxCGbVWS2ltkMoORuRpSOewb2mHLecVJC0TwtJNV@lists.linux.dev
X-Gm-Message-State: AFuF++nMhTr5+UAzmU/shQ9ACDRahWC8OUCEQb1CFhDReDLowipQnaK4
	C9m1BiY/32COLmfOM0uM+XIX5KPZH4gtjivNLuhR3k99qbHl0drUsx48
X-Gm-Gg: AYBFou0MN/io7AqF4JFia143AngBLFJWg6+kCxUojP0HT/TQNhbHnnyDEBFjdWWHUwN
	dlrHktBNeb2l9oGPkCSOTnWxtlcbzy8DNLLDmkOWTLunlhy7Chv8U7RVxil9NuQsOYBZJNqYaKC
	l5RMA4vHRJ070jWMUDkfM6LzOjougspcamHUDtKRtyHhhHppN7EhzIbzS3A9bSpBCMJUbCoSE+w
	tRPyQ1GlpwTE+3SYZLKU9sUjPMDIEQMF5OdVBTniV2O4YLFUPjkzq+Fj1EPuVOhss/hNPzFU0R7
	jXqi/wMdwhs0wyOu0+WEj5MbxwBCoB0bcKezyAXPBbLAWSxsZ9UqC/t2JtDlx5JJsj/MJ4bDY5o
	TCZk0C8QGKyAXfqsX1WI7/5PhjKMaT3TCGiUt4r5GnF1g7Ulqc/RQsfda2lJC3nnrQUr5+Kbn2h
	dqRFR+hgkCAg23pG+GTMI6zPrqUHhUtPYe8EcDIxwjsxgSrhKwihD+e2gXzunWmU+VEAluIwmFt
	p44QlW6gLdKruRL+QY=
X-Received: by 2002:a5d:630b:0:b0:484:3604:c7bd with SMTP id ffacd0b85a97d-486eb31c4d4mr19672165f8f.17.1789289644914;
        Sun, 13 Sep 2026 01:54:04 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:54:04 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 4/6] iio: accel: adis16201: add ADIS16203 support
Date: Sun, 13 Sep 2026 13:53:05 +0500
Message-ID: <20260913085307.13846-5-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ADIS16203 from staging to mainline ADIS16201. ADIS16203 shares same
SPI protocol and register addresses. Differing parameters are handled by
adis16201_chip_info structure.

ADIS16203 specific support includes DIAG_STAT_SELFTEST_FAIL_BIT, which
is supported only on ADIS16203, and a separate channel array.

Kconfig is updated accordingly.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/Kconfig     |  6 +++---
 drivers/iio/accel/adis16201.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig
index 4094299e2..f884ec66f 100644
--- a/drivers/iio/accel/Kconfig
+++ b/drivers/iio/accel/Kconfig
@@ -7,13 +7,13 @@
 menu "Accelerometers"
 
 config ADIS16201
-	tristate "Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer"
+	tristate "ADIS16201 Digital Inclinometer and similar"
 	depends on SPI
 	select IIO_ADIS_LIB
 	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
 	help
-	  Say Y here to build support for Analog Devices adis16201 dual-axis
-	  digital inclinometer and accelerometer.
+	  Say Y here to build support for Analog Devices adis16201 Digital
+	  Inclinometer and similar
 
 	  To compile this driver as a module, say M here: the module will
 	  be called adis16201.
diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index e0bf7df50..8e8e612fd 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer
+ * ADIS16201 Digital Inclinometer and similar
  *
  * Copyright 2010 Analog Devices Inc.
  */
@@ -63,6 +63,7 @@
 #define ADIS16201_DIAG_STAT_REG				0x3C
 #define  ADIS16201_DIAG_STAT_ALARM2			BIT(9)
 #define  ADIS16201_DIAG_STAT_ALARM1			BIT(8)
+#define ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT		5	/* ADIS16203 only */
 #define  ADIS16201_DIAG_STAT_SPI_FAIL_BIT		3
 #define  ADIS16201_DIAG_STAT_FLASH_UPT_FAIL_BIT		2
 /* Power supply above 3.625 V */
@@ -232,6 +233,15 @@ static const struct iio_chan_spec adis16201_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(7)
 };
 
+static const struct iio_chan_spec adis16203_channels[] = {
+	ADIS_SUPPLY_CHAN(ADIS16201_SUPPLY_OUT_REG, ADIS16201_SCAN_SUPPLY, 0, 12),
+	ADIS_TEMP_CHAN(ADIS16201_TEMP_OUT_REG, ADIS16201_SCAN_TEMP, 0, 12),
+	ADIS_AUX_ADC_CHAN(ADIS16201_AUX_ADC_REG, ADIS16201_SCAN_AUX_ADC, 0, 12),
+	ADIS_INCLI_CHAN(X, ADIS16201_XINCL_OUT_REG, ADIS16201_SCAN_INCLI_X,
+			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
+	IIO_CHAN_SOFT_TIMESTAMP(7),
+};
+
 static const struct adis16201_chip_info adis16201_chip_data = {
 	.arr_channels = adis16201_channels,
 	.incli_scale_val2 = 100000,
@@ -246,6 +256,21 @@ static const struct adis16201_chip_info adis16201_chip_data = {
 	.name = "adis16201",
 };
 
+static const struct adis16201_chip_info adis16203_chip_data = {
+	.arr_channels = adis16203_channels,
+	.incli_scale_val2 = 25000,
+	.write_mask_incli = GENMASK(13, 0),
+	.diag_stat_mask =
+		BIT(ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT) |
+		BIT(ADIS16201_DIAG_STAT_SPI_FAIL_BIT) |
+		BIT(ADIS16201_DIAG_STAT_FLASH_UPT_FAIL_BIT) |
+		BIT(ADIS16201_DIAG_STAT_POWER_HIGH_BIT) |
+		BIT(ADIS16201_DIAG_STAT_POWER_LOW_BIT),
+	.read_bits_incli = 14,
+	.num_channels = ARRAY_SIZE(adis16203_channels),
+	.name = "adis16203",
+};
+
 static const struct iio_info adis16201_info = {
 	.read_raw = adis16201_read_raw,
 	.write_raw = adis16201_write_raw,
@@ -253,6 +278,7 @@ static const struct iio_info adis16201_info = {
 };
 
 static const char * const adis16201_status_error_msgs[] = {
+	[ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT] = "Self test failure",
 	[ADIS16201_DIAG_STAT_SPI_FAIL_BIT] = "SPI failure",
 	[ADIS16201_DIAG_STAT_FLASH_UPT_FAIL_BIT] = "Flash update failed",
 	[ADIS16201_DIAG_STAT_POWER_HIGH_BIT] = "Power supply above 3.625V",
@@ -322,6 +348,7 @@ static int adis16201_probe(struct spi_device *spi)
 
 static const struct of_device_id adis16201_of_match[] = {
 	{ .compatible = "adi,adis16201", .data = &adis16201_chip_data },
+	{ .compatible = "adi,adis16203", .data = &adis16203_chip_data },
 	{ },
 };
 
@@ -329,6 +356,7 @@ MODULE_DEVICE_TABLE(of, adis16201_of_match);
 
 static const struct spi_device_id adis16201_ids[] = {
 	{ .name = "adis16201", .driver_data = (kernel_ulong_t)&adis16201_chip_data },
+	{ .name = "adis16203", .driver_data = (kernel_ulong_t)&adis16203_chip_data },
 	{ },
 };
 
@@ -345,6 +373,6 @@ static struct spi_driver adis16201_driver = {
 module_spi_driver(adis16201_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
-MODULE_DESCRIPTION("Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer");
+MODULE_DESCRIPTION("Analog Devices ADIS16201 Inclinometer and similar");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.43.0

