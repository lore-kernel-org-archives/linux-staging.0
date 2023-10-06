Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19E15AD
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lJDK9Jyx"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bd04558784so1095512a34.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553470; x=1697158270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUOSgD5Wnesa4+fjnvBe7ifVAcJB2uD2jmt8gBsN0qI=;
        b=lJDK9Jyxc/4McfpExMvalbLEWAuOKNPzoumznIMJBX8SLXgV2HFagdjYf0oiGu4ma/
         g2zjKssKrNsF3lp6kbunWK0Y/cUZFvCUFD3t24yd2Os53t1xsURlhfmCcPaxUx5+nZtv
         GTAC2dw16GTd0NJV9HXN4WX8fiYVpwDwODpYd9Vg1eDDhE7v/WkgNNoIcbjKHBgktRuq
         E1Lib7kKBWYXCKKEVnEIASkpl9tLthZAZAl55+n9LU7cW0rklGHbBTKXfEw1KANwt6S/
         6bCYPJSnWJGpD/9n+XoQdp3NGMEdIcdKf6/m14ygewbBOlQbcA0fxdKbnpzdax4xNJPY
         LMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553470; x=1697158270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUOSgD5Wnesa4+fjnvBe7ifVAcJB2uD2jmt8gBsN0qI=;
        b=p2nff1bAx2GVQX2s37Ayidl6Ygyr+pts0qj27qzmM4/EaphktUBuGMhG1QcPda7B+W
         IwVy0eLfQGYNwcnIT2j2ZngqhnrJAVQEJ6xToyXmIs/pABzc9jtmwNaEWrWONa5V0ysE
         d9I134Kw90n5JeuOfRJ+oYQ4h7qU3HCqi6WGcRlFWuvHs8HNQpCNH4wN17GZ6cocALyi
         WbiRktp+Kk6ce8/Ta3Xqj+dL/hFuU51fzSMKjGVZFMB2vVd9w68jC9X71lPcpa37UTFc
         OSDFUp/sIB5VFbpnj/jRwMQvbO41vJLBdBsc9cfKEFbahHP8PvFevjplUotCNIUU5TZd
         +l1A==
X-Gm-Message-State: AOJu0Yzg+az4VtFJzeFD2gxfwpI4RiM8b8gNizsoLIqCJ9Z2w+myKF8X
	GY9fUdkEE85T00/4tP4XV/k9CA==
X-Google-Smtp-Source: AGHT+IEqQxVuz4szBM5r2U8kWRslQosr+UpgndYLxnyVdb0qha7UINJDHbS1oFerR97nEHVwcsbziw==
X-Received: by 2002:a05:6870:6111:b0:1d0:e0c9:f33d with SMTP id s17-20020a056870611100b001d0e0c9f33dmr7967874oae.46.1696553470486;
        Thu, 05 Oct 2023 17:51:10 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:10 -0700 (PDT)
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
Subject: [PATCH v4 07/17] staging: iio: resolver: ad2s1210: convert LOT threshold attrs to event attrs
Date: Thu,  5 Oct 2023 19:50:24 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-7-ec00746840fc@baylibre.com>
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

The AD2S1210 monitors the internal error signal (difference between
estimated angle and measured angle) to determine a loss of position
tracking (LOT) condition. When the error value exceeds a threshold, a
fault is triggered. This threshold is user-configurable.

This patch converts the custom lot_high_thrd and lot_low_thrd attributes
in the ad2s1210 driver to standard event attributes. This will allow
tooling to be able to expose these in a generic way.

Since the low threshold determines the hysteresis, it requires some
special handling to expose the difference between the high and low
register values as the hysteresis instead of exposing the low register
value directly.

The attributes also return the values in radians now as required by the
ABI.

Actually emitting the fault event will be done in a later patch.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes:
* Fixed missing static qualifier on attribute definition.

v3 changes: This is a new patch in v3

 drivers/staging/iio/resolver/ad2s1210.c | 191 ++++++++++++++++++++++++++++++--
 1 file changed, 183 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 4d651a2d0f38..12437f697f79 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -443,6 +443,123 @@ static int ad2s1210_set_phase_lock_range(struct ad2s1210_state *st,
 	return ret;
 }
 
+/* map resolution to microradians/LSB for LOT registers */
+static const int ad2s1210_lot_threshold_urad_per_lsb[] = {
+	6184, /* 10-bit: ~0.35 deg/LSB, 45 deg max */
+	2473, /* 12-bit: ~0.14 deg/LSB, 18 deg max */
+	1237, /* 14-bit: ~0.07 deg/LSB, 9 deg max */
+	1237, /* 16-bit: same as 14-bit */
+};
+
+static int ad2s1210_get_lot_high_threshold(struct ad2s1210_state *st,
+					   int *val, int *val2)
+{
+	unsigned int reg_val;
+	int ret;
+
+	mutex_lock(&st->lock);
+	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &reg_val);
+	mutex_unlock(&st->lock);
+
+	if (ret < 0)
+		return ret;
+
+	*val = 0;
+	*val2 = reg_val * ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
+	return IIO_VAL_INT_PLUS_MICRO;
+}
+
+static int ad2s1210_set_lot_high_threshold(struct ad2s1210_state *st,
+					   int val, int val2)
+{
+	unsigned int high_reg_val, low_reg_val, hysteresis;
+	int ret;
+
+	/* all valid values are between 0 and pi/4 radians */
+	if (val != 0)
+		return -EINVAL;
+
+	mutex_lock(&st->lock);
+	/*
+	 * We need to read both high and low registers first so we can preserve
+	 * the hysteresis.
+	 */
+	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &high_reg_val);
+	if (ret < 0)
+		goto error_ret;
+
+	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_LOW_THRD, &low_reg_val);
+	if (ret < 0)
+		goto error_ret;
+
+	hysteresis = high_reg_val - low_reg_val;
+	high_reg_val = val2 / ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
+	low_reg_val = high_reg_val - hysteresis;
+
+	ret = regmap_write(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, high_reg_val);
+	if (ret < 0)
+		goto error_ret;
+
+	ret = regmap_write(st->regmap, AD2S1210_REG_LOT_LOW_THRD, low_reg_val);
+
+error_ret:
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
+static int ad2s1210_get_lot_low_threshold(struct ad2s1210_state *st,
+					  int *val, int *val2)
+{
+	unsigned int high_reg_val, low_reg_val;
+	int ret;
+
+	mutex_lock(&st->lock);
+	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &high_reg_val);
+	if (ret < 0)
+		goto error_ret;
+
+	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_LOW_THRD, &low_reg_val);
+
+error_ret:
+	mutex_unlock(&st->lock);
+
+	if (ret < 0)
+		return ret;
+
+	/* sysfs value is hysteresis rather than actual low value */
+	*val = 0;
+	*val2 = (high_reg_val - low_reg_val) *
+		ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
+	return IIO_VAL_INT_PLUS_MICRO;
+}
+
+static int ad2s1210_set_lot_low_threshold(struct ad2s1210_state *st,
+					  int val, int val2)
+{
+	unsigned int reg_val, hysteresis;
+	int ret;
+
+	/* all valid values are between 0 and pi/4 radians */
+	if (val != 0)
+		return -EINVAL;
+
+	hysteresis = val2 / ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
+
+	mutex_lock(&st->lock);
+	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &reg_val);
+	if (ret < 0)
+		goto error_ret;
+
+	ret = regmap_write(st->regmap, AD2S1210_REG_LOT_LOW_THRD,
+			   reg_val - hysteresis);
+
+error_ret:
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
 static int ad2s1210_get_excitation_frequency(struct ad2s1210_state *st, int *val)
 {
 	unsigned int reg_val;
@@ -608,12 +725,19 @@ static IIO_DEVICE_ATTR(dos_rst_max_thrd, 0644,
 static IIO_DEVICE_ATTR(dos_rst_min_thrd, 0644,
 		       ad2s1210_show_reg, ad2s1210_store_reg,
 		       AD2S1210_REG_DOS_RST_MIN_THRD);
-static IIO_DEVICE_ATTR(lot_high_thrd, 0644,
-		       ad2s1210_show_reg, ad2s1210_store_reg,
-		       AD2S1210_REG_LOT_HIGH_THRD);
-static IIO_DEVICE_ATTR(lot_low_thrd, 0644,
-		       ad2s1210_show_reg, ad2s1210_store_reg,
-		       AD2S1210_REG_LOT_LOW_THRD);
+
+static const struct iio_event_spec ad2s1210_position_event_spec[] = {
+	{
+		/* Tracking error exceeds LOT threshold fault. */
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_separate =
+			/* Loss of tracking high threshold. */
+			BIT(IIO_EV_INFO_VALUE) |
+			/* Loss of tracking low threshold. */
+			BIT(IIO_EV_INFO_HYSTERESIS),
+	},
+};
 
 static const struct iio_event_spec ad2s1210_phase_event_spec[] = {
 	{
@@ -657,6 +781,15 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 	},
 	IIO_CHAN_SOFT_TIMESTAMP(2),
+	{
+		/* used to configure LOT thresholds and get tracking error */
+		.type = IIO_ANGL,
+		.indexed = 1,
+		.channel = 1,
+		.scan_index = -1,
+		.event_spec = ad2s1210_position_event_spec,
+		.num_event_specs = ARRAY_SIZE(ad2s1210_position_event_spec),
+	},
 	{
 		/* used to configure phase lock range and get phase lock error */
 		.type = IIO_PHASE,
@@ -684,8 +817,6 @@ static struct attribute *ad2s1210_attributes[] = {
 	&iio_dev_attr_dos_mis_thrd.dev_attr.attr,
 	&iio_dev_attr_dos_rst_max_thrd.dev_attr.attr,
 	&iio_dev_attr_dos_rst_min_thrd.dev_attr.attr,
-	&iio_dev_attr_lot_high_thrd.dev_attr.attr,
-	&iio_dev_attr_lot_low_thrd.dev_attr.attr,
 	NULL,
 };
 
@@ -693,14 +824,40 @@ static const struct attribute_group ad2s1210_attribute_group = {
 	.attrs = ad2s1210_attributes,
 };
 
+static ssize_t
+in_angl1_thresh_rising_value_available_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
+	int step = ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
+
+	return sysfs_emit(buf, "[0 0.%06d 0.%06d]\n", step, step * 0x7F);
+}
+
+static ssize_t
+in_angl1_thresh_rising_hysteresis_available_show(struct device *dev,
+						 struct device_attribute *attr,
+						 char *buf)
+{
+	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
+	int step = ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
+
+	return sysfs_emit(buf, "[0 0.%06d 0.%06d]\n", step, step * 0x7F);
+}
+
 static IIO_CONST_ATTR(in_phase0_mag_rising_value_available,
 		      __stringify(PHASE_44_DEG_TO_RAD_INT) "."
 		      __stringify(PHASE_44_DEG_TO_RAD_MICRO) " "
 		      __stringify(PHASE_360_DEG_TO_RAD_INT) "."
 		      __stringify(PHASE_360_DEG_TO_RAD_MICRO));
+static IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_value_available, 0);
+static IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_hysteresis_available, 0);
 
 static struct attribute *ad2s1210_event_attributes[] = {
 	&iio_const_attr_in_phase0_mag_rising_value_available.dev_attr.attr,
+	&iio_dev_attr_in_angl1_thresh_rising_value_available.dev_attr.attr,
+	&iio_dev_attr_in_angl1_thresh_rising_hysteresis_available.dev_attr.attr,
 	NULL,
 };
 
@@ -742,6 +899,15 @@ static int ad2s1210_read_event_value(struct iio_dev *indio_dev,
 	struct ad2s1210_state *st = iio_priv(indio_dev);
 
 	switch (chan->type) {
+	case IIO_ANGL:
+		switch (info) {
+		case IIO_EV_INFO_VALUE:
+			return ad2s1210_get_lot_high_threshold(st, val, val2);
+		case IIO_EV_INFO_HYSTERESIS:
+			return ad2s1210_get_lot_low_threshold(st, val, val2);
+		default:
+			return -EINVAL;
+		}
 	case IIO_PHASE:
 		return ad2s1210_get_phase_lock_range(st, val, val2);
 	default:
@@ -759,6 +925,15 @@ static int ad2s1210_write_event_value(struct iio_dev *indio_dev,
 	struct ad2s1210_state *st = iio_priv(indio_dev);
 
 	switch (chan->type) {
+	case IIO_ANGL:
+		switch (info) {
+		case IIO_EV_INFO_VALUE:
+			return ad2s1210_set_lot_high_threshold(st, val, val2);
+		case IIO_EV_INFO_HYSTERESIS:
+			return ad2s1210_set_lot_low_threshold(st, val, val2);
+		default:
+			return -EINVAL;
+		}
 	case IIO_PHASE:
 		return ad2s1210_set_phase_lock_range(st, val, val2);
 	default:

-- 
2.42.0

