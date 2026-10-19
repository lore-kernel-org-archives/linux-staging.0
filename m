Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E746AA9B
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386438; cv=none; b=ZlB8AaQotHZxb/3JzN59GM6xlBcxx4s/yFCmj9fp981FZQ8L5aBjei1o05xrZkWs7uy08Rnw59Kns/EfpSQ+yzF1wo2LmByyItmMxiiWJ1fXsCUOO7MLW0CeKGUA9RUXkrUcLFYP9h8CF7QEuK03503VeD2+KLdjS3KqZggQKEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386438; c=relaxed/simple;
	bh=x9wpxUyL530Iiw6P0N+3kTeiF91l97A3dxOFL5oObNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N26z2CBhXiz5MX/N5yLnt/OIDUD90F86Gm/nl/9i9bQPbu9N74Aglx2t/Bcq9DxcZuHMUBUgYHyK/c7OVqhcEcTsqIedmOW+zAdu6MmJc1fL3CZTo7mAFIdmCNfv3zDKeBSf1ykW2LuSCtKZ/ne5spnW2XZooe/mSgiuAKgtEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yo0SJP/2; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo0SJP/2"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso953663eec.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792386432; x=1792991232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fva8zL+n1OCI0oMJodhd5ulLyrv34XE8ucuw+gfKNzI=;
        b=Yo0SJP/270wYiqI9KmEx3tlQN5tEb92UfTwhtmu+naOUJfBUWM2Im94CkUtJMbquIZ
         fVUfmFnj6APx6xPIKhVCCvIIVSbarFTQuKkdrkcPrmazDj5jmm1GsSUqTBpdqf2m3Zpw
         Enj2GzN24R1aDIK1J0NUu4E4ds+7X4/yiUV99bSToHPMGBNn19J7MPTBujxgC0UiDq9B
         gikj0DxER9hRWDGLYQLvfKZSkb+ucWIERiQGIa+ebNh/nIozbVU9G2GqoxbVcG2ggyZZ
         PxkRAGVAg/DeG985jeuZHPg6qOBPfavDSPL/PyOsSwrNks7ZA4weFoEfGBsDyaySgFE/
         IhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386432; x=1792991232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fva8zL+n1OCI0oMJodhd5ulLyrv34XE8ucuw+gfKNzI=;
        b=1rmbTLzRWRM4L5npbS97MMX1gt1W4rQUHMbE8kAmDcBee1c1oe8zd4g73PqAL33f2w
         HaqRy9aTpuH7xn1NkZ+g7aklxAknVwRc4hizqIbzGpbSJLkb3xCyDuNAIhvAsZ9WRI58
         sHzqSJj/qQ0U4RInFY5uvARpiMAvBGMnLsy2cKdN+l6UwNV4gc+SiWM1Z0ZryFGsJG4J
         3KANJAljEfLIFzSvjOJXzJeeujEsiLCiH91xbkwOYpt5y+hGr8kXip9HbkxI541FVbQP
         ni8w7HvQ8tLXsZtSo1Jc9G36JxS0V3gOVGgT4Cu1EAy42yYvrXFF7JgGzyvG1n3pigO2
         vAWg==
X-Forwarded-Encrypted: i=1; AKwUvBwJOvG6LtUx81Jt0dTAUZHuyq3b4in6oFivyo1UDVotklTFn5XYbsuKld4XRB6VPeu/Jt+e33Q4o3ZgGRCm@lists.linux.dev
X-Gm-Message-State: AFq9FYIIcQAIjiz7v1aFUqExF5rG7l+a/Hy5fugw+AijUQvczzSkazh6
	HDjatZNZ2JOEsZdNLDslSC8NKigY5EfAB4S+qAGMVQI74qernbCCoURA9r2a4TRG
X-Gm-Gg: AYBFou15Kr9mJ9525elbI0gK9ujqBeCQy0z6fGwQInxeBT8vYwlWW+oHKN/Op6SVrSz
	JdhYo2NKEwnQCkvCSVUOc75dGZyqa+42tvcgkoKTEKKg3n1GoC3p0/l41X0mGTBxB69gIOR4jZa
	OZUKTTba4S84+KJwQ561KFrkzZUAzzWnG7cLbL0Jd2tZVBBLizRnmGEMcDCNKmDrq+yHqJU939G
	4j80FRfBX3JctL1+C1RI046Aoth6XlnDcF3p9/w7ZXJ1YyqdB/cq3ZGgSJ7zT19qjP77QAlfmJV
	b/7x3ho9I5C1H3lK4r+kX1mrLscoYERweAA9LEL98jHwsktaTAlER68rV5bDrasNqt7mwdoSCgO
	2Gs3si7Ts6R/0roXPFyyMjggs5ROe5WFz3Ff9KQHd6/JS5BqADhQuhpyMo6xr68YfZfi8WYvJq9
	dOYSG3vsTFo5dcvG1o4fbolxXnsijhPCdb8mPdXLREJnSZkQKkrLUP7z0tK8hHLvArT+mCHL1mC
	2n77s6IpqeiMXxqFh1xaw==
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr15503005c88.26.1792386431972;
        Sun, 18 Oct 2026 22:07:11 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.90.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm23760564c88.3.2026.10.18.22.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:07:11 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH v2] staging: iio: impedance-analyzer: ad5933: use guard(mutex) in ad5933_show()
Date: Mon, 19 Oct 2026 05:07:02 +0000
Message-ID: <20261019050702.419-1-mnithishvelan@gmail.com>
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
v2:
 - Resend using git-send-email to preserve tabs and whitespace (v1 was
   sent via Gmail web composer and had mangled whitespace).
 - No code changes.

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

