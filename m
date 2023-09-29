Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0B751B88
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:26:05 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c49f781855so8261355a34.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008365; x=1696613165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+I4VRfCfFP72yApzhIwo9Fg0drG4LlaaDXwdDXV7tg=;
        b=Ix/EvpuV/Ztk3m8JkyxIQUT0V6aRLFs/S8MpIbkCs8qpmtc/FHWrN4x5z6Ub2AkTed
         x7UEnhidYXtXK1iSrdO6vVC70jCKJaC0Utqi5fR26dRDpMzWG8qs3aC/nZSVFTCyVImD
         XB0OXF67FCQ2a6XiGungAj7ZOZx3Gb9sUfnHxroDn9t+NgEU3s5xdMxtTbBxnU3SUm+3
         W+Cloqf1EEBaq07JMNcx/r1v1uZM4dqMDcg0/mb6QbVJgW7203SUNXfGCpwOgkYLHv0J
         j3IHduvZpqcEi3uqZLWcnLZLNyCAv9TJZ2F/5aHurjQwP96mJTFIpuNJXt4qrSdArA13
         fAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008365; x=1696613165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+I4VRfCfFP72yApzhIwo9Fg0drG4LlaaDXwdDXV7tg=;
        b=OEklLqsFNcgcC4LYApdEICi8se6ILMM3C4Ris7uOG2Mo3I/rpMXXFXbIRnQ0v/s33G
         JYuVAOgodj9WugLAeVTsFpccBaW1h0xnKQXO6AiQieE2Z1IZ2HA4iPwVU6xk3thmfBdD
         lqwJ8smooAxaGY0IpATmdLK5QyDQ0mb5XxFVmEX1NvE43sa9qkVR0IbDgAc4kXTcwZgE
         BdMsLJPxucHQ58whqcNEpiFoEAk4+29YbeB7mCylLJJwbH9x3lv4yIwNwYg4UX9RS59I
         P0ZbcwPhLA6Ez4ENxb2maGdnZ9/E17WldxwxMSO5zDeSPKE2JOS+X4zNOn2fSSQafCsj
         btUw==
X-Gm-Message-State: AOJu0Yyjl6xVICPT+7MWreSu17+V1GVsICmeZr4+xlAR18BCJcuxqJ2y
	757uPWLCjbgqm6fNj7EMDpvH2w==
X-Google-Smtp-Source: AGHT+IEDk3K0gISCTUXG8sbkK43ecAqVNck02OE2zcrr8O7+YohLLZ0CWNYmMufLd09XXF4qj6WujA==
X-Received: by 2002:a05:6830:16d8:b0:6c4:e6d8:2cdc with SMTP id l24-20020a05683016d800b006c4e6d82cdcmr5028313otr.23.1696008364886;
        Fri, 29 Sep 2023 10:26:04 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:26:04 -0700 (PDT)
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
Subject: [PATCH v3 20/27] staging: iio: resolver: ad2s1210: add triggered buffer support
Date: Fri, 29 Sep 2023 12:23:25 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-20-fa4364281745@baylibre.com>
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

This adds support for triggered buffers to the AD2S1210 resolver driver.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes:
* Dropped setting datasheet_name of channels.

 drivers/staging/iio/resolver/ad2s1210.c | 83 ++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index bafc134eed97..c0bc9eac18e8 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -20,8 +20,11 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
+#include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
 
 #define DRV_NAME "ad2s1210"
 
@@ -92,6 +95,12 @@ struct ad2s1210_state {
 	enum ad2s1210_resolution resolution;
 	/** For reading raw sample value via SPI. */
 	__be16 sample __aligned(IIO_DMA_MINALIGN);
+	/** Scan buffer */
+	struct {
+		__be16 chan[2];
+		/* Ensure timestamp is naturally aligned. */
+		s64 timestamp __aligned(8);
+	} scan;
 	/** SPI transmit buffer. */
 	u8 rx[2];
 	/** SPI receive buffer. */
@@ -617,6 +626,13 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.type = IIO_ANGL,
 		.indexed = 1,
 		.channel = 0,
+		.scan_index = 0,
+		.scan_type = {
+			.sign = 'u',
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_BE,
+		},
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 				      BIT(IIO_CHAN_INFO_SCALE) |
 				      BIT(IIO_CHAN_INFO_HYSTERESIS),
@@ -626,9 +642,18 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 		.type = IIO_ANGL_VEL,
 		.indexed = 1,
 		.channel = 0,
+		.scan_index = 1,
+		.scan_type = {
+			.sign = 's',
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_BE,
+		},
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 				      BIT(IIO_CHAN_INFO_SCALE),
-	}, {
+	},
+	IIO_CHAN_SOFT_TIMESTAMP(2),
+	{
 		/* used to configure phase lock range and get phase lock error */
 		.type = IIO_PHASE,
 		.indexed = 1,
@@ -756,6 +781,55 @@ static int ad2s1210_debugfs_reg_access(struct iio_dev *indio_dev,
 	return ret;
 }
 
+static irqreturn_t ad2s1210_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct ad2s1210_state *st = iio_priv(indio_dev);
+	size_t chan = 0;
+	int ret;
+
+	mutex_lock(&st->lock);
+
+	memset(&st->scan, 0, sizeof(st->scan));
+	gpiod_set_value(st->sample_gpio, 1);
+
+	if (test_bit(0, indio_dev->active_scan_mask)) {
+		ret = ad2s1210_set_mode(st, MOD_POS);
+		if (ret < 0)
+			goto error_ret;
+
+		/* REVIST: we can read 3 bytes here and also get fault flags */
+		ret = spi_read(st->sdev, st->rx, 2);
+		if (ret < 0)
+			goto error_ret;
+
+		memcpy(&st->scan.chan[chan++], st->rx, 2);
+	}
+
+	if (test_bit(1, indio_dev->active_scan_mask)) {
+		ret = ad2s1210_set_mode(st, MOD_VEL);
+		if (ret < 0)
+			goto error_ret;
+
+		/* REVIST: we can read 3 bytes here and also get fault flags */
+		ret = spi_read(st->sdev, st->rx, 2);
+		if (ret < 0)
+			goto error_ret;
+
+		memcpy(&st->scan.chan[chan++], st->rx, 2);
+	}
+
+	iio_push_to_buffers_with_timestamp(indio_dev, &st->scan, pf->timestamp);
+
+error_ret:
+	gpiod_set_value(st->sample_gpio, 0);
+	mutex_unlock(&st->lock);
+	iio_trigger_notify_done(indio_dev->trig);
+
+	return IRQ_HANDLED;
+}
+
 static const struct iio_info ad2s1210_info = {
 	.event_attrs = &ad2s1210_event_attribute_group,
 	.read_raw = ad2s1210_read_raw,
@@ -944,6 +1018,13 @@ static int ad2s1210_probe(struct spi_device *spi)
 	indio_dev->num_channels = ARRAY_SIZE(ad2s1210_channels);
 	indio_dev->name = spi_get_device_id(spi)->name;
 
+	ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev,
+					      &iio_pollfunc_store_time,
+					      &ad2s1210_trigger_handler, NULL);
+	if (ret < 0)
+		return dev_err_probe(&spi->dev, ret,
+				     "iio triggered buffer setup failed\n");
+
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 

-- 
2.42.0

