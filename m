Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B921517E;
	Fri, 18 Apr 2025 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999831; cv=none; b=OofvZuqTg/y4E6MftCyAtN5Ja1R9E270zPrC6vmDGI1fYcnWKQk/MFHRylrR79R8RRjDO+02bmR+otEIRLnQDkzJEvuG7qzNKsxPp3oO/XDkq6x14pRffF+dcPX0IE/vSyO6cYw76Tu/wehyMAQPqCOlkXJVdcjs41tNuPNJnYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999831; c=relaxed/simple;
	bh=9ZRRBmP35YDeEvdiRaqD0aVC5eFr/liuptTJInPwCXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxbgICurxZvT3x6t+T8s6qg3yL6xlP7aqgSGu2m6tm9Kpc6rpoR7noemsVI/ep275ky2VYEkxfEZjKlzjFhM1IZ2/hZxg3KTMZ8Wl0K1sJW/LrwqxMFemd0SleFWi4JtAc1o4qClt77F99aimWezV8ALJTyWVLIktBpPSRARHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rom2RsuL; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rom2RsuL"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c58974ed57so190708285a.2;
        Fri, 18 Apr 2025 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744999828; x=1745604628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PK2Oi/ee+iINPgVMxjWp3y2/EKu796w7pqlWlNAZafc=;
        b=Rom2RsuLJL2pm/Jo6TIYybrl4NiJLcE4qLkafNpYwqY/KEtLeEsLlqTKmJl9H5sPQJ
         k7hKg/sp13i9TzLnLZwK1s7pl+7+pfuGz5iRMuiLlXzXXDDE6aX+XwgU2r6sygFVmHNW
         RFKE520He/Z7iubJpyKvtsH+F6hiKYUoVxtm1UzPhwcETJS0fAPV19l9PrQu/5p927mb
         pXbVLPrN6tw/ccsn34EnwW9kZCrBO5GOKHT5XrfHIbI7pqqjBMaQm/J7cImGjkAQBmXZ
         tzQLSOEpYk77Q0gxfXpYSIM2TI/NFVkMZvFCkkT7MEBtxJky4R5zioXPrwaeErb+nPCY
         3v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744999828; x=1745604628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK2Oi/ee+iINPgVMxjWp3y2/EKu796w7pqlWlNAZafc=;
        b=mpEu92IFwOmzFJ3RAItpxzIk/REH81c5Btk0ERkPufkisnER7cUQcMyvXQF8qEOqt7
         c9s/l/vExypadhgCkcxZFPdQyEyH9T4M9kwstClEOtTY0u9tJMrSu2dFhWlb92TocVml
         c5ttnY9MP2ROz2253/W7fdpI54qC/ELDTnXXnE2jOltm+XDCqsThxAQNrPNbC1ibsLgH
         nbm/AVlpc3pWf0P8h/ryElumDFmIuAn3OwPqUyCYp+6HkT1nZd3aFSjkD4IXx9X2yBsL
         i2wj8mursiPYWEuXx1rNsYq1oFgUpLc8P0I2zxYCKF0TdzGFYA1YO8Bqf2cT034Ka7be
         xRng==
X-Forwarded-Encrypted: i=1; AJvYcCU78AfoUvizru2XxM4VMp6QgY3KjuNXiMjnPm+RwJcBbkgcKmujp/rXEKwdxHAO5/nLrf1N4dt2h9GMCiEgGxoQK1bWwQ==@lists.linux.dev, AJvYcCWbzlT0pnAP4kGoiYcilef8Qiy1SVWP31nSdxRysL8MduzMc9p0Hwlst+OR6PEcALvlIGU40YVJXVlOERSB7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEUHWzJKRG4fgXhKPNzIBqRxJEaP6/p5ljjDnlNl/KbwgnCTKx
	CQaH+PAhs7diLLgTR475WqLpHull57b2/0T1FEratpraLc+3PYI5
X-Gm-Gg: ASbGncskHV0jdKHKHA0rVdSk2ZkI9bktvv+Rnh2L3JyWfLHutKCj+6OhztK9ei8X8W3
	p+C5LEpsUKklR/rryZPpHNlR40AzW++NeP1enKJaEl2ASfcMcchGpcDw+7M7oZBLJbS7B9NvhBm
	xdUwsE4A9bY2dVbQi7vyM5+/3/O+OknHFcNB2PuVjvM5bGNhZ/vTZpg3HING6L3fPRuFfE6lrMw
	/jnuyN5zcCVCO6rDExxwpvT4yLFMz82u+ASp5CBDUGf6UNaBg9iNS8utC9g7eQvL2vQvbK6Hfg2
	egaqILhIihirorXRO3O/NczUPnX8pZPHKXQauFA8kKAfxbJ5mxkffE/AtTLgISviczx8FnNrcRx
	GoXEkhBNLuK9gnet7JoY=
X-Google-Smtp-Source: AGHT+IE/sV4GWQYZQwrKke9IVMnhly37KO4yL4QVNUy4azKV9PCYCbwiFnSk8+IqQ1Wi+sNAZppQ5Q==
X-Received: by 2002:a05:620a:1a8c:b0:7c5:5206:5823 with SMTP id af79cd13be357-7c927fb506dmr495158585a.29.1744999828081;
        Fri, 18 Apr 2025 11:10:28 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8c9d9sm131832785a.27.2025.04.18.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:10:27 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2] iio: ad5933: Correct settling cycles encoding per datasheet
Date: Fri, 18 Apr 2025 14:10:25 -0400
Message-ID: <20250418181025.637710-1-gshahrouzi@gmail.com>
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
Changes in v2:
	- Fix spacing in comment around '+'.
	- Define mask and values for settling cycle multipliers.
---
 .../staging/iio/impedance-analyzer/ad5933.c   | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index d5544fc2fe989..3c301a8ebd2ab 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -28,7 +28,7 @@
 #define AD5933_REG_FREQ_START		0x82	/* R/W, 3 bytes */
 #define AD5933_REG_FREQ_INC		0x85	/* R/W, 3 bytes */
 #define AD5933_REG_INC_NUM		0x88	/* R/W, 2 bytes, 9 bit */
-#define AD5933_REG_SETTLING_CYCLES	0x8A	/* R/W, 2 bytes */
+#define AD5933_REG_SETTLING_CYCLES	0x8A	/* R/W, 2 bytes, 11 + 2 bit */
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
@@ -82,6 +84,12 @@
 #define AD5933_POLL_TIME_ms		10
 #define AD5933_INIT_EXCITATION_TIME_ms	100
 
+/* Settling cycles multiplier bits D10, D9 */
+#define AD5933_SETTLE_MUL_MASK		(BIT(10) | BIT(9))
+#define AD5933_SETTLE_MUL_1X		0
+#define AD5933_SETTLE_MUL_2X		BIT(9)
+#define AD5933_SETTLE_MUL_4X		(BIT(10) | BIT(9))
+
 struct ad5933_state {
 	struct i2c_client		*client;
 	struct clk			*mclk;
@@ -411,14 +419,15 @@ static ssize_t ad5933_store(struct device *dev,
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
@@ -426,7 +435,7 @@ static ssize_t ad5933_store(struct device *dev,
 				       2, (u8 *)&dat);
 		break;
 	case AD5933_FREQ_POINTS:
-		val = clamp(val, (u16)0, (u16)511);
+		val = clamp(val, (u16)0, (u16)AD5933_MAX_FREQ_POINTS);
 		st->freq_points = val;
 
 		dat = cpu_to_be16(val);
-- 
2.43.0

