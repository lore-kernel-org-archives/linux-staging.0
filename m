Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617C3B47F4
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826192; cv=none; b=eoN0sSuHT1ho6HhpfInK2iJ/6TctemvMqyHAShE/48u0xCkCuNb/d+IQ9wPJQo1dttaQos7YO50zgyuB0CKmk2fUVlAynlub7flTsK+gOCusbnnGafcy0XEDKSWg3lXbKQOXwXIwLh9LK4oDH5uCvKL4b6jS2hdRGNtCJh0pXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826192; c=relaxed/simple;
	bh=sYny+vMdKGhF7mpPlyKtngiOJKnDYbHDcPfb5D/jrWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cEqdwbXrD9tBuHMizssv4HDMXvrBrbCquAvp6pQJN7V1IVAPo2/nG9WhhpjfKppcf0jeHFz77F8RMg0yOuETDfTpCjCgFOFdAGvTNoG01utU4RchNMbADyNR91IYB/fsaV1CXfgcn0/6xKhvH6686wKwoqOC5CT0+cXhK/O0q4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcyPtVg/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcyPtVg/"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so3467547a91.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773826186; x=1774430986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRjHGTziGVvd+VSh4h4J+ikp9tkHEYWZDQCls0MWsNc=;
        b=HcyPtVg/QPEdaXr2h1veb9f6P/1YKzBgQI8NSisMNp3lManNoaJBII8VN/9XjSjLv1
         h6X3rioi0fht6N1bJhJApfQp0S49LkwhOHcdr3xktu/Bu5EFuiYWKB+HDGvQd7qs56oD
         VgPQYnsqVjekE4qDyWZCnY1zQOj/AEghaZ3PmiS+pniQSagj/Do25zLec1fZqG+xqVGs
         7PluNDknF2xWxQmQ7R/57mAUKdqvQiEqsbpnctnwbKMYGbnVJwnZpkyCB4W3iFRPJIdy
         R1XKdVGVOpbEqjnfyARBW4vHmU//74gKxU7D971V/VYUNWPUfBrCWPQSHgVqMMjxWJ9V
         2HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826186; x=1774430986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRjHGTziGVvd+VSh4h4J+ikp9tkHEYWZDQCls0MWsNc=;
        b=OoM/XGbDjnI3ZK6A/RkP4Pw38oJUIrnA40+MdhMwlQAOwSbOPQhkqmBVHC3fIV/oU2
         aeaOWsX2QRwCyQjj1qmzJOrIhc12JJQZ0PpIFqDsB5noVBhpbCcypDEFyHeSB9hHo5Un
         euKCzhdir0Vc6JjR60akSX4diblkqr44r8AEcJ4nA8xbH9cEtIFXgyVFAfUQKqJeQ0lq
         1Jd6YPERRwYllmZkzeDpWs2zODua7Vu+Oi3eORR/KLAelQm6T3m+TWVxyz/u3jG75d0o
         Ez08fmFKbv6mKeLMpD4l2X6EcIfySca+aCEPQu8L6ii0roDD8scx6ta+Wvq9Z8TgO+Y+
         ghEg==
X-Forwarded-Encrypted: i=1; AJvYcCWNgpkwDeSg2prbAdaqFVN+6HcWPfGDZZKj5694MAQNtVlSF/tGlX8IFZtYb//rB0suW/x18U2vy/nPVIGU@lists.linux.dev
X-Gm-Message-State: AOJu0YwZLUMklmeoJkDS9C9g0DKawe6DnLpd3XsMTFp3fXjijsFFWLQZ
	cKSfIrTlzHoIoFWq6exGqFot2QN93ffppk/hFr7Mx7MutYBZeMF7O76T
X-Gm-Gg: ATEYQzzC9xRQ1mVCl70EdNbFWdnKzxgzz2HY6Fny+MSRbh3C2qdwD4rhWwWQKpjAAA9
	mWRvIDQuu/AdKkKpDVZYh7aFocCQ4QdS3egCgG8O3jO5dUM5F0mrt2SaPGzAEuAvQYOPMwaXmFz
	HzDKMfY2g5L1N8mVw+PBuus4xTNj4ai5m5NAf4+WCoLYbAPn0NgRofzDiycF/LWCdsSUP/ddEl7
	dXWaEmasKcB40aMCMVp641ys9Ic8l7o4RZf6W/iPmZuBWiywwJ0Xka7ruIplc2pmeJGvHi6UBNy
	FoFoD1rmaYu0JZkUqtKgqou05LBvtZUrvdffcwL3o/Een22qVWUMKXX6ggdbMgc+9Nz3LoJ6HbH
	S8E0uXWr6sfdx8jczxB/mav6FOB23ZGWeSr16OfKBebD1oVVVYaGjrjkE+rpMeoT/KaSDfaUEGw
	LJ5GpJH/bZwoSRCtSm9gVvSX9pN67WKVMtMuBh6oVVNc0uqHwpGOSv2/tn4JELKYK4nfcXbiQ9
X-Received: by 2002:a17:902:ebcd:b0:2b0:6f20:8044 with SMTP id d9443c01a7336-2b06f208484mr22527175ad.43.1773826185599;
        Wed, 18 Mar 2026 02:29:45 -0700 (PDT)
Received: from debian.ari ([152.58.182.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e616351sm21168315ad.67.2026.03.18.02.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:29:45 -0700 (PDT)
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
Subject: [PATCH v5 1/4] iio: adc: ad799x: use local device pointer in probe
Date: Wed, 18 Mar 2026 14:57:12 +0530
Message-Id: <20260318092715.42538-2-architanant5@gmail.com>
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

Introduce a local device pointer 'dev' in ad799x_probe() and use it
throughout the function instead of accessing &client->dev repeatedly.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ad799x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index 108bb22162ef..9825abc9285d 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -783,6 +783,7 @@ static const struct ad799x_chip_info ad799x_chip_info_tbl[] = {
 
 static int ad799x_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	int ret;
 	int extra_config = 0;
@@ -791,7 +792,7 @@ static int ad799x_probe(struct i2c_client *client)
 	const struct ad799x_chip_info *chip_info =
 		&ad799x_chip_info_tbl[id->driver_data];
 
-	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*st));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
 	if (indio_dev == NULL)
 		return -ENOMEM;
 
@@ -807,7 +808,7 @@ static int ad799x_probe(struct i2c_client *client)
 
 	/* TODO: Add pdata options for filtering and bit delay */
 
-	st->reg = devm_regulator_get(&client->dev, "vcc");
+	st->reg = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(st->reg))
 		return PTR_ERR(st->reg);
 	ret = regulator_enable(st->reg);
@@ -816,17 +817,17 @@ static int ad799x_probe(struct i2c_client *client)
 
 	/* check if an external reference is supplied */
 	if (chip_info->has_vref) {
-		st->vref = devm_regulator_get_optional(&client->dev, "vref");
+		st->vref = devm_regulator_get_optional(dev, "vref");
 		ret = PTR_ERR_OR_ZERO(st->vref);
 		if (ret) {
 			if (ret != -ENODEV)
 				goto error_disable_reg;
 			st->vref = NULL;
-			dev_info(&client->dev, "Using VCC reference voltage\n");
+			dev_info(dev, "Using VCC reference voltage\n");
 		}
 
 		if (st->vref) {
-			dev_info(&client->dev, "Using external reference voltage\n");
+			dev_info(dev, "Using external reference voltage\n");
 			extra_config |= AD7991_REF_SEL;
 			ret = regulator_enable(st->vref);
 			if (ret)
@@ -853,7 +854,7 @@ static int ad799x_probe(struct i2c_client *client)
 		goto error_disable_vref;
 
 	if (client->irq > 0) {
-		ret = devm_request_threaded_irq(&client->dev,
+		ret = devm_request_threaded_irq(dev,
 						client->irq,
 						NULL,
 						ad799x_event_handler,
-- 
2.39.5

