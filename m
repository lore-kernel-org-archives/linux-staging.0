Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94AB214A8A
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741025132; cv=none; b=IXzTdn9NquRiimmeD82EMUzyHmZMt+gak8aLmOfo+ox0MHcMftpdkyDcxn2urrb70mMjAkm8kOxX/gLeoYgYGnQMVpvuI/K0P1u1TUNTNcdFQXfSlrC7c9HKr8C/+V6eFRrJYa4hqyB6UtJbm1BAdl9osL53vXz53e3O/r+KP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741025132; c=relaxed/simple;
	bh=VAH4v5bJFlLZrKM681qO/g3XFqUam0Q1Ghkk8lgbyjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LxTJyb2ghM08nJ5/IJap/XwAyVhE3T5Hf4uUwV0222tVKZv9qRkUYb7mbITV341+sQEGrahh6H/o+acZs9zExYOXJ0mOrs3tFG8ehrsxTdeYBkVTEfRJjHlUb5XUyj+rRbLqHLEhpMUXdRplGUtnOBcngkwG6AmuhvBdTpZlSG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkR1zunP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkR1zunP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2235908a30aso71356305ad.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 10:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741025130; x=1741629930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VkWdnxLuCrqr1vq5T7s75fh5Wv8+/qm0qNVED0OlTU=;
        b=KkR1zunPqInwYlrDpjqSpwUMNDF4LIHdk+YNY4f6ArLqLLoZifYOSeMu1rsT9S0012
         wNWQC4c7SIu6/v/6WqaCDujb/W/bQsA0Wwmgg6tku3KnsKsqq40LN4SOX33Yb/UfP5/M
         nbkTnwdNXiT9y7rM46+F3eWDy+0n/vREkjeKgfW6ONNqgkgGbZLt4EvhPbjeKPvRILqo
         XFclk/J2mte0y50YTLdg7Fiz6JzJoeMVdbVsgaamdWlW5KSbu4QEVoID8dzS++qwBwL3
         EGcSe7jVOjkUi01hw7KHstwwdxfDf9K5eGxvDPQZWaAx3XzPAy+UcFk6FkdcHSdzka6z
         YvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741025130; x=1741629930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VkWdnxLuCrqr1vq5T7s75fh5Wv8+/qm0qNVED0OlTU=;
        b=G+ojbnYE/7CjNiwaPwvA/07xggiaMO18Gk/nk+98bTMSsBORRbtlt36qT7IsAaH378
         HM7p/w4g8C4U1gcUFGLz58uwSvDetGAmL5j7+hBYBR3KXvZXwEBEtRsTyQmin7fomAIY
         HAZXCmvfTbaabsSfkmusGCOSo3X50/C2qw8HttgBHuNQQmX8EV/6n3plSCIEWPBubyqW
         o36+upjDT7YdnX5ZOUbdamfsdk21NVbsmDLoJJgd1Pd5XmIglrjrXq7KPNQPifhi3HKT
         eK0ChSAzaS+KflOLjx/4hy5Mso7pWVLcu0kiTy//3Z3kl5+1P28XCCivGLbJBomD48i0
         Nb8w==
X-Forwarded-Encrypted: i=1; AJvYcCWLPXEpU26ECcXIX8fJDTV2l7p/8Zzi+xezRFpyId4muHo2sjGOH7VGRAbQPl+3zkso4gJK/col6bf+MAxi@lists.linux.dev
X-Gm-Message-State: AOJu0YxCVHgbPQCY9bxZSf1VAw0KmoVIQxmUgm2SZ6rDookdEUYmkEov
	md27CZ3BvZSXicCQDtJsC5hnn6eWj8BmY6zulx7wW0zBG9anVNMI
X-Gm-Gg: ASbGncsCZ82AAK7L34fd8Zw0M0tyzl2JiqhT3BNCeDgSznvatYE0fYQSLi/uuFXNpls
	+bocYBE53DVnTygsuueR4KQfqW8yfb6k0LA+Zvevh+todyCbOKLZhBw4qtP4Oq6rwb37vKfJDvl
	5GAjdSNXyFdQvYQc6DI4372aRI0pwIU6ri3vWT/+qLAAuDP9bIhe06qHY1ys+NE2r/SuLtBiuWF
	MLhN+qE4trssKziYA1Ty5dvm6yfGo7IRVHQwvcioHgCAHJpznxqgzLHU7EcVu4Lj/WCY4f80Ssb
	Y9fl/zFROErteVFPxTA9MWVJeFCBsmAAnq5vxnshgJFI+7f9vX5hqkeyBsrv3PQdgm1d
X-Google-Smtp-Source: AGHT+IEW89lTZAYKBGO7spjOgM6BNdSZ6lApduXyII/5vwtNdJIM/6NiUw7JrWJ1rE0/V8JqintsxA==
X-Received: by 2002:a17:902:dac4:b0:223:6436:72bf with SMTP id d9443c01a7336-2236921ebeemr275963095ad.44.1741025129900;
        Mon, 03 Mar 2025 10:05:29 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d29cbsm81319975ad.50.2025.03.03.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 10:05:29 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH] staging: iio: adis16203: Remove unneeded spi_set_drvdata()
Date: Mon,  3 Mar 2025 23:35:23 +0530
Message-Id: <20250303180523.15445-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Since we are making use of devm_iio_device_register(), we no longer
  need this nor do we have any spi_get_drvdata() in the driver.

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

