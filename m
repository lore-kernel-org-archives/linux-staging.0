Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEAE55D87F
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707784; cv=none; b=i3UodF9XLeaI+QRL1CQFBFXrE6nzA1lfNh+HEYPVFL2xdWSAEXZrYheKHfoGz7Af1Z7yRKsTTmUwrVkD0C03D7f1AGxROWZzMjzvy+zH5RlQbbkoyg7m/YuqC+65AWWaoSRFH6X+ZYmLR/qGDrrYXUKQwVPIytuM73CcKIsy308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707784; c=relaxed/simple;
	bh=tK+69dkX1Ss2BOAb0xlYsxPsrmqxWOjFTt6Zyqbrb1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBXuB9uCG0qz7SMvB495pHvWB/a8SjxgN9m6XoH5gGLn1pzl08wPgt8Amlc9FyJPRMgwhrc4vnTjmfx5FS9qDEQIqsRbBhmWRr5DdC9wjxsNuxgJGjbhhbVq7umIaGn/lECo/GPpJNN5W3ux6dPhN4XgUBLIX8ZHAQrLX0SBJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnQ+/zeU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnQ+/zeU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso3638343f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 11:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707781; x=1791312581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tQJNzO8qjbNvG9slVuZDk5HBmwm+kLu8BfTZi71ARw=;
        b=HnQ+/zeUw74087NaZ0JWFn+Bs2ljf2Pn/9qrMBLvIMad5ntdA2tUqfQ2GZfkgeshmF
         lonf+VXHULcSgKSeog5lBzoFrZT096xg3JBLafS4GOqD+WCBmU2lzk9WWxmLaEl5ODil
         SS0uMnO0pIUqimAdeXw36zlu2ExNexVE+HoYem4cFQvw4CHp3I9iRN+y1Og6AtHwodDS
         GJZMBqVoI9c+fVDdf56yDmsO76dZlC3olqs1MW0Pgy1bsgVgJPvoW9Lix9D7O+ZFykJ6
         kLNBNDdakhBZQiaFR8pfZaKpcZLh56uRcp5rO5qrOneKhAs9xGLnZjeHgxtm8W1Wg+8D
         8pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707781; x=1791312581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tQJNzO8qjbNvG9slVuZDk5HBmwm+kLu8BfTZi71ARw=;
        b=QxbrxPNJooq6T0kn5p2+F/mqELStvXobOspO62pRkeWQXpuzMjM1DwgnudGKINR2wt
         YaGG1mx86nVFMiv1zAxLteB+urOH3EUapJHARbCnm48b9lWk1PgaknF8WBx85ORtGY9d
         C/Y0RxE7oU19Dc9y7Cu6pGeSFffigjE92YuyUW5En7RkAhMsQ+R5v4vN/Sjyon3lX6ct
         pVliqvo8m7nuT0YJ4IB1YZYVzZsC3xt0UCIEwfoGieQgvwcEZTXf3/n1Sk2CYVsyE1+f
         GtK4Kb58YGMHqSD8VLZeRreG2JwaQoclfJvM671pzJ8gAKIvKuOUR9MtQCqFwS7wtHHv
         XGZg==
X-Forwarded-Encrypted: i=1; AKwUvByVnPYw/OGK0d5ZhDtrM/RYzf1va7fktKAx19J/GfnlFBW+E83gy+157wProqScqUy54Hq1kLDjR9ai17Yg@lists.linux.dev
X-Gm-Message-State: AFq9FYIloFxTizrR4awvc0sQVRJrQabEReiCoEH6xztKQCVyf13ZIOK7
	Izk9QS7gJuROkA+xZWihMP1aCFglW7U7Nmo8gnkLDfWJA98iST35gveQ
X-Gm-Gg: AYBFou11A8pVQ7idgfELnOf199tcrxf7sb6gUBrXlEl/Rub5orWEeHvy2A/ks5LuA4V
	+HVm/HqNYAfeC1loxmny/ZLo9YybPDdC7A06kpckDdwP1nWzHOTdKEHcqsCRYQIe6vWg6KTfr6L
	QKQh1ZUK0IirLfxpu0s53PeWecVgiut6uqsNxYDgZNglkQqOt9p+G7Euwujf3jY4sJ+dwDuj1VP
	t+iTGJLTIC6gKJz8S1OZi+9SefK+FMU2L5155u+alwHjxmfPjHdUSXnzUnah0w3gtaIXNT7CHoW
	VyNIvBufsl5P4iydAxHgnMLqVq2JyCygc3JMFPnv1isfLuvV4uI8l7+nMjvQmWIJQfYgn1gyU/e
	cEteFIfPCJHQk0gpY5ie/jhLgAdmOv8mfXRwKDdA+nPU0KS0l35oeH3naMofK6GSsVz/Fspuwrn
	IS2/A4haABMu+nZTwXq6LE7ti/4XQ/R0BqdCmOREc3Dds418BHajj+sJwHvVnPSBcP4zpSzyyNm
	MnybT3M+u6/bVxlodq6
X-Received: by 2002:a05:6000:381:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48afe75100bmr365591f8f.42.1790707780845;
        Tue, 29 Sep 2026 11:49:40 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6b8d1esm452569f8f.30.2026.09.29.11.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:49:40 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	narcisaanamaria12@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH 1/3] staging: iio: accel: adis16203: fix inclination naming and remove unsupported Y-axis
Date: Tue, 29 Sep 2026 21:48:58 +0300
Message-ID: <20260929184900.39515-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADIS16203 measures inclination around a single axis. As per the
datasheet, register 0x0C gives a 360-degree output, and 0x0E gives a
+/- 180-degree output of the exact same measurement.

The current driver incorrectly maps 0x0E as a separate Y-axis. This patch
removes the phantom Y-axis, updates the naming, and adjusts the timestamp
channel index.

Note: The ADIS_INCLI_CHAN(X, ...) modifier is intentionally kept to
preserve the existing userspace ABI (incli_x_raw). Furthermore, removing
the phantom Y-axis inherently shifts the scan indexes of subsequent
channels down by one, which is expected to correct the hardware
representation.

Fixes: 2df79e1bddc4 ("staging: iio: accel: Rename source files and update Makefile")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index 830ff38fda92..eddb786d4747 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -29,10 +29,7 @@
 #define ADIS16203_TEMP_OUT       0x0A
 
 /* Output, x-axis inclination */
-#define ADIS16203_XINCL_OUT      0x0C
-
-/* Output, y-axis inclination */
-#define ADIS16203_YINCL_OUT      0x0E
+#define ADIS16203_INCL_OUT       0x0C
 
 /* Incline null calibration */
 #define ADIS16203_INCL_NULL      0x18
@@ -129,7 +126,6 @@
 
 enum adis16203_scan {
 	 ADIS16203_SCAN_INCLI_X,
-	 ADIS16203_SCAN_INCLI_Y,
 	 ADIS16203_SCAN_SUPPLY,
 	 ADIS16203_SCAN_AUX_ADC,
 	 ADIS16203_SCAN_TEMP,
@@ -208,13 +204,10 @@ static int adis16203_read_raw(struct iio_dev *indio_dev,
 static const struct iio_chan_spec adis16203_channels[] = {
 	ADIS_SUPPLY_CHAN(ADIS16203_SUPPLY_OUT, ADIS16203_SCAN_SUPPLY, 0, 12),
 	ADIS_AUX_ADC_CHAN(ADIS16203_AUX_ADC, ADIS16203_SCAN_AUX_ADC, 0, 12),
-	ADIS_INCLI_CHAN(X, ADIS16203_XINCL_OUT, ADIS16203_SCAN_INCLI_X,
+	ADIS_INCLI_CHAN(X, ADIS16203_INCL_OUT, ADIS16203_SCAN_INCLI_X,
 			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
-	/* Fixme: Not what it appears to be - see data sheet */
-	ADIS_INCLI_CHAN(Y, ADIS16203_YINCL_OUT, ADIS16203_SCAN_INCLI_Y,
-			0, 0, 14),
 	ADIS_TEMP_CHAN(ADIS16203_TEMP_OUT, ADIS16203_SCAN_TEMP, 0, 12),
-	IIO_CHAN_SOFT_TIMESTAMP(5),
+	IIO_CHAN_SOFT_TIMESTAMP(4),
 };
 
 static const struct iio_info adis16203_info = {
-- 
2.54.0

