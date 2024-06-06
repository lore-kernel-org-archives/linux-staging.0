Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3311E861
	for <linux-staging@lists.linux.dev>; Thu,  6 Jun 2024 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689265; cv=none; b=FfHSNV3IlEloLfbi1zrFPWtJdrOEdh2qu29NNzFV7NvHcEusIje5gR7ObMqjO8pfy0hD7UPKjbQ3Po0gQFHIKWD82vJ+S00hYEjItdb3Nl2Z+NGsvv+kUyiFVMAOVXGenRUqaQm+xpfJNlE6TS1WYxaJ6ZTwsC5+LW3xAsgD4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689265; c=relaxed/simple;
	bh=Ek8uvkVoQwtrbJBja6EM5Lcgx+Z0IlAX8pZOfk/I1zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ThL6otg2kDf3ijk4BDVDl/9lmVedkcQOW4/tCkaIZm8Ct2V3zpBCQSozv/IWfNcAWpAyaTxRTZ1y/GDewuVI8fo5d/kgP0F0z/UxWpe9NF9wWnG8truUukCgu3PIlSpwCaLRLDE0DdWK6+NDV4wI5HSbJvHXV9QaXFJj+6C4dVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mZbRPes8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mZbRPes8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4213b94b8b5so11880725e9.0
        for <linux-staging@lists.linux.dev>; Thu, 06 Jun 2024 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717689261; x=1718294061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7RAALchSArLdEez8weaABgh2SvVfCvHFLfQRisjhOk=;
        b=mZbRPes8ExKLSokruCn4t0LxBlBoIjoITHJU37lMZxh3vKuNVRDvLxRifqY7twc8mn
         YewPHmSSq6hOvut9AE0RQWGV+a3BiLskrvmN0C8ZMZSStlnHhGcSKIgAj9Zk9f1p0bHX
         OeHfTE4VbqVEo/q7knMIsPLXVuLC6TsWO5p6Feb9VojnFU9rnyaLVoTudmyRWht1v11Y
         7Mg5tjDO3E2Jh0TU4/laM+Ycjhob7ZwVh8R4WO8e+DdMGiaIo3SuS0E9HZvmeiiXaNYe
         Majj7fncpd4TYirq6+weNbA+7TPfG2Yt7kUYgWQWRfx4O8Ro5FG1DJLgPbr1jTzyjkyA
         jrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689261; x=1718294061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7RAALchSArLdEez8weaABgh2SvVfCvHFLfQRisjhOk=;
        b=tYMAlu4LWp0AJF5mBHOzdo1cBl2jDnPBhWwA7dYFOpsnkmxgYDa3ygc1OjBkjMUGiS
         jEpygdKLRNpKvMxkMa/wE/eFDCu5sNwltg5MRILFSkBDP2SDyZGpXtgPs+51Mwqgw8Ge
         VjDHJncAkUklk0m0aOgjLyPtatH2oUS92vUYOPIZSHizS1V9atc+wg6MjSU5SxDWNBlN
         6uG2v4XN+9YL8JgwLJyEbX0vadx32eWuvUS/EL1CMCTOEBxVliZAz+LBs2Ra+3KqIb8+
         DWqwIgJyEDyyMcMOjFJmNLkL7lfAWuDgMA0h+1Ely9BwJaPGXQ3eaUUoeFHZcTN5Yg/d
         HwHg==
X-Forwarded-Encrypted: i=1; AJvYcCXm6n1ONsoN3LPoxqewv2z2GkjwMYqW2apVNx7XbvqIIc37gUz0DxXmYuIoTqtEcgyvnwdqBvxMGG+B0ySIOJX8W3udw+PfCWGdvhpEdQ==
X-Gm-Message-State: AOJu0Yx2I7B0LcbuU+DcHGeRWk8HYcESAQlHJt4Q3rue12MZHiBfIeU3
	71oqHkxPSQVvlnj8YUBGOuUIoTH9sPWLiuzcjTYmCtZ7phH6ZnQUdHEcGY9zsuA=
X-Google-Smtp-Source: AGHT+IGcJ78wf//iyjMcVhRRQucY6jo9NOu0cxE6uq3JHMLnWlhl+nIhsgi75WLvHdo+juV6Flk7FQ==
X-Received: by 2002:a05:600c:510f:b0:41f:afa6:3d85 with SMTP id 5b1f17b1804b1-42164a28f8fmr913945e9.31.1717689261173;
        Thu, 06 Jun 2024 08:54:21 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe366sm60119245e9.7.2024.06.06.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 08:54:20 -0700 (PDT)
From: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: iio: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Thu,  6 Jun 2024 17:54:04 +0200
Message-ID: <20240606155407.499344-1-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/staging/iio/addac/adt7316-i2c.c         | 12 ++++++------
 drivers/staging/iio/impedance-analyzer/ad5933.c |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-i2c.c b/drivers/staging/iio/addac/adt7316-i2c.c
index 6c1f91c859ca..e6ad088636f6 100644
--- a/drivers/staging/iio/addac/adt7316-i2c.c
+++ b/drivers/staging/iio/addac/adt7316-i2c.c
@@ -109,12 +109,12 @@ static int adt7316_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adt7316_i2c_id[] = {
-	{ "adt7316", 0 },
-	{ "adt7317", 0 },
-	{ "adt7318", 0 },
-	{ "adt7516", 0 },
-	{ "adt7517", 0 },
-	{ "adt7519", 0 },
+	{ "adt7316" },
+	{ "adt7317" },
+	{ "adt7318" },
+	{ "adt7516" },
+	{ "adt7517" },
+	{ "adt7519" },
 	{ }
 };
 
diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index b7af5fe63e09..cd00d9607565 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -721,8 +721,8 @@ static int ad5933_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad5933_id[] = {
-	{ "ad5933", 0 },
-	{ "ad5934", 0 },
+	{ "ad5933" },
+	{ "ad5934" },
 	{}
 };
 

base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
-- 
2.43.0

