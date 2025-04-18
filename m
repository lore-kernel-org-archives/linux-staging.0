Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2724418E;
	Fri, 18 Apr 2025 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009431; cv=none; b=QJsGYEJgbaNRbPqUSvsRokxnM/4bV1XOWYuk0BaSYYQUE0T5GPbAuo8N6EkWRqd+/8W8hK1ZWRb+eR5ov75dHiBs3eLrVUebY7yPGepTrpUnyk2qpbP7DaZngPlJMOGvyUOBS+zDtzAoVDhHPWkLDMLVRhLxA5Ni82mtLP7yge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009431; c=relaxed/simple;
	bh=ZtWyf+85ZAZuuUdke/D6KK+1edjKVBiOUFx39D2hd6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oR5BywI03sNbFMV9S7pje1jntqsqPzHq6AJXNNa8hA68o5rwguanHXEd9ww/tWOdtLYDJ4LDRAbi+ycA4l0pcYYQPUDBtnpvG+L2m9HYmq/tPXQh0arICXnCiRzxid8RHJY+Y53ngEk7SPYcPAT9u/0/zlrE08twT59Qd8VxVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBQ2Qohc; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBQ2Qohc"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f8657f29so20583296d6.3;
        Fri, 18 Apr 2025 13:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745009428; x=1745614228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de216G9QJ9z5gWQFLLYUZKYI5uHds9pgvjd/vVy9J+I=;
        b=RBQ2QohcLbdQgbunoR4cziM9GMsIfROLO1kAmAkzUkDF0NlDRErUk5tu/9yFbJswow
         C7mSMcHV/qnye6QKK3KAA87LC0yfvZacHjUr3Q272eda5BlVwTdF0yzWLXcywsfr7t0N
         cHW+iE0+1ac55sHVpmOSPLwhmyULFkJQFMpPsoWil+8VKjpteUh86ZlBSwsEFOag7icN
         wA7o8gFHOy8xowv4HBTlge28HoMlfBgraw0OhalwNqexsGkFfBm7yfHDOl2q7FXp8F0+
         vLgSspuusqOGPcLzy2q94bFcMDen3zRzFnf/IRL5qjofoClbCCfLh6CyliNrj80jpxhg
         3+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745009428; x=1745614228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=de216G9QJ9z5gWQFLLYUZKYI5uHds9pgvjd/vVy9J+I=;
        b=gMJNNM3lLp+VGq42AAHAhXjwV3Yja9Tt9LdhBpqirvh2YcvbYZ97dG4kfWvj8H9t7g
         DAfpbsDfzt8ldeTvO390dY5kURy12cOxcMjMW/WzV0DHfhR2vw9zhaKkPWUI2tc9gtEC
         fp09zZ1QL5O+Tfki6s5/0lr2ZFOohwQY9MivVW9a6tRCsYnNoNsCbrIAxK/14PO06W6D
         CH4KJ31NnGCCycSZMRu7IW8GCGJKTFBBUyYmATQqSKlEze6hqQw0UNEy4Rewp4JOjcwx
         hDuCVRzQGAakQrcLoJ0jaR4Su21cpMiYSwC/B1MtFa6niANlaDeAG9XtWBwbpW5sIxnc
         xSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsYiwAtqSKBEnd31nBMiaFulr68PSsVkhqniEppSLz3MM6ZmVt+gS3LlHacLx0FjJytsDjuMF2llrrMiKn38ontr9R4Q==@lists.linux.dev, AJvYcCXXa3n/Avkr8dwGiyHjD6x1ZQw88tfn2+vJ+SjbQTXZlxhwShPGBv6hSZwUNi58nB5kipR8mme8x/HH+2YWSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrFxS0LcjsE8ukwhCjTapIfX/PR2dNQ1IVQ4Zl04T1ApMlDgw+
	eAFEeeb1l9ok2Dx9QA4MiknBpb229InmsXtY9GSfqIRhTAe/DSAl
X-Gm-Gg: ASbGncstiqQWEgBv9HPtmdsJKcyZdFmfzYswguvkvU/O3Nmsh3akRRR5MSlvBDWm4Uh
	HqrovGwQT/qC3p+AiZRr4RTn3q73c/TJ7iXE0F6L2Ies5+2LA+PJ8um8s1UiyEPu88AIDaUlijG
	cYc3QCu8p5IEKb2YBYrXSz8NWUfKJ8xX/OIO1o+ArPSdaxEtmmiKnsKfNpGjNOP4/Wco2f4yvg0
	svnOTQ5fxayB6HmpgmgpC7PmUHtkyK/aBePD4Qo9o3EMxMjH5vI49gw2z56leTOyo1B8XraQ9Am
	F7MXiHUhtzUmlGE187io+Tz5PjH1DVG5RQdlOIP91tETsjUaZXWKxA76/rf0B7fGsbfIVXPul1D
	gViF7OSOqGpV74t1jETo=
X-Google-Smtp-Source: AGHT+IGime0GJ1aBGvs77WfZsnIYGkl8D80gnhzNZ442Bzp45vV8+8Pl5nqX8PtMoaqO+wpE1Aqmwg==
X-Received: by 2002:a05:6214:250b:b0:6e8:fbb7:6760 with SMTP id 6a1803df08f44-6f2c44ebfbdmr65373506d6.1.1745009428478;
        Fri, 18 Apr 2025 13:50:28 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af11d7sm14355906d6.6.2025.04.18.13.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:50:28 -0700 (PDT)
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
Subject: [PATCH v3 2/5] staging: iio: adc: ad7816: Rename state structure
Date: Fri, 18 Apr 2025 16:47:36 -0400
Message-ID: <b2d3bb8d1e3ef161e0bea7423656a57cececc2b6.1745007964.git.gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745007964.git.gshahrouzi@gmail.com>
References: <cover.1745007964.git.gshahrouzi@gmail.com>
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

