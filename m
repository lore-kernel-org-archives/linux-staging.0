Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F3307AE3
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528465; cv=none; b=N7l6WPV/N81XkGXzCERfxNzM3wg/wsQ560LYvb+mVPV/v1roo8QqZwUZjbSbJHQBcsFBb42ElgeaQ95nq3OYx+/VTdhn77fpyiZsAkeRCSCWCM2/zqPYfJF4e17of6jKAyeSSN+fp3J5f1N4XHeKsWH3wFPuVkZG19jNjSTsh54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528465; c=relaxed/simple;
	bh=aFDX34ybk/Kqa5bE8bFWwCkyvn6Pr2LS21JJKYV7n2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe3bI016xSlY94vM9lB9Iy/lCBUL5TLBVXoBb2aeIlBi+ok79a0ggqFknay3k1wSxvv730oNnzwqw0Pxyj/gABDzfN7GrsnLc1s2Yw1X4MJ04G2q9p/fhRlIB7JEOe0pQdoS/8Y/WmSy1J7nnt7aaLChHqXmRLEHpvluo3LpT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvdYGu/G; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvdYGu/G"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43246af170aso3452866f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 07:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769528462; x=1770133262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxdGKRED/GezH50A93RC3QHz4tAJqHqw5Wvg3bxqlKY=;
        b=BvdYGu/Gu+/1coJYeMUpTSSjep1IUkzVucFjLs1c2A4yVxTC5GgmLOvTnDwlh0b/SP
         gTavINPyKus+OLbHsVxhvbL9v5aPMRqLWKW3qfUmFs9VPG6dQJBHOjksZibnR6t4b0R7
         B2NOLg9xiOH8xDIZMA1SEsmv3X8vjkqUZJTn4YkGSR0z1yyvIA0qfGNv/Z9k6lwjdJGn
         MXyNfp7dtD4ajVllASm7vcylrrKNZ7JVNbgt2WOFSmyAOJr0AcN5pFGaq4O1C47qh0th
         dwQX9865EeUVIrB91YXtDXqtDZP7Uw6RlYXf8P9NNY8rZVlqKEmyh5lWyQahDUoOBrJy
         mD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528462; x=1770133262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxdGKRED/GezH50A93RC3QHz4tAJqHqw5Wvg3bxqlKY=;
        b=P9yMJ4+ATkVb1spLqdJAAFgx8L3cE5POyzsHovNcTUYtguQ1wFz8jpfcS8FLefi9Yy
         uFbzaMPmD7Zt/y8mD5mOkl04DrbasHWZ2eYAglkP2kzJrIXow3noRTmvBkw+cM2DzWwf
         QWasfXFeBh9Ut4thqGjqCScUN+kwvtSJ34ZhM+GZ6M3Yb5pPt75vWLZpLk9eTRpf7XLr
         Hxqc5HA9SqiCaEOyJdWi2Gq64rOnJKT4zO59rwL3GI2IiGCQt70+mBm8lYGH0keKNOuP
         0RDB1Wuy+tF6KZontKWtNtybiPtL4wDp+zhnnhQ+vd6YfRGoNfTN6TyPwzCUYRMWF5yU
         QbGg==
X-Forwarded-Encrypted: i=1; AJvYcCX5zGtZsHZnUBj8oRDsZ3boBABcRCJO5h1ME/J0jWe9ZdfsFp2RURL9O2BHAxvPB66deqDvU/0yE42CHuyu@lists.linux.dev
X-Gm-Message-State: AOJu0YyXTNgrZWc632yMxVxPY2HKsDBNEuO4oWwdH7c6BXF3g3A9mUm7
	s9WlQUB8aPLYXnCeSLwxrg2wcrC9bRVD31z+qSpJ1snt7YXTHgDPDxh6
X-Gm-Gg: AZuq6aIMZZd+sNOgXkOtZj+JoWAlMq+8H+x7gUczbFTC/ztaVRZjiiJ4QRm8qwSIfA7
	+QccsHtSvtGtaUbHhTjzAkb1YRa7VSC5eVJkS28voQ0nyyji+TYWJwRcCj96i2HP599KSnijydz
	W+ybfRfddOvS3wQGM3TuA7OEcvYS0F6sQOzdPe7OiA2xcGAQTL2wUlOh86OxTF6euSqhVFUmHHb
	/wB+n0GxqOOgrtbq1FJPUSYPGaQIgGevojY3akeR4rtheBwjWnqGcVFGXnrWEsHqsFc204Ccxdz
	iDMh5hEE9HMj8LBMlEAy9w+nVCPPf5kPHQQb/tEQxzV2lk6WdF2BPVfxqQBVDAppz8LUDh/13Ro
	xvyOfWgI2IQS6hgXhf7RXEGN9S4SoKEjOSXkkOX+070mgm7hyBUF3zW7Ukfvxsdu5jp+y0QmVS0
	1KdZLEkJECCgfgUBlLiNk=
X-Received: by 2002:a05:6000:1acc:b0:435:9538:939b with SMTP id ffacd0b85a97d-435dd0bdf07mr3190440f8f.8.1769528461541;
        Tue, 27 Jan 2026 07:41:01 -0800 (PST)
Received: from Madhu.broadband ([83.106.123.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c0179bsm38451602f8f.1.2026.01.27.07.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:41:01 -0800 (PST)
From: Madhumitha Sundar <madhuananda18@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhumitha Sundar <madhuananda18@gmail.com>
Subject: [PATCH v2] staging: sm750fb: replace magic number with jiffies timeout
Date: Tue, 27 Jan 2026 15:40:56 +0000
Message-ID: <20260127154056.74855-1-madhuananda18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware wait loop in hw_sm750_de_wait used a hardcoded loop
counter (0x10000000), which depends on CPU speed and is unreliable.

Replace the loop counter with a jiffies-based timeout (1 second)
using time_before(). This ensures consistent delays across architectures.

Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
---
Changes in v2:
 - Switched from loop counter to jiffies + cpu_relax() as requested by Greg KH.
---
 drivers/staging/sm750fb/sm750_hw.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..b24d27a77 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -523,19 +523,32 @@ int hw_sm750le_de_wait(void)
 
 int hw_sm750_de_wait(void)
 {
-	int i = 0x10000000;
+	/* Wait for 1 second (HZ) */
+	unsigned long timeout = jiffies + HZ;
 	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
 			    SYSTEM_CTRL_DE_FIFO_EMPTY |
 			    SYSTEM_CTRL_DE_MEM_FIFO_EMPTY;
+	unsigned int val;
 
-	while (i--) {
-		unsigned int val = peek32(SYSTEM_CTRL);
+	/* Run while Current Time is BEFORE the Deadline */
+	while (time_before(jiffies, timeout)) {
+		val = peek32(SYSTEM_CTRL);
 
+		/* If Not Busy (0) AND Buffers Empty (1), we are good */
 		if ((val & mask) ==
 		    (SYSTEM_CTRL_DE_FIFO_EMPTY | SYSTEM_CTRL_DE_MEM_FIFO_EMPTY))
 			return 0;
+
+		/* Polite pause to save power */
+		cpu_relax();
 	}
-	/* timeout error */
+
+	/* Final check in case we succeeded at the last millisecond */
+	val = peek32(SYSTEM_CTRL);
+	if ((val & mask) ==
+	    (SYSTEM_CTRL_DE_FIFO_EMPTY | SYSTEM_CTRL_DE_MEM_FIFO_EMPTY))
+		return 0;
+
 	return -1;
 }
 
-- 
2.43.0

