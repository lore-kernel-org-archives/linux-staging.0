Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A34ABBA6
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 13:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381141; cv=none; b=SSIr+278cs+2fkVz1U/BQYYp+REmsqcYlXNGlKoZMJJE0gZCffIrLhnWmExVcT+777wrD/Qr7fMUlR4wvmrdvJwRos7HjBMvsSNnKTD78AVM+HbSQKycRO+l26m6bht3HmmJ/75b06WThwy4W8xSYYEK9F4pxsIeMVUptiALBS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381141; c=relaxed/simple;
	bh=gGwjSvl+z9pW6bbPCaaNS0klvdQ7vWn6BaNEIaLW0xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mt9fRdpDtU1/y0/ojuHwk2wLHv7DwG86vi9MKwp2ErqUo/Dnma3uFE2xKeYfRSUFjF2whsatcOdAjAnXMi+njZE7mtte0nW3DrNTmExW74d7PuTmMVGaBQf/SjicUTjS3JY7hvfqY078PN8a1/uA2rx4nkfnIDhZDqS5dz2jjvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yl3arx+k; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yl3arx+k"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1250283f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791381128; x=1791985928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMm89ZuMFRUcykpwHvtlCEKlZZULqgCCXLBJZNe/c4Y=;
        b=Yl3arx+kmK0twWhNoBGu9IiZwASnWN5bbBBRGfW69vMVIt72ecfIthhjUYaSoSBnOw
         9o8N2i2586e/B3myI+bpelPdY0ctanuAThoL6YOiefbB+XWbIVOHQBX0Bag0bZWMenrb
         t/ZIJMZr0F4GerFXzcBb5vnMtQlc5nMU1CgW5PdjNpL7TFzVWPo8M3v0dkLpJXS6mGaJ
         L9MzngXTvdwi4IeQZv6e5h5h/fBVCny4/xqsgU59NrGMCSuXUDKtt/lPdzO29XjhgkxO
         5D9IiWW7jhjemBxxMw3lu9AAQwMQ3dQG0V8mqq5vbniaoBJEdpNRWuVDi0LMv6DobuSy
         iRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381128; x=1791985928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMm89ZuMFRUcykpwHvtlCEKlZZULqgCCXLBJZNe/c4Y=;
        b=mTNE+qKptSLhvL6uNt4DU33hWrWCgzDYtFXbuqy+wATqYHWpejhEALVHTYDx1tFYRs
         VvSEh/dd5yfiEWDVnt5V6FsDHz9pXq7Gia9dXq3jCluG/r4akYJQjqBNA8OuEDlL0jSJ
         k+SARxP7ZAMoPkxuOrGFPtUsfOuLpjBX1H99fDmX1EeorVaBhshJtZVslPAodTQ3+Z+r
         U8mbzeqKB4pbfb0tnmiqu8shIHhXZZpdUDI5DUz8kiyVPb7mNIrberbuiCiIawHuCYMG
         5zeDv/+F/naY2ZhpEefsvkuD0t3vuPAu5LVdLOIkCDKgFe1+RfoLFrIEb0Eq5IPsh/dC
         opWg==
X-Forwarded-Encrypted: i=1; AKwUvBxAIMETdz7H8QX3We2+b5BS1GBlkP4MJO/lQ0uPUa0HAmkztVVLLN58wV1qBTK9ilDeTSjOPYc66A6URYYP@lists.linux.dev
X-Gm-Message-State: AFq9FYJmTau1dzgdf0KGqg1wabRiCmAdC432u86w4oVQZyo3GE5HMCGm
	gCjUdZHGtAYnPQO7sGolNcFlaRNT4LBxb++ouARaI+deu/5RbjJvx4dp
X-Gm-Gg: AYBFou2p48gpqxfGNhKVeGEH2bIGMKZs4g9BR23mDmiMQxLIoQlU4MD/n03ze8DWUK2
	jIWC2khpi016YZnR4yaqGPDaKjBwjjufufqD/W71/+3DX8Wo/Plq4hDPCJiK/vw5PMhttJ5+8Ot
	jXGsCP4t7qW8Vh/LrAH4RALJx4JGDO+rioL7rb6nZGX6FSuRKezvfGUdcONZYr76XcEZbCaTFdz
	tlO4LCBy2lgXQs+j7AEDdsw2VIgYRikbMuiW0X4I+Qrus9qylgPXk38nQhqz9+/jDMlkkzCktIb
	rFWNeSR9tSTArR3QefU1HoZwERECNKvrb/3QLj7W/CucwHUCe3QALF9rA4PX7HDhWkLmT32EQOS
	t0WBpGs+UTBu1CJ7sOP7jvY1bIwbAal0kJotk+1lJYJWeRwutHgMNh+Tve3vSD4hcQELdnTi/FY
	5xlRqPWnMAgE2FVr5naXI50Vf6srFDuTTJajAXCi7Mj4FjTScx2+ac3bumhgyWx5SSW3ykI5jwd
	9gKaKHfc6McDdTzUqqlQU2YPBMzfQ==
X-Received: by 2002:a05:6000:128d:b0:48c:7161:43e3 with SMTP id ffacd0b85a97d-48c72889494mr3126374f8f.54.1791381127670;
        Wed, 07 Oct 2026 06:52:07 -0700 (PDT)
Received: from fedora ([154.183.153.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b4e399sm3651658f8f.56.2026.10.07.06.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:52:07 -0700 (PDT)
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
Subject: [PATCH v2] staging: iio: adt7316: use kstrtobool() for sysfs boolean parsing
Date: Wed,  7 Oct 2026 16:51:51 +0300
Message-ID: <20261007135151.11780-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual and unsafe character checks (e.g., buf[0] == '1') with
the standard kstrtobool() API in sysfs store functions. This ensures
proper handling of standard boolean inputs, fixes potential safety
issues, and adheres to the Linux kernel coding style.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v2:
- Included <linux/kstrtox.h> explicitly as requested.
- Renamed the boolean variable from 'req' to 'val'. (My initial thought was 'req' as an abbreviation for 'user request', but 'val' is much clearer and avoids any confusion with block/network requests).
- Added Reviewed-by tag from Joshua.

 drivers/staging/iio/addac/adt7316.c | 95 +++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..719261cfce9e 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/kstrtox.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/events.h>
@@ -246,12 +247,12 @@ static ssize_t adt7316_store_enabled(struct device *dev,
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
@@ -285,13 +286,18 @@ static ssize_t adt7316_store_select_ex_temp(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool val;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7516_SEL_EX_TEMP);
-	if (buf[0] == '1')
+	if (val)
 		config1 |= ADT7516_SEL_EX_TEMP;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -482,10 +488,15 @@ static ssize_t adt7316_store_disable_averaging(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_DISABLE_AVERAGING);
-	if (buf[0] == '1')
+	if (val)
 		config2 |= ADT7316_DISABLE_AVERAGING;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -521,10 +532,15 @@ static ssize_t adt7316_store_enable_smbus_timeout(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_EN_SMBUS_TIMEOUT);
-	if (buf[0] == '1')
+	if (val)
 		config2 |= ADT7316_EN_SMBUS_TIMEOUT;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -559,10 +575,15 @@ static ssize_t adt7316_store_powerdown(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_PD);
-	if (buf[0] == '1')
+	if (val)
 		config1 |= ADT7316_PD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -597,10 +618,15 @@ static ssize_t adt7316_store_fast_ad_clock(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_ADCLK_22_5);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_ADCLK_22_5;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -640,13 +666,18 @@ static ssize_t adt7316_store_da_high_resolution(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
 	if (chip->id == ID_ADT7318 || chip->id == ID_ADT7519)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_DA_HIGH_RESOLUTION);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_DA_HIGH_RESOLUTION;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -685,12 +716,17 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
-	if (buf[0] != '1')
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
+	if (!val)
 		config3 = chip->config3 & (~ADT7516_AIN_IN_VREF);
 	else
 		config3 = chip->config3 | ADT7516_AIN_IN_VREF;
@@ -728,10 +764,15 @@ static ssize_t adt7316_store_enable_prop_DACA(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_IN_TEMP_PROP_DACA);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_EN_IN_TEMP_PROP_DACA;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -767,10 +808,15 @@ static ssize_t adt7316_store_enable_prop_DACB(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_EX_TEMP_PROP_DACB);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_EN_EX_TEMP_PROP_DACB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -967,10 +1013,15 @@ static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_AB);
-	if (buf[0] == '1')
+	if (val)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_AB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1006,10 +1057,15 @@ static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_CD);
-	if (buf[0] == '1')
+	if (val)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_CD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1969,10 +2025,15 @@ static ssize_t adt7316_set_int_enabled(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_INT_EN);
-	if (buf[0] == '1')
+	if (val)
 		config1 |= ADT7316_INT_EN;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
-- 
2.54.0

