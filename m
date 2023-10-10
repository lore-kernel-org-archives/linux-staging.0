Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08E225D1
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 21:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ll2pYY9o"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c4bad60a1aso3572366a34.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 14:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696972376; x=1697577176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCa1l139dV9fkfDRgcINbFP6JVo4HEiw2AUoI1RI/Aw=;
        b=Ll2pYY9oJuOP3dS9sEE+tpOhalEPP6hb27Aeh6GCs9xPV28lqIA5eQvtKxPU4yG+K7
         l5Up1KBI8Ivrd3pyHGAAVeCDontieFN/fCN6QGnUlXAqh6PdzQKGPj4gp3DvRgG7YCON
         W5CYHvknvSU1d88WZ3S2+8nXcx2yGYTn0FZIYZNaTEt6/wzEggZI8oYz7MQjW7hKgdtt
         u6ik1ai3M3SgVqPsfOxVBr0TwwdlMmecquoUmOl7j4XlPGb2SO4kRsFGG+LeWnXI52C3
         cFIDNr5tM11443SrMYIvV0L5zojx/kXq0Ahlp/z/je9bt4ycsLYqx9WV3L648vLiXBaw
         VZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696972376; x=1697577176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCa1l139dV9fkfDRgcINbFP6JVo4HEiw2AUoI1RI/Aw=;
        b=PHsSI52IX52KbnowY3QCBl0AGbxuPE49pJPS8OAgmhq4sbB9EMY8VRZ1t0PsekUy/Q
         k9brSPfYLMogg3bxJHjDDTZZSlA0prVvYlrKHbUqSu9/uWO2R/kWuVpZnkslbPeC0E1K
         QpTb8bAWClr41nfu8wRTr0ZwJJQpm4jvRBDJiprkGmIfspTzW38o18OC4Lm662F9ftCc
         mhmKni9R/MngrTA2UF81bc/M4zF5nel2GJn3Fdp5KqpNoYet1CFLjdeDdZTGSEGnH5rN
         53W3gpIOZKn1LU2x1y+p3oWeOQg0MCDzfBNfr/O59eQ8Lv31kBo/CToOsv2XTil91O7v
         JwrQ==
X-Gm-Message-State: AOJu0YwIwzFchUlmjJOP4NfUZjejHQ210KtAf5+1+ETZJqk/We4ulIls
	nC/Uxygp3baIj3YQNb/t3SLk7Q==
X-Google-Smtp-Source: AGHT+IHa/1QpnSwzAFy2OFnEmS/d+HFZ/3vew4ebbhr6hbK5N4280IBIPblT2DCyyJGPXfMl92LUsg==
X-Received: by 2002:a05:6870:9693:b0:1b0:454b:1c3d with SMTP id o19-20020a056870969300b001b0454b1c3dmr20893867oaq.36.1696972376336;
        Tue, 10 Oct 2023 14:12:56 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id ed46-20020a056870b7ae00b001e98b1544fesm52494oab.9.2023.10.10.14.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 14:12:56 -0700 (PDT)
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
Subject: [PATCH v5 3/4] staging: iio: resolver: ad2s1210: simplify code with guard(mutex)
Date: Tue, 10 Oct 2023 16:12:35 -0500
Message-ID: <20231010-ad2s1210-mainline-v5-3-35a0f6ffa04a@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
References: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

We can simplify the code and get rid of most of the gotos by using
guard(mutex) from cleanup.h.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v5 changes: None (rebased).

Review comment from v4 is no longer applicable as it was addressed in
"staging: iio: resolver: ad2s1210: refactor sample toggle"

 drivers/staging/iio/resolver/ad2s1210.c | 153 ++++++++++----------------------
 1 file changed, 49 insertions(+), 104 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index cf4018434447..bd4a90c222b5 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -47,6 +47,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -447,7 +448,8 @@ static int ad2s1210_single_conversion(struct iio_dev *indio_dev,
 	s64 timestamp;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
+
 	ad2s1210_toggle_sample_line(st);
 	timestamp = iio_get_time_ns(indio_dev);
 
@@ -459,14 +461,13 @@ static int ad2s1210_single_conversion(struct iio_dev *indio_dev,
 		ret = ad2s1210_set_mode(st, MOD_VEL);
 		break;
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 	if (ret < 0)
-		goto error_ret;
+		return ret;
 	ret = spi_read(st->sdev, &st->sample, 3);
 	if (ret < 0)
-		goto error_ret;
+		return ret;
 
 	switch (chan->type) {
 	case IIO_ANGL:
@@ -478,14 +479,11 @@ static int ad2s1210_single_conversion(struct iio_dev *indio_dev,
 		ret = IIO_VAL_INT;
 		break;
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
 	ad2s1210_push_events(indio_dev, st->sample.fault, timestamp);
 
-error_ret:
-	mutex_unlock(&st->lock);
 	return ret;
 }
 
@@ -493,11 +491,9 @@ static int ad2s1210_get_hysteresis(struct ad2s1210_state *st, int *val)
 {
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	ret = regmap_test_bits(st->regmap, AD2S1210_REG_CONTROL,
 			       AD2S1210_ENABLE_HYSTERESIS);
-	mutex_unlock(&st->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -507,15 +503,10 @@ static int ad2s1210_get_hysteresis(struct ad2s1210_state *st, int *val)
 
 static int ad2s1210_set_hysteresis(struct ad2s1210_state *st, int val)
 {
-	int ret;
-
-	mutex_lock(&st->lock);
-	ret = regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
-				 AD2S1210_ENABLE_HYSTERESIS,
-				 val ? AD2S1210_ENABLE_HYSTERESIS : 0);
-	mutex_unlock(&st->lock);
-
-	return ret;
+	guard(mutex)(&st->lock);
+	return regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
+				  AD2S1210_ENABLE_HYSTERESIS,
+				  val ? AD2S1210_ENABLE_HYSTERESIS : 0);
 }
 
 static int ad2s1210_get_phase_lock_range(struct ad2s1210_state *st,
@@ -523,11 +514,9 @@ static int ad2s1210_get_phase_lock_range(struct ad2s1210_state *st,
 {
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	ret = regmap_test_bits(st->regmap, AD2S1210_REG_CONTROL,
 			       AD2S1210_PHASE_LOCK_RANGE_44);
-	mutex_unlock(&st->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -547,7 +536,7 @@ static int ad2s1210_get_phase_lock_range(struct ad2s1210_state *st,
 static int ad2s1210_set_phase_lock_range(struct ad2s1210_state *st,
 					 int val, int val2)
 {
-	int deg, ret;
+	int deg;
 
 	/* convert radians to degrees - only two allowable values */
 	if (val == PHASE_44_DEG_TO_RAD_INT && val2 == PHASE_44_DEG_TO_RAD_MICRO)
@@ -558,12 +547,10 @@ static int ad2s1210_set_phase_lock_range(struct ad2s1210_state *st,
 	else
 		return -EINVAL;
 
-	mutex_lock(&st->lock);
-	ret = regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
-				 AD2S1210_PHASE_LOCK_RANGE_44,
-				 deg == 44 ? AD2S1210_PHASE_LOCK_RANGE_44 : 0);
-	mutex_unlock(&st->lock);
-	return ret;
+	guard(mutex)(&st->lock);
+	return regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
+				  AD2S1210_PHASE_LOCK_RANGE_44,
+				  deg == 44 ? AD2S1210_PHASE_LOCK_RANGE_44 : 0);
 }
 
 /* map resolution to microradians/LSB for LOT registers */
@@ -580,10 +567,8 @@ static int ad2s1210_get_voltage_threshold(struct ad2s1210_state *st,
 	unsigned int reg_val;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	ret = regmap_read(st->regmap, reg, &reg_val);
-	mutex_unlock(&st->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -595,15 +580,11 @@ static int ad2s1210_set_voltage_threshold(struct ad2s1210_state *st,
 					  unsigned int reg, int val)
 {
 	unsigned int reg_val;
-	int ret;
 
 	reg_val = val / THRESHOLD_MILLIVOLT_PER_LSB;
 
-	mutex_lock(&st->lock);
-	ret = regmap_write(st->regmap, reg, reg_val);
-	mutex_unlock(&st->lock);
-
-	return ret;
+	guard(mutex)(&st->lock);
+	return regmap_write(st->regmap, reg, reg_val);
 }
 
 static int ad2s1210_get_lot_high_threshold(struct ad2s1210_state *st,
@@ -612,10 +593,8 @@ static int ad2s1210_get_lot_high_threshold(struct ad2s1210_state *st,
 	unsigned int reg_val;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &reg_val);
-	mutex_unlock(&st->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -634,18 +613,18 @@ static int ad2s1210_set_lot_high_threshold(struct ad2s1210_state *st,
 	if (val != 0)
 		return -EINVAL;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	/*
 	 * We need to read both high and low registers first so we can preserve
 	 * the hysteresis.
 	 */
 	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &high_reg_val);
 	if (ret < 0)
-		goto error_ret;
+		return ret;
 
 	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_LOW_THRD, &low_reg_val);
 	if (ret < 0)
-		goto error_ret;
+		return ret;
 
 	hysteresis = high_reg_val - low_reg_val;
 	high_reg_val = val2 / ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
@@ -653,14 +632,9 @@ static int ad2s1210_set_lot_high_threshold(struct ad2s1210_state *st,
 
 	ret = regmap_write(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, high_reg_val);
 	if (ret < 0)
-		goto error_ret;
-
-	ret = regmap_write(st->regmap, AD2S1210_REG_LOT_LOW_THRD, low_reg_val);
-
-error_ret:
-	mutex_unlock(&st->lock);
+		return ret;
 
-	return ret;
+	return regmap_write(st->regmap, AD2S1210_REG_LOT_LOW_THRD, low_reg_val);
 }
 
 static int ad2s1210_get_lot_low_threshold(struct ad2s1210_state *st,
@@ -669,16 +643,13 @@ static int ad2s1210_get_lot_low_threshold(struct ad2s1210_state *st,
 	unsigned int high_reg_val, low_reg_val;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
+
 	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &high_reg_val);
 	if (ret < 0)
-		goto error_ret;
+		return ret;
 
 	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_LOW_THRD, &low_reg_val);
-
-error_ret:
-	mutex_unlock(&st->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -701,18 +672,14 @@ static int ad2s1210_set_lot_low_threshold(struct ad2s1210_state *st,
 
 	hysteresis = val2 / ad2s1210_lot_threshold_urad_per_lsb[st->resolution];
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
+
 	ret = regmap_read(st->regmap, AD2S1210_REG_LOT_HIGH_THRD, &reg_val);
 	if (ret < 0)
-		goto error_ret;
+		return ret;
 
-	ret = regmap_write(st->regmap, AD2S1210_REG_LOT_LOW_THRD,
+	return regmap_write(st->regmap, AD2S1210_REG_LOT_LOW_THRD,
 			   reg_val - hysteresis);
-
-error_ret:
-	mutex_unlock(&st->lock);
-
-	return ret;
 }
 
 static int ad2s1210_get_excitation_frequency(struct ad2s1210_state *st, int *val)
@@ -720,31 +687,23 @@ static int ad2s1210_get_excitation_frequency(struct ad2s1210_state *st, int *val
 	unsigned int reg_val;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
+
 	ret = regmap_read(st->regmap, AD2S1210_REG_EXCIT_FREQ, &reg_val);
 	if (ret < 0)
-		goto error_ret;
+		return ret;
 
 	*val = reg_val * st->clkin_hz / (1 << 15);
-	ret = IIO_VAL_INT;
-
-error_ret:
-	mutex_unlock(&st->lock);
-	return ret;
+	return IIO_VAL_INT;
 }
 
 static int ad2s1210_set_excitation_frequency(struct ad2s1210_state *st, int val)
 {
-	int ret;
-
 	if (val < AD2S1210_MIN_EXCIT || val > AD2S1210_MAX_EXCIT)
 		return -EINVAL;
 
-	mutex_lock(&st->lock);
-	ret = ad2s1210_reinit_excitation_frequency(st, val);
-	mutex_unlock(&st->lock);
-
-	return ret;
+	guard(mutex)(&st->lock);
+	return ad2s1210_reinit_excitation_frequency(st, val);
 }
 
 static const int ad2s1210_velocity_scale[] = {
@@ -1020,10 +979,8 @@ static ssize_t event_attr_voltage_reg_show(struct device *dev,
 	unsigned int value;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	ret = regmap_read(st->regmap, iattr->address, &value);
-	mutex_unlock(&st->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -1043,11 +1000,9 @@ static ssize_t event_attr_voltage_reg_store(struct device *dev,
 	if (ret)
 		return -EINVAL;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	ret = regmap_write(st->regmap, iattr->address,
 			   data / THRESHOLD_MILLIVOLT_PER_LSB);
-	mutex_unlock(&st->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -1121,7 +1076,7 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 	unsigned int data;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 
 	/* Use default config register value plus resolution from devicetree. */
 	data = FIELD_PREP(AD2S1210_PHASE_LOCK_RANGE_44, 1);
@@ -1131,13 +1086,9 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 
 	ret = regmap_write(st->regmap, AD2S1210_REG_CONTROL, data);
 	if (ret < 0)
-		goto error_ret;
-
-	ret = ad2s1210_reinit_excitation_frequency(st, AD2S1210_DEF_EXCIT);
+		return ret;
 
-error_ret:
-	mutex_unlock(&st->lock);
-	return ret;
+	return ad2s1210_reinit_excitation_frequency(st, AD2S1210_DEF_EXCIT);
 }
 
 static int ad2s1210_read_label(struct iio_dev *indio_dev,
@@ -1281,18 +1232,13 @@ static int ad2s1210_debugfs_reg_access(struct iio_dev *indio_dev,
 				       unsigned int *readval)
 {
 	struct ad2s1210_state *st = iio_priv(indio_dev);
-	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 
 	if (readval)
-		ret = regmap_read(st->regmap, reg, readval);
-	else
-		ret = regmap_write(st->regmap, reg, writeval);
-
-	mutex_unlock(&st->lock);
+		return regmap_read(st->regmap, reg, readval);
 
-	return ret;
+	return regmap_write(st->regmap, reg, writeval);
 }
 
 static irqreturn_t ad2s1210_trigger_handler(int irq, void *p)
@@ -1303,7 +1249,7 @@ static irqreturn_t ad2s1210_trigger_handler(int irq, void *p)
 	size_t chan = 0;
 	int ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 
 	memset(&st->scan, 0, sizeof(st->scan));
 	ad2s1210_toggle_sample_line(st);
@@ -1336,7 +1282,6 @@ static irqreturn_t ad2s1210_trigger_handler(int irq, void *p)
 	iio_push_to_buffers_with_timestamp(indio_dev, &st->scan, pf->timestamp);
 
 error_ret:
-	mutex_unlock(&st->lock);
 	iio_trigger_notify_done(indio_dev->trig);
 
 	return IRQ_HANDLED;

-- 
2.42.0

