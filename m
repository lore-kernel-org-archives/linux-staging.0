Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD538F632
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773961063; cv=none; b=V8q8HpXgoZEjN2ZjP9T2/8Ic9XqllGa5pf/sozOLrZFJWEeWe1TLjqmc9tUriFrI7rOv9IHtQK+S8UuTQ7tnUJG5WGHNiHZ1jFtwVJNVfyJUnBs//llR/8Q5gVvom54qegqmFP13bRxAgsh9pMmw+Z/GcRrklsSptBMtsLird5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773961063; c=relaxed/simple;
	bh=A5fdWSepkSgmkvMJpmG5ZlnAONFldDTK+KtfLvuP/z0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PmlcO0IlUrG3ka31r3Il1rktYY58T7YoH4t63tXU9q76wsQiA904qxjOascYTsPPLPtD5dIbBJXqraucrsbEAZVERtJlxzMw2usB1r0BronRmbUSYBIWyINK1DC/kjcbP9V0wgSw25U788nZUTrP2/Go/SSdv7FQTL0SyqI3tFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agw0uJg0; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agw0uJg0"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-950c41532e1so626007241.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773961060; x=1774565860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLzLy2hDM9Kbvx/sb4ZAms8XilnjagJUDNjtCCjNGlk=;
        b=Agw0uJg0KBWwTqvIlb4pqmstCRSK8ohWMEiCTertZP2G0OvMVRn2rBVwmi3Rk7y9Zk
         +37Vs7Ml5QQVnzihihZ3DO6AICqwzK9kxOMmErPtAnP4k66ZgwLgxwYsGAQIKGFWP3fO
         3v2tQ95cuL7w73gJpmb/iBxPKrm9omaOytfETxLUvcwI/oIr/AKopBKbHxQHbFlWSOXx
         egAak5TBEBmhyhWKXmVWia7MR7ZKVS9X0/iDYarVl8hllo8vJnB4G2+/sAYm3aRKQ+hp
         cp6XYb1J446e6nkGYSwBPFhOS/MoFcG04BErcSvWfsPeAbIXeP3ktnqCroX9Ux3hBuMK
         nM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773961060; x=1774565860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLzLy2hDM9Kbvx/sb4ZAms8XilnjagJUDNjtCCjNGlk=;
        b=bQUpgJYTmyfsxhEoNla84tXNSgbwfDjWTgH7sEWJm9z/5rqNaZZW/VAFU/cTtSnOwJ
         92o2/M/RVsnO6ZC5/lb3QCpIUgbA02kISY2YaUN0pfNt4WcB7axMIXo+EdrvC3iJ1jtw
         lyXJSgbRbTt5I5NGEb6NoUvi0FiT0wsZ/m30d4GK2lgElDGA/2ntvTIQPntRPK1hvqVB
         AIvSM2HDcoFksXpXpBrL+rpI1rzOjfga1qm4TX7bgO4DcM9BAzbrGyx1kB+xsoEaLajW
         Exlz2NlmaAPeRHEcEWJ1rJW/kvmGD6LgLPdJhFxxN0CfXxxqq0jPu03a4PTIbI9LSb9g
         rQMw==
X-Forwarded-Encrypted: i=1; AJvYcCUm1vXDeWw7umGZggby2tc3rvv+QqCr1xmEhXqqIeyevPPrYPrpQzE0LU2u86vLd/AzgEfHwHI4pjkXejN+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg7KhKHOq+/EImMmtuC8vYuZKbMJ23tQpmWyXydwLlrCRWXA6l
	lpflY8zpMbiiHMRZxA4jUrEshO0yhJVGkHmKzCm0XeQxRPMiZ6+M7Rad
X-Gm-Gg: ATEYQzxGs24+2wlMPqDRVJ/oEBusoioiU1plNzLmaDqFkzFlmNIDkFmMB2IyrTHh5lJ
	yhFxuwi09thsRb4ibM26oIqGyJiHAJFGmfwtSTKKrn1bUWFpM9+A2QY8rO1wDIkLkmBvDc01XwP
	8UuktURrOmD7SaXpriOjv5u/Gfh5CpkX6p36kb654NUbsrO6fyXs5MOkaCglb9tdY8ebhcCszyg
	G90iiDXV6/CiaaJFbfO7Zk6j20l2gGjYWPw5o+w/wggZyq2l2TKGWW6Y4cLjx3IWhJ8DunlJ6zi
	jcvK07OOsZzV+Zs8Hi2TOZ9IpjWkRrVIFw38oSG0L3bt6lHdPca4cuj1EtfF8uRqikQglJYDgPo
	5rH147RnZLNbCdrBc4jsIkmv7/uBxAi2hfA/EnLDYnL/ulWqoEKO1NUlwGzFRTu/VQwgyY0/rFY
	0pNSp8PRbijMrqyajWOTFFSSLn4GJW6lSSzw==
X-Received: by 2002:a05:6102:5494:b0:602:7627:6c4f with SMTP id ada2fe7eead31-602aecb757fmr653428137.17.1773961060208;
        Thu, 19 Mar 2026 15:57:40 -0700 (PDT)
Received: from localhost.localdomain ([149.102.251.107])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136bd79c0sm204828241.6.2026.03.19.15.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 15:57:39 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: iio: ad7816: use sysfs_emit() in show functions
Date: Thu, 19 Mar 2026 22:57:17 +0000
Message-Id: <20260319225719.73587-2-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260319225719.73587-1-grondon@gmail.com>
References: <20260319225719.73587-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in all sysfs attribute show
functions. sysfs_emit() is the preferred API for sysfs callbacks as
it is aware of the PAGE_SIZE buffer limit. No functional change.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135..0e32a2295 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -124,8 +124,8 @@ static ssize_t ad7816_show_mode(struct device *dev,
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
 	if (chip->mode)
-		return sprintf(buf, "power-save\n");
-	return sprintf(buf, "full\n");
+		return sysfs_emit(buf, "power-save\n");
+	return sysfs_emit(buf, "full\n");
 }
 
 static ssize_t ad7816_store_mode(struct device *dev,
@@ -156,7 +156,7 @@ static ssize_t ad7816_show_available_modes(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
 {
-	return sprintf(buf, "full\npower-save\n");
+	return sysfs_emit(buf, "full\npower-save\n");
 }
 
 static IIO_DEVICE_ATTR(available_modes, 0444, ad7816_show_available_modes,
@@ -169,7 +169,7 @@ static ssize_t ad7816_show_channel(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	return sprintf(buf, "%d\n", chip->channel_id);
+	return sysfs_emit(buf, "%d\n", chip->channel_id);
 }
 
 static ssize_t ad7816_store_channel(struct device *dev,
@@ -231,9 +231,9 @@ static ssize_t ad7816_show_value(struct device *dev,
 		data &= AD7816_TEMP_FLOAT_MASK;
 		if (value < 0)
 			data = BIT(AD7816_TEMP_FLOAT_OFFSET) - data;
-		return sprintf(buf, "%d.%.2d\n", value, data * 25);
+		return sysfs_emit(buf, "%d.%.2d\n", value, data * 25);
 	}
-	return sprintf(buf, "%u\n", data);
+	return sysfs_emit(buf, "%u\n", data);
 }
 
 static IIO_DEVICE_ATTR(value, 0444, ad7816_show_value, NULL, 0);
@@ -281,9 +281,9 @@ static ssize_t ad7816_show_oti(struct device *dev,
 		value = AD7816_BOUND_VALUE_MIN +
 			(chip->oti_data[chip->channel_id] -
 			AD7816_BOUND_VALUE_BASE);
-		return sprintf(buf, "%d\n", value);
+		return sysfs_emit(buf, "%d\n", value);
 	}
-	return sprintf(buf, "%u\n", chip->oti_data[chip->channel_id]);
+	return sysfs_emit(buf, "%u\n", chip->oti_data[chip->channel_id]);
 }
 
 static inline ssize_t ad7816_set_oti(struct device *dev,
-- 
2.33.0

