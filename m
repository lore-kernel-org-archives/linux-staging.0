Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF1A27462
	for <linux-staging@lists.linux.dev>; Sun, 16 Nov 2025 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763288197; cv=none; b=hFkRG0uC8kSObMLrsimerXMRskmcD4729TLp9oE8KxFRRf/BBw9730uZHmTvYRJMMynpSzlyz90HuIQ5LOjIiqHXBZkUFyevyugRxLDJv8iDe8C4bP3l1UC+dp5t0wvrMQdRUB8tRgAN1FF8JeFkF67Vlmgv5XZMH283vNCJSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763288197; c=relaxed/simple;
	bh=PX3kbJy6p346aXkX3jWQ088+ubxGjRVNknaGa4EmYg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fApuk6VsZp9QrbwaFGEZqp0bxJC4AedyphL1sn9yCFLfv3x9WFsXyI0EKJMA2NkcneTOHBmeCLME0fgLvwk9TPBtN8zvjPfA3txLMwU1Za/hy/UrnXmKignV+aeWNj3CypAhj9zCvMxYmj+0C/J3Mz4D202u8LTO0x4P4j5VGes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbxTjony; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbxTjony"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29516a36affso36879245ad.3
        for <linux-staging@lists.linux.dev>; Sun, 16 Nov 2025 02:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763288195; x=1763892995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjYtpX1lebOskMnzvVTTSI6mb87mpdpqQgcf6GE5d74=;
        b=lbxTjony07l880CGywO7iPMmmKek41R90UyFIj8/YYRjhTSmN6ofzUFO9c/foMwG9I
         e8nbrHiJq9ME2t4QWoupjVlt9RnhK9EjT4l1r44Gb5D5ipi/vxacAlppAEQi4pnvIqJi
         GiwFqC7J6X6nclX0KIPEDNPkgFUdERnjcMlUnnZtXlP3HP7rYlFKNbes9zgQlGMFa/37
         sAF6+dR/eIP10o7Fv6dLmX0zIz2fHS/wBnDyM71xZkKzEB9NjZstmQLMBJ+Xk69HHJLm
         vo0rnR3V/6nVifJjrDOPoJ8Z/2Xvi4nvnnRNCJjJ1S86jq2uUOKjMxSZ6NA1T30lwwnj
         4AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763288195; x=1763892995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjYtpX1lebOskMnzvVTTSI6mb87mpdpqQgcf6GE5d74=;
        b=rupBmqeTExveE2Oq4zluEYErO+f7G0wf+Kl3baSBeypAVnCzMaFzphqFTUzPP0Gh2p
         39IKsLKaPgMwI9jDbskyKmrh/DWNrRJYhjzYaqGhn3JgX8xV3S1JK1v45WgSOeU03JP3
         exOESOHZ+frEUutxW7OwSouICrUoFQ9FKttg4kyfyZmdtobEC9b0dvF0fPBi4Us0RVcP
         tDkw/UeTnImPB+lUuHQCT7r0/yslJCnjgBkeojqsCOx+McAovg3NAZlz5EmtFh0RBTk5
         WcEGMiTFxrSJTNKJ2lTD4ls1w2ano8ng142fXbEGtnUHSo7eE3YMMinkIDO96Jfu5Z6/
         vCLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+95OZilRFFL9OEGi+Up8I5QTilyJbbnFLvlrsw7heDZUfgsXOtiRVqjGL/iHH9UD8s/mbTtw0igdo/EKe@lists.linux.dev
X-Gm-Message-State: AOJu0YzjRgefh70j2u8MtckwajHt5eTEc5JH2L+9Fafe82pdkkTYc/1H
	47xJZEd8jk63A1fVOdjnN/+PaqOGKNlV5JDlS+f1UMhaBYgBBtKTkvWV
X-Gm-Gg: ASbGncvBo47W/CAexSMcgItfT/Q4utRImnnqQ9p8azmR0dzFKMu7hH9sY5vyIyskky2
	fle8jfrOC1/1VFFEa7qJzKR4oBXIFCT6GFVlRFZeNyXKCXJnC+6cedAwhJ49AykeAk6MPWWmTC7
	sxnaGBOwtQpD66TD0zEaq0Vnp+I+nvswLwlOfGDvt7EBdildud8yifMwMmLPCAdaqQFQYCdkzYf
	cxX6kJQVLKNQxnbLl2sYl1doQlwUFFz2Dq5s1x3sCdOWozdPLnNsup1fIvSPznwRoeYqczwlls2
	ZyZ6ED7vXmDloSqvnUuWe2xIDCQv1q3J+sdNGoeI1V4tJcLYAylbRk9s8/GSlPP8vFl+1DKLdOR
	ebJ6FdVywcWk2hefxOkUZwCOQ5rbwUjBs+T0ORFRItzP1JDtooXv6TfmMWGcP6b5jp9Hnq1Goqv
	Nvmg1945MsSg==
X-Google-Smtp-Source: AGHT+IGqHrD4qNPte4meU/bhor0Mrtltf8SSZmdkQKJ9PyLJUmi9/aFa+KU+2AMvmwtV+k1qpEhrrw==
X-Received: by 2002:a17:902:f712:b0:295:560a:e499 with SMTP id d9443c01a7336-2986a6abdc5mr109347795ad.5.1763288194893;
        Sun, 16 Nov 2025 02:16:34 -0800 (PST)
Received: from fedora ([2401:4900:1f33:fd64:ee54:1322:b5b:2b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf158sm107546815ad.91.2025.11.16.02.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 02:16:34 -0800 (PST)
From: Shi Hao <i.shihao.999@gmail.com>
To: Michael.Hennerich@analog.com
Cc: lars@metafoo.de,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH] staging: iio: adt7316: replace sprintf() with sysfs_emit()
Date: Sun, 16 Nov 2025 15:46:20 +0530
Message-ID: <20251116101620.25277-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert several sprintf() calls to sysfs_emit() in the
sysfs show functions, as it is the preferred helper and
prevents potential buffer overruns.

No functional changes intended.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 102 ++++++++++++++--------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 16f30c4f1aa0..8a9a8262c2be 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -216,7 +216,7 @@ static ssize_t adt7316_show_enabled(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n", !!(chip->config1 & ADT7316_EN));
+	return sysfs_emit(buf, "%d\n", !!(chip->config1 & ADT7316_EN));
 }

 static ssize_t _adt7316_store_enabled(struct adt7316_chip_info *chip,
@@ -274,7 +274,7 @@ static ssize_t adt7316_show_select_ex_temp(struct device *dev,
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;

-	return sprintf(buf, "%d\n", !!(chip->config1 & ADT7516_SEL_EX_TEMP));
+	return sysfs_emit(buf, "%d\n", !!(chip->config1 & ADT7516_SEL_EX_TEMP));
 }

 static ssize_t adt7316_store_select_ex_temp(struct device *dev,
@@ -316,9 +316,9 @@ static ssize_t adt7316_show_mode(struct device *dev,
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

 	if (chip->config2 & ADT7316_AD_SINGLE_CH_MODE)
-		return sprintf(buf, "single_channel\n");
+		return sysfs_emit(buf, "single_channel\n");

-	return sprintf(buf, "round_robin\n");
+	return sysfs_emit(buf, "round_robin\n");
 }

 static ssize_t adt7316_store_mode(struct device *dev,
@@ -353,7 +353,7 @@ static ssize_t adt7316_show_all_modes(struct device *dev,
 				      struct device_attribute *attr,
 				      char *buf)
 {
-	return sprintf(buf, "single_channel\nround_robin\n");
+	return sysfs_emit(buf, "single_channel\nround_robin\n");
 }

 static IIO_DEVICE_ATTR(all_modes, 0444, adt7316_show_all_modes, NULL, 0);
@@ -370,29 +370,29 @@ static ssize_t adt7316_show_ad_channel(struct device *dev,

 	switch (chip->config2 & ADT7516_AD_SINGLE_CH_MASK) {
 	case ADT7316_AD_SINGLE_CH_VDD:
-		return sprintf(buf, "0 - VDD\n");
+		return sysfs_emit(buf, "0 - VDD\n");
 	case ADT7316_AD_SINGLE_CH_IN:
-		return sprintf(buf, "1 - Internal Temperature\n");
+		return sysfs_emit(buf, "1 - Internal Temperature\n");
 	case ADT7316_AD_SINGLE_CH_EX:
 		if (((chip->id & ID_FAMILY_MASK) == ID_ADT75XX) &&
 		    (chip->config1 & ADT7516_SEL_AIN1_2_EX_TEMP_MASK) == 0)
-			return sprintf(buf, "2 - AIN1\n");
+			return sysfs_emit(buf, "2 - AIN1\n");

-		return sprintf(buf, "2 - External Temperature\n");
+		return sysfs_emit(buf, "2 - External Temperature\n");
 	case ADT7516_AD_SINGLE_CH_AIN2:
 		if ((chip->config1 & ADT7516_SEL_AIN1_2_EX_TEMP_MASK) == 0)
-			return sprintf(buf, "3 - AIN2\n");
+			return sysfs_emit(buf, "3 - AIN2\n");

-		return sprintf(buf, "N/A\n");
+		return sysfs_emit(buf, "N/A\n");
 	case ADT7516_AD_SINGLE_CH_AIN3:
 		if (chip->config1 & ADT7516_SEL_AIN3)
-			return sprintf(buf, "4 - AIN3\n");
+			return sysfs_emit(buf, "4 - AIN3\n");

-		return sprintf(buf, "N/A\n");
+		return sysfs_emit(buf, "N/A\n");
 	case ADT7516_AD_SINGLE_CH_AIN4:
-		return sprintf(buf, "5 - AIN4\n");
+		return sysfs_emit(buf, "5 - AIN4\n");
 	default:
-		return sprintf(buf, "N/A\n");
+		return sysfs_emit(buf, "N/A\n");
 	}
 }

@@ -453,10 +453,10 @@ static ssize_t adt7316_show_all_ad_channels(struct device *dev,
 		return -EPERM;

 	if ((chip->id & ID_FAMILY_MASK) == ID_ADT75XX)
-		return sprintf(buf, "0 - VDD\n1 - Internal Temperature\n"
+		return sysfs_emit(buf, "0 - VDD\n1 - Internal Temperature\n"
 				"2 - External Temperature or AIN1\n"
 				"3 - AIN2\n4 - AIN3\n5 - AIN4\n");
-	return sprintf(buf, "0 - VDD\n1 - Internal Temperature\n"
+	return sysfs_emit(buf, "0 - VDD\n1 - Internal Temperature\n"
 			"2 - External Temperature\n");
 }

@@ -470,7 +470,7 @@ static ssize_t adt7316_show_disable_averaging(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		!!(chip->config2 & ADT7316_DISABLE_AVERAGING));
 }

@@ -509,7 +509,7 @@ static ssize_t adt7316_show_enable_smbus_timeout(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		!!(chip->config2 & ADT7316_EN_SMBUS_TIMEOUT));
 }

@@ -548,7 +548,7 @@ static ssize_t adt7316_show_powerdown(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n", !!(chip->config1 & ADT7316_PD));
+	return sysfs_emit(buf, "%d\n", !!(chip->config1 & ADT7316_PD));
 }

 static ssize_t adt7316_store_powerdown(struct device *dev,
@@ -586,7 +586,7 @@ static ssize_t adt7316_show_fast_ad_clock(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n", !!(chip->config3 & ADT7316_ADCLK_22_5));
+	return sysfs_emit(buf, "%d\n", !!(chip->config3 & ADT7316_ADCLK_22_5));
 }

 static ssize_t adt7316_store_fast_ad_clock(struct device *dev,
@@ -626,10 +626,10 @@ static ssize_t adt7316_show_da_high_resolution(struct device *dev,

 	if (chip->config3 & ADT7316_DA_HIGH_RESOLUTION) {
 		if (chip->id != ID_ADT7318 && chip->id != ID_ADT7519)
-			return sprintf(buf, "1 (10 bits)\n");
+			return sysfs_emit(buf, "1 (10 bits)\n");
 	}

-	return sprintf(buf, "0 (8 bits)\n");
+	return sysfs_emit(buf, "0 (8 bits)\n");
 }

 static ssize_t adt7316_store_da_high_resolution(struct device *dev,
@@ -673,7 +673,7 @@ static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;

-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		!!(chip->config3 & ADT7516_AIN_IN_VREF));
 }

@@ -716,7 +716,7 @@ static ssize_t adt7316_show_enable_prop_DACA(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		!!(chip->config3 & ADT7316_EN_IN_TEMP_PROP_DACA));
 }

@@ -755,7 +755,7 @@ static ssize_t adt7316_show_enable_prop_DACB(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		!!(chip->config3 & ADT7316_EN_EX_TEMP_PROP_DACB));
 }

@@ -794,7 +794,7 @@ static ssize_t adt7316_show_DAC_2Vref_ch_mask(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "0x%x\n",
+	return sysfs_emit(buf, "0x%x\n",
 		chip->dac_config & ADT7316_DA_2VREF_CH_MASK);
 }

@@ -838,20 +838,20 @@ static ssize_t adt7316_show_DAC_update_mode(struct device *dev,
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

 	if (!(chip->config3 & ADT7316_DA_EN_VIA_DAC_LDAC))
-		return sprintf(buf, "manual\n");
+		return sysfs_emit(buf, "manual\n");

 	switch (chip->dac_config & ADT7316_DA_EN_MODE_MASK) {
 	case ADT7316_DA_EN_MODE_SINGLE:
-		return sprintf(buf,
+		return sysfs_emit(buf,
 			"0 - auto at any MSB DAC writing\n");
 	case ADT7316_DA_EN_MODE_AB_CD:
-		return sprintf(buf,
+		return sysfs_emit(buf,
 			"1 - auto at MSB DAC AB and CD writing\n");
 	case ADT7316_DA_EN_MODE_ABCD:
-		return sprintf(buf,
+		return sysfs_emit(buf,
 			"2 - auto at MSB DAC ABCD writing\n");
 	default: /* ADT7316_DA_EN_MODE_LDAC */
-		return sprintf(buf, "3 - manual\n");
+		return sysfs_emit(buf, "3 - manual\n");
 	}
 }

@@ -898,11 +898,11 @@ static ssize_t adt7316_show_all_DAC_update_modes(struct device *dev,
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

 	if (chip->config3 & ADT7316_DA_EN_VIA_DAC_LDAC)
-		return sprintf(buf, "0 - auto at any MSB DAC writing\n"
+		return sysfs_emit(buf, "0 - auto at any MSB DAC writing\n"
 				"1 - auto at MSB DAC AB and CD writing\n"
 				"2 - auto at MSB DAC ABCD writing\n"
 				"3 - manual\n");
-	return sprintf(buf, "manual\n");
+	return sysfs_emit(buf, "manual\n");
 }

 static IIO_DEVICE_ATTR(all_DAC_update_modes, 0444,
@@ -955,7 +955,7 @@ static ssize_t adt7316_show_DA_AB_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		!!(chip->dac_config & ADT7316_VREF_BYPASS_DAC_AB));
 }

@@ -994,7 +994,7 @@ static ssize_t adt7316_show_DA_CD_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		!!(chip->dac_config & ADT7316_VREF_BYPASS_DAC_CD));
 }

@@ -1034,10 +1034,10 @@ static ssize_t adt7316_show_DAC_internal_Vref(struct device *dev,
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

 	if ((chip->id & ID_FAMILY_MASK) == ID_ADT75XX)
-		return sprintf(buf, "0x%x\n",
+		return sysfs_emit(buf, "0x%x\n",
 			(chip->ldac_config & ADT7516_DAC_IN_VREF_MASK) >>
 			ADT7516_DAC_IN_VREF_OFFSET);
-	return sprintf(buf, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		       !!(chip->ldac_config & ADT7316_DAC_IN_VREF));
 }

@@ -1128,7 +1128,7 @@ static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,

 		data = msb << ADT7316_T_VALUE_FLOAT_OFFSET;
 		data |= (lsb & ADT7316_LSB_VDD_MASK) >> ADT7316_LSB_VDD_OFFSET;
-		return sprintf(buf, "%d\n", data);
+		return sysfs_emit(buf, "%d\n", data);
 	default: /* ex_temp and ain */
 		ret = chip->bus.read(chip->bus.client,
 			ADT7316_LSB_EX_TEMP_AIN, &lsb);
@@ -1146,7 +1146,7 @@ static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,
 			(ADT7316_MSB_EX_TEMP - ADT7316_AD_MSB_DATA_BASE))));

 		if ((chip->id & ID_FAMILY_MASK) == ID_ADT75XX)
-			return sprintf(buf, "%d\n", data);
+			return sysfs_emit(buf, "%d\n", data);

 		break;
 	}
@@ -1157,7 +1157,7 @@ static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,
 		sign = '-';
 	}

-	return sprintf(buf, "%c%d.%.2d\n", sign,
+	return sysfs_emit(buf, "%c%d.%.2d\n", sign,
 		(data >> ADT7316_T_VALUE_FLOAT_OFFSET),
 		(data & ADT7316_T_VALUE_FLOAT_MASK) * 25);
 }
@@ -1247,7 +1247,7 @@ static ssize_t adt7316_show_temp_offset(struct adt7316_chip_info *chip,
 	if (val & 0x80)
 		data -= 256;

-	return sprintf(buf, "%d\n", data);
+	return sysfs_emit(buf, "%d\n", data);
 }

 static ssize_t adt7316_store_temp_offset(struct adt7316_chip_info *chip,
@@ -1415,7 +1415,7 @@ static ssize_t adt7316_show_DAC(struct adt7316_chip_info *chip,
 		data = lsb >> ADT7316_DA_10_BIT_LSB_SHIFT;
 	data |= msb << offset;

-	return sprintf(buf, "%d\n", data);
+	return sysfs_emit(buf, "%d\n", data);
 }

 static ssize_t adt7316_store_DAC(struct adt7316_chip_info *chip,
@@ -1568,7 +1568,7 @@ static ssize_t adt7316_show_device_id(struct device *dev,
 	if (ret)
 		return -EIO;

-	return sprintf(buf, "%d\n", id);
+	return sysfs_emit(buf, "%d\n", id);
 }

 static IIO_DEVICE_ATTR(device_id, 0444, adt7316_show_device_id, NULL, 0);
@@ -1586,7 +1586,7 @@ static ssize_t adt7316_show_manufactorer_id(struct device *dev,
 	if (ret)
 		return -EIO;

-	return sprintf(buf, "%d\n", id);
+	return sysfs_emit(buf, "%d\n", id);
 }

 static IIO_DEVICE_ATTR(manufactorer_id, 0444,
@@ -1605,7 +1605,7 @@ static ssize_t adt7316_show_device_rev(struct device *dev,
 	if (ret)
 		return -EIO;

-	return sprintf(buf, "%d\n", rev);
+	return sysfs_emit(buf, "%d\n", rev);
 }

 static IIO_DEVICE_ATTR(device_rev, 0444, adt7316_show_device_rev, NULL, 0);
@@ -1624,9 +1624,9 @@ static ssize_t adt7316_show_bus_type(struct device *dev,
 		return -EIO;

 	if (stat)
-		return sprintf(buf, "spi\n");
+		return sysfs_emit(buf, "spi\n");

-	return sprintf(buf, "i2c\n");
+	return sysfs_emit(buf, "i2c\n");
 }

 static IIO_DEVICE_ATTR(bus_type, 0444, adt7316_show_bus_type, NULL, 0);
@@ -1836,7 +1836,7 @@ static ssize_t adt7316_show_int_mask(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "0x%x\n", chip->int_mask);
+	return sysfs_emit(buf, "0x%x\n", chip->int_mask);
 }

 /*
@@ -1910,7 +1910,7 @@ static inline ssize_t adt7316_show_ad_bound(struct device *dev,
 			data -= 256;
 	}

-	return sprintf(buf, "%d\n", data);
+	return sysfs_emit(buf, "%d\n", data);
 }

 static inline ssize_t adt7316_set_ad_bound(struct device *dev,
@@ -1961,7 +1961,7 @@ static ssize_t adt7316_show_int_enabled(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);

-	return sprintf(buf, "%d\n", !!(chip->config1 & ADT7316_INT_EN));
+	return sysfs_emit(buf, "%d\n", !!(chip->config1 & ADT7316_INT_EN));
 }

 static ssize_t adt7316_set_int_enabled(struct device *dev,
--
2.51.0

