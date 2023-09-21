Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FBFB64A
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-317c3ac7339so1051614f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307468; x=1695912268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5XZRvh5FJ3F9RXkqi8NbBrwtIOGm1RUjmAFGYn0SWM=;
        b=k55XgiBC0d7sJwHwzbJCk0Osd95XqSNmyjw0j9mNcdeOpf4fJHwJuuHmBVSOuL/UdN
         sNLax4DeqECx6ZGt9EouaYuJ6BZbLTt5GPsevngG9gWZeOenu8Hs6XPFKPxUCfedkBVW
         LF2VTmKmFTa9JGuue+WqelDFEchDBSIh8XzER8oDro790EHR7auBZPIpWrn/papKSnI3
         5uzeQyW0qaLpAj5N6ifQDhJDB4DMZfRtW1UzuWKYkoBzNoJvGV3udKSR/xrixt7eLO7C
         cJqOuW7XIE+tAPAZElbz2TFaHMAkciibnG5PoCAONKaUd2r8kBu3MJg11crPmrwwUgwd
         cypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307468; x=1695912268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5XZRvh5FJ3F9RXkqi8NbBrwtIOGm1RUjmAFGYn0SWM=;
        b=Fn79iAmaQI7nukXPKDAAtrLCyTSZB0oeB8MXbuwr0A9QsLWV1XPECvDUNqIaBIIFSO
         Ei7QUm3Yr2E6+m2ZzSW4S55kUHxIjH6+/U6CvDBP034ITZuGBblDqeQ6cP/+o/avP94g
         8RyrV2lA601g32sgLgtUr/eN2QR1l6TrBElVHwaH22Ej7xo3NS33wUzRKKUkoSTb+389
         O2n1MrHvVYJfFDZauxcRGuR41EUFUsCeiAO7COl7uF16Q1JuRcWhR4qQNmV5711Cq/2W
         urvJ0m3zm4S+bKTRe8dLZNjwLOnmYJpivKTVHCyayg45wv7AMpMZnSbFCiwdKyvqcG9z
         Sqiw==
X-Gm-Message-State: AOJu0Yy/BV39VtMwevJzwc7MfS+VCorAK+Q4WI6zZuFInUOuMAfNh0wD
	XN8fRIVaeZuRWLX8At2EEM40jDqSdgBoOqBvyzuAsab+
X-Google-Smtp-Source: AGHT+IH08jq16ad3p4HMe9xcyB8hweATSv5qN9lzeXRVPAWw2aoHMZLAHGaB/1pFA589xCpY6igblA==
X-Received: by 2002:a5d:4289:0:b0:319:7a9f:c63 with SMTP id k9-20020a5d4289000000b003197a9f0c63mr5309192wrq.50.1695307468423;
        Thu, 21 Sep 2023 07:44:28 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:28 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 18/19] staging: iio: resolver: ad2s1210: add phase_lock_range attributes
Date: Thu, 21 Sep 2023 09:43:59 -0500
Message-Id: <20230921144400.62380-19-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921144400.62380-1-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds new phase_lock_range and phase_lock_range_available attributes
to the ad2s1210 resolver driver. These attributes allow the user to set
the phase lock range bit in the control register to modify the behavior
of the resolver to digital converter.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 71f0913b7e2e..f5b8b290e860 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -259,6 +259,60 @@ static ssize_t excitation_frequency_store(struct device *dev,
 	return ret;
 }
 
+static ssize_t phase_lock_range_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
+	int ret;
+
+	mutex_lock(&st->lock);
+	ret = regmap_test_bits(st->regmap, AD2S1210_REG_CONTROL,
+			       AD2S1210_PHASE_LOCK_RANGE_44);
+	if (ret < 0)
+		goto error_ret;
+
+	ret = sprintf(buf, "%d\n", ret ? 44 : 360);
+
+error_ret:
+	mutex_unlock(&st->lock);
+	return ret;
+}
+
+static ssize_t phase_lock_range_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
+	u16 udata;
+	int ret;
+
+	ret = kstrtou16(buf, 10, &udata);
+	if (ret < 0 || (udata != 44 && udata != 360))
+		return -EINVAL;
+
+	mutex_lock(&st->lock);
+
+	ret = regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
+				 AD2S1210_PHASE_LOCK_RANGE_44,
+				 udata == 44 ? AD2S1210_PHASE_LOCK_RANGE_44 : 0);
+	if (ret < 0)
+		goto error_ret;
+
+	ret = len;
+
+error_ret:
+	mutex_unlock(&st->lock);
+	return ret;
+}
+
+static ssize_t phase_lock_range_available_show(struct device *dev,
+					       struct device_attribute *attr,
+					       char *buf)
+{
+	return sprintf(buf, "44 360\n");
+}
+
 /* read the fault register since last sample */
 static ssize_t ad2s1210_show_fault(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -506,6 +560,8 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 }
 
 static IIO_DEVICE_ATTR_RW(excitation_frequency, 0);
+static IIO_DEVICE_ATTR_RW(phase_lock_range, 0);
+static IIO_DEVICE_ATTR_RO(phase_lock_range_available, 0);
 static IIO_DEVICE_ATTR(fault, 0644,
 		       ad2s1210_show_fault, ad2s1210_clear_fault, 0);
 
@@ -552,6 +608,8 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 
 static struct attribute *ad2s1210_attributes[] = {
 	&iio_dev_attr_excitation_frequency.dev_attr.attr,
+	&iio_dev_attr_phase_lock_range.dev_attr.attr,
+	&iio_dev_attr_phase_lock_range_available.dev_attr.attr,
 	&iio_dev_attr_fault.dev_attr.attr,
 	&iio_dev_attr_los_thrd.dev_attr.attr,
 	&iio_dev_attr_dos_ovr_thrd.dev_attr.attr,
-- 
2.34.1

