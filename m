Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFCC367
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 00:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219251; cv=none; b=tcLBcyz6yoX1odBzYxY4b1xHRcwB4V15qv9jYBfO8MGuf/YTnkjRYMiKgoNSMD9VfVjA5c/vPzvHPHyEDe/NUDHuUwBGqldnSFHpy8M1Zv6tgsgEX59u4e/uCBcLZS4O6AiiOxfC4Ldd5cz4CCMkUYqQT9zEcm9GkxZ1GURBDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219251; c=relaxed/simple;
	bh=39CDkvz6XO+Ri5q7s/t0liHhr7O/gnB1BvM5MuQxcsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ROhq1BZBsmRxx8n1iJGVlLQYunfDmXkoKQTCc6v0DqwtXd9oSJsKUsO+j9K5UNkQQT4dbMSH/Hy+meBnUclB+3Io6H7afXbHPHv0KP/mPDh/ML9EJLm2iM4p6hGTunNYu8BfLbErvE6wc7HlsLWtXW76MnFMarCVNOqhGBpW+D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbmCdeRC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbmCdeRC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239aa5da08so375275ad.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 16:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219248; x=1741824048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfpB7be3WQ+25k2CF8K/o3LEES2vCMRSkQKM3K3lwew=;
        b=GbmCdeRC4WTfQ97JQdtZvsrzATkV3kfWVd9A66TrWtL0as1mCY3I5IWnE9CU6RcaYc
         zvfbL+d2hFqD0nSJ4FFlu0KWDRjyNlCgoVG7bkwTB5bfFVB1py1fdwpScTJAsUAENeaT
         k3YXnfEMsWQZc2OZUxDhnyFbdVVYskZPv+KYxPLUpXRXKTOAIMr2sxhuV5RlbKcPyBNH
         KZboYlUIO+q4TfpLur+WE38gNmWdasBggpICa6ocoWj1WhRux+Kl47emKRLc22Go+Q9y
         uty9A2lYcJzV4I32W4RsF2gkOhY31TIS53mTW/ypreR82ePFxkGptRTGQyyoFuYxrpcC
         CFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219248; x=1741824048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfpB7be3WQ+25k2CF8K/o3LEES2vCMRSkQKM3K3lwew=;
        b=gGmgo5Vh5XWO5K8Rqd7gVcdWP3cyK1dAMSGCWACnRNBOwPQaheaUiqRUQRBwP5Q5Za
         K6lWVEilM+3kITnfPCimqzfqOfDdjj5d84aTMyBqryPwdxN6jErPzWbC3QUxgcRoJUux
         Q0MYgAlQDZMWjBQlQ50RqEkLjLrPREPzDrMx89xzzGuvnlx0d5N9AUoeFH1N4AI2EPYF
         78zvgyCj/OoJHHnJhniX5HXkKYzBqiEADhnEJ0ksoyuS2haUFmHRlLn0wdz+aUw2FAcf
         fQ2I30fG2J9W36KgKv8w5mbnN30NPiMwxLrTlFlcDDtoWpF+5htr/qDhzPYqo1zhSv2Z
         gJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsTIb12wvi2WXaPmjh5qpVlKZKpdYDBwkOfj9bPwaJvgNDRanzFTtWhlWmjWt62QloQwFnihksY2MvNZ3D@lists.linux.dev
X-Gm-Message-State: AOJu0YxI5vW4Qjlj9hBFlPQ0N8uPTo++k/yh96rl8d7Z8kfjgyz8k7V6
	5b0KWt6Na4aA5tO9BZmNvBQwEo4ZGd5apZ4Wo7Vm2mOTx4IYHdhc
X-Gm-Gg: ASbGncsPGI1cFzQN3khkCoZe4RfZplh3H1v/8k8AhnTgdCX83LRY8ZIcwcUGm2/5/ml
	KCyzLPi2NTPuzKEAcZIRA2jEDfJfRoSjGlbT+SMBvfRB1tj0h3CpQNel39coiqVNki2YbGrTxor
	4pKZSAFqyQ9XN2G+h284L5uCdDcWnhm1dCkrftzzzxxzB2+vWIpX3wLvHXaAMj3OkG5K/2Yu33x
	F9cE54o6NhER9+c1vH/qinv4H8QXFgp4zzx1/6Sf9BLTbvfgD9Syf87p/6ZuK8x/DGUQKesMCHX
	lpstywULQO3xVOxWOAjli77pdU53MZw+T22BZM3XiFu7yFwX90VLC1Wr9DVzcJn5AHs=
X-Google-Smtp-Source: AGHT+IFxHf1uKo8PUiFp492BtjX06i1u/Qae1B6ppFKhEAKyOZPZE48UtdR1xOkhQD05jGDzH74hrg==
X-Received: by 2002:a17:903:3ba5:b0:21f:ba77:c45e with SMTP id d9443c01a7336-223f1d81964mr73730045ad.45.1741219248439;
        Wed, 05 Mar 2025 16:00:48 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:857:3077:7768:d8a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddce7sm68625ad.3.2025.03.05.16.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:00:48 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH v2] staging: iio: ad9832: Use devm_regulator_get_enable()
Date: Thu,  6 Mar 2025 05:30:40 +0530
Message-Id: <20250306000040.1550656-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulators are only enabled at probe(),
hence replace the boilerplate code by making use of
devm_regulator_get_enable() helper.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
V1 -> V2: Fixed indentations and commit description

 drivers/staging/iio/frequency/ad9832.c | 37 +++-----------------------
 1 file changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..db42810c7664 100644
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
+	ret = devm_regulator_get_enable(&spi->dev, "avdd");
 	if (ret)
-		return ret;
-
-	st->dvdd = devm_regulator_get(&spi->dev, "dvdd");
-	if (IS_ERR(st->dvdd))
-		return PTR_ERR(st->dvdd);
+		return dev_err_probe(&spi->dev, ret, "failed to enable specified AVDD voltage\n");
 
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
+		return dev_err_probe(&spi->dev, ret, "Failed to enable specified DVDD supply\n");
 
 	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
 	if (IS_ERR(st->mclk))
-- 
2.34.1

