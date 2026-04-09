Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955003DE432
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746941; cv=none; b=Y65DbMtJUsBBCtl3b6/SStY3+NE2wm8WYUFcf5929fpLiz6XZ/NcAaHlHNpYgcKLjSn15TKOdDUHgSEGboJShlXi2GAFeZi6TcgMDfdWZqZLmnSMLYtNplaKly8m9xiYDvskhtScqvdmx2P9+w0Eow4uCUDrqSC8feLZdQB5zlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746941; c=relaxed/simple;
	bh=TioiTsieB6K47rtqg3bei/df2tvUdqrSUuARGufw4CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuRCb28E8dYFRBxMjEW3zcybfFAkATzzB6W+KsgzxVqHuQlx7z0LpplphE6vuE3WxY+HnDBB5W79bzt9uTN24/nfQWvwBlSThZcfJFuKU0pMsKCT//ES9KPlGIkWtqYONhPPwaj7xIhIgr/DZ+ZDwz9D6O3zl0LzyXD+T3LgdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Acvr8w9a; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Acvr8w9a"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66bf15430ecso1782996a12.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775746936; x=1776351736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OO2D65S435p/l6hJEnAV5AOSC4Rv4PPYimpN3sA5FI=;
        b=Acvr8w9a8uGHyc3VYTIjzxcfgCkISUhl41qXn1TohKPiZYchgQARoO+2+aDPjfVajV
         9HI+hxII4KQRVJY/Ko0XeMCPwheYq0Sg+yehgbsIOPLdrtdrg10MznQZZDaXeUBqOpDC
         jSzDBxvrOqkfF+Je314iJCC/CO6i7tFlgKuomfmLCZpdL88rmvZPWnZYl7i7jYh2N4sW
         I3k9zduWQNwmUtSI8KmAoVMVyBsdXhCGhPjz7JN7C9wbwHFxJNrpe4TDO4X5z05hIi3J
         O7DLbDnSuhWpQB0LSyPE9G2KDxiDS3tNtwD+qn3EHy8J2kzRNPUd4aq1i77XMyOJPLEf
         4wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746936; x=1776351736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OO2D65S435p/l6hJEnAV5AOSC4Rv4PPYimpN3sA5FI=;
        b=GUeYN3GZN9UqA96xWbx1mP0bEmQ69OVbTa8r1QnbCNmVNY9RlWQTkOBc2BC6Yo3CzG
         mbbW6FS6+GKYlICQ/+R3Znxwezy2vNgzVdj8AR2kfNP4iMsGq94RQGczNAicglNOgHl3
         i0aTrVw7q2l/a+7215hMoMyzhMXNTRfX1sHLTaGo7EsLZvuIxoHCx01lhjTrTTN5WbMM
         JWoXtbncETjgWcISruIrI8zVYPuvAUpnl488XktpiIEksPy5IvkYaufBFqin4yqjWuzk
         fBORq5WmNqYguVZlIDdTfi/OF7IDCkhuP9ZBrWseGvxPXQdn1MJ8RPXAPnUsqr1em08w
         9hgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7wRGWLPWFWlkqQ1mt34W+bhcU0M63b1714yOC1Wy0sknjLYO63llCdPLcWUlY/iTDWRRLWuR++0GHTlPZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzJmt3eHChtpyLC64eHMTmxhq2IGDUAJp2MCL9f2nU/JzJppQwb
	TL9tpOYmIPbDxCmRY7mZXfNkDOc5yCFRgg5eC6Cc6qyZ4CiUHbiaKOB2
X-Gm-Gg: AeBDievuLBLSQAlhfW5C4zPSCyw4VrIwGNJp7Pt1q9JJbSCPmmpDhZRgBL9tDKkNDOh
	SQp8DX/9H5P3TJwsGa1PrQvX1VnpEQiPKQim3sJfFnx7gSu3gTRXiY/edNbkFmABmSxM5EHHNtO
	swANRQBh+k4YzrqL8O+pwkfywU4YF6kKQ5j80kKBZ5+xze3GhbXJWgbFlm8GSn4gNL71Ql+lQec
	UWmxo2O0DGBIGOFhYWagW7AN6M+zSpZS+lprjdZRJfDARh6wpxXp8kEZS6PDl8y7ggtEsDe7nDc
	MwR+JSh5NStaQQHC5YyUfzSiVS71dnoK4CaroH+XXHpBFR3OXXnjxCOln4Df7MIRW8ygeTPYlFe
	vv7/V1bUJVrS071mjcrB3AW71PtkTdYYZrrOVUwJd5PyfW1FXOKQ8Mw75v1qaVNuVJZ6+mWSKM6
	mzJO0zPV29ff8Yd7XkW6+E6ZvYJhi61W0tgVUbgVJpZRETY2kHPxSzDV3wMbs97AMU3wsP+WpsZ
	31fwZ/hWxYqRjWslbtKE5KDQdvRbRbZ3rQmuEcPsmzLnEg80UKf8ef6CMCk0JyFy4+FM5rCbgIl
	O0vUf2ayaEiG3vwB3A4kz7WX/JnJEmDmWdp8vOs8nZJySmbjyX2FfoCZppR1ont/R7D/48y6K9P
	1I0op991Xy8vQ6k9r
X-Received: by 2002:a05:6402:43c6:b0:670:4445:c326 with SMTP id 4fb4d7f45d1cf-6704445c4b7mr1148491a12.7.1775746936105;
        Thu, 09 Apr 2026 08:02:16 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (78.182.158.34.bc.googleusercontent.com. [34.158.182.78])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033ba245sm5754662a12.20.2026.04.09.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:02:15 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] iio: frequency: ad983x: replace do_div() with div64_ul().
Date: Thu,  9 Apr 2026 15:01:57 +0000
Message-ID: <20260409150157.1300-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026040913-spherical-slacks-bc5b@gregkh>
References: <2026040913-spherical-slacks-bc5b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coccinelle reported the following in both ad983x drivers:
do_div() does a 64-by-32 division, please consider using
div64_ul instead.

Fix this by replacing do_div() with div64_ul(), which
safely handles 64-bit dividends and unsigned long
divisors across all architectures.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
 - resent email with corrected addresses

 drivers/staging/iio/frequency/ad9832.c | 3 ++-
 drivers/staging/iio/frequency/ad9834.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b..61ee93263a 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -115,7 +116,7 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout *
 				     (u64)((u64)1L << AD9832_FREQ_BITS);
-	do_div(freqreg, mclk);
+	freqreg = div64_ul(freqreg, mclk);
 	return freqreg;
 }
 
diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index d339d5e8e0..83d0e1360c 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -10,6 +10,7 @@
 #include <linux/workqueue.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/list.h>
@@ -101,7 +102,7 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
 
-	do_div(freqreg, mclk);
+	freqreg = div64_ul(freqreg, mclk);
 	return freqreg;
 }
 
-- 
2.47.3

