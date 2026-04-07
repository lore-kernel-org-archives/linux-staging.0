Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772D33A3803
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548113; cv=none; b=aCEi5jBIsC1aK6SGeCzNbDhNR5b6MfdbKtjQtmzt2TyvePgDdy6opAM7PxHUZGnHJ7P1/GTdCvk1vfAN3xc9eIYmlem1XcbddRI5vvD+A5DjG11R/haWRG26z8xbnDzc2c536JjcMr87F+LQbZbXi11IgZfmGiBZhFgaV0vFcuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548113; c=relaxed/simple;
	bh=LaVf6I0Z4sCpUNfHj+Kfa+v3TghHjud/ieOByvrHuKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVyozU/rg72NAyBaGT4vBwB8tjZskarL3nLq0p0Bqa+rQo/NhmULIuceBCLHQN9IYugUpqfi4SlBJKoyJC2+sblWTlU5d/cQhZXB3H7M1RYM4KdxCsL8CtdD62s7fc6Jn0bK6NYCo2/PApBFd1flBFdN2D6I2VgwvB1R7CxqE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZireVrNX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZireVrNX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso3528594b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775548112; x=1776152912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mjGuRE9W84vdHsCFtU27kxqr4TOAhO6rLoevI3eA3w=;
        b=ZireVrNX0cqnVRGTF+wW416LNyUdkL3eLf3VoOd30FnIUKKUlcu2zzlCJJI1dE1qg3
         9b/zK0jdEXJOZOB4frhpQFo2Z0Lj5q1gfnq+sNuWZGCqZTjsaKUQoSu6dGMrAKBGtuXa
         fpMjLFvqRH4QOweQG5Cx3/2f1aRZPDerc8jUb3e97NANONY0C5xKkELj/8rEcyUfRJzE
         EEXT2h7Soye3Ndt/FdX/6dVmp5pQbBRfIxppyxb5inbBT5sypcrh2MnzenVK2g+Zuhm+
         mF3UCOUdMKCTueS/z5fRwsCgMj3sRt5h+dpdC/1U4JCp3t431EnPS8t4PLHM83sWxqrI
         dHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775548112; x=1776152912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mjGuRE9W84vdHsCFtU27kxqr4TOAhO6rLoevI3eA3w=;
        b=pvpZux5Hd/vrfridTCeN3jv/8dDZqHou0MeYMjPC7gOlU0z7RvRWfMc0hl3643jqKn
         NvrIFe+5LVypij2mPW1QCRaUjK06Mw0ha3slOc5aI2Ac6VJvQFeSTW9N/XqCYf4Dg0a8
         6zF8PUG2lqw0obbAe/VXIv9jTTQSK07dAtGofeufY10zhCvoM0oR9MCUnOgO/A/bWQKK
         bi2c0KUxOoam4QPpBH0i03xdVm1uUdZhdDEnESUAuuvyIc3JjpCiKMXtRTwt/02PtZe6
         5Z/qwvG3ytZdu8VrUWXdHTFYuMUn/w2BLnoLPKNRtw5IehknntM6mfXhy+yMrCG/P0jh
         wWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDdFcBBwEAqiZd/Fpd9JuzPcSYanDwPk9wkFRn3vgjg9xLNiUD4U310Y/07lSgK+bdLV3xqFIsJS4+aEGW@lists.linux.dev
X-Gm-Message-State: AOJu0YwP5fx2sywhhRypXGBWHxhAlKPC/DJ9GKFOLj9/MstGsT7baf+C
	e5jU0Pb9DPZtNIgn0rDyQ+9TQ2vnMWqGoSH0Ylb5N5166vW0JEDTGmwZ
X-Gm-Gg: AeBDieuRvv6JAIChJ+o77c1mjP7QenXcSa/aXrvZ63Ps990zmhbJy3HEmtw/+5oL6o1
	edCEXj7z4DDdKiozBrzGC/9WlkuQPwscsGzvp9skalYtLhDiADGUdmU07j1odss7SRnLJAsssFg
	PoOX2AamxcftvlU97UZSMbGE/B0R8BDGdYFJ84QshMfM+bX5tx7Sr/5mEcw+WrAkRrpMTG/yUDt
	98ejc+2LnQG6aLLqnJeA5z8RVFCI5oTpiPdM7cdTx0aaQ0MGoyLpEsTAHZJbXf2ZOo9blrCRDg/
	daRsuceexteoPNdSiY03nYeWHx/BNzxVmaEHGzQscxnllPPTqsUhuxRXkRFWWGVtHbzGa1pO4FB
	aXdPhCe5RuU8bQMrrE0/OiAr3gzLZXo0l2azs1lcGVm7l6kXs2jje7UUuq+aBSfD76tDGC9FF29
	6xsbItDrEgngWXfeiY+2MrDLLLzWH3sgWrbW4EXSAQE3XknA==
X-Received: by 2002:a05:6a00:2393:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-82d0dba1332mr15910357b3a.46.1775548111785;
        Tue, 07 Apr 2026 00:48:31 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm22093716b3a.51.2026.04.07.00.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:48:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 2/3] staging: sm750fb: Rename init_status members to snake_case
Date: Tue,  7 Apr 2026 13:18:04 +0530
Message-ID: <20260407074805.14505-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
References: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the init_status structure members powerMode, setAllEngOff, and
resetMemory to snake_case to follow the kernel coding style.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 +++---
 drivers/staging/sm750fb/sm750.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 729c34372a1e..c30ffab8a5f3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -921,9 +921,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 49a79d0a8a2e..b683a82af349 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -39,13 +39,13 @@ enum sm750_path {
 };
 
 struct init_status {
-	ushort powerMode;
+	ushort power_mode;
 	/* below three clocks are in unit of MHZ*/
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
-	ushort resetMemory;
+	ushort set_all_eng_off;
+	ushort reset_memory;
 };
 
 struct lynx_accel {
-- 
2.53.0

