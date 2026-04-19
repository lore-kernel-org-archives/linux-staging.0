Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261F1DF75B
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 01:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776560743; cv=none; b=D40j9j3J95FV5GiWJ5vy2/Pas1nTYxR40sKWG9ghJN4CbbigajePDBpDIgxSAvdhACkQhoXAQSKODCjoR9NgvD166o/JLN69ZOAGLyjA4tzbyLllmFzI9trLjORze4mYXaBmW6F+79QGSCTKxY/n6WVPffIJUIPoDHrdRqwrOus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776560743; c=relaxed/simple;
	bh=+jTXEfHh/gOIUYWfxPrWRz07T1+dNIeDgB+atJW8LHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtNgJAVX/t7wWFYdKZai0wLVU49ueVVdTeFbq+gEn0q33NtCYdxTdHfmNJAaBqY7esECjQNOsvEg7EXhiLDWD+BL3KQRRhsIHQ+Mw92ZXtmbcQPf6xP6ssMr6dGn/959Y2DxP6TeOOuInc0afMPDM2IVj9x4Y5z2y+aqNVM15gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGAnCXjq; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGAnCXjq"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-470145d7e6eso879049b6e.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 18:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776560741; x=1777165541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/kO/B/YPv16fwXs3FVc8gLKrhCkxXiOBqE54B/j6U8=;
        b=qGAnCXjqO5E+dLNswMZLVF2+8n7Dj/fXNJb87D/oLLALGRzg5yb9PxIcaIk8SiuuuX
         iQwo9LOpogWNtDiTJBHtvvUVHzQ2fYF2Aq6CMNhyHz3NwgPgoSEY2hZnAww1fdKWy2nx
         N2+Px+z3iHmkVxQfMSnZIcki7TGRs4lM1jz8HfXyzQFr3autE9i0UjNKXKZsowFTBioW
         OitXJAATw1mJV92DvYJjC+Y9WTYO2yBLFdkpSSO5fvmYmas4q0t3UbxzYzaaVyxPktOH
         KA9Ls2kKQiIB4OTLWNPI4enQZMJgDm27lMc8+RkxaQK682U7wMUcZKulaJwDtGDTx7/B
         2Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776560741; x=1777165541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/kO/B/YPv16fwXs3FVc8gLKrhCkxXiOBqE54B/j6U8=;
        b=ZIE97mSjMuDndtyRTt54Mhen3FMAgx4OeYK+KGlKrRnbUsqjrvb9X7VVx6gJYY+SlO
         ArSTHRE5+ShQmfdztbWRdi4uRRneti6DAgSgduIfvMe/q052vaIJZUcSLDK1bhyrGhW0
         hk+13FIvS+IsRI1dICKPsmSNf83aCikN2sBZl1dZ/KIrMUEMOxHpo/EIKjKNnr9O44Qv
         Fao2IVMty+hM2bNX5Ki9rHKnFRMcBogtUSRO72GLr/VAaDb0S4tX9HgZtkp726xnPNCZ
         LzntluH7xoB98fbFtbDIFHSF1pM0plAp+oLWvQ44TBiE3rki5WJyG9IB6V31JmrSi19Z
         swQA==
X-Forwarded-Encrypted: i=1; AFNElJ+qG9SdPRn3oMJuN5Kx4x4x2LhMgaU5NFMhL/FjXlDkeMTo/lIssc7n63oqT5nrZIzz6GpJX0jtB2kMmuJl@lists.linux.dev
X-Gm-Message-State: AOJu0YxoEmDA7XtJjWB/s1frOrK008VZzVTmRzblv1OzVO8sdCLvOsGv
	sndPAe7zs95ehA8Ujl0BO32Vt7woppngY9qsEdENqVSfJ9A94JzwvBBD
X-Gm-Gg: AeBDietdiWENi8F8wkL+1pIg7r6oTxYnztMu7NSRtMn7oE/5GSEpc036TaGsNRQHo72
	IuB3qg6LD3H+bqDGXGKiy6tqp8EyVy1U0WAyrf5dzM78KUh4+NX58Cl4+RuDfnZhRX0j3+6IJ1K
	59TmSaOhq3jWU1O2RRMNfkssvttGx5HKUjv0TnrF9Ms8XwaR/XUUl0viYZBInj59QAw+u+PVmYr
	W8LDlO+bDdQMdgv96F1HWP1zk0NLy0KiVi9jx4IcUxpetuXmDKXwnbtMna0UWW+FHVKVx4zf48E
	Yxib1SAPhJeemfRORWtbvDmfd/i44VkBUfp5ys0yy+lzVP/0BdwP2BqtE09qfwSdTo+g7I5My0+
	LUOko0yerkoe+8A/4CofYG2Z/rT2E26TvJIv5edfBiCjSlcJcDdJSLLGgqGJ0RBvldbhRuEsdhb
	8HIFPqGGeOPeinU6kYTtqau9904BhrrPworKQofKHzrErO/7TwaYf960tf2gBbXtNCzXsT
X-Received: by 2002:a05:6808:4e89:b0:467:2be8:6673 with SMTP id 5614622812f47-4799c67cb72mr3427152b6e.0.1776560741037;
        Sat, 18 Apr 2026 18:05:41 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-479a02097b6sm3983367b6e.14.2026.04.18.18.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 18:05:40 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
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
Subject: [PATCH] staging: iio: adc: ad7816: replace sprintf with sysfs_emit
Date: Sat, 18 Apr 2026 20:05:37 -0500
Message-ID: <20260419010537.116002-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces sprintf calls in ad7816.c with sysfs_emit to help
modernize the driver, ensure bounds checking, and to increase stability.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135f3b..0e32a2295990 100644
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
2.53.0

