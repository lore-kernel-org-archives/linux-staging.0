Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905EE6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 18:50:32 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id c3so6864257qkc.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V06g/V1PyEv48SI7Hy2SrXRWy5uxigOGYLsg44Gvu+0=;
        b=flQtyr4g7O0z7R1besBKPwzFccbfZHeZo/r1YD03lAB0h2S4w+etAKkwk9039/e5TW
         9hlM1xt1pUzntNZ73KIfw9Be26WhjVs5RR8LGpM+9mdG13KXoOcMUosrLxbFs0RJYrg2
         cOcpYZmb4rZAjcno68WG7NBtIOdPxKd2AckokMiKZN1kdYIgjDKXPgmzHNvaUIHSNzeO
         7f30TmhSszH/z6huOOTnRgeqfSWrltgxM7e3r2D/5Vj6b23DnySSCrYyYzJbKxX6r4br
         oZXyq3D0l9fPUFr/iCO5yuzMuqJdyFEjeqHuSdlp+2GgTkEeaKcUjrAbC70K3sI9Hw1e
         xrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V06g/V1PyEv48SI7Hy2SrXRWy5uxigOGYLsg44Gvu+0=;
        b=sSNVj8bGltxylgNLDeDv1XTzoM92DgTJUuQtKAgMu+3kYZZwSyLTXYAjfRrWESeMoE
         T9pPMLelLi45s9l8XpevGysJSHVrZhV7LRJJHrTV1wqLimvwEtY5NynUE5UkD2BoWGpI
         XI2ezGqK79WBTtFONzxrSRy6RhXdJcAU6lFhmVMXLQDGhArxPkgUzW5P7aSnSXEbuvbK
         EDZFwaTYR1sou2AgMwwsMYI6iiVTtMuDg1wEa/7DEOS1t3x/TTLuXZPQ7YQ15F++jpHm
         HFIqpESCYkh+4er6QUqK1RxRstObQ+UVseFKRbq9PIXdLU2j0t01KfVlQUk9rUDVcYED
         MfbQ==
X-Gm-Message-State: AOAM5333HJeztL0kg1ObzywL7MGeTvKwpuJBTlrWxPt8kdyV0TY8x7gC
	Up2Z81dvxQiE7T1nUZSrk7ffJu0n8ZOU8Izr
X-Google-Smtp-Source: ABdhPJyNkvxUdZ444gfxFwAZsyO1t3IEaIvmxGRhVd2xNTTWfiYLHqfkW6o8JphngO0hLlvc6uuFKg==
X-Received: by 2002:a37:5ce:: with SMTP id 197mr1236863qkf.23.1617994231748;
        Fri, 09 Apr 2021 11:50:31 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01:86f3:17eb:e23c:86fd])
        by smtp.gmail.com with ESMTPSA id n136sm2379730qke.123.2021.04.09.11.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:50:31 -0700 (PDT)
Date: Fri, 9 Apr 2021 15:50:27 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] staging: iio: cdc: ad7746: use dt bindings to set the
 EXCx pins output
Message-ID: <39486895e4e985d0220342f3accfd98a1e149ea7.1617993776.git.lucas.p.stankus@gmail.com>
References: <cover.1617993776.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617993776.git.lucas.p.stankus@gmail.com>

Ditch platform_data fields in favor of device tree properties for
configuring EXCA and EXCB output.
This also removes the fields from the platform_data struct, since they're
not used anymore.

Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
---
 drivers/staging/iio/cdc/ad7746.c | 33 +++++++++++++++++---------------
 drivers/staging/iio/cdc/ad7746.h |  4 ----
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index dfd71e99e872..63041b164dbe 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -677,8 +677,10 @@ static int ad7746_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct ad7746_platform_data *pdata = client->dev.platform_data;
+	struct device_node *np = client->dev.of_node;
 	struct ad7746_chip_info *chip;
 	struct iio_dev *indio_dev;
+	unsigned int exca_en, excb_en;
 	unsigned char regval = 0;
 	int ret = 0;
 
@@ -703,26 +705,27 @@ static int ad7746_probe(struct i2c_client *client,
 	indio_dev->num_channels = ARRAY_SIZE(ad7746_channels);
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
-	if (pdata) {
-		if (pdata->exca_en) {
-			if (pdata->exca_inv_en)
-				regval |= AD7746_EXCSETUP_NEXCA;
-			else
-				regval |= AD7746_EXCSETUP_EXCA;
-		}
+	ret = of_property_read_u32(np, "adi,exca-output", &exca_en);
+	if (!ret && exca_en) {
+		if (exca_en == 1)
+			regval |= AD7746_EXCSETUP_EXCA;
+		else
+			regval |= AD7746_EXCSETUP_NEXCA;
+	}
 
-		if (pdata->excb_en) {
-			if (pdata->excb_inv_en)
-				regval |= AD7746_EXCSETUP_NEXCB;
-			else
-				regval |= AD7746_EXCSETUP_EXCB;
-		}
+	ret = of_property_read_u32(np, "adi,excb-output", &excb_en);
+	if (!ret && excb_en) {
+		if (excb_en == 1)
+			regval |= AD7746_EXCSETUP_EXCB;
+		else
+			regval |= AD7746_EXCSETUP_NEXCB;
+	}
 
+	if (pdata) {
 		regval |= AD7746_EXCSETUP_EXCLVL(pdata->exclvl);
 	} else {
 		dev_warn(&client->dev, "No platform data? using default\n");
-		regval = AD7746_EXCSETUP_EXCA | AD7746_EXCSETUP_EXCB |
-			AD7746_EXCSETUP_EXCLVL(3);
+		regval = AD7746_EXCSETUP_EXCLVL(3);
 	}
 
 	ret = i2c_smbus_write_byte_data(chip->client,
diff --git a/drivers/staging/iio/cdc/ad7746.h b/drivers/staging/iio/cdc/ad7746.h
index 8bdbd732dbbd..6cae4ecf779e 100644
--- a/drivers/staging/iio/cdc/ad7746.h
+++ b/drivers/staging/iio/cdc/ad7746.h
@@ -19,10 +19,6 @@
 
 struct ad7746_platform_data {
 	unsigned char exclvl;	/*Excitation Voltage Level */
-	bool exca_en;		/* enables EXCA pin as the excitation output */
-	bool exca_inv_en;	/* enables /EXCA pin as the excitation output */
-	bool excb_en;		/* enables EXCB pin as the excitation output */
-	bool excb_inv_en;	/* enables /EXCB pin as the excitation output */
 };
 
 #endif /* IIO_CDC_AD7746_H_ */
-- 
2.31.1

