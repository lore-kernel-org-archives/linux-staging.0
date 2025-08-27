Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3E530146B
	for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294866; cv=none; b=rDXFLAK2c/DRNH+qvLwNssnl3RTj3h2QeAovH8baRFes8UfZ8QlLvy+LVtJ0HHxNDug0ngaDRhG+wZ21dGLWekPy9uvatrE8Fo63IOsi/Cf8vTvinAWfG1klqIelnWX4FNSmH6ThX+Wy9BzZl5tBzLuIVH/1O+lVjGwroX/oARg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294866; c=relaxed/simple;
	bh=pgWs9Fl3AjMXf1LDTSZaRvAPsDeDuu34wIaIvn9qwSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfHajw/9hT5N+v/IhCq53soNaLt1rC1LDXmc61DbJI20VvSJlbOSbVS+dC6NSaEiFIeNu24OOz07owmApmmne0LYeDK3y7tMab8Mi8jooxMRjzGED9/6bDJkhPPa07C+Bjbyi8c59L+RzexB6n4Gc9avLEs4azS6bbm23HKQWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGJGqtHR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGJGqtHR"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so987924366b.2
        for <linux-staging@lists.linux.dev>; Wed, 27 Aug 2025 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756294863; x=1756899663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5UXkam6EZFJ2kTkcI17dPcXugh4l+mwYsBdJc9Nb64=;
        b=SGJGqtHRXPap1F8f1tHmT6U0fTj0MVdmR7LQ2o6sMfYWNFZjbwlP88XRFzCuqfC3aa
         NCJMhY1ITsLefGscMYCv+hyFR/s4Uq3FvIcYqNm7iOuFrWBW+Sr+qbnIKQg0Y0ouYhaP
         TMLwkYrOhu578Ep0ibZetXaiJaJcJ8czIlHsawJv4sa28P44WCYAR/eKo9G5vaqOyJDN
         VSq+Nbg8xpGHbhPF7aqT9/9bZ8WKdniJjvNf5LgxN6qc+D95fvmjUfpSLr1LtsPksbTE
         kB91NfpUwGvwCQiDTDeKvfUnrS0efKs7A/VT9+DMSBbotPy+3FaKZ1fncex7ayA8II1z
         DE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294863; x=1756899663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5UXkam6EZFJ2kTkcI17dPcXugh4l+mwYsBdJc9Nb64=;
        b=mGdOx7pRripx/QCoTM8BTr8pyPF6yr5t4u2fTBUSbFy82IGwq55KNY9c8bNlAU1xGk
         2Rr+GG2PJLbt4HiyXGB5qJCvd79LlBD5JCj/DimWj6yrqOlRLj+4FY5pU6Urvnq+uT/U
         /TjUgZ7RCeLGy7yBQ7+YUBmfGtkzSuQraMzaMfoBfpOa5mwABRZG7d/1Mp2uyCxjcwsm
         qPwEMgZ3Dv2JSytsULpOC3ForOrPf7jEhETjj9Dn2x5EwSJ7LsdoCW9VMtxIhajF+2Mp
         CTE9fEtSM5PiLn3TIuPdzmAGN2OqH81pqEsSxF4p7lJxiSmwgvKPIpDlLpn/aP9ma/nq
         7LgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnIgX1+4xQuOfOGYGlDtwP9wqF/EyjtdByum5Jish1CauK7NVrrhFkor4ARIM40oAhxUkI9yiRFS1f06Fj@lists.linux.dev
X-Gm-Message-State: AOJu0YzKcDksvFEOE0I2VJhx9XJ5dgx75W9pA9o1+f3RFBIhu6MhbFVX
	5ygHWSelCAzMDPsv0dtUNv7wVoMBbCBcw82qVVufmULdRVHUU6RJhQuq
X-Gm-Gg: ASbGncsjlj+CPwcrHvGvWunZMiVS4YfrrPiG3xmffidPB1zEmdLAWzviNm511Xm/Z9y
	gr6lycLeqBbJs6dQjRWaUgMOkxWeIWzyWt0F7ZghsneBhoXHkLZEUUs8egP2v+zx8TnHJyjjiwb
	ouBshlpeHhOdnYw0dKTp66UfqAvI8fzp4M0dBXxwn9Hij6NKGIF0H1TG55T4R3btWqlbn+mwuUL
	imO/xxhMP2VBRhAXgEUeuj8jheOPgLy8iJUMo3R/L9KtF8nNDdQQTV8LYR+75fGcCvwNfYLsZK+
	wxZ3vajZ3JCS2cvnSSRiVTDoSz+M2w+kwXdatcTeNAHdm1Uh1P3Spd4BA1Y749N6e5RDtJ0z83A
	nYCoNYDzpIoFXrkRoimjOzk+wpm+fpPy4UJwgzIOa9NcRhFwrpjG7C1tV8kNAY9sz+t8J8FvDIT
	eRysMBeyPPuYniqtJwsuiZf5vJVz49VNFUTgFe1qeOLsX2haaEKRZS2LKj8NxFj5DM
X-Google-Smtp-Source: AGHT+IGYhcCBY0Z6VtU4bCCKfFBVqvgDRnjW3XahYt+KCx0GJMTDNhG4q4QETcByqCiQjaB3Rf8D6Q==
X-Received: by 2002:a17:906:fe01:b0:afe:5ce6:3bd with SMTP id a640c23a62f3a-afe5ce60598mr1212751166b.40.1756294862864;
        Wed, 27 Aug 2025 04:41:02 -0700 (PDT)
Received: from XPS.. (ipservice-092-210-202-008.092.210.pools.vodafone-ip.de. [92.210.202.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8725112bsm571725166b.36.2025.08.27.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:41:02 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	matchstick@neverthere.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2] staging: gpib: simplify and fix get_data_lines
Date: Wed, 27 Aug 2025 13:38:57 +0200
Message-ID: <20250827113858.17265-1-osama.abdelkader@gmail.com>
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
v2:
Just print the gpio pin error and leave the bit as zero
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 28 ++++++++++++++----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 17884810fd69..f4ca59c007dd 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1403,17 +1403,23 @@ static void set_data_lines(u8 byte)
 
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
-	return ~ret;
+	struct gpio_desc *lines[8] = {
+		D01, D02, D03, D04, D05, D06, D07, D08
+	};
+
+	u8 val = 0;
+	int ret, i;
+
+	for (i = 0; i < 8; i++) {
+		ret = gpiod_get_value(lines[i]);
+		if (ret < 0) {
+			pr_err("get GPIO pin %d error: %d\n", i, ret);
+			continue;
+		}
+		val |= (ret & 1) << i;
+	}
+
+	return ~val;
 }
 
 static void set_data_lines_input(void)
-- 
2.43.0

