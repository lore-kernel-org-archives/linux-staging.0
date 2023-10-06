Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DBF15AD
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="agbX8ZyU"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1e562706d29so750793fac.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553473; x=1697158273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNARt9BjmrL0i7i91yqOdic11DYEv873Ym2j4CCnaQE=;
        b=agbX8ZyUlt65XgQzqb2Yntevrb5uH6Cgyv9BaY0Q3qz9E0i5tIlEScyQvAuhWxhSKm
         LMc8FjTYEU9D5AhViZ8if7WBrn8m0aejsyChEDnBNz4+RAXt5mChHGYx1wGzhOSUbz3F
         6hfvkq8GIyTy8VNyrqm3FKdHGylNQwl5+B9ks5MVlXNG6nIPxLlvnZyvFVE9+GHjnK4S
         rcg2UwihJCJdLF1U8UyqC0rIOVmgyz3b7JNpvslLFCzNbpwwfuTwbdGzYYpdUSkqI+xu
         N33+h/EmwJqd8SA+CX57TEmA35MuyvjgTwdlGO3iwya/w3X6hx059Wufk8kIYL4naSLu
         TXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553473; x=1697158273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNARt9BjmrL0i7i91yqOdic11DYEv873Ym2j4CCnaQE=;
        b=nSrvtACF+DX0jirgati6g1xTHnCC7p2ACoGrLIqj5aYJWLLEvR9I7JNkk8Dkv88AIV
         7Anrgx/c23l5qKib4fzckE/gBroxPcVz8XMrD/GOJSScOIAedOP+GidAVG53BKh9wQOq
         Io68hUcFn1ikOWh3RAAV1f11Qucvn3xo25U8ZGPbIYtTEeokhpqq7KyUjml8WPXZIM6U
         yJSILVS1s4UWXDZiXS2a24OoasAG/uYqhhbA9MNXPAe0JGAHBX5VzKbGaUZtTBHjYD/P
         JlneG+XHdP7clFwrIWfRBmN4HZPdol/GkbK2LvmYNcV4GSrNomlpk+D5B7VkdzIa2qHy
         XbNg==
X-Gm-Message-State: AOJu0YwA95cYAOEnVW+ccrY2R5n1GyZiWkYPzctIlEMG0XFTq3ecaTll
	QluC2IA2XkatZoMyHHZxHtC2fw==
X-Google-Smtp-Source: AGHT+IEWlShVZMnC6L36T0xQUuEmsgQU0elvkJX/T9h6QQP2eVon50uND5M3j3PJtGm0vC7Dbx4/GA==
X-Received: by 2002:a05:6870:8309:b0:1dc:704c:7c83 with SMTP id p9-20020a056870830900b001dc704c7c83mr7892096oae.30.1696553473491;
        Thu, 05 Oct 2023 17:51:13 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:13 -0700 (PDT)
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
Subject: [PATCH v4 11/17] staging: iio: resolver: ad2s1210: rename DOS reset min/max attrs
Date: Thu,  5 Oct 2023 19:50:28 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-11-ec00746840fc@baylibre.com>
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

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes:
* Fixed name of attributes in sysfs docs.
* Changed event direction from none to rising.
* Fixed missing static qualifier on attribute definition.

v3 changes: This is a new patch in v3

 .../Documentation/sysfs-bus-iio-resolver-ad2s1210  | 27 ++++++
 drivers/staging/iio/resolver/ad2s1210.c            | 99 ++++++++++++----------
 2 files changed, 82 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210 b/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210
new file mode 100644
index 000000000000..f92c79342b93
--- /dev/null
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210
@@ -0,0 +1,27 @@
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0_mag_rising_reset_max
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Reset Maximum
+		Threshold value in millivolts. Writing sets the value.
+
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0_mag_rising_reset_max_available
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the allowable voltage range for
+		in_altvoltage0_mag_rising_reset_max.
+
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0_mag_rising_reset_min
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Reset Minimum
+		Threshold value in millivolts. Writing sets the value.
+
+What:		/sys/bus/iio/devices/iio:deviceX/events/in_altvoltage0_mag_rising_reset_min_available
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the allowable voltage range for
+		in_altvoltage0_mag_rising_reset_min.
diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 870c4a9a6214..9fac806c2a5f 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -286,41 +286,6 @@ static ssize_t ad2s1210_clear_fault(struct device *dev,
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
@@ -747,13 +712,6 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
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
@@ -871,8 +829,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 
 static struct attribute *ad2s1210_attributes[] = {
 	&iio_dev_attr_fault.dev_attr.attr,
-	&iio_dev_attr_dos_rst_max_thrd.dev_attr.attr,
-	&iio_dev_attr_dos_rst_min_thrd.dev_attr.attr,
 	NULL,
 };
 
@@ -880,6 +836,49 @@ static const struct attribute_group ad2s1210_attribute_group = {
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
@@ -913,6 +912,14 @@ static IIO_CONST_ATTR(in_altvoltage0_thresh_rising_value_available,
 		      THRESHOLD_RANGE_STR);
 static IIO_CONST_ATTR(in_altvoltage0_mag_rising_value_available,
 		      THRESHOLD_RANGE_STR);
+static IIO_DEVICE_ATTR(in_altvoltage0_mag_rising_reset_max, 0644,
+		       event_attr_voltage_reg_show, event_attr_voltage_reg_store,
+		       AD2S1210_REG_DOS_RST_MAX_THRD);
+static IIO_CONST_ATTR(in_altvoltage0_mag_rising_reset_max_available, THRESHOLD_RANGE_STR);
+static IIO_DEVICE_ATTR(in_altvoltage0_mag_rising_reset_min, 0644,
+		       event_attr_voltage_reg_show, event_attr_voltage_reg_store,
+		       AD2S1210_REG_DOS_RST_MIN_THRD);
+static IIO_CONST_ATTR(in_altvoltage0_mag_rising_reset_min_available, THRESHOLD_RANGE_STR);
 static IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_value_available, 0);
 static IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_hysteresis_available, 0);
 
@@ -921,6 +928,10 @@ static struct attribute *ad2s1210_event_attributes[] = {
 	&iio_const_attr_in_altvoltage0_thresh_falling_value_available.dev_attr.attr,
 	&iio_const_attr_in_altvoltage0_thresh_rising_value_available.dev_attr.attr,
 	&iio_const_attr_in_altvoltage0_mag_rising_value_available.dev_attr.attr,
+	&iio_dev_attr_in_altvoltage0_mag_rising_reset_max.dev_attr.attr,
+	&iio_const_attr_in_altvoltage0_mag_rising_reset_max_available.dev_attr.attr,
+	&iio_dev_attr_in_altvoltage0_mag_rising_reset_min.dev_attr.attr,
+	&iio_const_attr_in_altvoltage0_mag_rising_reset_min_available.dev_attr.attr,
 	&iio_dev_attr_in_angl1_thresh_rising_value_available.dev_attr.attr,
 	&iio_dev_attr_in_angl1_thresh_rising_hysteresis_available.dev_attr.attr,
 	NULL,

-- 
2.42.0

