Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE7D277008
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615662; cv=none; b=R8Dy3sGODwlJDGszGDFISXJgj79baDOKoSw67OeohI1iPTEB+/NMWF+OWMN3ai7JVtjyJNfEedLDrlx6s+XYBt04NhzlSYvBzjapKtmZ0hvZGbcNVHSgEi3SR6uSvTmLypEHSdT5XSRAazBnpm+sZZ1+L4opbbgAZhFwa3hwc6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615662; c=relaxed/simple;
	bh=5RpsWVB0n0bphyQyLM5I1WxpQHwU0IHdjHBWA35pyWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rR6xtZTqtVKxJk5xbSir8xWIMPfm+a/djZhqelZZY+RPDtKfDf6KB/lBMGWTvYdXoioLNMXqZyCCkkSqQm19Hfs8xxmgpQN4aroI7AXHHHWgdvIoA/ekzaEVdyOZUgFu1EY5jMkTt/WG7Jd4Hc8bfLjroupEIzJemKiHqcoRrVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU3P4Rhj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU3P4Rhj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b46a332a5so1330395e9.3
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755615659; x=1756220459; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8WEap3IwD1NSco90tPoqFQ0hlFvq3zg4DyIPbT8+y8=;
        b=bU3P4Rhjp0uhW7eG/8Ml29SuPlxu04tLcd54r7kUKQoGtG2aNnT6PXsLqalI88TMR2
         IamHTUvYc2xzKembOpwhusMO0/Ht1p2FMgLgNIeMGxbnEKLMZuiKKWcl+dLXPWU3wyr7
         TcIDzvdAxHGWxX2kuhex0lRd7YKhi53lztbMvlIsXAm8ayZ7N+CQcxjBKMJV4gbSrJ0Y
         dVVyKS8SvzPjCZEmwfQNuNjHKHPHL2I0yjnFom0SIzlft5geUyRpy0kDyYqYh6tR8brF
         bhdMaOgek0t4pCpolZOAkxArbZY9B+J6Jt2/+ICijMs+J0gOKJTa4eGOB2CixkliU6Oy
         GUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615659; x=1756220459;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8WEap3IwD1NSco90tPoqFQ0hlFvq3zg4DyIPbT8+y8=;
        b=tDApiDF4FT4PHN9biaQiSyAgrJ23B47fZHD5r6rA7kVabuCTbkMSnZnylnxroj3eFX
         0Y4SJkHs8TRxc0oi4VJUp6L+XNz/3AFrfMjd75aF1GhZbvhxAr9sCKtymB9Dm9WhBQkS
         dB0VIMlbn9T1DSKYl7TTvbcHkL4IJIOcFLmWouHXyWLYIauD2HAtbpbu36R+kKA1Bzv0
         CGO9EHeOt3QAg67HWOm8WO0YFlKXJDNRzGlf8QSIUIQ0aL6KaDtigSLPjJQkzPXeVDS0
         174YXzCzDmCKRtPY9GlYtavL070KaH20QSRUhWGp8nFT3km4B688fSIN77zd77ZSMfxE
         Lg3A==
X-Forwarded-Encrypted: i=1; AJvYcCVtOu+bB12geuYb/mvWl66tUnBCMR5eQc5GKfYIp4x9ssUqpoXuNCdJ2mndjZxrWEPgyP1CGirFZbHgqFQ0@lists.linux.dev
X-Gm-Message-State: AOJu0YyQhfiVDCDPEuDOxzvJ6X7fbIYQVqIPjH9HWXat2j97tkSf5aLW
	ROIgdFvZIJYBsUr6yvaWk9Nl45nmM2ZzXyEvYdrv3A/GWTAQmkk5IzFK
X-Gm-Gg: ASbGncv1X5E9ZIKUUlmuMPNqYv348Q/+LtdRVMoGypysdXkKnzDyYee/2DAgcTCi1LE
	LEv8oaExvo6E3lLGRRiNT45BMpi1EECjYOXg6M+YglvbV0y4bTaAE0bUu0Lq696IZ5AsDwuU18W
	YWbstpNHYji/AzLjbxFZCAgp5n26PYk8pBP8eS6OwHHemDFSF3jfbOgVZs236rm2qYaIytQBM7U
	vgHMRiGhpf5+fq4kUZsia004xTf9+H/ic9os3WWAxS7RjnULAkWbw79wohHjNI55JzPCZVfzVRT
	U779r8AtbY4xlR8fpr+pm89eChc+iU2LJdzPrWzavD/qSmd8B0nC2PCmCQIm43zaRKdStTEwY8B
	442JJIm8l5/SLYbzRwZ4=
X-Google-Smtp-Source: AGHT+IFQ/Wz9NMqV3EvDIM7pmIbPfTuCUm8GbWIbDx6xEi3yYqIM6OxDad3PmKCCQKJ6HgsFaVlGQg==
X-Received: by 2002:a5d:588d:0:b0:3b8:d360:337f with SMTP id ffacd0b85a97d-3c0ec756374mr2234545f8f.51.1755615658550;
        Tue, 19 Aug 2025 08:00:58 -0700 (PDT)
Received: from pc ([165.51.6.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1715sm4344520f8f.36.2025.08.19.08.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:00:57 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:00:53 +0100
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
Subject: [PATCH v2] staging: iio: adc: ad7816: Drop unnecessary
 dev_set_drvdata() call
Message-ID: <aKSRpTuwA0P-ZaUS@pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the call to `dev_set_drvdata()` and the associated comment
since private data is never read.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v2 :
   - Remove spi_set_drvdata() and outdated comment as suggested by David
     Lechner
   - Update commit title and message

 drivers/staging/iio/adc/ad7816.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 4774df778de9..172acf135f3b 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -359,8 +359,6 @@ static int ad7816_probe(struct spi_device *spi_dev)
 	if (!indio_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
-	/* this is only used for device removal purposes */
-	dev_set_drvdata(&spi_dev->dev, indio_dev);
 
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
-- 
2.43.0

