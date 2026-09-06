Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A965A369D5C
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694970; cv=none; b=Q3mek2D9EEYfvWcivssyeWcJ7ijTXQcenSERsqJMNmKb1psMFFQjUiTP/iFxardCqjIr8Km/xQwd6zeFjvup48oRlpWGQLO7JqyQip72XTgs/RBpHmJvjhl2cWEY8vyjKZQJtdQUS0EVsJjQEWUBQ6PHsHzdqP+poCScs33Ay64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694970; c=relaxed/simple;
	bh=NIQQl+i9frKLvSCB+7kcoSU4oLwDtFg0IeJm24mSZqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0OPPX2lBfGKgC1XFsGZlViW9zUNT0Ydh9QSxhsLwRT9dW38xcaar7WU2AvauYFhtACyUgSi0BaT9MNAfCZSwObQoDZHmR9q5OLNM/GjUodzMIPSNtiIKjp+8oSNm4jqYHrKvyxJDNvn3L1VME/6l7NHX03xHf9Jldi8oVtQa64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikfd/sLm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikfd/sLm"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843f205a5bso1409619f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788694967; x=1789299767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT/+VklbXB9D3LLWbRPzUjVHEWAbPJFAktyLnI06KDE=;
        b=ikfd/sLmcLEunEBtMuJYjEKiwWYzEQsfpuvITi/5NXCz8c9Gjra3qoj8Iv6+ytxCJX
         if4bV6eYMtAkttvJeBFbynrybEr3+MRcQfKSHerg8zxGXIpjIzVCvAQ7M2Yy4klyAeHJ
         kM4y9rjmFt2T5aTHU8Q7hWaHdGf8VxhXZKzmNZFwR087JSxeJRAn+CPVUOpsGi/CXoWf
         /0jptEDAhbxcWJ+A5xOESw5v0/oCRBMep8MHMKlkpSj2U3ajhTKe0tpVKWgVHA7j9Vxe
         OF5wkGshT20l5IVNzJnSbwOZUYlfPKx30YZnaBhZdIJrRYogwV6w3/G7Oqz3sgRaKFZT
         q0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788694967; x=1789299767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bT/+VklbXB9D3LLWbRPzUjVHEWAbPJFAktyLnI06KDE=;
        b=aayjbosXY8K1q1yV3If7zJ3WENMJmHso0K/5I4Sg2bRwdmw7K/WyGiaM7B3jR0S6ak
         BtYRbknhDoy6ClZI6doZxmaiLDYvk4NA7aqIpAqisDHqW34odah1PavNTyF+EfqMHOm+
         gcFc+iHIRjMX9unvo+TichLPlQWd6qrW/t+cizOSdvJc/KclWW6GfDjg9KGb/RhwpvrO
         K2DolGn4kEfKxdHPuIDigGNe8AuolrEjyh68SJj0eJYDOtXswba3/utmsht+0sFt+rvH
         F5v/pptO6WmmVn6YlIUtJVBkFgM2TOaWd9+rNPN3pIVyRZYbcx0vTv3EuBQnV3tZ5a/w
         e+RA==
X-Forwarded-Encrypted: i=1; AKwUvByRdKNfldflkoxCvB9i9KfxtJ3B/DD4v4yeEZVAG8lNUUrZMoXM1M4W1wUUapDoeden+k691etwUnMHP5PV@lists.linux.dev
X-Gm-Message-State: AFuF++nxSYQ1O4uuQK/DrGDThvjN1Oq7bwIcQ6tJuaTsL/ww+xGkOoLF
	ZgapDzLW5oobqfhqmBmOaAHqNmHWGrKkbNQNWeQzH/A0bvBeR7UHCCiCsFJBXw==
X-Gm-Gg: AYBFou0GWtmEP0kBdYgd/4D+Elspspt++GRSYR45OxdLRWvD4sKGd60lV8b+tceyuih
	nG4c9dvjzq6xrBguRHp0GZiLlAp12uw8+MwRrf3Ntj8nXWUkOtiP/arYyTvhx7j+bh/Y/HVVpHy
	fPtkNp+/X14Z5bcBH06g0OyRaZJefnu4h4RrIhcPUAxAYkmk0STbkil9TCRYmsyLFd1CYelsTjP
	50ZgBgG1WjuvARRSTMWhzc8xosnuQdLZYj7uNH6EM9OP22j4LAtcNLsCLmWpYsBAH8U7gteqRIr
	R9Yz6MveDvQh8BKsQTMbGpgXr1GvfK6K/k55ZmVeujjxm6YKUKO3cQTbwPC64NhfkNdwty6hFjP
	0iyvadRz0Dm3DA4HVy9dxxH9bm6ALF6j25qag3FIF4ico81e9Mvb2fXhpxeEhJAiwWrYtBH4CwY
	A9GIVAFVqz5LWesq+8kZYTCcGVLUEnOZ6oBwmaiMUcfdCaBxDsouW6jUKN9DmY6Xb3/20iEyE6Q
	s8sC1WR
X-Received: by 2002:a05:6000:25c7:b0:485:8a46:b3ba with SMTP id ffacd0b85a97d-4858a46b4edmr16892697f8f.34.1788694966717;
        Sun, 06 Sep 2026 04:42:46 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm19356223f8f.22.2026.09.06.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:42:46 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 1/2] staging: iio: adc: ad7816: Serialize SPI read operations
Date: Sun,  6 Sep 2026 14:40:48 +0300
Message-ID: <20260906114049.32912-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a mutex to serialize SPI read operations and prevent data corruption. Used guard(mutex) and devm_mutex_init() for safer and automatic cleanup.
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0e32a2295990..ab80b3a889bb 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -14,6 +14,8 @@
 #include <linux/list.h>
 #include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/cleanup.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -65,7 +67,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 {
 	struct spi_device *spi_dev = chip->spi_dev;
 	int ret;
-	__be16 buf;
+
+	guard(mutex)(&chip->lock);
 
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
@@ -360,6 +363,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
 
+	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
+	if (ret)
+		return ret;
+
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
-- 
2.54.0

