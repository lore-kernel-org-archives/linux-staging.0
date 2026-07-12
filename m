Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B86E2E414
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865997; cv=none; b=K0DhZ0/TlvZEPu6jz/tHZAMWiGJFwysvUP4MfTENTBhGDjefi7fjFFcr6OKIgs+OTwK+B6Qj8y+DwoMyLcFflhC5g4Ik+iuHtK7kJ2CdvaC7MUMeZ1CiByIDkxteht7at/Fmg46hgl0977G1m6Wi+MMghjbMK5xA4qgLQi7RPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865997; c=relaxed/simple;
	bh=oumYVdpIN4W8nLhHdGLVyH6GNHi0uZqLNP3y6iHH/bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fUtj2MRcrSleKeMiLl7GypKUbKRf5FQm64GtDr7ejQLYs9GSsNKtpvCCg3AJoRFFc62OGA1j7/EK1QgzDv7T2TXhO2AQXNQF1FfktyutRGfaiNVpKvM4IJn4puxk24yiWuxdFMlLofTptmGHKeAG+LtWbS7CppkgaNzdF5fwlkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvVB63JI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvVB63JI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848643382fcso2383630b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783865994; x=1784470794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MphLtdwgHqey6iKL4dV4IsACIIPSiSMUlutX9C9/Ahs=;
        b=FvVB63JIijE1ftagYaRVJF3WIxd1lxeSHIUhi+DJZX+ONAyLWE3953UG6SPlzCRtdf
         VxGf5pQELI5E18xcXT+sKVBqPqgkPRr31XOQITmjNGteBmJ7sZowlIqqG30Hl59Upbvo
         ybPi7CUz3FbNLtcE9jrXcoNve95Po9AjJf21jB6Ixek30fYGaPLgrT3qzRvzMOdvZH6E
         EOYTSWZ/5ZQpftHcRUQjoGBRHINYlxiqaZFw95hEe2vTXfKVkoInCr7Xhj2lfGbLjF8P
         qwZXXcehVX94CWqU2uC4nXMxMY+CqTrIGFE8Up+DbiJo91zPqUPksv5hokBBj0apB9qm
         vEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783865994; x=1784470794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MphLtdwgHqey6iKL4dV4IsACIIPSiSMUlutX9C9/Ahs=;
        b=rrCsxvzip/temSpjp6bAdSn8Gu/DTDDhBIxAZYBBdxGU5E0VJ9N0IoCQ58CBkXwBS8
         9PN8P+KBaat1nlZ8iUaWDHLHxA+FmBFAmsw7WrRhOZnZMeAo2QsC/wtYdapJ4HDItCo4
         KjnpGB3bZGNCxZ2PKr9x93PIdOqaFYkfd4Lcc/xQYtY4IqB/lNPlcVC2ynr+WR1TAsII
         3rEzmnx670HVr2WJSBRgTrWmhVs49iam7tjNuw/T2jlCL8frFyaz0Z4yU1p6xIF3URMv
         VjXfv4ILu7AqgPttXwk7XmpFfcnasKsMzGNe/NsbwZ/Mhm5ViSsTjhkt1UdzNoik9Aw1
         NBLg==
X-Forwarded-Encrypted: i=1; AHgh+Rru5DlId4+SK3UuX+fAH/QFf/icRKLRZ4EUJEmsEFOyL0N0K8fprooQDOyHgX2I3MaArHeRiTN/M9pGWoWU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6TB6ztfB8Co9MycLMpoQxRSyVM8VdtL0opbvAPhJ3e+0EF3+h
	WmCYZRhvAsqHBwrKKDzLsNIFeDps6eJUWK190ZR1UrJ0atrwU1odMOXi
X-Gm-Gg: AfdE7clwiv4Lt3svZAwsIzMF3lw9hn2ZUpu5b2VMkt9IXgu78v+46ninx15/PlObKF5
	38OlNE22mTsofVItu15wXKR/qcXol9HgUANQthUQBtYXN7h15SCnT8+1QaofAMr69axNCbC5JSV
	1q8oE3kSveb4N2JzAqHa4Ze05ZiukZoLrK2EdMqh166qU7MnG2b0JpDod0kd1QIPORKmmq6E9IZ
	y4jpmV8JPopYkdWYTAIU59oXaa6LLB4bk1qPoHlXaAsHb+DrC19wBBQJzHcGuqEqn/reHC3Tz1o
	YNgB1eBdzhJIHK9DsGu/Zm5NHElsGrSHS0G2dvsLf0LmGO3b7SunJgTnswlpAivm7Hi01Q7+CBK
	+qIoKS7d7nZYf5HeN8+kB7hxlPvDl/H0y5CwzRhaoLJTsLAxshbYIyHuffPeYhZD2D1ssjg8viZ
	F5QK5OOcRs7u6Nqpk=
X-Received: by 2002:a05:6a00:1881:b0:848:5f4f:289a with SMTP id d2e1a72fcca58-84889721d5amr5447474b3a.49.1783865993298;
        Sun, 12 Jul 2026 07:19:53 -0700 (PDT)
Received: from fedora ([66.90.98.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9a832sm12705500b3a.18.2026.07.12.07.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:19:52 -0700 (PDT)
From: Dylan Liu <pxyforeverlove1314@gmail.com>
X-Google-Original-From: Dylan Liu <dylanliu050903@protonmail.com>
To: 
Cc: Dylan Liu <dylanliu050903@protonmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Signed-off-by: Dylan Liu <dylanliu050903@protonmail.com>
Date: Sun, 12 Jul 2026 22:19:20 +0800
Message-ID: <20260712141928.559844-1-dylanliu050903@protonmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

staging: iio: adt7316: Fix CamelCase naming for sysfs attributes

Fix multiple checkpatch.pl warnings complaining about CamelCase
variable and function names.

In order to comply with standard Linux coding style and IIO ABI
conventions, convert all uppercase abbreviations (AIN, DAC, Vref)
in the adt7316 driver to lowercase snake_case.

Note that this patch changes the sysfs ABI for this driver, as
the device attributes exposed to userspace are now lowercase
(e.g., from 'AIN_internal_Vref' to 'ain_internal_vref'). This is
necessary to bring the staging driver in line with the official
IIO ABI.

Signed-off-by: Dylan Liu <dylanliu050903@protonmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 228 ++++++++++++++--------------
 1 file changed, 114 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 59fb3bd26bc1..845d79591128 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -663,7 +663,7 @@ static IIO_DEVICE_ATTR(da_high_resolution, 0644,
 		adt7316_store_da_high_resolution,
 		0);
 
-static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
+static ssize_t adt7316_show_ain_internal_vref(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -677,7 +677,7 @@ static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
 		!!(chip->config3 & ADT7516_AIN_IN_VREF));
 }
 
-static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
+static ssize_t adt7316_store_ain_internal_vref(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -704,12 +704,12 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(AIN_internal_Vref, 0644,
-		adt7316_show_AIN_internal_Vref,
-		adt7316_store_AIN_internal_Vref,
+static IIO_DEVICE_ATTR(ain_internal_vref, 0644,
+		adt7316_show_ain_internal_vref,
+		adt7316_store_ain_internal_vref,
 		0);
 
-static ssize_t adt7316_show_enable_prop_DACA(struct device *dev,
+static ssize_t adt7316_show_enable_prop_daca(struct device *dev,
 					     struct device_attribute *attr,
 					     char *buf)
 {
@@ -720,7 +720,7 @@ static ssize_t adt7316_show_enable_prop_DACA(struct device *dev,
 		!!(chip->config3 & ADT7316_EN_IN_TEMP_PROP_DACA));
 }
 
-static ssize_t adt7316_store_enable_prop_DACA(struct device *dev,
+static ssize_t adt7316_store_enable_prop_daca(struct device *dev,
 					      struct device_attribute *attr,
 					      const char *buf,
 					      size_t len)
@@ -743,12 +743,12 @@ static ssize_t adt7316_store_enable_prop_DACA(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(enable_proportion_DACA, 0644,
-		       adt7316_show_enable_prop_DACA,
-		       adt7316_store_enable_prop_DACA,
+static IIO_DEVICE_ATTR(enable_proportion_daca, 0644,
+		       adt7316_show_enable_prop_daca,
+		       adt7316_store_enable_prop_daca,
 		       0);
 
-static ssize_t adt7316_show_enable_prop_DACB(struct device *dev,
+static ssize_t adt7316_show_enable_prop_dacb(struct device *dev,
 					     struct device_attribute *attr,
 					     char *buf)
 {
@@ -759,7 +759,7 @@ static ssize_t adt7316_show_enable_prop_DACB(struct device *dev,
 		!!(chip->config3 & ADT7316_EN_EX_TEMP_PROP_DACB));
 }
 
-static ssize_t adt7316_store_enable_prop_DACB(struct device *dev,
+static ssize_t adt7316_store_enable_prop_dacb(struct device *dev,
 					      struct device_attribute *attr,
 					      const char *buf,
 					      size_t len)
@@ -782,12 +782,12 @@ static ssize_t adt7316_store_enable_prop_DACB(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(enable_proportion_DACB, 0644,
-		       adt7316_show_enable_prop_DACB,
-		       adt7316_store_enable_prop_DACB,
+static IIO_DEVICE_ATTR(enable_proportion_dacb, 0644,
+		       adt7316_show_enable_prop_dacb,
+		       adt7316_store_enable_prop_dacb,
 		       0);
 
-static ssize_t adt7316_show_DAC_2Vref_ch_mask(struct device *dev,
+static ssize_t adt7316_show_dac_2vref_ch_mask(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -798,7 +798,7 @@ static ssize_t adt7316_show_DAC_2Vref_ch_mask(struct device *dev,
 		chip->dac_config & ADT7316_DA_2VREF_CH_MASK);
 }
 
-static ssize_t adt7316_store_DAC_2Vref_ch_mask(struct device *dev,
+static ssize_t adt7316_store_dac_2vref_ch_mask(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -825,12 +825,12 @@ static ssize_t adt7316_store_DAC_2Vref_ch_mask(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DAC_2Vref_channels_mask, 0644,
-		       adt7316_show_DAC_2Vref_ch_mask,
-		       adt7316_store_DAC_2Vref_ch_mask,
+static IIO_DEVICE_ATTR(dac_2vref_channels_mask, 0644,
+		       adt7316_show_dac_2vref_ch_mask,
+		       adt7316_store_dac_2vref_ch_mask,
 		       0);
 
-static ssize_t adt7316_show_DAC_update_mode(struct device *dev,
+static ssize_t adt7316_show_dac_update_mode(struct device *dev,
 					    struct device_attribute *attr,
 					    char *buf)
 {
@@ -855,7 +855,7 @@ static ssize_t adt7316_show_DAC_update_mode(struct device *dev,
 	}
 }
 
-static ssize_t adt7316_store_DAC_update_mode(struct device *dev,
+static ssize_t adt7316_store_dac_update_mode(struct device *dev,
 					     struct device_attribute *attr,
 					     const char *buf,
 					     size_t len)
@@ -885,12 +885,12 @@ static ssize_t adt7316_store_DAC_update_mode(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DAC_update_mode, 0644,
-		       adt7316_show_DAC_update_mode,
-		       adt7316_store_DAC_update_mode,
+static IIO_DEVICE_ATTR(dac_update_mode, 0644,
+		       adt7316_show_dac_update_mode,
+		       adt7316_store_dac_update_mode,
 		       0);
 
-static ssize_t adt7316_show_all_DAC_update_modes(struct device *dev,
+static ssize_t adt7316_show_all_dac_update_modes(struct device *dev,
 						 struct device_attribute *attr,
 						 char *buf)
 {
@@ -905,10 +905,10 @@ static ssize_t adt7316_show_all_DAC_update_modes(struct device *dev,
 	return sysfs_emit(buf, "manual\n");
 }
 
-static IIO_DEVICE_ATTR(all_DAC_update_modes, 0444,
-		       adt7316_show_all_DAC_update_modes, NULL, 0);
+static IIO_DEVICE_ATTR(all_dac_update_modes, 0444,
+		       adt7316_show_all_dac_update_modes, NULL, 0);
 
-static ssize_t adt7316_store_update_DAC(struct device *dev,
+static ssize_t adt7316_store_update_dac(struct device *dev,
 					struct device_attribute *attr,
 					const char *buf,
 					size_t len)
@@ -943,12 +943,12 @@ static ssize_t adt7316_store_update_DAC(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(update_DAC, 0644,
+static IIO_DEVICE_ATTR(update_dac, 0644,
 		       NULL,
-		       adt7316_store_update_DAC,
+		       adt7316_store_update_dac,
 		       0);
 
-static ssize_t adt7316_show_DA_AB_Vref_bypass(struct device *dev,
+static ssize_t adt7316_show_da_ab_vref_bypass(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -959,7 +959,7 @@ static ssize_t adt7316_show_DA_AB_Vref_bypass(struct device *dev,
 		!!(chip->dac_config & ADT7316_VREF_BYPASS_DAC_AB));
 }
 
-static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
+static ssize_t adt7316_store_da_ab_vref_bypass(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -982,12 +982,12 @@ static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DA_AB_Vref_bypass, 0644,
-		       adt7316_show_DA_AB_Vref_bypass,
-		       adt7316_store_DA_AB_Vref_bypass,
+static IIO_DEVICE_ATTR(da_ab_vref_bypass, 0644,
+		       adt7316_show_da_ab_vref_bypass,
+		       adt7316_store_da_ab_vref_bypass,
 		       0);
 
-static ssize_t adt7316_show_DA_CD_Vref_bypass(struct device *dev,
+static ssize_t adt7316_show_da_cd_vref_bypass(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -998,7 +998,7 @@ static ssize_t adt7316_show_DA_CD_Vref_bypass(struct device *dev,
 		!!(chip->dac_config & ADT7316_VREF_BYPASS_DAC_CD));
 }
 
-static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
+static ssize_t adt7316_store_da_cd_vref_bypass(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -1021,12 +1021,12 @@ static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DA_CD_Vref_bypass, 0644,
-		       adt7316_show_DA_CD_Vref_bypass,
-		       adt7316_store_DA_CD_Vref_bypass,
+static IIO_DEVICE_ATTR(da_cd_vref_bypass, 0644,
+		       adt7316_show_da_cd_vref_bypass,
+		       adt7316_store_da_cd_vref_bypass,
 		       0);
 
-static ssize_t adt7316_show_DAC_internal_Vref(struct device *dev,
+static ssize_t adt7316_show_dac_internal_vref(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
@@ -1041,7 +1041,7 @@ static ssize_t adt7316_show_DAC_internal_Vref(struct device *dev,
 		       !!(chip->ldac_config & ADT7316_DAC_IN_VREF));
 }
 
-static ssize_t adt7316_store_DAC_internal_Vref(struct device *dev,
+static ssize_t adt7316_store_dac_internal_vref(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf,
 					       size_t len)
@@ -1082,9 +1082,9 @@ static ssize_t adt7316_store_DAC_internal_Vref(struct device *dev,
 	return len;
 }
 
-static IIO_DEVICE_ATTR(DAC_internal_Vref, 0644,
-		       adt7316_show_DAC_internal_Vref,
-		       adt7316_store_DAC_internal_Vref,
+static IIO_DEVICE_ATTR(dac_internal_vref, 0644,
+		       adt7316_show_dac_internal_vref,
+		       adt7316_store_dac_internal_vref,
 		       0);
 
 static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,
@@ -1162,7 +1162,7 @@ static ssize_t adt7316_show_ad(struct adt7316_chip_info *chip,
 		(data & ADT7316_T_VALUE_FLOAT_MASK) * 25);
 }
 
-static ssize_t adt7316_show_VDD(struct device *dev,
+static ssize_t adt7316_show_vdd(struct device *dev,
 				struct device_attribute *attr,
 				char *buf)
 {
@@ -1171,7 +1171,7 @@ static ssize_t adt7316_show_VDD(struct device *dev,
 
 	return adt7316_show_ad(chip, ADT7316_AD_SINGLE_CH_VDD, buf);
 }
-static IIO_DEVICE_ATTR(VDD, 0444, adt7316_show_VDD, NULL, 0);
+static IIO_DEVICE_ATTR(vdd, 0444, adt7316_show_vdd, NULL, 0);
 
 static ssize_t adt7316_show_in_temp(struct device *dev,
 				    struct device_attribute *attr,
@@ -1185,7 +1185,7 @@ static ssize_t adt7316_show_in_temp(struct device *dev,
 
 static IIO_DEVICE_ATTR(in_temp, 0444, adt7316_show_in_temp, NULL, 0);
 
-static ssize_t adt7316_show_ex_temp_AIN1(struct device *dev,
+static ssize_t adt7316_show_ex_temp_ain1(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
 {
@@ -1195,11 +1195,11 @@ static ssize_t adt7316_show_ex_temp_AIN1(struct device *dev,
 	return adt7316_show_ad(chip, ADT7316_AD_SINGLE_CH_EX, buf);
 }
 
-static IIO_DEVICE_ATTR(ex_temp_AIN1, 0444, adt7316_show_ex_temp_AIN1,
+static IIO_DEVICE_ATTR(ex_temp_ain1, 0444, adt7316_show_ex_temp_ain1,
 		       NULL, 0);
-static IIO_DEVICE_ATTR(ex_temp, 0444, adt7316_show_ex_temp_AIN1, NULL, 0);
+static IIO_DEVICE_ATTR(ex_temp, 0444, adt7316_show_ex_temp_ain1, NULL, 0);
 
-static ssize_t adt7316_show_AIN2(struct device *dev,
+static ssize_t adt7316_show_ain2(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
 {
@@ -1208,9 +1208,9 @@ static ssize_t adt7316_show_AIN2(struct device *dev,
 
 	return adt7316_show_ad(chip, ADT7516_AD_SINGLE_CH_AIN2, buf);
 }
-static IIO_DEVICE_ATTR(AIN2, 0444, adt7316_show_AIN2, NULL, 0);
+static IIO_DEVICE_ATTR(ain2, 0444, adt7316_show_ain2, NULL, 0);
 
-static ssize_t adt7316_show_AIN3(struct device *dev,
+static ssize_t adt7316_show_ain3(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
 {
@@ -1219,9 +1219,9 @@ static ssize_t adt7316_show_AIN3(struct device *dev,
 
 	return adt7316_show_ad(chip, ADT7516_AD_SINGLE_CH_AIN3, buf);
 }
-static IIO_DEVICE_ATTR(AIN3, 0444, adt7316_show_AIN3, NULL, 0);
+static IIO_DEVICE_ATTR(ain3, 0444, adt7316_show_ain3, NULL, 0);
 
-static ssize_t adt7316_show_AIN4(struct device *dev,
+static ssize_t adt7316_show_ain4(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)
 {
@@ -1230,7 +1230,7 @@ static ssize_t adt7316_show_AIN4(struct device *dev,
 
 	return adt7316_show_ad(chip, ADT7516_AD_SINGLE_CH_AIN4, buf);
 }
-static IIO_DEVICE_ATTR(AIN4, 0444, adt7316_show_AIN4, NULL, 0);
+static IIO_DEVICE_ATTR(ain4, 0444, adt7316_show_ain4, NULL, 0);
 
 static ssize_t adt7316_show_temp_offset(struct adt7316_chip_info *chip,
 					int offset_addr, char *buf)
@@ -1381,7 +1381,7 @@ static IIO_DEVICE_ATTR(ex_analog_temp_offset, 0644,
 		       adt7316_show_ex_analog_temp_offset,
 		       adt7316_store_ex_analog_temp_offset, 0);
 
-static ssize_t adt7316_show_DAC(struct adt7316_chip_info *chip,
+static ssize_t adt7316_show_dac(struct adt7316_chip_info *chip,
 				int channel, char *buf)
 {
 	u16 data = 0;
@@ -1418,7 +1418,7 @@ static ssize_t adt7316_show_DAC(struct adt7316_chip_info *chip,
 	return sysfs_emit(buf, "%d\n", data);
 }
 
-static ssize_t adt7316_store_DAC(struct adt7316_chip_info *chip,
+static ssize_t adt7316_store_dac(struct adt7316_chip_info *chip,
 				 int channel, const char *buf, size_t len)
 {
 	u8 msb, lsb, lsb_reg, offset;
@@ -1459,17 +1459,17 @@ static ssize_t adt7316_store_DAC(struct adt7316_chip_info *chip,
 	return len;
 }
 
-static ssize_t adt7316_show_DAC_A(struct device *dev,
+static ssize_t adt7316_show_dac_a(struct device *dev,
 				  struct device_attribute *attr,
 				  char *buf)
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_show_DAC(chip, 0, buf);
+	return adt7316_show_dac(chip, 0, buf);
 }
 
-static ssize_t adt7316_store_DAC_A(struct device *dev,
+static ssize_t adt7316_store_dac_a(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf,
 				   size_t len)
@@ -1477,23 +1477,23 @@ static ssize_t adt7316_store_DAC_A(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_store_DAC(chip, 0, buf, len);
+	return adt7316_store_dac(chip, 0, buf, len);
 }
 
-static IIO_DEVICE_ATTR(DAC_A, 0644, adt7316_show_DAC_A,
-		       adt7316_store_DAC_A, 0);
+static IIO_DEVICE_ATTR(dac_a, 0644, adt7316_show_dac_a,
+		       adt7316_store_dac_a, 0);
 
-static ssize_t adt7316_show_DAC_B(struct device *dev,
+static ssize_t adt7316_show_dac_b(struct device *dev,
 				  struct device_attribute *attr,
 				  char *buf)
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_show_DAC(chip, 1, buf);
+	return adt7316_show_dac(chip, 1, buf);
 }
 
-static ssize_t adt7316_store_DAC_B(struct device *dev,
+static ssize_t adt7316_store_dac_b(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf,
 				   size_t len)
@@ -1501,23 +1501,23 @@ static ssize_t adt7316_store_DAC_B(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_store_DAC(chip, 1, buf, len);
+	return adt7316_store_dac(chip, 1, buf, len);
 }
 
-static IIO_DEVICE_ATTR(DAC_B, 0644, adt7316_show_DAC_B,
-		       adt7316_store_DAC_B, 0);
+static IIO_DEVICE_ATTR(dac_b, 0644, adt7316_show_dac_b,
+		       adt7316_store_dac_b, 0);
 
-static ssize_t adt7316_show_DAC_C(struct device *dev,
+static ssize_t adt7316_show_dac_c(struct device *dev,
 				  struct device_attribute *attr,
 				  char *buf)
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_show_DAC(chip, 2, buf);
+	return adt7316_show_dac(chip, 2, buf);
 }
 
-static ssize_t adt7316_store_DAC_C(struct device *dev,
+static ssize_t adt7316_store_dac_c(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf,
 				   size_t len)
@@ -1525,23 +1525,23 @@ static ssize_t adt7316_store_DAC_C(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_store_DAC(chip, 2, buf, len);
+	return adt7316_store_dac(chip, 2, buf, len);
 }
 
-static IIO_DEVICE_ATTR(DAC_C, 0644, adt7316_show_DAC_C,
-		       adt7316_store_DAC_C, 0);
+static IIO_DEVICE_ATTR(dac_c, 0644, adt7316_show_dac_c,
+		       adt7316_store_dac_c, 0);
 
-static ssize_t adt7316_show_DAC_D(struct device *dev,
+static ssize_t adt7316_show_dac_d(struct device *dev,
 				  struct device_attribute *attr,
 				  char *buf)
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_show_DAC(chip, 3, buf);
+	return adt7316_show_dac(chip, 3, buf);
 }
 
-static ssize_t adt7316_store_DAC_D(struct device *dev,
+static ssize_t adt7316_store_dac_d(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf,
 				   size_t len)
@@ -1549,11 +1549,11 @@ static ssize_t adt7316_store_DAC_D(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return adt7316_store_DAC(chip, 3, buf, len);
+	return adt7316_store_dac(chip, 3, buf, len);
 }
 
-static IIO_DEVICE_ATTR(DAC_D, 0644, adt7316_show_DAC_D,
-		       adt7316_store_DAC_D, 0);
+static IIO_DEVICE_ATTR(dac_d, 0644, adt7316_show_dac_d,
+		       adt7316_store_dac_d, 0);
 
 static ssize_t adt7316_show_device_id(struct device *dev,
 				      struct device_attribute *attr,
@@ -1642,26 +1642,26 @@ static struct attribute *adt7316_attributes[] = {
 	&iio_dev_attr_powerdown.dev_attr.attr,
 	&iio_dev_attr_fast_ad_clock.dev_attr.attr,
 	&iio_dev_attr_da_high_resolution.dev_attr.attr,
-	&iio_dev_attr_enable_proportion_DACA.dev_attr.attr,
-	&iio_dev_attr_enable_proportion_DACB.dev_attr.attr,
-	&iio_dev_attr_DAC_2Vref_channels_mask.dev_attr.attr,
-	&iio_dev_attr_DAC_update_mode.dev_attr.attr,
-	&iio_dev_attr_all_DAC_update_modes.dev_attr.attr,
-	&iio_dev_attr_update_DAC.dev_attr.attr,
-	&iio_dev_attr_DA_AB_Vref_bypass.dev_attr.attr,
-	&iio_dev_attr_DA_CD_Vref_bypass.dev_attr.attr,
-	&iio_dev_attr_DAC_internal_Vref.dev_attr.attr,
-	&iio_dev_attr_VDD.dev_attr.attr,
+	&iio_dev_attr_enable_proportion_daca.dev_attr.attr,
+	&iio_dev_attr_enable_proportion_dacb.dev_attr.attr,
+	&iio_dev_attr_dac_2vref_channels_mask.dev_attr.attr,
+	&iio_dev_attr_dac_update_mode.dev_attr.attr,
+	&iio_dev_attr_all_dac_update_modes.dev_attr.attr,
+	&iio_dev_attr_update_dac.dev_attr.attr,
+	&iio_dev_attr_da_ab_vref_bypass.dev_attr.attr,
+	&iio_dev_attr_da_cd_vref_bypass.dev_attr.attr,
+	&iio_dev_attr_dac_internal_vref.dev_attr.attr,
+	&iio_dev_attr_vdd.dev_attr.attr,
 	&iio_dev_attr_in_temp.dev_attr.attr,
 	&iio_dev_attr_ex_temp.dev_attr.attr,
 	&iio_dev_attr_in_temp_offset.dev_attr.attr,
 	&iio_dev_attr_ex_temp_offset.dev_attr.attr,
 	&iio_dev_attr_in_analog_temp_offset.dev_attr.attr,
 	&iio_dev_attr_ex_analog_temp_offset.dev_attr.attr,
-	&iio_dev_attr_DAC_A.dev_attr.attr,
-	&iio_dev_attr_DAC_B.dev_attr.attr,
-	&iio_dev_attr_DAC_C.dev_attr.attr,
-	&iio_dev_attr_DAC_D.dev_attr.attr,
+	&iio_dev_attr_dac_a.dev_attr.attr,
+	&iio_dev_attr_dac_b.dev_attr.attr,
+	&iio_dev_attr_dac_c.dev_attr.attr,
+	&iio_dev_attr_dac_d.dev_attr.attr,
 	&iio_dev_attr_device_id.dev_attr.attr,
 	&iio_dev_attr_manufactorer_id.dev_attr.attr,
 	&iio_dev_attr_device_rev.dev_attr.attr,
@@ -1684,29 +1684,29 @@ static struct attribute *adt7516_attributes[] = {
 	&iio_dev_attr_enable_smbus_timeout.dev_attr.attr,
 	&iio_dev_attr_powerdown.dev_attr.attr,
 	&iio_dev_attr_fast_ad_clock.dev_attr.attr,
-	&iio_dev_attr_AIN_internal_Vref.dev_attr.attr,
+	&iio_dev_attr_ain_internal_vref.dev_attr.attr,
 	&iio_dev_attr_da_high_resolution.dev_attr.attr,
-	&iio_dev_attr_enable_proportion_DACA.dev_attr.attr,
-	&iio_dev_attr_enable_proportion_DACB.dev_attr.attr,
-	&iio_dev_attr_DAC_2Vref_channels_mask.dev_attr.attr,
-	&iio_dev_attr_DAC_update_mode.dev_attr.attr,
-	&iio_dev_attr_all_DAC_update_modes.dev_attr.attr,
-	&iio_dev_attr_update_DAC.dev_attr.attr,
-	&iio_dev_attr_DAC_internal_Vref.dev_attr.attr,
-	&iio_dev_attr_VDD.dev_attr.attr,
+	&iio_dev_attr_enable_proportion_daca.dev_attr.attr,
+	&iio_dev_attr_enable_proportion_dacb.dev_attr.attr,
+	&iio_dev_attr_dac_2vref_channels_mask.dev_attr.attr,
+	&iio_dev_attr_dac_update_mode.dev_attr.attr,
+	&iio_dev_attr_all_dac_update_modes.dev_attr.attr,
+	&iio_dev_attr_update_dac.dev_attr.attr,
+	&iio_dev_attr_dac_internal_vref.dev_attr.attr,
+	&iio_dev_attr_vdd.dev_attr.attr,
 	&iio_dev_attr_in_temp.dev_attr.attr,
-	&iio_dev_attr_ex_temp_AIN1.dev_attr.attr,
-	&iio_dev_attr_AIN2.dev_attr.attr,
-	&iio_dev_attr_AIN3.dev_attr.attr,
-	&iio_dev_attr_AIN4.dev_attr.attr,
+	&iio_dev_attr_ex_temp_ain1.dev_attr.attr,
+	&iio_dev_attr_ain2.dev_attr.attr,
+	&iio_dev_attr_ain3.dev_attr.attr,
+	&iio_dev_attr_ain4.dev_attr.attr,
 	&iio_dev_attr_in_temp_offset.dev_attr.attr,
 	&iio_dev_attr_ex_temp_offset.dev_attr.attr,
 	&iio_dev_attr_in_analog_temp_offset.dev_attr.attr,
 	&iio_dev_attr_ex_analog_temp_offset.dev_attr.attr,
-	&iio_dev_attr_DAC_A.dev_attr.attr,
-	&iio_dev_attr_DAC_B.dev_attr.attr,
-	&iio_dev_attr_DAC_C.dev_attr.attr,
-	&iio_dev_attr_DAC_D.dev_attr.attr,
+	&iio_dev_attr_dac_a.dev_attr.attr,
+	&iio_dev_attr_dac_b.dev_attr.attr,
+	&iio_dev_attr_dac_c.dev_attr.attr,
+	&iio_dev_attr_dac_d.dev_attr.attr,
 	&iio_dev_attr_device_id.dev_attr.attr,
 	&iio_dev_attr_manufactorer_id.dev_attr.attr,
 	&iio_dev_attr_device_rev.dev_attr.attr,
-- 
2.54.0

