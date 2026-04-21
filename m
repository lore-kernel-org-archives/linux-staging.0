Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952320B22
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776742395; cv=none; b=Rmx6iNrM5XqqBLYy/5GsvL+5XqarD351znY+0IzlKRl4kA7DwjtLnpNTSDXu2wlp6LLxd8WeE1CGeudA+/SXn3Lszx3nk4V4l/zI98q5cH1nSrkOY/zjZwALJiUeJRQ7SDjYbT3RNCCQkF9L6tNzQfSg7ixdzb8daW3HfcgmFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776742395; c=relaxed/simple;
	bh=1PTkyIaAAhRUiI9VHZak1VEUjNpclUAJjZnev3rantA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftSsNI8+SnSLfmdR/H1dZxri7v666+Pd0ohh9y9xzbBWtmhQ4vS1iy5POqtBqO91j1E+RfNs/WWx7oacfNq5RFTvZn5ZJ0kGcT/PZ2Ro6hW3Rwo1D+N3jfAUQsfg21X38A8XO+Az8Y0QnZD1ePDnZr6DK6RK69X4LRy2wAWobrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwB9UQMp; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwB9UQMp"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c76b994f7a8so1271068a12.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 20:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776742394; x=1777347194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXjNUP8S3hQkr13wiZtxStftqpT7wj7L6Sswm/jLgaQ=;
        b=HwB9UQMpwVkSTc4a8c0BJKoNl7JR4utyMni7PLqE/w9uVGoyioM8zPkodi5BKaNWQK
         2rObGyQrnszDAFxHngHdRgTMIHzXIrMGDBeZOvpG2bYLvtfgKvz/BarimZQSzo/6hde/
         0gO1CLNvfIGPbG4Ix2h33xHUkw+TkKu3gUyw1dfW3LkJH7RuSOKYt5WqySeJ6aq+ndS7
         HoTMKAS9K/14JF2pOvX3GOgQ7yf+yVhv9VwTr83LD9+fyUelaSZqLBZJ1GNRlbs/N9Tp
         hsn2WqcR6Wq9fPUOgyy1ZVvs676dkvfaOakAFV0MBIYAMCiX9Tzeat3fGzGc+XwTwGfr
         Tuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776742394; x=1777347194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXjNUP8S3hQkr13wiZtxStftqpT7wj7L6Sswm/jLgaQ=;
        b=mm/NFLc+gADa5qCbFRTcA3QvdJPiJ4b+LaDenErXudv6rxGogY92rX8RZicRfeikM7
         nSK636Vw5A6+FQqNrSmmHfJIGMIVTjSFlqC2sZjT8Aqg2MhHWAgYSl+6sVKvzC2IIdC0
         Vr6f9MHf2knRdLlKjAZtnuYJnD3iBJb8Vuk63WWlf7I4igwi2dFW9/my4HzpbyZnKUw5
         ZusgaKiOAW7VGmUMZqH678BvZZc0hThv0OLJfC0LKGI4Z6yYWedpldMqASTY3GLgHYFS
         1tRNxQYgTObWbaDNoz6Ntp832M0zTEqk6jHSZQSB7LT6j0EaP9H95MuCSZzZMiII7gHQ
         UKVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F2R/iaF4ZgIsXDZ2nh18pSERvcVNdGuAIdK66IlkGuva9bgcK3dY2fgLI5Amy/aK7GTVy3GNGrgWDio19@lists.linux.dev
X-Gm-Message-State: AOJu0YwX3isgwyWg9KjJcwMqTIpwLSXtYtWqLeNN/zN58DwcHb9bEHXd
	8OOnOgscZ6NLPIT+U6iKctzkk/NUmLt2GvYOM89PIIaR1xa34S5lBKP8
X-Gm-Gg: AeBDievW2C+E8fgpBv/CEdVtOsEo8/LDL3hJlQCR3PLfLpQ/wXfQAr7E9QXy1SV4Nmh
	T3hUc05yldmgmRM3PsEkKctm2hwEzcxYts8aRggcPGSZ8ObxUU88oDhJw3PzUPRfMXAvKUABAep
	/ATsq2KqS0wBGuASF+I4Dx5UKxAPNwM2Am7T9axDQIqSOiIKLHZIEKlctI9DtGkyjjIdwjPn8uy
	78UlupcGoJ7TUO3nODXOwEH0U0hITYJZywEG9frl0xPMCZwAfQBxhWfyltBEPBQ8NMsS1QJTUxP
	FDvaqGtdGahvYqd30acREfAIrORNx4o7LfyDcUP60DVX1dnsX6Lku7RiQHUGTCWjqoUZSpKY1KQ
	itYdyO5u17VFkIXM0Aa3zInKYZZU6Z3pow9yPM0cG+Okdcnz6rdsh0cpuNGc9Qmtsedd7H3sIOy
	B4pBpfMu+NCLDrumjmU5ZFXD7TmyKsAQatLq2zu1rB2p+wlizwRXq+I6wyfkmfKZBtrCuDJyeX8
	Ukye6nL4e1/dug7RrN4SHiynI97VOvUFsgXs4koEdZGVHxZ9PfwlVeUcr4y+mpP1GMcuDFeK/bd
	lN65Pys=
X-Received: by 2002:a05:6a20:3c89:b0:3a2:d976:2210 with SMTP id adf61e73a8af0-3a2d97637dbmr4564179637.8.1776742393644;
        Mon, 20 Apr 2026 20:33:13 -0700 (PDT)
Received: from PhantomX4 ([2402:3a80:51:767:3618:c13a:2d9b:d51a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703df68sm9262933a12.27.2026.04.20.20.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 20:33:13 -0700 (PDT)
From: Sudharshan <sudharsanam346@gmail.com>
To: greg@kroah.com
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sudharshan <sudharsanam346@gmail.com>
Subject: [PATCH 1/2] staging: iio: adc: ad7816: fix coding style issues
Date: Tue, 21 Apr 2026 09:02:51 +0530
Message-ID: <20260421033251.15663-1-sudharsanam346@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix mixed indentation in spi_driver struct and add missing
newline at end of file.

Signed-off-by: Sudharshan <sudharsanam346@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135f3b..021b2ca0df9b 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -443,7 +443,6 @@ static struct spi_driver ad7816_driver = {
 	.id_table = ad7816_id,
 };
 module_spi_driver(ad7816_driver);
-
 MODULE_AUTHOR("Sonic Zhang <sonic.zhang@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7816/7/8 digital temperature sensor driver");
 MODULE_LICENSE("GPL v2");
-- 
2.53.0

