Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C5B3DDDC8
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892486; cv=none; b=r3Oez07LwZkKeCp51vHkfcAozaOhIvbJctUVhsOfT8tUPa/LJ4IEUNkPu4+q9rA2/Fh0hKDr8ESSB7ofGKtfvd6m6sIcI+Ujsf565f8vCvCCaONlsVpAZSgtmVtSs26rvMaFI4TpgXEzhNfImvNfpI3nYqu4xahD0qabmQehk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892486; c=relaxed/simple;
	bh=tSquc7sa2Cn6LfGxEXgHs/QIbImA+arPbrIn1dVGGHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iL2rIa4oxVS/qda69JBj4jCg7JjHQnXkGjw+ziLTSMobeUcXquh0T92183Kp6NhLfdWB7qvcXt6hTSYSZBhujUkig2mFzW5L98zM1P7OpRmwWqH7YlmE0O6UWw+zIGDCQOMYbaYQ3ovvjdl6qNPmTDnIBS0A0+yFZT5ZmSJJms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3yA9tRG; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3yA9tRG"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82c20f1e890so3346116b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774892485; x=1775497285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fqwDF4ChSEr48olaKrcyFKqRQaBIIIXtDoKMJ7juOk=;
        b=E3yA9tRGHS682DinRgTRFcAzapT1S2MB3Z9Q8QGqlsKYTX/OA2VjU19QyigA2RnJuB
         ir2G/hr2Y0mAeyu+Aokc+AIpxRvFAkVSv+FNH6rIntYDk1TTJ52YfpLCJAHHw4F6bwk+
         3Qabp+xDNTHehX7wqpHeGiORc8IxA8VUGQdKkjnBg+EkV0cSr1+tie16YIgojjPRMxql
         Ra3SFfRk8MTwXzY9YJAyHabfA8g5K/TklkUUMo+R+JOy6f4fIFVbDfYs5yMOFxweM0WQ
         3x2Ctc0drY1dPH+WmjSYmgyjWS5j+CZG2CVk6a/s7lUJQU/nrONC0TXWcMfkMpUh5Ou8
         1wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774892485; x=1775497285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fqwDF4ChSEr48olaKrcyFKqRQaBIIIXtDoKMJ7juOk=;
        b=d05Hrt+WJvUPk45OoSg7/NLT6Le/YFupJjw90LSyPdTdjSLDcHXH8EXPob8Svi689F
         13/Z9ZOq+jhTYK/lFFBPcA5c1rsCJmEpw8xdohrmlpGE+xICg96AkFvrsSdbdrIg9Y7u
         EezvLdrmg7iAheNyRxE7jxHgKvORFWHLSwZXLgb5V2QiJ4Gkje/beWt0o4FPUWrOzs7R
         OnvunZzyHmcATsD2j40fmzVJ73OUpB7IdR/Qt3OWQjq+kcyN1p7wZkqfmdkY+QUgNINr
         muAzRVIyPgOYTxkGeTf66F9qPwZdqYmP/HxsAFKhJxPVwX71iMGzbXRSyWCFugAXF0bo
         V4DA==
X-Forwarded-Encrypted: i=1; AJvYcCWu6v+RWUjoqPQ95drnhv1N61howQeoQL1g10JUJLPHPMO2RwF7TRa/FPXvMoYldSnAIuJtu6W/QzfBSwYd@lists.linux.dev
X-Gm-Message-State: AOJu0YwSHkhVoCeQhdOb8IkrSY9RKeZPYOYDia6NdzOG/SdzTnQMNoFn
	35WbIZSypMEap5hopHJoFoBiaql1v/SKT2pHbKt+NbD7KKh1d9Fa6XLM
X-Gm-Gg: ATEYQzympf8Zup7JJLDIKRT6YxTDvQ9C38hZINMAMlLxogL6O4idwy9FjjmZteTtV2H
	Vvtpgj6vGDg1ta6Ni/t/4uLSW2enBJfC7fv5RXzchDBqFzYeCQy2bIYh9cw/l0FMjJERyAW0Ydo
	EZgc8+yaGuSSxfGa2Pgeo49Ok5ayr27j4XU99cvIgrhlWWnaXdOaPGA9Bs+PYx3vNVWP1bkvFQ4
	JolnVhKEzHsCWCCyTxMGcj6Ko6f2gKh6+jqBXqvUwzE/d6mxV/DZPc2t7rkp6sUiyqjk7srV9q0
	HsoajwBrrUEbvm+W7giZcgow3+4xohLPhqq3LlzMCjpYR+F4cIPjFItb7CUkIhgvqbUb6YiGeDa
	uMBCm2noLHCbTxyopFXnZPNsmOAyaQsdXUfZmXvU54P5Js54WJs1aXMludLNqtJsT0Gio7OA9U+
	J8dO78siKZfhy+ahA5IMUGJ2DPZPZjGXMF6VAuwBqn
X-Received: by 2002:a05:6a00:4299:b0:82a:7aa3:a2f3 with SMTP id d2e1a72fcca58-82c95ee4bedmr11931671b3a.33.1774892484669;
        Mon, 30 Mar 2026 10:41:24 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm7844052b3a.50.2026.03.30.10.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:41:24 -0700 (PDT)
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
Subject: [PATCH v2 4/4] staging: iio: adc: ad7816: use modern IIO attribute macros
Date: Mon, 30 Mar 2026 23:40:24 +0600
Message-Id: <20260330174024.20712-5-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
References: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

