Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422181;
	b=BgWQm/nlDcppBdsq7IAeSNaYYMqBG48EwRwwvfi8ha0SViJ+uBk49EcYoYmH7wrXP1W+
	 TfP2NmGC6XcXFTFxOsD8yYK6zMyWOC5DgMem64r3ZTjUHHKCJk5nUKQd8hSJ382va623D
	 +EXPNTiHIPxVrhG/XGYasDECVhIKSa2cF7G4LPE2+ZiwJGQeA49OrkmQDT1t1Sdisq5xs
	 zoSUrVSMVu2H+sYJZjWWDYCvDQc9HAwFd9CZMWiUWqrnQ+8wTS5FFtM0/mDgrupXeDw7b
	 V2XKU9XFR1cGxP9+6iZbTWc3tTp9wRCsroc2O9XeUbrX3hcvPFkmZfLoxP+eG/7uXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ggX77WU3hUpk89gP84ckJ0nyPjIYp6mZHbVSorQiSI=;
	b=r/A7PRDfLjuC3BH0PUHmD6rpOWNQMzwQBnfOsZ7al7Uxg/2QXJHDn3RHlGi9zkBYFKX5
	 lZebCKB+Z/HVzERGRZtKwzyXXR2+8H6ljRpuVVo/z1brMyz8xJLC3+Xvykltw88w2YJjJ
	 Yv/RMx2vnrdRyJ6I5PxvW4e8ctE4Za6WjhOpikuR/NRclBtj9HE2ev6MjH2QhVd81DSXU
	 But75ElhKgE6z9zWJZL0sPKq+Wy5FLfvuZ4fMKsx3wcw0z89PdBH/PYJVKw8VMaumn0ax
	 ABGAm3psjRkCNmpx04fSsjnivkaW53z975EA7dA8gPiR2jMwQhKUeKvVNmmrHBC218Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODyZcNZv;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4D607D346
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD4D607D346
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ODyZcNZv
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so4497237eec.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792422180; x=1793026980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ggX77WU3hUpk89gP84ckJ0nyPjIYp6mZHbVSorQiSI=;
        b=ODyZcNZvTL/vXsm55f10JM/G95ZxpmmLCOgB6t1PGbwFe1hMZyjBPRZlSt17AYdmsq
         XPGNPvtOCmLfgXOZRZ5ypBE+tlV8pnMg42iekMs+FiP9E+dLFgf0fwegcOb9Y714eqR6
         0K3amyxu0xge2SH8DlDvs0Gzq6Xn3jKJ4EoDFJJItZjlgXB7DVJlg5HVi97vabgcRgwQ
         Y3AzooHZS9TZYHda8gWkpNhiNXfZYYNuhwol+Mb1LZeJcPgTxX5fLvE0FU9ybgQIST1k
         y+psTcFWN+YhKrhc6mvlthNDleIs0/1Pqmn2hqws9lmA28pr3xRisBe5lO4W/3Pq8jyp
         KXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422180; x=1793026980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ggX77WU3hUpk89gP84ckJ0nyPjIYp6mZHbVSorQiSI=;
        b=PUtLVhvGmQBADFxFBgtj3WlPW5mPwo4fF+WAWvAg7TpBmVEvFo5hfwCnNfkNEbobK+
         eQtGP+0MbKp0YfDT4YDuP82DT6zXzY/EXzOArdfbj97rIHdg6tGSAch/KUGOtS9mp5iQ
         cjz9l8fA03kIPL2jnWKbjDYyD8GC+9f0o3tvIQw7Em6slPCpdxb1RKdqu8q5DE000m7q
         zalQ1P86uN6hmg25xHwUV6kOIhtKCAz90c0hc+eAh9TugQ8iv9f6VYLA4/hFQ6m2UzjV
         fLF1aAKO1AYfvUsgDpufqAQZRTnnfq+kZHi7EflBbqZ+mX3ns3xFWNn79O8bysgvufZO
         JHNA==
X-Forwarded-Encrypted: i=1; AKwUvBxlV5OKyCvL0FLCb3tVK5w0p9HGDQWASKu8F4g0eK1gOennJBpxcjZ9UHOqnN8qcYrDEdG4ZYRtSTAAHR5s@lists.linux.dev
X-Gm-Message-State: AFq9FYIPIVt2p7ur3odjnPeghJ7C48WVyTTRCKV00A37Unn2fX0K6JP+
	jINejFOP5K1RIofO+lYz7by/h58BfCglbeofXDJxY7ZFhnPKwtwFJdJ+
X-Gm-Gg: AYBFou1U4S5rioVy9bl9ZA9twKSXa58aHFg/BefAV99MRw1pwO20OfdaMkMIm5ClzPr
	bM+NZQtrbdLB24C9B/dnwXxSYbfSvKGebOQLbF7KNnWFJqLeVPxdEc51CPEmF9+zUfMfJfQQrqX
	m0jG5nut+Dw8OpCyZQgNkTVirJYaPQawuBghoGWm8pD9EX8LYxwrR85GDGOWb9FpXm0Nvky2Ot4
	4OtveR36RWo+TaAEa7GZJrVag8Zhknz1MyUxGaBiFirN/cmcht+LqOSg/qBHLcu7CUX5FBxn35+
	H94N5vH3A0KRxRcyj63KtGFMtDhKKL/nC1LbTA7XhuU2rWkM67/SKDMNhTOXFnWirGhB+jaGpM1
	NASBSYvOhHrjbg2aH4xue+WEOVOaveJcrJZsR4iEFUu+1BIw+GuSviJ2nTm8QgPadv+aL85nS6/
	7GPoWAYQsxDoQagv2f3sQ0XOb0LiIclhtS3eo3tRSftWX7yMH2H7ixSnucAVBXNCwod6avrTo+M
	XrEewrLusU5mEN0We6bug==
X-Received: by 2002:a05:7301:6497:b0:35e:5f8f:9665 with SMTP id 5a478bee46e88-361a254373dmr12519563eec.29.1792422179073;
        Mon, 19 Oct 2026 08:02:59 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.90.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm41480843eec.20.2026.10.19.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:02:58 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH v2] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Mon, 19 Oct 2026 15:02:48 +0000
Message-ID: <20261019150248.416-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard(mutex) to automatically manage the state lock in
ad5933_show(). This simplifies the function by allowing direct returns
from each switch case, eliminating the mutable return variables and
manual mutex_unlock() calls.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
Changes in v2:
 - Extract range index into local variable 'ridx' to prevent static
   analysis warnings (Andy Shevchenko)
 - Keep short return sysfs_emit() call on a single line (Andy Shevchenko)
 - Split AD5933_OUT_RANGE_AVAIL arguments logically across lines (Andy Shevchenko)
 - Remove redundant parentheses in AD5933_IN_PGA_GAIN ternary (Andy Shevchenko)

 .../staging/iio/impedance-analyzer/ad5933.c   | 38 ++++++++-----------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 798e62bae2..7c3af47e0c 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -333,39 +334,30 @@ static ssize_t ad5933_show(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad5933_state *st = iio_priv(indio_dev);
 	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
-	int ret = 0, len = 0;
+	unsigned int ridx;
+
+	guard(mutex)(&st->lock);
 
-	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sysfs_emit(buf, "%u\n",
-				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
-		break;
+		ridx = (st->ctrl_hb >> 1) & 0x03;
+		return sysfs_emit(buf, "%u\n", st->range_avail[ridx]);
 	case AD5933_OUT_RANGE_AVAIL:
-		len = sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
-				 st->range_avail[3], st->range_avail[2],
-				 st->range_avail[1]);
-		break;
+		return sysfs_emit(buf, "%u %u %u %u\n",
+				  st->range_avail[0], st->range_avail[3],
+				  st->range_avail[2], st->range_avail[1]);
 	case AD5933_OUT_SETTLING_CYCLES:
-		len = sysfs_emit(buf, "%d\n", st->settling_cycles);
-		break;
+		return sysfs_emit(buf, "%d\n", st->settling_cycles);
 	case AD5933_IN_PGA_GAIN:
-		len = sysfs_emit(buf, "%s\n",
-				 (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
-				 "1" : "0.2");
-		break;
+		return sysfs_emit(buf, "%s\n",
+				  st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1 ? "1" : "0.2");
 	case AD5933_IN_PGA_GAIN_AVAIL:
-		len = sysfs_emit(buf, "1 0.2\n");
-		break;
+		return sysfs_emit(buf, "1 0.2\n");
 	case AD5933_FREQ_POINTS:
-		len = sysfs_emit(buf, "%d\n", st->freq_points);
-		break;
+		return sysfs_emit(buf, "%d\n", st->freq_points);
 	default:
-		ret = -EINVAL;
+		return -EINVAL;
 	}
-
-	mutex_unlock(&st->lock);
-	return ret ? ret : len;
 }
 
 static ssize_t ad5933_store(struct device *dev,
-- 
2.53.0

