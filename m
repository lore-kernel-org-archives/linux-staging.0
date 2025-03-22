Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F51D1D89F8
	for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742631079; cv=none; b=ZS41vvOxVQTHLYCtXefRutlvJuFypWPsnhjAAZSUfi4a2o2xZq0HfsT6XWk7ZXuHbHK6PZIbJQLJpN2Fi0l9jB8NoE0B/QolEYoZQaRjDI1/XD19JPgmMARb2Gf5W0wDcyKEbvGSwpW4JxsrwsH5A85A4pUH0/QwF0BxcGaFab8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742631079; c=relaxed/simple;
	bh=EMXlv4ic5fl8PS+RPv8silscyyAIYSdykCBSgcPPdNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQvVfrezAK5Al08lZx7wxI31rnnNjC8M2Wag631FJGVMnhfEtZKw03P3BnCQokJf14fYDm0ciBbIMMP4NcAY6mQNAgzSw55K+mkwfCfH7s1DLeKtRSROuF3rwIWkgI8D/pobvDTFjUcWHR84OjKsIaDO/wjBpr3dANAGLE79m7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9IxP5Pb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9IxP5Pb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223fb0f619dso58172615ad.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742631077; x=1743235877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rxQ3FviK2kzacgD7SuLAezYZnCdIW/riaKpvcF/c7M8=;
        b=R9IxP5PbPVvl7zJwPHz/NMKaJ/ClPRW7s1ZyiUJe9aILRsJf6J6m41mB0VgpEwkRpK
         2LwfcAGp/GerR1VNxNIrULaTNUdcq8qalZzrqdiGOm9xGIXIkhyOaT2i1WYtFMKtBPYG
         /rldyIMMywb9pnBkJ8nbqAu5fkX5U+JuyaYSS54n9uCqUTF1UG+6wGyMpMTNj5r6+htz
         PIBZ8nZC7e1q8BS9UzV6mf/atuGOLdUEecTomHBsYvTnLE8UG3Jt1nbrlX0/YJmYaTVf
         J+EpeKl8OCzhgoSjl0qqVyjbEVqpTk68gCKDm2sKCELGInA6aN7R6qflyN8ZXS3Sm04N
         oQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742631077; x=1743235877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxQ3FviK2kzacgD7SuLAezYZnCdIW/riaKpvcF/c7M8=;
        b=mTKJirrQpfj5zMQZAI4Deys+FAJulKkSLEr+azhi8TnZ2TRfXyprB/uk6E/wk19rnO
         8o3V7ISJ3bgpQap1UERdwHRphNCdKYu3x7jOJRSMP67oeoQ7mG8fQuLJejkCJYBPkA8A
         M+TyxremPdRpIpC+7VwU3xZBkQvBzy3MzuuYWfNdVTDBJqG2s/TXGz26Tm0A8WYW5S0N
         +wLjsEtUMBp7gbMb5QAZ27cAwfk3p5KpW5mtohLOgptCIZBcHdkQz2SBPh3uhLORooqV
         M4ttfS2GneZiG5XtqeoaJBgSGgk3AehnQiqO4ikqCxlmqv5tIG6NbBRVzf+wOf2A/BYp
         KOHA==
X-Forwarded-Encrypted: i=1; AJvYcCXvbwttHnVaDbJKegZsgsX/X5Bam4FzlfhsEfKctGEBMDRpT5nXtvwM02YBEQjSYANzwIHnjL4uZGqbmV+C@lists.linux.dev
X-Gm-Message-State: AOJu0YwpTDI4u/7sg8xhyhvh9MDgSGLQ0aXExYavAVYwuTdWtXfp9Nb6
	ZGwlsbmy73+AMYWP+cO+C3uL6vLzVPqI6eU/B0rO1Z4zmtGr2p3t
X-Gm-Gg: ASbGncuTZtWCDStlu1j4qyk3ZWSoXxgVvp+QyZNzf9v2/kvd5XJZdd+3KAycL0+jrTG
	f6rp0n7WOjC3zrQacYtrY8C86KI+SqjZwWbGZwQMzYjFed7cx3xvwJBS1XhjFx5Lge8ZBGxiWtU
	woLsXO1Kp8Dp0cYZbaeyHqxGnGFzStwWtXXOtmTalqS9hiCeh9fhVT0Ec+8wWd8KQsAGux/V1+H
	4RT6xQLW/v5ejjmDxgF4YxHzYgbiNoI2f/V3rPx/iT8ksB/FpSp9JDLLXVjeSNY5AMDDuJED4AD
	f0rcaizvyouWn3XdyDKXzpKyLqXh6ZqkiY+EO5i/+R9UHBw/gkGzHSYZaDNJOcOBKgw=
X-Google-Smtp-Source: AGHT+IGXVGrhCfAgzl8PH74PCvBmx8kO7jjtdW5onn48zvWslZ4YS3oA6WzT6aineM6+BOoJJIAhhg==
X-Received: by 2002:a17:902:d488:b0:224:26fd:82e5 with SMTP id d9443c01a7336-22780e29ebfmr94634775ad.48.1742631077110;
        Sat, 22 Mar 2025 01:11:17 -0700 (PDT)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f651asm30395385ad.209.2025.03.22.01.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 01:11:16 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	marcelo.schmitt1@gmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH] iio: frequency: ad9832: devicetree probing support
Date: Sat, 22 Mar 2025 13:37:45 +0530
Message-ID: <20250322081108.202654-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct for device match of_device_id

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 9a27acd88926..506478ddede3 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -439,6 +439,13 @@ static int ad9832_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id ad9832_of_match[] = {
+	{ .compatible = "adi,ad9832" },
+	{ .compatible = "adi,ad9835" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ad9832_of_match);
+
 static const struct spi_device_id ad9832_id[] = {
 	{"ad9832", 0},
 	{"ad9835", 0},
@@ -449,6 +456,7 @@ MODULE_DEVICE_TABLE(spi, ad9832_id);
 static struct spi_driver ad9832_driver = {
 	.driver = {
 		.name	= "ad9832",
+		.of_match_table = ad9832_of_match,
 	},
 	.probe		= ad9832_probe,
 	.id_table	= ad9832_id,
-- 
2.48.1

