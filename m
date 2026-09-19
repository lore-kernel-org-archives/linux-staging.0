Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3413B52F8
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808134; cv=none; b=B04E0CebCThw6VOVUAn6dTyi0YAUJqSZXYzoPeD7GaT8pzNUYeBwY2oOm3G+xuxBJDHOZvkRAMqW6HPF5nn1ohnRrUZ89thHDC0NGDMHfBxxvureBs760RRGsoEHkbo+Z4LjLxHnMbL14y93Vg8JUrXiIfqSZ4E41OkF4prA3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808134; c=relaxed/simple;
	bh=+/9iF8Q/HzoQ9AXsjS629ikGCqE2KrlWmQsyKxS+xbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rwm+OK0Pgp53Fva2aLeZ3TWl+XUuWtJU+XruGuSKCcE47k+xUK0A7GN9rOIkuN/qwlJ7fnexXujVysRsXQezhVwtGiXswZXEXF4kGp7yRxaVhp6NbxEB0slHcdYlVq5JlyOs04wxIUQXeLByMhaV/6NPJxKRKTXVIobVJlSqHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3EWhAuG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3EWhAuG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so491871f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808131; x=1790412931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04kbXYpwvydfIV09e+Yw8RNCO3EBvkyuMvNNxaqIlHg=;
        b=K3EWhAuGKudnD4EE596a19ixbYjefrpSOQn8BJZlENvY3WZx6SPsd5eSuGf/wD3mJX
         3vS62rJUdG8ApvpVnpjEJdNscpvbiRsrhvNiJN0ffkNlOuVyRV6YT04dKKuPVnZVBTzS
         +rGNHlsRW2eehAoQKKYEyrDaPDC0WqeQAeal+6UD+sQckk71PLsZQP1DmjJPMTiTBVQX
         yS2nvs7Ehgz0HBkH5dtYT13mtnnT91ThIZwwtjpxonROdTtEz972HqbwylXCVmlvaec7
         3hFimG9VmU9DJ1SKAP+fssYNzLC7S8apy3Y6ooPXCG+yMVvQpVhUKCD+RfiooH/f26PQ
         /E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808131; x=1790412931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04kbXYpwvydfIV09e+Yw8RNCO3EBvkyuMvNNxaqIlHg=;
        b=GCMeO4MZFRPN8x7b8DQPNDboq4M2oquMtIXOoWrz600w4l1n8/LxfSRG7fGm7JpAug
         yMfQkAUob/piMcv2vX0lwZe+IU5a7KiJwsjRg9m3LGFRuOtqY7tT3ORiGf00bmTQRLcZ
         gBtJ59UmxLHjUNeKBDEELy1hu3fS38HY6qLOR/NO/9FQNePftnyfX4APgNwAAE5dhXKh
         Bq5pETCKjUnTN4Druuu+oVZUiziT70ZrhJG8zMF3ytYLERoDoumPj4nlJb6PArbStVIm
         v2Yn8+YyRhAvDCsWFJ3gkd/ASMS4bGZnQHMFklKqOYZN3zHxZv+q2vB16M7SqDJg/mn4
         ZjAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr354B5+0pMxHWlknqjPKv7CGGbb2cSrfDJ+xPK6M1I/LUOXsClhDb3ian2GPJW7WNj1XxQ5O4jqREuLW9@lists.linux.dev
X-Gm-Message-State: AFuF++nsf/pgQGYq38qC/4g9iaC+CFBS4NWpLlxWstj6+GtWgoo995qz
	h8DmzNKGV3K3BrN7ma9JvwiecOG9jW9sua6f/eRduI/5oz+xKbpxVQvs
X-Gm-Gg: AYBFou2QBPF+x4UO0JHsy8Tm04OODWUPN7BmPnikJe0zZWeCgmHEwav6K76LhPQT5Xa
	lWb3w16+2j6edSdU+E7BU1KzjoysoR1f7H5nzAgUK3nBcV6JWrZkjoB09Ot1XRrtNltvxzJJ4sH
	1eW7R5jXjyQnVKNl/FURndp6NUBQY20Vp2TT8nIIOd2TQaOS4Anpk/Oyxw/2cxydmK08QBLL5a6
	+yW61f6oEisVieZ3A4aE1YnHQSwN9ygTRGMc5WyAfO1vsPSi29faAvd6PmrnaOcBnK3nvh2x3v3
	ir5ZY5h2Wy4sGP4WWXkr55N9FRs4Nn2SIL53/ZifGQezqqhQizuooFhjrDyzNtiQ1p7BDxEFPyX
	J1xcJZoWEPouuTP3Y5HUhpXlRVxwuH06reOEW3+IMIk/8nm2143BnLaw/G0x5+8uXzE5zFo+TN6
	jbRgnw2w8SQkvDnx2hfYFYsp9pE5lk4JrCGBBfHg+1Gay0vcjhLEb97l8MXmFZv2wHTfEms8e5u
	B7/bq1IZySSFbDU6e/dn9I=
X-Received: by 2002:a05:6000:2688:b0:487:146f:7c88 with SMTP id ffacd0b85a97d-4871d98cdcfmr7778873f8f.4.1789808131054;
        Sat, 19 Sep 2026 01:55:31 -0700 (PDT)
Received: from fedora ([154.182.123.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724595289sm5574613f8f.29.2026.09.19.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:55:30 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: iio: adc: ad7816: Protect sysfs attributes with mutex
Date: Sat, 19 Sep 2026 11:55:13 +0300
Message-ID: <20260919085513.9173-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs store functions (ad7816_store_mode and ad7816_store_channel)
modify the device state and toggle GPIO pins. If accessed concurrently
by userspace during an ongoing SPI transfer, this could corrupt the
SPI transaction.

Add the existing chip->lock guard to these functions to serialize
access and prevent race conditions.

Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index f76f0215119a..d8f4b1f79e2a 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -143,6 +143,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
+	guard(mutex)(&chip->lock);
 	if (strcmp(buf, "full") == 0) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
@@ -207,6 +208,7 @@ static ssize_t ad7816_store_channel(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&chip->lock);
 	chip->channel_id = data;
 
 	return len;
-- 
2.54.0

