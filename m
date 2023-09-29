Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F38366660
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:26:10 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57d086365f7so3021800eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008369; x=1696613169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjp4zlYAfXueLRTOb9SzdTm0DlQoXc51AxBoUcNT5Ag=;
        b=ufAsoxHMTAfnwqa134EgUM2h2AEKanQjZx/YRaPHK73w4OB2LuGCL8xIB5p2HI1LMx
         n32mM0KCTrww1O9hhwQaK64cQVbN+AV/092AOTvfyWlma3MAl60s6eZQD4/EfcMriaXe
         d4VEjxLNH9/2ky7nYXN6tEHbidY2m3F+RIwl6e+1z3IbLpO3FeKY93bUP69om6Xuas0M
         g/pe2n9EkAoevBevfXLmjjei1KtaDzYEjDVxaObwuVHuvdC3lusLnxUJKkRu4qYcEYOB
         YZRfieUElXYAK/zBMEMSa7YjBctVSbOHPAUHA/HpfjmzQc1n7Zr1ATIGgAl5GFn3eJhy
         sUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008369; x=1696613169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjp4zlYAfXueLRTOb9SzdTm0DlQoXc51AxBoUcNT5Ag=;
        b=jbb5sfLMdNtnWaSbXbjbZTjSWFWXD9OZxgVX1wm7JO7SgN44jrV5T6XWhTYfHMES78
         5+xPOvkodBFXN0PeJ4Z/KFnZckTNjiLXLS9zgyNpx7+Apl151PNqfzYkGjI4QrYa7LLI
         lGI3QEomyWiqNdZiyxxLWU+krc9RqHIvDHBg8oJG10Ce6TIum9VslQ4WmvbJunoMxK0/
         a4qjYYFTZRy8Xhwym2HIX4jEtbepgcF1X0bixrmDLlxlBl+4thcvgELwQ7Fg2irmraQx
         KQ1JN12Yw+kAFgricUfYW+cOORNIOnphCtywlNdTHZur9y7skpl1dl/ct9vBE6Qo4R6v
         5fLQ==
X-Gm-Message-State: AOJu0Yy0PjELk8lPZJSlcZTpDeFxt2hhRG5yf7HuGmGhIxK3Hw0UHIic
	6z5MwajjLdH0UR+LriVFMoTegg==
X-Google-Smtp-Source: AGHT+IHgE6PNYnsw8ueNH55eOSsS1cCNUnv9TnpRSMub7V6uXccgX0v4ZRxsXqSRO1Ll40dV7jTjSw==
X-Received: by 2002:a4a:2756:0:b0:573:bf68:8dbc with SMTP id w22-20020a4a2756000000b00573bf688dbcmr4928939oow.7.1696008369545;
        Fri, 29 Sep 2023 10:26:09 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:26:09 -0700 (PDT)
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
Subject: [PATCH v3 25/27] staging: iio: resolver: ad2s1210: rename DOS reset min/max attrs
Date: Fri, 29 Sep 2023 12:23:30 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-25-fa4364281745@baylibre.com>
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

The AD2S1210 has a programmable threshold for the degradation of signal
(DOS) mismatch fault. This fault is triggered when the difference in
amplitude between the sine and cosine inputs exceeds the threshold.

The DOS reset min/max registers on the chip provide initial values
for internal tracking of the min/max of the monitor signal after the
fault register is cleared.

This patch converts the custom device DOS reset min/max threshold
attributes custom event attributes on the monitor signal channel.

The attributes now use millivolts instead of the raw register value in
accordance with the IIO ABI.

Emitting the event will be implemented in a later patch.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes: This is a new patch in v3

 .../Documentation/sysfs-bus-iio-resolver-ad2s1210  | 27 ++++++
 drivers/staging/iio/resolver/ad2s1210.c            | 99 ++++++++++++----------
 2 files changed, 82 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210 b/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210
new file mode 100644
index 000000000000..ea75881b0c77
--- /dev/null
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210
@@ -0,0 +1,27 @@
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0-altvoltage1_thresh_rising_reset_max
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Reset Maximum
+		Threshold value in millivolts. Writing sets the value.
+
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0-altvoltage1_thresh_rising_reset_max_available
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the allowable voltage range for
+		in_altvoltage0-altvoltage1_thresh_rising_reset_max.
+
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0-altvoltage1_thresh_rising_reset_min
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Reset Minimum
+		Threshold value in millivolts. Writing sets the value.
+
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0-altvoltage1_thresh_rising_reset_min_available
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the allowable voltage range for
+		in_altvoltage0-altvoltage1_thresh_rising_reset_min.
diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index aa14edbe8a77..e1c95ec73545 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -283,41 +283,6 @@ static ssize_t ad2s1210_clear_fault(struct device *dev,
 	return ret < 0 ? ret : len;
 }
 
-static ssize_t ad2s1210_show_reg(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	struct iio_dev_attr *iattr = to_iio_dev_attr(attr);
-	unsigned int value;
-	int ret;
-
-	mutex_lock(&st->lock);
-	ret = regmap_read(st->regmap, iattr->address, &value);
-	mutex_unlock(&st->lock);
-
-	return ret < 0 ? ret : sprintf(buf, "%d\n", value);
-}
-
-static ssize_t ad2s1210_store_reg(struct device *dev,
-				  struct device_attribute *attr,
-				  const char *buf, size_t len)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned char data;
-	int ret;
-	struct iio_dev_attr *iattr = to_iio_dev_attr(attr);
-
-	ret = kstrtou8(buf, 10, &data);
-	if (ret)
-		return -EINVAL;
-
-	mutex_lock(&st->lock);
-	ret = regmap_write(st->regmap, iattr->address, data);
-	mutex_unlock(&st->lock);
-	return ret < 0 ? ret : len;
-}
-
 static int ad2s1210_single_conversion(struct ad2s1210_state *st,
 				      struct iio_chan_spec const *chan,
 				      int *val)
@@ -743,13 +708,6 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 static IIO_DEVICE_ATTR(fault, 0644,
 		       ad2s1210_show_fault, ad2s1210_clear_fault, 0);
 
-static IIO_DEVICE_ATTR(dos_rst_max_thrd, 0644,
-		       ad2s1210_show_reg, ad2s1210_store_reg,
-		       AD2S1210_REG_DOS_RST_MAX_THRD);
-static IIO_DEVICE_ATTR(dos_rst_min_thrd, 0644,
-		       ad2s1210_show_reg, ad2s1210_store_reg,
-		       AD2S1210_REG_DOS_RST_MIN_THRD);
-
 static const struct iio_event_spec ad2s1210_position_event_spec[] = {
 	{
 		/* Tracking error exceeds LOT threshold fault. */
@@ -867,8 +825,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 
 static struct attribute *ad2s1210_attributes[] = {
 	&iio_dev_attr_fault.dev_attr.attr,
-	&iio_dev_attr_dos_rst_max_thrd.dev_attr.attr,
-	&iio_dev_attr_dos_rst_min_thrd.dev_attr.attr,
 	NULL,
 };
 
@@ -876,6 +832,49 @@ static const struct attribute_group ad2s1210_attribute_group = {
 	.attrs = ad2s1210_attributes,
 };
 
+static ssize_t event_attr_voltage_reg_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
+	struct iio_dev_attr *iattr = to_iio_dev_attr(attr);
+	unsigned int value;
+	int ret;
+
+	mutex_lock(&st->lock);
+	ret = regmap_read(st->regmap, iattr->address, &value);
+	mutex_unlock(&st->lock);
+
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", value * THRESHOLD_MILLIVOLT_PER_LSB);
+}
+
+static ssize_t event_attr_voltage_reg_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t len)
+{
+	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
+	struct iio_dev_attr *iattr = to_iio_dev_attr(attr);
+	u16 data;
+	int ret;
+
+	ret = kstrtou16(buf, 10, &data);
+	if (ret)
+		return -EINVAL;
+
+	mutex_lock(&st->lock);
+	ret = regmap_write(st->regmap, iattr->address,
+			   data / THRESHOLD_MILLIVOLT_PER_LSB);
+	mutex_unlock(&st->lock);
+
+	if (ret < 0)
+		return ret;
+
+	return len;
+}
+
 static ssize_t
 in_angl1_thresh_rising_value_available_show(struct device *dev,
 					    struct device_attribute *attr,
@@ -906,6 +905,14 @@ IIO_CONST_ATTR(in_phase0_mag_value_available,
 IIO_CONST_ATTR(in_altvoltage0_thresh_falling_value_available, THRESHOLD_RANGE_STR);
 IIO_CONST_ATTR(in_altvoltage0_thresh_rising_value_available, THRESHOLD_RANGE_STR);
 IIO_CONST_ATTR(in_altvoltage0_mag_value_available, THRESHOLD_RANGE_STR);
+IIO_DEVICE_ATTR(in_altvoltage0_mag_reset_max, 0644,
+		event_attr_voltage_reg_show, event_attr_voltage_reg_store,
+		AD2S1210_REG_DOS_RST_MAX_THRD);
+IIO_CONST_ATTR(in_altvoltage0_mag_reset_max_available, THRESHOLD_RANGE_STR);
+IIO_DEVICE_ATTR(in_altvoltage0_mag_reset_min, 0644,
+		event_attr_voltage_reg_show, event_attr_voltage_reg_store,
+		AD2S1210_REG_DOS_RST_MIN_THRD);
+IIO_CONST_ATTR(in_altvoltage0_mag_reset_min_available, THRESHOLD_RANGE_STR);
 IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_value_available, 0);
 IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_hysteresis_available, 0);
 
@@ -914,6 +921,10 @@ static struct attribute *ad2s1210_event_attributes[] = {
 	&iio_const_attr_in_altvoltage0_thresh_falling_value_available.dev_attr.attr,
 	&iio_const_attr_in_altvoltage0_thresh_rising_value_available.dev_attr.attr,
 	&iio_const_attr_in_altvoltage0_mag_value_available.dev_attr.attr,
+	&iio_dev_attr_in_altvoltage0_mag_reset_max.dev_attr.attr,
+	&iio_const_attr_in_altvoltage0_mag_reset_max_available.dev_attr.attr,
+	&iio_dev_attr_in_altvoltage0_mag_reset_min.dev_attr.attr,
+	&iio_const_attr_in_altvoltage0_mag_reset_min_available.dev_attr.attr,
 	&iio_dev_attr_in_angl1_thresh_rising_value_available.dev_attr.attr,
 	&iio_dev_attr_in_angl1_thresh_rising_hysteresis_available.dev_attr.attr,
 	NULL,

-- 
2.42.0

