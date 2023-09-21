Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A735BA26
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso996342f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306164; x=1695910964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZybWEnlutF3BnUcq+xH7uoi35RICanW/277eMaA8Sc=;
        b=FarlNSVL3FTbPF8yfAyNfll++R3G8tGrIV3TkL9i0GNg4lrbamInMaeN/tJcgi9FR1
         ri1j1XFBsrldAf+t8nuQpZTM66jjgRj9pjwZkk1YKdOm1nwHZrQlSBqxFIHIMo9X1cm2
         NEBFNuCTWYNaV90SRbjTE1/5Gmg8ix8Cn+0DeEoHypUdg6zhGN2+26BsdZhqG0oD2IkV
         c3Yd5jSkJR0LAVFCmuz+erz+K8TgyuSFUdoY/UF6Ari9jTNrI3fUuuT2aeKHsoQlZS7k
         wcfE/sRcQIgHpM2krRxyiC8PCpoctE/yNzxJ3JV7DGmnwnUje8+jewEwIXqyS2ibXI6o
         0VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306164; x=1695910964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZybWEnlutF3BnUcq+xH7uoi35RICanW/277eMaA8Sc=;
        b=bgGKcry2H4gDFy6G+PYOrN/sGZbQhCDdVFv3NpFfrnYDZ0/7Z69xQpKcAnGBJGxKrU
         6txr2OEDlmLzubykoyEiHAyd0f6el2vWa6T8j+dAsEuQekWusSvrqJlJlnOc8xhe8XdB
         3R5TsA3TtDBwKCoKIvA6QaPqdUGz20dCzyRBLAisRI2td6o4/3AqAW6aFWqV4gz8t/k7
         2SJvSQCO+di5ziIr5ISA6J4EWygvOfgMoWfV3/j5/cD+hbjZdznQxHTMFo8ns9q7JtPL
         ReFIjaLyTIal/IypZW2zYKAMIMGbOLyBRiIuU9DPHRK8l5jus9IPdYKnqgfVQvC74oZj
         befg==
X-Gm-Message-State: AOJu0Yw14yuhNJKeDhpOOkWIqoR49AnDFo4aLAQeilPO5ki6Z6j4ZPmO
	fLt4/uTX3eSORao3oC3ZMwh9Qw==
X-Google-Smtp-Source: AGHT+IEc+ToK/YlPl4OhhuhcmW2i+TTG/k1yEvY4gVlKSX7pGRedYf1SANoITpOQbOK/u1re+CP3BA==
X-Received: by 2002:adf:f68c:0:b0:320:b1b:86a9 with SMTP id v12-20020adff68c000000b003200b1b86a9mr5129294wrp.24.1695306163828;
        Thu, 21 Sep 2023 07:22:43 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:43 -0700 (PDT)
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
Subject: [v2 13/19] staging: iio: resolver: ad2s1210: implement hysteresis as channel attr
Date: Thu, 21 Sep 2023 09:19:41 -0500
Message-Id: <20230921141947.57784-16-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921141947.57784-1-dlechner@baylibre.com>
References: <20230921141947.57784-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AD2S1210 resolver has a hysteresis feature that can be used to
prevent flicker in the LSB of the position register. This can be either
enabled or disabled. Disabling hysteresis is useful for increasing
precision by oversampling.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 88 ++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 7a1069d948eb..fe413759deb9 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -80,7 +80,6 @@ struct ad2s1210_state {
 	/** The external oscillator frequency in Hz. */
 	unsigned long fclkin;
 	unsigned int fexcit;
-	bool hysteresis;
 	u8 resolution;
 	u8 rx[2] __aligned(IIO_DMA_MINALIGN);
 	u8 tx[2];
@@ -456,6 +455,27 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 		}
 		break;
 
+	case IIO_CHAN_INFO_HYSTERESIS:
+		switch (chan->type) {
+		case IIO_ANGL:
+			mutex_lock(&st->lock);
+			ret = regmap_test_bits(st->regmap, AD2S1210_REG_CONTROL,
+					       AD2S1210_ENABLE_HYSTERESIS);
+			if (ret < 0)
+				goto error_info_hysteresis;
+
+			*val = !!ret;
+			ret = IIO_VAL_INT;
+
+error_info_hysteresis:
+			mutex_unlock(&st->lock);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -464,6 +484,64 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 	return ret;
 }
 
+static int ad2s1210_read_avail(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       const int **vals, int *type,
+			       int *length, long mask)
+{
+	static const int available[] = { 0, 1 };
+	int ret = -EINVAL;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_HYSTERESIS:
+		switch (chan->type) {
+		case IIO_ANGL:
+			*vals = available;
+			*type = IIO_VAL_INT;
+			*length = ARRAY_SIZE(available);
+			ret = IIO_AVAIL_LIST;
+			break;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int ad2s1210_write_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      int val, int val2, long mask)
+{
+	struct ad2s1210_state *st = iio_priv(indio_dev);
+	int ret = -EINVAL;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_HYSTERESIS:
+		switch (chan->type) {
+		case IIO_ANGL:
+			mutex_lock(&st->lock);
+			ret = regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
+						 AD2S1210_ENABLE_HYSTERESIS,
+						 val ? AD2S1210_ENABLE_HYSTERESIS
+						     : 0);
+			mutex_unlock(&st->lock);
+			break;
+
+		default:
+			break;
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static IIO_DEVICE_ATTR(fexcit, 0644,
 		       ad2s1210_show_fexcit,	ad2s1210_store_fexcit, 0);
 static IIO_DEVICE_ATTR(bits, 0644,
@@ -499,7 +577,10 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.indexed = 1,
 		.channel = 0,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
-				      BIT(IIO_CHAN_INFO_SCALE),
+				      BIT(IIO_CHAN_INFO_SCALE) |
+				      BIT(IIO_CHAN_INFO_HYSTERESIS),
+		.info_mask_separate_available =
+					BIT(IIO_CHAN_INFO_HYSTERESIS),
 	}, {
 		.type = IIO_ANGL_VEL,
 		.indexed = 1,
@@ -573,6 +654,8 @@ static int ad2s1210_debugfs_reg_access(struct iio_dev *indio_dev,
 
 static const struct iio_info ad2s1210_info = {
 	.read_raw = ad2s1210_read_raw,
+	.read_avail = ad2s1210_read_avail,
+	.write_raw = ad2s1210_write_raw,
 	.attrs = &ad2s1210_attribute_group,
 	.debugfs_reg_access = &ad2s1210_debugfs_reg_access,
 };
@@ -689,7 +772,6 @@ static int ad2s1210_probe(struct spi_device *spi)
 
 	mutex_init(&st->lock);
 	st->sdev = spi;
-	st->hysteresis = true;
 	st->resolution = 12;
 	st->fexcit = AD2S1210_DEF_EXCIT;
 
-- 
2.34.1

