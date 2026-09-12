Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39F47DD57
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219572; cv=none; b=BNAQdxezqCx43jrCNWT/LhoKiaddjOoK8aF93XMTQbHX+4pyupRO21SdViagdr9U91aNsAlSP/uX8r4vdzsZf57jCIWnGvQNCHILWCak5MCGt9jWPpaB0DY8UKKNx7QMM2KlxlPm3O/rbFms2tw5NYxD+GekSpERMa8+fqug1rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219572; c=relaxed/simple;
	bh=7CE8YwlilBd1VM+J4eCukboYD8vi5XXt1Ru2qxPspMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVX2kpljklw8SAQjHtB6a/pHUmZvGRFs2DHjkypWwaKvO5Gk8MJgT6H9a4f8iQKGgJ6hR5w3axac3LiZEN5s584YJghlW2WuF/NTkWQ2kyXh64dMwkA/1mo+ipyzLbFCb6V0p/cFkRJGjBPPPf0S0nwF22tSpRk4fl0KxJV7yjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDg4VV0x; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDg4VV0x"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so547077f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219569; x=1789824369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gF6cpu2FDuNRXYtVifufQ0jbLZ5i7EeoWxGFjWtrGA4=;
        b=sDg4VV0xbSiafAPXnxXJ8gPlvLt+DrXHFeXcudDK2uoFFsTvAJbNBoW+bHzELA38le
         vEV+Egn9lo2ZdtKVzJmhXINhKQckp42IzZHKywmaggQCB/UkCqFO1eUhKL1xY+smYCM4
         ah9uBWhws1mYZ+IOU0GXVKihm4I5paGe+BJAmewqJ80rYIot1jp062QzPwlND4zpKOX/
         /su57YPS9+LCyjGCYrma0wr1w+n2b+8CtFA1TH36CSAoPAn9sy9VnDt5OLtzIj4OTbEa
         uTmhyRVoAqBf5rOfPTvn6M8Oehz1PBhNSsDo3htIdvOItmzDnpcIgZld8KLl12Px+r7h
         Yngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219569; x=1789824369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gF6cpu2FDuNRXYtVifufQ0jbLZ5i7EeoWxGFjWtrGA4=;
        b=Qg37YGD0XwJokZUqy/KNcrqWpYAJtbVnRvJiWsGRlYJQldpgpqh/nanq2JUDcg0j8z
         uYBxj1+vWa4JzAkLUX6xnCDGU8NOf5gKAalZES9pZrwePllQYHNMStb4DOWXRhW9m0yX
         yIP4FaZ+cU3mstRchDhdOy2LraAOa5NXVLWR74MT7mHa/Lqzrk+ZmKlFQUesMH7AAj60
         s7qiQsQOG6tjAyu77emXK8yvmKkO51L5HDacNM73J8B2IxWTpK0RDbXbshXJvMaIWU0R
         Y4qniSsoWiuUjDV2mm6qg+7Iz5vlVBooePF8ZkF9kIDQbJk8DELyqKhoeRnI8AAZKwrw
         XC2w==
X-Forwarded-Encrypted: i=1; AKwUvBw5G3gcaqyIQx6u3P0aU7DvzW6dnC/5wEfHRXJ8qSkl+Yqm/JjXDZusIeHoyqC+XC0yDI0nxWsBezGUgDlO@lists.linux.dev
X-Gm-Message-State: AFuF++klUmTVQcbg6z8N/iX3xHmxo3GepTZ9yWONDUUEV3DHTM74kaCq
	xwxxj1taAYPs4xtxyUEdZ3zz8ghqq34LGP4uibtWWcnAXi3G1+x4pW9p
X-Gm-Gg: AYBFou3+Ubsf/s+FEXZ58K6UIBXnbVqD6yWuo0Lqr3tD1BZFgDyaIKtRIvzmW9mHiBG
	rXRuFb0B3pbSv4bZ7nl9zMu3gfLklGj3G6pceGbomTHzTRMU+yX+IclhaRUor25lkKhFKQ4W7S5
	ayc4Ih6IoW8Ttlaquimyp4A7a5Zwd+0q6zN3Vu9Y2V2eXHVRBKTkLLusRo/z/VFeSpmaM6VVaiH
	IqvRZWZE9horpDycstZ2WCRcPYpeO6ewvivnT7/s7DqfBLfhChknlmQYBLPI7NVB9rAG1cQx3aH
	vfYvzvrQHUMZZylf9x23oi1kDuBSP7mANAuMe31SeaQhICqlV0tyz69my+g0oIWGzG6CTAdEAsu
	9oMNFl5uERoOqMAoKKQMleVRObCB1mtEQaAqrJWdHG+2xz4eVE9rJ8ZsvAS4D93WV1NQPo/OtkV
	esRuYClo6Hnh/MYAm00IpZmNHqjOCh+i1WN3M3kkV7AKw3JdAtVPNU1Wbpa7A1zCYruHjsWac0t
	eRATUJd1O26sI14kYRJFrZnYX8n
X-Received: by 2002:adf:f9d2:0:b0:486:e6a2:2d7c with SMTP id ffacd0b85a97d-486eb31b1ccmr15058844f8f.15.1789219568859;
        Sat, 12 Sep 2026 06:26:08 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:26:08 -0700 (PDT)
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
Subject: [PATCH v6 3/3] staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read
Date: Sat, 12 Sep 2026 16:25:17 +0300
Message-ID: <20260912132517.55686-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
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
in the device state structure to ensure cache coherency. This also
corrects the size argument in spi_read() to match the new buffer.

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index acf26c5a267a..2fd2d6796603 100644
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
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
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

