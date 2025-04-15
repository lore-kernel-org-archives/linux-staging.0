Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75A24397A
	for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 22:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744756020; cv=none; b=rUnx8jF8fxiWdY2xuWlBswn8IAoKrfSW8hby5PIuY5FzeAqI4bpYz799t4p2ITvpDwId/JVH6p0GNH48CF2DmEMHmDO7JVqn5oHjJrUyC2XjWyNqyo7l7Asy2UTlOKiOaGVlrmUYxcEhlt+4OMgnKDd7Fuc+8hAVgJuxk1P2hEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744756020; c=relaxed/simple;
	bh=zsi89bgSmtU7lZblT+BF8md3DDnpqHXHre5LbRWl+o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YuX6WPwqyeMMVw7DF18AItIKB4pPtnU8o24yZk0F5ImZQ59cl/FGdDi38E1JFgTix9HXRNTIQWrmaIc2DRB6+XWBixbt6oXlBZU72FfLIe0KlDreaIBN1q7L2VgHH66ifFq8XHajNzPLWDIVMUMhnEFmgZgxJy0tH9Pr/RCu8fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVPDFzM8; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVPDFzM8"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c6a59a515aso365275085a.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Apr 2025 15:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744756018; x=1745360818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEYNZDctBCSE23/ne3WNMM44X6P5xxUVs1sGie06hNs=;
        b=mVPDFzM84JVVVmZ8ZGRZaPNF0vV8qHP6N1QSncG4jik7KmljjjYsUO6Hgy5opKeNLR
         qFM0rdY+85475N2jA9w5TcuqGlrxzjl2fKQs3tAKjlC47EcnGpc+rXiudp8JxpQB5Adn
         idw5R+etKQt/q1fUFnlLgiXZjRVXwS6jM0+PJLsHy8hYwKHgDC+7HoNaE24foo4MJFLY
         KbAv4pA2776KC7zZUMCjnCXTrzK0f+gX9emX42MBWDuP+/skBPNS7jaWtNTQfyKtU4ua
         qX5Z2pilRA9yrU9DGvMCgRSGOTZbQAZ62LT74O0tY2MneQ1Vex7HZ/HJp1fcQGr4VS0p
         MCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744756018; x=1745360818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEYNZDctBCSE23/ne3WNMM44X6P5xxUVs1sGie06hNs=;
        b=c8Bj84dzFug50AVz0tr7I98Gn1OG62ujOzXOdUeqJUYEVxbRark7HM7viEy8iHEyDc
         LaMnUQMeKGSwzGDnLBVzeAz9y6aqRKpPKqqXqqeoJ2HCVoF98/4ta/k7ktvY71qnc8JK
         Eq00dA+9U8XQxXnGXdzN4fJqYkNc/YgoKAKx6D+I4xm0nPWMAmI6fLbQf4TEolA6lEEI
         c5Gj1fs4k819RXFDXBrAPsEoziC+vigUDnGIAAg2xYQDsN5Q7LwZ51z41qZ8RA7d/boI
         jblCzUAjy5oBC7dXM3fcxhB5UCRnlKXUmOjsdnpPvJQqh6elf9sbIVjfrmvIltH9Evel
         qZhA==
X-Forwarded-Encrypted: i=1; AJvYcCUcBBqy1DWdXI+oviAQwuA33SL7Yh7kXKiNu/764Ay+oFfzLsBcx1if2B2nLFYCL9/7ItGcvfn8vpcH9Jrh@lists.linux.dev
X-Gm-Message-State: AOJu0YxrarqLQcPsZeg04zsI+n/lipxzllmPzcdfa2G5I6jpU4YLf3a+
	6F2aE1UZs/2IeimphLa9aWwfzk5UOy7TBYVDZFxk81r3wP316Wt5
X-Gm-Gg: ASbGncsr0JQWZNz7DKPlAZuMlaxGJDbw/z1tAWGBryZ61Id6vzA8z5mA39pEbvgLNGC
	jHK0J03izpAKWvTyQULr7DU9mzijuNQWr/xJhbFGpmoGyVPQqiZDvRMaPASCRFXcCQRqlTefQsp
	qH+D/bEaQ/eDlVB6C8W94PszHdoZN66R5eAdK8X5PCIk/hqBeTvhnEtgLa0I5EGlRZp53gV9PZl
	+fg8TK0+i0TAAzSkU+C5/Tutj+2MOZi+z0dj0HZ8C3idYKN49Aci6ie+ypkynC+KH7lI0XhmnS+
	VByWWEqDeIoDxc/TX74Bq1d+0GVZ6iZWmJ6HtOR2c9MGYbEb8sSiU5Y=
X-Google-Smtp-Source: AGHT+IFBHn0VTQXG525RZ9QG9jMGNPm1rALizW+qaDZYU0/aS/yRxxUN3aj2878kI9kfa9Z9sCaOVg==
X-Received: by 2002:a05:620a:31a3:b0:7c5:9b93:8f64 with SMTP id af79cd13be357-7c91424103emr213318985a.37.1744756017807;
        Tue, 15 Apr 2025 15:26:57 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc1af2sm98154531cf.69.2025.04.15.15.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 15:26:57 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org
Subject: [PATCH] iio: accel: adis16203: Fix single-axis representation and CALIBBIAS handling
Date: Tue, 15 Apr 2025 18:26:52 -0400
Message-ID: <20250415222652.545026-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADIS16203 is a single-axis 360 degree inclinometer. The previous
driver code incorrectly represented this by defining separate X and Y
inclination channels based on the two different output format registers
(0x0C for 0-360 deg, 0x0E for +/-180 deg). This violated IIO conventions
and misrepresented the hardware's single angle output. The 'Fixme'
comment on the original Y channel definition indicated this known issue.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Not sure to put a fixes tag here or not because the driver used to be
spread out across multiple files until it was whittled down to one file
using a common interface for similar devices.
---
 drivers/staging/iio/accel/adis16203.c | 52 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index c1c73308800c5..73288121bf0bd 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -28,11 +28,11 @@
 /* Output, temperature */
 #define ADIS16203_TEMP_OUT       0x0A
 
-/* Output, x-axis inclination */
-#define ADIS16203_XINCL_OUT      0x0C
+/* Output, 360 deg format */
+#define ADIS16203_INCL_OUT       0x0C
 
-/* Output, y-axis inclination */
-#define ADIS16203_YINCL_OUT      0x0E
+/* Output, +/-180 deg format */
+#define ADIS16203_INCL_180_OUT   0x0E
 
 /* Incline null calibration */
 #define ADIS16203_INCL_NULL      0x18
@@ -128,8 +128,7 @@
 #define ADIS16203_ERROR_ACTIVE          BIT(14)
 
 enum adis16203_scan {
-	 ADIS16203_SCAN_INCLI_X,
-	 ADIS16203_SCAN_INCLI_Y,
+	 ADIS16203_SCAN_INCLI,
 	 ADIS16203_SCAN_SUPPLY,
 	 ADIS16203_SCAN_AUX_ADC,
 	 ADIS16203_SCAN_TEMP,
@@ -137,10 +136,6 @@ enum adis16203_scan {
 
 #define DRIVER_NAME		"adis16203"
 
-static const u8 adis16203_addresses[] = {
-	[ADIS16203_SCAN_INCLI_X] = ADIS16203_INCL_NULL,
-};
-
 static int adis16203_write_raw(struct iio_dev *indio_dev,
 			       struct iio_chan_spec const *chan,
 			       int val,
@@ -148,10 +143,15 @@ static int adis16203_write_raw(struct iio_dev *indio_dev,
 			       long mask)
 {
 	struct adis *st = iio_priv(indio_dev);
-	/* currently only one writable parameter which keeps this simple */
-	u8 addr = adis16203_addresses[chan->scan_index];
 
-	return adis_write_reg_16(st, addr, val & 0x3FFF);
+	switch (mask) {
+	case IIO_CHAN_INFO_CALIBBIAS:
+		if (chan->scan_index != ADIS16203_SCAN_INCLI)
+			return -EINVAL;
+		return adis_write_reg_16(st, ADIS16203_INCL_NULL, val & 0x3FFF);
+	default:
+		return -EINVAL;
+	}
 }
 
 static int adis16203_read_raw(struct iio_dev *indio_dev,
@@ -161,7 +161,6 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 {
 	struct adis *st = iio_priv(indio_dev);
 	int ret;
-	u8 addr;
 	s16 val16;
 
 	switch (mask) {
@@ -194,8 +193,9 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 		*val = 25000 / -470 - 1278; /* 25 C = 1278 */
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_CALIBBIAS:
-		addr = adis16203_addresses[chan->scan_index];
-		ret = adis_read_reg_16(st, addr, &val16);
+		if (chan->scan_index != ADIS16203_SCAN_INCLI)
+			return -EINVAL;
+		ret = adis_read_reg_16(st, ADIS16203_INCL_NULL, &val16);
 		if (ret)
 			return ret;
 		*val = sign_extend32(val16, 13);
@@ -206,13 +206,23 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 }
 
 static const struct iio_chan_spec adis16203_channels[] = {
+	{
+		.type = IIO_INCLI,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+					BIT(IIO_CHAN_INFO_SCALE) |
+					BIT(IIO_CHAN_INFO_CALIBBIAS),
+		.address = ADIS16203_INCL_180_OUT,
+		.scan_index = ADIS16203_SCAN_INCLI,
+		.scan_type = {
+			.sign = 's',
+			.realbits = 14,
+			.storagebits = 16,
+			.shift = 0,
+			.endianness = IIO_CPU,
+		},
+	},
 	ADIS_SUPPLY_CHAN(ADIS16203_SUPPLY_OUT, ADIS16203_SCAN_SUPPLY, 0, 12),
 	ADIS_AUX_ADC_CHAN(ADIS16203_AUX_ADC, ADIS16203_SCAN_AUX_ADC, 0, 12),
-	ADIS_INCLI_CHAN(X, ADIS16203_XINCL_OUT, ADIS16203_SCAN_INCLI_X,
-			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
-	/* Fixme: Not what it appears to be - see data sheet */
-	ADIS_INCLI_CHAN(Y, ADIS16203_YINCL_OUT, ADIS16203_SCAN_INCLI_Y,
-			0, 0, 14),
 	ADIS_TEMP_CHAN(ADIS16203_TEMP_OUT, ADIS16203_SCAN_TEMP, 0, 12),
 	IIO_CHAN_SOFT_TIMESTAMP(5),
 };
-- 
2.43.0

