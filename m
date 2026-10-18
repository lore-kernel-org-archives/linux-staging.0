Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7A43B4BC
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353701; cv=none; b=ka2ERfP2WnUq54u/BZ1nqCUlVW+txojdTueb3Yjhg40P2wvYW+19asyQ0vrkLUduD3JnyBS/FJHV5aG8EzZN+9fLIwTS5Jg3gnzMI3knOeLoM2WKf+TDwNPjSnq5//mwAt9JgU8FzCMR7RhohuZkOTKTjQz4s6e5fiG+mOhqqV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353701; c=relaxed/simple;
	bh=Hx2Qj+l8OFcg63fIdID0ARo7fsSvD3MoqrRN8F5jdQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyVpfzkIHwEhP48eubvlUZPDVgKaiiOZdZzHRqW0Di2yo54TD4MwTYbAqehBXWopfPUPwVYemJASDmz5nONSpSX9UiIKc6S6CWwTmad3BX4yiWKJ1XE6iM2/zNzxgI4YUNkglhHyE/uyXythzL2fPZKQWeP0UlUC3xv/VNmOSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLugPl65; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLugPl65"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so3685975eec.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 13:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792353699; x=1792958499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=78g9KK4RW/XUg9Q6d51RdojUrkDXmguxkjVsTLKd+rM=;
        b=hLugPl654QHqwrwiU9P9hiJtTCzQb2mIkJSDjSsjzff/PSiEXFEJofFYerHTwYCfkC
         oSPZwCkDV924bebIkEv01g9RtgjgaHTMgUnX9d/w/j/CX2DXe58+jY6NN8O9AIUYCyil
         DfXnJwM40WMLhv3D6n4iBHBx5kDdB2x1hF82sQ2O59i1vuHoBrMRZSHWIS1+ZdgkVmv3
         /gJrWbtIqnCYdIr8jNwFF/7FA+uzUHzrk2W+LlEt10oi9nJ8dEEHMYDPDZ3jIOqW7ADq
         mE/HlDD5tfpcnpS0PNika43U+LltD7swy71cELSsrQOLkPfpbMGZVojM4kzEzqop5ak3
         S2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792353699; x=1792958499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78g9KK4RW/XUg9Q6d51RdojUrkDXmguxkjVsTLKd+rM=;
        b=vseyinw+Lr5rcmACNUNL7Uud/TMPaMfc2t8kZkM382VqF+MlYITbaTpbpDiZapMkXc
         MAQkbKT6AAnRkougTd2uC0BcHRE9kJ+WI3cfm5YRcxeCnl2wNVgVTaqXhBLOVDBNmgPC
         LmfnmpkYjgU1t++G8vC9vOdDyV0JsBzl+DK+7LWVsk83UYuH2Z9I20MzWaRLatq+Ecw3
         JAJr/y0EXo7TfUW9BfRyPEsZQ7SJ+HBLMZg0Qgqxcz8kx/0Pq1ae4HOXwoTo1R3EpOln
         MQWQEiHptpt9VaLCHTR55SuQxvojjZAMFL02nv4ARRS9CS9Ta6yCfxYhtq/b+fRkKoqO
         412g==
X-Forwarded-Encrypted: i=1; AKwUvByEx7aQhnrqY0jcp3l7pCLhZo+tPZPYjZLfh6gq9sIT+hwnKMEr7Ra0cl+53JXr/oQlXD3svSzP49JzQLao@lists.linux.dev
X-Gm-Message-State: AFq9FYJkMYEYLATEvoQrd1NmvdGRTGn1PamZn0kKriDSYJ5VuXglT37K
	kzpkhlckF4oKtoMRRjKI9tqZvvDZaRaZ43TNnkjkXanLNLT5JYHms5lf
X-Gm-Gg: AYBFou29YRWkGmuHCGGzcfUwyfwVG1Mc18ftwuK2ojp/DtTpYxf/59NmQVAm000Cf4x
	YdaRAwfQLKTIIrjY2H0biTzj6uU23kmXUXSBk59trflfeuh8K9MD7tR2BKYRyvGMAuEuD6bpRL5
	hKZjfhgGou0cGtOaHfh2u5fbp7hsLFHIu8/sEf/vnjDdEnalM/okLIaSPSbcDBcnhfAWqSzQUAJ
	+C1Qm9MZ4l4ruA5FtNUoNW13OdWhCd8EQ6Hs6XBgyPCSU2geBLF/XiJ9tCEgIp9KPezYzB5yO4O
	rxXXIBw4/czMAzH+qGeGV+yZYiDKemAxrCIwKi3oQWcMvnDoxpZqQc83iPTCCOFDrzEtUIIWvl1
	p2AA61XCd/jY6/am1Nxoy+Sl3E9joQxxautojnQp+qPKFBsP8lGTfeuVGYfdpAC5wGwq3jSnkFV
	5fIkdoMOI1R6jxo5G3u/QA1o/qvzX/RQosQmAEd0adgn01YMl0mz/jJmWDHQTNlNAyR6u12kUgs
	JVyv7bshZqYqd2eNmYye78=
X-Received: by 2002:a05:7300:d588:b0:360:58a9:2704 with SMTP id 5a478bee46e88-361a1471311mr9142824eec.6.1792353699112;
        Sun, 18 Oct 2026 13:01:39 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.94.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm24693980eec.22.2026.10.18.13.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:01:38 -0700 (PDT)
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
Subject: [PATCH] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Sun, 18 Oct 2026 20:01:27 +0000
Message-ID: <20261018200128.642-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard(mutex) to automatically manage the state lock in
ad5933_show(). This simplifies the function by allowing direct returns
from each switch case, eliminating the mutable return variables and
manual mutex_unlock() calls.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 .../staging/iio/impedance-analyzer/ad5933.c   | 38 ++++++++-----------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 798e62bae2..024c6b5a06 100644
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
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
+
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
-		len = sysfs_emit(buf, "%u\n",
-				 st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
-		break;
+		return sysfs_emit(buf, "%u\n",
+				  st->range_avail[(st->ctrl_hb >> 1) & 0x3]);
 	case AD5933_OUT_RANGE_AVAIL:
-		len = sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
-				 st->range_avail[3], st->range_avail[2],
-				 st->range_avail[1]);
-		break;
+		return sysfs_emit(buf, "%u %u %u %u\n", st->range_avail[0],
+				  st->range_avail[3], st->range_avail[2],
+				  st->range_avail[1]);
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
+				  (st->ctrl_hb & AD5933_CTRL_PGA_GAIN_1) ?
+				  "1" : "0.2");
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

