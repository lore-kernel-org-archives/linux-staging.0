Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3A443C05
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125044; cv=none; b=cBAWXLxyXEqkut7PI8eGs7Jm94lZhhI5/vmeaff+iBKqgHCNEPPRneSimcS5avXqakMo2dgAxBZy6QvSIvELbWJImc62m+XllK6B7quJSoG2Hp9b3KM2HK9nIFIegAvewbA1h/DFvJFzhXgpmEztzQo1SmqLxpe66TBUmMm2gLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125044; c=relaxed/simple;
	bh=nkt9eX0UhBpFnXXxyb40A2jA3fGy9p1WHRIW/5hqH4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKZLRqkX2D4rJXc5+NbS0UXAmOHLuCnk4HxQPuGjLgvffGyjaeBEJY7PnLfCcOvPYMxQ2BXUyIpMIPoD+Y1WfXQARZ0plzlLckPYAr55N2dZFoagLVuI23U9x7nG/7v82xSgdA8X9eWtcP4IStluwG20hqvT7FHZA3vDv8xq11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW53rojM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW53rojM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so6475295e9.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125034; x=1789729834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buEE5TDzC5FsioP8qx8e+5Y4xF8w0Ds3BqUa5qHn1HE=;
        b=EW53rojMqC/HPm67SA2X0qDyQwALnesugkfc+WNJP3ZitHFqgOAnOl+uaksFDiJwtF
         XVVB36k/6tKvN4R3NLBb820KSsGKRfmSwmsqE0CEHpJSaxnh689Hn8eqV6crjmYEnDoP
         em99huT0aj6sfBMatPIW8NCSAh8b6cOKDGxTnDvDsLa4y8oReRKmHdspm8IopEc0xGxk
         jbqlHvXIBQIAgxRUeh9iIqsRL5ArMzmN2E7GJgQHzEJnCFwu7uOCMc69Z3oTzKqlL9kF
         RJBArgl29KJ2LsgHaxjR3OPJ4+0eqTBfdEmnHuBVYH0QnRNLcyYnVlBWY8JGw5f0xDrH
         sCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125034; x=1789729834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buEE5TDzC5FsioP8qx8e+5Y4xF8w0Ds3BqUa5qHn1HE=;
        b=VhTR8+bWMcHoSBMn15HZVLw0F00WT+FhUxmIxQ8t+M50xT4qVCNq+ad8syFIUsKIXb
         ZuYwfDi43V3ogYdEpj4CKe6ae0eErtKqfV77sJyFJ+XwpO8LY99jPAW5RUWSNn/BTCOJ
         MLqfxPkpM5EqjWWoUt7061P53snJVsECoEmgppjaLdJXWe5QsGN0JzXVbn864yiUwAaI
         3N0CDa6Xp8j23y7UgtoBxLDMAbLPk/yYqehzOeBt2d3UrSNYu1I/a3KPYFuK582oCbcM
         Co/g1lu2MN6HFx7d+wFDCrNs0IbFouWg6rmi2+KV1MgzofWNg9Ywgsnpa92MpQ9Knslw
         /bUw==
X-Forwarded-Encrypted: i=1; AKwUvBwSz37NH/jBzWbF80d57BAqiLJSZiO/U92raVZF2K1YJaI2RD/UFYggM5O5x0FxLZesNO5eycLTS8FnT994@lists.linux.dev
X-Gm-Message-State: AFuF++mLCUED/pAl2Nw/KdDNDwGzd9X9O3MdKX0OjGZiMeRS7F9n7NFF
	NofzQ2Zaaris3oRz5tD71v4g0sOGepN/LJVD4e+WTyGcheri8DcMDFQm
X-Gm-Gg: AYBFou1UHcK9vXfHjnVJctnGwIeFZDNpF5C0nLqx6Q79C4E7ichU0qBk/YTNAnqkhy1
	mB2MhvDoeYrpmk4DGyKsY3dak1KK/bFtvD80uiIs95axsbEOcF/bUmrwHCLhqr6totXFgBibQYE
	NN836EwQvJaJHBl62cTm36S3LLAbfMpH1/cJa6ykUXteNNLsCNrDb98rt3aPAEi/9rbk5T6EiU5
	bw+pWpGxobzGXruRJFLc8Z5hLrkRPYdlO1LpPru4VCZZ/8dm7i3O7YW+7OLjqOkNYCy42wgZLxb
	d7We43XzHjywJj+zYeM1+2DH4CfsEoHSwEicT/6K7wSjFpHn5LlV/k7B4tj5Ud4PmUU+V+5LLUS
	Ak79UYYnuwh0DEKQmyMS/GncQB737Qp2nzXCimTeAby9iMaRTFzIro5cM1jIyskwghuNRWx5gr7
	N/G8poRWqiuyLOaLcbMzPyL1+hTNAqlDf/ZpeOV7FytlkDmUSAUFZF512kIT9GdO3+s8yw3b+Tg
	76Cm+G4mJGGz46aOtI=
X-Received: by 2002:a05:600c:354a:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49e61a005b6mr41951185e9.30.1789125034386;
        Fri, 11 Sep 2026 04:10:34 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm66109065e9.8.2026.09.11.04.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:10:33 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 1/2] staging: iio: adc: ad7816: Serialize SPI read operations
Date: Fri, 11 Sep 2026 14:04:55 +0300
Message-ID: <20260911110456.24873-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816_spi_read() function performs a sequence of GPIO state
changes followed by an SPI transfer. If multiple read operations
occur simultaneously, the GPIO state could be changed by one thread
while another is in the middle of a read. This leads to a race
condition where the sensor state is disrupted, resulting in corrupted
data being read.

Introduce a mutex to serialize the read sequence, ensuring that the
GPIO toggling and the SPI transfer are treated as a single atomic
operation.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0e32a2295990..d0355763aa8f 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,15 +5,17 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
-#include <linux/gpio/consumer.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/sysfs.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -50,6 +52,7 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+	struct mutex lock; /* protect device state during SPI transfers */
 };
 
 enum ad7816_type {
@@ -67,6 +70,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	int ret;
 	__be16 buf;
 
+	guard(mutex)(&chip->lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
@@ -91,7 +96,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
+	ret = spi_read(spi_dev, &buf, sizeof(buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
@@ -360,6 +365,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
 
+	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
+	if (ret)
+		return ret;
+
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
-- 
2.54.0

