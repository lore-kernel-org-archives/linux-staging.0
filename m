Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4381C15BE
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EkLduUdq"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1dd8304b980so1022345fac.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553477; x=1697158277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIyovCBkjoJ0e3i6Eyil7FW0dowEMhYVcRMjTAbJ5NA=;
        b=EkLduUdqS8izS4mKEwGo6lAHTgs610jNjNwY4iZ9a9gW6GxaBhFGnXaLBEqkkBM1Jb
         32gTuM5lFbTYDSTb6WWdPfLgsUhOytcEnKu+ZpsL89lx/RnR5vdLCXuRLdAw50ulVQB6
         kh0qStArlUeowVvpEX+CSZ/vIhBVUwSRe9UtVakaanyJTBOes8fL779J1rToENRP/LdK
         Lb3L/RCZY4nM+QgnTPyUUgebU2ORy2+WowU/6sodwv5TbVfMjNQa6fAxdGwFIAFuFYG4
         Mkh11Z0qWnWbCdaPsm51v0AuRnwzBPANd6Kpl5AJuAxPTCNjDuZSmVfs41KxT+3SGxFp
         TQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553477; x=1697158277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIyovCBkjoJ0e3i6Eyil7FW0dowEMhYVcRMjTAbJ5NA=;
        b=WCJZz7X5W8PM/acfvkLgz/HpYoLJEOuLWHexkMr5vsXm+rg/KhIv/aPCKShZMO6JLL
         bsmB3wH/euQ7GrYdhS+49XW8nMAWOyT4QndWQg+Y4PLSOxWFfUpIKCBCL3c5lJ8qzQmV
         eOMF0RSLl2a8tf1CSrdb1gtbplCl1ynqLcYdc40dHlPXQfw3lpu2DwGi+1t5qD6Q6LOU
         RDIzVtauHaWNmdgw9PsAq7dxX4H+50Hs1b9Gg2J4FSA9HEoCznOVyqml13OGUDP1H1Wv
         VBpqliInsLKe6LllR9Tz5WVbcy8smM1D2495yetL9CEq3oJm8aNSX7WQfmSLcDrlkeTo
         hh+Q==
X-Gm-Message-State: AOJu0YxsSXThFSa1HvJIc3dLFn76bd8CtY1LRNY8YlewyoDwkL4Gpm0c
	9/pePHTeC1CGq58N1TKDtRCgIQ==
X-Google-Smtp-Source: AGHT+IFWe2/rG+yD9m1MnCeKecTm5lv5mdKxJ8Rv7DnRbl13JdS2N8dmdzj4jluk7YSpkEA1rBeQlw==
X-Received: by 2002:a05:6870:4347:b0:1bb:84af:bf8f with SMTP id x7-20020a056870434700b001bb84afbf8fmr7694280oah.58.1696553477237;
        Thu, 05 Oct 2023 17:51:17 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/17] staging: iio: resolver: ad2s1210: remove fault attribute
Date: Thu,  5 Oct 2023 19:50:33 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-16-ec00746840fc@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

Faults have been converted to events and we are now polling the fault
register each time we read a sample, so we no longer need the fault
attribute.

This attribute was not suitable for promotion out of staging anyway
since it was returning multiple values in a single attribute.

The fault clearing feature should not be needed unless we need to
support the fault output pins on the chip which is not currently
supported. So we can add this feature back in if we need it later.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes: New patch in v4.

 drivers/staging/iio/resolver/ad2s1210.c | 57 ---------------------------------
 1 file changed, 57 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 59c8eed26701..c4e1bc22e8b0 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -312,50 +312,6 @@ static int ad2s1210_reinit_excitation_frequency(struct ad2s1210_state *st,
 	return regmap_write(st->regmap, AD2S1210_REG_SOFT_RESET, 0);
 }
 
-/* read the fault register since last sample */
-static ssize_t ad2s1210_show_fault(struct device *dev,
-				   struct device_attribute *attr, char *buf)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned int value;
-	int ret;
-
-	mutex_lock(&st->lock);
-	ret = regmap_read(st->regmap, AD2S1210_REG_FAULT, &value);
-	mutex_unlock(&st->lock);
-
-	return ret < 0 ? ret : sprintf(buf, "0x%02x\n", value);
-}
-
-static ssize_t ad2s1210_clear_fault(struct device *dev,
-				    struct device_attribute *attr,
-				    const char *buf,
-				    size_t len)
-{
-	struct ad2s1210_state *st = iio_priv(dev_to_iio_dev(dev));
-	unsigned int value;
-	int ret;
-
-	mutex_lock(&st->lock);
-
-	gpiod_set_value(st->sample_gpio, 1);
-	/* delay (2 * tck + 20) nano seconds */
-	udelay(1);
-	gpiod_set_value(st->sample_gpio, 0);
-
-	ret = regmap_read(st->regmap, AD2S1210_REG_FAULT, &value);
-	if (ret < 0)
-		goto error_ret;
-
-	gpiod_set_value(st->sample_gpio, 1);
-	gpiod_set_value(st->sample_gpio, 0);
-
-error_ret:
-	mutex_unlock(&st->lock);
-
-	return ret < 0 ? ret : len;
-}
-
 static void ad2s1210_push_events(struct iio_dev *indio_dev,
 				 u8 flags, s64 timestamp)
 {
@@ -868,9 +824,6 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 	}
 }
 
-static IIO_DEVICE_ATTR(fault, 0644,
-		       ad2s1210_show_fault, ad2s1210_clear_fault, 0);
-
 static const struct iio_event_spec ad2s1210_position_event_spec[] = {
 	{
 		/* Tracking error exceeds LOT threshold fault. */
@@ -1020,15 +973,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 	},
 };
 
-static struct attribute *ad2s1210_attributes[] = {
-	&iio_dev_attr_fault.dev_attr.attr,
-	NULL,
-};
-
-static const struct attribute_group ad2s1210_attribute_group = {
-	.attrs = ad2s1210_attributes,
-};
-
 static ssize_t event_attr_voltage_reg_show(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
@@ -1367,7 +1311,6 @@ static const struct iio_info ad2s1210_info = {
 	.read_avail = ad2s1210_read_avail,
 	.write_raw = ad2s1210_write_raw,
 	.read_label = ad2s1210_read_label,
-	.attrs = &ad2s1210_attribute_group,
 	.read_event_value = ad2s1210_read_event_value,
 	.write_event_value = ad2s1210_write_event_value,
 	.read_event_label = ad2s1210_read_event_label,

-- 
2.42.0

