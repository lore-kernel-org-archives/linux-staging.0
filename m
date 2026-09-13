Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49834390C9F
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289641; cv=none; b=RchE1lYaC/FkgIY2WOphI0jT0lp5D0lDbOIhXiwfddBP+2Eqh0PH7gKYE/WQz4qEx8GJlVUYnGTpochqXMZNZKBtjOLf45LN2IdQpMYPEDWwXJzv0xZo3v2Z06ybZYz8KNc8L3njS4khxb6eF2dYhpDekO2pimP5sKjNovukLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289641; c=relaxed/simple;
	bh=envbLuQDbQDDEWH3XcYF5G304K0mIQCtaASdr8Op0dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoHnmwpLVQoCYOSRbItQ4J3dLXmKGmZWbazQWN94eE6gMKfNnwCMF8THbMI4oRJV9cTsVPup1tCsNi7MxiwoIVkQpEndV433fUrp0PcAHkQapfngu7Up+IkZ02RnU5emTcKjQoZiX52NJH4Akj7yuQ7wHd23IeXGct+wKf/X6CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6HTa3lw; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6HTa3lw"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-482e067ec96so440946f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289637; x=1789894437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDLkgYBNbtyZoarKCnkrYArqCb7j8Bh77/axESvjCE0=;
        b=g6HTa3lw2KSxO3Ig3ZJUxT+iWd2euuSTSDvgWg32fwKU2rGwoLglRooODGYdqXlZ6n
         +5m1Vcr1e40YKAzUD0GOUIBVi6OxZFpS8jNiE+g8Gk6pzAqGxs6AodjLZ+KrbctEax3i
         orwCoQjjZoy9wX0daQyunsiW6bRqYPRuZGUpzPjxogz9q9Fzg5jcwJgnYJJBTZOcK4EE
         STgzpJcssGrCdVUKhwl/knfZ1y3WC9reXI/b7RooAQkCVagtk2aMf9rpOpAQVzKXRCMB
         Z6m6Rfq4bqxetCnh/QTziQpm1FWMPcYU30QjHRbxsO80YK77BfLBnB3AdAmJtQ9+2vL9
         h0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289637; x=1789894437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDLkgYBNbtyZoarKCnkrYArqCb7j8Bh77/axESvjCE0=;
        b=FlPOwzWTvtXKdb4wb1lPxYYMp3zQ7Ebu9mQRUGhnW6FhhwaqqGVWP1BVoMsRdLLBLW
         UF9AWqdGDfrtbTyUh1nkjoLhiBST3WoP8veWzA8pGSIPoIF/fKK3p4viBxdf0D6/nXn8
         8sVxzUXPQtXF5uNGuZ7Lp93GwSYWpddG2nl0ldJs+DVIMsLlNlJTFdTqm9znnyWX+eiW
         vXNCOrOt07aM9bUrnILNOX5/DsZfYU2A8lDidSCEmvCjxEz8VnAhAcySIPLZP3xAM3NE
         jn8BLEqUhkqAcHbOhV/PcP98Q1He8WEOUUAUCFM9u2ki91oI7ZQCaCD6mtVpNoFaHmE5
         LjXg==
X-Forwarded-Encrypted: i=1; AKwUvBxeIT+KUOTQN5Gy8qb4RizLnM7M5oKyzYzbJ/5XenJ5qtcxv0ZjemFqW1cRapKW7ikpZZ5S4RXP00eFARAI@lists.linux.dev
X-Gm-Message-State: AFuF++mYb1AZx5xananx9YImXLiU7ZEjic/dcLldOqueMkZfqfU+DtX8
	VPuYaplbYNQW3BUkj3Rqp+yfaVQvg1DJ4Gt8/GwpyK+fOy08VfnRXwzu
X-Gm-Gg: AYBFou1VsogIx7jBK0yzabcty2xuZ2+5py4CLScoFZm/Sw7uZlO2dp136XPT3Q35hVk
	OsfxQonP6+Zrb8Lp5a5jVzautnWdHC9P8rCSzc5GDMsBy/h8ZYFNLmFZ5Rjlz63nZmpMNfdzZPX
	jJurq2VW2RuoeQydg0OeAbmjR4KU0BgslNCs3djIV1HWo5rA2v/6bj9553CQDRasv+BQGX5p1yH
	m3zkV8kR6Xuwfu4uZ6ktI3MRVSoObR092k437HaJVYyf4h1cxiHv0NsOp5+HrwVwgweIO/GcHpw
	irRZDTLR2TMXdY72RO1A87VY6Gr0ebP77q18HFlDVoyR2E/KFKxS2vy1LE8o4ZdCuhRrlIVQjnZ
	HrL6ZVnQwAaSupilIPGeZk8T5MXPKqkRnKTSQd54yjq7L101+0q76hteM6bJ2aisWExtTR0nMhv
	tH1wty8WnkoKrb062pBBkIOnw1hQTtYmI/1S2Hm8szb+yV83USESBD6BYMNJwg3D3ndMk5wKq0i
	YPgwCNv7+5jDKaQwZE=
X-Received: by 2002:a5d:6f17:0:b0:486:fcc8:aaf with SMTP id ffacd0b85a97d-486fcc80b06mr1476198f8f.26.1789289637449;
        Sun, 13 Sep 2026 01:53:57 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:57 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 2/6] iio: accel: adis16201: add OF device ID table
Date: Sun, 13 Sep 2026 13:53:03 +0500
Message-ID: <20260913085307.13846-3-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of_device_id table for adis16201 and register it with
MODULE_DEVICE_TABLE() to enable device tree based matching.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 1e76a3560..2ce5c409b 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,6 +288,13 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id adis16201_of_match[] = {
+	{ .compatible = "adi,adis16201" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, adis16201_of_match);
+
 static const struct spi_device_id adis16201_ids[] = {
 	{ .name = "adis16201", 0 },
 	{ },
@@ -298,6 +305,7 @@ MODULE_DEVICE_TABLE(spi, adis16201_ids);
 static struct spi_driver adis16201_driver = {
 	.driver = {
 		.name = "adis16201",
+		.of_match_table = adis16201_of_match,
 	},
 	.probe = adis16201_probe,
 	.id_table = adis16201_ids,
-- 
2.43.0

