Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505541DEFFC;
	Sat, 19 Apr 2025 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745071008; cv=none; b=bYE4Mix8mrU2T4o/KHQDNZBg8GlvFfkTfV23xUvLbci32kFRW2E8xaVGt4t6GTon9iyE9z9Er+qgHYk3lyP6NrdxczGnh0K5p5yYRmUtO66xRwZ3NpDg7nEaxyV/OqxF42hn+nkulaWw5xxnsttGgv4a5QEbknMqmDyhQYXPNqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745071008; c=relaxed/simple;
	bh=Ubbbw15hEAZ+J5L1Ub1FKSI3XNWrOXLdqS9DAd1ONgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1936XtF93LURYmr0XjG8OKsFXg7Tf8VpMjj9RvvhWikMd/d39zSSFoKmdnZVuibMus+5szMBmSqXyfHtk7IYAgMfz5KEIOR8KoQx19Y/QbWXU1sRvRgBCBXe7TI3H+u4y7bjL1NRvu7KsYe+9Az20bDWQ9GoEPGzeSABppekCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9kaWtI0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9kaWtI0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c081915cf3so363790785a.1;
        Sat, 19 Apr 2025 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745071005; x=1745675805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXLzgwUjjblsXqDwVt3NWjFIy+rshNgbw5xBdqozz6Y=;
        b=k9kaWtI0j6gG4E5tTChPGYWc5JNoMaVN2WBMRXxxCoUbqOx7kw2tkmVqC55lCBQaH6
         wtOrv8PcZcM1PSMZVQa1atUPX6UkI8hmVdv+QCW1G3AdmcKcMjYP1he+wxsoj2WgYHFE
         T13PF4ZrYSGrCXzmyohK1Gqvl1FfC64G5QIbMwk+Sfpz1GZ4fa7l0FEjwyu081h0YZdK
         56oQIYAGRyfZj/bjYLtnGCtNYMBZyw7zi2M1OtXgZpwGE8ctQVCJ2rlLo2Y3f0ZEGpfV
         gNuRDd90nwi9NlpGDdsL0ZmkBv/QwvriaR0txmRTmCr0EM24ChHMKndIpDz0qnTPAEr/
         jA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745071005; x=1745675805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXLzgwUjjblsXqDwVt3NWjFIy+rshNgbw5xBdqozz6Y=;
        b=A1jPZtFoUr9RALNaPMmsZrVFdWriAT6ORZ14USOEp7A4qhAFJTJiDiGA34JMZi8XsD
         Hy35P7jS48fdndh2/zYkWgEpw27maYIcBcE3MOQZnnTNZ/rW5pIJYC2RMP0NZwdZ1ERM
         w4JJgFfICUhcVzS/L7LEpxzjAgVNFvJ3aryZ9thNsPHBx9XQr0EzDGStAoDY9QL+3ppo
         wcZElgbQws2wmO/MQJhmmZUZfjCYKzLBlfNkKVob9BsG+S9MVj/eTI77/VtcGEjIyvkn
         TqDO/1pLyB0o8XfxniBl4OBqij+cjz8qkMoYMJu7F/wh0UYL+ziWIAd5AV17H921MocV
         UQhg==
X-Forwarded-Encrypted: i=1; AJvYcCUqbdqFG2kzFKDNoCKHSuGizoSy4voVYm1qbw9nUvKZIXF7tlwbMSZ8wAQ0Q17dPinLPgGh7usYYIvUtHgQfWJ/AGxbKQ==@lists.linux.dev, AJvYcCWU7lve8uqGwPFwdBhpWxzl2dGunc8rM1stb80qoUYDPlHLVgdDKRoU9Us+uAVaeUy/UeDFookhclcqTyMPlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFICNOf9pDWqiT+r0tgiaAKGoHe6Nv7+jgWRff9bbYEKwvUPu0
	339WVNQ8/PaMtk0UO7fvh7tIfGiScAg6ut85zO7xVIdqNoiVE1Q0
X-Gm-Gg: ASbGncsF7pvpvePbnyBiGadqyqqcDaQeC1Isu427r9S3XejoD5q9KudHxf1nMragSvk
	bwX4BrQG4UUu5ObgYCMR1YIpT+0fUUjK7K3+MGFKtnKhTmwcTkf39vGjC50pkOnJJsGqTClKyP5
	Jnv2AKoeuma6wam4k7SQhzm9r1wqc86sYoJY0177IRn9NrPUW07HZ1bV9epj+dRYIjBOxU1HHhM
	KttXvA2PKROf13XpjpSoZGyeouhOv8RiKYhAtd+9DjLkg9g+Yrot73itS/7JpqYx234NfLwm0iv
	HKQ6/18fCDGmBFUgF3956whk+ibNd2U4q9/tgEAQ8P98Dmxl5iRZ8Yg=
X-Google-Smtp-Source: AGHT+IEY8DzCnNRzJzQfqd4P+slFQb/ni465buefMU1Eu3pZIczpyhT3BmlaRKBhgbKTouNSjsq4gg==
X-Received: by 2002:a05:620a:4694:b0:7c5:4738:8a1b with SMTP id af79cd13be357-7c927fb19cemr812146285a.28.1745071005256;
        Sat, 19 Apr 2025 06:56:45 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac4749sm214350185a.59.2025.04.19.06.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 06:56:45 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 5/5] staging: iio: adc: ad7816: Simplify channel validation using chip_info
Date: Sat, 19 Apr 2025 09:56:38 -0400
Message-ID: <20250419135638.810070-6-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419135638.810070-1-gshahrouzi@gmail.com>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the channel validation logic within ad7816_store_channel() to
leverage the max_channels field previously introduced in the
ad7816_chip_info structure.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index ab7520a8a3da9..7a59cfbcc6e33 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -204,17 +204,9 @@ static ssize_t ad7816_store_channel(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (data > AD7816_CS_MAX && data != AD7816_CS_MASK) {
+	if (data > chip->chip_info->max_channels && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
-			data, indio_dev->name);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1 && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7818.\n", data);
-		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0 && data != AD7816_CS_MASK) {
-		dev_err(&chip->spi_dev->dev,
-			"Invalid channel id %lu for ad7816.\n", data);
+			data, chip->chip_info->name);
 		return -EINVAL;
 	}
 
-- 
2.43.0

