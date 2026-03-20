Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A47371055
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 22:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045472; cv=none; b=H7y2E/GCJ4DyPk7Zk8lVGFwlXKC1BlRuYAmJA+nG/SmxlZpauojug0nZKwOw0XJshfjeNFhhQBohBluWo4Ck5aHQC7zurThd0JAt3S+O6EZCv9CQSnABPVNNyujtPpFcsEnGbxClVuSg+pUbnS6lQiUWXGBcDh7bW88fbBcXC3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045472; c=relaxed/simple;
	bh=A5fdWSepkSgmkvMJpmG5ZlnAONFldDTK+KtfLvuP/z0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dLds/HexlthEKk6bJwF9TCuZhKORpE3s0YStln1IbIk26Cm8QqL5VGXJRvFqnVeHKasDF/c7N7oCSvkzq6KjTifZ3+LOYxGCW5/NUXUWVnt6J1a5KcrQAsu9PCI7QgTEAk39/d3I+bbmlDE7iGBqJXuJYy478pInHWYuE8cewCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM2vk9uI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM2vk9uI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so9992025e9.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774045470; x=1774650270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLzLy2hDM9Kbvx/sb4ZAms8XilnjagJUDNjtCCjNGlk=;
        b=gM2vk9uICdSUGAhby22gjRinzhC9+1cPIPChoYyImkPLT5AVD7AZ4s8bIO0paSLYff
         d379BSfmfQ2FX7AF3Eqz4o8gOPidIFB8Knmr00k6Tmvd0t3HHZWVP5CcyuTlq2ionBqs
         5oNqjLWqR/AXV2OcvkeeTJAXGvV+Pfpfns3VEbV7xd0GRvOrBl6rvfriGT6a0XOVzXlX
         093UNaNwoAhnBliWuIpU3dtDxVGQP0Zce324MaXSFkhLeXqsdR5OZ10BFdKNjWpYpX11
         5cbxfnm+HwZ9x9m3OU8yOY6koUX6EUiCpcWHcbv8S0v7ZyLz06kU22CVMYqim8Bh87dZ
         r2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774045470; x=1774650270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLzLy2hDM9Kbvx/sb4ZAms8XilnjagJUDNjtCCjNGlk=;
        b=FlQZYOcQzcSrNDKMhBPZdT0h5b4rnds1H4pxaY/shG1+PovI5iDcAFxmKTUBKX3Fv5
         5vequEeYJmAxAYcydGNjp8LaL2mIqqsHsgZEtyWw4AoPeDX78/JKO2yNSB3Hgst2LOVk
         OviSEm2qphAHDHVs/ytVz85i6RCfOzdgVBghksschOIKANNtSgkLNt+UB90H+ooEpR1Z
         79u/yxXPvn8MospUBhLJpgffmwvD4X63b/5SwQ9czrz0ZB2sdVoQx4tPDneUCrI7qOYT
         tdrZOADxtsdkl3D2/dOmTqnZmRWXAhT+ITHhNxIqfSW15NXnnKmkG58SololSh0M4dvp
         eLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgdaGPlPAOiPg0rbCqaS+1g5peirtwPewMXG0ODs4bpTKojftG7wJUR71/AOtJzH5GnGDdXkI0BUb4yUPd@lists.linux.dev
X-Gm-Message-State: AOJu0YwedR3VfBCntePypbv+NEy57mw3yZtC04/CwH2EWeW2I1Jc9Xer
	A+8TcT3yFoiErEvaJc+e3GJPY2k0Mx7eTiy9AQWydlLMaGBROVR0R/yh
X-Gm-Gg: ATEYQzxbJlkzri6DVtVmo6XMBHIwiTs8Og0bnlTo12/P9rYSLn7HlSgXTTCJJVDBLZu
	FaYw8nxCZdBMuIJpX/CnOCos70bBFdMCxcJHrxLhncF23GOgTGJy+WuSxeLghK1PJAm6K+ZEn48
	Oexvxn/C+NUsVdRGJGk3j6fwgMunsPzC5J/w6NFDtoEjxT8QiJi+uuCnR60J5oK1qqxNT7KjdCA
	2NeAIrO6HkVWgNZq9+BaoLBMNqicdz2lY6eHbPvZ/fZPZ/QKMuIN7zDopgIFs8rC7Tgq14QeeVh
	MyMresChTuk5/sN9tM8lcxFN2Wk+PWl3hh175orZGg5nmGcRS46P8cx4dE6G1pWKkm1Z5h2lPW+
	693eTk535ziyQcVD9M8qweEkldl2QobVOcRFXQ4A5okbLV1bPtry0Dy/AfGm9nddb7mZZZP6OHz
	6iOmniyX8z36wfguP0EoMz9aejmpitdI+jCeN7zN3avpCtK3aw3ORioREM6Q==
X-Received: by 2002:a05:600c:17d8:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-486ff0291d7mr40807615e9.19.1774045469730;
        Fri, 20 Mar 2026 15:24:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:bc11:6b0a:79ed:3d9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae016sm9290237f8f.4.2026.03.20.15.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 15:24:29 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: iio: ad7816: use sysfs_emit() in show functions
Date: Fri, 20 Mar 2026 22:24:22 +0000
Message-Id: <20260320222424.53294-2-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260320222424.53294-1-grondon@gmail.com>
References: <20260319225719.73587-1-grondon@gmail.com>
 <20260320222424.53294-1-grondon@gmail.com>
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

