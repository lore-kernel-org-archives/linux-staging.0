Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA09282F1B
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043217; cv=none; b=VaJLixiATlj9mGR3CT/i3glXdCABjNe/2vdMpOCE6HDgeQaOKnOJV4+Z2MpNJTos7D5i0xE2deU9CGNHcl7BWHHt+AZXXwHm2cmu9j3SBRspNpLGgE0itVNieIpzAa0eQnB6ktc6VE4m9vvAjs0Kwu4jcM8smrFfB61qGBmPIYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043217; c=relaxed/simple;
	bh=g7uNErpww7LkDRGtVNGmRdf6PPweeBnnmZM5F/WNRJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SRgKD7e8Kbm3GOuRC+hBZjw9++w1I+1EYSBHr1vHFqXXzt+7EowEBs8l4v5r+GDCfUXESySejiQG3e/zp/TLkfSyS7rKqKrBxJZ+J05VXtYt7Tno2KGVj2gLFTrdWVHqJZXpEFHsoe2+XmFy8ZeMHSLKQBZorE4GEcjVnMTxR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZx1ws5/; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZx1ws5/"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c8f9846c8so7582672c88.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777043215; x=1777648015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=247B1qaVFj/YXlYhPiXykaqQnuOzRC0LqGxEuJfJas4=;
        b=aZx1ws5/LYS/KT+GfDn+RCE6/2loPuE91jOm30Yyc5Osa9mIR1P8HXpAAjtl4uZct7
         zJw6KEYcs8ODHisHzTO0yqR2ZJN2Z5KV3A4EL0BxgvJbjYI3wQNg7Ncd8ITd6nafN6fJ
         q+l31RTxnodp6euwyT2k999bhoq/ktvdhb0QXPiJ25wV+VPch7MAQu23V05cdhSgaSab
         EK01nZ1Za6OLjMPtpZGQNgHkg/+3alfLaH9pk4dWs5jVLN2SUvSoMNl1jTNqf9k+XlIQ
         HQmiEDb4ua+myI9y2urKOO+TFmxCoF600oIjrcvTVskqvgT32FOL6jGus/kBVf2V15r0
         /49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043215; x=1777648015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=247B1qaVFj/YXlYhPiXykaqQnuOzRC0LqGxEuJfJas4=;
        b=k9iUi4ZXV7VB9UOx9q4xEoilPYaDckqI3gYolkLGeU2ts9EUGADoBcFyKKIbR2NJFp
         XtYmAjx613LtaHTCjZOtmKxPdvQXKxYVpRoDq0DG1ztEX/N8Zmd1QwhohvnOD5mgO9A4
         mL5zzONBaE+aWhHlfcF10vbJnVskHnRSoIAp8Ni/3Fqpea6eZst50TpTYvpVpwpQX8e3
         9hk8AlYjwpFQstsu4U7sy5CiCpKLx72R5GeLxUqr/ms/qWfi7dYDwfGW4/F1MZhCtPlc
         ber491vba1/kFsx38D/nWHWMLrqqMD57Ian66RQzn9//rz1Un1yZlEmvr8H368O8K0fd
         3zRg==
X-Forwarded-Encrypted: i=1; AFNElJ/e7vt5j+yOocqdU09jxN4/8znXqaLvu6xDK6PeBAO0b/mBucQDCGdXEGPSe2FRzeRjFS5nZsrXMhFKbjRr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc3xAeV1N9WztqeX+2irVDvPv9LqepX2580Go9I/KiUBoHek6Y
	3/xDKbr9YFIprNheMnIZTZsl8pVCWppgRolWJeqFWAS/TdKlFkvC6kjT
X-Gm-Gg: AeBDieu3Py4l3yqXD+1IA6PnYS83xNpIw179NuikeNo8bjhHCYs0kGtdZ6abw+ACXNY
	EDQ/n6zgR7MhjKfW3DXS19NHvR1kmfJn9eGhGuqVgmPDOYFoY7flvJukdM/w0LcsnIRnDXL5raW
	ilxyFsn5bo1qzp9aGq0/pBJetIsSuSMw8meh8lrhkPEIWbTI6ARk1EnVd5bm5n/AfsGG/B2ssIX
	G1XOsIY2aq0vsohHYRBMLOETScQPAtr2GPfWD0NyMhVvwB76DyJsM32SWcmR7kwsb0C8mFhqHkR
	734oSr67kmZnBN5wsgwfpUjB0MZyVBrECqfiB3vDICfmYs0eof/BOBzJSwoO26CYEcpSRndg8qU
	9Abw1jn2nXSEGtohueabrvbJnfkX3JbqXYbiO4ur9oHJe6XVqAOsA0w3z8D4C3VEOZEY7SD57pY
	ImNu7T9fO9x8CAqm3AFbA4yUBzX56AAImX5g+QtFqh4htydwYbD+9w1NcopKNhzqno
X-Received: by 2002:a05:7022:220f:b0:12a:713b:8953 with SMTP id a92af1059eb24-12c73f72283mr17166787c88.12.1777043214763;
        Fri, 24 Apr 2026 08:06:54 -0700 (PDT)
Received: from DESKTOP-R76JGJA.localdomain (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc6f08eaesm3558952c88.12.2026.04.24.08.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:06:54 -0700 (PDT)
From: kunjinkao-os <kunjinkao.jp@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kunjinkao-os <kunjinkao.jp@gmail.com>
Subject: [PATCH] staging: iio: adc: ad7816: Replace sprintf() with sysfs_emit()
Date: Fri, 24 Apr 2026 23:06:17 +0800
Message-ID: <20260424150617.28194-1-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs_emit() is the preferred function for sysfs show callbacks as it
is aware of the PAGE_SIZE buffer and prevents potential buffer overflows.
No functional change intended.

Signed-off-by: kunjinkao-os <kunjinkao.jp@gmail.com>
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
2.43.0

