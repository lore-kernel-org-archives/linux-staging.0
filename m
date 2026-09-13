Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07B390223
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289636; cv=none; b=oizSwAu6vXJbWq1DT92VCjOlEwvFi/xOtOqOE6kgkqpCeLIcUTLzs1MpMPf5Mot0jk1uNjCJCuJKZ87ugJ8l9qPJnharl2otUvTR2MOtAaoH/XcE9us1MHgdaZ0mJocZhQRv7OtJYtIgdBWzHC9VimNoaulwY6cfEOoJe/j35ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289636; c=relaxed/simple;
	bh=3+cgl2lApzXM57QbowOk6GGJ+xHrzWmluYrLDPam/Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCR7Fgre6vphKU9QNmiOvrJrk72emjfh21nUVdfUnZr6ocFMU3LWia2hh4l0o7N0ir1tI4BDeAEYSl1amMJDPg+JUJOUFDPcRFJTLMAsZOJj5vwV6SWuBRGZW3g+p3TDaVI6P7LvHniussO1L0ocBRnrTsJB534R7ZiPJWkpfII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCqX7wJy; arc=none smtp.client-ip=74.125.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCqX7wJy"
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-4843169420fso620739f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289633; x=1789894433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOdml8t4+a2r4TluaWsnQnPMm+X8XLNBiqhXtFxxsck=;
        b=DCqX7wJycuMVeO3mtN3vBVvqVPQ21pgK8ULubUBwgImitkv7oJYlQxtNhu6eFX4AbD
         hbPR10ea55aL0hP/MI0mMzdH1E0Z+vSPIMrqjtKGAkzlr5HXdO2T4ewyzhVpPlefGB8S
         3kyCOcwezd9QeRUv/8GsK5LLBlNeKN1pe2xjS/FrQ0FvLQYpuSQHV5QUr2IYAXC9qndJ
         7thYyTH+1YzLLrVLR/N2Nm7wm7JBIRQcWCZYdplV0P++Ird4/y2PTEVmKJq7GIG3XCqx
         bMuc+q8uKfnTMy6AwU8Z7wbYyDmykJTu4h+Qo0tEX0NGG1/LVM4M55J4T1hVXx5INCuU
         Spig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289633; x=1789894433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOdml8t4+a2r4TluaWsnQnPMm+X8XLNBiqhXtFxxsck=;
        b=aB/2LTsYeSxNXhe6A986WNXJBpTuJagct89NhRprP76ChZUpnJAVzZe0FeWCi0CdwH
         fgJzdSxEP4gtP6e/XyK4/IHPqKO5pEVrEekf3UCtLt8yVgKcUzYvJIo0XT7CrUso+FsZ
         veOqZWX7Y4ANFm48ysxRhYaHVDJq4qvccB6+9mg+W2sc3PJ1OZqfcX3SFcDk7gLjXFVE
         2O+2AgMwwAWnCZtSPjYexcFSJCosE+KC7D+vb14gtlzsVgbpaoOOmN2zlYo6Z7hyr9t3
         C8bVzbANFWhm6V872MNS9a3DqiUoSKE/XeK1DNRykAzzK+e05H/bDGH2A4V+UbnBc3MV
         NHFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwujQW7n5yw9VfrEk2Jtgf0Lv+zoAgwdjV++ko0LIjYvz2Do2QcgDC6YIFcJVQUmXKwSjdyPPkMBPHdLR7N@lists.linux.dev
X-Gm-Message-State: AFuF++mZWoSYNtUQZwwqb+a/jMhcSbOFx13Pw8eqb03gDIwl5L+xRJpJ
	E48W6WE8NFmldh2f4/t+eClBrY8FglVgQfKhA4pO41fDFGoGv6eYN3mY
X-Gm-Gg: AYBFou2Su23N/zmTQy0PEgJ+Bk0QHrwd6N5ufsagLbqgdoWQGRwod3XlkiOtnKBufSg
	kMQ5GgPgoukfRZ4BYh94CcKISaUl+juAC7T0AEtN83VlcTGm9kRqk+EyKcb30HyI/d85EuLILn0
	BiBjAReuZ5kfm+v9oyASPdXPUvJTPoHE3WpMzUCm3cdLA8C8uHfL/M1d03kneApsuM+Qcnqrx00
	V/dla/kDsYlKVM0IDP065W3hAKDmH7DSc1f3gw+L5DiAVwg3dqIJU0JdMqZNraC3DJKQUqkZ6pt
	oY8D2jntN1DWbHFGKvkkpXBsy702Tb4Olx3NnCldmHYSi578rKPe/AoMc+iSSCW/e2hq3aJzRZn
	eD/doq27k6B+RmdWNO4OD0sXuN5ChaPHfU4auTOL7iFzS4noqvpU4FbPx49kI8qCXzc7cKlhS4K
	SSoc9oR13/14F7B9aS4NQ2+C7hCYe1MPfSEsWqIP29+X4HmvkFWKQQ+c1z4lNjAvhAtm1Eo1SA0
	qz+b7PG8jiSUpDBolI=
X-Received: by 2002:a05:6000:2084:b0:486:f455:403 with SMTP id ffacd0b85a97d-486f455045emr9034370f8f.57.1789289633058;
        Sun, 13 Sep 2026 01:53:53 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:52 -0700 (PDT)
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
Subject: [PATCH v2 1/6] iio: accel: adis16201: add SPI device ID table
Date: Sun, 13 Sep 2026 13:53:02 +0500
Message-ID: <20260913085307.13846-2-shehryar.amd@gmail.com>
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

Add spi_device_id table for ADIS16201. Replace MODULE_ALIAS()
with MODULE_DEVICE_TABLE() which automatically generates the same
module alias.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index ba0f97944..1e76a3560 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,16 +288,23 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct spi_device_id adis16201_ids[] = {
+	{ .name = "adis16201", 0 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(spi, adis16201_ids);
+
 static struct spi_driver adis16201_driver = {
 	.driver = {
 		.name = "adis16201",
 	},
 	.probe = adis16201_probe,
+	.id_table = adis16201_ids,
 };
 module_spi_driver(adis16201_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("spi:adis16201");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.43.0

