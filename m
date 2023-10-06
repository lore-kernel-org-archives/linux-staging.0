Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016F10E7
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fmg+of8I"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1a1fa977667so1011401fac.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553466; x=1697158266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qps0yZuxIdvWJ2ZIT7jrzjOXstZNZBL41ajnUJMVQA=;
        b=fmg+of8IilOyjYZsBK5+mJfVpJq5ZCIxsGxmWwpWfpcQN3DKL6Ob0Hzz0Cbs5kG10J
         eXcQA4qtipLDS4ActatkjKEOUuBRZCjHUszPaHGzcBLVAVQlqa3x2hmpHVbqFFADRh3B
         MKEte6qQuVBxMa8TTkKO9JTeLYycFeZ8DiPt5wbuqc2nijmDIlE6KZJYJ6p2MeAkq1gn
         aqyvG4jU39lXckPbqvJ6VMaLFrD15RdEryRf0dsJMcnCGovaSMPMtQ+0dXnodbzpDMMX
         zIiLP88gVTvOygA1g9ZQuEoQF/kNL5PzgwUMcvAJ5fdDdJWfFM5bVp9lam2dlF3c2Bl+
         QiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553466; x=1697158266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qps0yZuxIdvWJ2ZIT7jrzjOXstZNZBL41ajnUJMVQA=;
        b=o2JmN+tBpUF2E5gng/dC+8cBIHeEY5tKaKrUEkiErwXKtGef0STCWxcHfGSOQ3Qb6Y
         cMkUzyc3LzU+8NlHE4te647GuKPNskBbDDx3/+SHUTRXg0f1MpodIzyEbqGLl/LNWFIl
         vAXRCUdCChEsqtIKmysNBRTxxZeFQflPnpPxXvfOwsm/mb6uKV2oGYZq+VoG8vydTHa8
         dtiPNud+0I04clD7W9NcTn7EgfWjDVi7pJA0QpEaUUg08V48DkmR2WneRHPCmuaRxuvP
         iZYoQ9qH5mGlmukeyfhmAddTkxZimuRfOlriEa11X1nqHQNHWWK807S+XwSC5FbxPQTK
         1rdQ==
X-Gm-Message-State: AOJu0Yx9XMVC06C8wLzOZhU41I3A0MwWyrTXJuQuX0OpoYWqpJg3hdGR
	6oXkZoJK7vw5hS02DhX7Cmc6XlXhcqbq5pHxDGzRgw==
X-Google-Smtp-Source: AGHT+IG4I5ztMPys5r+CrTX2pZbWsep+z3Uons59yy9bAFOoVvI35cwLsgW+nO6BlaxHEsiQYhI2uQ==
X-Received: by 2002:a05:6871:592:b0:1d5:5659:4730 with SMTP id u18-20020a056871059200b001d556594730mr8210621oan.37.1696553466751;
        Thu, 05 Oct 2023 17:51:06 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/17] staging: iio: resolver: ad2s1210: implement hysteresis as channel attr
Date: Thu,  5 Oct 2023 19:50:19 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-2-ec00746840fc@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

The AD2S1210 resolver has a hysteresis feature that can be used to
prevent flicker in the LSB of the position register. This can be either
enabled or disabled. Disabling hysteresis is useful for increasing
precision by oversampling.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes:
* Fixed hysteresis raw values when st->resolution != 16.

v3 changes:
* Refactored into more functions to reduce complexity of switch statements.
* Use early return instead of break in switch statements.


 drivers/staging/iio/resolver/ad2s1210.c | 91 +++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 8fbde9517fe9..af063eb25e9c 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -76,7 +76,8 @@ struct ad2s1210_state {
 	struct regmap *regmap;
 	/** The external oscillator frequency in Hz. */
 	unsigned long clkin_hz;
-	bool hysteresis;
+	/** Available raw hysteresis values based on resolution. */
+	int hysteresis_available[2];
 	u8 resolution;
 	/** For reading raw sample value via SPI. */
 	__be16 sample __aligned(IIO_DMA_MINALIGN);
@@ -311,6 +312,7 @@ static ssize_t ad2s1210_store_resolution(struct device *dev,
 		goto error_ret;
 
 	st->resolution = udata;
+	st->hysteresis_available[1] = 1 << (16 - st->resolution);
 	ret = len;
 
 error_ret:
@@ -447,6 +449,35 @@ static int ad2s1210_single_conversion(struct ad2s1210_state *st,
 	return ret;
 }
 
+static int ad2s1210_get_hysteresis(struct ad2s1210_state *st, int *val)
+{
+	int ret;
+
+	mutex_lock(&st->lock);
+	ret = regmap_test_bits(st->regmap, AD2S1210_REG_CONTROL,
+			       AD2S1210_ENABLE_HYSTERESIS);
+	mutex_unlock(&st->lock);
+
+	if (ret < 0)
+		return ret;
+
+	*val = ret << (16 - st->resolution);
+	return IIO_VAL_INT;
+}
+
+static int ad2s1210_set_hysteresis(struct ad2s1210_state *st, int val)
+{
+	int ret;
+
+	mutex_lock(&st->lock);
+	ret = regmap_update_bits(st->regmap, AD2S1210_REG_CONTROL,
+				 AD2S1210_ENABLE_HYSTERESIS,
+				 val ? AD2S1210_ENABLE_HYSTERESIS : 0);
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
 static const int ad2s1210_velocity_scale[] = {
 	17089132, /* 8.192MHz / (2*pi * 2500 / 2^15) */
 	42722830, /* 8.192MHz / (2*pi * 1000 / 2^15) */
@@ -479,7 +510,55 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 		default:
 			return -EINVAL;
 		}
+	case IIO_CHAN_INFO_HYSTERESIS:
+		switch (chan->type) {
+		case IIO_ANGL:
+			return ad2s1210_get_hysteresis(st, val);
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ad2s1210_read_avail(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       const int **vals, int *type,
+			       int *length, long mask)
+{
+	struct ad2s1210_state *st = iio_priv(indio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_HYSTERESIS:
+		switch (chan->type) {
+		case IIO_ANGL:
+			*vals = st->hysteresis_available;
+			*type = IIO_VAL_INT;
+			*length = ARRAY_SIZE(st->hysteresis_available);
+			return IIO_AVAIL_LIST;
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
 
+static int ad2s1210_write_raw(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      int val, int val2, long mask)
+{
+	struct ad2s1210_state *st = iio_priv(indio_dev);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_HYSTERESIS:
+		switch (chan->type) {
+		case IIO_ANGL:
+			return ad2s1210_set_hysteresis(st, val);
+		default:
+			return -EINVAL;
+		}
 	default:
 		return -EINVAL;
 	}
@@ -520,7 +599,10 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
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
@@ -596,6 +678,8 @@ static int ad2s1210_debugfs_reg_access(struct iio_dev *indio_dev,
 
 static const struct iio_info ad2s1210_info = {
 	.read_raw = ad2s1210_read_raw,
+	.read_avail = ad2s1210_read_avail,
+	.write_raw = ad2s1210_write_raw,
 	.attrs = &ad2s1210_attribute_group,
 	.debugfs_reg_access = &ad2s1210_debugfs_reg_access,
 };
@@ -711,8 +795,9 @@ static int ad2s1210_probe(struct spi_device *spi)
 
 	mutex_init(&st->lock);
 	st->sdev = spi;
-	st->hysteresis = true;
 	st->resolution = 12;
+	st->hysteresis_available[0] = 0;
+	st->hysteresis_available[1] = 1 << (16 - st->resolution);
 
 	ret = ad2s1210_setup_clocks(st);
 	if (ret < 0)

-- 
2.42.0

