Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72592512D8
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190369; cv=none; b=YO+f1SteEMixYuYiHTR/3BZHLraQz+ZNaAxm6tfKCGDT8yqVOa5zqAZObrcew/RcVxjr1P5lsN/kjVYJ32yb5A9wyj5QBmO/kFy/A92LfWFAAITTUNjZeCkOJsGx9nlzGb0FO/MvFeIK91zINeNE8RE5rFBL2fXoqhj48Tfkx8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190369; c=relaxed/simple;
	bh=y43NBX9/dEA3UbtBX620A2NwPamDY1IzbS/4LLP6ao4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umgCst4vgLwykRXVcK1gcKAjBa1Eay/DoS7X3aRWBUfJhu+UaemvBhU5vmxXtFauxISJZrx9OVkVQpAGTFEguZde3ZVwbkrx4/HYG+zxFyQQNGOuQoW6tGx70hj+wQ5aqwxGoe9EzLDmLfMpf1IkLNx5D/fsLebU3vvvhr+zP/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHmYHcwl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHmYHcwl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22337bc9ac3so134214455ad.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 07:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741190366; x=1741795166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbttPQ2//vu2JOzFy7P226VnKJBZhveO8Ra+kZ4Mt3M=;
        b=jHmYHcwlxb3ngS5SHZxzcnMvSqbY8FFLcXrCMnPUVvRPHvdnTlgNjcFIgUmKNDe4xb
         sFr6ZTQxdRGg8MUNxi5LEjQlX8345ixZVWwcrAWvQjTdGzRhE4uud3ALuwPZa34ey3Dp
         AFgMX+Bv6mzhEm25xxeS7v1fnSiTWiG0auW81f4CU89GPLJCy0HxGB2ALThtHRej7yNR
         fpCZLyoAx+GtJ4gDcgxXurmzWbuY+5DUPN1ATXTissTrpWdYOdhfhiRu9YUD4W/5dBs0
         19nH6/WfIyb8aL7zpsI41ZZw/R4c7mi94Mv7QxjSk/Y3e8uOMdu/oiu+Gu+pbgbUnMv0
         rLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190366; x=1741795166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbttPQ2//vu2JOzFy7P226VnKJBZhveO8Ra+kZ4Mt3M=;
        b=dcu7RjQvA/Di5/yYVvo6zRw1NHao/VgKQLHKFz1fLqhWMv6P72z3osgX7BiezmbHo+
         l53JQhs2oySnbLrsmsNYz++I6ywOusFaNItXVhrTFfKJ0AG7DLWC4AVpVF+OdLGu8/WK
         bLBJr1gVSTgYF83DgLX41Chj0VEIJoJ4AgCB4yyDa+D8KSt+usjpvnz5uMUGlI69UEA9
         kdrd44/jAwx7AIUanze3OW3VwHYAXJFAaJ+NAGML/8gBas4p526cqRW8QikdcN/xH8Ha
         QyYN0MBd/1ELvN+ktnjJjo4+8FubdnS0+jPBfX2zDLzKiCQ6O1xkowpADDuJVPftGkUk
         RTKw==
X-Forwarded-Encrypted: i=1; AJvYcCXxWWSkaJLf4DigCKrg2h2vLy4H2gOW0E0FveMOoVEWVyQVMOGHDrsXdgZ0Wsz98nNgLalNkg2yx3KvWHnN@lists.linux.dev
X-Gm-Message-State: AOJu0YxGYUaZaBWWVHkgjrTkleoc12aJy4xoH/0UtItlbC15CnbKk/Tz
	Ascc+FLaD+L04m+OMRAM7jySZ7CqYbC/6t2wolFP6IJkOgDzZE3G
X-Gm-Gg: ASbGncvnJP1j5YovxZQWgxg4wVDYmq312Ov6f+5Pa3ucudCNoB7MXght0cB2coU5MlV
	R+jZbbN7psIYgCMOu+kdg4Rux28l4tIVY07aQqc7kw0eq0/hgL+aCqv0SznK8NxQoo8EMlqnuMC
	BfSKG5ysZYKHHASFVCJZA76AnBGaZkkFNlKIwTIVTmJXu1rdKjRRJU7+dl+esMlrYTtUBSav+LE
	St1hrixAiuq7RQLTDOkMoJlo1+qxzNlbJuiiJZN9D4WATAEK74z3tp75aixkKzBsqxLdCYWgkHJ
	J33yWe2D1WaTCAtGrY+OEVuqEe9eZZWSfDws/ZkjVS7YBx6CRnbV0lw61Q+wccn1yys=
X-Google-Smtp-Source: AGHT+IFRsSdTIXQKmtW0X087x3MBdawJhi4fi22hKHtJpyG3BYGckMszeQxUjNr/HzcoMS/Ufnw1FQ==
X-Received: by 2002:a17:903:2452:b0:224:78e:4ebe with SMTP id d9443c01a7336-224078e5203mr4297495ad.33.1741190365953;
        Wed, 05 Mar 2025 07:59:25 -0800 (PST)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f9d96sm114914245ad.54.2025.03.05.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:25 -0800 (PST)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lars@metafoo.d,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH 2/2] iio: accel: adis16203: remove spi_set_drvdata()
Date: Wed,  5 Mar 2025 20:59:12 +0530
Message-ID: <20250305155712.49833-4-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305155712.49833-2-simeddon@gmail.com>
References: <20250305155712.49833-2-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not use spi_get_drvdata() anywhere.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index ac4b28bcd766..ec21365bb391 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -268,8 +268,6 @@ static int adis16203_probe(struct spi_device *spi)
 	if (!indio_dev)
 		return -ENOMEM;
 	st = iio_priv(indio_dev);
-	/* this is only used for removal purposes */
-	spi_set_drvdata(spi, indio_dev);
 
 	indio_dev->name = spi->dev.driver->name;
 	indio_dev->channels = adis16203_channels;
-- 
2.48.1

