Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003317;
	b=vmbMVlcnJWPHgljbJrgvuFIO381/CxVZa2DRaGjX81GnD6js3CuVBGyaQ5GcBX56SE7P
	 PIjblgPEkD+uXzvv/zIkOqAMbdt/Hc7UQtuhFZoDyaHWKoL2Qvu/73vN4N1qeZhtkvOL+
	 fBh77nub6eBA2s/bQv5tSpSbnZIlqzVgY880kjV0gEN4vxk+EADXrzQNt3wtcYX0qCy2l
	 yzbf4jL94/ZPcpPHdXoyA85t3v8D+mcz+hz7ePZLIollQeiYc/ol+v5HALICMtgQxhThP
	 oSa/x7bJR+Z8nC9C3ZlPOlKmdlYa+x/EKoKNACYNoj9mp1oM4T4/GkLswFq+KWXxkcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EjCtGVYy8oVZbBDhEOaUUsJdWh7LVDwBlPS7EGRKlGg=;
	b=fU6mwBqCepHe4ZYXBALYOPZKGtQvRw+GFDjGvvb4LcJ6em9iS4Ct5wm7gobYVFJFOPDr
	 728fy1oiF+oHkC8vFzZg1Le1K1R7Y3sHgN/SZliMz6RP8jpGMomO1O0tdyKN6cn/ZeZEq
	 RTrv/cIyBrXtqfHv3tEgJ/G8VdbYiCH3il1nWediY1Q6iPkU1sCOhT2cKGH89u8DFqO53
	 gvxOMAY/uPQrGnJ3soNpkxzA6tXkpKVETNVd57sOZIS3oHuSolMzwdY7wWiZgEuKvRjFi
	 5aYjDo3N6nyfydprJfr6GkzZAQcpVKB+UHYUXtzqueVoLNArm6fuaaoimDsdnnO9B7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbhDIztk;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A1606A31D
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 08:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081A1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbhDIztk
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so124050eec.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003316; x=1793608116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjCtGVYy8oVZbBDhEOaUUsJdWh7LVDwBlPS7EGRKlGg=;
        b=BbhDIztkdBPp3wm4C5Ak78xv6bT9GI5dwbLL9GwfBjzrnjltp8ggk26yA0WOZcFtKX
         o4+jTrbhNkZIn1XeaN4pmOrTJcXndbgZAFB28xg67KtUjNJ2nEJQE4wk/TVU18YsZVJC
         Ot8WzpbSXcS0LJ4rrLI4rckZBYeX3ZkhI4Z0F6JjMKZwAYAkZn5ZpedFqr7kJ5spFbi/
         wW9VXeGxnTygyahqPhORzUYfXlgymbNirmMzzQ8ZFttwwPKNAZlufRl3U8/o3cUJPogN
         +7hNTKaP1/kvwO8XVpNJYfvpw+xSVvsb2BD4vkRYgcZsuE7SuKoFgKzG1x4v/YxkJhHK
         hztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003316; x=1793608116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjCtGVYy8oVZbBDhEOaUUsJdWh7LVDwBlPS7EGRKlGg=;
        b=HtUUizHNZb/HNK5CQh9SDscyfzpmb+VNCpsXNjTUpWeLycxIy7e0hc4I5rj9UOgi+V
         C8gtZp61r3YJDskBd+pL8jZrRDRcWVswlikUSztrjBhGjlx5EdG+zDngbr6ymaBKCNw5
         s96s2VGNcwATT88f/lNMB/B2Tu5U1kL73DAW91K2I5QTm4zQxiJ0nH58hho61CFhSATW
         OruZx1OVVAkdeL8UyqbmJidbptImJPdgmLU8Vp4jHAIy5AVSM4RM8iEkOLvGEAyzJRo9
         N5S97AKdZXxe+E2YjMu+Vnr+femoEPYxLjgKgY/hsbIIuvV6p406+bwa5O7XXUAZko2Z
         2m4g==
X-Forwarded-Encrypted: i=1; AKwUvBxDUDxV1fbWSqDRbwxpBuAxaaTB4u9ZxHyrhjiaUPFJGZFiJwm/IWNohGD0LbsdCLdtXywK2HUXOw0p5+Ek@lists.linux.dev
X-Gm-Message-State: AFq9FYJlTHHCtYU7VAILza3CqNCRyG3Sgt7yYJniA38RUeu0AGNAaxhD
	wi2UAjHZUb53q1LXmF6OLLHPKV3Jat3Ox3acXwxIds7jp/R6HVkqZbS+
X-Gm-Gg: AYBFou3v3iVz9Og3C5xaqVIiRSK+KUJ/uz05I6wgBlHuqu/HPdEHqBRZfAOYfX9wVsa
	Ts18CQO2EDe9JuPVnnD3dM5SEAHerzpDosavc5G1gZx8Xa+M3aPgRo5EfLjIvjZLe9LG0aJ3fvL
	QfBfdpW1a7WjFHH1F747VCK63RarhAMMipcNm33YcnyOR+V1OQ6DpIFyEePiZGfJM8J9BJaTr39
	JubWL/PV4dt2U2VGEpMdQxqy6QWEdvcfMg2hp1pncrBTpqJGuxKvEoV2CgWzE9cmaxxnFVAqBa5
	01jGPfwN8ryICL9j7TLyf+RUxTjCL6XNHQcHpEYxSqBD9mVNNIPOI4pdFLncjj+TuZX5h9KW0G1
	KJo2mZJDN21DEhL3v5JtfXERFMBmDU2YCPGLLaqGyT08P4FkTUHT5g6R2p7RO/Nl1bd+3KaYW62
	u0hwwdUJUvN/6ixoE51GoVuSY0ONcxH8X6ZbYy2X4yIwYSYzvO97RutYbcjtu9+ipQuO4gpnlI9
	pcyFSImH6B6oetH82CTyq4NjwWhlN+qJkBR1Sh9gepB53BaI/PiC2YWr/RLATDLVPI/UI7CoT+u
	BL6+
X-Received: by 2002:a05:693c:87c4:10b0:36a:43d:8ef7 with SMTP id 5a478bee46e88-36a043d9429mr1824611eec.18.1793003315844;
        Mon, 26 Oct 2026 01:28:35 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.83.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71a4sm22301819eec.8.2026.10.26.01.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:28:35 -0700 (PDT)
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
Subject: [PATCH v3] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Mon, 26 Oct 2026 08:28:28 +0000
Message-ID: <20261026082828.652-1-mnithishvelan@gmail.com>
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
Changes in v3:
 - Rename local variable 'ridx' to 'val' to avoid conflating range index
   with PGA gain bit (Jonathan Cameron).
 - Re-use 'val' in AD5933_IN_PGA_GAIN to keep sysfs_emit() simple
   (Andy Shevchenko).

Changes in v2:
 - Extract range index into local variable 'ridx' to prevent static
   analysis warnings (Andy Shevchenko).
 - Keep short return sysfs_emit() call on a single line (Andy Shevchenko).
 - Split AD5933_OUT_RANGE_AVAIL arguments logically across lines (Andy Shevchenko).
 - Remove redundant parentheses in AD5933_IN_PGA_GAIN ternary (Andy Shevchenko).
 - Resend using git-send-email to preserve tabs and whitespace.
 .../staging/iio/impedance-analyzer/ad5933.c   | 38 ++++++++-----------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 798e62bae2..c05a5f4b42 100644
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
+	unsigned int val;
+
+	guard(mutex)(&st->lock);
 
-	mutex_lock(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sysfs_emit(buf, "%u\n",
-				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
-		break;
+		val = (st->ctrl_hb >> 1) & 0x03;
+		return sysfs_emit(buf, "%u\n", st->range_avail[val]);
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
+		val = st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1;
+		return sysfs_emit(buf, "%s\n", val ? "1" : "0.2");
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

