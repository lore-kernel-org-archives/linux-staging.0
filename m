Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A14BA27
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:39 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31dd10c2b8bso1005255f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306158; x=1695910958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xPn0fJb1G79vmQneRtFHd9riwOuPrJO1tNQT+KG0zw=;
        b=ceoGSNEdPd/v5/4gk/R3rozdVW2ApPJHbhwSSyXPVIKYIO0apyOpnzR/peoUDM8P7p
         Hgdk/tNMckj9W//mYa09eHZ6wGiiEHKXCmzd0k/J1pQn/QUO2yYz+bpaevAIwE9ak5HM
         fK6gmI7s/uIuphGPGiAmZx6uq64gNALzwQ8PK4StdeOa2ybe6djmlPmaBIwhKBSJ+uGk
         Tq+Zu+CorK5KsTXe+C4PsHA3t2BD+kKftGYun1WjIYyrlh0xAYFFVreLJyNwEWDFYdf1
         6xLQVk7UaZwYHuAnPQomhen2NubsJ6/DLaLsEr5ty65Ygpb43nizvGF+PPA4/zjMK4O9
         oqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306158; x=1695910958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xPn0fJb1G79vmQneRtFHd9riwOuPrJO1tNQT+KG0zw=;
        b=K05BYgMsdBpC2utuGiSrnFsLhqOaZqtaF54uWe/tnqHsHbewJpH7eMveaMW7A8xI5G
         6L6/JwnZ51hfIjA61vXDNNd8uqbbRrCVSHMFrXrDMq1di8fbBIbOQ1eJDsNzR5a3e/h2
         rg1yd4XLlRGIjZW3LApB+ZKDW9XbQdnkRHNSfnX5O6d0rMV0D8cKMEEmA6qT3zdeqOIf
         WHdnshcGj+1jlNE2Io55/m51tCkkEeeqyzvMqmfpgPcSrpDskgdBfdRlY3vpEPP5v4DR
         ku7ZJuQqF2GOW1paWjlfUqHGezegyYi38P4EQaFYPbfKealUrfiUuzeZoHMKq1TdbBDC
         3JJg==
X-Gm-Message-State: AOJu0YziMI9bSPLk73cwVYQE+5W3FpwWZzEFrkUM5wgUf8N3Niw/Ny8O
	tsldYscEdpucQTXGVN1+ik9cAg==
X-Google-Smtp-Source: AGHT+IHCsgQf5YDU2b8qhjf3hqvfyriFBctb7CQVc25Wz8iRM3Vsev+NwoaLu/6Clxbuw75eKXqg8g==
X-Received: by 2002:a5d:608d:0:b0:321:4b47:d1c0 with SMTP id w13-20020a5d608d000000b003214b47d1c0mr4847398wrt.71.1695306158083;
        Thu, 21 Sep 2023 07:22:38 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:37 -0700 (PDT)
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
Subject: [v2 07/19] staging: iio: resolver: ad2s1210: implement IIO_CHAN_INFO_SCALE
Date: Thu, 21 Sep 2023 09:19:35 -0500
Message-Id: <20230921141947.57784-10-dlechner@baylibre.com>
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

