Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CEF194C7F
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 23:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714434047; cv=none; b=HK8Bnl+ljpxM2f206krBu+wnBgY5NzMBp4wfOfn6grIbhokjVLJZWtLbzD/FSyCf4QXKqTzIW78dq1JyWPgGXSXA54UVnWfOrqHHej93FaZhVyo/wiC5Us/5narrytK7aUtvM8FBKFGi04f9AojhuR9s9H4WSV6Xb/ReJgz1Z4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714434047; c=relaxed/simple;
	bh=9vMzN7GknLhBK91OqN5FGd7OXYyaUfOO8wINrzGG+oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFFpABKxIiJXzPw3SysnV4388IsPgr90EUnXy+XRgPn1tSXl8TBYJyjOAnGH1Y/rQa02fpURUdKMkEAPW/05wo72tNJlGLkhHt9/5NEtC7o/6n5MUbKL1vBy/Rt1sES/iBbirwGxwHTWD3ygvueGfVy9IiPiKqgeaH+UiG3plGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vUZwz3BY; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vUZwz3BY"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2390335b67cso1438876fac.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 16:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714434035; x=1715038835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0CekvxTmvga6LetnTaTS9D84AmKilMVxsoFH3MiYrM=;
        b=vUZwz3BYoGoa0ZrmAk0K7GEup/Fsb2Oq1FZeXeyOXo7csDu34ZyWcMRQq+9Dj5Bpuz
         LEdc3Gd4taiW8YZh3BFHL9TKn/cfxUEuuZM35kGohlgoJ6EX3B7r6T/9iSsuGydIkBNj
         ei/QlQGoATJ+/R0x/o8wx+kv3u7hmaraZ9TL+X5V/U0RECBh7SweP0XLRPn4TYrFJ+kz
         7EeBLDrQEL8vMABgOkSgAp4KO3UawoP32b8LspimccJ1EMLfypniLmbJCougDi3ZUcAb
         Gw1JEUs2KWcQVlws74TZuAxw0QzDXUjMtOHCPSyxFG0gshevCNXBJeg9JWS9R3MZc0ND
         c8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714434035; x=1715038835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0CekvxTmvga6LetnTaTS9D84AmKilMVxsoFH3MiYrM=;
        b=R+jmkbGWqS+COkmfd9kNF9V3gt0nfUVqQV6WMKvtZF+0QGWcId+PIdN8p1g9fboahS
         rAi4MqGsfW8xG7ilyYOE/dUZSsdVYzZPhFZ+l7JRIS9rrJlwmQRq4nKGUVIu7oOHdbKL
         ud6exzI/L7HoFKvOmH9kqIgLykBeF9akxZplcQiDhgDkx6Sp0NU5rk9S65IaC76n072W
         Qv+cb5a2waPPS4TdQ26qmZJ5BonWkRBlafFuJnajGbyHaNkcNnbpXHF2D+/bLyE4znLU
         EBQIg8ymmhlEAxAN97hR83C+BSIIozaiPxFZxYCaIanr2ae7+GYlsdyf6XrQOkrCMWFI
         qiRg==
X-Forwarded-Encrypted: i=1; AJvYcCWBAyjzgoX7kh1DbBC/CpmfMtFPSZZDiJltqZFALoOP1gCfHsjPealSPrKyu7k222+DMg7iIPcr8gWEze6CQj4lmSh97k63x55lx50g1Q==
X-Gm-Message-State: AOJu0YzogdpsI5tpaN52Mci0d1QVxkTtcZS90PLN8b/yL0E+wNNLqL6k
	71DzrK0ZcSBP26PaAYOsxIGFuaEng74qgiujz4UU1cfA4oBXAtydzknLVMOS1mU=
X-Google-Smtp-Source: AGHT+IG3ocOUnX8fvHwyLMD+MT8XyRnapUIMPk5vg9h/GD5BQU/zEJPB811dMM2382JKTXmv4mcYHA==
X-Received: by 2002:a05:6871:7aa:b0:23a:980f:1fb8 with SMTP id o42-20020a05687107aa00b0023a980f1fb8mr13141585oap.53.1714434035037;
        Mon, 29 Apr 2024 16:40:35 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id hp22-20020a0568709a9600b0023b58aa20afsm2144508oab.25.2024.04.29.16.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 16:40:34 -0700 (PDT)
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
	linux-input@vger.kernel.org
Subject: [PATCH v2 1/7] regulator: devres: add API for reference voltage supplies
Date: Mon, 29 Apr 2024 18:40:09 -0500
Message-ID: <20240429-regulator-get-enable-get-votlage-v2-1-b1f11ab766c1@baylibre.com>
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

A common use case for regulators is to supply a reference voltage to an
analog input or output device. This adds a new devres API to get,
enable, and get the voltage in a single call. This allows eliminating
boilerplate code in drivers that use reference supplies in this way.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
* removed dev_err_probe() on error return
* dropped optional version of the function since there is no more
  difference after dev_err_probe() is removed
* renamed function to devm_regulator_get_enable_read_voltage()
* added unwinding on error paths
---
 Documentation/driver-api/driver-model/devres.rst |  1 +
 drivers/regulator/devres.c                       | 59 ++++++++++++++++++++++++
 include/linux/regulator/consumer.h               |  7 +++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 7be8b8dd5f00..18caebad7376 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -433,6 +433,7 @@ REGULATOR
   devm_regulator_bulk_put()
   devm_regulator_get()
   devm_regulator_get_enable()
+  devm_regulator_get_enable_read_voltage()
   devm_regulator_get_enable_optional()
   devm_regulator_get_exclusive()
   devm_regulator_get_optional()
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 90bb0d178885..4f290b9b559b 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -145,6 +145,65 @@ struct regulator *devm_regulator_get_optional(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_get_optional);
 
+/**
+ * devm_regulator_get_enable_read_voltage - Resource managed regulator get and
+ *                                          enable that returns the voltage
+ * @dev: device to supply
+ * @id:  supply name or regulator ID.
+ *
+ * Get and enable regulator for duration of the device life-time.
+ * regulator_disable() and regulator_put() are automatically called on driver
+ * detach. See regulator_get_optional(), regulator_enable(), and
+ * regulator_get_voltage() for more information.
+ *
+ * This is a convenience function for supplies that provide a reference voltage
+ * where the consumer driver just needs to know the voltage and keep the
+ * regulator enabled.
+ *
+ * In cases where the supply is not strictly required, callers can check for
+ * -ENODEV error and handle it accordingly.
+ *
+ * Returns: voltage in microvolts on success, or an error code on failure.
+ */
+int devm_regulator_get_enable_read_voltage(struct device *dev, const char *id)
+{
+	struct regulator *r;
+	int ret;
+
+	/*
+	 * Since we need a real voltage, we use devm_regulator_get_optional()
+	 * rather than getting a dummy regulator with devm_regulator_get() and
+	 * then letting regulator_get_voltage() fail with -EINVAL. This way, the
+	 * caller can handle the -ENODEV error code if needed instead of the
+	 * ambiguous -EINVAL.
+	 */
+	r = devm_regulator_get_optional(dev, id);
+	if (IS_ERR(r))
+		return PTR_ERR(r);
+
+	ret = regulator_enable(r);
+	if (ret)
+		goto err_regulator_put;
+
+	ret = devm_add_action_or_reset(dev, regulator_action_disable, r);
+	if (ret)
+		goto err_regulator_put;
+
+	ret = regulator_get_voltage(r);
+	if (ret < 0)
+		goto err_release_action;
+
+	return 0;
+
+err_release_action:
+	devm_release_action(dev, regulator_action_disable, r);
+err_regulator_put:
+	devm_regulator_put(r);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_regulator_get_enable_read_voltage);
+
 static int devm_regulator_match(struct device *dev, void *res, void *data)
 {
 	struct regulator **r = res;
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index ed180ca419da..59d0b9a79e6e 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -164,6 +164,7 @@ struct regulator *__must_check devm_regulator_get_optional(struct device *dev,
 							   const char *id);
 int devm_regulator_get_enable(struct device *dev, const char *id);
 int devm_regulator_get_enable_optional(struct device *dev, const char *id);
+int devm_regulator_get_enable_read_voltage(struct device *dev, const char *id);
 void regulator_put(struct regulator *regulator);
 void devm_regulator_put(struct regulator *regulator);
 
@@ -329,6 +330,12 @@ static inline int devm_regulator_get_enable_optional(struct device *dev,
 	return 0;
 }
 
+static inline int devm_regulator_get_enable_read_voltage(struct device *dev,
+							 const char *id)
+{
+	return -ENODEV;
+}
+
 static inline struct regulator *__must_check
 regulator_get_optional(struct device *dev, const char *id)
 {

-- 
2.43.2

