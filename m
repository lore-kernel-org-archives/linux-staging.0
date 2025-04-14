Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C4274FE6
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645193; cv=none; b=LQp1bphM7sw2wuy8r0WrwI2z/NmnOyjHbqQtbbosss3p7HM70oh7iKRLO5o75ZxAgPmIrPe/QYM3sXX7RyFt4uYfMEdgGxNSHpQDpoY8h6B31WcHwHEKYDoD4dGy6AUBRNYrzLfVYui36K2KhmSX3ax85kk89TLgtbiyhZF3PVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645193; c=relaxed/simple;
	bh=Shx9w5ToVCi4sff7w0CjLM7Z/phSkqNv+tYwUPKOOTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpIL4p53ipnXtPlTKD3OtVH9q97LiCpnfH/UsGtY5Oad2H85XaBTRu6Hgl3jQfD1J+fmxJL2veBywaKYT11GawO4un8kcKnaYKsVwXZ/V/R3sj1G8ElkDerpskAqtEdXedHs7Mz9jJ07H6bKyivRo73LBvXH1PyQ+K2euYeAd8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo9TPo2P; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo9TPo2P"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4769bbc21b0so39726241cf.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 08:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744645189; x=1745249989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mqOeOTVBHYK93IJiadkRz71/O+ouQlq6IAs4FzVsl24=;
        b=Vo9TPo2P9Ho0f+KPDnOnk09AUFTVKT8iqNCPODLba7o0PA2eCfT436UypBkhQdv7Bi
         brTCyZioRq7qlFaFyItKLfqP2DOEFmfwZcVcMeu+QfPGUX6SywEQq+Bkm6hsDIgndPuV
         HfyMYMHaY0KrwoutSSi126KBS+v8eAiIgfhpsPsUKGeLG7j84MW42NxR4DtpdwOUyalm
         EgsGr+eaXXlA30YdlqNRt86fzqv5t2C3u6qlC32JrRyBaBez/zqPL69o/9B3ij3HaJ0X
         ZmJhn4UV1vvJCgNzHR5ZI9Z7crAL9gCpiJFdYxUBXDjiZ50q31ggjUsR88GPlfJlLZxI
         51DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645189; x=1745249989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqOeOTVBHYK93IJiadkRz71/O+ouQlq6IAs4FzVsl24=;
        b=cz6UzLsG6Q7cF7You7FVHRGNbG0dA6jSzDMATO7mivKicC5M2R4M0600IU0T5zWSTb
         4IDUY23TyWUu3wejvVZ9xYNIaR/CKJBL0FwPeRnVw/az5+mI7QNNXe8opjYQvqkLz01z
         g2hp7/lm1KmVtGEwnl7dEM148mp/U4mbZZTHlfwRnA3FJOdu5mmZXovlz5qrsBcnW481
         YCkffy/3Blyscw6mMi/ItrLcslJ00E6Dxp7Jxj6S0t7X+rQqOOlgZnbMb0GU21uEHuYo
         x1rIfsD5NqI7wLMJBsDRJ1GKbyv3vk2zqiA+nJsFHYV8cb+L+c2Ol9F2sk5+YczF4RHf
         GPxw==
X-Forwarded-Encrypted: i=1; AJvYcCWqaKixbvfKJSblT2J4lBD1J+Au5txrL46U01y/8KNuuDuVVkEZAtpjSWYgZdZwPAkC4OxQjxYXkA58ogHu@lists.linux.dev
X-Gm-Message-State: AOJu0YyJO3kLNfERKqG4pAKFnB00PYxxtaRp5a3Oz1hxfJ66faDw9Let
	JFoNNF29twuWWN/KMcFJxlu2rcmTAEXXdEAB+SD6HZIM18lpw+0V
X-Gm-Gg: ASbGncvyQeicPrIp2trevBl4WPAmOT6CN7U4nt3VUuv5dix9A8Can7wFnO7AtltbcGn
	WsnQJYnsi26AVu4V37+/ZIJ2wT/QCqyE2yRMRjorA5BMPXNfFZuUvvUZ3AbWhCnhfedMunWVxhO
	MXcUYwq/pf3wM9Ewzn4kxutBGUH/lc9XIEBHfYAb95zgJX23Yp04ml3ziBBwms1dWRYLVrTYkP7
	kkUM1BqGTwTDVQeTJVep7y/+JxGeyWpHsJbo2jdKj4Rlji1I+97cAme5ayeadLcAFqdV+I5zJ98
	TWieXCLvK9pdE1O6zHkCwdyU6Xz8jlxvmQbCgZ90PNhJXyVBA1ZcGlc8RC8th0Mgj+VwR2E4bWI
	UTPngsCbP/n0FOn9G2SM=
X-Google-Smtp-Source: AGHT+IH057zq5PF2wKNUBLrpJS8WguQdnGVsVYpLyP7i4b7sKKSPZxFk3wRU/LDT3qoycsQQ2vUU8Q==
X-Received: by 2002:a05:622a:1107:b0:476:77a5:3104 with SMTP id d75a77b69052e-47977523b4dmr214167571cf.11.1744645189045;
        Mon, 14 Apr 2025 08:39:49 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4797a21aae7sm57700791cf.16.2025.04.14.08.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:39:48 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org
Subject: [PATCH] iio: adc: Correct conditional logic for store mode
Date: Mon, 14 Apr 2025 11:39:46 -0400
Message-ID: <20250414153946.469354-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode setting logic in ad7816_store_mode was reversed due to
incorrect handling of the strcmp return value. strcmp returns 0 on
match, so the `if (strcmp(buf, "full"))` block executed when the
input was not "full".

This resulted in "full" setting the mode to AD7816_PD (power-down) and
other inputs setting it to AD7816_FULL.

Fix this by checking it against 0 to correctly check for "full" and
"power-down", mapping them to AD7816_FULL and AD7816_PD respectively.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>

---
Changes since v2:
	- Add fixes tag that references commit that introduced the bug.
        - Replace sysfs_streq with strcmp.
---
 drivers/staging/iio/adc/ad7816.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..081b17f498638 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -136,7 +136,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	if (strcmp(buf, "full")) {
+	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
 	} else {
-- 
2.43.0

