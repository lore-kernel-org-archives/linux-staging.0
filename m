Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150DD154C0F
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581550; cv=none; b=YIl3lBbdA86Le1PNHsZo2RT7p9H4Dz3iN30OzEdiITasMAgw2zm9VXssbqu8VdE0qMFaJyQrIL3N/NwF848A6D5Kill6cabDSGzjPQGA4zjx6rVP9jtLEEuD2VtqZjnCVWoppdBZDhNZGAd4N2UVCdfFH6PouCZxt5xoJEa9z2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581550; c=relaxed/simple;
	bh=m3bHOTwCtpGjb4KTDA27x15GCtpMS/P661zbUhfKKAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFvrrQdVtAR0CJAlD/vf/8DUWhlKMkU4LWxhpeNsk/dT0rw5rtfUG248HO4Mac/flZ9GzFhZzKSwBgdKH7eTgavZZ16Tp8v8zSuHujb0m+DZAnL6sDhkh74t3+MMsLF5RsfJG8DiVWLXzsbZY4+mRTBrvyJV53snxVPAeM2RA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pgVL8Xsa; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pgVL8Xsa"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-22963f0e12cso216349fac.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581547; x=1712186347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hg1dHpRYZjEho4rhJz+qSTgS0nJB4BPNbR6dsgqeqo=;
        b=pgVL8XsaCHv5D5dhmWb6L31b2ZPQQ3kDx8dVuGSO0BqqfhZMRRIjFxwERJvRUNuria
         QC/I1AYxVMAGbScBZmlsQS4LhuIFxJciwu/VdwL02Q1e1DI3YsIext704m80uvA+JuaA
         x2hfUGO1g0KJ3kCyhHtvWoBwYwj0WumBPA06V+Lax/3xRDRjDw5YOBT4eq71pQZJDHkS
         DTZmQ2Vnq4SfRRVo5FKvjtBOT7iCTPmFLAB/z4mv73ipUKYShMJ+lniK5GBsjrSKDzDq
         4NeF0VIq0zT/JrC4xb/S3BSbInSaKqC2oZKQdcmhIaJpiFqTz6eBIMQLDq2YLlh7O405
         zMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581547; x=1712186347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hg1dHpRYZjEho4rhJz+qSTgS0nJB4BPNbR6dsgqeqo=;
        b=s3QWBrB59F/LMgubAmUDM1TnfYJbrOFgT+Yb5A0gz6RHulIHx/PfxZHIyGAvB3WPX9
         e8j8CDjBPuF//oul5ifjK9YO+gU2gnX2zsPAHSimRZqvjmW/YvSzMwo/ghPgaiDPOZRk
         Uxq3XXYTx4HEAe2U3OqJ2yLMHewqvkpmkb5RCyNEzE4BqRkZN3uqaiKz3302fczbeB3+
         kClGxK7HP7UHcKt1juFokmynN2DxQuVNLhQUZatb/wXGm7rmNcxDy0dGe+afyFRSimWt
         snSuCUvNnVpvTIFf3VwlwNBHv5AjQ/4AcMeHpTJJ563vC1cvmh2ICQo4TtG7jOmSSyzS
         9RnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrwHzqhKb9+4nKMW7MCc0k29sGYuWYyniNwhKyRMqn9z86nNSgWqZJwlMP9xNHdQ6GZK/Qx7xPBZtNVLo5/RxY9R7EjZc9d89cYuM9iw==
X-Gm-Message-State: AOJu0Yx6V8mhkxTzddbtaSWdBRn6uOx5nKeufH4j6q9YILj2+vtrQGEE
	lUeipW8gAU5hZyU6QmhefOdYsqJE9MygD5+gfBXPavBqy8eWk02EpixlthtxqCk=
X-Google-Smtp-Source: AGHT+IHk3eSdmsSABjkDyaK0jauAUum2pB/dkonw6qcHUydV0+mxlwiPUnWMWCTRhHhYGOh0khoS/A==
X-Received: by 2002:a05:6870:5cc4:b0:222:63e2:aba3 with SMTP id et4-20020a0568705cc400b0022263e2aba3mr1314518oab.8.1711581547039;
        Wed, 27 Mar 2024 16:19:07 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH RFC 4/7] iio: addac: ad74115: Use devm_regulator_get_enable_get_voltage()
Date: Wed, 27 Mar 2024 18:18:53 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-4-5f4517faa059@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

We can reduce boilerplate code by using
devm_regulator_get_enable_get_voltage().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/addac/ad74115.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/addac/ad74115.c b/drivers/iio/addac/ad74115.c
index e6bc5eb3788d..01073d7de6aa 100644
--- a/drivers/iio/addac/ad74115.c
+++ b/drivers/iio/addac/ad74115.c
@@ -199,7 +199,6 @@ struct ad74115_state {
 	struct spi_device		*spi;
 	struct regmap			*regmap;
 	struct iio_trigger		*trig;
-	struct regulator		*avdd;
 
 	/*
 	 * Synchronize consecutive operations when doing a one-shot
@@ -1672,14 +1671,6 @@ static int ad74115_setup(struct iio_dev *indio_dev)
 	if (ret)
 		return ret;
 
-	if (val == AD74115_DIN_THRESHOLD_MODE_AVDD) {
-		ret = regulator_get_voltage(st->avdd);
-		if (ret < 0)
-			return ret;
-
-		st->avdd_mv = ret / 1000;
-	}
-
 	st->din_threshold_mode = val;
 
 	ret = ad74115_apply_fw_prop(st, &ad74115_dac_bipolar_fw_prop, &val);
@@ -1788,11 +1779,6 @@ static int ad74115_reset(struct ad74115_state *st)
 	return 0;
 }
 
-static void ad74115_regulator_disable(void *data)
-{
-	regulator_disable(data);
-}
-
 static int ad74115_setup_trigger(struct iio_dev *indio_dev)
 {
 	struct ad74115_state *st = iio_priv(indio_dev);
@@ -1855,19 +1841,11 @@ static int ad74115_probe(struct spi_device *spi)
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->info = &ad74115_info;
 
-	st->avdd = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(st->avdd))
-		return PTR_ERR(st->avdd);
-
-	ret = regulator_enable(st->avdd);
-	if (ret) {
-		dev_err(dev, "Failed to enable avdd regulator\n");
+	ret = devm_regulator_get_enable_get_voltage(dev, "avdd");
+	if (ret < 0)
 		return ret;
-	}
 
-	ret = devm_add_action_or_reset(dev, ad74115_regulator_disable, st->avdd);
-	if (ret)
-		return ret;
+	st->avdd_mv = ret / 1000;
 
 	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(regulator_names),
 					     regulator_names);

-- 
2.43.2

