Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B56372B41
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785670772; cv=none; b=MCf1hNM48JnljyFG7GwjPFqaLayf7GrvjB1GbGySKIBUM5yT2e9IVIzwlhbzDVOwV8cyv1MkTKMm3QauTUWvvpA+Hy28UZGrhHEEZrABfHVXPpa8mZOfPrRBGHneUw8z6jxZPeZS75hn3fk7kHXYJDwbmlKg7t+zl/tRC8C3kYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785670772; c=relaxed/simple;
	bh=T4R1HNsXMnCpyaFzZ4pXogBKQizbRCcSIqBkfGB4Lac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ExwcsoIiPLOPpVXdA1zJc/Ha98uTZQwjDBzHhld0VPGMY/H91X4w7dUfBO4CSsu1J7DbE3F+KD3tQIAKAWgdhZpQ/Dk5Oafo+h/E1NjykVA/Mp8PfF4pNjGwlkxuYSZ7PnfVdSnHQmjsiwhQ85OCVJevTfvoXVqfCJnBlna3sYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlUcjfC1; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlUcjfC1"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso298277366b.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785670758; x=1786275558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7ecKSNcW7KFUMBHUns97kjKTa+UXCrK+tcT7T4tgGY=;
        b=ZlUcjfC115RIS7fKbaVZGSBzDZ0otMqTj5cXi3JqCrq/YocoUlSfKKYneOSKkPRCel
         KkhvBKwNTFYcsJDAlPSPboYtMoPCU4rsABY4i6rdhgdsVOXkS3NevSJ343VQOK3tY2SD
         vBTfaeKg8lALdVPmggi7MAGXr+eu+iRY8G2+uoWJYN82LZGaoXIPDZuAeuNKuj/NANJH
         A8plT0O84SrDtCmBK43Lz0xAyMOXBdsYCVsQPvuHddh5aGNfbBmSeEIrBlwP3wxTR/E2
         S+V7ptDllExwVWTLhbGRg4a0MKOh/0b44yDZm2cMlY5DV7AZyZnEZ/jG4qsjLTVOqnyh
         TI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785670758; x=1786275558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7ecKSNcW7KFUMBHUns97kjKTa+UXCrK+tcT7T4tgGY=;
        b=oHdKESzZ8kiF2nac5MA89rg9zjJAgkziKAaypYJW+0rEKh82XVOu+6ztTOa0IsFJms
         VjHd6tKxpi7612iyJ56UbpXqL5lu6MokqrJ4NYSqnTXxn11oP1FyYoUCAWewUq/ABdp4
         3XJL48NzlcEJqAsF66TcxOHVIBZDGi/a1CFwYx3L7aaW+Cw5T6b2G4RgA60MuyvItXEI
         aMlLNiIavv3Ze+x1RrwxGiGdYK3/aGkAcNodiBRh/8S4pjnX33yD5ZksCs4lMRZ7I1Mn
         ptCAsB42kCq/Z8vxItoEt00Eo8hdflJMMbSVtChdng81XjeS5ffTCHCragirSDC0dRus
         1/MQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJTKP8YbizBYgHxnDdgcBFCK9cSQSnwdKrFfqK37kiqXBjwoElLP0W47Kh8DeFml7UJFePSCH1PA/COcdy@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5gRiPSQrdyJHHmZ0RNpnQngReEod8uTQdKg/Sk75aTKdlJZQn
	43Tb/1cZoDmHi2ClvEzGKBVd91bZervYX/0DM5L2OoQ779cMTA7dfqMR
X-Gm-Gg: AR+sD13ylDxB41a7QXWWzgjIIt12TM+MmayW2ZMHEXKa7SSBZf848zVf8/6MCvWRcDv
	vDOigLb41WJrqZoUp/yEueLK0nFaqtymGBYAGq+3pfM9vH3mVAZ/ijyAhHoyOhXuCWDQOBneg5f
	PAt4pYQPS/qS95G4Kvxccu2J17uR6Cmxr9Pd2E9ETXGzpIpDhSWEfillriTDssY1UdqqFUWoAur
	UfG6RA3B5YXZ0yJGqrsWi4+RFGBamVasEwJQhm3VtgvMV6WqAFNa+26ZaiuDoW9B6mjw068oYPG
	XP61egbZvJG8x6jUPOgqSn6jE7NfcsS+coOPq0pGdsn0rxeWqYu2IjH6M2nzfvSnNHvo2xdzLxa
	EiDfbUHNNya9PVaSMCT7Q6qZpb68CNdAUsA+5Dp0GsiOHV4MCupjk6rIB9Y2qv88wSLPKaJ5BCl
	7skIz8zh8YgniV0hsTZkfkbi7oDfR9ph2LmHbX3syBqtIQdOQhyfDh3BFOmgeU+hKTuXEz/CjuX
	0Rwt+vYbQ==
X-Received: by 2002:a17:906:fe42:b0:c16:3074:657f with SMTP id a640c23a62f3a-c1fe7ecb6d3mr535636766b.9.1785670758004;
        Sun, 02 Aug 2026 04:39:18 -0700 (PDT)
Received: from fedora ([154.182.104.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4532e1esm407679966b.50.2026.08.02.04.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 04:39:16 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: iio: ad7816: avoid DMA from stack in spi_read
Date: Sun,  2 Aug 2026 14:38:40 +0300
Message-ID: <20260802113840.17730-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI core may use DMA for transfers. Using a stack-allocated
buffer for DMA is unsafe and can trigger faults when VMAP_STACK is
enabled, since the stack is not guaranteed to be DMA-accessible.

Move the transfer buffer from the stack into the ad7816_chip_info
structure so it has a stable lifetime suitable for DMA transfers.
Mark the buffer with ____cacheline_aligned to ensure proper alignment
for DMA operations.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0e32a2295990..fcaadebff0f4 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -50,6 +50,7 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+	__be16 rx_buf ____cacheline_aligned;
 };
 
 enum ad7816_type {
@@ -65,7 +66,6 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
-	__be16 buf;
 
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
@@ -91,14 +91,12 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
+	ret = spi_read(spi_dev, &chip->rx_buf, sizeof(chip->rx_buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
 	}
-
-	*data = be16_to_cpu(buf);
-
+	*data = be16_to_cpu(chip->rx_buf);
 	return ret;
 }
 
-- 
2.54.0

