Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA7E47D931
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219563; cv=none; b=UxTBC7En1hNOrCk7gfoKXQ9fkf//GKIcWhepIgTaxQ5OgOoFda4+3QN+bwYSkl/fX6bd6S3//W9Dk0C8w3tGyIdVFl6DJL4qVxsQkr/ZrI4F3hFVOWTef94GOm0wlRr1Enb42WKCX2WS82z74pJ/BNTYQ4paRlZrfZTh2+JbW5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219563; c=relaxed/simple;
	bh=B82+6jWVF+uGKYVaZQYTIbzC69mj2Z9dpEdSNIoCiio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+fPrh15VJzxV79uWZp6WPMdHCiQMcdjsDLKJMglm4XtNAlBe3FasRWNRGfU3MlJsd7eQx2+aJw2b6VNTifrvhg4c2b7BN0GYsGQkchnqv/2P01/eBuuUXkzx0B1iffVPeB9PE18nL1VUU0UsA305PVb47XeLK8XN+15TX5mGBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su1TlGtH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su1TlGtH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so212483f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219560; x=1789824360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQ4thKSalDZM2rC8wC0NqTstNC8+R0mxz6pCgagXex4=;
        b=Su1TlGtHJmLErjlOnXojjZ/7Mbe6etlFhUN1vwSNhub5VQRqJeuu9bfXzRXA6aFqay
         IubQBp5uYRu0zpwaTodkS0C0WjgvSi8EmCYPW0TCIW3n5VGPIMndWcW0imiJQ0/GlVjq
         M5zZ6KLyRoIr/oyZZ3KcAPZzwsi1SzHL5+ymYqmilMRZmrhRJ+Dw54Fu4d68un4FXx8U
         Wh0NWp8P78EbQSe/MbAewRGzj92UfH4v8lZhkVgEd4pN0AyQsc0whfVq1ToebPdL5pIc
         mqh943ePVNkFiJNH/fnDhl1VPLgJ/8tsLHZObMAKiPcIqwRP0u3E5D3MZ1xyffUntpwV
         spqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219560; x=1789824360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQ4thKSalDZM2rC8wC0NqTstNC8+R0mxz6pCgagXex4=;
        b=gvhXgDZ0uobR9RILDVz8Ya9XGUx13672ClIotdsdvK+d+blrP8KSkEtGzqmv9X6H5u
         aQulI1lwIKsyhYxzOn5GJXT60Ekce6oLb/OLQMUSGrLgaIteF+Lj9RanHZnRRH2nD3xo
         dQSrzFqv/DXFrzXHm1aAuzjIukgpsHrreA4tEl2gY02i/Xy+Znv/F9DhF2Bk1rTB5Mie
         SJOgB7ZDfNha2oB49aNPIIElkE/hBOa6QIaHAUAPmwYrWzcxzSdaPjhjSmYvECuPOgWd
         +gXF9ews98oc2ak9W7VXCMH7w6OOXb8TvVB5qNxGBO7DmCeJhNQMBVi+F2STV+wgiiX0
         msyg==
X-Forwarded-Encrypted: i=1; AKwUvBzzNYYqAzzGKeqJdcoc7rkf08KoJsKf/HEI1+7ccUYpe8oEakpo1V6T4Onw545uefV9s7aammsRWusKJIoZ@lists.linux.dev
X-Gm-Message-State: AFuF++l2qSgFYsoCYOdZZTKj1eX8KNrcRZa3OkCocqnKtJla+CrxYUOF
	tCmYGDsl2djlG+gyZCzej1A6HeQmhXPMb8T+Hp200l/oOYUGjia1+f8P
X-Gm-Gg: AYBFou3GnP6zBXOlQpgh1KqiOBGmgHEzRMSKMUzWy6dG10K+lr24zZfX2oH/Et4iPG7
	g9YZO4HAoibF1S/Cp2QisUJZsYAGVNdlG81ag6J3n1X16gY6gTagmNThZ/bwHyh0jCo4qPl3I75
	NWMkRmAvsjNC99HhPTFFcC30Xm2zV4ty/2FTxSSeFKxjlEYgKthpRU/5kN4tmnOLe5jKpxCZrV7
	3tT3rOR3a1aB3vuNOzrswECQiuNB2/M06AjeBxEctBJdRjdNTHgLRkrW6LUkOQudHK9YQv/amsd
	JoGTitwCGoI6OWH3KpPbg5EPrXR1WDKW1tzdePS4CDbJW/9kpK8XnwDHDNLO1XCgQDdXNF7hYEf
	mMKDS3sjdSmSNwT9qMiR26aKA8XsJqDmJEG9ttvkJMZ/ZYfto7I7nI5boYJAmkloQfMzAPcNxJs
	aWck3oraBneP4Ec7hWHtDWaK+xIf1wBpaf8OPxjKb8qJL6OMct/+Mpxs+Jff6h3WNg6GdjHX1Qa
	I6Tp/kNtTF6BEkm7w==
X-Received: by 2002:a05:6000:5c8:b0:486:f301:1144 with SMTP id ffacd0b85a97d-486f6beaa59mr2718066f8f.2.1789219560279;
        Sat, 12 Sep 2026 06:26:00 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:25:59 -0700 (PDT)
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
Subject: [PATCH v6 2/3] staging: iio: adc: ad7816: Serialize SPI read operations
Date: Sat, 12 Sep 2026 16:25:16 +0300
Message-ID: <20260912132517.55686-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
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
condition where the sensor state is disrupted.

Introduce a mutex to serialize the read sequence, ensuring that the
GPIO toggling and the SPI transfer are treated as a single atomic
operation.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 9e43ce83e071..acf26c5a267a 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,12 +5,14 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
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

