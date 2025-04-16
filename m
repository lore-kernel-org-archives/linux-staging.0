Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205421487E9
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813362; cv=none; b=TjMtCSCr82RfiV41uI1fTjZ7nymbUZjxHUo6yaLJVuDRSBLSDNxrBFTt2I/ym7KS5D1Cq8+gZCxWGkYII8ELQ6ypYNq1yjeZjeMNI0yn/RkDNpJaG0sdviW6fsWGqArZ4XdKIJ3Z5t+Zb7mH/u8Pj7wQMyJJGJ1SyhNGj8dsh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813362; c=relaxed/simple;
	bh=XZsuHRStzxgMBNJSgZNeSiXFlRaHY2fp/H0igW2RWPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afe/QHaVMXkx6+Q1zOYwuAfJMOOeFOW5YMgcJSQT8xi4d4JRWVgsON1uScTTzitj6LFs+aWSa3WFXeblVN64V0JvKWwsqGD6knDu80a5SDjBCgxuAGWdztbJD5futDdKiUr/ssrqhe8uEIhqicPiks+xnyD9eGoPEVVjPW0Gj8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlJlA1ot; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlJlA1ot"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ed16ce246bso37830936d6.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 07:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744813359; x=1745418159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EvGQzRQZa4QQ8HT7sQpSMDihfEbd4TOYSrjVJqZvxUo=;
        b=RlJlA1ot0M+DygdmWaFshwCYJmkCkjSdxdeb4aCoCAK6PSgeRERbLIYV5y9mDh1zY5
         E3jPa7xrTH/V4+j16Pk4Ads1Kx3HLFLLBrl2VNtjlGqh7LPgvYIDehPnCF7iu4WZnnmf
         THWUyOoAOyqiTJhcmpv8FRm7NR+scwUtU69p2DIIT0oa0JfuTj6mpArL7isEhi/cX9MB
         6mmyQIPFHdOjUCJr30m13F7/RoRyQsFbcOWP1UzfAN0w7kRN79fooSf1tzrA1QbKaNpz
         aAmfkN37M31/Z0Y5OI3CoxK18/f3mEo0MTDERgU8oOr0CH0ge0QpCqs9jY+yOIa8sa7F
         WtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813359; x=1745418159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvGQzRQZa4QQ8HT7sQpSMDihfEbd4TOYSrjVJqZvxUo=;
        b=Sz0WEo4K9ifbBiQ43QbAEOCA7ysZ3rFVw7XERZRwTu8GGHB6i8S4XBs90+E657nVMd
         bJppuQVgfK3bycVlC60XW76tS3DH0ng7DZJCv9rtrjIYOi73POwSd7vbC1lz+e3lVAeP
         jlvVl3x+HPpxbSr6nDM6F3/59mD0b63hMgM/3j3KfqbSHOOkXmMVKjyMtw2vXVlqrwBp
         njakc2a/vaQqYiN88PH/ip5g40yoFLOuQgFk+23xcmKe6gZ1ZDy3YrS+yUk8/axB0Wqf
         s2q8GD2xG6vtdkmuqV/o4hiOszPbYZ3Kvpz9BhCqlrykNMAj6zYS3oec9n/WcMvhsjfw
         oKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsWydJzad+O+4vKFf2smSIc50I4wsUrO7tL5rrpyjEDLvdOmqDgL4aEk9MZH/scbnWQ+oYqw/yNv9Z4Nv7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb+m63ZHNK6jie3OjzT3lNlIGDeoKAc36sHoiHPdZ4JlIJUd7z
	/ZW0Keos5iYhWydS87EYfW5z6Zj7vNNksyBE8z9Kby1k41B/1Ql3
X-Gm-Gg: ASbGncunGu42ezblb43qCjV5wULRrlQhti/YmVucz8A5rILaeMQ3PeEQxK0B7MYvnXO
	KEd2jFxTYsDlIbt4J+gFrdc56U4zCR7yIO1+LpqayIHjQtVp0627eZgRwhRcs5AOXNiM5/wKZbI
	md3SNQ3HynKJWkOzfTJbj9T6NwGZ0Qt2+MoJz+lOFhPoADq+DhoCFol3wp98PIjiGGVl6ACIILA
	1BGSxvWwJzRDu7xNcIEjsz+/p0DG+YMqAYryFdCyQMmMGnCiszhlsS5pKNIgB45lUvHFloJ2/3/
	GQqpEMOFbxOOI1pQUmLpuazoVbo57ox4vWt2xJ27qIiLh5+GvdiE45TVhoYESfzRRnoTHqtsOE6
	ax9ZE7ba21sWYlcGAVSA=
X-Google-Smtp-Source: AGHT+IEcAZ9IgLpYeEER0BEL2UCmb2z3SLd7boWdJice9lo1bjTqV2QSQw7nCpJwiFqqE8SK51WOGA==
X-Received: by 2002:ac8:59c6:0:b0:477:704a:a580 with SMTP id d75a77b69052e-47ad80b41b5mr34553521cf.13.1744813358827;
        Wed, 16 Apr 2025 07:22:38 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc20aesm108741971cf.78.2025.04.16.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:22:38 -0700 (PDT)
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
	kernelmentees@lists.linuxfoundation.org,
	stable@vger.kernel.org
Subject: [PATCH] iio: ad5933: Correct settling cycles encoding per datasheet
Date: Wed, 16 Apr 2025 10:22:19 -0400
Message-ID: <20250416142219.554938-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the settling cycles encoding as specified in the AD5933
datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
previous logic did not correctly translate the user-requested effective
cycle count into the required 9-bit base + 2-bit multiplier format
(D10..D0) for values exceeding 511.

Clamp the user input for out_altvoltage0_settling_cycles to the
maximum effective value of 2044 cycles (511 * 4x multiplier).

Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 .../staging/iio/impedance-analyzer/ad5933.c   | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index d5544fc2fe989..5a8c5039bb159 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -28,7 +28,7 @@
 #define AD5933_REG_FREQ_START		0x82	/* R/W, 3 bytes */
 #define AD5933_REG_FREQ_INC		0x85	/* R/W, 3 bytes */
 #define AD5933_REG_INC_NUM		0x88	/* R/W, 2 bytes, 9 bit */
-#define AD5933_REG_SETTLING_CYCLES	0x8A	/* R/W, 2 bytes */
+#define AD5933_REG_SETTLING_CYCLES	0x8A	/* R/W, 2 bytes, 11+2 bit */
 #define AD5933_REG_STATUS		0x8F	/* R, 1 byte */
 #define AD5933_REG_TEMP_DATA		0x92	/* R, 2 bytes*/
 #define AD5933_REG_REAL_DATA		0x94	/* R, 2 bytes*/
@@ -71,6 +71,8 @@
 #define AD5933_INT_OSC_FREQ_Hz		16776000
 #define AD5933_MAX_OUTPUT_FREQ_Hz	100000
 #define AD5933_MAX_RETRIES		100
+#define AD5933_MAX_FREQ_POINTS		511
+#define AD5933_MAX_SETTLING_CYCLES	2044 /* 511 * 4 */
 
 #define AD5933_OUT_RANGE		1
 #define AD5933_OUT_RANGE_AVAIL		2
@@ -82,6 +84,10 @@
 #define AD5933_POLL_TIME_ms		10
 #define AD5933_INIT_EXCITATION_TIME_ms	100
 
+/* Settling cycles multiplier bits D10, D9 */
+#define AD5933_SETTLE_MUL_2X		BIT(9)
+#define AD5933_SETTLE_MUL_4X		(BIT(9) | BIT(10))
+
 struct ad5933_state {
 	struct i2c_client		*client;
 	struct clk			*mclk;
@@ -411,14 +417,15 @@ static ssize_t ad5933_store(struct device *dev,
 		ret = ad5933_cmd(st, 0);
 		break;
 	case AD5933_OUT_SETTLING_CYCLES:
-		val = clamp(val, (u16)0, (u16)0x7FF);
+		val = clamp(val, (u16)0, (u16)AD5933_MAX_SETTLING_CYCLES);
 		st->settling_cycles = val;
 
-		/* 2x, 4x handling, see datasheet */
+		/* Encode value for register: D10..D0 */
+		/* Datasheet Table 13: If cycles > 1022 -> val/4, set bits D10=1, D9=1 */
 		if (val > 1022)
-			val = (val >> 2) | (3 << 9);
-		else if (val > 511)
-			val = (val >> 1) | BIT(9);
+			val = (val >> 2) | AD5933_SETTLE_MUL_4X;
+		else if (val > 511) /* Datasheet: If cycles > 511 -> val/2, set bit D9=1 */
+			val = (val >> 1) | AD5933_SETTLE_MUL_2X;
 
 		dat = cpu_to_be16(val);
 		ret = ad5933_i2c_write(st->client,
@@ -426,7 +433,7 @@ static ssize_t ad5933_store(struct device *dev,
 				       2, (u8 *)&dat);
 		break;
 	case AD5933_FREQ_POINTS:
-		val = clamp(val, (u16)0, (u16)511);
+		val = clamp(val, (u16)0, (u16)AD5933_MAX_FREQ_POINTS);
 		st->freq_points = val;
 
 		dat = cpu_to_be16(val);
-- 
2.43.0

