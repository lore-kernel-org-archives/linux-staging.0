Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF28F155317
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581550; cv=none; b=QOTd6IDDyZNSFSe3q8y+VmlAZ5iXSpADY4JIgbiwqsy/rhyYalZJ6TJn0dq+plG2lS41NmbI6uOLwTHEnJwRbLN/jUrcNo2RMr9m4XM330xEcrW5nHGtvshtpMaijIJflUqsiLv+P7EeqA0ufkAJRBxifqztT10rEUjw+R6RhMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581550; c=relaxed/simple;
	bh=A4uSmS5u3AK9wMfER4kmGXxo9e/XTrxNUtjD7xNvI4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=suu0n4N1bZ45yM0y0bUqtb0Wg7bR1b15rp2pMVfk+TJTXQI4GYEplbU3g8Fn3cfoF5mZ70CHnolClOM0u3hGWjYUM+/u7dikI7F2dVirkrJdJHC2qQt5/cnvhqTuBiTYzavyu8BdhWk2Jw1mfC+2ORE1FCLe+R4zMFdbVBRulZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LvTsTaoL; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LvTsTaoL"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c3e67fd552so24698b6e.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581546; x=1712186346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOfZtVlJMTFXxAc7ahXTmKHh36zHepITVD/rnFowmPs=;
        b=LvTsTaoLvD79b4t7LboavWuZd4DcExWNPBqpJP92X/J8P7kuounJV/UlbEZb4VyJT7
         FNZjCFY5Ngv9rTD5LqpGWSo1EhCD67vs7oG3WyoSVsFjDe6igX6GWfjRfURww0Il6II1
         0qLadGSsrZn5MmihS8hY27NS52Fy3GnsqjoAIiXxx5yIpLIGVYYxwUIOT+meJIZwvnnS
         PpatxFwv2kb+nr4wWdeeZ5T0aTAwLwEqSuA6cew5NLJ4orIKU63sCQKVab8mZHXNayg5
         kK3yV8nJJAAigHa/sFc7HKGL5oRwQArEvXwn/1+MsPc65l4aiRg7BV96LDYe7TPwV/DL
         LLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581546; x=1712186346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOfZtVlJMTFXxAc7ahXTmKHh36zHepITVD/rnFowmPs=;
        b=if2gEu0KTwe4Uo/B3ziVyfuXQL751Wnnx4fAYWY+SkfiD/MAyNFr2jo2NaGeBNtHi4
         zoeNWoghzBcWs6Oebe6P31+ZNycCi1i/61WCpQCjDHuGUM+BDhkKlsyOKMHbLfELwdgq
         PaQDC+fcda7+yqwnnEnbT45LfckA7LeMRp4bIC6trYVqDeBELuBCnFucvBcrwirIUMRN
         RW99xRoVtrsu6uT2acfAuPZl0dRTiowOmHAu7KQ4K8pBuIckmLGCOo/RnFyNhJrfO0lz
         OqaINV+8mBK+LW3RnqBsUfG0C95oVvL9XGVKl7ghne2/NoBJ4dZM7/QCJPH3vvOHHSRF
         p1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHNlGPMYS7hQeYfbpiT66I/GvydYJGLbnxG+v5pxsm+k9Pu3mlaTTvbHW12zHfWWjkPchNQ0l4BMgadpq0ABivsQNhDBvR5c0zd57/iA==
X-Gm-Message-State: AOJu0YwUrPFkDAqhqbO9MQSBQpk8m2ro4OGj7BZReg2uR7X0Oov+wikm
	agly4xxySza3OZIR/ZcMeByje8mtR9jK1IMTiiS0tLgjb0w8ece3RTlG7xDTPN8=
X-Google-Smtp-Source: AGHT+IHDalMeGbYz9hAS9r44V5EAC6s0DOMiI1r9BYhrkzsEOWfvPSTNn7XD4XpPvS+TyN3y5eBfbA==
X-Received: by 2002:a05:6870:d14a:b0:22a:4e4e:4d9d with SMTP id f10-20020a056870d14a00b0022a4e4e4d9dmr1284999oac.11.1711581545937;
        Wed, 27 Mar 2024 16:19:05 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:05 -0700 (PDT)
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
Subject: [PATCH RFC 3/7] hwmon: (da9052) Use devm_regulator_get_enable_get_voltage()
Date: Wed, 27 Mar 2024 18:18:52 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-3-5f4517faa059@baylibre.com>
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
 drivers/hwmon/da9052-hwmon.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index 2bd7ae8100d7..70e7bc72e980 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -26,7 +26,6 @@ struct da9052_hwmon {
 	struct mutex		hwmon_lock;
 	bool			tsi_as_adc;
 	int			tsiref_mv;
-	struct regulator	*tsiref;
 	struct completion	tsidone;
 };
 
@@ -414,32 +413,19 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 		device_property_read_bool(pdev->dev.parent, "dlg,tsi-as-adc");
 
 	if (hwmon->tsi_as_adc) {
-		hwmon->tsiref = devm_regulator_get(pdev->dev.parent, "tsiref");
-		if (IS_ERR(hwmon->tsiref)) {
-			err = PTR_ERR(hwmon->tsiref);
-			dev_err(&pdev->dev, "failed to get tsiref: %d", err);
+		err = devm_regulator_get_enable_get_voltage(pdev->dev.parent,
+							    "tsiref");
+		if (err < 0)
 			return err;
-		}
-
-		err = regulator_enable(hwmon->tsiref);
-		if (err)
-			return err;
-
-		hwmon->tsiref_mv = regulator_get_voltage(hwmon->tsiref);
-		if (hwmon->tsiref_mv < 0) {
-			err = hwmon->tsiref_mv;
-			goto exit_regulator;
-		}
 
 		/* convert from microvolt (DT) to millivolt (hwmon) */
-		hwmon->tsiref_mv /= 1000;
+		hwmon->tsiref_mv = err / 1000;
 
 		/* TSIREF limits from datasheet */
 		if (hwmon->tsiref_mv < 1800 || hwmon->tsiref_mv > 2600) {
 			dev_err(hwmon->da9052->dev, "invalid TSIREF voltage: %d",
 				hwmon->tsiref_mv);
-			err = -ENXIO;
-			goto exit_regulator;
+			return -ENXIO;
 		}
 
 		/* disable touchscreen features */
@@ -456,7 +442,7 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(&pdev->dev, "Failed to register TSIRDY IRQ: %d",
 				err);
-			goto exit_regulator;
+			return err;
 		}
 	}
 
@@ -472,9 +458,6 @@ static int da9052_hwmon_probe(struct platform_device *pdev)
 exit_irq:
 	if (hwmon->tsi_as_adc)
 		da9052_free_irq(hwmon->da9052, DA9052_IRQ_TSIREADY, hwmon);
-exit_regulator:
-	if (hwmon->tsiref)
-		regulator_disable(hwmon->tsiref);
 
 	return err;
 }
@@ -483,10 +466,8 @@ static void da9052_hwmon_remove(struct platform_device *pdev)
 {
 	struct da9052_hwmon *hwmon = platform_get_drvdata(pdev);
 
-	if (hwmon->tsi_as_adc) {
+	if (hwmon->tsi_as_adc)
 		da9052_free_irq(hwmon->da9052, DA9052_IRQ_TSIREADY, hwmon);
-		regulator_disable(hwmon->tsiref);
-	}
 }
 
 static struct platform_driver da9052_hwmon_driver = {

-- 
2.43.2

