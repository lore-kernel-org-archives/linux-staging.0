Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79321ADA4
	for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 22:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756245919; cv=none; b=Fpro/ElZjTxbiPd+6O9/drt1mqPBulcFFxR2/+/hpmXGgw9MUSKWGUSJzBkTXmYGCnXQ19n4gISRhhzl0Pu2rAzW/e0RiDBnnNHllKrklCGMV6pfkbgAx4oBoViUImlfXM9b3d2imq2n5F2dF6mdFrhuUZCuDi7CaixBSXjXqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756245919; c=relaxed/simple;
	bh=CcoUYKhr2YqXvegnfI/s8qSchCDEhcQEWbufXc6+c80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1ZVLT5bqRvq8J5eosgGu5BX1jGu8qRbZ8kj1EQEjZWBxgHORhm4dv0cR6z5HK/ch+OzzBtK5sI+ZyAFvUenVS8YCaKsBtLI1mgJvconxAOiJVo3uzOqvRaTd7n2vauvj1PK2Iz6yHBLEzEJDz++s16xczXgdP7gcMqHj5nvKb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5pYkAqt; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5pYkAqt"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7347e09so1060526266b.0
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756245915; x=1756850715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iY5jgqXj688PFbTycou4DPxWJ19/3+efTPtWXBoI4TE=;
        b=A5pYkAqtmlbOhuI7NdkEJiATHIVZbrZ6SFseMMl/DtYVPGaxC3ZDPEkwutdYgo5bAc
         slGjqdJuqhOg+UmStqLrQMHK/v26X0PBYxdS2uCpiqJKbXU3CCKfRTLOxHWzzO5oEQzs
         whlBSU82Sr2b3uHaeCQiWHQ2nnv57nqwHfg5sYZV7MF8mQP6DnePma46/PmSFiyblYpr
         tXEkZB2tb69uPY6IL+KJvBOrXXAYzi0+tKElITTM4ueoyVK88bEdpjJMZf7ivb7Qkipy
         rvQrq3Qc4eOj9sPh2hX/nwUouBXL8Wz46FXHoR1YYnwJiFjqyr2cvFfgLoXctgvFDR/l
         z1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756245915; x=1756850715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iY5jgqXj688PFbTycou4DPxWJ19/3+efTPtWXBoI4TE=;
        b=o6vMHm6x7hgkhoLZhrgovw91WucaHtasIIiTEA5WqUVQ4k5NHFj6sB+lq2PGNRiAfW
         hkZtadsBxO6/FQWyZZ3sHVzomzpPKcyJYdKe6RXnGpevSaLjC81y/bYOCQ96/9k0NDcz
         OAEza8I22YHl6i8VWdYzASSQbCvEjNRmtTpQLNwNYM7PK3qdEZ6Ag+35hbMjfvvyxntC
         WmVycz1mE71AeNrRUrZ1wtbjnyJFBmmNq7KQm7LK3/yeab+gSGjsuNtFWvqc4A5XUQTX
         UADrNB/6HBztv12uyLtuE0jyz7r5FVTLAT0h6ymP7dA4F9dCpRlXBKRpxejj6OfCCUI4
         dyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrgtEXgmSuOn4kA7JUfZKAg9mbOm7ouxkPd2Fx1BburSZNy7FC29xWNi3sPwHSpbnpoI3FMLoDrHUtslSp@lists.linux.dev
X-Gm-Message-State: AOJu0YyEN/pVkSw61w9kNJuSXwY+QLfs25Uoq9I9prTQ2V8GBYBOnoHd
	B4MI0a2072DMr775G2Y9HXSxR3NDFjjVf7ifJmx2kpSZDDwzqp5EZCV7
X-Gm-Gg: ASbGncvI3dPw8QTP4j7Scu0N8TaKEQS6zr2KrTsxVUmlD2WdCCEl8g8YSPBF32SGJhl
	a2h4S/rKH+cuO/6ASzV2s7LP2H9C3P5bNfnmRRb8Z/7kmD5W+RQH7nLCmWJFcAmSMjsFvC29mba
	TiPSSo2zlEsXA7UHnLXHMoCsB1HV+OJ3htNbTHBbkoN+dY8g4uIV9l7fpDfeKI6+R2ehfUxuU9E
	VXlFZly5GBUMvp7o/o/pmy9y0oHZfADXiNe8zbIgniUywWz6BRGB2O2Zqf9CzN4M66YBwaAzk++
	88jfONLZ1DCSow8j6jAxvFvyUm5/5D5tLDrLgpHMgb4CdRHtK3WQzrvsDGreAxz9go7SUREicf4
	ZpLse/uLNSmOJ+IzDbCEhVVT1Vead6XEl03b1HS5quvk8OD8AlIMQFv5A7gYwB6aoFzv+bzkvB4
	2zLtyh
X-Google-Smtp-Source: AGHT+IFzEwVcxMfQ7XalQBhmYFyxbLkLDeKDjgoqS30M2rsyVg2UheDko9Zat6hdGvCGTyCQVsOfPg==
X-Received: by 2002:a17:906:6a1f:b0:ae6:f087:953 with SMTP id a640c23a62f3a-afe28f8581cmr1691238766b.12.1756245914523;
        Tue, 26 Aug 2025 15:05:14 -0700 (PDT)
Received: from XPS.. ([2a02:908:1b0:afe0:c431:8253:5fc5:acbd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe849d7e6bsm481602066b.61.2025.08.26.15.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 15:05:14 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	matchstick@neverthere.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] staging: gpib: simplify and fix get_data_lines
Date: Wed, 27 Aug 2025 00:05:02 +0200
Message-ID: <20250826220502.210485-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function `get_data_lines()` in gpib_bitbang.c currently reads 8
GPIO descriptors individually and combines them into a byte.
This has two issues:

  * `gpiod_get_value()` returns an `int` which may be negative on
    error. Assigning it directly into a `u8` may propagate unexpected
    values. Masking ensures only the LSB is used.
  * The code is repetitive and harder to extend.

Fix this by introducing a local array of GPIO descriptors and looping
over them, while masking the return value to its least significant bit.

This reduces duplication, makes the code more maintainable, and avoids
possible data corruption from negative `gpiod_get_value()` returns.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 17884810fd69..b6d1e650687f 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1403,16 +1403,15 @@ static void set_data_lines(u8 byte)
 
 static u8 get_data_lines(void)
 {
-	u8 ret;
-
-	ret = gpiod_get_value(D01);
-	ret |= gpiod_get_value(D02) << 1;
-	ret |= gpiod_get_value(D03) << 2;
-	ret |= gpiod_get_value(D04) << 3;
-	ret |= gpiod_get_value(D05) << 4;
-	ret |= gpiod_get_value(D06) << 5;
-	ret |= gpiod_get_value(D07) << 6;
-	ret |= gpiod_get_value(D08) << 7;
+	struct gpio_desc *lines[8] = {
+		D01, D02, D03, D04, D05, D06, D07, D08
+	};
+	u8 ret = 0;
+	int i;
+
+	for (i = 0; i < 8; i++)
+		ret |= (gpiod_get_value(lines[i]) & 1) << i;
+
 	return ~ret;
 }
 
-- 
2.43.0

