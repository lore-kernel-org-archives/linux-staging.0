Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55104190473
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459233; cv=none; b=ar/yu1quPjCZTQzDkFD+1S1HIEbAou3tZNu/wHn5JONiWwePuBP5aeR9az/xFa5WnYCoLuHk8F2aNVxQH+iHz73lkdXhhsuZjJzpKMsb4ZhKAp6AUKb7ZLpnM7CMFYFtIr3Rob0Km6KEHQJNm4itB7R0n62NEuPNg+gMcsRsZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459233; c=relaxed/simple;
	bh=KTgZMvg4dulJZHvYNEIoy011mnzTSGSayGEdve6hAJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKsdOzWDpqxOE5u/FPPJ+aznXasMkVwTq6hW3oJNNiwT0fgd6grNGuuM8waEQb/43yZD+YmsN1lTDVpll2l6RNmrX+i3hz/h+TMm/sZFGxigng5wHxbjrsbClJHPsYWn92peAQJkeq6i4AFOo6DXIrtgPFV7niKB1dJV9bvgd+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhJT8F64; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhJT8F64"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso23071435e9.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 01:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459230; x=1790064030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfw0WXqsQI2eC5dBxcA9xLNGEmKqYt2MXCmmX8Bocyo=;
        b=YhJT8F64WUKDxXLdse+wtIYffADcGHEokdAQCllUAAoxichWcN8YnQe7hVFZoO4fDd
         fbS84gG7ftrZc7kDVQMY806NPZ32Zk8kDsmQSxgKWIV7pYvbLO3v/8pPf2vNDOoNv919
         E6dpRjgEuHj2FRZ34TSG8ldmUtAwK2t5czp5NLt1MJPCKjsSxc0udC0apTl/TQrMquTH
         mEFYftBdd9htw3bC27VM6dNNqutURUXK6rqRmv8km243tzsjNpKoChJ9l/eHwW8mL84H
         0okD2IWwkBKpzcRtK0ZGEYThb3OckWUvdZcozoz9bgyUua6R02fW1t8+r6BEAWU38o9X
         VVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459230; x=1790064030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfw0WXqsQI2eC5dBxcA9xLNGEmKqYt2MXCmmX8Bocyo=;
        b=EzEa3Rdzexu9p7ory4MHxzgIVjC9InyjMxTEofyFLi1pPvL6Vq3tNBH4DV3JvlSF1Z
         1JmUWYcaMbHqz4H0zNo6zXJ5v7vHCjO3wI6IT6o59a/dS5wShG1WQSId+NBSMCvmc8H9
         8BpbmSzxkrNtrTIHrLGQKTjPvjRo9rZpZ8nK3KkC6RHWhWCo5XdV83tlR2QJoaM3LqCB
         DsusxxYNGHRNdcJe0bifR9ABzOlhvoMlPhgyX36mZA6J4QknAmiP60KQgNIYOc8MwLpq
         TYiWsaG+yQSEhlBF+9mxiQmw3fV0Kz+1SMOC2ZuXUj4OjmPo4qJ04pZhhuhAiG3ME7Xq
         M5vw==
X-Forwarded-Encrypted: i=1; AKwUvBzqzuUZIH1ZLQQpepdIfXBi8UifE9VkXGK02mmJSS7axT/ZyYAB9Y1tTdoT1vzuewiAIdVLr+mHJHOHswvR@lists.linux.dev
X-Gm-Message-State: AFuF++m5tJybk3v4gdlevT7vXBaHzTJN6qQwTBD9ASmrpPRgxInrWbTr
	BzVxipsthuKqL6QF0K5XnUCnBM/H/EasyTYZZxG0hSyrp56Xgzx+W84P
X-Gm-Gg: AYBFou2LTO6m7R7KnFwWTEGOiwLp+9MlZmK/6YYckHxNjdhrF64YW0mrIUpZqc5jP7J
	CAdjek8QTJtkF8itj9gRl424XgIcwakEjfWW468kAc7B8UJPZJhNkgq0dxltZuK2BO0NBBxoPFY
	B6qKlY8nj6YLiP4osl3Fq4Qkf2XpRbqgP31oM8zw7wWesR9n48WWzzCQdBJA6+jO//K02MwnWgt
	bm6mh1h0DM7oMzU62/Pv2aJWXqi8sqDtpUS0GG/HKYXIKXDApp81ndUNCUhu5zDDH7/uZL33tIG
	G/6kSwqQ7u6Q4VqHPzVmrW6nIxf3GrE9Q0PdAkKM7COiaPbdGFXe2wsmTvJMwvEiGu3O8uz+VhZ
	+H4sGJI5TM4oImlQxH3XBzBzCxzN+eWYQPQcvNwVtlPdyBaQKKu2b4sUvziY2Zol8jUShz91P/u
	KnuJszPqZMiEOaaKspO0GPhHUmaMdE+YGDBaz/+69lAp3n+QM7Nh/ZrspzniOtQKlX6NJNuaxet
	NkF7BuIy18ZKib2+gw=
X-Received: by 2002:a05:600c:c8a:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49e7a6386d4mr71308795e9.2.1789459230005;
        Tue, 15 Sep 2026 01:00:30 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:29 -0700 (PDT)
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
Subject: [PATCH v7 3/3] staging: iio: adc: ad7816: Fix DMA safety issues in SPI transfers
Date: Tue, 15 Sep 2026 10:59:39 +0300
Message-ID: <20260915075939.18180-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI operations in this driver are not DMA safe:
1. spi_read() uses a stack-allocated buffer.
2. spi_write() in ad7816_spi_read() uses a struct member that shares a
   cacheline with other variables.
3. spi_write() in ad7816_spi_write() passes a stack parameter by
   reference.

Fix these violations by replacing all spi_read() and spi_write() calls
with spi_write_then_read(). This safely handles DMA by internally
allocating a bounce buffer for the transfers, avoiding cacheline
sharing issues without needing dedicated aligned buffers.
This implicitly corrects the size argument in read to sizeof(buf).

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index c18093ca8a82..f76f0215119a 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -74,7 +74,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
-	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
+	ret = spi_write_then_read(spi_dev, &chip->channel_id, sizeof(chip->channel_id), NULL, 0);
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI channel setting error\n");
 		return ret;
@@ -96,7 +96,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
+	ret = spi_write_then_read(spi_dev, NULL, 0, &buf, sizeof(buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
@@ -116,7 +116,7 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
 
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
-	ret = spi_write(spi_dev, &data, sizeof(data));
+	ret = spi_write_then_read(spi_dev, &data, sizeof(data), NULL, 0);
 	if (ret < 0)
 		dev_err(&spi_dev->dev, "SPI oti data write error\n");
 
-- 
2.54.0

