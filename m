Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB89BA28
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:46 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32008e339adso1007080f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306164; x=1695910964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWgDNsrrXF5syWEsVgdKbxr1ASE09oFAZQly/Ty6i74=;
        b=nafmdk9v6Qe8fOBJmMZlhO7SjxR5slpBf/P7xndzVFg35j5Eekb67LoDG4GNRe3tbf
         EK1HOjbKKNojPpFbo+QKhENOk7MkwAQeJuRREWY21BGJyBjj4t+HS9f5ugL9sBeGmON3
         hpeXzGVOnHeNCSYJkRxEPKBND0JovE4LEgheVhyS4q9DT2xA2TVNs/H2DxQZtKEg5eWf
         0QV/MugL0RWVE0V1YgmdUeTAaBYPV8fVv4wax4cvM9yAQUO8fxP7J8htiRUlXZgMzFko
         5emZ7WTuo9eAsv35/Uunetd+azSH4IgjYlBXUCboE8ZzVjDLe4ITkdOGFUe7i2yheyF/
         jWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306164; x=1695910964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWgDNsrrXF5syWEsVgdKbxr1ASE09oFAZQly/Ty6i74=;
        b=huPTaDdq92Rh7YhjK9EIN5TJO+/1xG7aWa9x3GwugCA41mG+97Cf57UVt7n1PF/0+m
         J7UszpDbXeu0X0fzslaUpINp8iUJhoH+qUwzbX7NpV++K8z6ICZR+Vk78yuCue/JMm7r
         aFbhNE1KRne7cksVkrn6OHAzG7kDBvcqTtORDWE0pGpyc/M+Pngp9MYAoqQ428II8kl+
         d6GT7B9L2dCZEvIp1lC/n6Ibm8N2BXfRtXO+UzaxWMK3NPoXcd0vfvUG1HYtiwk1gdp2
         XJYF/5QUdhjOgN6Y2JfgjJi8k5iC93RUENSNcbkiLCi9fPWxKOcjXgiuYvJEp8g1BgfE
         HnqQ==
X-Gm-Message-State: AOJu0YzQzSBQmXVIRmM4OBC0UYgUo+uW07wRUT8dtFnsOzUUDSI97VBR
	JGwPtoajAr8Slv1NPDJliy8hlQ==
X-Google-Smtp-Source: AGHT+IGRjZhp2R5sxkFWDdwbOa90jJSgYK4eOmJzrC4HUjAJ3wveQwXoDeexC2vjkJhYZNOJkJ9DkA==
X-Received: by 2002:a5d:5192:0:b0:320:9e2:b3a2 with SMTP id k18-20020a5d5192000000b0032009e2b3a2mr4841480wrv.33.1695306164753;
        Thu, 21 Sep 2023 07:22:44 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:44 -0700 (PDT)
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
Subject: [v2 14/19] staging: iio: resolver: ad2s1210: refactor setting excitation frequency
Date: Thu, 21 Sep 2023 09:19:42 -0500
Message-Id: <20230921141947.57784-17-dlechner@baylibre.com>
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

This combines the ad2s1210_update_frequency_control_word() and
ad2s1210_soft_reset() functions into a single function since they
both have to be called together.

Also clean up a few things while touching this:
- move AD2S1210_DEF_EXCIT macro with similar macros
- remove unnecessary dev_err() calls

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 63 ++++++++++++-------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index fe413759deb9..f1ffee34ebbc 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -53,12 +53,11 @@
 #define AD2S1210_MIN_CLKIN	6144000
 #define AD2S1210_MAX_CLKIN	10240000
 #define AD2S1210_MIN_EXCIT	2000
+#define AD2S1210_DEF_EXCIT	10000
 #define AD2S1210_MAX_EXCIT	20000
 #define AD2S1210_MIN_FCW	0x4
 #define AD2S1210_MAX_FCW	0x50
 
-#define AD2S1210_DEF_EXCIT	10000
-
 enum ad2s1210_mode {
 	MOD_POS = 0b00,
 	MOD_VEL = 0b01,
@@ -184,18 +183,29 @@ static int ad2s1210_regmap_reg_read(void *context, unsigned int reg,
 	return 0;
 }
 
-static inline
-int ad2s1210_update_frequency_control_word(struct ad2s1210_state *st)
+/*
+ * Sets the excitation frequency and performs software reset.
+ *
+ * Must be called with lock held.
+ */
+static int ad2s1210_set_excitation_frequency(struct ad2s1210_state *st,
+					     u16 fexcit)
 {
-	unsigned char fcw;
+	int ret;
+	u8 fcw;
 
-	fcw = (unsigned char)(st->fexcit * (1 << 15) / st->fclkin);
-	if (fcw < AD2S1210_MIN_FCW || fcw > AD2S1210_MAX_FCW) {
-		dev_err(&st->sdev->dev, "ad2s1210: FCW out of range\n");
+	fcw = fexcit * (1 << 15) / st->fclkin;
+	if (fcw < AD2S1210_MIN_FCW || fcw > AD2S1210_MAX_FCW)
 		return -ERANGE;
-	}
 
-	return regmap_write(st->regmap, AD2S1210_REG_EXCIT_FREQ, fcw);
+	ret = regmap_write(st->regmap, AD2S1210_REG_EXCIT_FREQ, fcw);
+	if (ret < 0)
+		return ret;
+
+	st->fexcit = fexcit;
+
+	/* software reset reinitializes the excitation frequency output */
+	return regmap_write(st->regmap, AD2S1210_REG_SOFT_RESET, 0);
 }
 
 static int ad2s1210_set_resolution_gpios(struct ad2s1210_state *st,
@@ -210,11 +220,6 @@ static int ad2s1210_set_resolution_gpios(struct ad2s1210_state *st,
 				     bitmap);
 }
 
-static inline int ad2s1210_soft_reset(struct ad2s1210_state *st)
-{
-	return regmap_write(st->regmap, AD2S1210_REG_SOFT_RESET, 0);
-}
-
 static ssize_t ad2s1210_show_fexcit(struct device *dev,
 				    struct device_attribute *attr,
 				    char *buf)
@@ -229,27 +234,24 @@ static ssize_t ad2s1210_store_fexcit(struct device *dev,
 				     const char *buf, size_t len)
 {
 	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned int fexcit;
+	u16 fexcit;
 	int ret;
 
-	ret = kstrtouint(buf, 10, &fexcit);
-	if (ret < 0)
-		return ret;
-	if (fexcit < AD2S1210_MIN_EXCIT || fexcit > AD2S1210_MAX_EXCIT) {
-		dev_err(dev,
-			"ad2s1210: excitation frequency out of range\n");
+	ret = kstrtou16(buf, 10, &fexcit);
+	if (ret < 0 || fexcit < AD2S1210_MIN_EXCIT || fexcit > AD2S1210_MAX_EXCIT)
 		return -EINVAL;
-	}
+
 	mutex_lock(&st->lock);
-	st->fexcit = fexcit;
-	ret = ad2s1210_update_frequency_control_word(st);
+	ret = ad2s1210_set_excitation_frequency(st, fexcit);
 	if (ret < 0)
 		goto error_ret;
-	ret = ad2s1210_soft_reset(st);
+
+	ret = len;
+
 error_ret:
 	mutex_unlock(&st->lock);
 
-	return ret < 0 ? ret : len;
+	return ret;
 }
 
 static ssize_t ad2s1210_show_resolution(struct device *dev,
@@ -624,10 +626,8 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 	if (ret < 0)
 		goto error_ret;
 
-	ret = ad2s1210_update_frequency_control_word(st);
-	if (ret < 0)
-		goto error_ret;
-	ret = ad2s1210_soft_reset(st);
+	ret = ad2s1210_set_excitation_frequency(st, AD2S1210_DEF_EXCIT);
+
 error_ret:
 	mutex_unlock(&st->lock);
 	return ret;
@@ -773,7 +773,6 @@ static int ad2s1210_probe(struct spi_device *spi)
 	mutex_init(&st->lock);
 	st->sdev = spi;
 	st->resolution = 12;
-	st->fexcit = AD2S1210_DEF_EXCIT;
 
 	ret = ad2s1210_setup_clocks(st);
 	if (ret < 0)
-- 
2.34.1

