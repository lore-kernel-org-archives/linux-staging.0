Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9C33B7B6B
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826201; cv=none; b=S4Njwco/hRJ0LVxQWvrEsC8sIVsZUJYg78KeAPfd32ZYZP1y67rWnpFTVrSYi0aji/oXnCdOTmALT9CCV9ZyiKVrvq6/3A60GCM3QIp6h14etmplZLhsgsIumTPfpOzHG7FkmKhZg9DyXBuKgAp8JU1yKo9U9U9jn5jgaG/YnYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826201; c=relaxed/simple;
	bh=pRd86ixJCsIKMhFYIEKfaVMan2Ea5weBwsSCy5N7fHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V+vLaSaVxz2KnS/QZvdDooe4Q0XFGlUVkujebyhMdgDDjwGsDyqp9MRlT1GddWhDzl0k2EF/laP52m99rfx18GVjMwOnbxlrycQ994cG5ptqS/9q2z5VWBDQpAO5vVv3uuq0Euc0wIKGiUEMUbOfpy4b8mmo/lmziilttsSM9fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgW63ng4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgW63ng4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2adff872068so30579225ad.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773826195; x=1774430995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FT3FCWE6d/BfnmV6V9NTfwQvybJ7Oe0ujhNN4DmJ54=;
        b=AgW63ng4AZ5Fzl2aEmIezY4KCnGSP4nuvEd/mMNWzkh3Zao7h6KZ4qoXhYD5LwPd3E
         U8pMl0gpyXY3CFbeOSpwRJ2KzEPdoN6bh6JYELBxVdkVJawD6lb6/3pbYYvMxEUgZcbZ
         KqhPaBzNVtmxoAT+EIxdPCu0dMDxeUOpVoUf2BdaAdZM8eYMTJzXw5UQwuQ/UQ8ykoQF
         dg3MLupqQjA/bZtzXr6wErpWkytQB2oJ1xREEcJWeQHDFEn1bwnka1HNVEXvhcRUcshV
         yNp3tvOta4nuAMFBDMwf3V+MjTewnDFgwlMoUXcsAzEv3kp6kUMW/FTEE0nLEN/1t+iH
         p1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826195; x=1774430995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5FT3FCWE6d/BfnmV6V9NTfwQvybJ7Oe0ujhNN4DmJ54=;
        b=YuKbMz8eo/isALO//rA2kwjJzf2UsJDjP2G8XLfJdnan9WR9akZigZUGqrUNB+huQR
         ZNRv2PAitRaqVuiD4PmHaEsBA/5IvFpZfGdVovoRNPrrEhIPdySQLHJcIqZS+4tv0mR2
         kdbEpz9pxiKW3US7Qvykf8LnNyq5NHAZDihXU20SHbmkMVWTNCjIYCYancC2Pv+Tsb7+
         9GM1AjDUZ2htNwFmHIfbKzIc6I3IDNpDmSoQB/oVYUyFoWfkfIHzKQ3hkshBeRXS6XvR
         0ReEZjl2pA8x+fwgJSGP9MtaJlXzha0/gz1wVs1Z6bY4IdUFscxPrcBy0ZJ9L9P1UHak
         htnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWED0/L4qgyxey5K2yY/w1U84aZeP9MFZxFnSJhcC3p6dS2aiF8zcwbxghByD6WGIUezmWYEi5mea4Bpmv1@lists.linux.dev
X-Gm-Message-State: AOJu0YzrUJnuMsQUWVcwMj84IMkL71h6P1Uax7vyXV1VWRGnMTHlbfjI
	DE/hwybOnLBLLDb//5mQHgSxAOukytS5uEGe3GA86qy/rymPUaFOvmZtKlV6YbSyFdM=
X-Gm-Gg: ATEYQzyodw2+dEBcgQVVDeA4hiCO9ZIGksxK6TtjryaiKUeItL0oc1SASzBlh5YjeDb
	/RtsWqEFC8CS/E/65/4JnCo2FwVyUeA53SPIUfQo/Pz1qH1cwKobFLUWowvVGMF08Ogy68oqQMJ
	bpLFbrEGByblktPYDvRtPe4YnN8mIZ5IU17pwUOQEKTgGjVgkfp4Q4cKfwyRGqNHK+VjD8JKTLn
	M+ILn3ufQzeAdI5dEUVaZOb98xhHvs28p3dqf6FxFKeH3FCkv9o3VdznpyJzkM51DPdo8CV2J49
	RqHoenAxTvdqT2fkHYi6a95tr4rofuBjs/5pY5avalQwXEvdR1knYRg6bJSTv4vD6tFMCfxYRu1
	R/+V4ok5PLGcyYs5JhbXxsK4ZfkPOWRKYyHNK+7bVzyQ8V+c/lVpJfJmD5UFIdx7XN7t2pz3yiS
	d8mR7rLnNXsXg0J+Hv/korLcrGN2ElYEs8RlB1eqTkYgLRS7LcZ3XNbRdiYmkvduSOtiN4zk+W
X-Received: by 2002:a17:902:f708:b0:2ae:4445:f39a with SMTP id d9443c01a7336-2b06e2fbf94mr27636655ad.7.1773826195304;
        Wed, 18 Mar 2026 02:29:55 -0700 (PDT)
Received: from debian.ari ([152.58.182.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e616351sm21168315ad.67.2026.03.18.02.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:29:54 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 3/4] iio: adc: ad799x: cache regulator voltages during probe
Date: Wed, 18 Mar 2026 14:57:14 +0530
Message-Id: <20260318092715.42538-4-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260318092715.42538-1-architanant5@gmail.com>
References: <20260318092715.42538-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading the regulator voltage via regulator_get_voltage() can be a slow
operation. Since the reference voltages for this ADC are not expected to
change at runtime, it is inefficient to query the regulator API every
time userspace reads the IIO_CHAN_INFO_SCALE attribute.

Determine the active reference voltage (either VREF or VCC) during
probe() and cache it in the state structure. This improves the
performance of ad799x_read_raw() and removes the dependency on the
regulator pointers during fast-path reads.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Suggested-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ad799x.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index 7504bcf627da..ae2ad4bd37cc 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -30,6 +30,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/bitops.h>
+#include <linux/units.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -135,6 +136,9 @@ struct ad799x_state {
 	u16				config;
 
 	unsigned int			transfer_size;
+
+	int				vref_uV;
+
 	IIO_DECLARE_BUFFER_WITH_TS(__be16, rx_buf, AD799X_MAX_CHANNELS);
 };
 
@@ -302,14 +306,7 @@ static int ad799x_read_raw(struct iio_dev *indio_dev,
 			GENMASK(chan->scan_type.realbits - 1, 0);
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
-		if (st->vref)
-			ret = regulator_get_voltage(st->vref);
-		else
-			ret = regulator_get_voltage(st->reg);
-
-		if (ret < 0)
-			return ret;
-		*val = ret / 1000;
+		*val = st->vref_uV / MILLI;
 		*val2 = chan->scan_type.realbits;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	}
@@ -828,9 +825,20 @@ static int ad799x_probe(struct i2c_client *client)
 			ret = regulator_enable(st->vref);
 			if (ret)
 				goto error_disable_reg;
+			ret = regulator_get_voltage(st->vref);
+			if (ret < 0)
+				goto error_disable_vref;
+			st->vref_uV = ret;
 		}
 	}
 
+	if (!st->vref) {
+		ret = regulator_get_voltage(st->reg);
+		if (ret < 0)
+			goto error_disable_reg;
+		st->vref_uV = ret;
+	}
+
 	st->client = client;
 
 	indio_dev->name = id->name;
-- 
2.39.5

