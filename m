Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F2634CFBA
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477421; cv=none; b=m5ixVm8lA/1VqCTsA79uKE9NfInzTPl0nzoNmceO69uoncGvc2fGxk2IFLEz1FaUiZ7wilMOtHEaoHisTd48XOqxXUjFrcR52ho1xBFaWojT3A7zwu3gqe7JgrfWkibOQRlTrPRmaheu3MyzAAMRNBVFKa7NfUsM5crdd4vuLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477421; c=relaxed/simple;
	bh=vtlyrLm0TvkUPo2wg/R/JazT+XqsbQ1jNn4MsZdjIzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uyLsZq1cQEBjAxBR4XtBWpocikoDuAiQvYMXORx/vYp7zX71o2IMBUEnt55BAdc2jrAabYKcvjaQBatTXi0mjZamU3gJ442j2ca6dyb/JRGsHSMkHOos5xHDukFO7FiOWCGkSAvTaNE5ejIscq97znLzIBraLILASFMgV+VydWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaiKb/qx; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaiKb/qx"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa65757ef4so462427e87.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 02:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780477419; x=1781082219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uh1b+mJpQbr3+CkGJCunycJWNSs6fDOpmRP1WL4Ja5Y=;
        b=BaiKb/qxoy3iGiUeGGcffO7w0rlpeZbZ16XxjVgV4KYxpICKAci4eKAqDXPgU+s29W
         uc3RospypXh1toRTqBCT5z+0jkN6S3tKxP83/6NJItiJHUfYW35Ej7EkBIaC7G1SLX6+
         NK8YBnsNTBFlU19zSJ2jZSiJ/bhkZMmwcsi8Dzit6quu8s39x0Jx5r4f+GSoWNgAbWzm
         6u1CcApBtTGB8zek0YTjPM74YffcItplmYw1YFAgdPYbwQTXgB14VSHZz5OnNB+Aorpx
         o28O6irjh5ukfLCPiVj21a5rQSdMwEy68K9i24jJCUWbGqn40fgjxXwBPagvotuafgrM
         AO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477419; x=1781082219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uh1b+mJpQbr3+CkGJCunycJWNSs6fDOpmRP1WL4Ja5Y=;
        b=hW+2RD0VuvLInbKvHYIqfdgo5R2X5o4vm41DysMJfnp+pERbWe9HdzlwFofCfCdbUB
         apMhbq7buljl7CD+NNXFuT/zbDJwd524SUT53OQnarXZyex+Uky310udLopAM3Jgizq8
         b0nyEdlYoJ7GHM8RX6/PCuEutXSWH8BMLTM+CgFMrxw4c/ube0FOCbjsWiUwGtiID33Y
         RSY/2f0rMfoS867p2GBQAT1Me3xqlopRueoq659tfwvwnk1f+aJk92ev5HD+qzQSy67j
         qEKIaBwCJXal5zdynUULxHupiE+OnZNgFDDbCzOKQwGnUBOw98uzaNJXvqN8KMEcZYnf
         zb0w==
X-Forwarded-Encrypted: i=1; AFNElJ+ShALVMOQ1AcsKvZeCd3lqfkFuwTZnL+I85kZhFk8vMzXvTJyzeybqh5XtqLULCVSSRt4wiKA7VeUDAAKg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9VNpSpxJP6WOU7qlrnZvYGeg4cYvdkdgpmTJRgHn7DbOvppLE
	8LNqQvIGJU5i5y0zbaqXtSx1VvZpdj31YLWW2jrIOGswvzHpU33yI4Sx
X-Gm-Gg: Acq92OFN5HhgWg1B8yXHQIIzkE1ATLIARZvWNI7QwAmvJhSuoDhinW5faSFWUJWP1rF
	g4cUKykzoUnWQM7rOzgqAQvaEz+PSehrpJpfi7lr8HuZumpiZDPv3IfJCoLpEel4qIHkUVZzA3I
	hcqUXSNthT4DDZl2CC47vBoC5YCuox4V+v1bJlLX2QCBMh5R1+OS6MhRvrIDD+Vo/Wc+ID91DD+
	weAdAtpN75rfizWM2fJ7gOxkCdecMRltlyWaPCeI3Z4cBkaTQQzwzjX89xlwakL5fcMCFxhDWyy
	tvgJ+ZwqmsdSY1q+KrPyN37iTrwSDgzvwDyjsJpHwcOMC6GJ+z7GOEcpx8uoFBTBw0wiRiemlFy
	hPDjbRhDBkeSW/ISc41egASgVS1kTi5H4diyWlZWlXQDK1HZ9b1mwXYmHCykq7Ym5I5bkB0p/w+
	4rLwcVSrgFC7Mgf45zjwR/4h0Utb6AWd5SZHU0ycINBM++lA==
X-Received: by 2002:a05:6512:3d19:b0:5aa:6232:576c with SMTP id 2adb3069b0e04-5aa7bf48994mr353921e87.6.1780477417014;
        Wed, 03 Jun 2026 02:03:37 -0700 (PDT)
Received: from localhost ([5.124.46.112])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9862fesm517686e87.57.2026.06.03.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:03:36 -0700 (PDT)
From: Taha Narimani <tahanarimani3443@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Taha Narimani <tahanarimani3443@gmail.com>
Subject: [PATCH v2] staging: iio: adc: ad7816: Use devm_gpiod_get_optional() for busy GPIO
Date: Wed,  3 Jun 2026 12:33:33 +0000
Message-ID: <20260603123333.5608-1-tahanarimani3443@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently utilizes devm_gpiod_get() for the 'busy' line,
which makes the GPIO mandatory. However, the busy pin is hardware-optional
depending on the specific board configuration.

Switch to devm_gpiod_get_optional() to allow boards that do not have
this pin wired up to still probe the driver successfully, and remove
the redundant conditional chip-ID check since the optional API handles
missing descriptors gracefully.

Signed-off-by: Taha Narimani <tahanarimani3443@gmail.com>
---
Changes in v2:
  - Fixed trailing whitespace and missing newline at the end of the file.
  - Converted the file format to Unix (LF) to remove carriage returns.
  - Removed the explicit chip-ID check around the busy pin logic.
  - Improved the commit message to provide clear architectural justification.

 drivers/staging/iio/adc/ad7816.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0eac484..039b34d 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -84,7 +84,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 		gpiod_set_value(chip->convert_pin, 1);
 	}
 
-	if (chip->id == ID_AD7817) {
+	if (chip->busy_pin) {
 		while (gpiod_get_value(chip->busy_pin))
 			cpu_relax();
 	}
@@ -380,15 +380,14 @@ static int ad7816_probe(struct spi_device *spi_dev)
 			ret);
 		return ret;
 	}
-	if (chip->id == ID_AD7817) {
-		chip->busy_pin = devm_gpiod_get(&spi_dev->dev, "busy",
-						GPIOD_IN);
-		if (IS_ERR(chip->busy_pin)) {
-			ret = PTR_ERR(chip->busy_pin);
-			dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
-				ret);
-			return ret;
-		}
+
+	chip->busy_pin = devm_gpiod_get_optional(&spi_dev->dev, "busy",
+						 GPIOD_IN);
+	if (IS_ERR(chip->busy_pin)) {
+		ret = PTR_ERR(chip->busy_pin);
+		dev_err(&spi_dev->dev, "Failed to request busy GPIO: %d\n",
+			ret);
+		return ret;
 	}
 
 	indio_dev->name = spi_get_device_id(spi_dev)->name;
-- 
2.53.0

