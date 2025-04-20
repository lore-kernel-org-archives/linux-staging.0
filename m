Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC314658C;
	Sun, 20 Apr 2025 01:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745113757; cv=none; b=Bc0dhWE5as5pdNK1yolGoJ2+d430m+pvjc1VPSzQtXnQgqV8G7N61BJnxY9dcWtdTMRehRGm5C/82PM7I+/GIOWQd7f85YUe+k6H9eiAll0MTWMd3LPUeBwhN4xHLzvbgokAEQstLIjqM4wNPRn3V+NmwfGUZmUGtZuGJGuVBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745113757; c=relaxed/simple;
	bh=IeGkgU0YBXtfAvHiWobFFEYEFFchmZKYlSuvetJAaME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jai7xRA51NxUhHUq/tNoIQx0t7fb+iEz7uNTHBhRDIOeMRrh+VM7Lxh9le6/BI4+0D8vwZW7LyDD7IOWtBo8s0kwdyhIAXeiU+v9rmZs4vwDdcKSaMmjZprcWY+n61qO5+LlWBtaR5DfK0hCJmwEZGumirUqWItGUl1uOgi1Exo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzCj9+8g; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzCj9+8g"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f94c2698so14322846d6.0;
        Sat, 19 Apr 2025 18:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745113755; x=1745718555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWMbB3RCjLtzIka1EeVCBu0jLU/YK5i3+0Q0+aZfr+E=;
        b=AzCj9+8gfQwfldqgyO1Ww4uGz2wD/srNGXnLfHZHu2tyAu2lPbAwoD93RrrXeMxhv6
         w2PTP9LBQt+WMMaRToI/FvNfkNuL44zlrprnRBIlaQmHgIWwRFS9MIcpJpBuQOnoTnIc
         kErVbn2tOplPeIasf9sDQTyrJ8wkob9sRl1oXr9uRhrO+crO41mnBPC57/2CFbF3+jJ1
         3walSlB9vWA7Q1s8SN5PuTz5XzfZbjmSXXkes9d/NjmgJCEHhQ8i+OmhiiOQhxWM8HYq
         dnKYlCf/BsXKmEvTHT4U0RxEQdl+sQoMv62T2o2L465KWHW0ph9biR3VG4VhMZPU6FgL
         4E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745113755; x=1745718555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWMbB3RCjLtzIka1EeVCBu0jLU/YK5i3+0Q0+aZfr+E=;
        b=qttecvTp5pPFsKmDw/eBYq3EthvF99LIof5598dTurznBCn1xD0WpBvJZEMvY1uJHe
         KaenoLSF8jTDtBnjiGp7h4Ufbkq+hBiXierbPbmh5XssvEVlLU3V/DNk2jWSsJOfPVr7
         Ad5+0nNqyU5T/my3TF5A2z1+3yfcVFh+8nilsE3NVLdC14pEMkJpo6Mk7HnGqHtd34uj
         Tsaqak/aMdDDcLjo1nEAkWf3T6/MZYXxbYoMjtaV/f6hHVlUX9vQHMBBr2Qh5FIT4law
         ZTfkpt4GGUd5uNoOlcciML0krk+7AvzNE6cRwh5ot3xQzy5yEixA5Q1Qz0z4x33QtEQe
         n20w==
X-Forwarded-Encrypted: i=1; AJvYcCUfhN8wj/9IdltiVEg/uRg0oDb/nrok0k0K8FYrHh9YD4SUd6pha/Rg+vXcJgyBz4vTD6dnGIkpj7AJ06xmKUbfsn825w==@lists.linux.dev, AJvYcCXvOsLBfpMLXW5nWMhWhtOjymrzfRpTXLe0qKcDwhmK/8JHxn62XebbgY5UfPFIA0VOvFAapxKwUYx1pbMsPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFM0QvGL6c+E7CRb6rwMgtcXeC/e6JQxVhYcABYYi/9IVU4CHB
	WXHv+extvUyp2H5VdY1quUyt3i3NxXbaAGcPbI3HeTP6Mu9f+bmX
X-Gm-Gg: ASbGncuKB4OWE7wn1Ll8+b5uV9ed/b2iGOkQoEJrSXp+s968jhnR57xukd2KDHT2Ynk
	k0HyQhg0h2WcCTbik7mKCwgXPJ7doqxiEoakvF1Jf6lAALbyoVQD/ZsnIMKvO1PkFtATuXOxvee
	n9jEonyGlF9icKj3zUly74UqTW4TykBpcntVMqi1EHptqkdz/n+ZuoqUSjfgZbrRgb2ehMvIogO
	seZCKWnEA7pmmElNxs2bGto66QB4fqT2ciA4ZVB5xOv7hI8kn1235zPDvIVsbbjWbfy3z8Tbhvi
	/eQq48+e3zE6tLVNpze2SKzvfpPSBaSr9f9CrAZTUkX7GRsp8YZncqYoxbI4CH1gWS0X0sWy4a+
	UJAh4Gmqk5mVg08keZN9TNV+UKbigYg==
X-Google-Smtp-Source: AGHT+IHlRgFSQA5uuSHMeGhsfwbPFm63bB0A1m3Zb5IbIU0lFNk5InMgcrcqFUNR30HKIJT0f2f5IA==
X-Received: by 2002:a05:6214:f6a:b0:6e8:f88f:b96b with SMTP id 6a1803df08f44-6f2c450aab7mr123047676d6.9.1745113755276;
        Sat, 19 Apr 2025 18:49:15 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1283sm27583846d6.23.2025.04.19.18.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 18:49:15 -0700 (PDT)
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
Subject: [PATCH v5 4/5] staging: iio: adc: ad7816: Use chip_info for device capabilities
Date: Sat, 19 Apr 2025 21:49:09 -0400
Message-ID: <20250420014910.849934-5-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420014910.849934-1-gshahrouzi@gmail.com>
References: <20250420014910.849934-1-gshahrouzi@gmail.com>
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

