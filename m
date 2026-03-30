Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4A3822BC
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894686; cv=none; b=e0/6a41wDq0uI6nLrVSCvdCIbvh9bNDUrurRT4T71qpED5qarv4Xd7rxagdwF76tSLk3p3tru4Aerd42Zc8TLbbNIfKecf1XoWiiRnBMlpTxIMZbdWKqGt5QQPHpQEP0zott6jsf2r2X98q7zjQZdJBnYyDFK0poHM7URKFfs94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894686; c=relaxed/simple;
	bh=jWDPKmEInibgEwWSaBhCJV+GEWo9o58hMOVkOchtk38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A/Xqo+dWJ8ZtpFy5Q4HDWj4Ybu9IeEZ6icK5focBI1BJ8Cp9RZGXbfbwn4lcCxx1NJnonB4zoGhaWE7/tZrvclus1xoZFFLxHOUnYAoUrWBUL1nWt8uHXwOJQp7FKoBU7NqkKPByvuLYiawNlqqLs/BZiIBWL/rGdrwxWD0FFGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQXBxeFw; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQXBxeFw"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8296dabef74so4573689b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894684; x=1775499484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egWOjCKA5Tr5GMAmRAwMz9x5gxn0udJ7TK4JECSEdQE=;
        b=SQXBxeFw2dzLoczg97DxdNivlNgo6xw25iAifd56pOPgw7pa5a0axFMlAnxTMAbYGB
         GdtU9udGzAl19OnxvLSLqE4L1G/DCcihqpQoNc7QdVzMws+I2v+LInOs9KA5VicSYNR4
         +9Y58WyP9NXczAqxq9GZyqjLnHxI4XggJysBTYZJKP1+9pKIAwWeHBuIPV34U+oJ7zLp
         B5AqMku7fx1uw57yMaedl6Vfqwc0zEVQ0mnO61YJxiF9RQh3NbDQUOZOKsBx8okMgVPG
         KVwa03PMy6Se+WZ3zEXNMVeH3kqNp7AONXGqnfVzfvshZbJauemZIpFjViY4MvoLzpBM
         yXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894684; x=1775499484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egWOjCKA5Tr5GMAmRAwMz9x5gxn0udJ7TK4JECSEdQE=;
        b=UZo2/4aXQE1ZnQ18sXKOZscLdv3/sd1Captn1IE0ov6YUp/NujWDT+VM9VGL+VonzP
         gu9OJ+VJU7knNzO7oHOpaOF/qAqxrXQ/cSOwt7MaO5bHRP+xYFC//rgkpOX/ALgkkkdI
         bKrDS4jjwGjhrQ2U8ivZpmUfNKAiILqbJRtSMT7H0/ggCYcFT1ypmAlvRUyAwjkSWs3j
         1DOt1pD5srTExdzrcAFLVwnGtvfrKA+73YKpw0f39efjqqOR360xrqjV3zg6LOVG6APH
         JUgyfsRJehADbA/HUWAg4PSIy0FmbS4ZhZBmfwE403VaxMg3IFXOMfcvBt53qii0hgJm
         c7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8z4yiLHg72S5odxiyuAkz/fVwVLfqlbWqh9TKV+kgk18TSsjo9yZ83D/N0v0S5jTaTG1t+jh0eUsXTOTk@lists.linux.dev
X-Gm-Message-State: AOJu0YxA+ffwa1a2A5TWB8s0BRWAW2FAqt+pNDCgAVOlIwQIQptVwEsV
	TkBOvRTZwAwYN9Sce1BKF8JmCC2QL0TtYEDN+XLYwJ9vEbrHnq+KRGB5
X-Gm-Gg: ATEYQzwrbNOVisTgHGXVUUgpwKRacywLz+SUxnn9ny8uJqbt0R3SN9eCBdzEjz6o8Ij
	tvv3gEVYQjE5X5EAftpfuXX+f8PfZHBcRFInMTnn07IDgwBU6SbcvhOO8GzOrTFyQeptJ6DTEmH
	sIym6v3BcKqp4V+rwdueL5kJWSQQCfJ/PD9+79aQApECm5KrgS+/tlAJfj5B58UaC8UfpdhpIa0
	D+kv7UJSP3dWYBXK9SZDXRQh49j7Z7RTUgXkELvdA+WAotHW6dOgq5G969WJs5PiNO1iNeeaAgB
	hT+9zv/QS0Ac6wiuMS4Io4gIPpw90BsHDf85Bc48Wnr2QXYbqt139rWr84NcMpwYIOznXB35xXk
	cv+1pLtxYd6iseYDaSxaBUo594dKPhmYAfKRqRE9qdbGpS81PzSm35YHKWj4WKI8F6bEbdxiV3i
	gx2ASQ89S4i3iByXz/SYoGNSgoKX4T3u+z29LdaeJ5
X-Received: by 2002:a05:6a00:2e1c:b0:82a:768c:9a49 with SMTP id d2e1a72fcca58-82c95ef6a78mr14209644b3a.42.1774894684234;
        Mon, 30 Mar 2026 11:18:04 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d4d90sm10099966b3a.36.2026.03.30.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:18:03 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v3 4/4] staging: iio: adc: ad7816: use modern IIO attribute macros
Date: Tue, 31 Mar 2026 00:17:10 +0600
Message-Id: <20260330181710.23258-5-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
References: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
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
index f2486cb29..80f84e2bb 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -121,9 +121,9 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
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
@@ -131,10 +131,10 @@ static ssize_t ad7816_show_mode(struct device *dev,
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
@@ -150,24 +150,20 @@ static ssize_t ad7816_store_mode(struct device *dev,
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
@@ -175,10 +171,10 @@ static ssize_t ad7816_show_channel(struct device *dev,
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
@@ -208,14 +204,11 @@ static ssize_t ad7816_store_channel(struct device *dev,
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
@@ -239,7 +232,7 @@ static ssize_t ad7816_show_value(struct device *dev,
 	return sysfs_emit(buf, "%u\n", data);
 }
 
-static IIO_DEVICE_ATTR(value, 0444, ad7816_show_value, NULL, 0);
+static IIO_DEVICE_ATTR_RO(value, 0);
 
 static struct attribute *ad7816_attributes[] = {
 	&iio_dev_attr_available_modes.dev_attr.attr,
@@ -269,9 +262,9 @@ static irqreturn_t ad7816_event_handler(int irq, void *private)
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
@@ -289,10 +282,10 @@ static ssize_t ad7816_show_oti(struct device *dev,
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
@@ -330,8 +323,7 @@ static inline ssize_t ad7816_set_oti(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(oti, 0644,
-		       ad7816_show_oti, ad7816_set_oti, 0);
+static IIO_DEVICE_ATTR_RW(oti, 0);
 
 static struct attribute *ad7816_event_attributes[] = {
 	&iio_dev_attr_oti.dev_attr.attr,
-- 
2.34.1

