Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBFDB664
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-403012f276dso12485165e9.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307458; x=1695912258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xPn0fJb1G79vmQneRtFHd9riwOuPrJO1tNQT+KG0zw=;
        b=yD3GQReft8ct4ksAvg0/KC7ymYGzF7rtIWaewt22K3PEkRiXVeZxGY96Tah3KAaVhB
         N0SmXZgpekDunVZ7qGHwyvBfO+Az7FEPsHs5znGENecJhr1c3JQ8SpVfRPKnU53MaGf2
         1kwHWAIOFs0wTATcPmUYVu8iw1YfgtLEXqfzyTtwo08ndAk47H3WYedlyKl1/5oWvqkA
         Z5bpY13tiOX/DjynoQhdM7aXOiESyM0sjiBUYR41qxSjNKpcI/RnRDON7/2EhGBCCU9J
         g4lki3Ccqzpijcpbc2mqMtUWbjTfB/SsfT8AU5tCIaMnUe5t8o/HO4cGlUTTg34EjEnP
         G/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307458; x=1695912258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xPn0fJb1G79vmQneRtFHd9riwOuPrJO1tNQT+KG0zw=;
        b=FTd9Rp9iHUOwHgfX+5L/dqUC50IR/7/AKn6cXxcGZcqc905TdXCqLIE90QkKW1jyYY
         mQ1SVH1wJ9zrvL14UbTCjYqzBye+zFWGBteUAGSXLVwzs/X5CmrYgNuOqMeyS2e026iZ
         p3tusQHS80JrS2CfRwBdSYZNLuG2ZT23NDW4K4kPcO7kbbIKIhaJ6lzz2EyrZTIWTwYb
         i1I4UVVNL5Ol2xfr/34c0Vk+K7Qmr18WYwksxSfl2I8bZYZyPWIRnd/DzZ5DdupItNN7
         WfU0wbkPWhook6y/+OVqihtO1F6F+/VAlkBE+wOvqI/jqk0fCz8MuiMrbUgUls2X3cnm
         ttnw==
X-Gm-Message-State: AOJu0Ywn23J8+Ra2KA5IsGXNwLN4lXJvGS9Xo2xJfWPCoKN0XDWHJ0+1
	/URaVibcdX9t3Qgc09pgqXaQPA==
X-Google-Smtp-Source: AGHT+IH24xvDRaPHH44BwrDTbzdtwnxnkxTSk7+JyUWRFP+k6Au8hn9xlr4Gj5hf6z+Ngqc6nhucog==
X-Received: by 2002:a7b:c859:0:b0:402:95a0:b2ae with SMTP id c25-20020a7bc859000000b0040295a0b2aemr4971411wml.32.1695307458717;
        Thu, 21 Sep 2023 07:44:18 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:18 -0700 (PDT)
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
Subject: [PATCH v2 07/19] staging: iio: resolver: ad2s1210: implement IIO_CHAN_INFO_SCALE
Date: Thu, 21 Sep 2023 09:43:48 -0500
Message-Id: <20230921144400.62380-8-dlechner@baylibre.com>
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

This adds an implementation of IIO_CHAN_INFO_SCALE to the ad2s1210
resolver driver. This allows userspace to get the scale factor for the
raw values.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 107 ++++++++++++++++--------
 1 file changed, 72 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 985b8fecd65a..95d43b241a75 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -458,56 +458,91 @@ static ssize_t ad2s1210_store_reg(struct device *dev,
 	return ret < 0 ? ret : len;
 }
 
+static const int ad2s1210_velocity_scale[] = {
+	17089132, /* 8.192MHz / (2*pi * 2500 / 2^15) */
+	42722830, /* 8.192MHz / (2*pi * 1000 / 2^15) */
+	85445659, /* 8.192MHz / (2*pi * 500 / 2^15) */
+	341782638, /* 8.192MHz / (2*pi * 125 / 2^15) */
+};
+
 static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 			     struct iio_chan_spec const *chan,
 			     int *val,
 			     int *val2,
-			     long m)
+			     long mask)
 {
 	struct ad2s1210_state *st = iio_priv(indio_dev);
 	int ret = 0;
 
-	mutex_lock(&st->lock);
-	gpiod_set_value(st->gpios[AD2S1210_SAMPLE], 0);
-	/* delay (6 * tck + 20) nano seconds */
-	udelay(1);
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		mutex_lock(&st->lock);
+		gpiod_set_value(st->gpios[AD2S1210_SAMPLE], 0);
+		/* delay (6 * tck + 20) nano seconds */
+		udelay(1);
+
+		switch (chan->type) {
+		case IIO_ANGL:
+			ad2s1210_set_mode(MOD_POS, st);
+			break;
+		case IIO_ANGL_VEL:
+			ad2s1210_set_mode(MOD_VEL, st);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		if (ret < 0)
+			goto error_info_raw;
+		ret = spi_read(st->sdev, st->rx, 2);
+		if (ret < 0)
+			goto error_info_raw;
+
+		switch (chan->type) {
+		case IIO_ANGL:
+			*val = be16_to_cpup((__be16 *)st->rx);
+			ret = IIO_VAL_INT;
+			break;
+		case IIO_ANGL_VEL:
+			*val = (s16)be16_to_cpup((__be16 *)st->rx);
+			ret = IIO_VAL_INT;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
 
-	switch (chan->type) {
-	case IIO_ANGL:
-		ad2s1210_set_mode(MOD_POS, st);
-		break;
-	case IIO_ANGL_VEL:
-		ad2s1210_set_mode(MOD_VEL, st);
-		break;
-	default:
-		ret = -EINVAL;
+error_info_raw:
+		gpiod_set_value(st->gpios[AD2S1210_SAMPLE], 1);
+		/* delay (2 * tck + 20) nano seconds */
+		udelay(1);
+		mutex_unlock(&st->lock);
 		break;
-	}
-	if (ret < 0)
-		goto error_ret;
-	ret = spi_read(st->sdev, st->rx, 2);
-	if (ret < 0)
-		goto error_ret;
 
-	switch (chan->type) {
-	case IIO_ANGL:
-		*val = be16_to_cpup((__be16 *)st->rx);
-		ret = IIO_VAL_INT;
-		break;
-	case IIO_ANGL_VEL:
-		*val = (s16)be16_to_cpup((__be16 *)st->rx);
-		ret = IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		switch (chan->type) {
+		case IIO_ANGL:
+			/* approx 0.3 arc min converted to radians */
+			*val = 0;
+			*val2 = 95874;
+			ret = IIO_VAL_INT_PLUS_NANO;
+			break;
+		case IIO_ANGL_VEL:
+			*val = st->fclkin;
+			*val2 = ad2s1210_velocity_scale[st->resolution];
+			ret = IIO_VAL_FRACTIONAL;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
 		break;
+
 	default:
 		ret = -EINVAL;
 		break;
 	}
 
-error_ret:
-	gpiod_set_value(st->gpios[AD2S1210_SAMPLE], 1);
-	/* delay (2 * tck + 20) nano seconds */
-	udelay(1);
-	mutex_unlock(&st->lock);
 	return ret;
 }
 
@@ -549,12 +584,14 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.type = IIO_ANGL,
 		.indexed = 1,
 		.channel = 0,
-		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
 	}, {
 		.type = IIO_ANGL_VEL,
 		.indexed = 1,
 		.channel = 0,
-		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+				      BIT(IIO_CHAN_INFO_SCALE),
 	}
 };
 
-- 
2.34.1

