Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727E73C2A
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-401da71b85eso11469835e9.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307466; x=1695912266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFHoFBATjyYAR3S3Kihiw7DM+oB505Wu13vuO5lq7BQ=;
        b=dvj3F33gFSwLLhr0LeK3nJ7C2WRhMwVZY+QOsV0vvzwH6Qbxok3nTQWvnIbvlKWHCJ
         USmoRtbenhuhSyiAs02qE40hAacILwbDQAlY+zRxYWw3gU0MaCNnQnHgd3bXnEldtNqk
         8JT0tem+/fr1gQoIfdvfhX104yfdmRuUrNT4f2z187aTJqgHhqULdpHj1Bug+GRPsIKI
         SdTFWVtNapUb2asyOmNuvQ58cbB0H+cmM0qzaYbauAXvaHgOB0XMaoLIbNFf21FGyyCU
         j80j04dXLGn0dHOAnQjb35ew85kqUuKdHFYR5XpA25ye7x/sMmR4fiTZLV6ck6m97EU7
         ENSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307466; x=1695912266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFHoFBATjyYAR3S3Kihiw7DM+oB505Wu13vuO5lq7BQ=;
        b=P7JJtrZZttiKuc/sNxrgkAvsyie+hl27iLZ3Gg41ORM/Ao1l92jFxw6+tfuds0L7JH
         7jMfOqvHqAvl18GvNpxalZTFUrStTv68CrtU/Qgbh8+8QE41zrKHPHf/tZXHzlK296z5
         KGrBo7VmABg5IQ5A6ihSYEPejpZiByxxuvOiRwoZIQ480H9YbD2fsY+oVHBGcdI64h0t
         MoPqQkZty81TVdCqLvCEHhTB7Z6fMmM75/5Kudrayzug0q3HXkrl/dBOaMWLYDFg/+D3
         jsNEApurknKjDhKKIz1sJkFoBrdMpuLeC3T4bx0izI7ERoqkE4TXvVlwBsAugOj1DfVO
         ping==
X-Gm-Message-State: AOJu0Yykh31n6PDLYdnp6+vcL4qfksqolDiOZAFi2+XVdKAqbQnp+L2O
	I/vnvXttm/qKv2Qh7GpOQ718s7fpBFUbOJ5faxz+MB6D
X-Google-Smtp-Source: AGHT+IFyRSQ9sVI6svVzHUR3normBxbHxw1ADHwq9tPPMiHuaAAm+CM2HzCwtdqMZnvyJVaEdPWyUw==
X-Received: by 2002:a7b:ce15:0:b0:401:daf2:273b with SMTP id m21-20020a7bce15000000b00401daf2273bmr5282558wmc.12.1695307465779;
        Thu, 21 Sep 2023 07:44:25 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:25 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 15/19] staging: iio: resolver: ad2s1210: read excitation frequency from control register
Date: Thu, 21 Sep 2023 09:43:56 -0500
Message-Id: <20230921144400.62380-16-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921144400.62380-1-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This modifies the ad2s1210_show_fexcit() function to read the excitation
frequency from the control register. This way we don't have to keep
track of the value and don't risk returning a stale value.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index f1ffee34ebbc..27294eff99ef 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -78,7 +78,6 @@ struct ad2s1210_state {
 	struct regmap *regmap;
 	/** The external oscillator frequency in Hz. */
 	unsigned long fclkin;
-	unsigned int fexcit;
 	u8 resolution;
 	u8 rx[2] __aligned(IIO_DMA_MINALIGN);
 	u8 tx[2];
@@ -202,8 +201,6 @@ static int ad2s1210_set_excitation_frequency(struct ad2s1210_state *st,
 	if (ret < 0)
 		return ret;
 
-	st->fexcit = fexcit;
-
 	/* software reset reinitializes the excitation frequency output */
 	return regmap_write(st->regmap, AD2S1210_REG_SOFT_RESET, 0);
 }
@@ -225,8 +222,22 @@ static ssize_t ad2s1210_show_fexcit(struct device *dev,
 				    char *buf)
 {
 	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
+	unsigned int value;
+	u16 fexcit;
+	int ret;
 
-	return sprintf(buf, "%u\n", st->fexcit);
+	mutex_lock(&st->lock);
+	ret = regmap_read(st->regmap, AD2S1210_REG_EXCIT_FREQ, &value);
+	if (ret < 0)
+		goto error_ret;
+
+	fexcit = value * st->fclkin / (1 << 15);
+
+	ret = sprintf(buf, "%u\n", fexcit);
+
+error_ret:
+	mutex_unlock(&st->lock);
+	return ret;
 }
 
 static ssize_t ad2s1210_store_fexcit(struct device *dev,
-- 
2.34.1

