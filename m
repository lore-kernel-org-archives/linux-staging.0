Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A266E2AE8C;
	Fri, 18 Apr 2025 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997606; cv=none; b=Q5dSLW9y5d/tr4CFWAkUoXAh5jj/ez9eRuk23oTHT/aYpcBsBmh3OifcyJT/Gxf4mkFgRhWUKztqKLc2LOgt0iZOwWpslbGFPguZn66c7Sg9xy9RckQM4JIDVaoeMaR8A0qZ1LfAfcnDIr8JP+mHBn9t54ct/xsXpNtZwuSahlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997606; c=relaxed/simple;
	bh=SJZAuEqKXmhALWmYOXKFLmd3w3nQUws2fGTQHVOurCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRKK8f97HibtSVakfiVegwkCdDp83TnX6hcQy5ZfCiwtbIktmeL0D9348qvAmDNM1uY+udmZuGvFnK9Z8/GoqC9miVpx3Rnzy8YpsKdA4WGpwlVb3GRaWi282//oxq6WdJpF5jSB6x+uGru5Favwl3nxwm4FgIZCTTZCMiKKVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR3q2jwm; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR3q2jwm"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5ba363f1aso257059285a.0;
        Fri, 18 Apr 2025 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997603; x=1745602403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPoq3aflqbH39XCuDdhyU0hYsjcWA8sDyaLTiOfT/KY=;
        b=RR3q2jwm1+XQxVcj/0rtnBFIc75cA1DXZG3Pk3f3CeVupwx7fP+yhTQp0d+/Y7vDao
         HPVbPtGHPgG9SQOAexR3ngrPk8U3G755AFhmOds7PoFvUX9TD+O3NxtgxUwXfzyE4swl
         YUciFZxW3/CvyE445dMD0SyFgSC1Y+vdqC92vA+zH4c812BbDnHSh+Ym5XiDDcryCoQ0
         MhL16REH+USn7Pg/zGxUjCK4YqwiyLjRCmHAbtOlT9CHONFSzMbCnb1b7+CDEyjQ1ZuY
         ZCFRVlb6S+FW/o4ReTjojL5mC6U+LxNZ2zXARlUxIN0PSGNckjs6Clf7JB1i5TSRCSxy
         RZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997603; x=1745602403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPoq3aflqbH39XCuDdhyU0hYsjcWA8sDyaLTiOfT/KY=;
        b=oO5cnNR85fjVj5LHvB6y2NjRqN2qgE/OkLK6JQ75oeGCN9Z+kYKbPHnP+yxea3Fnoz
         Mf2XmUHER/xhaEvY/Vxbbircylw4WryIkSMndhpQs0tdVmbgECzGAj0YCQdy4BMZ6cpa
         9aTafTrSwPc7MS3J5PhgHt90jqtnmDOTpbTgOT4LUW+rvqfCS/L6TIKsJ1D5K3RhEi1w
         vVuqGjyc7+YdOAvhWK+afaAQb9U5HLLNcvUNwmOF6U+IZIJT6azM9MIId+HdSnpIzNqe
         56inlmCYeMBg446lxYwsVpdoLuZaxe65j+dXZRHj1oeVLRHnuoZ26HxwhUdHsgziDGZi
         7mxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzI+dTrZSt1RjQqABqDWknqkdFZrCyHMQvIy9i4CIewaM2wdlHhas/oEbTTGQa3ELm+NLvnijc9MgtKTqIBA==@lists.linux.dev, AJvYcCWJVxvahPiGrw+CMdE8wf5aPC9ZZ3qWeg+78i0FOSF2Wip9V9oc12Sal8HCUC7aktC5LoABe7URPHKqYFl7BQEUNVgpuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrr784MT/7Q7r+tGbfFjUa2eouEuGKlPJ/+loJU1mfyamNypq1
	B7C+Y7ljA1AL75/msWV9tcD1pZniWTgjPFP7Hd2+P3y49sgn/39U
X-Gm-Gg: ASbGncsffUshCZ05O/2P7cEPYyAw5zdgeWrA7sN7aGfD+5pibDXtmKsX2vGRPmSb8dP
	3FVM6+/SPoqtVtWwMXlymdcroEoliPZCokpo4jx9Zf4Y18dWLumAJ8bWQMxE661n9O7L7zE7ZcP
	Y3S5lnnHxMxj4MmBQ+n16W65HbIRxXRNMtV2bj77QFOyaY2xcrvFiqAo9pfsZqorjRHWODgDRlB
	7NiFZXAcdf/gQtVKMOZLjc79nepT+DcDFex4QwuCO+AuIMLIZcC3tHhlaMLhDuMLnxg4IL8DxnD
	lxu8XxLCVi9gd9P2Uo6Lj0KSgkPKrj0Ta+9jk9xIiEuQBK+NWdl2csPU2g5xogWm+Hm658kjLWd
	X+9EGOtIyRFfW0wnF9/I=
X-Google-Smtp-Source: AGHT+IFnLePQm7kXWpY2CuLdLExZj4cttiuv8NDIp5CUUJMcriJSGlJof2gfryFKXUa4IRKWmb+U6g==
X-Received: by 2002:a05:620a:288d:b0:7c5:4a51:238 with SMTP id af79cd13be357-7c927e491e9mr505177085a.0.1744997603405;
        Fri, 18 Apr 2025 10:33:23 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8fff2sm128914585a.38.2025.04.18.10.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:33:23 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] staging: iio: accel: adis16203: Fix single-axis representation
Date: Fri, 18 Apr 2025 13:33:12 -0400
Message-ID: <20250418173313.629606-1-gshahrouzi@gmail.com>
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
Changes in v2:
	- Check write value range in adis16203_write_raw.
	- Remove 0x3FFF mask in adis16203_write_raw.
	- Remove explicit shift = 0 in channel definition.
	- Keep original channel ordering.
	- Add staging prefix to subject line.
---
 drivers/staging/iio/accel/adis16203.c | 53 ++++++++++++++++-----------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index c1c73308800c5..620e0b96d3b22 100644
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
@@ -148,10 +143,17 @@ static int adis16203_write_raw(struct iio_dev *indio_dev,
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
+		if (val < -BIT(13) || val >= BIT(13))
+			return -EINVAL;
+		return adis_write_reg_16(st, ADIS16203_INCL_NULL, val);
+	default:
+		return -EINVAL;
+	}
 }
 
 static int adis16203_read_raw(struct iio_dev *indio_dev,
@@ -161,7 +163,6 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 {
 	struct adis *st = iio_priv(indio_dev);
 	int ret;
-	u8 addr;
 	s16 val16;
 
 	switch (mask) {
@@ -194,8 +195,9 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
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
@@ -208,11 +210,20 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 static const struct iio_chan_spec adis16203_channels[] = {
 	ADIS_SUPPLY_CHAN(ADIS16203_SUPPLY_OUT, ADIS16203_SCAN_SUPPLY, 0, 12),
 	ADIS_AUX_ADC_CHAN(ADIS16203_AUX_ADC, ADIS16203_SCAN_AUX_ADC, 0, 12),
-	ADIS_INCLI_CHAN(X, ADIS16203_XINCL_OUT, ADIS16203_SCAN_INCLI_X,
-			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
-	/* Fixme: Not what it appears to be - see data sheet */
-	ADIS_INCLI_CHAN(Y, ADIS16203_YINCL_OUT, ADIS16203_SCAN_INCLI_Y,
-			0, 0, 14),
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
+			.endianness = IIO_CPU,
+		},
+	},
 	ADIS_TEMP_CHAN(ADIS16203_TEMP_OUT, ADIS16203_SCAN_TEMP, 0, 12),
 	IIO_CHAN_SOFT_TIMESTAMP(5),
 };
-- 
2.43.0

