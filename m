Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8B71
	for <linux-staging@lists.linux.dev>; Tue, 11 May 2021 20:54:06 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id j11so15677782qtn.12
        for <linux-staging@lists.linux.dev>; Tue, 11 May 2021 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZxFj0ccRxKQQbjYoJjS1IKzFQXvXDhwcAqvWSKfVmnU=;
        b=sQ4VMQmbrMV7yPR1Qc3XFEWSWnjSee4xuYcU7j9ovloYCbJeq37CV7LPsY3UF16ULV
         1N6YwbKLLh2hS/JItDH0Zi2oyACuoxQz4nAcPwSj3tDIg2PGxYsOooPOHCTYm7xHZaLp
         ceBjPymEqBa37C+sTlmFJ2fYHuJ1XJ/RdrniefWfKobMOCgKVEcRAlzUNvB+sZmjI859
         fqPDllnbUX15XH4924WsAbGuXG0aDnVYOfLMPTY9A/W2Ihjf1F6iFWIY4ADMTRt4gdbt
         bywkTkv8ivMK2/H+th1OjCeqr9QcW5y7YclycAcccxttnzvg2gPdGY/oqN9uazaDXjVL
         wTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZxFj0ccRxKQQbjYoJjS1IKzFQXvXDhwcAqvWSKfVmnU=;
        b=so1fsBlfyWBhwXTfnJJwbnk1aIItKKryB5HvQS+KHID8MRAGE71n4NJyDYfQP5met2
         HIIbalD/pinf3Mi63Ml4QZ52U9znq0/7mmwCyAu5/bkFNUnTDd+9SP2Psms7ECEgYsr2
         ii76gBwy3Xw0eJbdzMhvC95Blg1DLGtuWhhuJ9OpEk1x3BbutMfz18MJMcfeG/+/uhPd
         H2D+smoNCP33eWVFLXZNE84xC1eZRl8usDa/2N/FmldKYNNZUhKHmM3o8SOXquYQSpZQ
         xPr8lcDBV7oDmVjsUFISs03PT8ZnOanhQAmgYZm/ua34ivBr9BRjovyUav2oWVkLUDcR
         nVBg==
X-Gm-Message-State: AOAM530X15jZGbrNYAbDKHaeE5BwW/3dX/DN6BC+X+50BdRP3VN8Wa1l
	vYUjGEACEZ2WVqWVy5s+kIU=
X-Google-Smtp-Source: ABdhPJxaziLBqRYjQK3sY8CA90daeQi0PBrtno/UAMRXnQHPfPnSmDnNmszGkrgMNugb0iATYZq/kw==
X-Received: by 2002:a05:622a:208:: with SMTP id b8mr28982925qtx.28.1620766445185;
        Tue, 11 May 2021 13:54:05 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1002])
        by smtp.gmail.com with ESMTPSA id y12sm13268960qkf.5.2021.05.11.13.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 13:54:04 -0700 (PDT)
Date: Tue, 11 May 2021 17:54:01 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: iio: cdc: ad7746: clean up driver comments and
 probe return
Message-ID: <687a1923add71303da13e3a838e97a6ffc7dcda7.1620766020.git.lucas.p.stankus@gmail.com>
References: <cover.1620766020.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1620766020.git.lucas.p.stankus@gmail.com>

Remove vague comments, align temperature comment with indent block and
simplify probe return on device register.

Also fix the following checkpatch warning:
CHECK: Alignment should match open parenthesis

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---
 drivers/staging/iio/cdc/ad7746.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index dfd71e99e872..e03d010b2f4c 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -84,10 +84,6 @@
 #define AD7746_CAPDAC_DACEN		BIT(7)
 #define AD7746_CAPDAC_DACP(x)		((x) & 0x7F)
 
-/*
- * struct ad7746_chip_info - chip specific information
- */
-
 struct ad7746_chip_info {
 	struct i2c_client *client;
 	struct mutex lock; /* protect sensor state */
@@ -232,13 +228,14 @@ static int ad7746_select_channel(struct iio_dev *indio_dev,
 
 		if (chip->capdac_set != chan->channel) {
 			ret = i2c_smbus_write_byte_data(chip->client,
-				AD7746_REG_CAPDACA,
-				chip->capdac[chan->channel][0]);
+							AD7746_REG_CAPDACA,
+							chip->capdac[chan->channel][0]);
 			if (ret < 0)
 				return ret;
+
 			ret = i2c_smbus_write_byte_data(chip->client,
-				AD7746_REG_CAPDACB,
-				chip->capdac[chan->channel][1]);
+							AD7746_REG_CAPDACB,
+							chip->capdac[chan->channel][1]);
 			if (ret < 0)
 				return ret;
 
@@ -564,10 +561,10 @@ static int ad7746_read_raw(struct iio_dev *indio_dev,
 
 		switch (chan->type) {
 		case IIO_TEMP:
-		/*
-		 * temperature in milli degrees Celsius
-		 * T = ((*val / 2048) - 4096) * 1000
-		 */
+			/*
+			 * temperature in milli degrees Celsius
+			 * T = ((*val / 2048) - 4096) * 1000
+			 */
 			*val = (*val * 125) / 256;
 			break;
 		case IIO_VOLTAGE:
@@ -669,10 +666,6 @@ static const struct iio_info ad7746_info = {
 	.write_raw = ad7746_write_raw,
 };
 
-/*
- * device probe and remove
- */
-
 static int ad7746_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -730,11 +723,7 @@ static int ad7746_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = devm_iio_device_register(indio_dev->dev.parent, indio_dev);
-	if (ret)
-		return ret;
-
-	return 0;
+	return devm_iio_device_register(indio_dev->dev.parent, indio_dev);
 }
 
 static const struct i2c_device_id ad7746_id[] = {
-- 
2.31.1

