Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672336F42D
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459225; cv=none; b=nVonIpgWcLuDOG6Zu1d6OudAGcfArKN9UAq5S2MfJIJ7RiY2YGmD3y5aro6kL2bcUoK5AkmyYfcUw9Qdn7w5YA40TIrRulgd9w9nftYAqg05Ecc4nJ5OGsbktB3CgOFbxKbn/DkLAAqQbi+ff+ODH6tjfwJWnbEgD91qsmrBV04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459225; c=relaxed/simple;
	bh=WWVcE57q2ujxsqolRC6ZoeQXUL6FEoBX5JlOVLcjvtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O95bfw0eSuR9alMG+UwF48GpygzvNFq4ZizA/QHWziog7sHdZ0T1CElWl/8eDLnggJuod7nrQppD48kNFkpY+E/1Aaqec9n3XQjvLo/crJUL5dhk0cQA/gMokV3VRrgFBgQNbGisM0IwAuNAMc0G23bo35WGnp3zu+uFC+zQRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNrES98Q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNrES98Q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so15427105e9.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459223; x=1790064023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXRYdo/Nw5o2tKXlPYpP0Bk1aAxSCNWraHSi1/LMRzI=;
        b=XNrES98Q+wV9Fcd7At4r9MvV8U7mg/Ug0+wXNxjEVhaYdFbD/mI/kdYfNK2YQCdJqy
         jablzaSb/2rKUVGTo1E+wWJh7qvt1LLEcB97QaUisPy22a7Tgvy94XtKoOAaCNJQPoVz
         mp9Ghiaam25w5pHIfop/kHeGpMOqyARLYcHfkZNk+KKV4D1bhlQ7O1fLztwdq0vfJNx5
         aUgkNBJ2gQYKIbzE+frgiykBYWLKfUyIexoGG84cAAf5mdrSHFFStmaJZmZauDLBz5Lx
         llqseE91UNSplDGXiDv/6tdec043kk1er3YQbJU0dvBvKuVl8iD2edXOwCs+2350u5Xx
         ABzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459223; x=1790064023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXRYdo/Nw5o2tKXlPYpP0Bk1aAxSCNWraHSi1/LMRzI=;
        b=a774NgqM+7XUo0vLqcHfwimjeOvY/5eohQw2engep2bx+2HN9Eh/irBPKmjC4TnChf
         fLmtTRQQLgqFtR6VcbVpoHxDyAkqKFDq+CW5CvAz5BKr9MD7nGkcfPedL/ATeVvKuXW6
         MYEOdS05u0FVtQtLSUYY1cfZTwdTZpMKIaCriZfhQ8NZR1g9/WS58PKSdE6hc4ecdBT5
         dZ+Blr6hQUXsHiSqV4PJLf0WhYWxSGH9AngDkfpGzJLw+nAGcKfzSWYsCJJNesOOHjvZ
         nEmYLre7jqUD/wtkdAIjhkrx63Djr0iBT6H2pFiWKqPVwi8q6JEKJ/Gh1YrsyxqOc09b
         uzvA==
X-Forwarded-Encrypted: i=1; AKwUvByR6YpuRKOTBLquL9tB43uvWjo0Oub6Wy+X1jCSiLlyfh00hwM8dB5mHcGHbKDgCXXGXaHTsznJz8tgBHEA@lists.linux.dev
X-Gm-Message-State: AFuF++kZ8njbo1YUmoA+4WrIq79crzsZrEPjTLh08aCmjuwtwRYL8RG+
	8NoazQ9J671HjJPLFz7jhCVeiHny+j+3lwFvvoF1Ha8xDuNogeBHkMCQ
X-Gm-Gg: AYBFou2c9ry/rM1ktR6NenAMSPPv8v8tCFtpwEpD9pbYD/wYXp3ZnOlOZ6F1cwmIv0L
	ALVlV9g0q8Y/hx301DePZHE2HbXxtoAnS95rk2CKBU90arRLgXPIYe+2zHboHvsVm+Mt4ZPwBXt
	eZ90sILms8wRcEPBVgSS622Sb7ppxHQR/GV/xG+ef/YbP03rb0hYCHVi5YZjSyqgG72gFtC8yjq
	A6uCwbzxLLyirocdh2bHZWBXKuBHk8umPPE9rAOQ+N8Xflyx/zC+GHWQwoUgCpTYmDr5dUhA0EU
	Fz+QHBGmZICDQEc0dpt0e7QeDbfgQ58Uu4r9gvpt9I8YftAT29w9nCtA8+AmjTqdnpt/bWgSbRF
	hsIhnL780X05zD5hD3kM8aje3C0nH8E44DohBc7d0y9r/4KISjt0yLk5HS9bMaUkVRhGEQ1F7SE
	r06gy05BhVHYvXh9EQBen3XCX0z/Eg5DMtXOPrZMMAshz0yGxtF0eqdpYKbw15ITqTlnOM/IE7+
	OaKZWt6IU58o2UKKRouEhzcGyfSaw==
X-Received: by 2002:a05:600c:8716:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e7a657f9dmr165235115e9.2.1789459221055;
        Tue, 15 Sep 2026 01:00:21 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:20 -0700 (PDT)
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
Subject: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI operations
Date: Tue, 15 Sep 2026 10:59:38 +0300
Message-ID: <20260915075939.18180-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816_spi_read() and ad7816_spi_write() functions perform a
sequence of GPIO state changes followed by an SPI transfer. If multiple
operations occur simultaneously, the GPIO state could be changed by one
thread while another is in the middle of a transfer, leading to a race
condition.

Introduce a mutex to serialize the operations, ensuring that the GPIO
toggling and the SPI transfer are treated as a single atomic operation.
The mutex is placed right after the pointers in the device state
structure to avoid padding holes.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 9e43ce83e071..c18093ca8a82 100644
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
@@ -47,6 +49,7 @@ struct ad7816_chip_info {
 	struct gpio_desc *rdwr_pin;
 	struct gpio_desc *convert_pin;
 	struct gpio_desc *busy_pin;
+	struct mutex lock; /* protect device state during SPI transfers */
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
@@ -67,6 +70,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	int ret;
 	__be16 buf;
 
+	guard(mutex)(&chip->lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
@@ -107,6 +112,8 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
 
+	guard(mutex)(&chip->lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &data, sizeof(data));
@@ -360,6 +367,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
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

