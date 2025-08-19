Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6231E10A
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603593; cv=none; b=eYL4QmMGHHgK1YTZxJDE0lWPJqNspea2vgmxSxq36+pCIYm4zo1GG3XfnbyqtcVdK1x0Vr+QW1ENQTmH3Xl0fEtXsStlHYOdgCqqi2NhvDm3sJvgwXG5vwxsRa4kwycyHmM2kaPWlSJb15LqE7Jep0FTr8CpFp+whs79p0gwbdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603593; c=relaxed/simple;
	bh=yzPa+ozyXmPnfMnBDHe6hjrPY3CWOPGU3bBJlC3RrTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDQTt+316cHfC32ih9i1gk8OhVt0B5ZP9xzFRuckKgjcw7CzxKYC6RCIVfsS29QNS1yiE9bV0xDNaySUoYLl+irpRvfzlakDWQy+2nni7hBa3lwl4/5izqoz8zDJVGZpW1YUrps5+5FXMNffHlh96Xru6zzB6/aJfZwZKvSZnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8zqgBbQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8zqgBbQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b097037so28956975e9.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755603590; x=1756208390; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/YHiMiSEXGJ+Otn/lJFKDk3uocdFFMzq2l/EhCHt+4=;
        b=f8zqgBbQQkE9pTPR7TNV/b1kDklZZgofCZXTmVKM+D/johd5UIsoWwb9+mc+VjY763
         U1wDA3FTf0E3Nw2HD34Xp5dUZVsQNK18naXDsjEqQiYcAV99xXVsLn09oWCRlW/RPAmk
         C/qrOXS5muiHEpH6azZ/7ugf4UQ0wXPGA/GIKkpwP0ktQV5Mw3zaALZ5E1sV1O6bbTwL
         lHnEyWNZGgBcwWUD4OA/oK0M9+KY2nYInRykk10ggSOEQ7fV/jnkMVajTxD8R+sF+SOb
         Pi3qvNQTPlygQLhBsuJ2J97LUQwkXOUXcEq8BmPTsUIcC19345uIKaITv3Hd6KQbVLcw
         isuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603590; x=1756208390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/YHiMiSEXGJ+Otn/lJFKDk3uocdFFMzq2l/EhCHt+4=;
        b=BVIupB4auivrLg0ZHU0oDHVc64QOa9NQA/HVzIVY6/Y+bLyR46qKBuTxwWGMziSPYp
         3HewMSoifr3VlSQRE074Zyofu7N/0/OoeijMbM0tlzrQfx0HvywAHfRsS1q9rgKHey3I
         S4YqcNNiCtZJzAEze+w+s5BvYHi0xchw93QLT60r2YqTYvqSJyYURlcynjCjlIDUwKGa
         6WNyg/GyBgGm3Bv9wz6o9UTCxPiJt6Hjq3kWpFkjPodWJWvJb5utUcJKsi1erj499jtR
         Y2QOHjxkH+XDwoX+e6eIKBU59QT1HIQ4SfdBPvcoRvRO7UeZO5vBOBC7OKXmD0HTR2ow
         CIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXIMOT8W6+SETQDgCUYDl1vM9lgf195ul9hTCfdxEVdc7wRfGu33nzL2GPqBa2u1XmmDkCEJz0KExXT2Hh@lists.linux.dev
X-Gm-Message-State: AOJu0YwAE22Il2DK7aaK1zJ8PoQYGymKPim4LpOKW6RDWSfMsawmUW26
	/Ce2GUwm7mq5HA1pLvht9pEoezRS+uNJ4pmk/ArJIMGkNiDE7mCZsz9u
X-Gm-Gg: ASbGnctNZ57DnN+p/K7hpeOX/yLE47njE9/AdKFo5G3Kar75M0MSG2aOw44m10kmSPb
	Nk3I2EP3IwoubZSQAJj0J/r2ULeYlerIQWnJ5DDi8emE4RAprW3/1QvdsvTCV2eOFJUxEUldQcy
	f3z2+/8NMYIzPh8j0QMMXv80HvUVz2UZYkHD75rgRfqA/EJo9F9OgoD2semZXZ7WnSss7Vg4das
	wOlXdaUQgDhW0qeC+26HnpVy0m70N2/kR144X2ND8CKE9+6cSYkbNG2R2qAGKkSLI75lq9ZnJIt
	RviJ0dQStBXBNhrKPxN/O2m2nl9IIxNmEGKLLNW0lU0zH7WOY+OoDG1Hl25AlCSuDTnNTFVTRxc
	TjLVq3/FB
X-Google-Smtp-Source: AGHT+IEEyAKmkNJbiKHBYaP4BljEbzWdPCRpfKg9xhckNfhaurnODS7Zuy7nPkGxLEza4L1RzbfFVA==
X-Received: by 2002:a05:600c:46cb:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-45b43e12419mr14734595e9.23.1755603589519;
        Tue, 19 Aug 2025 04:39:49 -0700 (PDT)
Received: from pc ([165.51.6.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c19fbsm3425900f8f.41.2025.08.19.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:39:48 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:39:45 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] staging: iio: adc: ad7816: Use spi_set_drvdata() for clarity
Message-ID: <aKRigf3TtH-x-i1C@pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the use of `dev_set_drvdata()` with the `spi_set_drvdata()`
helper. This is functionally identical, but improves readability.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 4774df778de9..599f75103cb0 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -360,7 +360,7 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
 	/* this is only used for device removal purposes */
-	dev_set_drvdata(&spi_dev->dev, indio_dev);
+	spi_set_drvdata(spi_dev, indio_dev);
 
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
-- 
2.43.0

