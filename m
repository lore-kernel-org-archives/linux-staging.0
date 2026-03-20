Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10F371055
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045474; cv=none; b=M8y9G8KLH+8utQP3w0KKEF5R0Cpvyoi5Qk8afqIdbbzLAc88gothgBcKTa4R0A2kn2iJi/PbiGPjUv610dtDk4QDY7EKU6tGG5WnsG4ltWJX/eMAofL5FF7pMKgObGyPKMoZ5wF7eP5F42fUDee4haQErCSWP0QgzhN31lwq8io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045474; c=relaxed/simple;
	bh=DcqeRaeNTz2cvEC9STCbQYR4Z81ZFbiadjKzMth+Dvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=amy2QxLgYGiRsgx8tCPU5bDGq34YaHWY5/dY9vvyyVpeWXZLgMBgvdRNbr75begsd7u9SnAxHlelHDfio/ZvYsfZZd3tx5oK0Sac/z9ZwJ1SVnvBwst6d5hwz9WrFdin6uFsPXxbjhRoI8yq/H/+MhOPZnrvYOqETjhRaP5nNAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7sLQu7o; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7sLQu7o"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b94a19fdso996032f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774045471; x=1774650271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd4q+zZz8MsM0QKHv87+OJfyCSSecvFPAS7HdQl0+z8=;
        b=N7sLQu7oiBLHzy+XkroAVQNG3mv8A/W4OpC+nZK3yHPMToV2d+ikc1dV000/fghPfd
         sdc2IzqBYjZ89yoMh69e/tagQj4b5HM3g5USXsPB5R3kucjYLMv2Kfh7OrWNZbQCAx6A
         t6YGdVFI2tqxMRkzHd55zrfeveKWd2X+NFmFiJAgm/qm7kaeZvZiKFAesmCtNLHjcvtT
         OlX6tEs/YSRoxzSmLJhXeGmYigE0e/ta6srXMgsqElU9piJLoHX2mEg/rm4+hPboIzFz
         7jJa+SqNjZ8QQi5y1Z0DVYEw3DDHd9WwJ34L9wn+G9v2WyFjzHwM44BhF5XQZAPrfZQ0
         l8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774045471; x=1774650271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qd4q+zZz8MsM0QKHv87+OJfyCSSecvFPAS7HdQl0+z8=;
        b=cqrP0zXah7Z9oNxIjc8s3k8HXRYDHmM6eEIBS6QwX/SQXNL0HTI/RzWNzOcCk3SZ/K
         9+u6YZZjbqR0ULuCvWJKstDNAr9AcSpExXI7/brPCmdqeJNW6Ok6WPaMz+/K934mhOz1
         b3a9NuFnzz+7b/k1mVzZ2rJOZgBOi3NtGW1pxmNoevBU+46ICRaWJ0vE/wBvegAqR/4N
         cLG3qDpH5g/3JwlxT8kf2fiifDLOAhjOYQICEKuRWrVd4GxyxA2uERTPbVl8zo91SjOD
         U8XSObcUTReAvRyuqONrMxfPdLk+L5rANiygMlbzBBwW8ykH1M+k9CCzwTGXvjdQ1euu
         Fnhg==
X-Forwarded-Encrypted: i=1; AJvYcCWHqB9IXaqaYxXDDjjT1NgVZ0vsFvraaTfulqGcEW9UolbKYr8ghSHTE9U+/sdsHhMy4FrRGi1hUy097/9b@lists.linux.dev
X-Gm-Message-State: AOJu0YwQZC6uKCEu/ElSHAzeKYEyerd2QxuXLekfEDYo+ZRnfk72gJfh
	UlMOCrV9v8NHeXpIsdFbjjTOupoYLU59xJxvX4/NHCEmfCmwm32JScse
X-Gm-Gg: ATEYQzyAheti040bucSxyWiEZTD2XyCFnXFg/1XJGL5OZ3jO6lmhPvou7Bqj6O8BvDb
	UcCMGIb3NGqnVMj5/ku5ORuXI2C97pZ6r+RhL9aLpccoz8TLzYcrKrtbsGWO+TVkFlsWYXdhmnK
	B8zZZBGp5KylvviZH67pOaLFrfg5/+Ixo+ZhkfL0UjdsVTRjNk96V07es9BLFEHNxwPHNC1xMll
	FSD/K0234LVrZ7cmMhhB0Qcy5bvc7M8pA7y/L7iak8bsWShlTvQlIPkYsfFQPUage5VGjpzE2ig
	9rsrXPS+H1h5JkrareOP4hlmJD1IkchgMfATtmnOlvgOtGna5h1L6RIujqSiVGIiP6EhhJ3wMFF
	SoDoZCLGKpSHwzG7z4H62/rWTsQ4O5Ls8DaGdyRsrsXo5rNAD28qp73ANjKZSlGrhkClp3qmr6+
	qOVVJhl6nxixVjI7dpgJRBCax24Dq6+Z0ub2mOhusQiyeZSHDPD8D0QXufvw==
X-Received: by 2002:a05:6000:2c0e:b0:439:b744:c5fe with SMTP id ffacd0b85a97d-43b6427d272mr7665769f8f.52.1774045471238;
        Fri, 20 Mar 2026 15:24:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:bc11:6b0a:79ed:3d9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae016sm9290237f8f.4.2026.03.20.15.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 15:24:30 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: iio: ad5933: use sysfs_emit() in show functions
Date: Fri, 20 Mar 2026 22:24:23 +0000
Message-Id: <20260320222424.53294-3-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260320222424.53294-1-grondon@gmail.com>
References: <20260319225719.73587-1-grondon@gmail.com>
 <20260320222424.53294-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in all sysfs attribute show
functions. sysfs_emit() is the preferred API for sysfs callbacks as
it is aware of the PAGE_SIZE buffer limit.

Also remove the unnecessary (int) cast in ad5933_show_frequency()
and use the correct format specifier %llu for the unsigned long long
freqreg variable.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 .../staging/iio/impedance-analyzer/ad5933.c   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 85a422329..e5a4f8d7a 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -285,7 +285,7 @@ static ssize_t ad5933_show_frequency(struct device *dev,
 	freqreg = (u64)freqreg * (u64)(st->mclk_hz / 4);
 	do_div(freqreg, BIT(27));
 
-	return sprintf(buf, "%d\n", (int)freqreg);
+	return sysfs_emit(buf, "%llu\n", freqreg);
 }
 
 static ssize_t ad5933_store_frequency(struct device *dev,
@@ -338,27 +338,27 @@ static ssize_t ad5933_show(struct device *dev,
 	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sprintf(buf, "%u\n",
-			      st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
+		len = sysfs_emit(buf, "%u\n",
+				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
 		break;
 	case AD5933_OUT_RANGE_AVAIL:
-		len = sprintf(buf, "%u %u %u %u\n", st->range_avail[0],
-			      st->range_avail[3], st->range_avail[2],
-			      st->range_avail[1]);
+		len = sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
+				 st->range_avail[3], st->range_avail[2],
+				 st->range_avail[1]);
 		break;
 	case AD5933_OUT_SETTLING_CYCLES:
-		len = sprintf(buf, "%d\n", st->settling_cycles);
+		len = sysfs_emit(buf, "%d\n", st->settling_cycles);
 		break;
 	case AD5933_IN_PGA_GAIN:
-		len = sprintf(buf, "%s\n",
-			      (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
-			      "1" : "0.2");
+		len = sysfs_emit(buf, "%s\n",
+				 (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
+				 "1" : "0.2");
 		break;
 	case AD5933_IN_PGA_GAIN_AVAIL:
-		len = sprintf(buf, "1 0.2\n");
+		len = sysfs_emit(buf, "1 0.2\n");
 		break;
 	case AD5933_FREQ_POINTS:
-		len = sprintf(buf, "%d\n", st->freq_points);
+		len = sysfs_emit(buf, "%d\n", st->freq_points);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.33.0

