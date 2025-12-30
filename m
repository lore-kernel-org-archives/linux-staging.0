Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B840E2749CF
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767126934; cv=none; b=OCApLEMY2iWHtIo5TvWNHxUYGAFyu8qDh/cJkrhpx/MpgAHzFnSuCzBoXlTuzihsmuPIK6e27z1Za1IdfO7LCvKq3etwlkNHx390+v7L7StNEjJtWouwJY7zCXhZDw0gJaSUBFLhxqZ+BnXM857h+HpLfEDfSNU1MGdov8U14OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767126934; c=relaxed/simple;
	bh=uLLykXd56vesJ9HtK213SAYa5HAGc3d+EtRYj3wel3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mqn6LhKZVdR7gpkTp88a9pY0lUrW+rxE888gAW4sWMqjppNJXEd+f0e6bzSyWfKdZ3HR1FJECOb1ZL2bbm1+fLnUZmHvAN5v+IF7nTzUo7zTxly32yBNWLOyPZxN0gBEvxL7lH66NvHfgFIkfL0q137xBTMd5v29WUstaGvEQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSlYUxig; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSlYUxig"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d0788adaso92477875ad.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767126931; x=1767731731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6EZZUu4o39Ojycy+6hXtm+M1PWmD2n3TmdY9kxESqw=;
        b=DSlYUxigcKBG1gflDRjtXjGAoW1PRIBWrGK0g/+9HeMXaR4KiGxHTWSvfLN/ZiPJLX
         0v15uDYXrdmuwG536ZYLZzGecCc7ZIV7M9UOuvFGml4/YSUAFnpZ7D/JTPyJ+YGiUAfH
         k6k+T1Ez+pSSx2emyQ4MrWPceR+UPJZqiek9u8fvb/BERK1JZRkHylwdFGzBO4cOij7v
         k7KxR+O580/gdE1BDsHLJ5IMTCKpG3j8YrL7uY/XHmQKSv1/pNe1uX2+wInEnzp3E/k4
         fRLOeoOmZ5OtyREYr00tGZRPh+nm4qFxdt1XoE4KOLaEqByTAjrMMPs5rGmv94Ixm9gJ
         2l4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767126931; x=1767731731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D6EZZUu4o39Ojycy+6hXtm+M1PWmD2n3TmdY9kxESqw=;
        b=Kuxr/InSIAQRlM2CeqFXDc2PKs7N3kmHhm4EDVkSb+O4vMEDp7QQYUtk+OFTz6ssJW
         mVfko4/hbI4udqbcZQCv0eZhXCLP+21CWK6rXDFJmgpeY8oD7NxeE0p980vl1K7GxGP6
         wlCxhW/eDtko+mS5UXG6SauQyfaJu6zVhMal2oM8UvKNzcQ34yqJe42L8bD/I/ZsrAkQ
         O/SY7H4Uac+sXDWdRwV3/GkgHlyUGaz4jZbjuji+oIyhXmAIoGtgNHrKIZEHEdYdDdXF
         Y6mcenx1KTgRen+CqQvcqQiu1tDGw2rUW26epG9qK2WHyHqtTY/OVtS7a2vYzl/t6rp9
         fWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWv2nEU/dgGRYrEYNaw53MhfE9Qgh3sZXIwPbYGj13HXap8QoWgLQSVeoScZGUaIaSDl/VRv1U/6d5P7QK@lists.linux.dev
X-Gm-Message-State: AOJu0YwXbLh29vENUEkpdtXnNxY6iBl8QASD9NWGV9KFpbU9PZ+CxLVd
	ygNPRfhm6v3M/gjma8VMFMMq/ZyrCZ0vbBT3Gbitirytk2gRTUfQOP9c
X-Gm-Gg: AY/fxX572xcXWmdvO+V/5CklnsSu/mTvexkUGA78N4mMDVGH10JpibKWsQSKctaZbLf
	fyx5rlNbdOpOXeBPqmAdUZXYSDKcc0j4cb9CjQ3bDrWr7pAfbPoCWsoY24/kyYxsJb7hzCXpdKb
	ljvWH9sfRN4O8jO+he427Q4A2K4kNaLnUpqN+GWGAOuezvRloJ0H/znUUjjEGGwpVR1mWRPB0Ri
	Mc10npny3xHOGKYV0Er/rqjs3pasXj9MFzt2hFIxxd9VlFE/nbjicjIzwDa2eugDmLkRCBPimEa
	BG+NEXqoS3i16hrfv7BpqBG2NN9xj3QhAJ6MYhHeVHQmeIMPzTInPaGIJhCw5jJBjQpBd0ReK95
	Y88NPSme+SLft/+0wyEG0vn3mkeoKdO7TubHv2ob7ngjHKRL2P3WLWt4of5P4MVnc38K6Uw6jrK
	e93MexS20fzzpmwIu2RcZIOImppnUNihEK+FFl3CMAeISgBkZiLomLOcXsjBnliEjs9mDhtOEBU
	uZ2kv6Z6Jtp19PRQDkaI6P6VeH2wY8OXG8L3dfweEEPKOIY1FLW9+aCxajE5OjaGpR+PsPs43E4
	HNqnxMc=
X-Google-Smtp-Source: AGHT+IF+K7pA6VCVFKzIOiSozceFllQ94quSzKO77YM3movakFJsFMOcOUPfcfwEKoSQVCgPOYQFtQ==
X-Received: by 2002:a05:7022:1e11:b0:11b:9386:8272 with SMTP id a92af1059eb24-1217231272amr33588237c88.47.1767126930864;
        Tue, 30 Dec 2025 12:35:30 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm128074981c88.9.2025.12.30.12.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:35:30 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH v2 2/6] staging: iio: ad9832: convert to guard(mutex)
Date: Tue, 30 Dec 2025 17:34:55 -0300
Message-ID: <20251230203459.28935-3-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230203459.28935-1-tomasborquez13@gmail.com>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard(mutex) for cleaner lock handling and simpler error paths.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 41 +++++++++++---------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index a5523e2210bf..35d8d51d5c2b 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -179,20 +180,20 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 
 	ret = kstrtoul(buf, 10, &val);
 	if (ret)
-		goto error_ret;
+		return ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD9832_FREQ0HM:
 	case AD9832_FREQ1HM:
 		ret = ad9832_write_frequency(st, this_attr->address, val);
-		break;
+		return ret ?: len;
 	case AD9832_PHASE0H:
 	case AD9832_PHASE1H:
 	case AD9832_PHASE2H:
 	case AD9832_PHASE3H:
 		ret = ad9832_write_phase(st, this_attr->address, val);
-		break;
+		return ret ?: len;
 	case AD9832_PINCTRL_EN:
 		st->ctrl_ss &= ~AD9832_SELSRC;
 		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
@@ -200,24 +201,20 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
 						  st->ctrl_ss);
 		ret = spi_sync(st->spi, &st->msg);
-		break;
+		return ret ?: len;
 	case AD9832_FREQ_SYM:
-		if (val == 1 || val == 0) {
-			st->ctrl_fp &= ~AD9832_FREQ;
-			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
-		} else {
-			ret = -EINVAL;
-			break;
-		}
+		if (val != 1 && val != 0)
+			return -EINVAL;
+
+		st->ctrl_fp &= ~AD9832_FREQ;
+		st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 						  st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
-		break;
+		return ret ?: len;
 	case AD9832_PHASE_SYM:
-		if (val > 3) {
-			ret = -EINVAL;
-			break;
-		}
+		if (val > 3)
+			return -EINVAL;
 
 		st->ctrl_fp &= ~AD9832_PHASE_MASK;
 		st->ctrl_fp |= FIELD_PREP(AD9832_PHASE_MASK, val);
@@ -225,7 +222,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
 						  st->ctrl_fp);
 		ret = spi_sync(st->spi, &st->msg);
-		break;
+		return ret ?: len;
 	case AD9832_OUTPUT_EN:
 		if (val)
 			st->ctrl_src &= ~(AD9832_RESET | AD9832_SLEEP | AD9832_CLR);
@@ -235,14 +232,10 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
 						  st->ctrl_src);
 		ret = spi_sync(st->spi, &st->msg);
-		break;
+		return ret ?: len;
 	default:
-		ret = -ENODEV;
+		return -ENODEV;
 	}
-	mutex_unlock(&st->lock);
-
-error_ret:
-	return ret ? ret : len;
 }
 
 /*
-- 
2.43.0

