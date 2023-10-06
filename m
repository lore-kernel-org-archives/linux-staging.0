Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9910F9
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dbfUIijK"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1dc863efb61so972549fac.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553467; x=1697158267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcuCCN2lfputhsGB+Q9eZZKcfZbyp+G9GeySzJ04DdM=;
        b=dbfUIijK51xXY7MuRwFs+Yhtc3Dqw8/YNB+4ARtS4+xBsP+ASs7itaSbABFuMuezgH
         Yf7pJZOBYVQNVAqHESBF+6Ksxo7mQWSSaP8drnEefUa09Kd/LC094Cj83UtfYznMSBD5
         zDzKfarTB8rcMGtxpwFLX1RKONk9PpZ9z1j8DapK0yZzNvBRBMv2NzpdquimCCsRvrXh
         rtqb3yAFMnodpXN1tg3MEUNuyZcY3+Kqy9j+g9S68y6VXTot+tZT2Bh7p6ZefUXSG8Gm
         J6T7FmKyLNQlpvYsK5xN2YdE7+vFXLZ8LkUXxS7WBXoZEvWqeuSVtOVXJ2XeRpdg/924
         D4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553467; x=1697158267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcuCCN2lfputhsGB+Q9eZZKcfZbyp+G9GeySzJ04DdM=;
        b=k1VkM5EdihgMkilqyF08uwowQ++G2Gj+6xEAjtp9fV1PeNVt6A2gCfsyEQnly4b9i7
         uNfwqHxa8AnVFJY4NoAjsy2qXJcqwJzO/NWskjq3eCoG5caM9gV+WWUkken5qJjwmi6G
         MbgMNdFOCpxc9fNHJLFgOd2kayrwuM7ycXaJYFnuqF/YYd4UNJtDPdeEOUqyvvNX+g/1
         e9y8NzDZfLMSxDDHiGzv76uRoQ5CLDP+wKfgeHJ6wpgg8hZGG4RHKo17qRFieplHjELT
         LTRX5hPVaNCn1gIWOFU1eh6BoG75s04ZVRdpSV/K5JaQIXIM+iE2FyrytGNuHO+MsBaD
         d60g==
X-Gm-Message-State: AOJu0YyoueNlMcBbX/jw+Z/hNTpsWFywOHuspI9ICw58d94lZYp2aYwL
	+L/9Xe5KzT/4r0xRaeju+PwyguCATNUokcIZWx9EIQ==
X-Google-Smtp-Source: AGHT+IEsI0o2iLo7j6zjs4i8qHzbW0v6d9TdPnxj1yYFbOlV3qSk7LM9o+UjPFQuvtgdNoN44RmSnw==
X-Received: by 2002:a05:6871:7a7:b0:1bb:c50d:7437 with SMTP id o39-20020a05687107a700b001bbc50d7437mr7539061oap.53.1696553467487;
        Thu, 05 Oct 2023 17:51:07 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.06
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
Subject: [PATCH v4 03/17] staging: iio: resolver: ad2s1210: convert fexcit to channel attribute
Date: Thu,  5 Oct 2023 19:50:20 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-3-ec00746840fc@baylibre.com>
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

The ad2s1210 driver has a device-specific attribute `fexcit` for setting
the frequency of the excitation output. This converts it to a channel in
order to use standard IIO ABI.

The excitation frequency is an analog output that generates a sine wave.
Only the frequency is configurable. According to the datasheet, the
specified range of the excitation frequency is from 2 kHz to 20 kHz and
can be set in increments of 250 Hz.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes: None (rebased)

v3 changes:
* This is a new patch in v3 instead of "iio: resolver: ad2s1210: rename fexcit
  attribute"


 drivers/staging/iio/resolver/ad2s1210.c | 123 ++++++++++++++++++--------------
 1 file changed, 71 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index af063eb25e9c..0c7772725330 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -227,54 +227,6 @@ static int ad2s1210_set_resolution_gpios(struct ad2s1210_state *st,
 				     bitmap);
 }
 
-static ssize_t ad2s1210_show_fexcit(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned int value;
-	u16 fexcit;
-	int ret;
-
-	mutex_lock(&st->lock);
-	ret = regmap_read(st->regmap, AD2S1210_REG_EXCIT_FREQ, &value);
-	if (ret < 0)
-		goto error_ret;
-
-	fexcit = value * st->clkin_hz / (1 << 15);
-
-	ret = sprintf(buf, "%u\n", fexcit);
-
-error_ret:
-	mutex_unlock(&st->lock);
-	return ret;
-}
-
-static ssize_t ad2s1210_store_fexcit(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t len)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	u16 fexcit;
-	int ret;
-
-	ret = kstrtou16(buf, 10, &fexcit);
-	if (ret < 0 || fexcit < AD2S1210_MIN_EXCIT || fexcit > AD2S1210_MAX_EXCIT)
-		return -EINVAL;
-
-	mutex_lock(&st->lock);
-	ret = ad2s1210_reinit_excitation_frequency(st, fexcit);
-	if (ret < 0)
-		goto error_ret;
-
-	ret = len;
-
-error_ret:
-	mutex_unlock(&st->lock);
-
-	return ret;
-}
-
 static ssize_t ad2s1210_show_resolution(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -478,6 +430,38 @@ static int ad2s1210_set_hysteresis(struct ad2s1210_state *st, int val)
 	return ret;
 }
 
+static int ad2s1210_get_excitation_frequency(struct ad2s1210_state *st, int *val)
+{
+	unsigned int reg_val;
+	int ret;
+
+	mutex_lock(&st->lock);
+	ret = regmap_read(st->regmap, AD2S1210_REG_EXCIT_FREQ, &reg_val);
+	if (ret < 0)
+		goto error_ret;
+
+	*val = reg_val * st->clkin_hz / (1 << 15);
+	ret = IIO_VAL_INT;
+
+error_ret:
+	mutex_unlock(&st->lock);
+	return ret;
+}
+
+static int ad2s1210_set_excitation_frequency(struct ad2s1210_state *st, int val)
+{
+	int ret;
+
+	if (val < AD2S1210_MIN_EXCIT || val > AD2S1210_MAX_EXCIT)
+		return -EINVAL;
+
+	mutex_lock(&st->lock);
+	ret = ad2s1210_reinit_excitation_frequency(st, val);
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
 static const int ad2s1210_velocity_scale[] = {
 	17089132, /* 8.192MHz / (2*pi * 2500 / 2^15) */
 	42722830, /* 8.192MHz / (2*pi * 1000 / 2^15) */
@@ -510,6 +494,13 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 		default:
 			return -EINVAL;
 		}
+	case IIO_CHAN_INFO_FREQUENCY:
+		switch (chan->type) {
+		case IIO_ALTVOLTAGE:
+			return ad2s1210_get_excitation_frequency(st, val);
+		default:
+			return -EINVAL;
+		}
 	case IIO_CHAN_INFO_HYSTERESIS:
 		switch (chan->type) {
 		case IIO_ANGL:
@@ -527,9 +518,24 @@ static int ad2s1210_read_avail(struct iio_dev *indio_dev,
 			       const int **vals, int *type,
 			       int *length, long mask)
 {
+	static const int excitation_frequency_available[] = {
+		AD2S1210_MIN_EXCIT,
+		250, /* step */
+		AD2S1210_MAX_EXCIT,
+	};
+
 	struct ad2s1210_state *st = iio_priv(indio_dev);
 
 	switch (mask) {
+	case IIO_CHAN_INFO_FREQUENCY:
+		switch (chan->type) {
+		case IIO_ALTVOLTAGE:
+			*type = IIO_VAL_INT;
+			*vals = excitation_frequency_available;
+			return IIO_AVAIL_RANGE;
+		default:
+			return -EINVAL;
+		}
 	case IIO_CHAN_INFO_HYSTERESIS:
 		switch (chan->type) {
 		case IIO_ANGL:
@@ -552,6 +558,13 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 	struct ad2s1210_state *st = iio_priv(indio_dev);
 
 	switch (mask) {
+	case IIO_CHAN_INFO_FREQUENCY:
+		switch (chan->type) {
+		case IIO_ALTVOLTAGE:
+			return ad2s1210_set_excitation_frequency(st, val);
+		default:
+			return -EINVAL;
+		}
 	case IIO_CHAN_INFO_HYSTERESIS:
 		switch (chan->type) {
 		case IIO_ANGL:
@@ -564,8 +577,6 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 	}
 }
 
-static IIO_DEVICE_ATTR(fexcit, 0644,
-		       ad2s1210_show_fexcit,	ad2s1210_store_fexcit, 0);
 static IIO_DEVICE_ATTR(bits, 0644,
 		       ad2s1210_show_resolution, ad2s1210_store_resolution, 0);
 static IIO_DEVICE_ATTR(fault, 0644,
@@ -609,11 +620,19 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.channel = 0,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 				      BIT(IIO_CHAN_INFO_SCALE),
-	}
+	}, {
+		/* excitation frequency output */
+		.type = IIO_ALTVOLTAGE,
+		.indexed = 1,
+		.channel = 0,
+		.output = 1,
+		.scan_index = -1,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_FREQUENCY),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_FREQUENCY),
+	},
 };
 
 static struct attribute *ad2s1210_attributes[] = {
-	&iio_dev_attr_fexcit.dev_attr.attr,
 	&iio_dev_attr_bits.dev_attr.attr,
 	&iio_dev_attr_fault.dev_attr.attr,
 	&iio_dev_attr_los_thrd.dev_attr.attr,

-- 
2.42.0

