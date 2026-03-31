Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981723CCFCC
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941947; cv=none; b=sEE2fso3RS5I477/SPvZlXsBRL3zZclcgco8Y/b5jhJrMT4DCw42kj1lQoWqeIgeIacvTzuB+Zi5k4dYlWnshA33lBlbzNtXE4jxlQ8/eaQDJ24mH/MxOEzXw8qMfw4xk//eJD5cq0BpklMYKZS48qkyBdlwZxlgw4fsxpJyYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941947; c=relaxed/simple;
	bh=AaeubZhtz8ojYJt5zsFPfxtOPOpZylhKBuq2cPd6gUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F07NgaNmybqlYrs5W3Ej9wd+0ykfGMY9VQSuKvDoGcJL3pgSpvgRmS2JCBtzDT7Wc6Oy6XhMBqAcLPmGcFasrBQbqH0cdYPMJvEWir2BtBa5IK2Wbztg/MqLZsPGGlKys+WSQ/VJE3GBYa2J1N9iV1gfggFpxMx+y1HphTgEcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L431UyF1; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L431UyF1"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso2291775a91.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774941945; x=1775546745; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdIxdgSG7WGFBTZ3ix+HECNRQzg5xB6W1qz3YgiFcVw=;
        b=L431UyF1x2J6FnOnNV3j7Gjsknu/rKfbOHoIrsUDZSzL6UvLS8cCfrANc85qDXZmHY
         9c8272rEjq0LEw/8wiFd9VLovHgWUSg2qIlHkoJ8L+IBbtV+1KKnZYspxPqndq+/akOq
         1UEw/9h++g28QHwtCtmOr9qUuAmXW8aFeM1FxJLYxcIXpeLcyQ1SvJB57zRWUATkn0f/
         DFP80EiZqyZ/OkqpwMwYxQig1xx29+txji4ZFlNnn/K1a+B2gdGQjKRsoBVnkzoGDnXS
         5Au7L17c6EqiHhFMUk9PGvhArqtZg+7hCcFGaROPMqA4byF9NuW0DDB99Yh3hdjNeFLf
         FZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941945; x=1775546745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdIxdgSG7WGFBTZ3ix+HECNRQzg5xB6W1qz3YgiFcVw=;
        b=S9WE0c4/n1iz0upfoAp23rf6+vWTQTvTyRGgZMwNheMC6/vTcMSRGb5inK625WVaC7
         dqTMFptHyFPqtuv7AN2Cgd9B3LhSBggDd46VVkLJAh71XhXGrMZCtVtFKoDZ2X2dZ4E3
         c5QEqTvtr6Ha2OHbycGEr58UGBxtwE2HLO0vweSTaZuS4ElpnzqSfQ6iegdDnuEZhdqQ
         G1tEjlgzysHTerra2563i//PkI4Qdu7Uw0Ook85rUZ7rSZRQSHcF0B7SPwe9R+fHe9bJ
         9oL2i52iO8iF12NOKVYWjjAmjRKkGqBJD7NgV1oBJK0wqCCAISFLO6jXVm32ObFdzCcM
         ndPA==
X-Forwarded-Encrypted: i=1; AJvYcCXT7h+le4mj4O76CD6YNjhpfE87fpxp/UPiCdsZdEHq5uVB0OGIVUuNwJbPY9foKSZmuEHiyKZOtSK11bpr@lists.linux.dev
X-Gm-Message-State: AOJu0YwnQoQcDbWNaEYaL4mj6ompKF8HsQ2uh1zot6LKGT2l+dkLeHgb
	yJKS92hyHcBcdVBdR5IHBXSx6reOW3tyWWeD5dyVotJFBQOWBGJRgUoE
X-Gm-Gg: ATEYQzxzO5r159MIn2RVCXCwxQT4hT5sXM2XfrOTrbUXCp0wH0suFpwQN2ux1Js1Ehw
	p15PqrFWXKAPi93My0eBBr8iVkyqe6nLMAa3mNxgpFLfxMRnlECf5YpoaLqJo/83rUcm8+tF1So
	vltV5qBv2ly56jyIc+mENuCsqQW/WlV5OiaGxmjgcLjx9XxsOB+5mL0+tMGYmQmFW2xDRAEDIkJ
	F76KTjMU/thcHkEnqbjH3Bt+syIsVgZDlJTeXv9e4bJkElvfXGjqWdvyk5gZiO0fhjPSTRFMLB+
	7hHS14Cmr4K0a6yI1oD4bNLRfHAN+iQBBcAt5A1J2Mf9F2mI51ng63JjJXEE3a1sAYiLUWXBCE2
	pIoKhwc5G4wN6o4Umiod0EXFv1dM2PB8ubfjfX4dKhJCFctqtLvyo21U/E3Ii5LvK3snzd7KXl9
	xTOqWto+BVU4OZpc9jO16AAzEi54s8N8PJZIMbJJI=
X-Received: by 2002:a17:903:22c2:b0:2b2:5515:661f with SMTP id d9443c01a7336-2b255157499mr60408695ad.9.1774941944981;
        Tue, 31 Mar 2026 00:25:44 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:5412:6527:d590:8704:ff8:2ffd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm109272495ad.6.2026.03.31.00.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:25:44 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v4 4/4] staging: iio: adc: ad7816: use modern IIO attribute macros
Date: Tue, 31 Mar 2026 13:24:53 +0600
Message-Id: <20260331072453.6530-5-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
References: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modernize the driver by using IIO_DEVICE_ATTR_RW and
IIO_DEVICE_ATTR_RO macros. This involves renaming the callback
functions to standard <name>_show and <name>_store formats, making
the code cleaner and more maintainable.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 72 ++++++++++++++------------------
 1 file changed, 32 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 790b04544..c83f7f70d 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -122,9 +122,9 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
 	return ret;
 }
 
-static ssize_t ad7816_show_mode(struct device *dev,
-				struct device_attribute *attr,
-				char *buf)
+static ssize_t mode_show(struct device *dev,
+			 struct device_attribute *attr,
+			 char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -132,10 +132,10 @@ static ssize_t ad7816_show_mode(struct device *dev,
 	return sysfs_emit(buf, "%s\n", ad7816_modes[chip->mode]);
 }
 
-static ssize_t ad7816_store_mode(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf,
-				 size_t len)
+static ssize_t mode_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf,
+			  size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -151,24 +151,20 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(mode, 0644,
-		ad7816_show_mode,
-		ad7816_store_mode,
-		0);
+static IIO_DEVICE_ATTR_RW(mode, 0);
 
-static ssize_t ad7816_show_available_modes(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf)
+static ssize_t available_modes_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
 {
 	return sysfs_emit(buf, "full\npower-save\n");
 }
 
-static IIO_DEVICE_ATTR(available_modes, 0444, ad7816_show_available_modes,
-			NULL, 0);
+static IIO_DEVICE_ATTR_RO(available_modes, 0);
 
-static ssize_t ad7816_show_channel(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buf)
+static ssize_t channel_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -176,10 +172,10 @@ static ssize_t ad7816_show_channel(struct device *dev,
 	return sysfs_emit(buf, "%d\n", chip->channel_id);
 }
 
-static ssize_t ad7816_store_channel(struct device *dev,
-				    struct device_attribute *attr,
-				    const char *buf,
-				    size_t len)
+static ssize_t channel_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf,
+			     size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -209,14 +205,11 @@ static ssize_t ad7816_store_channel(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(channel, 0644,
-		ad7816_show_channel,
-		ad7816_store_channel,
-		0);
+static IIO_DEVICE_ATTR_RW(channel, 0);
 
-static ssize_t ad7816_show_value(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf)
+static ssize_t value_show(struct device *dev,
+			  struct device_attribute *attr,
+			  char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -240,7 +233,7 @@ static ssize_t ad7816_show_value(struct device *dev,
 	return sysfs_emit(buf, "%u\n", data);
 }
 
-static IIO_DEVICE_ATTR(value, 0444, ad7816_show_value, NULL, 0);
+static IIO_DEVICE_ATTR_RO(value, 0);
 
 static struct attribute *ad7816_attributes[] = {
 	&iio_dev_attr_available_modes.dev_attr.attr,
@@ -270,9 +263,9 @@ static irqreturn_t ad7816_event_handler(int irq, void *private)
 	return IRQ_HANDLED;
 }
 
-static ssize_t ad7816_show_oti(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buf)
+static ssize_t oti_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -290,10 +283,10 @@ static ssize_t ad7816_show_oti(struct device *dev,
 	return sysfs_emit(buf, "%u\n", chip->oti_data[chip->channel_id]);
 }
 
-static inline ssize_t ad7816_set_oti(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf,
-				     size_t len)
+static inline ssize_t oti_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t len)
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
@@ -331,8 +324,7 @@ static inline ssize_t ad7816_set_oti(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(oti, 0644,
-		       ad7816_show_oti, ad7816_set_oti, 0);
+static IIO_DEVICE_ATTR_RW(oti, 0);
 
 static struct attribute *ad7816_event_attributes[] = {
 	&iio_dev_attr_oti.dev_attr.attr,
-- 
2.34.1

