Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C974155730
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581553; cv=none; b=Ex3fu9Y465WLqonyQTWVx+iFT3iV7PcXARmzTFMa7QiA2vcP/Ms0KCxTC8cWfAEolPzYyGUTgJE4fq7omcc/g/YoUlGT2TdnlZRAeSEgasmm7X3jadwIOA7ojkK094cs9EaergMMUX3b/sH3W3mYLYuICBulmUtgMSZDFr3xiNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581553; c=relaxed/simple;
	bh=xlOFHnY+VUAHimj0/6CI3uzJ6CONg5CROD3tFFJ2TF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rP6Tv3YMTA/9tXdFC781T3mjnk/Wclm32jgm7inJZ3wY9qLnAj+aW5TydohA4rKmqLpMpfII/+n2Udt5p0buSFkllOD3xXCx2KIDTP/XAmYUQLI+BeKl6ldpIjnlsyL1RDGVCh5ivyD/08DQ3Z3ZP7orQHYoiRhkiRax0RlZ4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=c49qtaSO; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c49qtaSO"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e6d089f603so257761a34.1
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 16:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711581549; x=1712186349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBx5yqCcIG/deXybWASqoKrfUt47GVVbdT7E/yXEMkE=;
        b=c49qtaSOb9PCg/Q/SXIOOfmqi7Xvoz/itcpA5ktoZ5caPXnTnql6CBNnDIVEM9dySJ
         f0qina9QRQTexh0F1PY7FeIAqSH6399v0BqBR8ohvSxzwUURDokJSTi0YVrL15pABioC
         asYpZHvkvkxlsi5MxpUmgs05gtQgkRYiGqYJf/1JRKbEQb7mk14mbqy+HodPsApcySb8
         K6BiGcQckSXKUzzaHArtnlgr4/EcVPDpJDonMAKnm6UA0ql96Zfo0cjVN+1BOWw/G/Qx
         SAcAGcXUJDhSc11f8QhX2BEhp0C+E9teP5Sw87qJ2Z+s+TU9UzbtuEsSqVCh1MZR1F4X
         tnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581549; x=1712186349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBx5yqCcIG/deXybWASqoKrfUt47GVVbdT7E/yXEMkE=;
        b=TOpx515ITRcViG5ZHF5E33+9/TlHvPLlOVVhEY85C+Us2itkCkEyWATuqT2On1Xjz9
         vJuqtL3B281NsiMuoMNBXR3EfkR5Piht4el+LOAyygumVjj5sHD0WdBM1lZQS3x/XhSZ
         RIJq449JKbXsWg9vYY/iCxW1+i7wkH+mN4QrNnqzbmBFVYZiIJe9ujDXs0dYN4q/4MEz
         l1hBP8uOYRjsmPOS/l2E9r/LAexfTT+Dj5Lf1+JxBzmNjFn6SzIafINlq1ki1xczupoF
         QMInQHly4oSKLGbI1kZSlqip+wLIlqz812meMokNop2KIkf2vtH7X1ynfIhkVoQArwrI
         htSA==
X-Forwarded-Encrypted: i=1; AJvYcCUaRtXMU36lCElVnD5Y3Bqcg3Hwj0Smai01SSqusu8kDT11074dIUJFQSS6DVZ6IptW/dJrAGrZMbJw+Y3/zUw3d9qCKlaq2OdPhjVgZg==
X-Gm-Message-State: AOJu0YzPMwiXptYirNiUPOaXMx03lQfc82+3lvwxQFmegmvCC/aWEPXo
	HwsNkhvv6lGpbYr7YmHV0EAs/Q2zhifjs+qN2iPqMFkQJi42AK060qhHQ2OTvw0=
X-Google-Smtp-Source: AGHT+IFXU8zmzWmrbkxOxvW7wtT9Hq/b5rbtfGnHI6ZuQs2D4otmJCIrbq7hVTyLaL9P54g4uvOwbQ==
X-Received: by 2002:a05:6870:b14b:b0:229:fa5a:2fec with SMTP id a11-20020a056870b14b00b00229fa5a2fecmr1265617oal.54.1711581549199;
        Wed, 27 Mar 2024 16:19:09 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id js3-20020a056870bac300b0022a0519183csm81381oab.2.2024.03.27.16.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 16:19:08 -0700 (PDT)
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
Subject: [PATCH RFC 6/7] staging: iio: impedance-analyzer: admv1013: Use devm_regulator_get_enable_get_voltage()
Date: Wed, 27 Mar 2024 18:18:55 -0500
Message-ID: <20240327-regulator-get-enable-get-votlage-v1-6-5f4517faa059@baylibre.com>
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
 drivers/staging/iio/impedance-analyzer/ad5933.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 9149d41fe65b..e4942833b793 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -84,7 +84,6 @@
 
 struct ad5933_state {
 	struct i2c_client		*client;
-	struct regulator		*reg;
 	struct clk			*mclk;
 	struct delayed_work		work;
 	struct mutex			lock; /* Protect sensor state */
@@ -660,13 +659,6 @@ static void ad5933_work(struct work_struct *work)
 	}
 }
 
-static void ad5933_reg_disable(void *data)
-{
-	struct ad5933_state *st = data;
-
-	regulator_disable(st->reg);
-}
-
 static int ad5933_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -685,21 +677,7 @@ static int ad5933_probe(struct i2c_client *client)
 
 	mutex_init(&st->lock);
 
-	st->reg = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(st->reg))
-		return PTR_ERR(st->reg);
-
-	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(&client->dev, "Failed to enable specified VDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&client->dev, ad5933_reg_disable, st);
-	if (ret)
-		return ret;
-
-	ret = regulator_get_voltage(st->reg);
+	ret = devm_regulator_get_enable_get_voltage(&client->dev, "vdd");
 	if (ret < 0)
 		return ret;
 

-- 
2.43.2

