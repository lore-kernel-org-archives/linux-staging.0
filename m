Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681DE34B661
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 21:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772744665; cv=none; b=l4GuydtOMb5DDUL4dVdq3LcQP20/4ZwAWUQQPrbJY2Hbvkc3d81pTmpswax5YsZqb3C3QVRd12XLxJJo0hDiFedV/Gmmh3Nto2lgXA3PQkTMaCdmiP9sVLVCjlRgKkHyLyEjerBb2P0ZYtDfz6Y6fKB25zW+zhFVXEYzIWIUsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772744665; c=relaxed/simple;
	bh=RrTc5ZHztUuUqkH+At+TJQt4NUn4orTcyqFWueIoEvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7RQnxyAMtHouRuxVuJU4t9fYaNOE5N8EdQmN/p1FHp9mqXP40knMdLYL0P9tgUr3ttnuR72kZxfH2azDD6jMPjqw4j8wbD8TBPABF8omeEbGS+Eg8isaSml6Og3KMDpmVHaIBczeeMxpeUoYPp2skwK9bgDEOmP72LNTS1S0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7nzLgs4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7nzLgs4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-829865a8471so1249860b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 13:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772744662; x=1773349462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PFqSaEYNCjidkzwHN5ZnhX/rwyXadMMMmVhe1scX/pA=;
        b=m7nzLgs472Zz1HXVKNHNfbdDTHuJmKeEYIYfG2+/moF+yEMzSulqYbMMFd8Jp0snAz
         erolgiqyy6aIokFwf25lqoA3HJsJXr31aS5HDE4trn8hhe1KdARtbZKT2PwxqIeF6xu6
         qacy+xLSGam0CLjDtvozZCVHViPy3S7V+SePc8oCKO3TIl0xdcYLc3LoMX/qXxK9SuXu
         eA9M2nLwu2Ot7bBBYmhrHF+wPw2ycZeTapTiDsQ0AxLz5bXLZZYJpZ10Tvyyaxrst/zJ
         n/Ip91NV0r8dfQgu/Rr+Z0XeyIjVDQMGc1j/8urw0g8Bpi/V8bcDdxUtsE68Raoc6n30
         ObKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772744662; x=1773349462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFqSaEYNCjidkzwHN5ZnhX/rwyXadMMMmVhe1scX/pA=;
        b=Elj87PCnw+DY/yrjGfd7Vlb0o0W5UJWXj9TL9Kxx0ncfQKaPvYgRXeUxfFYqseqCFx
         g0u1D2fogUsAE9JLmpI2mk7EJi4x/x9vM0gdDsYiLyITm/RnXDOR+2x9wIB4YIsUzivC
         fzJT9wq1kU0O9dMxLPrV5/shTT8dYS7cBafK7zfAcWvy1EG1ISpIFB6mR8+xkA/Vtj2g
         KtfWcqsMMzn9vpS8/DL5qlR7WB2SPCIHzYbGx+783oNZMLFq/0cf6C3ZhWFZh2EIUdYb
         3sszg1IDlk8MsTCXZ9+WJx51E/ZJL4WVYzxQb63rpem+pOtVB/YMjpJLTV/o6kx7FrLu
         fwLg==
X-Forwarded-Encrypted: i=1; AJvYcCW3/xhoAnlcz9uxzFNuallpnOW9ENWyiOyBhSaJU0HEGIGvj5JBrp/aeJFx6qr3haP18N+/uzZOSysCYOE8@lists.linux.dev
X-Gm-Message-State: AOJu0YxLyIlx+LdxeejbT74737z0HyaUuya9ZvIarlY8eGo3tFIi1CVI
	b9Y6jSL4GwHnJLlpTMi+WU+rJYluI1qm8QStfDQsyTzVmmI3nMaLwZfD
X-Gm-Gg: ATEYQzx5oGBwWI5r46cqDiJGJ6SoPoO1xiwKXv5MZb7z8uBu+chHCc6uSiQSRBOkE5G
	AzYMhhZxkIeIdy4BKCm1WiVOKlgMhmAys7ZxNKrKlj1xqnJNb2P7i3lmATz2a4eplfhML+yXwJJ
	obhTd4639+Gq0E3ujjEy0ihX8CW5ne4gmcGjV9m81wOVSijiVyeDdhds4ywGeZ2nyKCRrxRURfQ
	u73etdZXvj24DrwxP1iDfPyxi56amslJa72nTu71V1S2TnsDI7TGZ347Ic79Bk+dv/8G8pvZLP4
	7U2XGuNMtpx2cb/aBlG/mda+KarWsi6xWlZhGwCtfk0FBwQo288lsCMnu2mPHDF4aE5WRVhLTZs
	975hBVLdFHZ5yKymd1KNQhWPrc+UUB2WXynoyW/XcSiigFy8Kd2R3wHq7jILqBjnsB0Zg1/U04c
	NZUOPcotaB0OMPODiZXyCXjOUY
X-Received: by 2002:a05:6a00:1c9a:b0:829:9130:e698 with SMTP id d2e1a72fcca58-8299130ecb8mr1738523b3a.64.1772744661731;
        Thu, 05 Mar 2026 13:04:21 -0800 (PST)
Received: from arch ([2409:40c2:542d:796b:d56f:9c25:f250:525e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05c0b0sm21854421b3a.61.2026.03.05.13.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:04:20 -0800 (PST)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rougueprince47@gmail.com,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH] staging: iio: ad9832: modernize ABI and remove dds.h dependency
Date: Fri,  6 Mar 2026 02:33:47 +0530
Message-ID: <20260305210347.120446-1-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD9832 driver currently relies on legacy custom IIO macros defined
in dds.h. This triggers checkpatch.pl warnings (NON_OCTAL_PERMISSIONS)
and, more importantly, exposes a non-standard sysfs ABI (e.g.,
frequency0, frequency1, phase0-3) directly to user space.

This patch removes the custom macros and migrates the driver to standard
IIO API mechanisms:
- Standard attributes (frequency, phase) now use info_mask_separate.
- Non standard specific toggles (frequencysymbol, phasesymbol,
  pincontrol) have been migrated to an ext_info array.
- Remove dds.h header dependency.
- Pointless frequency_scale and phase_scale attributes are dropped as
  suggested by Jonathan in
  https://lore.kernel.org/linux-iio/20251231180939.422e9e62@jic23-huawei/

NOTE: This patch introduces an intentional ABI changes. The non-standard
attributes (out_altvoltage0_frequency0, etc.) have been removed. They
are replaced by standard attributes (out_altvoltage0_frequency and
out_altvoltage0_phase). Routing to correct register while writing is
handled by checking currently active frequencysymbol or phasesymbol.

Testing: This patch has been strictly compile-tested. I do not have
access to physical AD9832 hardware. I am submitting this as an RFC to
see if these changes are acceptable, and to ask if someone with physical
hardware could test thisg and provide a Tested-by tag.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
This patch is heavily inspired from discussions in following
thread.
https://lore.kernel.org/linux-iio/20251215190806.11003-1-tomasborquez13@gmail.com/

Since this is an RFC please let me know if these changes are acceptable.

 drivers/staging/iio/frequency/ad9832.c | 135 +++++++++++++++----------
 1 file changed, 80 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b27..066a1b9ee8d5 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -23,8 +23,6 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
-#include "dds.h"
-
 /* Registers */
 #define AD9832_FREQ0LL		0x0
 #define AD9832_FREQ0HL		0x1
@@ -168,12 +166,63 @@ static int ad9832_write_phase(struct ad9832_state *st,
 	return spi_sync(st->spi, &st->phase_msg);
 }
 
-static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t len)
+static int ad9832_write_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int val, int val2, long mask)
+{
+	struct ad9832_state *st = iio_priv(indio_dev);
+	int ret;
+	unsigned int addr;
+
+	if (val < 0)
+		return -EINVAL;
+
+	mutex_lock(&st->lock);
+	switch (mask) {
+	case IIO_CHAN_INFO_FREQUENCY:
+		if (st->ctrl_fp & AD9832_FREQ)
+			addr = AD9832_FREQ1HM;
+		else
+			addr = AD9832_FREQ0HM;
+
+		ret = ad9832_write_frequency(st, addr, val);
+		break;
+
+	case IIO_CHAN_INFO_PHASE:
+		switch (FIELD_GET(AD9832_PHASE_MASK, st->ctrl_fp)) {
+		case 0:
+			addr = AD9832_PHASE0H;
+			break;
+		case 1:
+			addr = AD9832_PHASE1H;
+			break;
+		case 2:
+			addr = AD9832_PHASE2H;
+			break;
+		case 3:
+			addr = AD9832_PHASE3H;
+			break;
+		default:
+			addr = AD9832_PHASE0H;
+			break;
+		}
+		ret = ad9832_write_phase(st, addr, val);
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
+static ssize_t ad9832_write_ext_info(struct iio_dev *indio_dev,
+				     uintptr_t private,
+				     const struct iio_chan_spec *chan,
+				     const char *buf, size_t len)
 {
-	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad9832_state *st = iio_priv(indio_dev);
-	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
 	int ret;
 	unsigned long val;
 
@@ -182,17 +231,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		goto error_ret;
 
 	mutex_lock(&st->lock);
-	switch ((u32)this_attr->address) {
-	case AD9832_FREQ0HM:
-	case AD9832_FREQ1HM:
-		ret = ad9832_write_frequency(st, this_attr->address, val);
-		break;
-	case AD9832_PHASE0H:
-	case AD9832_PHASE1H:
-	case AD9832_PHASE2H:
-	case AD9832_PHASE3H:
-		ret = ad9832_write_phase(st, this_attr->address, val);
-		break;
+	switch ((u32)private) {
 	case AD9832_PINCTRL_EN:
 		st->ctrl_ss &= ~AD9832_SELSRC;
 		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
@@ -245,50 +284,34 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 	return ret ? ret : len;
 }
 
-/*
- * see dds.h for further information
- */
+#define AD9832_EXT_INFO(_name, _ident) { \
+	.name = _name, \
+	.write = ad9832_write_ext_info, \
+	.private = _ident, \
+	.shared = IIO_SEPARATE, \
+}
 
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
-				ad9832_write, AD9832_PHASE_SYM);
-static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
-
-static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
-				ad9832_write, AD9832_PINCTRL_EN);
-static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
-				ad9832_write, AD9832_OUTPUT_EN);
-
-static struct attribute *ad9832_attributes[] = {
-	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_frequency1.dev_attr.attr,
-	&iio_const_attr_out_altvoltage0_frequency_scale.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_phase0.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_phase1.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_phase2.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_phase3.dev_attr.attr,
-	&iio_const_attr_out_altvoltage0_phase_scale.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
-	NULL,
+static const struct iio_chan_spec_ext_info ad9832_ext_info[] = {
+	AD9832_EXT_INFO("pincontrol_en", AD9832_PINCTRL_EN),
+	AD9832_EXT_INFO("frequencysymbol", AD9832_FREQ_SYM),
+	AD9832_EXT_INFO("phasesymbol", AD9832_PHASE_SYM),
+	AD9832_EXT_INFO("out_enable", AD9832_OUTPUT_EN),
+	{ }
 };
 
-static const struct attribute_group ad9832_attribute_group = {
-	.attrs = ad9832_attributes,
+static const struct iio_chan_spec ad9832_channels[] = {
+	{
+		.type = IIO_ALTVOLTAGE,
+		.indexed = 1,
+		.channel = 0,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_FREQUENCY) |
+				      BIT(IIO_CHAN_INFO_PHASE),
+		.ext_info = ad9832_ext_info,
+	},
 };
 
 static const struct iio_info ad9832_info = {
-	.attrs = &ad9832_attribute_group,
+	.write_raw = ad9832_write_raw,
 };
 
 static int ad9832_probe(struct spi_device *spi)
@@ -321,6 +344,8 @@ static int ad9832_probe(struct spi_device *spi)
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad9832_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = ad9832_channels;
+	indio_dev->num_channels = ARRAY_SIZE(ad9832_channels);
 
 	/* Setup default messages */
 	st->xfer.tx_buf = &st->data;
-- 
2.53.0

