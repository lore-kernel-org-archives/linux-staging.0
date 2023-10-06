Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA741101
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YrnoPH7U"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1dd54aca17cso1114981fac.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553468; x=1697158268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcsnKCyV7FUD2bxOc/QLihdDu9Oktlg7xQqBtTwEdtg=;
        b=YrnoPH7UcDUeIvnZAYSNdchXntJMsFcK1Gr1jKDx9VmWt+dVowjPFy4F9tcS5Dzugy
         ETfyy4YMKDFfbufAxZPaoQOXK2OfzIR8cKxBUpB4p23t9DWc56gTUfAA1R57HsyDo8mb
         SWsudtZbiD1l0U4Q1Iff4XX0D07MqQ+xxwmbDHk3NQlqPMg6O9gVgYo2CrlbRkU3yRvm
         S/xmMoTBSrg4fkfO/oUw1IpqtnynwZjdMUsOGeqSKQe3FSELLW/mxwY27SIW+mRvLgMG
         eYPucEyw9K7TO36d6BCv6OIuLA0nMgoK06K6WrLqLnkvEofReYGBQVpW+TU6uL6el7Il
         Oh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553468; x=1697158268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcsnKCyV7FUD2bxOc/QLihdDu9Oktlg7xQqBtTwEdtg=;
        b=BTQekyTO8ZWJQw2brZCl5Hy7cWAt07K7H6XbPFg+i6+i+guXMYeTScJAui7l1vnBBw
         Eatc/rjVfVY4mX+wpeo8sSNn62x2N6j7DGp40B+AuYCSpeysXG3pT0m4OsEG7b0zj+od
         uxMGMlAzZVpbQd38Q2VVizBQoEyXpp6tdQ++NNyK5FGMO0Jv29k2tYiZUFKWxT4aWUnF
         dyH4e8X53yEUpme8oOSuwolwU7LZbekyWye1fLEclGpisyzXeeNGvdK59sOF8GV/1HOF
         gvGmIdPfD2Sp5NK63/T09YM2Tpxzzo6ruwzi43hLLhFmX4WGr1ja82aoOaZxBmq8whiX
         y4ag==
X-Gm-Message-State: AOJu0YytApys7TjIn8f7BPiPJr8Y5FVSo/edZdnJkD/JGE1+RxZqGnAc
	UGYSWAMgWs6nk9byMyrN+Wcm4w==
X-Google-Smtp-Source: AGHT+IFgcenGDIn13ZEs+nikVmRmdtMGfaAs87fHiz0ZJR8vQVZgqrWT3378hvD8KcndMmoGc7nKDg==
X-Received: by 2002:a05:6870:8a2a:b0:1dc:f4de:46b8 with SMTP id p42-20020a0568708a2a00b001dcf4de46b8mr7418978oaq.59.1696553468248;
        Thu, 05 Oct 2023 17:51:08 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:07 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/17] staging: iio: resolver: ad2s1210: convert resolution to devicetree property
Date: Thu,  5 Oct 2023 19:50:21 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-4-ec00746840fc@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

Selecting the resolution was implemented as the `bits` sysfs attribute.
However, the selection of the resolution depends on how the hardware
is wired and the specific application, so this is rather a job for
devicetree to describe.

A new devicetree property `assigned-resolution-bits` to specify the
resolution required for each chip is added and the `bits` sysfs
attribute is removed.

Since the resolution is now supplied by a devicetree property, the
resolution-gpios are now optional and we can allow for the case where
the resolution pins on the AD2S1210 are hard-wired instead of requiring
them to be connected to gpios.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes:
* Fixed devicetree property name in commit message.
* Reworked handling of hysteresis_available to handle
  assigned-resolution-bits != 16.

v3 changes:
* Fixed multiline comment style.

 drivers/staging/iio/resolver/ad2s1210.c | 150 +++++++++++++++-----------------
 1 file changed, 71 insertions(+), 79 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 0c7772725330..66ef35fbb6fe 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -63,6 +63,13 @@ enum ad2s1210_mode {
 	MOD_CONFIG = 0b11,
 };
 
+enum ad2s1210_resolution {
+	AD2S1210_RES_10 = 0b00,
+	AD2S1210_RES_12 = 0b01,
+	AD2S1210_RES_14 = 0b10,
+	AD2S1210_RES_16 = 0b11,
+};
+
 struct ad2s1210_state {
 	struct mutex lock;
 	struct spi_device *sdev;
@@ -70,15 +77,14 @@ struct ad2s1210_state {
 	struct gpio_desc *sample_gpio;
 	/** GPIO pins connected to A0 and A1 lines. */
 	struct gpio_descs *mode_gpios;
-	/** GPIO pins connected to RES0 and RES1 lines. */
-	struct gpio_descs *resolution_gpios;
 	/** Used to access config registers. */
 	struct regmap *regmap;
 	/** The external oscillator frequency in Hz. */
 	unsigned long clkin_hz;
 	/** Available raw hysteresis values based on resolution. */
 	int hysteresis_available[2];
-	u8 resolution;
+	/** The selected resolution */
+	enum ad2s1210_resolution resolution;
 	/** For reading raw sample value via SPI. */
 	__be16 sample __aligned(IIO_DMA_MINALIGN);
 	/** SPI transmit buffer. */
@@ -215,63 +221,6 @@ static int ad2s1210_reinit_excitation_frequency(struct ad2s1210_state *st,
 	return regmap_write(st->regmap, AD2S1210_REG_SOFT_RESET, 0);
 }
 
-static int ad2s1210_set_resolution_gpios(struct ad2s1210_state *st,
-					 u8 resolution)
-{
-	struct gpio_descs *gpios = st->resolution_gpios;
-	DECLARE_BITMAP(bitmap, 2);
-
-	bitmap[0] = (resolution - 10) >> 1;
-
-	return gpiod_set_array_value(gpios->ndescs, gpios->desc, gpios->info,
-				     bitmap);
-}
-
-static ssize_t ad2s1210_show_resolution(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-
-	return sprintf(buf, "%d\n", st->resolution);
-}
-
-static ssize_t ad2s1210_store_resolution(struct device *dev,
-					 struct device_attribute *attr,
-					 const char *buf, size_t len)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned char data;
-	unsigned char udata;
-	int ret;
-
-	ret = kstrtou8(buf, 10, &udata);
-	if (ret || udata < 10 || udata > 16) {
-		dev_err(dev, "ad2s1210: resolution out of range\n");
-		return -EINVAL;
-	}
-
-	data = (udata - 10) >> 1;
-
-	mutex_lock(&st->lock);
-	ret = regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
-				 AD2S1210_SET_RES, data);
-	if (ret < 0)
-		goto error_ret;
-
-	ret = ad2s1210_set_resolution_gpios(st, udata);
-	if (ret < 0)
-		goto error_ret;
-
-	st->resolution = udata;
-	st->hysteresis_available[1] = 1 << (16 - st->resolution);
-	ret = len;
-
-error_ret:
-	mutex_unlock(&st->lock);
-	return ret;
-}
-
 /* read the fault register since last sample */
 static ssize_t ad2s1210_show_fault(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -413,7 +362,7 @@ static int ad2s1210_get_hysteresis(struct ad2s1210_state *st, int *val)
 	if (ret < 0)
 		return ret;
 
-	*val = ret << (16 - st->resolution);
+	*val = ret << (2 * (AD2S1210_RES_16 - st->resolution));
 	return IIO_VAL_INT;
 }
 
@@ -577,8 +526,6 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 	}
 }
 
-static IIO_DEVICE_ATTR(bits, 0644,
-		       ad2s1210_show_resolution, ad2s1210_store_resolution, 0);
 static IIO_DEVICE_ATTR(fault, 0644,
 		       ad2s1210_show_fault, ad2s1210_clear_fault, 0);
 
@@ -633,7 +580,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 };
 
 static struct attribute *ad2s1210_attributes[] = {
-	&iio_dev_attr_bits.dev_attr.attr,
 	&iio_dev_attr_fault.dev_attr.attr,
 	&iio_dev_attr_los_thrd.dev_attr.attr,
 	&iio_dev_attr_dos_ovr_thrd.dev_attr.attr,
@@ -655,15 +601,12 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 	int ret;
 
 	mutex_lock(&st->lock);
-	ret = ad2s1210_set_resolution_gpios(st, st->resolution);
-	if (ret < 0)
-		goto error_ret;
 
 	/* Use default config register value plus resolution from devicetree. */
 	data = FIELD_PREP(AD2S1210_PHASE_LOCK_RANGE_44, 1);
 	data |= FIELD_PREP(AD2S1210_ENABLE_HYSTERESIS, 1);
 	data |= FIELD_PREP(AD2S1210_SET_ENRES, 0x3);
-	data |= FIELD_PREP(AD2S1210_SET_RES, (st->resolution - 10) >> 1);
+	data |= FIELD_PREP(AD2S1210_SET_RES, st->resolution);
 
 	ret = regmap_write(st->regmap, AD2S1210_REG_CONTROL, data);
 	if (ret < 0)
@@ -703,6 +646,35 @@ static const struct iio_info ad2s1210_info = {
 	.debugfs_reg_access = &ad2s1210_debugfs_reg_access,
 };
 
+static int ad2s1210_setup_properties(struct ad2s1210_state *st)
+{
+	struct device *dev = &st->sdev->dev;
+	u32 val;
+	int ret;
+
+	ret = device_property_read_u32(dev, "assigned-resolution-bits", &val);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+			"failed to read assigned-resolution-bits property\n");
+
+	if (val < 10 || val > 16)
+		return dev_err_probe(dev, -EINVAL,
+				     "resolution out of range: %u\n", val);
+
+	st->resolution = (val - 10) >> 1;
+	/*
+	 * These are values that correlate to the hysteresis bit in the Control
+	 * register. 0 = disabled, 1 = enabled. When enabled, the actual
+	 * hysteresis is +/- 1 LSB of the raw position value. Which bit is the
+	 * LSB depends on the specified resolution.
+	 */
+	st->hysteresis_available[0] = 0;
+	st->hysteresis_available[1] = 1 << (2 * (AD2S1210_RES_16 -
+						 st->resolution));
+
+	return 0;
+}
+
 static int ad2s1210_setup_clocks(struct ad2s1210_state *st)
 {
 	struct device *dev = &st->sdev->dev;
@@ -724,6 +696,9 @@ static int ad2s1210_setup_clocks(struct ad2s1210_state *st)
 static int ad2s1210_setup_gpios(struct ad2s1210_state *st)
 {
 	struct device *dev = &st->sdev->dev;
+	struct gpio_descs *resolution_gpios;
+	DECLARE_BITMAP(bitmap, 2);
+	int ret;
 
 	/* should not be sampling on startup */
 	st->sample_gpio = devm_gpiod_get(dev, "sample", GPIOD_OUT_LOW);
@@ -741,16 +716,32 @@ static int ad2s1210_setup_gpios(struct ad2s1210_state *st)
 		return dev_err_probe(dev, -EINVAL,
 				     "requires exactly 2 mode-gpios\n");
 
-	/* both pins high means that we start with 16-bit resolution */
-	st->resolution_gpios = devm_gpiod_get_array(dev, "resolution",
-						    GPIOD_OUT_HIGH);
-	if (IS_ERR(st->resolution_gpios))
-		return dev_err_probe(dev, PTR_ERR(st->resolution_gpios),
+	/*
+	 * If resolution gpios are provided, they get set to the required
+	 * resolution, otherwise it is assumed the RES0 and RES1 pins are
+	 * hard-wired to match the resolution indicated in the devicetree.
+	 */
+	resolution_gpios = devm_gpiod_get_array_optional(dev, "resolution",
+							 GPIOD_ASIS);
+	if (IS_ERR(resolution_gpios))
+		return dev_err_probe(dev, PTR_ERR(resolution_gpios),
 				     "failed to request resolution GPIOs\n");
 
-	if (st->resolution_gpios->ndescs != 2)
-		return dev_err_probe(dev, -EINVAL,
-				     "requires exactly 2 resolution-gpios\n");
+	if (resolution_gpios) {
+		if (resolution_gpios->ndescs != 2)
+			return dev_err_probe(dev, -EINVAL,
+				      "requires exactly 2 resolution-gpios\n");
+
+		bitmap[0] = st->resolution;
+
+		ret = gpiod_set_array_value(resolution_gpios->ndescs,
+					    resolution_gpios->desc,
+					    resolution_gpios->info,
+					    bitmap);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "failed to set resolution gpios\n");
+	}
 
 	return 0;
 }
@@ -814,9 +805,10 @@ static int ad2s1210_probe(struct spi_device *spi)
 
 	mutex_init(&st->lock);
 	st->sdev = spi;
-	st->resolution = 12;
-	st->hysteresis_available[0] = 0;
-	st->hysteresis_available[1] = 1 << (16 - st->resolution);
+
+	ret = ad2s1210_setup_properties(st);
+	if (ret < 0)
+		return ret;
 
 	ret = ad2s1210_setup_clocks(st);
 	if (ret < 0)

-- 
2.42.0

