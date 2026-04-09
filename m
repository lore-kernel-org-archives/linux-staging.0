Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B623C7E0C
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740731; cv=none; b=CT7ZZ+2SUfBfWbLzSySJJI6BR+08cAQK2+jwX1/yMwvaK0GSXjUGT6T5myqRuzJJLR4e9XWxYr82uWwVT+X0yGiUPbOqmIjg/fxavYgAY2pg3H79zjbjk85ljldoYulsGrJ2ARWVe/SjV9cc8bQ9/KK6u1btIaAUQ9X5SzkwrWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740731; c=relaxed/simple;
	bh=49U36clM8e2e3gJFrrWjkzxZ2BnblqIUI3dhDn43VBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdHFfl9HmsO3/TMhjUhjrlfWIbgrNX5oTbIl9VUM3Shx/EEhmKq352R4bDBZwGZbXRS7kpeob0PW2gSlGZun8uDRWWKdWi/XlRzUu5xXn1k99pnryF+Iu/N3Pjy7pbYFOskZ25t84FM+zMUasW0ne2o8p2e0GgThizpU0r1DF5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVNQ3bg/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVNQ3bg/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1445963a12.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775740728; x=1776345528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3bs7q6ZU0OTgcG9cFYmFS2g5VXGrBq6p5ZmpGmndRSk=;
        b=RVNQ3bg/5ugoo1rxtkokfTTRfm2z/N0DiPHkAtPbHtE5iBf2w1rSMjdR+jLWuBJnaD
         F26D7Uft80HBLDBzwVrjm2zP95U+5oz0g7tm2/nlmOEHg5Us60SsJylE0CeTNMKOOt6U
         I4C5phFG9oTNj3de0Vr54JWAz+rGGJsxu/QwrDcKveIpqmonyIknxa8M8JnNwldsUOxI
         iEYSXayQE/FcwexD4WBYC5H7KvYpuWavIHs+lcYZCDhcTGsbebOtiz+zxeH7ufcEQfRg
         ngAJpw7WNU7xS6dXYff9nKTYFY6s3LScTmI1yvydQmP6G1wHz3opWmAfSWP9/9h900Wh
         ebIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775740728; x=1776345528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bs7q6ZU0OTgcG9cFYmFS2g5VXGrBq6p5ZmpGmndRSk=;
        b=X5ZdU2gh7n596nkeA8Cb3wvkGKkFWalHONhJTX6yRoKyAS3n2Otedj4GmRacMwhSIH
         xbtaWtbE0Hysp3yMsEpXazM0SGAfSzAP/ikW4n3M1VCJ6EOmEAZbRIFE5g9K1A4Flxsz
         xuQb4p6Esl1vmsDcsPNVK0IqQVivUsCuhu+kgMDbdq6ZOKvErzaB0lXsSdtMVgdRAlhz
         EIUTrspA6gUS16nd3yhnz9N6zsEVDlVz2X0GAjr1VaaVeAhsl5HoVBaAxZqkFc7Mce34
         b/QIzGhM5zkBKwrcZX11eSg18+YCq528B3FRb0TeQJ/Cs3bT41txeJZuUjrK7SD853A9
         E1/A==
X-Forwarded-Encrypted: i=1; AJvYcCWv6wQNyAOMi26QkjRJXtNUaaGAqwCiNeCY4TmvrKotwo8cSb/Q87klRhtCbBC1T0lTPHbHblc0wYD2biKd@lists.linux.dev
X-Gm-Message-State: AOJu0YzIwotqTIIWKrkj5vgqApelanVv/7+uKv/pymdRg5Cyd7Yb5123
	pf/6KO5D/5jKundv0NmbUctCFHBcBumeEqHs+OXAlhlNcgvEK8XlfTlj
X-Gm-Gg: AeBDiesfFLXtal7t5emBLpvq2bqySHFKFd3lMA7chzGkkfgLWnzeAR6xOn469pgzKVB
	tULn3UkCIKP5U6TCDISMH7uDKBhCDf7g5uSRgJLq6pd7/Xvck4GHja26wRmPxDgdS6oZ47BYCHr
	qbrRZBxBfZ4dn+vq1UdPjx0ZFsKNpfVd0Ad3gAU2F1d7MdIYIDNP5KigV1gmUeckt1ncysVPXSD
	OP0ozpGZt93atjjzhyP6Zj/1G66m44q7Cmi5OOSGUePon/RYx7G8pnfPd7jhsiNay2XxKl8vK5M
	fQkrOvTIRadZ95/Gpg4CiLxGNSaushslTKy/LzshcY36ahWT47yhmEvO14Ii2NKliZOCGr6/SH+
	FWH+Gct95eFtGupIBodrXz0SwNpp+nLrlx5MeKXVzHNiv/tzu7+BQXXKWeW3cdGOnzgN1IsX3hr
	iEF34Ega4Tuy0rrUF9uzBXLQiuvmOO7ERxTC92X6mgsaBBsTPhA/jXHc/+tktYpKPeUUjc78P0O
	LJF55A4ZHI3qkBwM7NlRLmBMIzexem7Jm+75aAJvVcR/QlNksLsxXdEE0B2h7l5wL+PiyDATtuI
	dudgi3MssyWoBoLvHWwlZ6mfIbop7CWSlzG7SgY4aYxErJYyAmmCsrU89MXDNSlu3tjAudwiDoE
	U7B1bl1M1Cw3zcA==
X-Received: by 2002:a05:6402:910:b0:670:3c8d:1b6b with SMTP id 4fb4d7f45d1cf-6703c8d1cd4mr943734a12.7.1775740727985;
        Thu, 09 Apr 2026 06:18:47 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (137.44.90.34.bc.googleusercontent.com. [34.90.44.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d37620sm5679424a12.2.2026.04.09.06.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:18:47 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	greghk@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nono.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH] iio: frequency: ad983x: replace do_div() with div64_ul().
Date: Thu,  9 Apr 2026 13:18:23 +0000
Message-ID: <20260409131823.1289-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

