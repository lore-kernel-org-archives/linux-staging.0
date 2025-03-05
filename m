Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DBE207A09
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 23:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741218601; cv=none; b=lClDg1DBo4flnfADTNBlApzuvFm5T3opwEyyIjf1B4choozpVe6wrsA0YfbcveeJ/XLw0FDQQK0VmsyIxVlYYJ/98PTXCPtsAUsgtX3gH2nstU3QBlv9NYFSiK/eDKs2JGNX+F5xAt7OwadP3+MbVeL+QC6iUyHOFpcYc2ArgdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741218601; c=relaxed/simple;
	bh=srv7+73zZ3QRWDNH+XUQfVHz07EIMvSwvA+4Vv4LBUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=amkbYhVLTMuuiR7YHP+p7ohxBHSyl2MFCxp79JxOzFyejVJ15lQvDIhlM1yP6+KizBl/JKB7RtC2UpbbyHFfHv5DGfIvBo7jrd2Gev2MqYWLbERReEmdYO6ld+EF5eXZxoGkvjzdm8tHQq4RmgnNzgKUAPgBwvfr/bZpVWvDZqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNOq7P0p; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNOq7P0p"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso162752a91.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741218598; x=1741823398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXrDkcy8Q6nQXUpC8HwRtU5ASiNa8W4yd1e69lH3gRQ=;
        b=VNOq7P0pRjZ77283xSoi8O4IfnIOSwyJ0dQx0EAfsQU2JLzlgYBflyikblHiCoPrKi
         v7jDChMSecprc6y+HsDFGq6nElJ3ZmrEcTMqEbY/0dpqcZ3ulRNqYt+YXZpqJ9YyKi5Z
         eGmnhpEqCJQDUwL3KxVHjC439AqMWUrATsRaEYNTSmHb5rMih8DLr50dPHbCkOEmiNcx
         T4Oj/JBYlaD3Hy05l9kEcuVNbQ8P2pmoA5DhLIfx1+Fd93C8mSc4vJnjjB31GUshWDnl
         5LDX/fDAU0g2HPLIV8Uv3KO/nLVvYha1fous3RUMSG180iSW6aS+djvoxZbdJjaXF0fv
         P7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741218598; x=1741823398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXrDkcy8Q6nQXUpC8HwRtU5ASiNa8W4yd1e69lH3gRQ=;
        b=BwNveWYKI/KGxA+kvXEEm914ncIHLaMiz/j2WIaz1q6I0JhLrXUe3wTR/tCe0Qh6OW
         p/n6oB2bBYCF1JahVDhOadm3i5GOwLCnIy6loBw4bfjw4LhmvBhb/XkUsbGfqDi4uL31
         TzRSTTDCx/Q8mx7bGv6Mm850+STTN7m5nbSsL3/7k3w3C+6uRGtc2uuuEv/9lbSQauqa
         JFDpifQu9fg209WjgGb+gMLys0SmIgG5y1XqnlevQFZ+VkG2VMlN/3hzlxfw1FGWvu24
         PhHqiL+BY2bGBQonYXmVZfYL6VSdt5yDJMkXN03MXtok+7JsYK91bqvFzw/GRUcg4AKI
         QkiA==
X-Forwarded-Encrypted: i=1; AJvYcCXXATZfrgpNtflNTN2KRPYjDTdxYkSDJjeqbOEB/yEv1mU6FcH9jPHHRp0zypXop/2tz4x6YpmcYIghJNcz@lists.linux.dev
X-Gm-Message-State: AOJu0YxVjqxP+N3WVESYpwTVXZATJuDMrOWizesbBbpvSkPfFJUoNNZ+
	dl2X6q68y7x34nZmJhyb/C60K92i0YkiqTmJ/aTu3WIV8J7AJkLh
X-Gm-Gg: ASbGncu3ERt03HAAaRsjP460QPOXcQLd3/q0FJouDFLvxHCgiUC0umi8IRyxSep4xhY
	pB9ttsqYLQCFCT1scdNEfOlAkBMej0JOo9EhdikvaB1+xWcNqUyuaZmy/Vcxgs4BeIzdBjQbFPR
	oi7jiFbploi82YA7f6XYDojOfdkLrsg+NSYb4tGvN4vDrrTYyC7Z2jGdSOUKlm2E30WLwLfou2b
	f8fNXfD/K1UFA5Vl2a2B79eyMVQdA2pt+1dAKbmJyrkPw6dvLtHSW64D2LfhMMOAFx2r1/cU9ot
	Pdm9On+HFzPkJFBfEyrC9s8ViLsUmgc+7bgbkR0O/K6Hdq4Iu1C7zWEFNz5wVQyQAUQ=
X-Google-Smtp-Source: AGHT+IGlLVFKV+bPSwKWxrV0p1XcSjqEKjMMcOVLXGy3X1qxV6UJqiIFM8Cvzo8f79okMG49rA/FyQ==
X-Received: by 2002:a05:6a21:33a1:b0:1ee:ced0:f0a4 with SMTP id adf61e73a8af0-1f34952dc23mr10368128637.34.1741218597780;
        Wed, 05 Mar 2025 15:49:57 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:857:3077:7768:d8a9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af2810c1cf1sm16274a12.40.2025.03.05.15.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:49:57 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH v2] staging: iio: adis16203: Remove unneeded spi_set_drvdata()
Date: Thu,  6 Mar 2025 05:19:49 +0530
Message-Id: <20250305234949.1548646-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By making use of devm_iio_device_register(), we no longer have a driver
remove callback.
Since this was the last user of spi_get_drvdata(),
we can drop the call to spi_set_drvdata().

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index c1c73308800c..3faf3c61046a 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -267,8 +267,6 @@ static int adis16203_probe(struct spi_device *spi)
 	if (!indio_dev)
 		return -ENOMEM;
 	st = iio_priv(indio_dev);
-	/* this is only used for removal purposes */
-	spi_set_drvdata(spi, indio_dev);
 
 	indio_dev->name = spi->dev.driver->name;
 	indio_dev->channels = adis16203_channels;
-- 
2.34.1

