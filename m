Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8233A3E97
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427000; cv=none; b=Iig7Kg2OGsXZeDNDbVGoi5piL2I6PvEM3eVM0S35fHCqlDQxz2AUPZ7hghNhgzu3wArdzOmVo2E9mB4VJJITa6rZ2MEiFTKD5TlRKF8Lm4tQqA3heCwrLpT2F7Y0102tx5wMoQ//JqodtADHK7xdtKLLjp13SFgCrGULPn5mA+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427000; c=relaxed/simple;
	bh=zJTu9veXEM3Lrrt040/1KsikJHjCRx0dCltdW93CFPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gL8s8gHwLUbeDnhNuJTGo7ePX+d1cv1mfFAPnE7pqVrC1ZRAyX9m09HE7kYK12FepJl6u0awcttMjP/PPsQ6R8XXfMKyuv64uG0BiEqj3vSOXl2djtjkCKy1ccbjCkL613diz5QB6u638THFnalgNESbitaSf6l55qP0Pn0awQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4f9U1Q9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4f9U1Q9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so13807005e9.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780426997; x=1781031797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNX7HWh/NKDhCbF70pYqvTRR2al/vJaAaaX8bCfRONo=;
        b=C4f9U1Q9MSahKwnCKd9uOZH2HwDvT4xbtpIxYCQcKphpjQsRc54hTspW9zY+BoGB9X
         e/oC+BFlIf4FTDeOdeh7a7mdgeyW+y3uB3Xcx/jHx75XjS+DlwHQBMarr+bsHs3nPaam
         Ec0CB8EBDIjVx0iMA0+IVwsP9WDded7+mg2kxvR8P4VEGiB7W1EssFibecwkbg4sMfIb
         aEoDfzRNVXPxM2s3FH1eojSj/zl2orEO+vdPyEmPFlKysq8T7KH609cK3BvGEWTU9fAX
         P4xNxgKrwaJjdqFAcL/WgSUbcfJ5l1PGSNNuJZr3g5/4jPbOK2MpRaB9dTTZCY1hebcb
         vi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780426997; x=1781031797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNX7HWh/NKDhCbF70pYqvTRR2al/vJaAaaX8bCfRONo=;
        b=J/6nFzXmeI3QO1IDJV3yNzzlXCTGzWT8PzwFbJnyy/+RhrSjxqM7rX9xIF0cBByzRT
         tm5FXPp//9lItOlsBeqLL3TGPUxai0eVnd8RIWVADDD/cyotv1HzcFB7OnfTvBgoz9b8
         EBd1kPe0gvj7Hqf+0cOwJu2JC1DsLFi8RK5Kwf8Y2GHGhcdswBpfmp/4VAP0jmCh213s
         IQCzfxqt3kbnesoke1cgI0QzJWMzo8yuNta9MetxINODRHNfA1xmb3EcxRyTlAlQCW5/
         ZRoh8ZVberUzFxMZc9sMU35/kvIWovs01Do6ou9Ed0/JZawNCZfnvvOrrxQmG1uZhhbP
         LA+g==
X-Gm-Message-State: AOJu0YzySvb5Jx09wu6NQ+jjH5y78NA9z1XZr4EV4E4ns3XpHRDtdaZA
	2Zrtu+SkfVBF6g/gmG2/xsS1LoM2OoEsfWnw685rZTYC6AOdvFPc9Dvf9PqAwg==
X-Gm-Gg: Acq92OH2N0eyyCKH1fHlUutlywjiU2mWf6Gd/W67gnV9iXmJ7CIcR7VjHETnXTVWdpq
	OvDGE6wrMe36O+uP71/tZ10U9YoyuWlKsBHFk2AGw66m/AYfOzTW3+IqCsWTlp4VFNUEZh94LA5
	6dY+Mh1hUbFuy5gh8kb0Enk/ZOeAlSO94U7urqWLbjUgTznv9czvGC0+7mB30jAqLCMpxH4KrxN
	mvl3sB381sctYuvqYvY+PqunKO7lduyd4gO0XaX5grh4XLmX0rpED4z7YpWRHVUsJAmzND1JMX4
	vjb+1a29XGtzXdx7fOEqeR1htVt4kgh9lDEvgF0pHY27GC1Wawe7KchiVEZOjlwyc6ebT9sGODo
	uCahwfXvWe6KEZl6ldMX/FfnQ222R/U5bAGJoeGqyYBUbnzoYZ7yEDATZ48NMqdO+4pUuNrNsK0
	vOOobyjhgrQljX7dOonA/eh2HlILSxh2YK2y51a8YITPaTtJIAQ6y1FsTsg5Vu1rmr/PuIgsPJg
	7JPtsL1zZ2M+AOO28nrTjkG8g==
X-Received: by 2002:a05:600c:3495:b0:490:3c90:2cda with SMTP id 5b1f17b1804b1-490b5ed636amr1404525e9.20.1780426996666;
        Tue, 02 Jun 2026 12:03:16 -0700 (PDT)
Received: from fedora ([105.190.243.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm1374473f8f.37.2026.06.02.12.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:03:16 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v2] staging: iio: addac: fix CamelCase naming in adt7316
Date: Tue,  2 Jun 2026 20:03:08 +0100
Message-ID: <20260602190308.158051-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch flagged a few CamelCase names in this driver.
AIN and DAC prefixes are lowercased as standard kernel style.
Vref is kept capitalized since V stands for Voltage and is a
proper technical abbreviation.

DA_AB and DA_CD are renamed to dac_ab and dac_cd to match the
register constants ADT7316_VREF_BYPASS_DAC_AB and
ADT7316_VREF_BYPASS_DAC_CD that they reference.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 64 ++++++++++++++---------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 8a9a8262c..b5d62f1d3 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -663,7 +663,7 @@ static IIO_DEVICE_ATTR(da_high_resolution, 0644,
 		adt7316_store_da_high_resolution,
 		0);
 
-static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
+static ssize_t adt7316_show_ain_internal_Vref(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -677,7 +677,7 @@ static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
 		!!(chip->config3 & ADT7516_AIN_IN_VREF));
 }
 
-static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
+static ssize_t adt7316_store_ain_internal_Vref(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -704,9 +704,9 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(AIN_internal_Vref, 0644,
-		adt7316_show_AIN_internal_Vref,
-		adt7316_store_AIN_internal_Vref,
+static IIO_DEVICE_ATTR(ain_internal_Vref, 0644,
+		adt7316_show_ain_internal_Vref,
+		adt7316_store_ain_internal_Vref,
 		0);
 
 static ssize_t adt7316_show_enable_prop_DACA(struct device *dev,
@@ -787,7 +787,7 @@ static IIO_DEVICE_ATTR(enable_proportion_DACB, 0644,
 		       adt7316_store_enable_prop_DACB,
 		       0);
 
-static ssize_t adt7316_show_DAC_2Vref_ch_mask(struct device *dev,
+static ssize_t adt7316_show_dac_2Vref_ch_mask(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -798,7 +798,7 @@ static ssize_t adt7316_show_DAC_2Vref_ch_mask(struct device *dev,
 		chip->dac_config & ADT7316_DA_2VREF_CH_MASK);
 }
 
-static ssize_t adt7316_store_DAC_2Vref_ch_mask(struct device *dev,
+static ssize_t adt7316_store_dac_2Vref_ch_mask(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -825,9 +825,9 @@ static ssize_t adt7316_store_DAC_2Vref_ch_mask(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DAC_2Vref_channels_mask, 0644,
-		       adt7316_show_DAC_2Vref_ch_mask,
-		       adt7316_store_DAC_2Vref_ch_mask,
+static IIO_DEVICE_ATTR(dac_2Vref_channels_mask, 0644,
+		       adt7316_show_dac_2Vref_ch_mask,
+		       adt7316_store_dac_2Vref_ch_mask,
 		       0);
 
 static ssize_t adt7316_show_DAC_update_mode(struct device *dev,
@@ -948,7 +948,7 @@ static IIO_DEVICE_ATTR(update_DAC, 0644,
 		       adt7316_store_update_DAC,
 		       0);
 
-static ssize_t adt7316_show_DA_AB_Vref_bypass(struct device *dev,
+static ssize_t adt7316_show_dac_ab_Vref_bypass(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -959,7 +959,7 @@ static ssize_t adt7316_show_DA_AB_Vref_bypass(struct device *dev,
 		!!(chip->dac_config & ADT7316_VREF_BYPASS_DAC_AB));
 }
 
-static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
+static ssize_t adt7316_store_dac_ab_Vref_bypass(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -982,12 +982,12 @@ static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DA_AB_Vref_bypass, 0644,
-		       adt7316_show_DA_AB_Vref_bypass,
-		       adt7316_store_DA_AB_Vref_bypass,
+static IIO_DEVICE_ATTR(dac_ab_Vref_bypass, 0644,
+		       adt7316_show_dac_ab_Vref_bypass,
+		       adt7316_store_dac_ab_Vref_bypass,
 		       0);
 
-static ssize_t adt7316_show_DA_CD_Vref_bypass(struct device *dev,
+static ssize_t adt7316_show_dac_cd_Vref_bypass(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -998,7 +998,7 @@ static ssize_t adt7316_show_DA_CD_Vref_bypass(struct device *dev,
 		!!(chip->dac_config & ADT7316_VREF_BYPASS_DAC_CD));
 }
 
-static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
+static ssize_t adt7316_store_dac_cd_Vref_bypass(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -1021,12 +1021,12 @@ static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DA_CD_Vref_bypass, 0644,
-		       adt7316_show_DA_CD_Vref_bypass,
-		       adt7316_store_DA_CD_Vref_bypass,
+static IIO_DEVICE_ATTR(dac_cd_Vref_bypass, 0644,
+		       adt7316_show_dac_cd_Vref_bypass,
+		       adt7316_store_dac_cd_Vref_bypass,
 		       0);
 
-static ssize_t adt7316_show_DAC_internal_Vref(struct device *dev,
+static ssize_t adt7316_show_dac_internal_Vref(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -1041,7 +1041,7 @@ static ssize_t adt7316_show_DAC_internal_Vref(struct device *dev,
 		       !!(chip->ldac_config & ADT7316_DAC_IN_VREF));
 }
 
-static ssize_t adt7316_store_DAC_internal_Vref(struct device *dev,
+static ssize_t adt7316_store_dac_internal_Vref(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -1082,9 +1082,9 @@ static ssize_t adt7316_store_DAC_internal_Vref(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DAC_internal_Vref, 0644,
-		       adt7316_show_DAC_internal_Vref,
-		       adt7316_store_DAC_internal_Vref,
+static IIO_DEVICE_ATTR(dac_internal_Vref, 0644,
+		       adt7316_show_dac_internal_Vref,
+		       adt7316_store_dac_internal_Vref,
 		       0);
 
 static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,
@@ -1644,13 +1644,13 @@ static struct attribute *adt7316_attributes[] = {
 	&iio_dev_attr_da_high_resolution.dev_attr.attr,
 	&iio_dev_attr_enable_proportion_DACA.dev_attr.attr,
 	&iio_dev_attr_enable_proportion_DACB.dev_attr.attr,
-	&iio_dev_attr_DAC_2Vref_channels_mask.dev_attr.attr,
+	&iio_dev_attr_dac_2Vref_channels_mask.dev_attr.attr,
 	&iio_dev_attr_DAC_update_mode.dev_attr.attr,
 	&iio_dev_attr_all_DAC_update_modes.dev_attr.attr,
 	&iio_dev_attr_update_DAC.dev_attr.attr,
-	&iio_dev_attr_DA_AB_Vref_bypass.dev_attr.attr,
-	&iio_dev_attr_DA_CD_Vref_bypass.dev_attr.attr,
-	&iio_dev_attr_DAC_internal_Vref.dev_attr.attr,
+	&iio_dev_attr_dac_ab_Vref_bypass.dev_attr.attr,
+	&iio_dev_attr_dac_cd_Vref_bypass.dev_attr.attr,
+	&iio_dev_attr_dac_internal_Vref.dev_attr.attr,
 	&iio_dev_attr_VDD.dev_attr.attr,
 	&iio_dev_attr_in_temp.dev_attr.attr,
 	&iio_dev_attr_ex_temp.dev_attr.attr,
@@ -1684,15 +1684,15 @@ static struct attribute *adt7516_attributes[] = {
 	&iio_dev_attr_enable_smbus_timeout.dev_attr.attr,
 	&iio_dev_attr_powerdown.dev_attr.attr,
 	&iio_dev_attr_fast_ad_clock.dev_attr.attr,
-	&iio_dev_attr_AIN_internal_Vref.dev_attr.attr,
+	&iio_dev_attr_ain_internal_Vref.dev_attr.attr,
 	&iio_dev_attr_da_high_resolution.dev_attr.attr,
 	&iio_dev_attr_enable_proportion_DACA.dev_attr.attr,
 	&iio_dev_attr_enable_proportion_DACB.dev_attr.attr,
-	&iio_dev_attr_DAC_2Vref_channels_mask.dev_attr.attr,
+	&iio_dev_attr_dac_2Vref_channels_mask.dev_attr.attr,
 	&iio_dev_attr_DAC_update_mode.dev_attr.attr,
 	&iio_dev_attr_all_DAC_update_modes.dev_attr.attr,
 	&iio_dev_attr_update_DAC.dev_attr.attr,
-	&iio_dev_attr_DAC_internal_Vref.dev_attr.attr,
+	&iio_dev_attr_dac_internal_Vref.dev_attr.attr,
 	&iio_dev_attr_VDD.dev_attr.attr,
 	&iio_dev_attr_in_temp.dev_attr.attr,
 	&iio_dev_attr_ex_temp_AIN1.dev_attr.attr,
-- 
2.54.0

