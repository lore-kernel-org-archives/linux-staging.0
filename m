Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E84F4779BE
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060759; cv=none; b=t9GhULWDMLORDnOF8UGQk03dxZ9LZ48mqJO+0xs1LxRZPSkkeegb37HbsVyVWHtYR2yjjTtfCixbjvGZpYLjsdZ6JCnZprcSIlFOfor0l4JiFKIrovDlJqW7GSvA24TfsVt1RRNVMdFQ+rHMxFqMlv1lvF/41G5noOZcpDiIEPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060759; c=relaxed/simple;
	bh=/qWO8KI3tIBC0cjksLyab/irCOuK5UlJOac1HvRs0AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEfpUsNP/1VRjOe0AGCgtf4pC6hlgB1Vvpy4rw/m/LEjNqdn3GW+N+hn9SRR7FuyJO+LPnvvDTLtBz/8HZzv2tG2HOzsgB2jdbOODyBzl0q8FE7hzTSsNeVTTtR/r9qsQNiHtTKFIN9oTulepqERhf9ofHv8K3bS3zxRcYskieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=QgF668E0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="QgF668E0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so2980775a91.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775060749; x=1775665549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmuFDt4ssXwo5Kn+8E+MCnCyQLezwxIlCE02tQ8Pv3k=;
        b=QgF668E0gUqj2mNmU/sBUKDDbjPKTAY9m8wFwrDiIf1LCmL/Qn+wW83xWrqBpCCwId
         1M+mbCVVyaUJ5ypqOSPhKQMorv6Zl188a+AM5pe0mL8EGsuFsousQvEdg2xlPui5HxAK
         y0xTqcgyVT9W/6sU4Ssa5QEFwwLhSPhKzOxPehikgTRsyuVEy3vieGOP3faXkQeDPUdh
         0QvfRt3sJVWKvlnxqVlM49LSha9Z4lDV5Y+xrWKNs/tz+381u+M37N1jd86rgA45wd6a
         C9ChVlKq1oFLX2SFoZ7/85ik4ULw8FAFJRJVmkKFQQUAFb1I9dePUdo0VHISuW9QUm6L
         G91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060749; x=1775665549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SmuFDt4ssXwo5Kn+8E+MCnCyQLezwxIlCE02tQ8Pv3k=;
        b=MIgqAKJOTDdBw9tGK6T87W+B8Twa+dmgWxCI4vzRaMYxtlTfzUzdpVSaB7zX+Dfsy1
         p9y30cwGtC7FTB7LkC6hAH8rFkSRIaq07ErBIm9UAafor/L3MGkNqNMXjn6/YgHfA85d
         ZUwmus2wo1rcZ43TfcPMp9kVx0yFkCD2ImC5t451LIHUJPhocsRge3rwUzte82EJqf8H
         JiXN7Pl7ganhRfyfV0rFfnXrf+KNcnShrM1/AhSbssTS/kw0DGtq6ZBML2Acp2ZdC9lm
         bneSf9snBzLffxu0/wiIN22kTtJ/ViQ3fcek6scHC6PLjAaU2if/6SqRy4vIREi7Nqow
         nNhw==
X-Forwarded-Encrypted: i=1; AJvYcCVzfO33tbYmzGjZkDBRlvmN4+6Y3F60WSysDz33YOIG4TF5xiTFv54d+wODE2Zlxgv9Z6zjLHKpOcsxXUKs@lists.linux.dev
X-Gm-Message-State: AOJu0YwrmlZ6hDKALykaMOm0vtdpaWnbCelq57MZPBOiykeNr4zzZKHH
	NvQxDindGyw8KR2BZQQMu0sbxh2wtNk7MXPBaWImR7e6PPcnvD3CI8BoBNhNTwipQHtt
X-Gm-Gg: ATEYQzxAiHjWcQKKG4TpL+nYdAK+9H1J93d2ifKH3YmB7R38M+Iw88dLDueveXW7mKG
	kXCtPt5m2NsVPo/iRrOu89IpIwO+IvA0ZSfk6XW2j7wqJtM2fIZmFBfne5Yy6Ow2j9yZSe7qsuR
	zw/NLuNTD9o8x2WfwVuDdigjMnauRlQ3/eyUVIds2ApDJBu0vpoE2qf89Wnlx4Z+o7K1Nmy9EpM
	E9RWbXtYsQddeLbmNjtOlZjq7Zbw1QInVnuXu5jGT1fSjDDihihpCLlhaTuVxFnhLMkMRKjB997
	0BKU/fKUCE22eiG3H0vZ05CkjsoKAgP6bdc7u4sC09E5byg5Iof+yQFQbEPT1fawO5/W66Hejlv
	4A2VCXrg86tVlz5mpZe1QovbWBsJPsbPOJ9brmDgiarA5wxGpwBMS5aM+vey6zU1KcYLIZfaf9D
	FJH7Zbytf763HBttx/EMLDW/mP/D4H7IPvKYwLVF5wAIZULczARaVRZqsPpcyDOVey6CJYqXFrh
	+QxF8s7hrR+TgVMo/RGP0nhJdjEuhYSCT/L27Gi5w==
X-Received: by 2002:a17:90b:3f44:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35dc6f0128amr3633041a91.20.1775060749484;
        Wed, 01 Apr 2026 09:25:49 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34eesm281813a91.2.2026.04.01.09.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:25:48 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: [PATCH 3/3] iio: accel: move adis16203 out of staging
Date: Wed,  1 Apr 2026 16:24:57 +0000
Message-ID: <20260401162458.88110-4-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adis16203 driver uses standard IIO channel interfaces, devm
managed APIs, and has no remaining code quality issues. Move it
from drivers/staging/iio/accel/ to drivers/iio/accel/ and remove
the now-empty staging accel directory.

Signed-off-by: Sheng Kun Chang <nothingchang@mirrorstack.ai>
---
 drivers/iio/accel/Kconfig                   | 12 ++++++++++++
 drivers/iio/accel/Makefile                  |  1 +
 drivers/{staging => }/iio/accel/adis16203.c |  0
 drivers/staging/iio/Kconfig                 |  1 -
 drivers/staging/iio/Makefile                |  1 -
 drivers/staging/iio/accel/Kconfig           | 19 -------------------
 drivers/staging/iio/accel/Makefile          |  6 ------
 7 files changed, 13 insertions(+), 27 deletions(-)
 rename drivers/{staging => }/iio/accel/adis16203.c (100%)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile

diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig
index 3d3f8d867..2d8abec49 100644
--- a/drivers/iio/accel/Kconfig
+++ b/drivers/iio/accel/Kconfig
@@ -18,6 +18,18 @@ config ADIS16201
 	  To compile this driver as a module, say M here: the module will
 	  be called adis16201.
 
+config ADIS16203
+	tristate "Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer"
+	depends on SPI
+	select IIO_ADIS_LIB
+	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
+	help
+	  Say Y here to build support for Analog Devices adis16203 Programmable
+	  360 Degrees Inclinometer.
+
+	  To compile this driver as a module, say M here: the module will
+	  be called adis16203.
+
 config ADIS16209
 	tristate "Analog Devices ADIS16209 Dual-Axis Digital Inclinometer and Accelerometer"
 	depends on SPI
diff --git a/drivers/iio/accel/Makefile b/drivers/iio/accel/Makefile
index fa440a859..eaf8ce443 100644
--- a/drivers/iio/accel/Makefile
+++ b/drivers/iio/accel/Makefile
@@ -5,6 +5,7 @@
 
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_ADIS16201) += adis16201.o
+obj-$(CONFIG_ADIS16203) += adis16203.o
 obj-$(CONFIG_ADIS16209) += adis16209.o
 obj-$(CONFIG_ADXL313) += adxl313_core.o
 obj-$(CONFIG_ADXL313_I2C) += adxl313_i2c.o
diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/iio/accel/adis16203.c
similarity index 100%
rename from drivers/staging/iio/accel/adis16203.c
rename to drivers/iio/accel/adis16203.c
diff --git a/drivers/staging/iio/Kconfig b/drivers/staging/iio/Kconfig
index a60631c1f..bf6addf29 100644
--- a/drivers/staging/iio/Kconfig
+++ b/drivers/staging/iio/Kconfig
@@ -5,7 +5,6 @@
 menu "IIO staging drivers"
 	depends on IIO
 
-source "drivers/staging/iio/accel/Kconfig"
 source "drivers/staging/iio/adc/Kconfig"
 source "drivers/staging/iio/addac/Kconfig"
 source "drivers/staging/iio/frequency/Kconfig"
diff --git a/drivers/staging/iio/Makefile b/drivers/staging/iio/Makefile
index 628583535..739e4cbf9 100644
--- a/drivers/staging/iio/Makefile
+++ b/drivers/staging/iio/Makefile
@@ -3,7 +3,6 @@
 # Makefile for the industrial I/O core.
 #
 
-obj-y += accel/
 obj-y += adc/
 obj-y += addac/
 obj-y += frequency/
diff --git a/drivers/staging/iio/accel/Kconfig b/drivers/staging/iio/accel/Kconfig
deleted file mode 100644
index cee51f64b..000000000
--- a/drivers/staging/iio/accel/Kconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Accelerometer drivers
-#
-menu "Accelerometers"
-
-config ADIS16203
-	tristate "Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer"
-	depends on SPI
-	select IIO_ADIS_LIB
-	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
-	help
-	  Say Y here to build support for Analog Devices adis16203 Programmable
-	  360 Degrees Inclinometer.
-
-	  To compile this driver as a module, say M here: the module will be
-	  called adis16203.
-
-endmenu
diff --git a/drivers/staging/iio/accel/Makefile b/drivers/staging/iio/accel/Makefile
deleted file mode 100644
index acac7bc9b..000000000
--- a/drivers/staging/iio/accel/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for industrial I/O accelerometer drivers
-#
-
-obj-$(CONFIG_ADIS16203) += adis16203.o
-- 
2.43.0

