Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF87356755
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699226; cv=none; b=BL5TQNz4fkM5e5k02fEzWqT1XVEqwLI7x4LPSM3+fd7T/RXbGtG5/gb2gfjXyLen29Jq3wBKacDYMej/S+znJl55bGx6iBwcfWn1sIgx02upoH0zNn8k1EqpMT4cxdSqkFKveYXgTzSoruhDoJ8gNaVUv/hxUDKFhJnpnVOWeLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699226; c=relaxed/simple;
	bh=kAyPTH/4tiqZKHmk1hPFWby2kNutxnNPbeUwxEyjAEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWDQq6C4y6k5f3Cmdx+2Dr6S3Warh32TuJXN5wq80UWeuf3lxm4ddKOypeJpPhJpBIRbj+m/NzuYQM87tm7bPoHzOwgdouzeF7IMqhwvsd0Any1YV4XRCx9KWUG3apgTsgJ4E+OFchW/zYItoEKoBnbbxrKVjn5MpXwhvO0Gc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiRPP5WB; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiRPP5WB"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c68f34133so930221fa.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783699218; x=1784304018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htbp4eZVoCOY0ETRBZFkljATlldpw89nkTYb09YWpTM=;
        b=aiRPP5WBJNe4gjNYdw2LaFu60n6YTlCRJoeufafhRranKrv/uBDwyL7DjnqwXn/qrf
         kxY9MyOpwMcRRZn6gA/igwdiel9Gpzgb7iDJfDOcU/nLjmL0tO7tf7CEj+xEkLlp0vGe
         zBTMpACbcGFuxSlyZdedDgzii17/M+/KHgfc++OTtD4VK68Jqg4HDVM6IC4tL8ulkrgE
         jrAAEcVIPWGZTLNo2FqY8qJiFFUzpXkXk9EbkY4Aww7EMdiDT7K7Z/7Mn4O2XfcGsXJu
         iK51a/84EKKmRSrvwLtK3q98LZ13O+Wj3CoZeWOz7oQ1DsUaUycL950XxJrCHSMmskET
         +zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699218; x=1784304018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=htbp4eZVoCOY0ETRBZFkljATlldpw89nkTYb09YWpTM=;
        b=qSccmNB6S7gie0cbr1exKF4GrdhEn6G6vp+M/ZfzXgSJ/waJFJv7xiEM8qmCdESyjj
         5owdfi5/zvELThZlqXJbBwvtRj70EV77FVlApkmNncN6hEkuxRGm/SeiOLuMybzIfiD2
         u3o6Peg0nAKX2QPv4CRyXD2KVeoUtOs8KNKhcdfFJS/UMk2ogGDrD3elcFWh9Jc9v0bL
         7e7ejreoA3s4InsXGIauqfCKq1EYKJp55JI+/nYx0tZA+sn0pYxJMhPwG++k5o2PfzPC
         OGE1iM8gGuxJlp90vmgCfgqzEr1Bv+uitPvDToKJ7YrbXi+D7kCO6DAm1RWkltXu1w0s
         lKHg==
X-Forwarded-Encrypted: i=1; AHgh+RrfoFtdyKK7WpI912G//Lw+ZjS74YVnrz0Fgo7qut31kizLwGoJyLK/H1YJDOr098I9JIwVDC+fQHeEbktS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu43CZ6E+fjXq+7orfhj/83fr9Gs0gcP+0MZjVt/5k0JipWuxY
	L2D0UHOGC66a+SQbwQCoYnjUw7i2yLF9638BO8YKDP3DCLnybrNaBFlO
X-Gm-Gg: AfdE7cl23Mfjjr0oLb4PweRGTv+UHhuJjItAWDcVqoM0sjl7oQCy/r09N7P/jD/1gF5
	ozBqYz8djq0P/01O2uCnG+dIWhnYXaBfQgqBJkRcwxwoKX3GdoA4KH67QRtC6jiZqlYpO0COOas
	j0JyX/jGzFs1Qc8nFP9gzkIVo9kb2ul1X0uDBfbDtlH+f08J6+rkSBCpxpXgn/ZoXiwAhhJRNcz
	fLfZI3ICh+Q3jUmabwDD4wchkS4jVc2bhGQPkJQwbpeXpEQvNHSuCndneuxeKe/7Nuptp30U57a
	CorLTfSdctoey+z3GBIrPX4+4HURPnowLE1uzm2oEwidyNBcvxEZ30ifCkB9p7P7YYtqfWEDcUv
	vBcFn8wTvPMAOfu5vkwXGDJVuD6Iwtp3+AxHgOwPy9t3AdWwpvgKxRT2aUAenYynjyQAp719oeR
	32Sg98wxwK0L/p0prNu8TOp+wfZ8TIzcq3Xsg=
X-Received: by 2002:a05:651c:2115:b0:39a:fe2e:52b0 with SMTP id 38308e7fff4ca-39c82b3c679mr10420811fa.7.1783699217593;
        Fri, 10 Jul 2026 09:00:17 -0700 (PDT)
Received: from localhost ([5.250.49.195])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b83a93sm11421281fa.24.2026.07.10.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:00:17 -0700 (PDT)
From: Taha Narimani <tahanarimani3443@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Taha Narimani <tahanarimani3443@gmail.com>
Subject: [PATCH v3] staging: iio: adc: ad7816: Use devm_gpiod_get_optional() for busy GPIO
Date: Fri, 10 Jul 2026 16:00:01 +0000
Message-ID: <20260710160001.29856-2-tahanarimani3443@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710160001.29856-1-tahanarimani3443@gmail.com>
References: <20260710160001.29856-1-tahanarimani3443@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently utilizes devm_gpiod_get() for the 'busy' line,
which makes the GPIO mandatory. However, the busy pin is hardware-optional
depending on the specific board configuration.

Switch to devm_gpiod_get_optional() to allow boards that do not have
this pin wired up to still probe the driver successfully. Clean up
the redundant busy_pin conditional checks as gpiod_get_value() safely
handles NULL descriptors. Additionally, use dev_err_probe() to prevent
bootlog spamming during deferred probing.

Fixes: 3e5971b2ddb6 ("base: original ad7816.c")
Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>
---
Changes in v3:
  - Removed redundant conditional check around gpiod_get_value() as suggested by Andy Shevchenko and Dan Carpenter.
  - Switched to dev_err_probe() to avoid deferred probe spamming.
  - Introduced local struct device *dev pointer in probe and kept the GPIO request on a single line for better readability.
  - Added the missing Fixes tag requested by Jonathan Cameron.

 drivers/staging/iio/adc/ad7816.c | 67 +++++++++++++-------------------
 1 file changed, 28 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 988eee3..807cf57 100644
--- a/drivers/staging/iio/adc/ad7816.c
Changes in v3:
  - Removed redundant conditional check around gpiod_get_value() as suggested by Andy Shevchenko and Dan Carpenter.
  - Switched to dev_err_probe() to avoid deferred probe spamming.
  - Introduced local struct device *dev pointer in probe and kept the GPIO request on a single line for better readability.
  - Added the missing Fixes tag requested by Jonathan Cameron.

+++ b/drivers/staging/iio/adc/ad7816.c
@@ -22,20 +22,20 @@
 /*
  * AD7816 config masks
  */
-#define AD7816_FULL			0x1
-#define AD7816_PD			0x2
-#define AD7816_CS_MASK			0x7
-#define AD7816_CS_MAX			0x4
+#define AD7816_FULL                     0x1
+#define AD7816_PD                       0x2
+#define AD7816_CS_MASK                  0x7
+#define AD7816_CS_MAX                   0x4
 
 /*
  * AD7816 temperature masks
  */
-#define AD7816_VALUE_OFFSET		6
-#define AD7816_BOUND_VALUE_BASE		0x8
-#define AD7816_BOUND_VALUE_MIN		-95
-#define AD7816_BOUND_VALUE_MAX		152
-#define AD7816_TEMP_FLOAT_OFFSET	2
-#define AD7816_TEMP_FLOAT_MASK		0x3
+#define AD7816_VALUE_OFFSET             6
+#define AD7816_BOUND_VALUE_BASE         0x8
+#define AD7816_BOUND_VALUE_MIN          -95
+#define AD7816_BOUND_VALUE_MAX          152
+#define AD7816_TEMP_FLOAT_OFFSET        2
+#define AD7816_TEMP_FLOAT_MASK          0x3
 
 /*
  * struct ad7816_chip_info - chip specific information
@@ -48,7 +48,7 @@ struct ad7816_chip_info {
 	struct gpio_desc *convert_pin;
 	struct gpio_desc *busy_pin;
 	u8  oti_data[AD7816_CS_MAX + 1];
-	u8  channel_id;	/* 0 always be temperature */
+	u8  channel_id; /* 0 always be temperature */
 	u8  mode;
 };
 
@@ -84,10 +84,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 		gpiod_set_value(chip->convert_pin, 1);
 	}
 
-if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
-		while (gpiod_get_value(chip->busy_pin))
-			cpu_relax();
-	}
+	while (gpiod_get_value(chip->busy_pin))
+		cpu_relax();
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
@@ -254,8 +252,8 @@ static const struct attribute_group ad7816_attribute_group = {
  * temperature bound events
  */
 
-#define IIO_EVENT_CODE_AD7816_OTI IIO_UNMOD_EVENT_CODE(IIO_TEMP,	\
-						       0,		\
+#define IIO_EVENT_CODE_AD7816_OTI IIO_UNMOD_EVENT_CODE(IIO_TEMP,        \
+						       0,               \
 						       IIO_EV_TYPE_THRESH, \
 						       IIO_EV_DIR_FALLING)
 
@@ -351,11 +349,12 @@ static const struct iio_info ad7816_info = {
 
 static int ad7816_probe(struct spi_device *spi_dev)
 {
+	struct device *dev = &spi_dev->dev;
 	struct ad7816_chip_info *chip;
 	struct iio_dev *indio_dev;
 	int i, ret;
 
-	indio_dev = devm_iio_device_alloc(&spi_dev->dev, sizeof(*chip));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*chip));
 	if (!indio_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
@@ -365,31 +364,22 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		chip->oti_data[i] = 203;
 
 	chip->id = spi_get_device_id(spi_dev)->driver_data;
-	chip->rdwr_pin = devm_gpiod_get(&spi_dev->dev, "rdwr", GPIOD_OUT_HIGH);
+	chip->rdwr_pin = devm_gpiod_get(dev, "rdwr", GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->rdwr_pin)) {
 		ret = PTR_ERR(chip->rdwr_pin);
-		dev_err(&spi_dev->dev, "Failed to request rdwr GPIO: %d\n",
-			ret);
+		dev_err(dev, "Failed to request rdwr GPIO: %d\n", ret);
 		return ret;
 	}
-	chip->convert_pin = devm_gpiod_get(&spi_dev->dev, "convert",
-					   GPIOD_OUT_HIGH);
+	chip->convert_pin = devm_gpiod_get(dev, "convert", GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->convert_pin)) {
 		ret = PTR_ERR(chip->convert_pin);
-		dev_err(&spi_dev->dev, "Failed to request convert GPIO: %d\n",
-			ret);
+		dev_err(dev, "Failed to request convert GPIO: %d\n", ret);
 		return ret;
 	}
-	if (chip->id == ID_AD7816 || chip->id == ID_AD7817) {
-		chip->busy_pin = devm_gpiod_get(&spi_dev->dev, "busy",
-						GPIOD_IN);
-		if (IS_ERR(chip->busy_pin)) {
-			ret = PTR_ERR(chip->busy_pin);
-			dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
-				ret);
-			return ret;
-		}
-	}
+
+	chip->busy_pin = devm_gpiod_get_optional(dev, "busy", GPIOD_IN);
+	if (IS_ERR(chip->busy_pin))
+		return dev_err_probe(dev, PTR_ERR(chip->busy_pin), "Failed to request busy GPIO\n");
 
 	indio_dev->name = spi_get_device_id(spi_dev)->name;
 	indio_dev->info = &ad7816_info;
@@ -397,7 +387,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 
 	if (spi_dev->irq) {
 		/* Only low trigger is supported in ad7816/7/8 */
-		ret = devm_request_threaded_irq(&spi_dev->dev, spi_dev->irq,
+		ret = devm_request_threaded_irq(dev, spi_dev->irq,
 						NULL,
 						&ad7816_event_handler,
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
@@ -407,11 +397,11 @@ static int ad7816_probe(struct spi_device *spi_dev)
 			return ret;
 	}
 
-	ret = devm_iio_device_register(&spi_dev->dev, indio_dev);
+	ret = devm_iio_device_register(dev, indio_dev);
 	if (ret)
 		return ret;
 
-	dev_info(&spi_dev->dev, "%s temperature sensor and ADC registered.\n",
+	dev_info(dev, "%s temperature sensor and ADC registered.\n",
 		 indio_dev->name);
 
 	return 0;
@@ -431,7 +421,6 @@ static const struct spi_device_id ad7816_id[] = {
 	{ "ad7818", ID_AD7818 },
 	{ }
 };
-
 MODULE_DEVICE_TABLE(spi, ad7816_id);
 
 static struct spi_driver ad7816_driver = {
-- 
2.53.0

