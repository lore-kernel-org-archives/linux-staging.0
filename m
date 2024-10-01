Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696D1CEAA3
	for <linux-staging@lists.linux.dev>; Tue,  1 Oct 2024 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727814456; cv=none; b=EttiMOg6j5JFLyrrHyG3Bdu4jHwzp7oFOy+jGVLFTlfUx7zxtYXJQuskPCve3ZUfNX5eT7/zSLjMlZ065ZW9wB5Y2vqbUFdKS3riiOONrao2Mj7NtJCFvrjlTiaLxWY+UUbGVMMhTM4Tyf+v49JevIjLRqZlXt+Zo+BGGG8Wy6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727814456; c=relaxed/simple;
	bh=H4bdBSamTFamzjdwBqR2NWHqwHPg+FdIpqJlRjDUcYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=spc2z5y+xKiBAbgpG+tlelO5eczbSNR3QwcxcHIJbFXVJgGy99UwiHyQwiBMtRQlOTExBkYie8RLvj7hj98GU+NZLnZghfVAhXKgvNaJn7zcWh+aNtNcDz8CvzlMGSlWiXsw166los/AZGRC3shIb2m7M+bP0XRV0qNUZ7QcvW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRu7KAWt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRu7KAWt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb2191107so49119395e9.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Oct 2024 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727814453; x=1728419253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qD7v3ZFGzDO3rZ5/zAQpp+VpbAmOnF0NWp2xESDN9aY=;
        b=hRu7KAWtuWpy1VQjst4ANgb8UXwMcbWM7+Pp66J895G2ViCkkGCnj+zqIi3c0UwrW2
         HRlZGTvhogVD0IqjAcYdrYXVukA0RLcYqlKBqoG6Roljt9kLaf5Vfs+9S3PpX7G/UmXt
         GX/4Z2Qd/8TyNCIjwYxayl34QDKlHyIrwRfBxLXUpDSBg/gQQaCHlHxZMSUX/3PVCKOG
         n4BaNePJ5jvXEHdinuQoYOSUsASf+//ZLKzazIWHuKCTr+VRZ4vQFNBvSzpr5SWjvgav
         zDsX/iTMEa2CsP6mFiRCLFn97xV3jBbNQdlCnVkUenTrq6PFpPqa8falIJejHH5bFxkN
         kr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727814453; x=1728419253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qD7v3ZFGzDO3rZ5/zAQpp+VpbAmOnF0NWp2xESDN9aY=;
        b=ZeLWsvhpOKZJtLE2LQMVqt885HVWq+2olbXRbNR7pbOMdOGyKkNDtFODSW3YImDUdl
         0eVuWUuLfYR8A3OaLlDoDoVGHDaG7/ctNogl4E1WQA8RdlnEs5ciq97mLyANVCNBeNLO
         YqTz3yPN3g08At87oTGACaaVj6CSBahrzzVZJr28k2gTFloeIO9MZhefBK/WWwPPcALk
         WIYiQUOMIVYVtJZdMj0XL5fgshcGQ3TWuBEHNnZDlY4zN7wi4TN9GDLAh7KRYA0pDVwp
         WfJEBh+y681Lbhn6pvekvEzOfh691rfohUK3omINsFx0A4sFzpmxQyFAwywwkPUSMTRJ
         lBKA==
X-Forwarded-Encrypted: i=1; AJvYcCVhDT0OS7O3PRo5EQxI4PSSjiwzokXeThQU81Zxj2uLh4DN7d6gm5faFc4JLYgaTf5eJweYJfL35/TWqZ5C@lists.linux.dev
X-Gm-Message-State: AOJu0YwW/rKVLooYSaj58xJAB5ZCiqsRFzZ6Ql2Sw1ffgf6HfyPC9RpI
	4gdcG1NiGat3biRtpJXQdz3904D5q2ho9Ik7xE//VpwvD9dPPKrz
X-Google-Smtp-Source: AGHT+IGQLSBVSwDZ+R4yiiPWFBZebp6M/p3K1PqcN0jlHaUJFfkfCcUvQg6TPyq7aHPkRft+8wnuRg==
X-Received: by 2002:adf:e447:0:b0:374:d1dd:1cc1 with SMTP id ffacd0b85a97d-37cfb8a490bmr493759f8f.2.1727814453012;
        Tue, 01 Oct 2024 13:27:33 -0700 (PDT)
Received: from localhost.localdomain ([146.70.124.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730ecasm12604353f8f.81.2024.10.01.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 13:27:32 -0700 (PDT)
From: Tudor Gheorghiu <tudor.reda@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tudor Gheorghiu <tudor.reda@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: iio: frequency: rename macros
Date: Tue,  1 Oct 2024 23:24:30 +0300
Message-ID: <20241001202430.15874-2-tudor.reda@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The frequency iio drivers use custom defined macros (inside dds.h) in
order to define sysfs attributes more easily.

However, due to their naming choice and the fact that in some of them the
first and/or second arguments are decimal, checkpatch will throw errors
in the source files they are used in (ad9832.c and ad9834.c).
This is because it thinks the argument is _mode, therefore
it expects octal notation, even if the argument itself
does not represent file permissions. Example:

ERROR: Use 4 digit octal (0777) not decimal permissions
+static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL, ad9834_write, AD9834_PSEL);

By re-naming the custom macros, we will avoid these false positive
checkpatch errors.

Signed-off-by: Tudor Gheorghiu <tudor.reda@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 26 +++++++++++-----------
 drivers/staging/iio/frequency/ad9834.c | 30 +++++++++++++-------------
 drivers/staging/iio/frequency/dds.h    | 20 ++++++++---------
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 6c390c4eb26d..621543e50dc5 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -252,22 +252,22 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
  * see dds.h for further information
  */
 
-static IIO_DEV_ATTR_FREQ(0, 0, 0200, NULL, ad9832_write, AD9832_FREQ0HM);
-static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
-static IIO_DEV_ATTR_FREQSYMBOL(0, 0200, NULL, ad9832_write, AD9832_FREQ_SYM);
-static IIO_CONST_ATTR_FREQ_SCALE(0, "1"); /* 1Hz */
-
-static IIO_DEV_ATTR_PHASE(0, 0, 0200, NULL, ad9832_write, AD9832_PHASE0H);
-static IIO_DEV_ATTR_PHASE(0, 1, 0200, NULL, ad9832_write, AD9832_PHASE1H);
-static IIO_DEV_ATTR_PHASE(0, 2, 0200, NULL, ad9832_write, AD9832_PHASE2H);
-static IIO_DEV_ATTR_PHASE(0, 3, 0200, NULL, ad9832_write, AD9832_PHASE3H);
-static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL,
+static IIO_DEV_FREQ_ATTR(0, 0, 0200, NULL, ad9832_write, AD9832_FREQ0HM);
+static IIO_DEV_FREQ_ATTR(0, 1, 0200, NULL, ad9832_write, AD9832_FREQ1HM);
+static IIO_DEV_FREQSYMBOL_ATTR(0, 0200, NULL, ad9832_write, AD9832_FREQ_SYM);
+static IIO_CONST_FREQ_SCALE_ATTR(0, "1"); /* 1Hz */
+
+static IIO_DEV_PHASE_ATTR(0, 0, 0200, NULL, ad9832_write, AD9832_PHASE0H);
+static IIO_DEV_PHASE_ATTR(0, 1, 0200, NULL, ad9832_write, AD9832_PHASE1H);
+static IIO_DEV_PHASE_ATTR(0, 2, 0200, NULL, ad9832_write, AD9832_PHASE2H);
+static IIO_DEV_PHASE_ATTR(0, 3, 0200, NULL, ad9832_write, AD9832_PHASE3H);
+static IIO_DEV_PHASESYMBOL_ATTR(0, 0200, NULL,
 				ad9832_write, AD9832_PHASE_SYM);
-static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
+static IIO_CONST_PHASE_SCALE_ATTR(0, "0.0015339808"); /* 2PI/2^12 rad*/
 
-static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
+static IIO_DEV_PINCONTROL_EN_ATTR(0, 0200, NULL,
 				ad9832_write, AD9832_PINCTRL_EN);
-static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
+static IIO_DEV_OUT_ENABLE_ATTR(0, 0200, NULL,
 				ad9832_write, AD9832_OUTPUT_EN);
 
 static struct attribute *ad9832_attributes[] = {
diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 47e7d7e6d920..e1f7469d8011 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -321,21 +321,21 @@ static IIO_DEVICE_ATTR(out_altvoltage0_out1_wavetype_available, 0444,
  * see dds.h for further information
  */
 
-static IIO_DEV_ATTR_FREQ(0, 0, 0200, NULL, ad9834_write, AD9834_REG_FREQ0);
-static IIO_DEV_ATTR_FREQ(0, 1, 0200, NULL, ad9834_write, AD9834_REG_FREQ1);
-static IIO_DEV_ATTR_FREQSYMBOL(0, 0200, NULL, ad9834_write, AD9834_FSEL);
-static IIO_CONST_ATTR_FREQ_SCALE(0, "1"); /* 1Hz */
-
-static IIO_DEV_ATTR_PHASE(0, 0, 0200, NULL, ad9834_write, AD9834_REG_PHASE0);
-static IIO_DEV_ATTR_PHASE(0, 1, 0200, NULL, ad9834_write, AD9834_REG_PHASE1);
-static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL, ad9834_write, AD9834_PSEL);
-static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
-
-static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL, ad9834_write, AD9834_PIN_SW);
-static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL, ad9834_write, AD9834_RESET);
-static IIO_DEV_ATTR_OUTY_ENABLE(0, 1, 0200, NULL, ad9834_write, AD9834_OPBITEN);
-static IIO_DEV_ATTR_OUT_WAVETYPE(0, 0, ad9834_store_wavetype, 0);
-static IIO_DEV_ATTR_OUT_WAVETYPE(0, 1, ad9834_store_wavetype, 1);
+static IIO_DEV_FREQ_ATTR(0, 0, 0200, NULL, ad9834_write, AD9834_REG_FREQ0);
+static IIO_DEV_FREQ_ATTR(0, 1, 0200, NULL, ad9834_write, AD9834_REG_FREQ1);
+static IIO_DEV_FREQSYMBOL_ATTR(0, 0200, NULL, ad9834_write, AD9834_FSEL);
+static IIO_CONST_FREQ_SCALE_ATTR(0, "1"); /* 1Hz */
+
+static IIO_DEV_PHASE_ATTR(0, 0, 0200, NULL, ad9834_write, AD9834_REG_PHASE0);
+static IIO_DEV_PHASE_ATTR(0, 1, 0200, NULL, ad9834_write, AD9834_REG_PHASE1);
+static IIO_DEV_PHASESYMBOL_ATTR(0, 0200, NULL, ad9834_write, AD9834_PSEL);
+static IIO_CONST_PHASE_SCALE_ATTR(0, "0.0015339808"); /* 2PI/2^12 rad*/
+
+static IIO_DEV_PINCONTROL_EN_ATTR(0, 0200, NULL, ad9834_write, AD9834_PIN_SW);
+static IIO_DEV_OUT_ENABLE_ATTR(0, 0200, NULL, ad9834_write, AD9834_RESET);
+static IIO_DEV_OUTY_ENABLE_ATTR(0, 1, 0200, NULL, ad9834_write, AD9834_OPBITEN);
+static IIO_DEV_OUT_WAVETYPE_ATTR(0, 0, ad9834_store_wavetype, 0);
+static IIO_DEV_OUT_WAVETYPE_ATTR(0, 1, ad9834_store_wavetype, 1);
 
 static struct attribute *ad9834_attributes[] = {
 	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
diff --git a/drivers/staging/iio/frequency/dds.h b/drivers/staging/iio/frequency/dds.h
index 2ebe68eb7398..7f28eb437305 100644
--- a/drivers/staging/iio/frequency/dds.h
+++ b/drivers/staging/iio/frequency/dds.h
@@ -11,7 +11,7 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_frequencyY
  */
 
-#define IIO_DEV_ATTR_FREQ(_channel, _num, _mode, _show, _store, _addr)	\
+#define IIO_DEV_FREQ_ATTR(_channel, _num, _mode, _show, _store, _addr)	\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_frequency##_num,	\
 			_mode, _show, _store, _addr)
 
@@ -19,14 +19,14 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_frequencyY_scale
  */
 
-#define IIO_CONST_ATTR_FREQ_SCALE(_channel, _string)			\
+#define IIO_CONST_FREQ_SCALE_ATTR(_channel, _string)			\
 	IIO_CONST_ATTR(out_altvoltage##_channel##_frequency_scale, _string)
 
 /**
  * /sys/bus/iio/devices/.../out_altvoltageX_frequencysymbol
  */
 
-#define IIO_DEV_ATTR_FREQSYMBOL(_channel, _mode, _show, _store, _addr)	\
+#define IIO_DEV_FREQSYMBOL_ATTR(_channel, _mode, _show, _store, _addr)	\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_frequencysymbol,	\
 			_mode, _show, _store, _addr)
 
@@ -34,7 +34,7 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_phaseY
  */
 
-#define IIO_DEV_ATTR_PHASE(_channel, _num, _mode, _show, _store, _addr)	\
+#define IIO_DEV_PHASE_ATTR(_channel, _num, _mode, _show, _store, _addr)	\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_phase##_num,		\
 			_mode, _show, _store, _addr)
 
@@ -42,14 +42,14 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_phaseY_scale
  */
 
-#define IIO_CONST_ATTR_PHASE_SCALE(_channel, _string)			\
+#define IIO_CONST_PHASE_SCALE_ATTR(_channel, _string)			\
 	IIO_CONST_ATTR(out_altvoltage##_channel##_phase_scale, _string)
 
 /**
  * /sys/bus/iio/devices/.../out_altvoltageX_phasesymbol
  */
 
-#define IIO_DEV_ATTR_PHASESYMBOL(_channel, _mode, _show, _store, _addr)	\
+#define IIO_DEV_PHASESYMBOL_ATTR(_channel, _mode, _show, _store, _addr)	\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_phasesymbol,		\
 			_mode, _show, _store, _addr)
 
@@ -57,7 +57,7 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_pincontrol_en
  */
 
-#define IIO_DEV_ATTR_PINCONTROL_EN(_channel, _mode, _show, _store, _addr)\
+#define IIO_DEV_PINCONTROL_EN_ATTR(_channel, _mode, _show, _store, _addr)\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_pincontrol_en,	\
 			_mode, _show, _store, _addr)
 
@@ -81,7 +81,7 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_out_enable
  */
 
-#define IIO_DEV_ATTR_OUT_ENABLE(_channel, _mode, _show, _store, _addr)	\
+#define IIO_DEV_OUT_ENABLE_ATTR(_channel, _mode, _show, _store, _addr)	\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_out_enable,		\
 			_mode, _show, _store, _addr)
 
@@ -89,7 +89,7 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_outY_enable
  */
 
-#define IIO_DEV_ATTR_OUTY_ENABLE(_channel, _output,			\
+#define IIO_DEV_OUTY_ENABLE_ATTR(_channel, _output,			\
 			_mode, _show, _store, _addr)			\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_out##_output##_enable,\
 			_mode, _show, _store, _addr)
@@ -98,7 +98,7 @@
  * /sys/bus/iio/devices/.../out_altvoltageX_outY_wavetype
  */
 
-#define IIO_DEV_ATTR_OUT_WAVETYPE(_channel, _output, _store, _addr)	\
+#define IIO_DEV_OUT_WAVETYPE_ATTR(_channel, _output, _store, _addr)	\
 	IIO_DEVICE_ATTR(out_altvoltage##_channel##_out##_output##_wavetype,\
 			0200, NULL, _store, _addr)
 
-- 
2.43.0

