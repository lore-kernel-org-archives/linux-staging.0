Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93F199E9B
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 23:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714434043; cv=none; b=EoFF96T1XUO4mcScxwxItM31r2O9oMiKe0doUmJBo+Mbk9cTuM2WJ1poOqCZyspb6/6CfFPbhOn1c7TexiFsGb2MXGEHds8ukDmKyO+cmFou3rLOCPe+7k1PluWMlDxh4hUg32SR8u6aI62TfvpMMboarFttu5MWBNY7QCn09d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714434043; c=relaxed/simple;
	bh=4b44S3VIMtdkbxcMOARrPEB6+EsrH1npp+wwSXp0/Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVvqrb98RiHTsvvIxGNCWn3zzXRVen8lohwB3gKQNVGaokjqE+bFTTRRqW+rV2nG6JKy7E+mpgrol8jd23a3kV1ZDC/gJpSdonmU5STyBmxP/KnCwjU36dxM6mdOtahbKVhTOVqjmz3Bddy3G9izRIhLaEjjX11vW8cPYb8FZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uxJXgZ2e; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uxJXgZ2e"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6eb6b9e1808so2389135a34.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 16:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714434040; x=1715038840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cubJgWS5pQ7P3B0LhmHJm/4bbMow1xJhT8KxVswt/M=;
        b=uxJXgZ2eMsOleZEDTu4hjNdGkjpvMqlqDkdl5JZs6fp+UIIRMAv3T6eOIKdZi5t3YK
         W30clpYnOPqsO/t7J/rfhqeHSPOg69FnLJW/mhIadz2hi9cyvODpKzq2QNMcNZiwu/VR
         r9AZQ3RC4M8G+OawKRzsr6B4IQpRakwEHoEzfZ/UoUQsBr5dfcgwGExkf1f+bwQPrK/l
         CRINuLbDv+aQh3581FxWbV+CEO0/o96QoKP2dApeZFsuwyPEk3AhCfZFUPUNN+1nAIwG
         rwjoY1nWBxUM5S5hJjJoQ3l6bLzrCsf5dWWA2RArKGSPLh/gpSAA2N5Qp09Bc2t6aPj4
         4hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714434040; x=1715038840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cubJgWS5pQ7P3B0LhmHJm/4bbMow1xJhT8KxVswt/M=;
        b=HfFzR+5/oTk/KUUWPsggNIc3ORrnutgeAn5LYu3+QZIMp2QvTdq5gg/IekpKQX0YYv
         vcHUEblcyfRbFD+XvGh5J6bTVKSE7t58sGjvxnkn9o1hQ4AqZhoPklwiK5QUk15eAzbd
         BUtpQ1l85Qjf8oUtzM6lDywIpmrKTwoC/BEgYaBsmwbEWWh8JNFyhEGq0VZ3d8g+pdy1
         C1Yo/IOowKf2VrW/9gpvrpazxDI76LBGW9Y24Qa0OmULI/lZ0tShfNXDs1U8mQj8S3K/
         MK/QjFPr3+sewMYqnAqnVfWifWazM4h8THuh3quHfq/Jvdgdby5Jgru29A9lDbISIIzz
         NkqA==
X-Forwarded-Encrypted: i=1; AJvYcCW71jMQYCDjZ7fVTK6iLYKEskZ+NSx2amF5yCfGht++WKI0EkziFBneFyOaTSR8fpIy3PGpK80RMx30lOstbpWjS5H5BQs0N3Ja9QZYcg==
X-Gm-Message-State: AOJu0Yy+V3cRhHlfdyBOufyq0UuVEyekPc2zgWCccUEKJwJUNnVo32jI
	htDOzVAIuvDxJmz+JBI+y/f/CrFO8wzzdpPyvPhN0dRgeXPh1SzYeVC2NqebbZk=
X-Google-Smtp-Source: AGHT+IF9FNXMJn6cCCuS5KH/ro7axiMukYHYUjRjs+0McXERXtUeYMZud/t0NDESAzUK3Kc/OnKC2Q==
X-Received: by 2002:a05:6870:8a0f:b0:23c:6020:6733 with SMTP id p15-20020a0568708a0f00b0023c60206733mr6514806oaq.27.1714434040496;
        Mon, 29 Apr 2024 16:40:40 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id hp22-20020a0568709a9600b0023b58aa20afsm2144508oab.25.2024.04.29.16.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 16:40:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 6/7] staging: iio: impedance-analyzer: ad5933: Use devm_regulator_get_enable_read_voltage()
Date: Mon, 29 Apr 2024 18:40:14 -0500
Message-ID: <20240429-regulator-get-enable-get-votlage-v2-6-b1f11ab766c1@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
References: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
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
devm_regulator_get_enable_read_voltage().

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
* fixed wrong driver name in patch subject
* renamed to devm_regulator_get_enable_read_voltage()
* restored error message
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 26 ++-----------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 9149d41fe65b..b7af5fe63e09 100644
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
@@ -685,23 +677,9 @@ static int ad5933_probe(struct i2c_client *client)
 
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
+	ret = devm_regulator_get_enable_read_voltage(&client->dev, "vdd");
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&client->dev, ret, "failed to get vdd voltage\n");
 
 	st->vref_mv = ret / 1000;
 

-- 
2.43.2

