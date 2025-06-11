Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B7286A9
	for <linux-staging@lists.linux.dev>; Wed, 11 Jun 2025 00:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600372; cv=none; b=H1qn/OUBD31gKdpkDJWnrALMN6Xqh8mrwwPafgOf1WKkCMJV+w1mVvdBUK2S7oIh4baMIvmfJmzaPgQuWfJRZNwTFaJxlCSGbVJFxZv3sv61hfNb3pl/Q1yl8Wtq7Qi7si+BDijQj/WiV4nIg2XWfiKzBfqHFhZjj0o1q3cb+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600372; c=relaxed/simple;
	bh=0L0QrdrbF3eIPEJwxeoIpihmmZc23N/FFGqyE7epieQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=crgdVrePut/y6O03qyQ+nyVJOimx7uqEOXT5SqhsYkg0b9w87h/OMSnKRJt2V4mf0T+Cyzt4iccXovRwNugj5DGXXQprM7RVBhT+ZhAueKnu62ioJenmguZVSaqpi2MJxkoC/+GdIU3TY+3wjpW814GTTLwBimmLCGPsg3uCkFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=YF6jdyWr; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="YF6jdyWr"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d0a47f6692so609283485a.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Jun 2025 17:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1749600369; x=1750205169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/S+u5mk3bLFvYAEjEuTrh1x6JcZ8zFH062YgbiH+X0s=;
        b=YF6jdyWr5Od14S7tceLTnVAJvxefhBktM5caIZH0BHyDKknvV8D4w3bBHn520Lrx1j
         zS8bZB9uSxn5+RqfAxGWXtiCgC2uoqtW9Bvh0IZ27cD3tXlV0OHFrIyHZxvC4OFTDXDo
         Ge//yoNVv91+x55/V9LcfqQG5xtHefFKbjIUzvP2jXnDkvxVhLuqcdASn2RgJ3ru/wIH
         Q5xMAohgwBMcg+SzKDCRHhplHBBr55o9Bf2niQDJ6ry1OMuARcuZwJUYoaqy4LLlANND
         vC1s6Hl7qvPr/zTNbnt1sb+T0ighxVYxVa8nr8uHcnAM+rOxQNyTS2JZe6G0Q6j3ZBJ1
         eYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600369; x=1750205169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S+u5mk3bLFvYAEjEuTrh1x6JcZ8zFH062YgbiH+X0s=;
        b=fSG9uzuj8MGd/2lywkYbqohqsqwPAMbGn9adOKpfBnon5oIVh/xo6FZi40qJegwu6H
         rcyRx7UeVzZ65Kz2OhOFThx+ZU/c4CYVX+Qc3Mg6Quc23dYSCwg76+gVOf7D/WAHt6sy
         kPWVP9tJrk77P59J6pmKfBStJSLXPWb0KCenK00vSfyAPJSDOoRaptonSABQTMXCgw0A
         L2Uk09D+eJc3p581YnELxzNk8EJ3ziVtu1lDoNk+zQlojdpMLZYn1N5gnPYP3Tr+o+6V
         dJPXH3ea4u+jqrbytRK/eb1JBwMKVm8mqzZt5yW+KsBcTCrwM93qOi1MqI4WAXo+sUj6
         aIMg==
X-Forwarded-Encrypted: i=1; AJvYcCUIffReQ0E6xO9UAvxYI3cBf4aHjFLeqtHCvw3rloIjzL/bo615QXtBty49+5cb0s2oMXIpafC9e6j6qDjc@lists.linux.dev
X-Gm-Message-State: AOJu0YyJeb9vnrJyWy1L7ZVUR9BLswsZcWYx22D1q4jdEnHPk72fxqdI
	L4tu0BX4OOZTV39E45V69MmvDteniAFOvC9xeWqfQGuPYBNyUL/NpfU8kb2QLl0c9A==
X-Gm-Gg: ASbGnctvG3Fs2uINGfOG1pq86yl1OwkYurz/p3hp1TYHR9O3Bmb0P4PEdj21NT+2L6L
	Rbnv13yZOEkfoHKOHOFzGw2qXZ+BB9u+uoO+Mndm37cnUiq2KAUsU9+ujQ583225+ouZWHlKDUc
	OJClGAKQXrA3MkI3A79SldK+U0HEWNeAPOQFaKIPEyd2/63QZ3VHLCBl+uK6PuFBtONVutXC7Vp
	qeVvE0D19eO35gdL1gpK9ABHE8GuKXBRNNxPrps1z/anURqQin3yAYJsV0cJzlUtbSB0/HfWbx8
	9jZyzlHMPiGPu57Nzk02UOGR2a0GpKzNjHuaoAqUJi5qCjLnsUF444z0pw==
X-Google-Smtp-Source: AGHT+IEwSwD1OTQv/cY8Rdnwddhjk6tvIVxJAG/PkD4t1En++yl7NMDCXVoGb+ITA72UocpaA9kshw==
X-Received: by 2002:a05:6214:2263:b0:6fa:f94e:6e82 with SMTP id 6a1803df08f44-6fb2c31b3a3mr26501776d6.7.1749600369307;
        Tue, 10 Jun 2025 17:06:09 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d38de859casm501567085a.38.2025.06.10.17.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:06:08 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Da Xue <da@libre.computer>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [RFC] spi: expand bits_per_word_mask to 64 bits
Date: Tue, 10 Jun 2025 20:05:15 -0400
Message-Id: <20250611000516.1383268-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most current controller IP support 64-bit words.
Update the mask to u64 from u32.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/iio/adc/ad7949.c         | 2 +-
 drivers/spi/spi-dln2.c           | 2 +-
 drivers/spi/spi-ingenic.c        | 2 +-
 drivers/spi/spi-sh-msiof.c       | 2 +-
 drivers/spi/spi.c                | 4 ++--
 drivers/staging/greybus/spilib.c | 2 +-
 include/linux/spi/altera.h       | 2 +-
 include/linux/spi/spi.h          | 6 +++---
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
index edd0c3a35ab7..469789ffa4a3 100644
--- a/drivers/iio/adc/ad7949.c
+++ b/drivers/iio/adc/ad7949.c
@@ -308,7 +308,7 @@ static void ad7949_disable_reg(void *reg)
 
 static int ad7949_spi_probe(struct spi_device *spi)
 {
-	u32 spi_ctrl_mask = spi->controller->bits_per_word_mask;
+	u64 spi_ctrl_mask = spi->controller->bits_per_word_mask;
 	struct device *dev = &spi->dev;
 	const struct ad7949_adc_spec *spec;
 	struct ad7949_adc_chip *ad7949_adc;
diff --git a/drivers/spi/spi-dln2.c b/drivers/spi/spi-dln2.c
index 2013bc56ded8..cccbb00ad5ce 100644
--- a/drivers/spi/spi-dln2.c
+++ b/drivers/spi/spi-dln2.c
@@ -315,7 +315,7 @@ static int dln2_spi_set_bpw(struct dln2_spi *dln2, u8 bpw)
 }
 
 static int dln2_spi_get_supported_frame_sizes(struct dln2_spi *dln2,
-					      u32 *bpw_mask)
+					      u64 *bpw_mask)
 {
 	int ret;
 	struct {
diff --git a/drivers/spi/spi-ingenic.c b/drivers/spi/spi-ingenic.c
index 318b0768701e..21d453d6e46e 100644
--- a/drivers/spi/spi-ingenic.c
+++ b/drivers/spi/spi-ingenic.c
@@ -51,7 +51,7 @@
 #define SPI_INGENIC_FIFO_SIZE		128u
 
 struct jz_soc_info {
-	u32 bits_per_word_mask;
+	u64 bits_per_word_mask;
 	struct reg_field flen_field;
 	bool has_trendian;
 
diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 94a867967e02..97f5a6192279 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -33,7 +33,7 @@
 #define SH_MSIOF_FLAG_FIXED_DTDL_200	BIT(0)
 
 struct sh_msiof_chipdata {
-	u32 bits_per_word_mask;
+	u64 bits_per_word_mask;
 	u16 tx_fifo_size;
 	u16 rx_fifo_size;
 	u16 ctlr_flags;
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1bc0fdbb1bd7..4f47201f2462 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3824,8 +3824,8 @@ static int __spi_validate_bits_per_word(struct spi_controller *ctlr,
 					u8 bits_per_word)
 {
 	if (ctlr->bits_per_word_mask) {
-		/* Only 32 bits fit in the mask */
-		if (bits_per_word > 32)
+		/* Only 64 bits fit in the mask */
+		if (bits_per_word > 64)
 			return -EINVAL;
 		if (!(ctlr->bits_per_word_mask & SPI_BPW_MASK(bits_per_word)))
 			return -EINVAL;
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 24e9c909fa02..087eed1879b1 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -27,7 +27,7 @@ struct gb_spilib {
 	unsigned int		op_timeout;
 	u16			mode;
 	u16			flags;
-	u32			bits_per_word_mask;
+	u64			bits_per_word_mask;
 	u8			num_chipselect;
 	u32			min_speed_hz;
 	u32			max_speed_hz;
diff --git a/include/linux/spi/altera.h b/include/linux/spi/altera.h
index 3b74c3750caf..d6e036ed00e2 100644
--- a/include/linux/spi/altera.h
+++ b/include/linux/spi/altera.h
@@ -24,7 +24,7 @@
 struct altera_spi_platform_data {
 	u16				mode_bits;
 	u16				num_chipselect;
-	u32				bits_per_word_mask;
+	u64				bits_per_word_mask;
 	u16				num_devices;
 	struct spi_board_info		*devices;
 };
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 4789f91dae94..f44120d5a63c 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -586,7 +586,7 @@ struct spi_controller {
 	u32			buswidth_override_bits;
 
 	/* Bitmask of supported bits_per_word for transfers */
-	u32			bits_per_word_mask;
+	u64			bits_per_word_mask;
 #define SPI_BPW_MASK(bits) BIT((bits) - 1)
 #define SPI_BPW_RANGE_MASK(min, max) GENMASK((max) - 1, (min) - 1)
 
@@ -1329,9 +1329,9 @@ spi_max_transfer_size(struct spi_device *spi)
  */
 static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
 {
-	u32 bpw_mask = spi->controller->bits_per_word_mask;
+	u64 bpw_mask = spi->controller->bits_per_word_mask;
 
-	if (bpw == 8 || (bpw <= 32 && bpw_mask & SPI_BPW_MASK(bpw)))
+	if (bpw == 8 || (bpw <= 64 && bpw_mask & SPI_BPW_MASK(bpw)))
 		return true;
 
 	return false;
-- 
2.39.5

