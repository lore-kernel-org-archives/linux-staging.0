Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78F1DE3D6;
	Sat, 19 Apr 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745071007; cv=none; b=dSQfp15faaccBR53cuyzGdY2GhNF1UmPtffZ30VfIXm/uQcka2tS4Y6Ek/CvlHG8uCnX5dySrCXz3lk0Ag2eez4MBpe376KU49uP0YDq+e6SG/2yldEudGOqVlLgURADY6MU3+FHKDDqaKnuuMnsMY3b24VADMXCrZXRMBFHPEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745071007; c=relaxed/simple;
	bh=IeGkgU0YBXtfAvHiWobFFEYEFFchmZKYlSuvetJAaME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH5MMLyeS5VlEU1TFVsQMQ/72tEZrNL5LxJacNGmyuppX6E0p7NRwuKdBvNpjSIYChwm9/LDDcvb4E+uM0YztutixtOBjtYtW3Uykpf10CqWiJeXivKVV2Se8eC1lTZfxPyf5YvsmnD0+M0jiWnp77i4hpURyL3tRUrwtmHlIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLn5CWsR; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLn5CWsR"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c55500cf80so206252185a.1;
        Sat, 19 Apr 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745071004; x=1745675804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWMbB3RCjLtzIka1EeVCBu0jLU/YK5i3+0Q0+aZfr+E=;
        b=MLn5CWsRVOV3q+fTEXUFX+SrJsZkpaYnERjeCP1jbfmMzfd6CCRpoby2v0cM1zgLnQ
         GFr/OV9PJ3klhRTd/SsHMsrbKNEzAfgj6a5RW4K0v9tUr4NhuBmwtAcTOeYV12gZc777
         1BBAQGsIQO2LdVDl+rCmvIqcuAEw4aGU//9pv7wbyvw3XrwYdXbDIf9JS6d4++ldD6zN
         ix2PLbxjvHHHont+gdLExhmB6EBuvEJxhqLmHFaL+sUtj51Uq8lPND0ym8MBGv4XNEZy
         jmlLpJTJnhWNOhlmWuJqaydv7pFXsJj/jGm8JeWzCJgPBoQzBLOuWrTTU1IvLSFfBoh1
         lxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745071004; x=1745675804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWMbB3RCjLtzIka1EeVCBu0jLU/YK5i3+0Q0+aZfr+E=;
        b=b/B3chLOiEHZISX1z9W7lpyjtAWzNdffRWWSErHz0sgq09wbE4V/IxAGHzqZgTx7C6
         gtnY5sUX1u3l2o82PwhusdDJ1KdqBrO6Vnf+CciFDpV/hDpe5kwQElbRwCJ9hE4/oHbM
         e0qF2MJtSsGCz+21JqCAOem7bqKB3VJTuAWu9UxVctRT5mS92OzG9r+RXTlkloGu6xAA
         YAZs7LjH3LuLZK2HXC0NC6qWyBfzXB1xY78nPnGNLK7LSux5+lqMZIf66eO7Dt14ULHo
         ZzpRCH6L5DlpNI3sQC9N82ELJBPetgqDCPtSf1GUxjET9tdNwYWGtlczgHaLUjxXpjC5
         CCHg==
X-Forwarded-Encrypted: i=1; AJvYcCU4JSpCC6UbUMXD2W8dJ9ObscbMvvS2UqBm+/UOZ00BYkxHdYzcffdAFvOU89o4HMXtqNAH4cr5SU3HVEh/V7mF3pg0rg==@lists.linux.dev, AJvYcCWlNQfGXTs+JBfpIS3sPx1wZqWB4Uv+irL0IGGYScMPrdjeM0Hk8CNxau31XkdBH0ujizn8nBauYd627qYsTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrFyiWTfsIQgMVlSyqXeV5IKiwpYmeN/ptBVhv+90hx0Phukwn
	MRmpEIJxNUdx/M72bMboxdMh/iPkno2fxsVX509ZlwQ9nqIiJMPB
X-Gm-Gg: ASbGncvYIVjhu1YDqHIJQ3Z5v2K3KgMCsbKm78h2PfHFvKtfYDZkjvvxDZhY3ySf0rM
	7NJ27RUIi2wrliia0tKi5IbqFBTJ7su9wZQazrp9yQyZBUXmphP5buS/Maaw6HGizL3A+YrrGFz
	iuFlB+F0Tge/3iiOxuuKVoKABfRw7gvvH6MT/0rx8Yo/h7KchFVtRLoh3lOVw7Amc5Bov9N6esz
	qQWyLkIVu3AXKcqvGXB1CqSmQvH87tPSMwVyVNxu55H7uR84z9HMnMYJxiRZiJ/aG4F07Ga/8ID
	MsMGGNZL/DLzghfxN/4LumnVz8erUsGoPKbJcEwkUowyWjjM3xja2js=
X-Google-Smtp-Source: AGHT+IFE5Q10ytdMM8/SuSSTefTUYIbTBwb4vK2u7waQDWVfRENh+ujjhU4ceANhgI0oVyC+lc+k9g==
X-Received: by 2002:a05:620a:319d:b0:7c5:4c49:76a5 with SMTP id af79cd13be357-7c927f59296mr765340185a.12.1745071004357;
        Sat, 19 Apr 2025 06:56:44 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac4749sm214350185a.59.2025.04.19.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 06:56:44 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 4/5] staging: iio: adc: ad7816: Use chip_info for device capabilities
Date: Sat, 19 Apr 2025 09:56:37 -0400
Message-ID: <20250419135638.810070-5-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419135638.810070-1-gshahrouzi@gmail.com>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move device-specific capability information, like the presence of a
BUSY pin, into the ad7816_chip_info structure.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 39310ade770d0..ab7520a8a3da9 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -44,21 +44,25 @@
 struct ad7816_chip_info {
 	const char *name;
 	u8 max_channels;
+	bool has_busy_pin;
 };
 
 static const struct ad7816_chip_info ad7816_info_ad7816 = {
 	.name = "ad7816",
 	.max_channels = 0,
+	.has_busy_pin = true,
 };
 
 static const struct ad7816_chip_info ad7817_info_ad7817 = {
 	.name = "ad7817",
 	.max_channels = 3,
+	.has_busy_pin = true,
 };
 
 static const struct ad7816_chip_info ad7818_info_ad7818 = {
 	.name = "ad7818",
 	.max_channels = 1,
+	.has_busy_pin = false,
 };
 
 struct ad7816_state {
@@ -98,7 +102,7 @@ static int ad7816_spi_read(struct ad7816_state *chip, u16 *data)
 		gpiod_set_value(chip->convert_pin, 1);
 	}
 
-	if (chip->chip_info == &ad7816_info_ad7816 || chip->chip_info == &ad7817_info_ad7817) {
+	if (chip->chip_info->has_busy_pin) {
 		while (gpiod_get_value(chip->busy_pin))
 			cpu_relax();
 	}
-- 
2.43.0

