Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C803A63EF
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283142; cv=none; b=iDndbDkx0vcYm0I0j3LuY7xV6+lFen7fPFp7LQ9YL7V80oPKm6cRwTCWog+Z8HkGmbvqqbZuF8ksJsWNBNnsPfL8+k+3ZymyPMk24gRvNSJJt/h85YAALbbhi9a/3wcfhfw5gXhCta360Oe85Q5iwZSjsLVFAwyY0e7DeLxE7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283142; c=relaxed/simple;
	bh=5SBDIrzGAQEBhEnuVBvjyWjW+cvgWc+5Dhaw9jOzesI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AlhRfiw9TQnJ8rV7ARA3h4B0XewGdN1Wp9yQGGUHG2G4Ytz83iRJLt2eTFehcSQR+5hVyKzxNsVberf/yaoJdeG5kcw9eSDpHYk8NMIq7MeXFk8hWf9Gg9mJUtNwvUr4QR3tq5psL68ckbqrdg/8y7THZU4YL5wHo85HT3Tc/b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAAeuQ8U; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAAeuQ8U"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso353201f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 03:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283139; x=1791887939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PKrnSSgSMY6ZmA5twi9Nx86W77c8h087WtIxcCKmQ0=;
        b=aAAeuQ8UeR+ARdOJRVRf9q0AxCiNiw5+ag+fhstHFW559JcTes8VXWC9gT9EiAx5eH
         1OJUn+KWGKPnjBdREjSW2W1XK+jQWjtLe8Sh43dLgN5LfIPgaqHWISi3iK3I7L7wiNrb
         lz+dywi0jhXOtusZNiC5IdPZRT35WUfnIyWjgCx85Fv0n7bAMndptAM1VuQ8UncRAPhS
         kmDCvc433Q6YKG9HCXlxDUvDDvWEQXQigTdufCSl82QB2vUyHKcEQd6AMkumz0mdHaiS
         WncRrVxKYoZF0Gm6OyTb6xstWCp9O3jUAXtW56Z8H4+QzVwXz7zev6e+VkhX5fiTMUP4
         UJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283139; x=1791887939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PKrnSSgSMY6ZmA5twi9Nx86W77c8h087WtIxcCKmQ0=;
        b=q7uGUbnSBVNICVff/CYKQKcx55aWVH93cVbg7faxkO864chujVj8d8/kuCZXdCJUDg
         jypJiHYcerklgkt12fLkbkiPNjy+ug9S+i/oX0c/mlZAHbjAICTWD8f9HZtIVisOiXXm
         R/fH1cTbOUGK7ZdDM7YqOq7/ABBjdhNFx3Rprl8JMAUYTxVHImBb6+e+DeNuis+uCpGE
         +1gANuhK79aCFBBCr9/D8sHVnCLhoYyHKhWNIDcTEaYTyGbHGgRQyEteIe06Ha0FpkPA
         TQBJYS0brsXOYUQ2dKHS44HnHHCTK3Zbc14fvelSYZNSHOm0vGh/BwcjGLLcUnD43Ckt
         vF+A==
X-Forwarded-Encrypted: i=1; AKwUvBw23l95ogn9VBRmHZLnQhvlN4Poa16rlDMXFfLJg/fUUF1HdV0FK/FdD/bQEFd2KhOHfBv4BJVhGiylKCUT@lists.linux.dev
X-Gm-Message-State: AFq9FYLkrtEupbwgnUHtimJuK25oYwYfTU9TS1Sdn0woGCUWErGdzhYM
	CelHyBNiavG6urtDrfpUBxUhVvPzBj46xXTQMgJ2Rsup/ntvKjcvMCGS
X-Gm-Gg: AYBFou0NtiFFT/qJx2dKPyA4uJ8zLCH2371jaKD++nfAswLALc/CP1GB1BHqq6aUMoC
	fYo5q5qZnhX+wM1uC4kW7c7Ae7MpoICoqJoyOoBH2ZZ65drohkh3SVFXGsAwHnIg8wsYvkYIApP
	jgxu1fzQPPUTsMRGdtgS/7qrJ4OvXz6W3VwI6hTDatJgTroO5JmVIJ9Uf9CLbvzGfrtRpiSrV0x
	uuLviDBSRlyiYu63UPrHbeN4DqHJtT2y1Tu7DO6nCC3qWLDixxGik5e5FmDw9FiSQPd6NKO3HEt
	iq0glX9GVO+ewcfCd11Xlb/tqL/yRnhKfJHVZuTCYvzRDveB4kfgC+FQCjOSKmvNqzeF9oZENPf
	jQAr157wXy3ma9FLUMKgEh4UtKNTpUPEuXWJ+yc/GGReYMRv9Sru+oaV7yrfBGyly6vX9s6fU4Y
	nI+EGTHnOCcwJsCDXEYBnclBQvMTCHf7On3qlVmW9K1WjNp3sRbR84kCfx2Qjsed67M+rEwDb4W
	wzTlpXJ1qx4jlgH9xM=
X-Received: by 2002:a05:6000:298e:20b0:485:8a47:5b91 with SMTP id ffacd0b85a97d-48c6d1ee143mr1211829f8f.46.1791283138652;
        Tue, 06 Oct 2026 03:38:58 -0700 (PDT)
Received: from fedora ([154.183.153.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717f8sm2526963f8f.48.2026.10.06.03.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:38:58 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: iio: adt7316: use kstrtobool() for sysfs boolean parsing
Date: Tue,  6 Oct 2026 13:33:50 +0300
Message-ID: <20261006103350.32853-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual and unsafe character checks (e.g., buf[0] == '1') with the
standard kstrtobool() API in sysfs store functions. This ensures proper
handling of standard boolean inputs, fixes potential safety issues, and
adheres to the Linux kernel coding style.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 94 +++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..21a1b811a142 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -246,12 +246,12 @@ static ssize_t adt7316_store_enabled(struct device *dev,
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
-	int enable;
+	bool enable;
+	int ret;
 
-	if (buf[0] == '1')
-		enable = 1;
-	else
-		enable = 0;
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
 
 	if (_adt7316_store_enabled(chip, enable) < 0)
 		return -EIO;
@@ -285,13 +285,18 @@ static ssize_t adt7316_store_select_ex_temp(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool req;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7516_SEL_EX_TEMP);
-	if (buf[0] == '1')
+	if (req)
 		config1 |= ADT7516_SEL_EX_TEMP;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -482,10 +487,15 @@ static ssize_t adt7316_store_disable_averaging(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_DISABLE_AVERAGING);
-	if (buf[0] == '1')
+	if (req)
 		config2 |= ADT7316_DISABLE_AVERAGING;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -521,10 +531,15 @@ static ssize_t adt7316_store_enable_smbus_timeout(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_EN_SMBUS_TIMEOUT);
-	if (buf[0] == '1')
+	if (req)
 		config2 |= ADT7316_EN_SMBUS_TIMEOUT;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -559,10 +574,15 @@ static ssize_t adt7316_store_powerdown(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_PD);
-	if (buf[0] == '1')
+	if (req)
 		config1 |= ADT7316_PD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -597,10 +617,15 @@ static ssize_t adt7316_store_fast_ad_clock(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_ADCLK_22_5);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_ADCLK_22_5;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -640,13 +665,18 @@ static ssize_t adt7316_store_da_high_resolution(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
 	if (chip->id == ID_ADT7318 || chip->id == ID_ADT7519)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_DA_HIGH_RESOLUTION);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_DA_HIGH_RESOLUTION;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -685,12 +715,17 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
-	if (buf[0] != '1')
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
+	if (!req)
 		config3 = chip->config3 & (~ADT7516_AIN_IN_VREF);
 	else
 		config3 = chip->config3 | ADT7516_AIN_IN_VREF;
@@ -728,10 +763,15 @@ static ssize_t adt7316_store_enable_prop_DACA(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_IN_TEMP_PROP_DACA);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_EN_IN_TEMP_PROP_DACA;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -767,10 +807,15 @@ static ssize_t adt7316_store_enable_prop_DACB(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_EX_TEMP_PROP_DACB);
-	if (buf[0] == '1')
+	if (req)
 		config3 |= ADT7316_EN_EX_TEMP_PROP_DACB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -967,10 +1012,15 @@ static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_AB);
-	if (buf[0] == '1')
+	if (req)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_AB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1006,10 +1056,15 @@ static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_CD);
-	if (buf[0] == '1')
+	if (req)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_CD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1969,10 +2024,15 @@ static ssize_t adt7316_set_int_enabled(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool req;
 	int ret;
 
+	ret = kstrtobool(buf, &req);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_INT_EN);
-	if (buf[0] == '1')
+	if (req)
 		config1 |= ADT7316_INT_EN;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
-- 
2.54.0

