Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A2225B1
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 21:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lnPHVXdx"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1dd7139aa57so4236192fac.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 14:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696972375; x=1697577175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dl0PVkUbqTQUh7CeF07K0JAD05VmhLtJ0L4pxcpgSQ=;
        b=lnPHVXdxTaAfknoB2tkFlu1ZstG4Juk2C8zCsNAvShHUOguM/z1UPoGMk5ZYWDd8r/
         Loe2cm5M55gLSmJAIWNnvDkHeelKNMunR966Yk8b4lFTG9tVS/bFOp6fUDqBDeqaJNGE
         BeQniLF9fjmm8AyqaIk7yy92Pvb6dKr6+qoR+TaLwzQV5843M+/spdlvO0C9ln0K382L
         5B+4oj18b46rxBUBcj+6CJUSUDqFaG3YExb4wdJiCp5s8eeg9hn5MDKD+GNoshm4eoeE
         JumCUJqbvZLm0p0hKBUE3jKkjFzBlBEeJmIXX9MVdu3//yU4XxqF/YSlmNkVxusbjMRJ
         N/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696972375; x=1697577175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dl0PVkUbqTQUh7CeF07K0JAD05VmhLtJ0L4pxcpgSQ=;
        b=GMusTtgptk+nhdz1t7CjYkgKxY5XhBPbttp9BeukYVXnxE/A+su3Dd/h5txDgliPc9
         sDlVC1Rrtm8nNdHY5ILX9gK0KJ8gro3QzMNHyasZ3zRnkmB6t4j5x4u3Xe2ecHoprk31
         bPDgVcq2Gxz/MlC76Pcw7MfdPv9gCBy8yKwjydKR/ZZmgtEm+L/aGm7MXp/QNecWrAHR
         1Lwu9RC9EVdXbncsxbNmMZaTRGvWGkbscDUaTznhNW1v7TUYsapZ8hjEh53T1M3BOF10
         26blBfrnCbIUWSnSY23vh4pXVvUtmBnPE4iO+DkRxIcp6fVIjtjAEiYPd0eVFaZmRveh
         Sgrg==
X-Gm-Message-State: AOJu0Ywavux/FQ8O0QqotMe0yqFGY67GCERha3szEZt1IQlmzlaB6MrO
	CG/SQ5Cf77bDEB4b9aO+vUnAWqjp2bCytLc0bO+Tpw==
X-Google-Smtp-Source: AGHT+IEp7Iox6+XTb6EqSgkNZ6rYDfaZHXv9bmQpeEXZiJesGGO2MkkD0pbgtDQXWNgE2ewQpPhM9w==
X-Received: by 2002:a05:6870:2326:b0:1bb:8867:f7ed with SMTP id w38-20020a056870232600b001bb8867f7edmr23858681oao.33.1696972374798;
        Tue, 10 Oct 2023 14:12:54 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id ed46-20020a056870b7ae00b001e98b1544fesm52494oab.9.2023.10.10.14.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 14:12:54 -0700 (PDT)
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
Subject: [PATCH v5 1/4] staging: iio: resolver: ad2s1210: refactor sample toggle
Date: Tue, 10 Oct 2023 16:12:33 -0500
Message-ID: <20231010-ad2s1210-mainline-v5-1-35a0f6ffa04a@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
References: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

This refactors the sample line toggle in the ad2s1210 resolver driver
to a separate function. The sample has some timing requirements, so
this ensures that it is always done the same way, both in the existing
call sites and any future usage.

Previously, the sample line was kept on for the duration of the read,
but this is not necessary. Data is latched in on the rising edge and
after the specified delay the state of the sample line does not matter.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v5 changes: New patch in v5.

 drivers/staging/iio/resolver/ad2s1210.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index e0bea3c68664..59c273a4b6a9 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -286,6 +286,26 @@ static int ad2s1210_regmap_reg_read(void *context, unsigned int reg,
 	return 0;
 }
 
+/*
+ * Toggles the SAMPLE line on the AD2S1210 to latch in the current position,
+ * velocity, and faults.
+ *
+ * Must be called with lock held.
+ */
+static void ad2s1210_toggle_sample_line(struct ad2s1210_state *st)
+{
+	/*
+	 * Datasheet specifies minimum hold time t16 = 2 * tck + 20 ns. So the
+	 * longest time needed is when CLKIN is 6.144 MHz, in which case t16
+	 * ~= 350 ns. The same delay is also needed before re-asserting the
+	 * SAMPLE line.
+	 */
+	gpiod_set_value(st->sample_gpio, 1);
+	ndelay(350);
+	gpiod_set_value(st->sample_gpio, 0);
+	ndelay(350);
+}
+
 /*
  * Sets the excitation frequency and performs software reset.
  *
@@ -405,10 +425,8 @@ static int ad2s1210_single_conversion(struct iio_dev *indio_dev,
 	int ret;
 
 	mutex_lock(&st->lock);
-	gpiod_set_value(st->sample_gpio, 1);
+	ad2s1210_toggle_sample_line(st);
 	timestamp = iio_get_time_ns(indio_dev);
-	/* delay (6 * tck + 20) nano seconds */
-	udelay(1);
 
 	switch (chan->type) {
 	case IIO_ANGL:
@@ -444,9 +462,6 @@ static int ad2s1210_single_conversion(struct iio_dev *indio_dev,
 	ad2s1210_push_events(indio_dev, st->sample.fault, timestamp);
 
 error_ret:
-	gpiod_set_value(st->sample_gpio, 0);
-	/* delay (2 * tck + 20) nano seconds */
-	udelay(1);
 	mutex_unlock(&st->lock);
 	return ret;
 }
@@ -1268,7 +1283,7 @@ static irqreturn_t ad2s1210_trigger_handler(int irq, void *p)
 	mutex_lock(&st->lock);
 
 	memset(&st->scan, 0, sizeof(st->scan));
-	gpiod_set_value(st->sample_gpio, 1);
+	ad2s1210_toggle_sample_line(st);
 
 	if (test_bit(0, indio_dev->active_scan_mask)) {
 		ret = ad2s1210_set_mode(st, MOD_POS);
@@ -1298,7 +1313,6 @@ static irqreturn_t ad2s1210_trigger_handler(int irq, void *p)
 	iio_push_to_buffers_with_timestamp(indio_dev, &st->scan, pf->timestamp);
 
 error_ret:
-	gpiod_set_value(st->sample_gpio, 0);
 	mutex_unlock(&st->lock);
 	iio_trigger_notify_done(indio_dev->trig);
 

-- 
2.42.0

