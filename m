Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94F395D8F
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 22:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773961076; cv=none; b=HWde8AwwWGSkC0CFCkkY7bHTsIDD+ee7ihM/EBHEl6r1a/AaYLvbmOw3Luua/lL4m8wOFaHg8w2kVODRTRfPBmNcgn7MWiQPeGIhLadvsrZxzwMdbGMXhw8cfoz4Ak9XWvsuPlZjec5zGe8YibKHCK5CU/96Csl2lrj15gnXGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773961076; c=relaxed/simple;
	bh=mi+nahRV3AML+TCczemZtpgfTgH6f2JB8wwFP4hJLiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bjMacqVbd1JijtcQMt5/UU9xg1jxZQbR36RuTceR/pGwquAuaobh6fjntH6bc1rMNXu2G3CSfdNoNZxHN8yFUP3RLEukVe3zzksib515fIrbGW8NMrqs0AZFzPBXYZMZqqIubhrITlrIHuE664xko88dNX5NRAqcAxNLqFX2fSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV5CFcuh; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV5CFcuh"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ffabb1dfbaso825532137.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 15:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773961074; x=1774565874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdTIk59iuLLyzn1FDvdiGEAXrgiOQ7EQ8x5uGts5rG0=;
        b=mV5CFcuhirWcWRt6PiO3vm7M8P0V/aTh2Iqi/fEbN7VjZJAiuEl0DKqLIZRUPYmxzv
         otscdmWajI2Tucd6+nl59eB/EyFusOV6Pt/1F5M5InfFQAX4VGOADyRK+NjXszdPo/Jo
         cDAHBZi2c4v8dBDt6P9kyKizCL/QC3tZVJlG0+iRZT62+QwZhC0Vd4H7Jen13oBM99dv
         oDBPrYCaY1lk+/NbVngndRhvSrOyTa3ICl2CgVUXwJxwhKVb3Qycm94xOOyzr7iYYeP4
         PzsoYCFOp1g3ixqUM2O3pO76BNEZ5VbpZH0+hp1rviVzCV9Z+gVTccWxqD5mRqKiwREQ
         63RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773961074; x=1774565874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qdTIk59iuLLyzn1FDvdiGEAXrgiOQ7EQ8x5uGts5rG0=;
        b=sCm765dV9j4fDWsFu4lYkKxMXtWzxYoR/9mEClHXQVF7njsMm7QDkPWl0IxCTLUUYq
         oE2gdocWq6WB3pjDlwv2ui5uyFmeMDGN9s4qeJfgZwHnE4I7OG23AXVOVlm8q/bvRQI4
         AOaSsCK0jcGh9/EE+XR7NJkSLtVC1K6X3XlfsgLcvT90J+913quIFrMB2GxcQfupt+kD
         So31Lh/P/80ukTRl4fBnVbpn4FUI+XESD6T8KsS4GqoO0Zib6pYvzpUkPyWt49V+jSq1
         pdCPqv/dy+ydD+0uI4Pt08q6fY+0TKbN03PKd+aITnovd3d1K/MMfiljHOrSYA9Jqfiu
         /7yg==
X-Forwarded-Encrypted: i=1; AJvYcCXmoGtbDKk74jXA8YbwOLIJZsolztTQdaWPX/NWTgooz/4+dZDGc+niJpNX+hzfOw8EGADFRartfYYlGEvT@lists.linux.dev
X-Gm-Message-State: AOJu0YxLQCdmf1FXTgmWCbyyN6NctQO+xZgMRrMxHXOxOfBpUS4UUpSo
	2qHrMkQxOdbfcV6Yuhl9iuPpY/QwekLLS2qZkNwjSq+2dUyPWKwBG6sG
X-Gm-Gg: ATEYQzy1KP6mFGGsQWi85qvp27T/yFE8wNOkI4ou+locWIab2tIpS7gLgIsDixICqvS
	SEE3SmxIlpDa3UlajNJE+FhKxIC7PWwVguXNZnMk3Awv05QSpW173r0YY4+XLAjcFjbW1cjCSON
	oSIoopvzSi0F0/GqMjDyOUJ4l5P/cH5kxx0I6Y8Df/mEn51+y94kU6/VkaIMwsov7Wuvfy38I/6
	rLf95j6fYshJ2ZoMJWJ9Ejxbyu0MGHG10tmy9ZckbrVuKnumERbUPU5d6bV0tHcrYJ1y8gAh6vw
	ZgKtCKe8BrdFs+kVWmvO6uBc8gJWPMc+xaIUU77efy71sCllSPoFqOBJAtc/aqcj5zS/XQ0oxob
	4HDEQrbMnMA0LMo36RRBtRd7i05HimRUVOyUPhs5hy/7k5Wnp6JS9RLUZ77pbpi2q4TmU+WNni2
	9d6ZwFt475Q1DVymPLmFtOiFnhlBkUTVNKSw==
X-Received: by 2002:a05:6102:5989:b0:5ff:ba2d:17ab with SMTP id ada2fe7eead31-602aead0215mr682760137.8.1773961074503;
        Thu, 19 Mar 2026 15:57:54 -0700 (PDT)
Received: from localhost.localdomain ([149.102.251.107])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136bd79c0sm204828241.6.2026.03.19.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 15:57:54 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: iio: ad9834: use sysfs_emit() in show functions
Date: Thu, 19 Mar 2026 22:57:19 +0000
Message-Id: <20260319225719.73587-4-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260319225719.73587-1-grondon@gmail.com>
References: <20260319225719.73587-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in sysfs attribute show functions.
sysfs_emit() is the preferred API for sysfs callbacks as it is aware
of the PAGE_SIZE buffer limit. No functional change.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index d339d5e8e..844e92adc 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -290,7 +290,7 @@ ssize_t ad9834_show_out0_wavetype_available(struct device *dev,
 	else
 		str = "sine triangle";
 
-	return sprintf(buf, "%s\n", str);
+	return sysfs_emit(buf, "%s\n", str);
 }
 
 static IIO_DEVICE_ATTR(out_altvoltage0_out0_wavetype_available, 0444,
@@ -310,7 +310,7 @@ ssize_t ad9834_show_out1_wavetype_available(struct device *dev,
 	else
 		str = "square";
 
-	return sprintf(buf, "%s\n", str);
+	return sysfs_emit(buf, "%s\n", str);
 }
 
 static IIO_DEVICE_ATTR(out_altvoltage0_out1_wavetype_available, 0444,
-- 
2.33.0

