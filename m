Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526FB194C81
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 23:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714434043; cv=none; b=YS6yrBbHCcGsSOv0KBP2ge1qDeyynMda1aG0qj0AaQISV24wu0cf/xTfQciYGSLMJQNDVT8+4C4vkiYCJHCb2r+Vk46QL/mpnWZlfxwpuFaDKVudQfgyxgLpbFwVVvSKbfZ20ieDf6wHJ+WvBb3kOM1hoDjJMMK3mH8kM1ooPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714434043; c=relaxed/simple;
	bh=+zbSPfQCo2TidClAz8aFbx06kfsxotX22PYdokwlZHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBvk5DAHgEMiQAOkU+lydhY7zeOGrnlNLxV4GXk3fpawyX0IQpRaHn88y0KEfgGpuHt8jPknOcmBvZ7PRDZsvsa3YHrPQBxapzw2mD3X67kNPwGXjeSeNecewabOzf5cX2KkaxqXasMZf5NmufRPJ2nME0QdcgV0jEUpxc/NGd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GRCIwefe; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GRCIwefe"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5aa1bf6cb40so3618830eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 16:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714434039; x=1715038839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMa9itjiBD1i+54RsbufRd9SzNQWP0jHWTveFCuhzhs=;
        b=GRCIwefeaDk271WkO/ojhkdspOan/FK4bn2ViKuUrhazjLPdG9kYAK222wQv2HNh2s
         eNn7ZqckFcjggd2xDE2pJYQoeRQMRvY2PpOfqZS1OrE4/UHgSW2WdoCVC4nJB2cMlh0L
         YwB8UIJ/XCHZHwZF6Kb8u/2BSCkm9notJocEYa/N/xqNGOb7BYCtwRr8Ae/jsiB/wAUN
         ioq73NdAIiTa0UKxhFq6SPQhXipglkZyvCuM42eC9wGwH+qn8KRoFxQY/FI6/vP9eJSt
         DMaLapDGLrs5rEayBcVPOzmRBsjNpbuqEUUlVAfRyrOjnbtm5xvnCKXrTI6aL5j6DLg8
         dlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714434039; x=1715038839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMa9itjiBD1i+54RsbufRd9SzNQWP0jHWTveFCuhzhs=;
        b=Y+57pXz71/M6WQ0i/hwH1nKSHVKIDZM78vsowI+SfxeSolvdCe69m4WFwwbk+q3WQi
         9x5SEGcn9v+UrxQzdHGeyC7aOZMtI56P14+8nFLCvhCTSArX9921SXnOmN8t/tSAi2H9
         ACPXR0tto03WtcKCDzW90DmFr1zvUN1y0luZlPZNb2GL+Q7NIKJpquZAs4nKpxSpX2LL
         BUKLEduSgSUefGGS+Vx4rRKTsnD32K3QOQykuW6VEyQU8RBb5mAOaNXD4dSl8seyFBsc
         ZxsWoIHYPyh0CdTfP++nHhXpr9/RMOBlgZCn38kI428RdRXBlB30eOVGARECm0lXqGS8
         i/vw==
X-Forwarded-Encrypted: i=1; AJvYcCXroFlANWU0yLPDgaoINJLUh6jUUGZHxnoH759yMdbMAcXTMCqoVE5Or1fNHK2Y5G1Uj6/KenjK4+aaeYRkONArTRdTIv5W8CJCrwA8KA==
X-Gm-Message-State: AOJu0Yzd7AR7kXdPtZcBnGK6nmjp/oalCIJNKaCw98cePrOg3pWzx2UB
	sRHs/WdfCqVsRBJKwhtqo1WdGDeY/n+bpmwjxVcmQ1XKrDlferWh1rBrbKxrJJ4=
X-Google-Smtp-Source: AGHT+IHZS+Qb8IK/5+c42Z7q9D/JlPLCK9Xj2YphxAuDblsocLb4nLT+una8inphv6YTDWUrrKC1Qw==
X-Received: by 2002:a05:6870:d1ca:b0:23a:4a77:af72 with SMTP id b10-20020a056870d1ca00b0023a4a77af72mr12643410oac.31.1714434039393;
        Mon, 29 Apr 2024 16:40:39 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id hp22-20020a0568709a9600b0023b58aa20afsm2144508oab.25.2024.04.29.16.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 16:40:38 -0700 (PDT)
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
Subject: [PATCH v2 5/7] iio: frequency: admv1013: Use devm_regulator_get_enable_read_voltage()
Date: Mon, 29 Apr 2024 18:40:13 -0500
Message-ID: <20240429-regulator-get-enable-get-votlage-v2-5-b1f11ab766c1@baylibre.com>
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

The common mode voltage is now passed as a parameter in the init
functions so we can avoid adding a state member that is only used
during init.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
* renamed to devm_regulator_get_enable_read_voltage
* restored error message
---
 drivers/iio/frequency/admv1013.c | 40 ++++++++++------------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/iio/frequency/admv1013.c b/drivers/iio/frequency/admv1013.c
index 92923074f930..c0cd5d9844fe 100644
--- a/drivers/iio/frequency/admv1013.c
+++ b/drivers/iio/frequency/admv1013.c
@@ -95,7 +95,6 @@ struct admv1013_state {
 	struct clk		*clkin;
 	/* Protect against concurrent accesses to the device and to data */
 	struct mutex		lock;
-	struct regulator	*reg;
 	struct notifier_block	nb;
 	unsigned int		input_mode;
 	unsigned int		quad_se_mode;
@@ -342,14 +341,9 @@ static int admv1013_update_quad_filters(struct admv1013_state *st)
 					FIELD_PREP(ADMV1013_QUAD_FILTERS_MSK, filt_raw));
 }
 
-static int admv1013_update_mixer_vgate(struct admv1013_state *st)
+static int admv1013_update_mixer_vgate(struct admv1013_state *st, int vcm)
 {
 	unsigned int mixer_vgate;
-	int vcm;
-
-	vcm = regulator_get_voltage(st->reg);
-	if (vcm < 0)
-		return vcm;
 
 	if (vcm <= 1800000)
 		mixer_vgate = (2389 * vcm / 1000000 + 8100) / 100;
@@ -443,7 +437,7 @@ static const struct iio_chan_spec admv1013_channels[] = {
 	ADMV1013_CHAN_CALIB(1, Q),
 };
 
-static int admv1013_init(struct admv1013_state *st)
+static int admv1013_init(struct admv1013_state *st, int vcm_uv)
 {
 	int ret;
 	unsigned int data;
@@ -483,7 +477,7 @@ static int admv1013_init(struct admv1013_state *st)
 	if (ret)
 		return ret;
 
-	ret = admv1013_update_mixer_vgate(st);
+	ret = admv1013_update_mixer_vgate(st, vcm_uv);
 	if (ret)
 		return ret;
 
@@ -498,11 +492,6 @@ static int admv1013_init(struct admv1013_state *st)
 					  st->input_mode);
 }
 
-static void admv1013_reg_disable(void *data)
-{
-	regulator_disable(data);
-}
-
 static void admv1013_powerdown(void *data)
 {
 	unsigned int enable_reg, enable_reg_msk;
@@ -557,11 +546,6 @@ static int admv1013_properties_parse(struct admv1013_state *st)
 	else
 		return -EINVAL;
 
-	st->reg = devm_regulator_get(&spi->dev, "vcm");
-	if (IS_ERR(st->reg))
-		return dev_err_probe(&spi->dev, PTR_ERR(st->reg),
-				     "failed to get the common-mode voltage\n");
-
 	ret = devm_regulator_bulk_get_enable(&st->spi->dev,
 					     ARRAY_SIZE(admv1013_vcc_regs),
 					     admv1013_vcc_regs);
@@ -578,7 +562,7 @@ static int admv1013_probe(struct spi_device *spi)
 {
 	struct iio_dev *indio_dev;
 	struct admv1013_state *st;
-	int ret;
+	int ret, vcm_uv;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
 	if (!indio_dev)
@@ -597,16 +581,12 @@ static int admv1013_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified Common-Mode Voltage!\n");
-		return ret;
-	}
+	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vcm");
+	if (ret < 0)
+		return dev_err_probe(&spi->dev, ret,
+				     "failed to get the common-mode voltage\n");
 
-	ret = devm_add_action_or_reset(&spi->dev, admv1013_reg_disable,
-				       st->reg);
-	if (ret)
-		return ret;
+	vcm_uv = ret;
 
 	st->clkin = devm_clk_get_enabled(&spi->dev, "lo_in");
 	if (IS_ERR(st->clkin))
@@ -620,7 +600,7 @@ static int admv1013_probe(struct spi_device *spi)
 
 	mutex_init(&st->lock);
 
-	ret = admv1013_init(st);
+	ret = admv1013_init(st, vcm_uv);
 	if (ret) {
 		dev_err(&spi->dev, "admv1013 init failed\n");
 		return ret;

-- 
2.43.2

