Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16611B3F0B
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811527; cv=none; b=bYHf5sD3S00bZz2PmrNo6G8YZRA9m5mYLzigIXUlzjwcW0uQKuGEfcITnybb2KVkKZoSbDRy29Zc3TizS+KvO70oLow6du2o3M0klObdoi6HS2xW92MdEuDO3tWxXXFXmg9lYPzV+lIiaFwN533PldN35vMsN7FzfMlGwN24vNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811527; c=relaxed/simple;
	bh=/6WcXSLwFpxkzdTierJx9NQnI7bszU0POONTE1m0oX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVqaX3GkCtRS/DWGoNmuP7g9fZV/7lY0jGSXxCrQBPG0THuNeyFqtwG+Xs0FPRPwwRpyiLniDZo+fuVVCjcugXWrh5JxKpBQDhvBxmMKSgpSoGisRYhN3ZxUr8Tghltz2uAvBoDdxyJlVREeHKCKBUsAG5GXt/3YvZlikdqcpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kstHqycq; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kstHqycq"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a1da7cafccso119006685a.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811525; x=1724416325; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfdvYEITLctEiJZFaHWRY9JyibDLYc0ZAVB9q9sxkkI=;
        b=kstHqycqZQvcACvnkrPKylWeUtgA752eTH5P0DHk61Gw0P0VNIWKvtZwbcABdZtcz8
         LxowzRWb+YXeaCXTxnK+T6MDn1aDXMMrjWmgflyOQH1vZc+y0JBv++csjZzlanGT3Z4u
         vZNRyv55weOdY9iK9cB0rHfJLyJKagzWtlS4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811525; x=1724416325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdvYEITLctEiJZFaHWRY9JyibDLYc0ZAVB9q9sxkkI=;
        b=qAAUSeR1sVTvMkxr/w6yp+0SVEu1cbfsUuviWlYmeRqV1tSHOt/OahLlK4k3jXa90I
         wmuIBHPYvmUyMeofQk71qnLStEhJpdi3DaRkAShlSVUC/8B2GmK5LiPvJ/FTjR+ShGdW
         zezHR2XdvKxY5x51VQ7OqyWQdKI+WGIL3J2snAQ5GM2/Ex6H6YeGNYQ/PTxdHcMT99T9
         1/rb+PMALjQAJIdSpdE63sTROz7mAFiiYjJPmwoxZc6fmasOOFM896PKzQsm9KjjG7Jm
         t5B6eyGpm9ajr9m3V5Oer08kt226rmE6HHiPfdkiLTH4tQonc8cr2q5Rs2sI3gwlwdoq
         t2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdnGFvleCn0xKzNLsSpYKyFc1MiBCG1jtq1BplAe3b4NgY4GIow+Qj/Bz9EvdTV1d4x1LjaZTtGM6tWPcV@lists.linux.dev
X-Gm-Message-State: AOJu0YxgyI0X/O1JxToMU3/4BE/T5YTP1Bgc6rPb9SzBSKvUivmmZthE
	SuX+bvxdxXHc+gL3TN+/TLbLvOAt3QShDz1UGI7GcVF86hX11KexT5ybp8HsLA==
X-Google-Smtp-Source: AGHT+IEykfMYCYnAHIqKejoI5UsxnxEpAhtpapnpWCBE4rLm0ZmyJu5Jr8Cmioy5du0vYTkAoMT82A==
X-Received: by 2002:a05:6214:4520:b0:6b7:ae86:e33e with SMTP id 6a1803df08f44-6bf7ce59f5cmr23889246d6.37.1723811524592;
        Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:00 +0000
Subject: [PATCH v2 2/6] media: i2c: ov5645: Refactor ov5645_set_power_off()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-2-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Factor out all the power off logic, except clk_disable_unprepare(), to a
new function __ov5645_set_power_off().

This allows ov5645_set_power_on() to excplicitly clean-out the clock
during the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5645.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 6c2d221f6973..0c32bd2940ec 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -635,7 +635,7 @@ static int ov5645_set_register_array(struct ov5645 *ov5645,
 	return 0;
 }
 
-static int ov5645_set_power_off(struct device *dev)
+static void __ov5645_set_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5645 *ov5645 = to_ov5645(sd);
@@ -643,8 +643,16 @@ static int ov5645_set_power_off(struct device *dev)
 	ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
 	gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
 	gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
-	clk_disable_unprepare(ov5645->xclk);
 	regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
+}
+
+static int ov5645_set_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5645 *ov5645 = to_ov5645(sd);
+
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 
 	return 0;
 }
@@ -686,7 +694,8 @@ static int ov5645_set_power_on(struct device *dev)
 	return 0;
 
 exit:
-	ov5645_set_power_off(dev);
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 	return ret;
 }
 

-- 
2.46.0.184.g6999bdac58-goog

