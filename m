Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC063AEF32
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826187; cv=none; b=Hdypf5jx6EWRIcp5yPYNNjY9RHlqKQsJrDmdFd7flIrui0ixIGxkp1RKdWlr9udYSmU2+cHKeWH3aBX0Qzgj5iuIAyXFcyn9wVf+DOocpsuZpiIOr2Uh1hAWAGrAkJwTOFh295fROznOGYOEVyJe1Q3JVS3ROUUH2P39zOOU3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826187; c=relaxed/simple;
	bh=CA5m6SYfyIsIbGsRbjRvyNxo6rAd15nxhWSBlPRhfLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JgNmYkctPzE4Qf+zRwwL3Ntl+LJ3HWzNl0WNvLuxtHzWjliVxyakrwhJ12wYU3BtRrPsvMDQeQ++DAWACoWcukyRXTfSlBrlSMQSMFYHJmhMlaXMg044dcNwnX3AVJZ/YICIAyAnOM30l2ZfnPeguN6xYbRWhLY0NP+cGab1faA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8obWDeE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8obWDeE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad9f316d68so33019525ad.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773826181; x=1774430981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AGRmyA6PexR8hguL2jzNLvuRfItP4aUuu4yOyqxpTZQ=;
        b=g8obWDeExWx4+RG7rGoSVc/0M1awyjnS5rC4WVsNGRVtYRSznINu+X1ef6nUXzQNfb
         XHdFGma6rQ9YijdsZ0cXaiUOpsnFfOxpbePhHfSzmtO826hc9TocIRexfhkct6vSDt1L
         C6DQKMZ54cxM+GIf0X2CvxIAd3Axky7sfSijxNWvOxMqKgxkZ6W/VMbYkH9nvChHjgaH
         8yvfoQkTaqG8x9E5sLaw9xStzUGdGSZcOySYQryr8EFETFadN1kJ85t7ISbHmMbWwHLS
         JVgbDLDw9feAXcirl6U3y+m0cbZtcuDlp4q7OafMrZ3DU3DKbgp5Q8brSLMfPHQHupbv
         /R9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826181; x=1774430981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGRmyA6PexR8hguL2jzNLvuRfItP4aUuu4yOyqxpTZQ=;
        b=rA/8TvdRgQNam1Uf7VpEuVKNYovbRgsyYxe/ZIZN+2RYlQV4W0W2FgIY7G/SNyJ5Wo
         qc21oyHk5HxxqP9sDMFq1ZHuZTB940dwf60oDE20orPcunhDBcWMq2CVoRuXwnFOp12i
         QD6Zuq0j330biaaZkJqcNaNRNUcwsILhD56AMrsK3+LYn5wYH0qNP/uGGYD/xzMURakd
         WqafdtQn5CEtIaAmPpGEJi18mIz42+RWFjuQV5J8UVuQWPFesqH06EOhGs40lqexq7RS
         DigGbxQlYUDbYlbmiXaicbMBpgXKzydKcaQ3s8exZs27lC7wQeFgAjPl4xingKFFHXek
         Eg6A==
X-Forwarded-Encrypted: i=1; AJvYcCUnbHyNulj6xSlpJGcY26rO9gV1l9gSrq1MvCo8geM+NtRtPwShWbyMF2p7P1OxkokHpNsMdoYXcuQIM8a2@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4lJc9PvkB72vECvDOcE/PpdLkNAhUlGyptwNLL1dm2AwsZiPK
	mjQ6n84ISTpF/nbOBgkpxX0/1EUnxX6Ez86rd6VkBptSu45HjnaM/TYT
X-Gm-Gg: ATEYQzy+8pbV+A7pzyCEqo0eXRD0Z/MI7pS5E+1cqkCAzGERyrcOtyVYvyQ37r4hLQo
	Ue9vSkG3JaHC+8udpQe5RAr5l0/fkpy8fuq4uiJYYydsWZbCDBCX37k+ms7tZykAj4jlEVSueTZ
	Ya+4/HHU/aHUl5DE+ZmXWFrkr/Cc+jnt7uiljJDcmWuXiXQzYLjAPm/3JHzWF/ca0z4LpbI2CBP
	gYb9+ik8g/fo9li4CyhiVvEZgdNNuwx21uAsRbU/Y8wqvhyW/7Baq2bjRkiINC2fBzRMgVAf1Fd
	UXDeuxPS9yIWCmHauyIWYJk1Koyc5TcKj70YAtGcQhCNHGaxUKdV8jZMt+pQEh+JDI0YCs4EKP8
	q7MuwwxuOhqY9nL23SPwAmJ53PN1FadgotxxZu2X4LuoijHmN1B49yLx8gvYACZsM6iJH0r8Nfx
	22QrjyKx2YkRfrskdQ0xik6zKXKgFO/otONLAAMRdjOnuUlUbiifw8R0mXLIkX4A2koJUJarC0
X-Received: by 2002:a17:903:3886:b0:2b0:4c8b:7d33 with SMTP id d9443c01a7336-2b06e41b9bbmr32324985ad.51.1773826181095;
        Wed, 18 Mar 2026 02:29:41 -0700 (PDT)
Received: from debian.ari ([152.58.182.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e616351sm21168315ad.67.2026.03.18.02.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:29:40 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 0/4] iio: adc: ad799x: modernize resource management
Date: Wed, 18 Mar 2026 14:57:11 +0530
Message-Id: <20260318092715.42538-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series modernizes the ad799x driver by converting resource 
management to the devm_ infrastructure. This results in cleaner 
probe error handling, the removal of the ad799x_remove() function, 
and improved code maintainability.

Key changes in this series include:
- Static allocation of the rx_buf using IIO_DECLARE_BUFFER_WITH_TS()
  to avoid dynamic memory leaks during scan mode updates.
- Caching of VCC and VREF regulator voltages during probe() to 
  optimize read_raw() performance and simplify power management logic.
- Migration of regulators and mutex initialization to device-managed 
  resources (devm).
- Removal of the manual ad799x_remove() function and all goto-based 
  error cleanup labels in ad799x_probe().

These changes ensure the teardown sequence is always correct, 
following the reverse order of allocation, and remove unnecessary 
boilerplate code from the driver.

Changes in v5:
- Used devm_add_action_or_reset() for regulator disabling instead of
  devm_regulator_get_enable_read_voltage() as suggested by Jonathan 
  Cameron. This was necessary to preserve the regulator pointers (st->reg 
  and st->vref) required by the driver's suspend/resume power management 
  callbacks.
- Simplified voltage caching to use a single 'vref_uV' variable.
- Converted mutex_init() to devm_mutex_init().
- Resolved error path ordering issues by using devm_* exclusively, 
  allowing for the complete removal of the ad799x_remove() function.

Changes in v4:
- Simplified voltage caching to use a single 'vref_uV' variable as
suggested by David Lechner.
- Capitalized 'uV' in variable names as suggested by Andy Shevchenko.
- Removed redundant 'if (ret < 0)' check in read_raw() (dead check).
- Used devm_mutex_init() to replace manual mutex handling.
- Introduced a local 'dev' pointer in probe() to simplify function calls.
- Switched to IIO_DECLARE_BUFFER_WITH_TS() for the buffer declaration.
- Moved goto removals into the respective patches where devm conversion
occurs.

Changes in v3:
- Split the monolithic v2 patch into 4 logical commits as requested by
  Andy Shevchenko.

Changes in v2:
- Eliminated dynamic buffer allocation (feedback from David Lechner).
- Cached voltages to prevent devm/manual ordering hazards (feedback 
  from Jonathan Cameron).


Archit Anant (4):
  iio: adc: ad799x: use local device pointer in probe
  iio: adc: ad799x: use a static buffer for scan data
  iio: adc: ad799x: cache regulator voltages during probe
  iio: adc: ad799x: use devm_iio_device_register and drop remove()

 drivers/iio/adc/ad799x.c | 106 ++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 57 deletions(-)

-- 
2.39.5

