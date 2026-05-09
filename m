Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18937C0E1
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778315223; cv=none; b=A3BcN0l7P4NTOC1rUyUrPaAIQzpWAUekQQsD6oFNY2OzoVtQ61Yri+nwJqsNRiNAJ0yKsEd7Sdg0DGKzbfcYYLRhVETaiCv8RW1rrPNSsbHRf9MJHplJyVNSodIqD16cE5EdjZtdU6MkGMYYecY239rHObTEPmg6/jf7FhdLe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778315223; c=relaxed/simple;
	bh=5D0Jeg8L2jdESb77aS2oqSGnOTtEt/jAvaVQVWtUUcU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LEb6FAevpQRfafWQkFdfNOgLU4+UCh1vPE+Zxv6qiHdp/jQ/mbCdbOoRhV4zf5OEFWTEtEVfXpaWvt8mnvAb5IpPP2hHHW20RwNBDJjLzcjGqgA9ASyUyIU66e3ilFDQyD5peVqt8WmUiZrC0rrj74uv+N9ylYl4/Rm8aUu76L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdUAXJXY; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdUAXJXY"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b4520f6b32so5040105eec.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778315221; x=1778920021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi8OA0S5v0cDkuBo5x3SA05u+r2nlwG9R/S0G51f9EQ=;
        b=cdUAXJXYoNFkQgG/TeQBZeoQqnhkkL/URVy5BaCPNSmwF5lhrIUPYJ4D+zRMeLEkXs
         1bJSkgeDaC3rw56wfYykyLSPKRgbUP6K+GZW59+rFNLZv5t9NY2r3ZU1NuWlrSAJ74mw
         iD5J4XkA+yhAinW5OAE4vp2AJwkCQwNUOpQwmCFK5GdPCGAX+WeFs7AtBn4JLYMSm/Wv
         fY32lZy35NV5unm9vgVTNZK5pjmiBjgdowy1wHF7Z/EmLF7yy3lThgyhLxlcrofH9+Ig
         FiEKQRtmLvWNm4Tyt/2sz3JNoRrWAmSVr4rDF2sKr5RzGDMSsBYBbBfOGzj7b547lL/Z
         e6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778315221; x=1778920021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi8OA0S5v0cDkuBo5x3SA05u+r2nlwG9R/S0G51f9EQ=;
        b=aU5ziaHNEGCIjWW2o3EfuREGjPiMFzutj3pRZHthRr/3Xrqk6q34hr+OrdSJbvsLzJ
         uD4iXXAi2lH6ocfgATReATSaJ8bZiNIDayIdXIGLlS8NQ1gUDRpBjd1Dj2SifW4+bo/I
         mKFnbda32JUUFnUiR/NVEuKKX7lAoq3j3qbYH74FCZAKdeZMl0LrApiVK3OVXmG9DPYb
         10MznrQkzwaOOVuiIBKR8Vxpx5Jx/coQaCUM6sVj/CrxmB2waCn/zsRuk1fmYaoHYfhD
         kIqTxdF1MMEiyWhU8TRMBrb3X7MPL8TUwLFAEL+kXQB7UCfA9nQ7co1Q6A051BspycTa
         tBZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TeflUtEOhXZQqkzOXfYPXdCvWFrDhAWAySf0XZ7q06C+dcTbsES46BSRV9772Ng5nMJUpFM3JCAg901aA@lists.linux.dev
X-Gm-Message-State: AOJu0YxlqAhw/kMTQWVlWA+2FrWDmXLmoHucIvzkCMH0SpKgsrk12cJn
	ER78ZjScq9aAfR4qxblqfZMsI6Rtc8fVaGomUPSkOqOd2HHLWPrMUY7Q
X-Gm-Gg: Acq92OFmmWqeauZlb4kv32otpUmnEEuITjM6QXk/301RSmI/vxX/pPUoNlmlMCGukYy
	qm8/seesrqAfwFmMQecZ4d7bIxS98kb/PZIcf8UJkaBuoy8V84iBujq/MGkIp83OXYJbsiwwjIz
	cB2sP2KF/XN95E3HILSHZowS+lS1D8RCXfW2Zi1EfnRhF6rCb16hlGQnRDOpqPRXt0R8+yosuBu
	zE3v5Utsk5ntLXmYFxsisNTM9cDD84UlJNl556Ne57pUvi4lQ4mfhqF0xwXxOgXIqJBBjm3Api6
	yPTILyYODq1wVMYZxWJeRasZG4IEQjl73arQn3pBL2VfnwdEi5ZaXRqVOO5Oucf58TKjNL+mMsv
	EcjXSxGJNUOzKzRclj82UKp7T94dnyn7IqhNVsOFi+y9V5MbDUUTcc04LAoz53zfTZlPeWYRRoV
	an7mYn3RX8F8PSem61RoVmqJzsnAO3q7ACgQKKZWiv87Gl00Ji4qwsaPHcv+VpMJjayQ==
X-Received: by 2002:a05:7300:ec01:b0:2e1:e3e6:2909 with SMTP id 5a478bee46e88-2f54dc8dfdcmr7178290eec.9.1778315221164;
        Sat, 09 May 2026 01:27:01 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm6522685eec.14.2026.05.09.01.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 01:27:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: iio: addac: adt7316: check SPI write errors in probe
Date: Sat,  9 May 2026 08:26:36 +0000
Message-Id: <20260509082636.85114-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function issues three SPI writes to switch the device
from the default I2C protocol to SPI protocol, but ignores their
return values.

Add error checking and emit a warning if any of these writes fail,
to improve error visibility without changing existing behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/iio/addac/adt7316-spi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index f91325d11394..25b7772bd05f 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -98,6 +98,7 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 		.multi_read = adt7316_spi_multi_read,
 		.multi_write = adt7316_spi_multi_write,
 	};
+	int i, ret;
 
 	/* don't exceed max specified SPI CLK frequency */
 	if (spi_dev->max_speed_hz > ADT7316_SPI_MAX_FREQ_HZ) {
@@ -107,9 +108,11 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 	}
 
 	/* switch from default I2C protocol to SPI protocol */
-	adt7316_spi_write(spi_dev, 0, 0);
-	adt7316_spi_write(spi_dev, 0, 0);
-	adt7316_spi_write(spi_dev, 0, 0);
+	for (i = 0; i < 3; i++) {
+		ret = adt7316_spi_write(spi_dev, 0, 0);
+		if (ret)
+			dev_warn(&spi_dev->dev, "SPI init write %d failed: %d\n", i, ret);
+	}
 
 	return adt7316_probe(&spi_dev->dev, &bus, spi_dev->modalias);
 }
-- 
2.34.1

