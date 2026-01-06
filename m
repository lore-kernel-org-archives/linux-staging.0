Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A4330330
	for <linux-staging@lists.linux.dev>; Tue,  6 Jan 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711102; cv=none; b=P2IRQzaYFp1huZ1pKJNskxRSIJXgPXrK8mYYOArc/htU+vcPGU839LuSjVmltMRUncVOKQsH63CR7txPm2Ez2MQjdUueX3YMi64GwkuezSQpXtmUq6BLpiOETJECrewNC84VesajbVMbekhmKaIfirtGm/I3j/v6uXNnZvKtoh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711102; c=relaxed/simple;
	bh=p8dq/dMEupUC2aQzzjPOIC1vFjm7cfadwEaa4zf6ba4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L3WGPU5s9wbqnYdDcc2Voj49JpyCWBtgqGIgDueSkZX2W/wUrIxzJVJwzzN+1A2KsLIjiI9Aadl7p8XF/0Qb+Tv0Nt5BGLgx5KD4Ukqa8amSWH1+8EeUdTxEvk8JfmIh91kQhW5RitYtYCDaz061jnLI4igmlvVef0NO0ffRF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJ5NrHK+; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJ5NrHK+"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-11f36012fb2so252264c88.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Jan 2026 06:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767711100; x=1768315900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/hNvMMqkMl4qoxeO8kWiJinGTUcm34Ni+je0A+xask=;
        b=mJ5NrHK+lD8yxNlwD1KlRQkgrZYuIdDj+2ui6wFalgtsh6u6nCbu/JmbFM+uPPMF6E
         JYT0VxMucl71pFCn0FFPTfH6dM3QhAQIuczqhv7THNUNfqxV2WhaMII3433FCU5Biz2Z
         ZZSaCUt+fhoQYnaYcpXc/93+Uv3OwHrK54WFpq2Myb0gZ29Lzx6EEqr6u6kWSat1U7NT
         WGKv+6pA2SoRFvDBYKNB4BRuxrsZ6S8BcQ8vSh790aHce5vW3HsUF6oZxkBDe9/E3GNN
         +nEuhp2TYNJJ87HTUaAh33p7xzX1DRbuMqEx5lk6e9rg+nfiwN7mpcdB4JfOVbggcCji
         q//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711100; x=1768315900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/hNvMMqkMl4qoxeO8kWiJinGTUcm34Ni+je0A+xask=;
        b=Cd6gTIfZEoU78OFo+DGR+WmqvKDFWsbw3sKr85MGT2W+ZDCFO9rXI3vhRXzwJpy2Ef
         jqB98esxW/1F/O+oYMUf6vgZlJiJp66GLxRH5jpfW/RUzWEbTAMO1fAlLkveksBC4g2I
         3Wyu1SnNp7juxC+Chl+Jy5XPPGsyIdBDisZwvUi+/nBULMCPt2cDPquU+TswsL+sdVa1
         FjE9XhKrwNTvM5lh+fNoXp3h16qEZBbDtSAiztxBdXeKG8ZgiRFc7HNM/Uaw6iGh+f7B
         SG+bEBKNUjhzDPlS5WhvLUccAkiSdaFJgGdywwV7CIxr/j/joBXy65brk/rbE82HPnl/
         pqaw==
X-Forwarded-Encrypted: i=1; AJvYcCX6IixkLfoMh7u2DP4yWM+UHih24zTv6oHAtzpf8PmLVOQACMPLxan8U0Qpqcx36gkR48vailD97uwtcjjO@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn+1urTWwSxZVUlyb3gz94iIGwKmoEuUknRu9ah4kSHYJ2FVOt
	VN878DPRvjgp+P3K4WCRmTAnshi6LWcfKUfJVcBdzfWNoT0fz/MSUglm
X-Gm-Gg: AY/fxX44LtsqfP2lt+SfetJHWJkq5IsJ6zPOsq+9nN6pZArofSBDwTLRmihRYIuTNK0
	AOGjG90aJl+6YjYEcVqhL/Fd6xyz/I0pXrdfRw8mEwwOw5WrLEQhDlMUvKCH0XyKqXiWMdRyF1/
	RSoM8EWNgmSYqvMhnLdjL9T+LJHDdiZET01IxmYnECqBVmkfUhMXpnHMtwEz/DOXV83vPp/TMKa
	3uVGvhjwzyoxBGtCHeEfyZKZpRCBGbhNmbvw+Ou8hyrSEoAJEv3nsKyE2KlGSLd46z6dgrHCRGv
	E/upDuHzREokHB6pgrOHYkXukYJhLI5pYSGpzt2CGrvE6e2q2lO3+ZEdwJ0Fr+Pp/tY+3fR2b4a
	utiU7XvrtLFHij3s8dSc+nR5rQAiejeVSzOPolajig4xiDFFbpudCngs0pZkzq/fxE1zFDCaqp9
	7iJpVC/2ogwL7qRXYpORv+4PNbGZZsT4Q=
X-Google-Smtp-Source: AGHT+IH7t7HjXLdeJ46ldbckFVJMidSGo03oodpDrxI0SKkKbyMpbQiE2Zdn26I5kWYcF3bBeMuCrQ==
X-Received: by 2002:a05:7023:b16:b0:119:e56b:91ea with SMTP id a92af1059eb24-121f18df9afmr2453038c88.27.1767711099732;
        Tue, 06 Jan 2026 06:51:39 -0800 (PST)
Received: from gyrocopter ([76.174.137.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm5237003c88.4.2026.01.06.06.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:51:39 -0800 (PST)
From: Michael Harris <michaelharriscode@gmail.com>
To: gregkh@linuxfoundation.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: iio: adt7316: modernize power management
Date: Tue,  6 Jan 2026 06:50:55 -0800
Message-ID: <20260106145055.2557551-1-michaelharriscode@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced use of deprecated function SIMPLE_DEV_PM_OPS() with
EXPORT_GPL_SIMPLE_DEV_PM_OPS().

Removed PM preprocessor conditions with usage of pm_sleep_ptr().

Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
---
v3: Fix commit message function/macro references
v2: Corrected staging list email address
---
 drivers/staging/iio/addac/adt7316-i2c.c | 2 +-
 drivers/staging/iio/addac/adt7316-spi.c | 2 +-
 drivers/staging/iio/addac/adt7316.c     | 6 ++----
 drivers/staging/iio/addac/adt7316.h     | 6 +-----
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-i2c.c b/drivers/staging/iio/addac/adt7316-i2c.c
index f45968ef94ea..3bdaee925dee 100644
--- a/drivers/staging/iio/addac/adt7316-i2c.c
+++ b/drivers/staging/iio/addac/adt7316-i2c.c
@@ -136,7 +136,7 @@ static struct i2c_driver adt7316_driver = {
 	.driver = {
 		.name = "adt7316",
 		.of_match_table = adt7316_of_match,
-		.pm = ADT7316_PM_OPS,
+		.pm = pm_sleep_ptr(&adt7316_pm_ops),
 	},
 	.probe = adt7316_i2c_probe,
 	.id_table = adt7316_i2c_id,
diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index af513e003da7..f91325d11394 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -142,7 +142,7 @@ static struct spi_driver adt7316_driver = {
 	.driver = {
 		.name = "adt7316",
 		.of_match_table = adt7316_of_spi_match,
-		.pm = ADT7316_PM_OPS,
+		.pm = pm_sleep_ptr(&adt7316_pm_ops),
 	},
 	.probe = adt7316_spi_probe,
 	.id_table = adt7316_spi_id,
diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 8a9a8262c2be..59fb3bd26bc1 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -2082,7 +2082,6 @@ static const struct attribute_group adt7516_event_attribute_group = {
 	.name = "events",
 };
 
-#ifdef CONFIG_PM_SLEEP
 static int adt7316_disable(struct device *dev)
 {
 	struct iio_dev *dev_info = dev_get_drvdata(dev);
@@ -2098,9 +2097,8 @@ static int adt7316_enable(struct device *dev)
 
 	return _adt7316_store_enabled(chip, 1);
 }
-EXPORT_SYMBOL_GPL(adt7316_pm_ops);
-SIMPLE_DEV_PM_OPS(adt7316_pm_ops, adt7316_disable, adt7316_enable);
-#endif
+
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(adt7316_pm_ops, adt7316_disable, adt7316_enable);
 
 static const struct iio_info adt7316_info = {
 	.attrs = &adt7316_attribute_group,
diff --git a/drivers/staging/iio/addac/adt7316.h b/drivers/staging/iio/addac/adt7316.h
index 8c2a92ae7157..f208f0d3583a 100644
--- a/drivers/staging/iio/addac/adt7316.h
+++ b/drivers/staging/iio/addac/adt7316.h
@@ -22,12 +22,8 @@ struct adt7316_bus {
 	int (*multi_write)(void *client, u8 first_reg, u8 count, u8 *data);
 };
 
-#ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops adt7316_pm_ops;
-#define ADT7316_PM_OPS (&adt7316_pm_ops)
-#else
-#define ADT7316_PM_OPS NULL
-#endif
+
 int adt7316_probe(struct device *dev, struct adt7316_bus *bus,
 		  const char *name);
 
-- 
2.52.0

