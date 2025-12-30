Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE732BDC3D
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767126930; cv=none; b=e5uUL3Hu2Kdms6DHlOwCzAv/SRjmtB1uGy+cx9SWHJjdcsbn/jFhG7bBaq/l1gNI5HBhLbhlCfxWh+44YYP7ySD0DsIMFUGBBw5WekqggL2qKlqzrK6EgFZLfZxy02y0jo/Jznz3Q/K0Krb/YqlFVN5qSjax4At5uh2tFAEO3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767126930; c=relaxed/simple;
	bh=UAGRpfY4KwT+V4v61wxdidc8gTTnzFLqaP44Mz50hz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5A4Ajj1VbUugkJ/xqF7LZ2oaJdeEMOY+3PhPoBwZvXa5b5eFNEi73mX80UbcNFKk/jXcvGkdGIxQJF6tJUDYZQyt4Lu3xay24eLHYxDJbvUZLubYjfNItZ5tc9v9d2xElx1UId4vOCfzZ+WMmUgiq43rrn4BLbfz56mfEsFtn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ek0Fm6LA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ek0Fm6LA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0bb2f093aso103491905ad.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 12:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767126928; x=1767731728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNqW8ND68Qn1BInNnrDeX5W9wJC6ZSLjSp3dk9M7GPQ=;
        b=ek0Fm6LAdA7WRnN9iAq3S2jqZ3ZOMRaTPuCLMp9rC1on2vJdZEImMTTi7O/57G2YFW
         UUA6O+OojR/1RjL0s45CjgXV6tvDDOQgbEXlc+YZEFh9hL9svfA2AzzUmSLYj5e43oI6
         oeOQA4K48KcQS+J5a3XHBjG7nbFU2aFaZK9Gcm8KbwJ2Lt9sVIAUPYrljKRKQ/Yqa+te
         s2i5pZfducNI5QRrl3VST3hIsuRTOtEZRO5EfBnXARXMvKr4Ve6kqJBhCWfg7YzJ6C5n
         HuB1dP97AoEMmFdn/+j/dEo2KWw3lyUt1fnGC9kPtiFU+b69ZzfvAHl7mHyGUml24ZrZ
         vBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767126928; x=1767731728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNqW8ND68Qn1BInNnrDeX5W9wJC6ZSLjSp3dk9M7GPQ=;
        b=vOKCZrh3F1KPQRy2QJzZs2yTt4fVrxDBr5a9Yd2FHSct4XtY/8r96GOV+vPnTof2I4
         FftYIgaN0aTT3olvmWrSVztfYJIEJVG37OD4BuR+8gtxQ9rQqX9ry4x3BdfFxeWlo6wL
         YyuzvokaGg0oTOLmvYRuoUUhpGegKF1xiDvXX9JSEL1/KohJETRVXXGJUUj0OR1oGkma
         IXjx6Z6VkozXoZOjeWETi+wR7x7MbgyMeobPXlTgEq6AWNkeBSqwRjr9UBgXrhLwYuEI
         xmq2A2gIJJ2WnzNdIGJ2j3wJpzgPqS5hGfdUMUNE496TVymXH9s3gTgLw46qCGT9BPiu
         bNow==
X-Forwarded-Encrypted: i=1; AJvYcCWxj9DMnFOlUtDE5XA5dvLAMnXCL9EPsxWc8m1VGaHlKVwyIlUEkGP3GJi+AG6FcjWhVBcAGMhJzO8uEP6x@lists.linux.dev
X-Gm-Message-State: AOJu0YzsYAzeG9uuUK3/VJ9pTkZQfyvpiry+SFV+R/geruUHrlMBBxlC
	xYc4vh6Vd0nEauu5IwcvOUwFhbvD0eZj6wolK/hSYABN2WwRahSNVWMO
X-Gm-Gg: AY/fxX6aFNrnwODtPm+3YWz1USfgERYPVLLkERsg2aF86dFeI3VonRHHydVb7+rNJWY
	elSGUxW1Tm7ZUk6R9wBX0ml0L1Adoqh3Yq67qiGwBoScSGcdCNTiCtyAn/LegiVtYfsLnRKnAiK
	7WF/YaTjJLwfIRYrUoYU5zFM64+uox1grsvdKKekMP7Ml7G9PreE7aPwH3T1pigdzKABklR5gfg
	NlLrvLN7qnlm86SKEG3s66FfyXHk9FN627H4AnQZtbfuStXJxNgd6IC2mZ6HoqyTXQtZFtEu1Ui
	ovagKJN/ipGumsVtpasZZZCnRdagg9V0+1RPptkZ63ey+Cx1/bF2Hy/RyAKrKXd3Q96fCB4X220
	OJHBhtfW059DE2UyaRYvlkEcwmn+mhqefbb9SG+2rgpAyYWok8FPlE4IIoRP82Io/YnGd4dvmpL
	15NSh5pc1xroPQOLqxnQpuynyriFamHyq2CURtDLB6em7OT+1/a5CNua7TOUyu68evHoLGVSCMg
	Yu2COWpx1BWWvYLY/mqYakJEx0BfdfZxf7d83zI6jx3U2MGFM95CtaMLgLrZtR2C0EjAguH
X-Google-Smtp-Source: AGHT+IEsKIgPV4K9v9BN3J2QnbXkkuZD29ZOjL2Cv8OdoAPvO3VG4YohYWZFBlHHTexO8jnbyNRtjg==
X-Received: by 2002:a05:7022:92a:b0:119:e55a:9c03 with SMTP id a92af1059eb24-121722dd671mr36870001c88.31.1767126927887;
        Tue, 30 Dec 2025 12:35:27 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm128074981c88.9.2025.12.30.12.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:35:27 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH v2 1/6] staging: iio: ad9832: cleanup dev_err_probe()
Date: Tue, 30 Dec 2025 17:34:54 -0300
Message-ID: <20251230203459.28935-2-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230203459.28935-1-tomasborquez13@gmail.com>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup dev_err_probe() by keeping messages consistent and adding
error message for clock acquisition failure.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b27..a5523e2210bf 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -293,27 +293,28 @@ static const struct iio_info ad9832_info = {
 
 static int ad9832_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	struct iio_dev *indio_dev;
 	struct ad9832_state *st;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	st = iio_priv(indio_dev);
 
-	ret = devm_regulator_get_enable(&spi->dev, "avdd");
+	ret = devm_regulator_get_enable(dev, "avdd");
 	if (ret)
-		return dev_err_probe(&spi->dev, ret, "failed to enable specified AVDD voltage\n");
+		return dev_err_probe(dev, ret, "failed to enable AVDD supply\n");
 
-	ret = devm_regulator_get_enable(&spi->dev, "dvdd");
+	ret = devm_regulator_get_enable(dev, "dvdd");
 	if (ret)
-		return dev_err_probe(&spi->dev, ret, "Failed to enable specified DVDD supply\n");
+		return dev_err_probe(dev, ret, "failed to enable DVDD supply\n");
 
-	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
+	st->mclk = devm_clk_get_enabled(dev, "mclk");
 	if (IS_ERR(st->mclk))
-		return PTR_ERR(st->mclk);
+		return dev_err_probe(dev, PTR_ERR(st->mclk), "failed to enable MCLK\n");
 
 	st->spi = spi;
 	mutex_init(&st->lock);
-- 
2.43.0

