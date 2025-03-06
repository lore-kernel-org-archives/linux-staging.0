Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05A175AB
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219507; cv=none; b=bZ1DiKVlGhIJV5xWQ1qagL1lyeXFUHKCxdBEGcF3c2P6+TxU8++DTH+Bp3lW6YBkO7uNdSWpAebSpkPebzmSudxRJ5TEiQglIXzJ1/gFllfJnFxS3wV9Ly4akdlSwyovCyPm5IcI4WYjGrVjmPhIyPjG+egeDIVblfCJGF3xSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219507; c=relaxed/simple;
	bh=gwRerhKsJhNh4ZpQR4SajjAscqi9DkY5YwLDwNvtn9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EhEr9RgZoORGU0hsbzZVZVlGiJKY5g6fgFBQTXJVe1Kg2AMoPijVF91hU2tkRNHt5GFzwwuGiQ9jPiYPZy/Ks+eVn7l6x7hkiyEOjRkRJ6JYI1Nftn8/xqUL80aAwF1Y9c8QA7onZKNMVZKoUKuh+GelI6XZY9XfbPTP9lgUuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHZn89/C; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHZn89/C"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22337bc9ac3so664405ad.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 16:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219505; x=1741824305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6f/NDGo0Vf2cKafvbyrDyAvIQAgQfr1nIMxIAZAPi4=;
        b=jHZn89/Ch+50u2ZE64AM5cEXD8SRRSG+9n1PpqbGQLoE3ZvouSAVMQH1/kzrIfdP6Q
         Qv1tfjO5pPxbusMaB1NdUerGfBmf4/QmkTWHhpAyANa10I41S0kIGOtQPqw7hrKwdQVV
         S36IvRCpoVtSRu6K/yxoYf8VN27/eLs9HhoXMqgwmpb/bYF0M3vPt+7p56tL4ky4pDx2
         mdqVZ5OWSrABxDNc6TehI4/exoMwcO2WT1yI4f0WQAqdve3ENbTyXAigTgSphAS1LxdW
         l9CAcxuXB7JhTA0b3qpZEz155OWB9DmKDYCI/gHoul/mgRZ/qsilHYlxc7aeliJueecC
         1jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219505; x=1741824305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6f/NDGo0Vf2cKafvbyrDyAvIQAgQfr1nIMxIAZAPi4=;
        b=L4JG4hrUSIl9jQWgu6bpzGqLDIm4k+rMe7uY13Ena2anfXuF6k7mu4HYSVQ9gvWj/O
         u8u6R6l4C5n1rS/hOkcoyVeiXZ/8YEYU403fpLup1D+zrWZf+F6LQlc72VdGPAMBDD4f
         u4Ydc67d0d7ZKHanJTOFzQGPv85WowV3fc7DwCXMm8e0T13BLHjWpzNlR4ARISKxh8Hq
         taOWk+E0aPS1Eggy/E0V7xwtVustFjQ7e2Ynl1SEtFSww51JxYeb7427ikhPpEPoiHLj
         fdXwNd1C1Ktb1g8fT6c4FWK5nnnDHVU4QqcWrW863Mlk8YPD26oMErXIZV5A+3YwO+f5
         3KuA==
X-Forwarded-Encrypted: i=1; AJvYcCX8/mCkAqj7bFCDVrDwv/e+NtveKi6+6dDn6gVD9VhZp3vwcEP6lS0Z/H8GrsKOrhga8EwbVrTxOif0HiiA@lists.linux.dev
X-Gm-Message-State: AOJu0YyYkYMTldPvMnSlDI5ms1w5EzLa1vG6la3iKUMTSUAKsRW5t2cA
	RU2ZPYCmIkX4JhF4gehvBuVBQmDSLrAkAW6yQRDVHAm7l3TkXw3EVzouVQ==
X-Gm-Gg: ASbGncsruHbM5H/eO0gmpBxY+3ron6OhoyuMHxHTIHQ7ZjTbDxj6ecGOoVteTelLPfa
	a1pZZNTgF7VrQE+T9Uw0/D5boELMsgBxkQRzvm+h5MOca+mfzc66bMBQYwgHkMfOsHs3gFo46Oe
	jxfhvJemnfqQxYX3vI9tCjBt+k3OO4E+hvGNuvOsFSJJKv6zUnAuLy4Y7Kh/H0NkMt8SB1AqHCG
	KEpjwt/n/s0wbFYxO31lNNMcdjL3J0jOHydcvg8iONee0H7gQ5i2y+J3QHzYiIzTlcbkFT+0pjg
	uJb2H4PUyzor++mbq4oyXSN3ROnteGWvBTWurObid+ps+aRtYIMtB7kaWyYPkr6cSE8=
X-Google-Smtp-Source: AGHT+IE46kf0YUY8UFiD6hZaGT679Z/DNfrodG1uHsXyVqNtQrbPapBDoHF0DTFrnDnBcXneh5xRUg==
X-Received: by 2002:a17:903:1984:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-223f1cf33ebmr75271685ad.42.1741219505410;
        Wed, 05 Mar 2025 16:05:05 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:857:3077:7768:d8a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a91b95sm18915ad.188.2025.03.05.16.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:05:05 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH v2] staging: iio: ad9834: Use devm_regulator_get_enable()
Date: Thu,  6 Mar 2025 05:34:59 +0530
Message-Id: <20250306000459.1554007-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulators are only enabled at probe(),
hence replace the boilerplate code by making use of
devm_regulator_get_enable() helper.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
V1 -> V2: Update commit description and return the correct error content

 drivers/staging/iio/frequency/ad9834.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 6e99e008c5f4..50413da2aa65 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -387,33 +387,15 @@ static const struct iio_info ad9833_info = {
 	.attrs = &ad9833_attribute_group,
 };
 
-static void ad9834_disable_reg(void *data)
-{
-	struct regulator *reg = data;
-
-	regulator_disable(reg);
-}
-
 static int ad9834_probe(struct spi_device *spi)
 {
 	struct ad9834_state *st;
 	struct iio_dev *indio_dev;
-	struct regulator *reg;
 	int ret;
 
-	reg = devm_regulator_get(&spi->dev, "avdd");
-	if (IS_ERR(reg))
-		return PTR_ERR(reg);
-
-	ret = regulator_enable(reg);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified AVDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&spi->dev, ad9834_disable_reg, reg);
+	ret = devm_regulator_get_enable(&spi->dev, "avdd");
 	if (ret)
-		return ret;
+		return dev_err_probe(&spi->dev, ret, "Failed to enable specified AVDD supply\n");
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
 	if (!indio_dev) {
-- 
2.34.1

