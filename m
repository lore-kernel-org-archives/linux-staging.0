Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE87234988
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032236; cv=none; b=gp8Q9CmrUxDkvhagOHYmQ3HruFngM8i/anQAv66Qjp0pHucHQRF/rgNuodRUPL53tPGdKzYzgbdLDXj/2HJPqib780NtjxQT8sMZEXPQw8S/rfmo/Oz91Dt5+Ke7aKjosMjLlRKYkpp6ZORjt6cpz1/fKB6Cwn8QqDb0uBnGtjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032236; c=relaxed/simple;
	bh=UAbB4w7E4m1mLCo3yn77rgKxnrpnomzpIaADSNtpcM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MjZbVNR8ws/pKi7GA3h5xT8zDR0UYXnt7YobkGlDgejRsE3nrMZPenNSurQiyxcjGWyFOEajDpCtQwQHHEKs536jgTNEpdSeMhA3hb5aqtdN2wc/fEAcRGuHgjMaFNdo+FeVpHN5RP6PVCC+yzFj0gm/EMbtC84KC1Bwavww5/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyRiq3K1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyRiq3K1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22355618fd9so83407065ad.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 12:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032234; x=1741637034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QrbUEFY/lf1OjHUcnLJiKmmiRtzC2NeD0FfZjZlPltM=;
        b=FyRiq3K12fegGU88DX3gruAWTXda/A54UoUdRZ5x8HoCfgbPDt91g67wvailrL8FoM
         Hv6bjriEsdTrhB4i15WSUX5luQB141YH5Z+LA1ti3Ol1MvSnJJHmZgC2HcMOXbOO0SJM
         5i8gmW/0bif7083ev1HQQIteDT4PudKQ66dTB4UeEW6YKE7guHfMQCglkVOaoQMky09K
         o++u0SKnlQzuDB9+QR3rlpfmso4OKBQ9llG+B5tA06DuXxURkIdzRm/rCzeSklxjPXAL
         JXSiPkHDzWbHtNjUubwW3gNLIvgnHP+es3NQyRnS3C7XV5EypplTqRKNimFAUMXHtT4E
         ZJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032234; x=1741637034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrbUEFY/lf1OjHUcnLJiKmmiRtzC2NeD0FfZjZlPltM=;
        b=deiZLimomqoYoiYNs1cTBcl/9jNS6zHz1dyEhm65oPYaNvAIfL9lQAuF6w0Qn8NGW8
         3+SUL7RRg9/wD0NGxFytdgClBHYBtl78IHWhYKj5PpznLdyVbN6UwTmPAkI3IRksqV47
         AE1ipbYW1c1CsGbsL5fWvh73urdl4FbFomz5OHrxSLOWSPx7ZpveC0mCKGH5wKFz7jqZ
         DzMmBHQ28fwKkCfQuuHtwN/5f39+oVRR5cuoWGTWpVUy0KRHN5d2DsGUQ1pSsRbB56gk
         mM/jQcm+YRTDyxD2Wwp6aQK64RN90y6G7Bpib5sjSHYe4SNsHbJLDUzFysE9prul/Ec0
         JNyg==
X-Forwarded-Encrypted: i=1; AJvYcCXqsj0bQEihJ55mTI0CqR3M4UQ9YX05dU6mh6bKfY+gcx0Xs5FA3pAboT3t922hyd75TxpiLLhxt4TGAGsO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2CTCK/MujjtAkh7WkPIfIeqNYXCkg2j56+6J9vmMxqjgum2a6
	6O3WKGIHI3ucWvdR4hbOj+zkVJmc7g/lers4z/UKhjWrK3L5SHp8
X-Gm-Gg: ASbGnctPybCMODGP7HMuZD900vAd6+Cu6/tJktzp8M90ejNrvNlEFfHWVt6gglfTuDy
	rkT9nn6gpCAS/wJjrnKeqhNm7A7XacIcBd5F8dXdFypBU5VVZHDh9vPEyC5PIGusWIw4S9ttHGi
	WTzmS5q/CU48fM0boGkj2YF0aJypqpkO5jkgD5sYoZdyRigyeeuBMUBkCTXopjnqtn4TKNqX6cI
	8Az901Fgy/Ie/kXJXInqo6qx2T2Arms7lyQK8+6iiBnS8JRWTKj0QCnb8GpPDGtqeflnBjCGo6q
	RAtmpolyzwVYwkhoLz8QXl9AsLhll4vu+AHXME0RNmFKhhfV2HCmsWlSSyJ184hw19zm
X-Google-Smtp-Source: AGHT+IGBy0TApsj/0F8MuCfPPS47j68Bagj1kWLrrh4wS/ICtMfKU9/DC6Sypb+Zn2+4m3XFwPu+Kg==
X-Received: by 2002:a05:6a00:b90:b0:736:61c9:f9a6 with SMTP id d2e1a72fcca58-73661ca04c0mr4127339b3a.5.1741032233820;
        Mon, 03 Mar 2025 12:03:53 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm7266779b3a.60.2025.03.03.12.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:03:53 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [RFC] staging: iio: ad9832: Use devm_regulator_get_enable_read_voltage()
Date: Tue,  4 Mar 2025 01:33:47 +0530
Message-Id: <20250303200347.23354-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_regulator_get_enable_read_voltage() to reduce boiler plate
code.

* Here I am particularly confused about regulator_enable(), part where I should
  use devm_regulator_get_enable() to enable avdd supply?
* I can resend this as a patch if everything is alright, specifically with
  devm_regulator_get_enable() for dvdd

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 37 +++-----------------------
 1 file changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..9e7975265454 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -74,8 +74,6 @@
 /**
  * struct ad9832_state - driver instance specific data
  * @spi:		spi_device
- * @avdd:		supply regulator for the analog section
- * @dvdd:		supply regulator for the digital section
  * @mclk:		external master clock
  * @ctrl_fp:		cached frequency/phase control word
  * @ctrl_ss:		cached sync/selsrc control word
@@ -94,8 +92,6 @@
 
 struct ad9832_state {
 	struct spi_device		*spi;
-	struct regulator		*avdd;
-	struct regulator		*dvdd;
 	struct clk			*mclk;
 	unsigned short			ctrl_fp;
 	unsigned short			ctrl_ss;
@@ -297,11 +293,6 @@ static const struct iio_info ad9832_info = {
 	.attrs = &ad9832_attribute_group,
 };
 
-static void ad9832_reg_disable(void *reg)
-{
-	regulator_disable(reg);
-}
-
 static int ad9832_probe(struct spi_device *spi)
 {
 	struct ad9832_platform_data *pdata = dev_get_platdata(&spi->dev);
@@ -320,33 +311,13 @@ static int ad9832_probe(struct spi_device *spi)
 
 	st = iio_priv(indio_dev);
 
-	st->avdd = devm_regulator_get(&spi->dev, "avdd");
-	if (IS_ERR(st->avdd))
-		return PTR_ERR(st->avdd);
-
-	ret = regulator_enable(st->avdd);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified AVDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&spi->dev, ad9832_reg_disable, st->avdd);
+	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "avdd");
 	if (ret)
-		return ret;
-
-	st->dvdd = devm_regulator_get(&spi->dev, "dvdd");
-	if (IS_ERR(st->dvdd))
-		return PTR_ERR(st->dvdd);
+			return dev_err_probe(&spi->dev, ret, "failed to get AVDD voltage\n");
 
-	ret = regulator_enable(st->dvdd);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified DVDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&spi->dev, ad9832_reg_disable, st->dvdd);
+	ret = devm_regulator_get_enable(&spi->dev, "dvdd");
 	if (ret)
-		return ret;
+			return dev_err_probe(&spi->dev, ret, "Failed to enable specified DVDD supply\n");
 
 	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
 	if (IS_ERR(st->mclk))
-- 
2.34.1

