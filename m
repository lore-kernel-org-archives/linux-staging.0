Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBE5658AE
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:26:02 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6c644a1845cso402680a34.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008361; x=1696613161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjPcJpinx/2oZi6yDOcic02ZSonPgH6LaRKRfAMz/Qo=;
        b=Z/0wzwQTUxtpgYbFAyToiwnI9F9EkY86I558S5xB0/9TAh4+4dOi1RrAV81gxm6rbe
         nNiOeElg2e7eu2stVuJjKh6EtY3X7wygyXXAkm2tsWrfQXfHPwRSoMlGBBCtIeyZ6Sus
         p7mrFcsCuhFnPvz5ClptKKNpZz5HDyQreAOoG3iyJ/rsVqA7XYVTnFbvN7mM3sTt6sKK
         SzU+wOrFBVc1eMOme7m5Qh3fdKuPSDKKlUMB0v8HuBLJ+E6X2YpE2jSSlj7OOIB3RfQY
         z1MUKVyAF/oEi7cYmmvpPHgRep60J9ec3BefaFj4mZdb3vKbA8nzFEpS6hghDAKVHNlX
         CHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008361; x=1696613161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjPcJpinx/2oZi6yDOcic02ZSonPgH6LaRKRfAMz/Qo=;
        b=bdJIHBRfAQ0/BudHHM5lmht8tlC89Kf7Ro3KN3EhmvoORIWgZkEQxQ23TuyKxxS3iU
         KMrZ5eZ4+Xuc62JuQIC0mVlB/Z67YWMu3IopAhBMLhuxtgFL0hD8/02Cp2SIJXONSP/i
         EdyFzCcNcBFEqJZBAozoxoY+V7B1qn8/zI+mxZluJrMP/LW2laARSQ048k3Lv3LvLpC9
         a/GgWiza/Ig+0+OgmS3tPRI97iLFSw9QK+DUzWe6pW0cchaDc3f6r8voPOFV2emZBnJw
         4ur69gD6CSwWb0q+lU97vFH2xgp2kOymonz4jrFbAqubVzrPoHSMytffrcaKSFqxqZ4S
         UaAg==
X-Gm-Message-State: AOJu0YzZckNF9HSXp5JWBIkw4NFkADYGGLaekdGwuEb0wc/EMQ7GL6J3
	dK5IFHpoB5LcjTgqVaNHi1qGew==
X-Google-Smtp-Source: AGHT+IEU7xTxC2XhMOwTtgm0vgklQ781pNwhnGaa2Z5tu0SKY+s5O96AmKgrtXu11x/eKzuKi97bUg==
X-Received: by 2002:a05:6830:11c6:b0:6bc:de9b:a3e6 with SMTP id v6-20020a05683011c600b006bcde9ba3e6mr5194286otq.24.1696008361316;
        Fri, 29 Sep 2023 10:26:01 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:26:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 16/27] staging: iio: resolver: ad2s1210: read excitation frequency from control register
Date: Fri, 29 Sep 2023 12:23:21 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-16-fa4364281745@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

From: David Lechner <david@lechnology.com>

From: David Lechner <dlechner@baylibre.com>

This modifies the ad2s1210_show_fexcit() function to read the excitation
frequency from the control register. This way we don't have to keep
track of the value and don't risk returning a stale value.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes: None

 drivers/staging/iio/resolver/ad2s1210.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 28ab877e1bc0..b15d71b17266 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -76,7 +76,6 @@ struct ad2s1210_state {
 	struct regmap *regmap;
 	/** The external oscillator frequency in Hz. */
 	unsigned long clkin_hz;
-	unsigned int fexcit;
 	u8 resolution;
 	/** For reading raw sample value via SPI. */
 	__be16 sample __aligned(IIO_DMA_MINALIGN);
@@ -206,8 +205,6 @@ static int ad2s1210_reinit_excitation_frequency(struct ad2s1210_state *st,
 	if (ret < 0)
 		return ret;
 
-	st->fexcit = fexcit;
-
 	/*
 	 * Software reset reinitializes the excitation frequency output.
 	 * It does not reset any of the configuration registers.
@@ -232,8 +229,22 @@ static ssize_t ad2s1210_show_fexcit(struct device *dev,
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
+	fexcit = value * st->clkin_hz / (1 << 15);
+
+	ret = sprintf(buf, "%u\n", fexcit);
+
+error_ret:
+	mutex_unlock(&st->lock);
+	return ret;
 }
 
 static ssize_t ad2s1210_store_fexcit(struct device *dev,

-- 
2.42.0

