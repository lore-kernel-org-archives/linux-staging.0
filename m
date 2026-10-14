Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9CA4D596E
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969089; cv=none; b=A4UnO5eH2/Ce6sK/iGPT5e9r8lnMNMmOoFpCn7IIQcxcembPqkWCra05cxAQxPTcdzp8cEFRkMIDGf+gCOxKPBcwOHsN4nrYhM6/+Jsv143PlNr0BamYCh5uhs0QA56pE9AnZJgY3vNMj0XF+v352b/CMgERBQjyDyarOGNUtqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969089; c=relaxed/simple;
	bh=nAu7LIZANKaIdRP2tQMSLxV1Uz3IqfRUrBNPtyD2LKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pBSzf76IWlsFqfItfRD10aeomuvI5/+kAleXwyV6rZ24FZk4A2UFf8thiO8rURjJ5Nrw4GENG25BbCkVS5io1a2JPhjdP/z0evGcuQUOXt1KpFE97rYq35sc9zXYumHaLPUfHIH1qabPwvQePFoV3le+B/lfZAqIFQwOHCFiuA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZ+zyLdQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZ+zyLdQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so31866805e9.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969080; x=1792573880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vONfw/TZke4lqika6uARsXYGMHvc3TAPnV1C0jVfP8U=;
        b=WZ+zyLdQqMfXhPh2riks6U206/kkog5YLpkvw1AyFW4M/TGK1j8nwHVSFqlRPVkJgF
         owNPdmBu95jtx6UzMg+SS1GJT444fyg0iigvUh1OTYRPOWFtIKdDCEFIh5tcLimBkzHF
         3TOHxEt/3xTYs3pvTXJqsZs324xAEqGrpvVDKMgJoOdtGHw1BduubgS3kMzpPD/wd2q+
         Xzh0ORYJaPLx1W8ISRo9gYLFxHoURBmpcxhypV+qJby0sp44lS6Lo/rehjBwlRu8OGMo
         XMizrOhD/hfU0rKDjkdKYVpmIg+nOA2DlKIe80pBjnyxfoK/ajnHcM/ZQ8BgliKhuiYX
         0LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969080; x=1792573880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vONfw/TZke4lqika6uARsXYGMHvc3TAPnV1C0jVfP8U=;
        b=2djUtXGqmVSdjZj8Nxpvv/BoivIC80ypN2RKblpQ2fdDlWOd7V4nBA9ngU+eZKVNvJ
         gabjVHlAG5+OLvZwqkgN6zHwX8oWKOUWGSuNRJyl6aphBDxteUJAzC+tTSNdOO/RSknj
         N369DWKquo5xEO6Q1+zU5J3RVlnsoIwSlN4AKT8X5FcvG51GZxJ5rkwrolkIPCQvBm2v
         PeCiuSz3SbGaDDpMpIYk253v1/7vbn++pT3u5AwwqD8lE0NO8ZYgxTKBXnMbluCQDYPB
         los/Y+8Y+PeggJmdayQeieaS3ebSuXkOMO5dqBREJU+Ev7HDKHxpjqhN7xA8d0X2CQRR
         Z98A==
X-Forwarded-Encrypted: i=1; AKwUvBwQwIOhEFCoOR6Q5ZmDHGBOjZd8zYhQhsczFOuUWpQCihFxmcysJNuLWknq/jwb7CgbP568NKyqeUSpXwei@lists.linux.dev
X-Gm-Message-State: AFq9FYI2tZ+ncXRS7HJ2oNIMCvvs80evXQw3EtH9I4C8OshWCbpdDMQo
	WyDZ+wgLAPYQgt6LdDoR4hbdsCdD/OefqdHJZEE22HRvz48KeKVrzBPg
X-Gm-Gg: AYBFou0RnwpBb9aSa59rnJDuRukPKfR8JPtekH09+N9uct3Kbg+rgMZPySlIET61AwC
	/gea9WnPHuflgNLoc09fUt6vKulbad0ZTZ76tjIfaYIXUBTIkMEGEDYvUEqdRTfgkp6Xedx4pLR
	wFgfEdZVfYDfILlWb5FaiG8khVR3CN02o68PjXYWmaDA3s3JIeqeqiXQK1hUgPWFFEJn12l7kmO
	CjBWav4mZ8wNxEym29s5Fs1dbj3MUhoV8lL3WhBXPV9xSwzEniZlFCFokyUnTiy4GiArwntrmLQ
	9wqSmFCdeXhbwiY60IwT4VL9qinra205VzC29u1VyaJfSzq2HFfjFbddyoQO2mErYb684rvABeW
	RWgwmZ++768YACbI7LfyCS2PaJCY4ady7vOrv+wPaQXmm/jqtLCKT63hjT7TyCFvaXSgluEEQwe
	61kGHX1zPXUfoUEEXgGmMxBxvX++0tlS1hh0XSajh6DizCNiJ/fOIbwrE9BelZzvMz4sQIi1s1U
	3OLXgrSDdn3DqhZMok=
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr339497015e9.31.1791969080038;
        Wed, 14 Oct 2026 02:11:20 -0700 (PDT)
Received: from fedora ([154.183.128.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm468876155e9.14.2026.10.14.02.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:11:19 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org
Cc: gregkh@linuxfoundation.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3] staging: iio: adt7316: use kstrtobool() for sysfs boolean parsing
Date: Wed, 14 Oct 2026 12:11:11 +0300
Message-ID: <20261014091111.20059-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual character checks (e.g., buf[0] == '1') with the standard
kstrtobool() API in sysfs store functions.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Change _adt7316_store_enabled() parameter type from int to bool to match callers (Andy Shevchenko).
- Update adt7316_disable() and adt7316_enable() to pass false/true instead of 0/1 (Andy Shevchenko).

Changes in v2:
- Include <linux/kstrtox.h>.
- Rename the boolean variable from 'req' to 'val' for clarity.
- Add Reviewed-by tag from Joshua Crofts.

 drivers/staging/iio/addac/adt7316.c | 101 ++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..ec1c33ad5ace 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/kstrtox.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/events.h>
@@ -220,7 +221,7 @@ static ssize_t adt7316_show_enabled(struct device *dev,
 }
 
 static ssize_t _adt7316_store_enabled(struct adt7316_chip_info *chip,
-				      int enable)
+				      bool enable)
 {
 	u8 config1;
 	int ret;
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
@@ -2084,7 +2145,7 @@ static int adt7316_disable(struct device *dev)
 	struct iio_dev *dev_info = dev_get_drvdata(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return _adt7316_store_enabled(chip, 0);
+	return _adt7316_store_enabled(chip, false);
 }
 
 static int adt7316_enable(struct device *dev)
@@ -2092,7 +2153,7 @@ static int adt7316_enable(struct device *dev)
 	struct iio_dev *dev_info = dev_get_drvdata(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return _adt7316_store_enabled(chip, 1);
+	return _adt7316_store_enabled(chip, true);
 }
 
 EXPORT_GPL_SIMPLE_DEV_PM_OPS(adt7316_pm_ops, adt7316_disable, adt7316_enable);
-- 
2.54.0

