Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1551DC075;
	Sat, 19 Apr 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745071005; cv=none; b=PPM44ulJX53uaQSu/R1jHT6SrwiBoyPEF9wIc9Dc5cl1oNU/RzRBz+UHdo/GwSgWPLnn/HcT8j5asyCbi5fUSC4zh/VBgdhscHjbEY7N9MZjwwmsr81lEHnlTMgN96E30oN9ohpDgATF26YkmTZnQ5teXq45kTfe5Q8LOnLzRow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745071005; c=relaxed/simple;
	bh=nhjNiEws7JDfpSABnQRCrgaV/jVLhmHTd1ukZHOLh3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgWebAjPjjLXyUt5HorQA18uzqAeeWOGdTM77NrIYqsnOJZRCMHwXJ6dFV2KoosWeSed8Ky7cbNbQNMxm5npQeNcL2K2lGfptnWIxr/qs/2yFildp1QmdKeOb2CO/ME4409SMNKR0WW+pOQNzwAAYLq4ue2vyfkRLYeANGzZhTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbxcZLK3; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbxcZLK3"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c07cd527e4so255969685a.3;
        Sat, 19 Apr 2025 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745071001; x=1745675801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk0TUJMIcvb2/Yt9CvbEI4RZU5fYHN3893YNwk+aijI=;
        b=TbxcZLK3f2p38cktaFYvA787Q3bafBA0oxMsLE2BrMWfFFbjlE1F/2EBNufUkONW2C
         t3cwpXauFYEenU6yDNNCy+NpaDrdmMcOpuTghzUEQYKel3u+Md9UOH+IFWISVTbkChfM
         hEaCo6HXATDq7ZeKc6Fm+TtaaHIo0LSW/tWRKFwRY0cLDcfhVZTWpRYIqmz3mrfwG5RR
         89J0Cbp7vxV6OSPJP4cllEsXD5x+PiyKjEwHOEC8roxIaIuVPuhryoyA6apApa4Dc+c6
         EGmVmLftIk74KN/L/LyrHV08P8vvlYtS5HB/+teRfnv3407jKopwL+13yzLebYr6ywaH
         Mewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745071001; x=1745675801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk0TUJMIcvb2/Yt9CvbEI4RZU5fYHN3893YNwk+aijI=;
        b=cGDNzcfG1LdPYY4LzHgb6ABlRMvMTxV26wqcPe3J4ve+AqcFeqTS/0u5aJqhTtnQ1N
         gdNjdhN6d91shur2/aLXBOU9Zbl4iDi1/CyHTzkqljESz2WBLVf5r+LaDycj+v03Yhie
         HUB9GBpNV4jTnvwW4vAFM5jLE+kUpA1zPtn8xm+TP3E3a1hDGIV4ivTZ2EKug9bFbSHS
         S/zWgvFTZKvMY/fRfxy78MORBiwEC/SHBw181aHlGQ/HxAPGc8wXYRsTOlDi9SbRrs+z
         zD12U2S7uMRWYFW/R3F61wONzO2aWi+RYpVTrDzVwq3ijrOHw+fi30050w2FknSCTCry
         NUyA==
X-Forwarded-Encrypted: i=1; AJvYcCVF0PkzZpifdGwqn0++AyWosQCkQhcoCvDuHGRueRVr9i6noqhPiKxE0QB1z3peTjuF66qEB3lTtyZtjLZOyw==@lists.linux.dev, AJvYcCWTkk0Ww7o2L0/U0e4HAokWdlaGnoW/sEjNrjPzuvUI9geZ0FJsUcW/ieWqTX9j95sXv6LHAwBj+x+z8rVV7qhKcjessA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdok49yRJNsxbqx6dx03QseLTQEA/AviphVf7/VLmbYKIMk00S
	OYgfUstILF6ZRvfKy4xstsmnj8ZpLyYwaYiAOf8MO9+3NIG68hhp
X-Gm-Gg: ASbGncuyjcbNCZur8UmF3Ys9GKMzD/ZkFx1m8sGys4KFuuFi0Bu699kImqsP30Gdiq8
	wdWB12ETU5yRK2AoTkbTCz700i8CHTrXHrA2OG0MAMiLduAYAV7moWZshcxzOGsPU257Y2bG5vl
	fK22l1RzE4UBbWNlU/23wAbLQYN3j2suIaza4GZB7IY/VQRIzqQY7QTmdG1E3uFjNC+D0T7y3Y7
	GxXJ3SuKQy5OtbKTDMFDuoL81c5xuogNLSpFKzTJ3bPdRh7eNIwhuZaOwvI9wPmQ+skQYMjsPHx
	Q98ZCosGV3nkhCv3AYNI4bTlfrMwgAzAL7ORIPVTHVc6XMUGxE//hVe18L3H3Rcerg==
X-Google-Smtp-Source: AGHT+IF/z6GEDB37r31F0OmR0P3pDnZmdP9f9ReQJm7FpvmCkWJBHCBmLHMxzR7sz1S46RqTgA3Cew==
X-Received: by 2002:a05:620a:400e:b0:7c7:6543:2018 with SMTP id af79cd13be357-7c927f6b2c4mr926327385a.7.1745071001441;
        Sat, 19 Apr 2025 06:56:41 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac4749sm214350185a.59.2025.04.19.06.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 06:56:41 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 1/5] staging: iio: adc: ad7816: Allow channel 7 for all devices
Date: Sat, 19 Apr 2025 09:56:34 -0400
Message-ID: <20250419135638.810070-2-gshahrouzi@gmail.com>
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

According to the datasheet on page 9 under the channel selection table,
all devices (AD7816/7/8) are able to use the channel marked as 7. This
channel is used for diagnostic purposes by routing the internal 1.23V
bandgap source through the MUX to the input of the ADC.

Modify the channel validation logic to permit channel 7 for all
supported device types.

Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 6c14d7bcdd675..a44b0c8c82b12 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -190,11 +190,11 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		dev_err(&chip->spi_dev->dev, "Invalid channel id %lu for %s.\n",
 			data, indio_dev->name);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1) {
+	} else if (strcmp(indio_dev->name, "ad7818") == 0 && data > 1 && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev,
 			"Invalid channel id %lu for ad7818.\n", data);
 		return -EINVAL;
-	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0) {
+	} else if (strcmp(indio_dev->name, "ad7816") == 0 && data > 0 && data != AD7816_CS_MASK) {
 		dev_err(&chip->spi_dev->dev,
 			"Invalid channel id %lu for ad7816.\n", data);
 		return -EINVAL;
-- 
2.43.0

