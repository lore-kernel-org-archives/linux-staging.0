Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C649E136
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125057; cv=none; b=lRnULecl5Ys3grnI4jIcatn7wLOZqorcXF71tmPA6TVSs+oC+UUUwhoudjJ58hsP8mnQnu2RVSDAt3b7WdlmM5IrU/6Qwyppg4C+VeaT04AUw/P5GaB3hWFz6TC0LS2EKioHEDAzVVP2d4JUDQn/9YePG8xL3WYZ37+EB5n5F1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125057; c=relaxed/simple;
	bh=pJ4vj8BCmfF1V31tX/wZS7//jdxk6ExCWx5LYoQItFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mk/Q1y+/02PmsxjNN7D8ialFQgN9T04NmjTw7znQadvMcNeQKfZWJ+I/F0RYVA/TK+aKj5URPbK61+aGeBuu5m7J2GAuMw0aDI84gZL5QvXZ7IwfyTZ0lwuSaznNBvrTxbly3kXpmOCfpvLzvOCyxUJeq+Qe25mkmIyPwoEIAo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl3yogaV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl3yogaV"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso9043775e9.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125049; x=1789729849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWttpW5LjqZG6rptcoUTqVDa/t+6fdXdX2MvAK+JxuA=;
        b=Sl3yogaVM/yjyRbT5rH6OY3mEXYg+mRKrX7k02YUyKYzpMXGKw3z/IgD0kKI+8a6/L
         ZGtBSbJv7KNXngPt/nyjKHTzir4iZW449GrYMfUsnVc29jos45VkNUZAF6vHCFcM3Twg
         hS4xHVsRUiwH1FpgN7XE1VPoOkvjkA/icUKTc3zeCPN7V3bQXxOxteDlLvJ7PgyaO8B7
         wkMU9vyWcfCoooy2Jibp6I5KoUl6D/mtC5s4QeDBuk2qKHEKjoUTT+CUyrpfPx5JRtO0
         OsLGld5JZxLeY0X22TJd0lk1faebKMMKVIfpcmyXrYLHP5LIqN6lRh/OmnT04Xi0ZWaX
         6j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125049; x=1789729849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWttpW5LjqZG6rptcoUTqVDa/t+6fdXdX2MvAK+JxuA=;
        b=HgE2S2Jtk6f9i2aGu/I8Btn+++saxYlBWgm1tsMKFauee77TJvZRvN4gDPiTBiIXur
         sF0z1yZt8WgImpB1QhpqRjGWkltWOCikuYRRukBk4udnHn1O7wdxWLrFPQSP3yfJJM6a
         CuQRQ//JatKo6WxCdKs6Se4/n33mKHaDh48T5T1cvB/iboSrE9aZJdcxhzecjctIOitk
         MQRgVQSt9zc3jAQwpG93ZTvHsjj5Bt7S7NHw2xUVEz/SDKOQc2fww+3qWLWpKpfvWyPs
         Ojxg2AhiX282EvYMBu8CF/golGVRZVFZNY0GeGtceNu1eru1/s4/TMxZJ6Pwh0zOtfyn
         ylUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl0kbO0v/Xwo0ZbLFdk2p29euAG1WMyQRdFc2zMO6Jceid2sTiXx/+LtW+DPqjJGWWuHOb4vtKSXe9ydpd@lists.linux.dev
X-Gm-Message-State: AFuF++n/4RtTJ0eZJw1JU2iDuvmXAovV4AehfuWLcKgXT7Fcg9aou5nS
	BWyvhMQC8jqKeeEYec2ZGUSbSMk9ujoMiFb9sI44hmS9kKFX3fJ6VUeP
X-Gm-Gg: AYBFou0fWVboK74RLui4jbUCNuljkOwmyQNObMwiTfplczFotc/e2p6Db0pHVU17qSR
	unR/ufRI9asYdYY9kGuwhXUdETrh6b3iixjyHUjf/uKeHeK17qqLDQmLGzRcQ198HNvCyV9ym4b
	iItKaiIkc4Ap3f3wtKMy9IhMxSCX7RTZzfOk88q9UP+d4kfDpdOyaBMGTr7dbZFUlQthjeiGj7S
	JXKBoW60nMSDbEWuhmR0ICC4aj1ssurGwjpE74ioHJ+G3xixarVDx9pDG7OEgXmJjAVF3tB6pV+
	TMZUgAGojQuxkE4SKipZ5eR9/dJdc9H0RByT9k8W4WvG8svQ4RhZAa/28ax+xBLO0K8pPEPHMD+
	wLc5ketl5RzxyRqvsWUWkRvitjqbLtYnQyADjmyUGmbtwBLHHbymxZy5RHZTjxgYkole8++mkxD
	9MxZprB4tabsXR9pwc0vuCcVa9gFY+CbJ4G9AfIqDNf5T0+p74ZkNukmWHtA4R+bTMG8OK1vI28
	7TUr1YHOjxUp+lshss=
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbff with SMTP id 5b1f17b1804b1-49e619c18a3mr42351175e9.22.1789125048251;
        Fri, 11 Sep 2026 04:10:48 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm66109065e9.8.2026.09.11.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:10:47 -0700 (PDT)
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
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
Date: Fri, 11 Sep 2026 14:04:56 +0300
Message-ID: <20260911110456.24873-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
References: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stack buffers are unsafe for DMA with VMAP_STACK enabled because
they are not physically contiguous and can share cache lines. This
causes data corruption.

Fix this by using a dedicated rx_buf aligned with IIO_DMA_MINALIGN
in the device state structure to ensure cache coherency.

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index d0355763aa8f..19da164945c7 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -53,6 +53,7 @@ struct ad7816_chip_info {
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
 	struct mutex lock; /* protect device state during SPI transfers */
+	__be16 rx_buf __aligned(IIO_DMA_MINALIGN);
 };
 
 enum ad7816_type {
@@ -68,7 +69,6 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
-	__be16 buf;
 
 	guard(mutex)(&chip->lock);
 
@@ -96,13 +96,13 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(buf));
+	ret = spi_read(spi_dev, &chip->rx_buf, sizeof(chip->rx_buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
 	}
 
-	*data = be16_to_cpu(buf);
+	*data = be16_to_cpu(chip->rx_buf);
 
 	return ret;
 }
-- 
2.54.0

