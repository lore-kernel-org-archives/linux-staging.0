Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1ABA3A
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3200bc30666so947591f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306165; x=1695910965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFHoFBATjyYAR3S3Kihiw7DM+oB505Wu13vuO5lq7BQ=;
        b=16lotpLqSe4LaMn4PDpwyklUu2ppWQ//FIq5uZulMC6OdBFdaKBf3ooWa5L4mkfGuU
         XnDOCfbgxOWv3Im+0Ot64Y5SZjMm93dvznx7H6oQSEJ2Fu++yJSJEOGsEPScjiAu/0jF
         HbqFLqRmwvXG0IpN0y0xKwc1ZflaHBuc8Vbqd0+9zgNOZ7qOGqpExbi63alPvHeCM2rr
         hoAFmG4n6hZs2y5phGjBUOEaa3AmTe26cSOWmoEUAC/5Xt8YOYME6A2X7rPqrCKYNTO3
         i6CBbv60YcJ+dM5ho5A3PbNFZ5vHFIpuAZjk6Qkmhg22PN8l3Sonnn4Hv6ZEWHjcHymV
         sBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306165; x=1695910965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFHoFBATjyYAR3S3Kihiw7DM+oB505Wu13vuO5lq7BQ=;
        b=llJaKDOpD1JGw5222SqD3iAhQVpC6hd/3jTtCm6CMP8gBkYw5ISZNZf0kzIVVor83+
         03RkerRbnxfypY43o5E/qfb2bZDEe8gGB9biiuIjsNv1iFGIulClYwdwkuoo3/ujvULa
         yCTO3vZopw9+6x7P62mI5VHgwdwNHS7dz5R5rssz5Vs2RVjVCWndgEdZS9T7E7w553G0
         bz/hItSE79clJoKRrVpkqg2VD6oODjGNuYXRfUlMwNi7E1/yJ5jheyiSwXjdO1wh3P6Q
         s+06nQQwvqFUWZcGcJXu0OnC0GcoKqgrIBYSMrf5XfwlSdBp0w764lZgOAENYMqHYVUC
         xkPQ==
X-Gm-Message-State: AOJu0YySCJorR/pNx5xg5uWXkcQGuMoJ6VjBCjKeVSKp/UcPGYhEjNq7
	DIrLQ4PN0J+PLvEXvaSJRCvp8A==
X-Google-Smtp-Source: AGHT+IEuEQ+yHcKXMmNkfUgwvUgJV0TYHVRrMSBE2WgINBdiZLHbPgjRXkTk6HjPHk2lj+d6o1Or/w==
X-Received: by 2002:adf:fb47:0:b0:316:fc63:dfed with SMTP id c7-20020adffb47000000b00316fc63dfedmr3915975wrs.39.1695306165716;
        Thu, 21 Sep 2023 07:22:45 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:45 -0700 (PDT)
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
Subject: [v2 15/19] staging: iio: resolver: ad2s1210: read excitation frequency from control register
Date: Thu, 21 Sep 2023 09:19:43 -0500
Message-Id: <20230921141947.57784-18-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921141947.57784-1-dlechner@baylibre.com>
References: <20230921141947.57784-1-dlechner@baylibre.com>
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

