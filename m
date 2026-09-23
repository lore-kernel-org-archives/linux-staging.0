Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF935E1BD
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 01:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127365; cv=none; b=AoMOVlo6JUDbq1XiLJChGJFG4a6U0Yg8zE4+YQyp7mUtby15faYPBs+p+45pYMUo8WWesRwskpoVB6GXVmulS6CYfjZ2ZaSfozTWj/DAyeITu3rvYNm7NtzunNQ8dgiTL84w1klpR4dyvPXYdSIs46/aX0hpJwmmm2cZYUypz0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127365; c=relaxed/simple;
	bh=cdAjBeMlNMT+7+wm8ZCCKENLpx7+MxggMRqCiLWJKz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFdkbFtd1oyyxrfDIigV+XcM6hCdF5dLH61xokwqtQyDcqpfpyMiq7VCszFomjej0GN8VYqvUgSe7flZ4hr3BPRTsVY/GflvIPR2B8EsRtbYR/Y6Cfvz1bezWac32yyscELaLBbsblyKTnzO12DFnIzMVrf1NMSaq/7dc4uy+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAXBs2Dz; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAXBs2Dz"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so333672a12.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 18:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127364; x=1790732164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00Mu3E316L50R7aKcX+ERjAkcdHIZ0M1oyJeJ9Yl1So=;
        b=HAXBs2DzTLSWzzgaeiF5H0jTSoHEAuPG2Y/kay/bacKgHJ6BN3A0UhRwU7xE7xRpdC
         t8GKgkjTXAgvrtzO7weRG9Ro4CouQQxnscpJCodnvWUw4bHK2FyOCgnGbsaCcvW6CE3W
         kwq/ACxrQz5tjS8G4EWiNxGbYL7iBMDeNpsBdLYLNVYGv5qpz1AgJIdwlVVYGqRFg6uK
         L0RTdDTcCO4YNypDmTmzRTQN/RolEXPjmLxLW6BT3ow9RWNpib0mxY4fdp0XL0qRZILp
         6a8UKKuZF27Twv4wIIJ7rGQ6QKfU9IKgwIbLlsI56TKU/TiND+6Dp1YjKGttWTwwamEM
         ddkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127364; x=1790732164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00Mu3E316L50R7aKcX+ERjAkcdHIZ0M1oyJeJ9Yl1So=;
        b=WTY7+yoCtzigidgc4UJuJLApJwNgDAkFo+pSkgXakMHFNzY9Btxtn5jddSJCW4MRs/
         cU1Lc+R1CQj2Ug+lTGhSj0QfBv1EPNFn0Ayh3rHQUkK1lGFOwRLrz6L49O39TKva+fzi
         uTSQjYPw5+rCpN8RK9ePARpfTmmWtcDSQCO3pEy7q0xNmJ5wNh69udFSEJt5PTDLbsjJ
         90vRlt5BdAlmH+NwliVVzudOMn4wZDCT+S1Xop+so2oCAAb3fgai/M65SohbDeoxgSyx
         aDiAPuhuZAqoVgGFL9rmsqoJep/b6/1gocJalCJtuA97f5FMmxN7hd69dK+qgX1G4Caw
         q6vA==
X-Gm-Message-State: AFuF++nFVhXW1cBbSuOqO5lsxRSs4t6IW7U6T/dUVXt76kAHcb8AcJ/i
	j+LQqgtaP8Y2O6Fv4KoSrXFTCm0ARfD2jZkSvOa6oF8s//udzhO+ZNugb/kZ1DxGlbc=
X-Gm-Gg: AYBFou0sa4/Mj60P9RHNsCkHru7I8DZR8MvBvdGL0OOPIls8kBp8FjM/9nz9wiXe2DN
	dlZGouUVqZrpt5K6S5/DqPDno/qZgRHjyqN2Lps1oXtESPwJw2BTQ+mUW7bA7X6ddgMOp31XoFM
	Sv4SCv1afd7X3s644cNcmPNLWO7KyEixfd8+rKieHd8a7/DRZb7P2HtNUySdIpt+BlDGIz/dsKw
	zBxNsrq/YpO0PlZOWZClcw8eV+CkYvrctMeNV/I2MugSqS4gZXkHgmovxaLrHb04VR2Rc53YxBB
	DFpYz1FytOvnK5zY+iCOnlICrH/zCFGIXAXAoRLGwseammM4MPh1ZXqitsIs4DJnSY0G5NSblzJ
	d291E8P4EaJ7q3VbUp2PEDrDDT5GReTVJqlypCQ7b1M1/hrD/xTZqkQ/3I6JGfXp7qfjA/nvE92
	BZr/W+0F3TlE6wIVxvWqaTgsdvJfU+VsdTv6t91R6TTesdYZEIKETe2+qytCS0oJ5y
X-Received: by 2002:a05:6a20:7faa:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3ddf7e93850mr1125740637.2.1790127363814;
        Tue, 22 Sep 2026 18:36:03 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm487569b3a.6.2026.09.22.18.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:36:03 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unused variable 'tmp' in sw_i2c_wait
Date: Wed, 23 Sep 2026 03:35:26 +0200
Message-ID: <20260923013526.12225-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'tmp' in sw_i2c_wait() is written but never read outside
the loop, triggering a set-but-not-used warning with W=1. The loop
itself is a fixed-count busy-wait with no side effects; remove the
unused variable and keep the empty loop body.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00ec4c..55623ad35be2 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -92,12 +92,10 @@ static void sw_i2c_wait(void)
      * it's more reliable than counter loop ..
      * write 0x61 to 0x3ce and read from 0x3cf
      */
-	int i, tmp;
+	int i;
 
-	for (i = 0; i < 600; i++) {
-		tmp = i;
-		tmp += i;
-	}
+	for (i = 0; i < 600; i++)
+		;
 }
 
 /*
-- 
2.55.0

