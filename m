Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA673B8944
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826206; cv=none; b=pWxW/qdSkUoaD8XaobhEi72R+aAVKo9a5wrCp+KhGNzJ6po3BPDvsaYvu08e+dHXUwOOermovilw7Tgx0lm2hGy3UOd3GQxMvzQMRyN/ADzhJPfauu0vxyqca1Yp75n+MpjtBVTFX+whwubbObzHhAwCwUdTX55JI7I/WPMW+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826206; c=relaxed/simple;
	bh=Tk8gsHUA/br8aqrC1iyhj1FHWqR7iTwilxeIVhkRv9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NdiFlzDfGq3R7n8USpjBRTnKKJ/4mWByxfAInlJr3doIfYtv3hvwsCMuSs4IQjVJ+pL+43cR1FoXRjOqHzJXNJaBCwt9DAkVr8A0arUnh5xSuGyr/8IujMwlPfc9q9Juc1FAhHwGM/R7aHYua6V45jg/ykdddkX2O0qQ/bisL3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKDjhZDw; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKDjhZDw"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c73a12af63cso4109430a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773826200; x=1774431000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q1E7NzrKrJ5QZEJfz50RfWy0GA0rHOKbA0v+tdNbCk=;
        b=HKDjhZDwVR143z/HRdWCTjrmfCUGALo/kFz+SdM9SpyQc4u7l4/vd67WpHjIbfRLos
         Gz0B+dD+0i3cEZ5DGnV+y8xB9ZbJ/R05bzx4oopCewkn7Vsvqh/sWA6L0jpBJb8DUms9
         L1u9aQlAe5u365jErV6iDm5G4slVJojkIt6xM2CUs6rgAxN8Iedl1ht4df+rh38nEEho
         80wcSpPtRpYpzwK6ZuDLphII0OE2ZXlDJtTFL7CyvC7yL0a2aZ77i8Zjm9xBfd9MZGRN
         ukAOSa3Tg2F+LX4HkbCcGHFvq+J03E3oES6LEinm3VywdxFdt4X2zFCsfpJHnkVcdx2e
         +MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826200; x=1774431000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9q1E7NzrKrJ5QZEJfz50RfWy0GA0rHOKbA0v+tdNbCk=;
        b=VlUjMYgXu5oC6/a8fA11FRpFmGaQI21xY8lR9DMhDK2da0iTbwf9t2UJbxCbrOTzR/
         5W28MaD77O2ShrW1w3+uS/eZ30WK6mrO4yDbn4ws2uPuS8KqKTXKZPJNFvhq0v1Bn8R5
         V55ckTdOF1yuGitD/Jt8F3jbenFNXjtPzXMC9z/XlU53wwmkVww9YklS09j2yK2Hc3uj
         6Prj11mJDV/i0ibJglNaCR+7UpGMxVeilT+LDXo8VS8v2aLtYeForBIYo0jnuTpCDCwW
         XuQWhqDErt/LpMh9Ip3IyPFTVmXnJl9X0FtS4l6Tx7TTyimOpFkXM9gt1hOBrtXi88xL
         KdAw==
X-Forwarded-Encrypted: i=1; AJvYcCX+udOkcih9MriN40DGp7tzq8TQ2CftetrPNM+9Cwpt/BW7gTIpfqTrrd+k6vlMi2oQScFJXtF5T6KvoT7Y@lists.linux.dev
X-Gm-Message-State: AOJu0YxXdGaKtl+Dgaa/2tn3JWgbKDvxCH/+wv11dSJEBjV8CwhfDIlY
	tOb+ZJqTwuKg/DUEkIOy4Zr51ZDHE8HutuzNgoT0MUsOQcl3Uc7dLfSA
X-Gm-Gg: ATEYQzy54DBfgQo7Ul/HCo8fNc3JpfpZvpQbMkSN3lYWE12bjqUheu4lO1iyy/6Ssyh
	59Z5XoFc3/Ry0j+y9/N0WRTtC/CO66O8lMEEShMO/Ro2nhfBkF0z8CYHdqlUGfS61U/xW7ck7fR
	7ZlkDDqmewrx9P5JfaXioo7Py+GN99OqU1HNiFLqe93DLColkjW+vRHk2HPXns4LPcS9Kl4IQsy
	+IcSKvKHBgAyjJ0Yc060EMcotlkzPZbWjdDFehSCSWuNbpFshEejjJZ6CQEwAoaeXZrw7lW6II7
	iv0SUSp6AFib8qLFdm21Jx+flg+G+/TOci/t7e/JmI9IZ3CALHHOf9lCRFDUP9kG4EJddO6S9tw
	vJ2SXUjoiCpYFHm4iDqGgu1+pgcXAoPaHzDRMrfGrCAEOWzInX+qulcGKT6KUVHJmXAAQqA06Mi
	n0VIxVUaVeN81eUKIE4LU1CLe3pk764UVXlWRq5tA6EOxRKdG870ECsXwEKroN2zZINcwNCGT6
X-Received: by 2002:a17:903:2445:b0:2ae:ceb0:d5eb with SMTP id d9443c01a7336-2b06e30fcadmr29723885ad.6.1773826200285;
        Wed, 18 Mar 2026 02:30:00 -0700 (PDT)
Received: from debian.ari ([152.58.182.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e616351sm21168315ad.67.2026.03.18.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:29:59 -0700 (PDT)
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
Subject: [PATCH v5 4/4] iio: adc: ad799x: use devm_iio_device_register and drop remove()
Date: Wed, 18 Mar 2026 14:57:15 +0530
Message-Id: <20260318092715.42538-5-architanant5@gmail.com>
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

Convert the driver to use the device-managed versions of
iio_device_register(), iio_triggered_buffer_setup(), and mutex_init().

Use devm_add_action_or_reset() to ensure that the VCC and VREF
regulators are disabled safely and in the correct order during
driver teardown or probe failure.

Because all resources (buffer, regulators, IRQs, IIO device, mutex)
are now fully managed by the devm core, the unwinding order is
guaranteed to be correct (reverse order of allocation). We can now
safely remove all manual error handling goto labels in ad799x_probe()
and delete the ad799x_remove() function entirely.

This eliminates boilerplate code and prevents potential resource leaks.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Suggested-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ad799x.c | 62 ++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index ae2ad4bd37cc..3d745612bb80 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -774,6 +774,11 @@ static const struct ad799x_chip_info ad799x_chip_info_tbl[] = {
 	},
 };
 
+static void ad799x_reg_disable(void *reg)
+{
+	regulator_disable(reg);
+}
+
 static int ad799x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -808,13 +813,17 @@ static int ad799x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, ad799x_reg_disable, st->reg);
+	if (ret)
+		return ret;
+
 	/* check if an external reference is supplied */
 	if (chip_info->has_vref) {
 		st->vref = devm_regulator_get_optional(dev, "vref");
 		ret = PTR_ERR_OR_ZERO(st->vref);
 		if (ret) {
 			if (ret != -ENODEV)
-				goto error_disable_reg;
+				return ret;
 			st->vref = NULL;
 			dev_info(dev, "Using VCC reference voltage\n");
 		}
@@ -824,10 +833,15 @@ static int ad799x_probe(struct i2c_client *client)
 			extra_config |= AD7991_REF_SEL;
 			ret = regulator_enable(st->vref);
 			if (ret)
-				goto error_disable_reg;
+				return ret;
+
+			ret = devm_add_action_or_reset(dev, ad799x_reg_disable, st->vref);
+			if (ret)
+				return ret;
+
 			ret = regulator_get_voltage(st->vref);
 			if (ret < 0)
-				goto error_disable_vref;
+				return ret;
 			st->vref_uV = ret;
 		}
 	}
@@ -835,7 +849,7 @@ static int ad799x_probe(struct i2c_client *client)
 	if (!st->vref) {
 		ret = regulator_get_voltage(st->reg);
 		if (ret < 0)
-			goto error_disable_reg;
+			return ret;
 		st->vref_uV = ret;
 	}
 
@@ -850,12 +864,12 @@ static int ad799x_probe(struct i2c_client *client)
 
 	ret = ad799x_update_config(st, st->chip_config->default_config | extra_config);
 	if (ret)
-		goto error_disable_vref;
+		return ret;
 
-	ret = iio_triggered_buffer_setup(indio_dev, NULL,
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 		&ad799x_trigger_handler, NULL);
 	if (ret)
-		goto error_disable_vref;
+		return ret;
 
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(dev,
@@ -867,39 +881,14 @@ static int ad799x_probe(struct i2c_client *client)
 						client->name,
 						indio_dev);
 		if (ret)
-			goto error_cleanup_ring;
+			return ret;
 	}
 
-	mutex_init(&st->lock);
-
-	ret = iio_device_register(indio_dev);
+	ret = devm_mutex_init(dev, &st->lock);
 	if (ret)
-		goto error_cleanup_ring;
-
-	return 0;
-
-error_cleanup_ring:
-	iio_triggered_buffer_cleanup(indio_dev);
-error_disable_vref:
-	if (st->vref)
-		regulator_disable(st->vref);
-error_disable_reg:
-	regulator_disable(st->reg);
-
-	return ret;
-}
-
-static void ad799x_remove(struct i2c_client *client)
-{
-	struct iio_dev *indio_dev = i2c_get_clientdata(client);
-	struct ad799x_state *st = iio_priv(indio_dev);
-
-	iio_device_unregister(indio_dev);
+		return ret;
 
-	iio_triggered_buffer_cleanup(indio_dev);
-	if (st->vref)
-		regulator_disable(st->vref);
-	regulator_disable(st->reg);
+	return devm_iio_device_register(dev, indio_dev);
 }
 
 static int ad799x_suspend(struct device *dev)
@@ -969,7 +958,6 @@ static struct i2c_driver ad799x_driver = {
 		.pm = pm_sleep_ptr(&ad799x_pm_ops),
 	},
 	.probe = ad799x_probe,
-	.remove = ad799x_remove,
 	.id_table = ad799x_id,
 };
 module_i2c_driver(ad799x_driver);
-- 
2.39.5

