Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF21DDC15;
	Sat, 19 Apr 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745071006; cv=none; b=GdQwXrygG6F0A6Bh2tVzwerLn/NDeWk/Sar4oJrU0j8hUj4uqT3iLzyxj/Tvt7oBs0QYMsBwOgKbsUqne42cftix5Vl8h+HrK2kB4JrRuaM8scKt15S4Vnd91A7fRCYJSpnG671/sSKXXb1VBowzhyiswJ/JaRx4nkY8hblctzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745071006; c=relaxed/simple;
	bh=ZtWyf+85ZAZuuUdke/D6KK+1edjKVBiOUFx39D2hd6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p/X4TQvk1aU9it6r0yA4X38jb5MmVSLBxW6TKGKDTrrvd60D+c40AlgY8Ns9Kw7IknP/fFGJVfP7VrYpq1xmtc6kWP/M+iuw3bwpB/JwlZGNaAt4NQ1cQk87MzKxCkhZHNRpImWuBtSN2nz097HMNVFVgkJwUcaRulQZyc7HotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glpiJaUR; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glpiJaUR"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c59e7039eeso372764385a.2;
        Sat, 19 Apr 2025 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745071002; x=1745675802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de216G9QJ9z5gWQFLLYUZKYI5uHds9pgvjd/vVy9J+I=;
        b=glpiJaURs+2F1vJuX0JseIPvRNWBve33RcidDbTqPHQ5bwiEy67UZNgTmKk3XXGPJq
         RJtPYC88rQPpweA1XW9bql93cXCxtEBZmhbfOcrGWZFsu8TgPyRo2dC6HzM7WBhSQw4a
         p3jvF+P+5NSppHUZKdSBWJ6Lh9nZOVE3upGqEn0vD5tHIjU1NhOxBipVuIOPIE9UJ/w/
         lgPUD1my6TDDrayhe/LIHm5xOdJgtI/r5MsxFSSHwjlGENCLkXTB8IEX+IUoSzExrJ7K
         lnMXANRhGCstsjMb8W8RrJO/GP+20eOHOCxhxVFKSh8SffS8h9ttE14IXKsHfo6YNc4E
         9RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745071002; x=1745675802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de216G9QJ9z5gWQFLLYUZKYI5uHds9pgvjd/vVy9J+I=;
        b=MJoNamfgmz2wsvR1Igxtcjdlh+2C6zQ7QKduBQrDQdpORIXj+cZ+X924RBIT/l6tDb
         q9ZFS6hcViOVGTK9JgEckNfiRZpUQH5NFYt+bCDJj+q74fwRoXJjK1M5l+F5PYh6O0Vd
         XZQXpqYK5ErrQEroQcJyuBrIF06jLa6jlPcoL78SyfT83A0GviAyVoPZDv6eZIL1wKGd
         /Yikvw6bfMbNagR3NbSfNRKBIpa4TZZUBs2DNW4k16VGI7ZbkBfDW4FLslPCAh4aUzR/
         /Um7kBaVYolKpD9OYqlDr0FkwOUo50qqwI9F7Il6FdaZzXKibET7R1+h0fcgXx6thYLQ
         +/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj9z1y5EMyofT2dwwVqZsA9NV+m4mbtPKvv4wPrraqiQlT9yerAIB5ggBoELzkt0TKPUq0bdGa3QXpY68+sdbrfJ5MrQ==@lists.linux.dev, AJvYcCWrRFUZS4hEs3ZEXKpckgw44v10O/pfMC2IYvS/zatkEXscPSlK5C7ApaQciDteUZo0k8+AdvtKBjkI59GLMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtKljta43n0oI2iLCya5Jgor09od6X2tTLCbnSGfxyqe8RFj5/
	+WH9XasAnFiti67Bpwv+cTD3fFDP2GdZeofDGRMMEcOwvNEN1ziW
X-Gm-Gg: ASbGnctoq1erudiXtjaXvmb178CZVTaCBcdVeuHADIpMNk0suv6wqAPk4V0oXKYVBLU
	pEPde+Lo4IXVFsPt+ZQeEfZ7m+oVpZ2y7NLZ3/vFn6PlK8URHmsMcKN7kWK4R3f5yvYbxpBdpLQ
	E8KOTMonhGwjbJ2rIwfeGdIKtMRij5Ad44a1aAkDtN6in26cQ+yllP6hfB9yeO6mB26+aZtv+8C
	4ieaYIn22B90A+YtPPe8nWTa1ekyMuUQd+UYU3rWctNo7DQLZCxwtnmkER658GNw44fbejqLSf2
	TJwBB/aLgvD5wxzQA8fioQFO88nXsh2JM35nECxICJXpCaKzqQmGJR+Of3hbYzYPiA==
X-Google-Smtp-Source: AGHT+IGjO9XrU530ITxvlahmC6BM8XwQH9uXIKeS9Jh/wyHB2OzRz2dqUKbHhGBZbB44HCl8uOWXMg==
X-Received: by 2002:a05:620a:2802:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7c927fb1a9bmr968863585a.29.1745071002382;
        Sat, 19 Apr 2025 06:56:42 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac4749sm214350185a.59.2025.04.19.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 06:56:42 -0700 (PDT)
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
Subject: [PATCH 2/5] staging: iio: adc: ad7816: Rename state structure
Date: Sat, 19 Apr 2025 09:56:35 -0400
Message-ID: <20250419135638.810070-3-gshahrouzi@gmail.com>
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

