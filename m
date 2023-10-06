Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C23515BE
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vgi0Q5zs"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so1131316fac.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553472; x=1697158272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2efrAvqiPu7nPX2fJ+YIXWQO7bvmVd6GU0zDZ4vqNY=;
        b=vgi0Q5zs9LLwAnJrxh7VOm1NYOxcVhUds+19cgdkoWJKp2M9J0tXmalJ6gZNRL0LOp
         7xTEUn/WvFgnEzqXIb0pbdCYnrNaKGRwMFmzoFgYkyOBouP1fELSPpHRjSyWEsK8ShY3
         +6tC3scceQRE9qilflvFK1YNF8hoLU6k6WLyFXIdR5U9sBKRj5w8UV1LMwPtAkZmKtkT
         jphMImuUf3JyrzrRpVJY01EUOQkHlXXWdSubeNqD4hn9RlIVjrhFKhQuwMxivsLPWxd+
         2TmhUScE1KiQ3RoheRvOETampuzLvdGNVxV8ULMlc8uU6zPhPZKN0dPK/UDEgM0w5nQI
         lEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553472; x=1697158272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2efrAvqiPu7nPX2fJ+YIXWQO7bvmVd6GU0zDZ4vqNY=;
        b=t+sMxWEHbLjQvoFcHw7UB/kz6svjbpyAIP8HhozuW6ca0sifl6AwGouKX3PKHCjg36
         VQBKCI+bY4/ZtzPvRT0nQPLhbw5NPOrQhoJx/QgBQ91hI9r2DHyt6g9DkyIymmed4JJs
         pkfEWqTaWp6Q37ZBKlB9luIbQYxeS5XEV5IaQC6HcxCVSW2+Fut2Fp3/ARIqJz4UXh4M
         7oggNaX3PwnT1/tjKR5l9RDaH4clsl1t4/YVMhwAlsm3R3HZkCQfVEYi+KlZLVX6xOuS
         1L4XYzTUmOJNrJ1W/eHgYrnKx5ymfb32V7oaxqnsxZlzwWbcfPBLqcwqebPVsbDXpPRz
         H9kg==
X-Gm-Message-State: AOJu0YwNWrGZzTKeMHqBPV1gPjKq6hwnu4fAwrmFp5dth8UXMTyY9W+U
	mXi5N9bJKFHwIFy4MM1b6TW4FA==
X-Google-Smtp-Source: AGHT+IFYHoTyuXqkprGA3q+Red3a+xRgXcC/I0rV4fBWrrfOnPxvRy4gxbVnI/QG1Ta/cNG4rTPwOQ==
X-Received: by 2002:a05:6871:14c:b0:1e1:8591:3f3 with SMTP id z12-20020a056871014c00b001e1859103f3mr7646969oab.41.1696553472739;
        Thu, 05 Oct 2023 17:51:12 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:12 -0700 (PDT)
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
Subject: [PATCH v4 10/17] staging: iio: resolver: ad2s1210: convert DOS mismatch threshold to event attr
Date: Thu,  5 Oct 2023 19:50:27 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-10-ec00746840fc@baylibre.com>
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

The AD2S1210 has a programmable threshold for the degradation of signal
(DOS) mismatch fault. This fault is triggered when the difference in
voltage between the sine and cosine inputs exceeds the threshold. In
other words, when the magnitude of sine and cosine inputs are equal,
the AC component of the monitor signal is zero and when the magnitudes
of the sine and cosine inputs are not equal, the AC component of the
monitor signal is the difference between the sine and cosine inputs.
So the fault occurs when the magnitude of the AC component of the
monitor signal exceeds the DOS mismatch threshold voltage.

This patch converts the custom device DOS mismatch threshold attribute
to an event magnitude attribute on the monitor signal channel.

The attribute now uses millivolts instead of the raw register value in
accordance with the IIO ABI.

Emitting the event will be implemented in a later patch.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes:
* Changed event direction from none to rising.
* Fixed missing static qualifier on attribute definition.

v3 changes: This is a new patch in v3


 drivers/staging/iio/resolver/ad2s1210.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 3c224bbeae17..870c4a9a6214 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -747,9 +747,6 @@ static int ad2s1210_write_raw(struct iio_dev *indio_dev,
 static IIO_DEVICE_ATTR(fault, 0644,
 		       ad2s1210_show_fault, ad2s1210_clear_fault, 0);
 
-static IIO_DEVICE_ATTR(dos_mis_thrd, 0644,
-		       ad2s1210_show_reg, ad2s1210_store_reg,
-		       AD2S1210_REG_DOS_MIS_THRD);
 static IIO_DEVICE_ATTR(dos_rst_max_thrd, 0644,
 		       ad2s1210_show_reg, ad2s1210_store_reg,
 		       AD2S1210_REG_DOS_RST_MAX_THRD);
@@ -795,6 +792,12 @@ static const struct iio_event_spec ad2s1210_monitor_signal_event_spec[] = {
 		/* Degredation of signal overrange threshold. */
 		.mask_separate = BIT(IIO_EV_INFO_VALUE),
 	},
+	{
+		/* Sine/cosine DOS mismatch fault.*/
+		.type = IIO_EV_TYPE_MAG,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_separate = BIT(IIO_EV_INFO_VALUE),
+	},
 };
 
 static const struct iio_chan_spec ad2s1210_channels[] = {
@@ -868,7 +871,6 @@ static const struct iio_chan_spec ad2s1210_channels[] = {
 
 static struct attribute *ad2s1210_attributes[] = {
 	&iio_dev_attr_fault.dev_attr.attr,
-	&iio_dev_attr_dos_mis_thrd.dev_attr.attr,
 	&iio_dev_attr_dos_rst_max_thrd.dev_attr.attr,
 	&iio_dev_attr_dos_rst_min_thrd.dev_attr.attr,
 	NULL,
@@ -909,6 +911,8 @@ static IIO_CONST_ATTR(in_altvoltage0_thresh_falling_value_available,
 		      THRESHOLD_RANGE_STR);
 static IIO_CONST_ATTR(in_altvoltage0_thresh_rising_value_available,
 		      THRESHOLD_RANGE_STR);
+static IIO_CONST_ATTR(in_altvoltage0_mag_rising_value_available,
+		      THRESHOLD_RANGE_STR);
 static IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_value_available, 0);
 static IIO_DEVICE_ATTR_RO(in_angl1_thresh_rising_hysteresis_available, 0);
 
@@ -916,6 +920,7 @@ static struct attribute *ad2s1210_event_attributes[] = {
 	&iio_const_attr_in_phase0_mag_rising_value_available.dev_attr.attr,
 	&iio_const_attr_in_altvoltage0_thresh_falling_value_available.dev_attr.attr,
 	&iio_const_attr_in_altvoltage0_thresh_rising_value_available.dev_attr.attr,
+	&iio_const_attr_in_altvoltage0_mag_rising_value_available.dev_attr.attr,
 	&iio_dev_attr_in_angl1_thresh_rising_value_available.dev_attr.attr,
 	&iio_dev_attr_in_angl1_thresh_rising_hysteresis_available.dev_attr.attr,
 	NULL,
@@ -977,6 +982,9 @@ static int ad2s1210_read_event_value(struct iio_dev *indio_dev,
 		if (type == IIO_EV_TYPE_THRESH && dir == IIO_EV_DIR_RISING)
 			return ad2s1210_get_voltage_threshold(st,
 						AD2S1210_REG_DOS_OVR_THRD, val);
+		if (type == IIO_EV_TYPE_MAG)
+			return ad2s1210_get_voltage_threshold(st,
+						AD2S1210_REG_DOS_MIS_THRD, val);
 		return -EINVAL;
 	case IIO_PHASE:
 		return ad2s1210_get_phase_lock_range(st, val, val2);
@@ -1013,6 +1021,9 @@ static int ad2s1210_write_event_value(struct iio_dev *indio_dev,
 		if (type == IIO_EV_TYPE_THRESH && dir == IIO_EV_DIR_RISING)
 			return ad2s1210_set_voltage_threshold(st,
 						AD2S1210_REG_DOS_OVR_THRD, val);
+		if (type == IIO_EV_TYPE_MAG)
+			return ad2s1210_set_voltage_threshold(st,
+						AD2S1210_REG_DOS_MIS_THRD, val);
 		return -EINVAL;
 	case IIO_PHASE:
 		return ad2s1210_set_phase_lock_range(st, val, val2);

-- 
2.42.0

