Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFDD3A6EE7
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 07:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856966; cv=none; b=a2ZResNIu27uvGtgzPXpBWiIejolI10jdBanLjPFOfRRX2csbFoiYB9zt2kLdLo8EKC1UvBrO68iWMGXGvCW8ZVo9ZO7tw8Zex3jtCbgoecOud2jQA7fN3uhmc8tDjNdcUCWiJRmzMT0eD60gRls0an0S1niovrWGecOi+TOm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856966; c=relaxed/simple;
	bh=FCVDxyeZ6U2fZuvPyn9vj+/wrDMAtqBJkQdHDs14xXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fuTHcpmsb4IjZU4F3h5tbkXwNjFpKyQZ70ObiEr5czlebD6Hav12FyxuFSbgY723sK2NKcppL+MC8iU+vhy8R7XfqYMZ9ZMzaj9qPlb+/nIUxT38LOQVvpelO9CeggaFl6dDD7+VmIJ8nKePIHct2yYF/5R3hbtl572mDkAcW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRNDVPw2; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRNDVPw2"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso2613218a91.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856964; x=1775461764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GvYJ6ECT5bnsGVUpQ7Kcf/RMUFHIPygDIp49KCLMYss=;
        b=YRNDVPw2wMOp14On4xeWCQCHQA0WwUDOQSvBXfw4U4CBplvXV5KR0L/DXMwNxPpym9
         ynt0VyN8OLe0sd90nt+EOIVgZC7KHx77LVBD/YzNHFOZyp7UZTl+kW+swuD0FCNgIqfk
         DAfVHazEEbZhDAqNLRfOWKvaiV4rhUZwa7+7DM3LD9I6mVh+JaPqUjdmfXf4MZxz5Arv
         WXLza3XqV2nF/pzDh58tva7RCz6bQq59dzDGAT/UsBgnm1VPnQasFGe2HOWzVhk1oYbv
         8adWL1It/B4sH+DHs1AF/DlMBULKmvOZfkFURGNY5EOVhk/3PXU1rVty+RPclRhg+oqz
         ckUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856964; x=1775461764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvYJ6ECT5bnsGVUpQ7Kcf/RMUFHIPygDIp49KCLMYss=;
        b=CoxF5Es5J2AJydKQMYFVO2uEk8XiEuJgC7ckO61n4CJe74SKJbG8eTn6NobG0K9wI1
         vxvcoYQYaoOHMgjdDZMrXl/eH8rD0znWwHZehJOPl/DUwIa1uAs8wAb2iIDCb52RpwcL
         NV+EwRR8xBCNnd/DA1xsnqMsCySrAf/uZtP+puLMqbq5ms6oOtXH9qpUBWMDsTUeGVIP
         TJMWSwO2bOBNLmmChQlBIILF4zvYAN07+Uq8KHNr5tLgbWlaPTUedF9VO7elzbYFhRmk
         Ckhl60FR9d84IuGyZmow78j/i078ArdHgWzARdHAN+0YK3qrUbPy7t6U8NGyfoOGFmy1
         bseg==
X-Forwarded-Encrypted: i=1; AJvYcCXXq4iuLLHwLpVQbTIXPhaP3RGGUUEo0HknqMnCFxuogQ6KmKLgXdtOKGHiJIryXyVIC7z0np8D+Kftezva@lists.linux.dev
X-Gm-Message-State: AOJu0YyQt28MyS8yKWuIBEFkAl8+u1Tto7ABLfS3Itlr/I2USSXIkR6T
	kpoR+RHsuvq+YMXEwtnYpxWMg9774zLYUWIHoABqQzPyUrHkdaNrEmxC
X-Gm-Gg: ATEYQzwDDVxT5n5em2ffaGi2nDp2uI69rPmv+IGsFSRQyC4wsA8pXV6oEioZwEXb2Mn
	fTzCrYRrwpYBj/NoyILh+1BUl+y+WIjUmyGWjFmiOze/wii0aWF2UOg6imAaztUL8TR4zSqWYB0
	S23zkBH4MW5GnHyD4vxDom7fXoDf2fawpgea/x7v2OFKnNVN2zvgggF/ITmC28ffNjp/rgoSw/o
	p5cLhwmrScMus5kyuDYLl/nVgCGWbANeITRGl8NY5cKlSsfklBsDwoZskifBn5L+HNXlgph8eV6
	Zom+PoQq6L6prCClQkTiWVYPUk++el9qvOxMuD2WLK/WpJ6taF1bnpGW6Gli8XA6gPWekGm9wFg
	+HEzBfuhBA6KSJRkS5TcRHK+RFCtAtP5gxpoLr25wOTsPVx++LueE0My8NwUtxn1rEmSWtARs/o
	E08p98Paxax9ZEBDNijECEvfNN7rftAzVuVMp5hg==
X-Received: by 2002:a17:902:ce03:b0:2b2:4d08:9e02 with SMTP id d9443c01a7336-2b24d08a6a9mr43053645ad.21.1774856964498;
        Mon, 30 Mar 2026 00:49:24 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:5467:3468:e24:16d:2342:ee26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279a428sm88127555ad.66.2026.03.30.00.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:49:24 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH] staging: iio: adc: ad7816: use sysfs_streq() instead of strcmp()
Date: Mon, 30 Mar 2026 13:48:50 +0600
Message-Id: <20260330074850.12638-1-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_streq() to compare the input buffer with the mode strings.
This is more robust as it ignores trailing newlines, making it safer
for sysfs store functions.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135..c2544415e 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -136,7 +136,7 @@ static ssize_t ad7816_store_mode(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad7816_chip_info *chip = iio_priv(indio_dev);
 
-	if (strcmp(buf, "full") == 0) {
+	if (sysfs_streq(buf, "full")) {
 		gpiod_set_value(chip->rdwr_pin, 1);
 		chip->mode = AD7816_FULL;
 	} else {
-- 
2.34.1

