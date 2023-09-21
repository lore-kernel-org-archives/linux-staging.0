Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2313199A0
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so14684885e9.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307457; x=1695912257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC6Tj/wZ71OdWmHfRNe2x49Rd8CoFCC05cRR7nhn858=;
        b=3SB69KKdxo4qUiBDANRZ7ANNiaxHAQ1XZqvBdw2VdPdc0UaOwpWbFBULlW2ZwJ87x7
         jgX8L6JNRatZnxQtjJKXMM4Oizac4WuGjsHDsiP8Nlo0t3Ro3yQos55Jy+lqHyCEoSYZ
         t4b9louScc4zlf8zqALhXuLgUwoYIwy0NSQ9XZl0G3CdSJkIsVcB92/VIEz8pJndP2AO
         zyYOq4UKJ2pQP85qhhZdctA66K1JFPxK+dKsARdq8F+UBxH3HD8/DH4mdZgzhmR4PQaU
         vqJpMmFYwQ3oZZwwskT+WPp+GJ2wUEe3LAzIYKDaYMxMCF0fDhS0rwzGBPNmy+0ocPNi
         0CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307457; x=1695912257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NC6Tj/wZ71OdWmHfRNe2x49Rd8CoFCC05cRR7nhn858=;
        b=IlbSAZWnzwCRWhG4nOFkTxCUj4K1sL8Px4m7b5UJDq6WSm1iVye2x62iMGz+UyKNtd
         phl3tMHd5RXk8kKoJttJR6/r3Z+8bW8tvlp/3RLvqxF7BEkGDMlr1bW6oZUoaGycBxF0
         wYMR30HD3fJsdVC3D4pn4KRpe0cWYWh1ffhwOcLS+mgcaErf1uFAAUJ6CtZ9OaUBDN9P
         1/6l3V32/RUMYS4UjwxFZu4DMfqwIrMGU3lCEz4976OMdB7egQMTwEj34bUeq2HNVlBJ
         Hiki5YD+ZwoIAd/U7GsmajvEnbNxqBCR3Yq+pkJTxnK7r792qj7XwP1EjPT/mQNVxgPX
         yg/g==
X-Gm-Message-State: AOJu0Yyx+yIGNuMIzYbybGAWPoi6gyUrg2oMtk6s2/XrmzT/U+iGH0ZP
	aWHW9N1AEa4FXSFushWhCut8uA==
X-Google-Smtp-Source: AGHT+IEeRgrsoxDfX29qrjpP91FiFRBv3vO2R0yidMQo5d2X1FKFBQlgvaBLgvFag4zdxsrc6bIIrA==
X-Received: by 2002:a05:600c:3789:b0:3fb:c075:b308 with SMTP id o9-20020a05600c378900b003fbc075b308mr4598503wmr.12.1695307457067;
        Thu, 21 Sep 2023 07:44:17 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 05/19] staging: iio: resolver: ad2s1210: fix probe
Date: Thu, 21 Sep 2023 09:43:46 -0500
Message-Id: <20230921144400.62380-6-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921144400.62380-1-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes a number of issues in the ad2s1210_probe() function:
- Move call to ad2s1210_setup_gpios() after `st->sdev = spi;`. This
  fixes use of this pointer before it is initialized.
- Check return value on ad2s1210_initial().
- Move devm_iio_device_register() to the end to avoid race of
  registering before fully initialized.
- Remove call to spi_setup(). Note: MODE_3 was incorrect, it should be
  MODE_1 but we can let the device tree select this.
- Change default value for fclkin. This is an external oscillator, not
  the SPI bus clock. (Will use device tree to get the correct value
  in a future patch. For now, using the eval board value.)
- Remove spi_set_drvdata().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 30 ++++++++++++-------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 0bdd5a30d45d..9c7f76114360 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -3,6 +3,7 @@
  * ad2s1210.c support for the ADI Resolver to Digital Converters: AD2S1210
  *
  * Copyright (c) 2010-2010 Analog Devices Inc.
+ * Copyright (C) 2023 BayLibre, SAS
  */
 #include <linux/types.h>
 #include <linux/mutex.h>
@@ -657,12 +658,8 @@ static int ad2s1210_probe(struct spi_device *spi)
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
 	if (!indio_dev)
 		return -ENOMEM;
-	st = iio_priv(indio_dev);
-	ret = ad2s1210_setup_gpios(st);
-	if (ret < 0)
-		return ret;
 
-	spi_set_drvdata(spi, indio_dev);
+	st = iio_priv(indio_dev);
 
 	mutex_init(&st->lock);
 	st->sdev = spi;
@@ -671,22 +668,25 @@ static int ad2s1210_probe(struct spi_device *spi)
 	st->resolution = 12;
 	st->fexcit = AD2S1210_DEF_EXCIT;
 
+	ret = ad2s1210_setup_clocks(st);
+	if (ret < 0)
+		return ret;
+
+	ret = ad2s1210_setup_gpios(st);
+	if (ret < 0)
+		return ret;
+
+	ret = ad2s1210_initial(st);
+	if (ret < 0)
+		return ret;
+
 	indio_dev->info = &ad2s1210_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = ad2s1210_channels;
 	indio_dev->num_channels = ARRAY_SIZE(ad2s1210_channels);
 	indio_dev->name = spi_get_device_id(spi)->name;
 
-	ret = devm_iio_device_register(&spi->dev, indio_dev);
-	if (ret)
-		return ret;
-
-	st->fclkin = spi->max_speed_hz;
-	spi->mode = SPI_MODE_3;
-	spi_setup(spi);
-	ad2s1210_initial(st);
-
-	return 0;
+	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
 static const struct of_device_id ad2s1210_of_match[] = {
-- 
2.34.1

