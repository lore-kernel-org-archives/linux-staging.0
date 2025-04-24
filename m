Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26F27F74E;
	Thu, 24 Apr 2025 22:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534087; cv=none; b=qnuKCsbnWTfxFSzpn+GNgAYs3jamCzBsJeptCJzRTLUdxnXBcMTfDBZOl5YOqq37vb7n1nTQRBorKllahaXHUGIrYATidix1XxGOvszQNU2loOqSlwg/09SarhEjw2okUV8vrzwVSAxgtDHsuk+UygSuQxZVbCRB5oEXiiw671Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534087; c=relaxed/simple;
	bh=sqeoJp+2jRFNDH3TzY9O6mzMr5Isww/bZnpTdl7s7Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCyS9V6BkoqhAiXQ7AZFvrbfS5D+DRhLbBkfcxtpAk5/mnuunwWdPZTVAUfoC3XwtcFvMMEaVSpNqWXdIKoY1k3s168StQF1jUu/gKgtIgT9s/cf/emxnFtPjDy7eVaINTjzF34yHh6NUfyj0otviVNpQrFU6VxMRU/AcaCJQYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IH0PPaoN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IH0PPaoN"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5a88b34a6so161095185a.3;
        Thu, 24 Apr 2025 15:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745534085; x=1746138885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6HQQxzT0Bc9xltCaxxJ7uLhPmo14NYdtMTMXhuJ1RU=;
        b=IH0PPaoNIxglt8EVzvh/zixN4EL8zfj3T8ZTjhGkvAixCtFnTCDyVAe1doV/XRImWK
         qBaTcxhzTwOUqN5pnQMl/taE/3l9gndTOAgbWE1AUNe+ZFGeMyybNCIO5jYcu/z/PRHv
         DUFTMe/iluR56gNDiLp9Yhoav1iK/6W6DDl1gRgcrwBw5Z/scYxPebiKY66NS+OTjdaE
         0ooZ05NpeVbyCkGACvUPMZk/J9FkI1SbnhNlFhW3yCi1dr2M5/Bja9R8nkwOPXsvw20P
         TpkX9Db/VuTMaSeym44B4rm9m9HEsSFg02tSMkCIhdxViVmTvHpnplaFra2wGNm7Txt/
         ge4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745534085; x=1746138885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6HQQxzT0Bc9xltCaxxJ7uLhPmo14NYdtMTMXhuJ1RU=;
        b=wrR1+e8Vnu4b/ky2sFPDj19qh2/RnCbvuHAPV8Gel2ZZr7s7C58Nz4AcyJzdq81SWS
         ufN4toeDmY6l8eGS8GNZ00ZjWEGFMgh2f8uJDH2ppQ8yiC24vDqC5T2Q7wOF/HwjlUH8
         QsmNVwjzT6w2H6dOPW03XdCBr7THrEwMiTVrrfvMlzk6CsveIrbHb/vOPjo8Y/jp088g
         rVAzka2MHytPWfe5DSy44gTB6j4j5ykeWNx4HsrxZlwo+IuOZ5yb6nhWiySvy75KfPrm
         z/JM/+A9jPpWfhd+yMAlcq4cZSVa9rAT0D3Y2IcsGueAHSGpYtmv0AkPF2JCPv9swXJm
         Oerw==
X-Forwarded-Encrypted: i=1; AJvYcCUdkBsXmedXKzMC7mZUGJBADRCVK4Wvk8YiMbF5W3Aj9PfityemsevmPvq/a1ArkhmMjvk35eVKJ8lXepYKyg==@lists.linux.dev, AJvYcCVIS8znhZb1rl/YD/hCAbG1cTh7P2GfgPmjIarkYLilMQjgu1dtVgGWL78eUBJ24zE+yXRw4lPn/ZprtqP3tCdsX+sMsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy9pFIzcCDDsgBBy/+3M8zPgSvxt7PpL3UI8fVxMY250h1WB/F
	BkNd6xbyzBAW/+kedKlSQe05mDoOULmcMcgtJ6wz2q1S7PBiAjrX
X-Gm-Gg: ASbGncuQGzV2szMu723jtUcYu3vQEp91YKfVZ6FPougMWpujsdO1GPkQDiuGY7lv4qT
	ont7SiT/GEa9KfSX9Pk4hXdhG/8isLponh2h8l5nGI6orYIFtXvG/F2aICBxkTZQjN6HLtcNvHh
	HW0uYE1YjlgKis5v42nRl2gNU6GUgevALbVo0UEwqKDrRvQcqqbeMd/CMAROJsxOKKCSSvit+Gk
	Mi8XjCPqrYybdKGJaFcAtrbZ1+S5wWn5ByGRC7avysiM0L5WrT4F0r0SoniKCP03J1RsYUBN2o8
	yDUBTY0lPXMvXDO7EgCx5n8DQsSc8jRR1mapxYcyShbwPsJHujveo7hJzoGrKD4ja/4l2vGHK6d
	BAmyLHrRcyt/IdGrL/jwnJv1aArW7NQ==
X-Google-Smtp-Source: AGHT+IEHNcRZ8mQ6zC3MsB97BOz3q06O+YLI0Gv2TZzEcTOdD+Jy+MSlgXuIuIVaSjsiDwOHMnKE7g==
X-Received: by 2002:a05:620a:191d:b0:7c5:6375:1450 with SMTP id af79cd13be357-7c9606de128mr40651985a.18.1745534084963;
        Thu, 24 Apr 2025 15:34:44 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ea36eesm142986885a.111.2025.04.24.15.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:34:44 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: andy@kernel.org,
	dlechner@baylibre.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	nuno.sa@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4 2/2] staging: iio: frequency: ad9832: Refactor powerdown control
Date: Thu, 24 Apr 2025 18:32:09 -0400
Message-ID: <20250424223210.91317-3-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424223210.91317-1-gshahrouzi@gmail.com>
References: <20250424223210.91317-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom implementation with out_altvoltage_powerdown ABI. The
attribute's logic is inverted (1 now enables powerdown) to match the
standard.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
V3 -> v4:
	- Use guard(mutex) for simplified locking.
	- Use an extended attribute.
v2 -> v3:
v1 -> v2:
	Refactor powerdown functionality.
---
 drivers/staging/iio/frequency/ad9832.c | 69 +++++++++++++++++++-------
 1 file changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 2e555084ff98a..b8b52302abf36 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -174,6 +174,32 @@ static int ad9832_write_phase(struct ad9832_state *st,
 	return spi_sync(st->spi, &st->phase_msg);
 }
 
+static ssize_t ad9832_write_powerdown(struct iio_dev *indio_dev, uintptr_t private,
+				      const struct iio_chan_spec *chan,
+				      const char *buf, size_t len)
+{
+	struct ad9832_state *st = iio_priv(indio_dev);
+	int ret;
+	bool val;
+
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&st->lock);
+	if (val)
+		st->ctrl_src |= AD9832_SLEEP;
+	else
+		st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP |
+				 AD9832_CLR);
+
+	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
+					  st->ctrl_src);
+	ret = spi_sync(st->spi, &st->msg);
+
+	return ret ? ret : len;
+}
+
 static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t len)
 {
@@ -185,9 +211,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret)
-		goto error_ret;
+		return ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD9832_FREQ0HM:
 	case AD9832_FREQ1HM:
@@ -232,22 +258,9 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 						  st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
 		break;
-	case AD9832_OUTPUT_EN:
-		if (val)
-			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
-		else
-			st->ctrl_src |= FIELD_PREP(AD9832_SLEEP, 1);
-
-		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
-						  st->ctrl_src);
-		ret = spi_sync(st->spi, &st->msg);
-		break;
 	default:
 		ret = -ENODEV;
 	}
-	mutex_unlock(&st->lock);
-
-error_ret:
 	return ret ? ret : len;
 }
 
@@ -270,8 +283,6 @@ static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
 
 static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
 				ad9832_write, AD9832_PINCTRL_EN);
-static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL,
-				ad9832_write, AD9832_OUTPUT_EN);
 
 static struct attribute *ad9832_attributes[] = {
 	&iio_dev_attr_out_altvoltage0_frequency0.dev_attr.attr,
@@ -285,7 +296,6 @@ static struct attribute *ad9832_attributes[] = {
 	&iio_dev_attr_out_altvoltage0_pincontrol_en.dev_attr.attr,
 	&iio_dev_attr_out_altvoltage0_frequencysymbol.dev_attr.attr,
 	&iio_dev_attr_out_altvoltage0_phasesymbol.dev_attr.attr,
-	&iio_dev_attr_out_altvoltage0_out_enable.dev_attr.attr,
 	NULL,
 };
 
@@ -293,6 +303,27 @@ static const struct attribute_group ad9832_attribute_group = {
 	.attrs = ad9832_attributes,
 };
 
+static const struct iio_chan_spec_ext_info ad9832_ext_info[] = {
+	{
+		.name = "powerdown",
+		.shared = IIO_SEPARATE,
+		.write = ad9832_write_powerdown,
+	},
+	{ },
+};
+
+#define AD9832_CHANNEL(chan) {					\
+	.type = IIO_ALTVOLTAGE,					\
+	.indexed = 1,						\
+	.output = 1,						\
+	.channel = (chan),					\
+	.ext_info = ad9832_ext_info,				\
+}
+
+static const struct iio_chan_spec ad9832_channels[] = {
+	AD9832_CHANNEL(0),
+};
+
 static const struct iio_info ad9832_info = {
 	.attrs = &ad9832_attribute_group,
 };
@@ -333,6 +364,8 @@ static int ad9832_probe(struct spi_device *spi)
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad9832_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = ad9832_channels;
+	indio_dev->num_channels = ARRAY_SIZE(ad9832_channels);
 
 	/* Setup default messages */
 
-- 
2.43.0

