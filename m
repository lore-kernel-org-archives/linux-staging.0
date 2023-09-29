Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2690A51228
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:55 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57ba5f05395so5984493eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008355; x=1696613155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP9/9l8r7A/7YK4CeZUwHw6ehtttSEiRW2pyIK4E0Iw=;
        b=vqUzuODqx6M0J48w/9yiRHNqsq5iGukKPMlFaKn7FPkLNkzjLsetRqGi5Bcoww2kxi
         iPiP8P8MnOGqtTdOi+BkNKVufTkkFizkVuHUON9lCkwHgM0ow4IfMwlolJ3JzoKjLFBC
         41VKN/xE7pSCSazDm+HdXfsmu9reayYw0WgOIasEUA7dElX8B5h6MTCuE47cThZJzc6D
         Tl6gYZiO1i8Yy2lFX2bUb03q8UpMU93pBLFHmAe8/Zt9GK/RPxKEN/TsCFwMrbehon1g
         UEBqVdm8mqYT+VwRXq79crymiY0/iLeZRHczftS/QDqd/KmH9hwS614uMIiJKozsyaiT
         I5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008355; x=1696613155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP9/9l8r7A/7YK4CeZUwHw6ehtttSEiRW2pyIK4E0Iw=;
        b=Wup2/QSeYp6dY+zUHNYOM3QXUT/kfgEM09HGKWw3w5iMrtKPwJ3Tn6zuhEI/ojD28Q
         rF6q6Q/8dAqMNZuSNiEvYXD8xoJVweNp1riDeenoxvePLd/okjFiKdoIpwUdwWSm1QIz
         qm63I55bQTvUqwmD21Jvjpa3JlI0izkY22LTr1AWog8KzNWU24nIAZBGM9FL4N4FljlB
         zNjmtmgpvRsprEpa0SfwgIJKLJMOjoCOfhNykV9eyBYe7zPhlTS5g7kpjgHRF/X3fk+A
         zDD5hziRvyc7P8bn6RKUKaLXz31PXYQ1WSXOI5978yhETTfhcLtfJmYT5EAVGQhVM3/1
         XwJw==
X-Gm-Message-State: AOJu0Yz4SWfLxY5nDU7Kukm0w0iPpmgQTaQoE45/4zviqMFA4KMCgxq7
	mb7FzUH8eu3T+Eo3RSfu6jOOgw==
X-Google-Smtp-Source: AGHT+IEV6omc1a2r/pRn4nd4/1MmdF05dK/YzlDdSJixR5lzLDsnSoVpgKImTCnKRUYsCweCu9h34Q==
X-Received: by 2002:a4a:3948:0:b0:57b:3424:147f with SMTP id x8-20020a4a3948000000b0057b3424147fmr4627779oog.9.1696008355031;
        Fri, 29 Sep 2023 10:25:55 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 09/27] staging: iio: resolver: ad2s1210: use devicetree to get CLKIN rate
Date: Fri, 29 Sep 2023 12:23:14 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-9-fa4364281745@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

From: David Lechner <david@lechnology.com>

From: David Lechner <dlechner@baylibre.com>

This removes the fclkin sysfs attribute and replaces it with getting
the CLKIN clock rate using the clk subsystem (i.e. from the devicetree).

CLKIN comes from an external oscillator that is connected directly to
the AD2S1210 chip, so users of the sysfs attributes should not need to
be concerned with this.

The fclkin field (the datasheet name) is renamed to clkin_hz to be more
obvious that it is a frequency in Hz.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* Don't sort imports in this patch.
* Renamed fexcit to clkin_hz.
* Fixed ad2s1210_setup_clocks() being called in an earlier patch.

 drivers/staging/iio/resolver/Kconfig    |  1 +
 drivers/staging/iio/resolver/ad2s1210.c | 81 ++++++++++++---------------------
 2 files changed, 30 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/iio/resolver/Kconfig b/drivers/staging/iio/resolver/Kconfig
index 6d1e2622e0b0..bebb35822c9e 100644
--- a/drivers/staging/iio/resolver/Kconfig
+++ b/drivers/staging/iio/resolver/Kconfig
@@ -7,6 +7,7 @@ menu "Resolver to digital converters"
 config AD2S1210
 	tristate "Analog Devices ad2s1210 driver"
 	depends on SPI
+	depends on COMMON_CLK
 	depends on GPIOLIB || COMPILE_TEST
 	help
 	  Say yes here to build support for Analog Devices spi resolver
diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index a710598a64f0..c8723b6f3a3b 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -3,7 +3,9 @@
  * ad2s1210.c support for the ADI Resolver to Digital Converters: AD2S1210
  *
  * Copyright (c) 2010-2010 Analog Devices Inc.
+ * Copyright (c) 2023 BayLibre, SAS
  */
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -90,7 +92,8 @@ struct ad2s1210_state {
 	struct mutex lock;
 	struct spi_device *sdev;
 	struct gpio_desc *gpios[5];
-	unsigned int fclkin;
+	/** The external oscillator frequency in Hz. */
+	unsigned long clkin_hz;
 	unsigned int fexcit;
 	bool hysteresis;
 	u8 resolution;
@@ -165,7 +168,7 @@ int ad2s1210_update_frequency_control_word(struct ad2s1210_state *st)
 	int ret;
 	unsigned char fcw;
 
-	fcw = (unsigned char)(st->fexcit * (1 << 15) / st->fclkin);
+	fcw = (unsigned char)(st->fexcit * (1 << 15) / st->clkin_hz);
 	if (fcw < AD2S1210_MIN_FCW || fcw > AD2S1210_MAX_FCW) {
 		dev_err(&st->sdev->dev, "ad2s1210: FCW out of range\n");
 		return -ERANGE;
@@ -201,45 +204,6 @@ static inline int ad2s1210_soft_reset(struct ad2s1210_state *st)
 	return ad2s1210_config_write(st, 0x0);
 }
 
-static ssize_t ad2s1210_show_fclkin(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-
-	return sprintf(buf, "%u\n", st->fclkin);
-}
-
-static ssize_t ad2s1210_store_fclkin(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf,
-				     size_t len)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned int fclkin;
-	int ret;
-
-	ret = kstrtouint(buf, 10, &fclkin);
-	if (ret)
-		return ret;
-	if (fclkin < AD2S1210_MIN_CLKIN || fclkin > AD2S1210_MAX_CLKIN) {
-		dev_err(dev, "ad2s1210: fclkin out of range\n");
-		return -EINVAL;
-	}
-
-	mutex_lock(&st->lock);
-	st->fclkin = fclkin;
-
-	ret = ad2s1210_update_frequency_control_word(st);
-	if (ret < 0)
-		goto error_ret;
-	ret = ad2s1210_soft_reset(st);
-error_ret:
-	mutex_unlock(&st->lock);
-
-	return ret < 0 ? ret : len;
-}
-
 static ssize_t ad2s1210_show_fexcit(struct device *dev,
 				    struct device_attribute *attr,
 				    char *buf)
@@ -537,7 +501,7 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 			*val2 = 95874;
 			return IIO_VAL_INT_PLUS_NANO;
 		case IIO_ANGL_VEL:
-			*val = st->fclkin;
+			*val = st->clkin_hz;
 			*val2 = ad2s1210_velocity_scale[st->resolution];
 			return IIO_VAL_FRACTIONAL;
 		default:
@@ -549,8 +513,6 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
-static IIO_DEVICE_ATTR(fclkin, 0644,
-		       ad2s1210_show_fclkin, ad2s1210_store_fclkin, 0);
 static IIO_DEVICE_ATTR(fexcit, 0644,
 		       ad2s1210_show_fexcit,	ad2s1210_store_fexcit, 0);
 static IIO_DEVICE_ATTR(control, 0644,
@@ -599,7 +561,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 };
 
 static struct attribute *ad2s1210_attributes[] = {
-	&iio_dev_attr_fclkin.dev_attr.attr,
 	&iio_dev_attr_fexcit.dev_attr.attr,
 	&iio_dev_attr_control.dev_attr.attr,
 	&iio_dev_attr_bits.dev_attr.attr,
@@ -657,6 +618,24 @@ static const struct iio_info ad2s1210_info = {
 	.attrs = &ad2s1210_attribute_group,
 };
 
+static int ad2s1210_setup_clocks(struct ad2s1210_state *st)
+{
+	struct device *dev = &st->sdev->dev;
+	struct clk *clk;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
+
+	st->clkin_hz = clk_get_rate(clk);
+	if (st->clkin_hz < AD2S1210_MIN_CLKIN || st->clkin_hz > AD2S1210_MAX_CLKIN)
+		return dev_err_probe(dev, -EINVAL,
+				     "clock frequency out of range: %lu\n",
+				     st->clkin_hz);
+
+	return 0;
+}
+
 static int ad2s1210_setup_gpios(struct ad2s1210_state *st)
 {
 	struct spi_device *spi = st->sdev;
@@ -695,6 +674,10 @@ static int ad2s1210_probe(struct spi_device *spi)
 	st->resolution = 12;
 	st->fexcit = AD2S1210_DEF_EXCIT;
 
+	ret = ad2s1210_setup_clocks(st);
+	if (ret < 0)
+		return ret;
+
 	ret = ad2s1210_setup_gpios(st);
 	if (ret < 0)
 		return ret;
@@ -709,13 +692,7 @@ static int ad2s1210_probe(struct spi_device *spi)
 	indio_dev->num_channels = ARRAY_SIZE(ad2s1210_channels);
 	indio_dev->name = spi_get_device_id(spi)->name;
 
-	ret = devm_iio_device_register(&spi->dev, indio_dev);
-	if (ret)
-		return ret;
-
-	st->fclkin = spi->max_speed_hz;
-
-	return 0;
+	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
 static const struct of_device_id ad2s1210_of_match[] = {

-- 
2.42.0

