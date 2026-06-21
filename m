Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156124336D
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 04:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017061; cv=none; b=Shg2SKW/MEtfyRCFntgSw6SVDULftHiketwdit9ZuFUhav5vig2Kjbiqa9TC8ALWfPebrdEkUg+mbhWOHZfT1SgyiR7Dj5naRcHoxOSwYD/lQ6vUqtfMrg2RPs37mVKfpZaGRzARYjwYkOrUaIXskUj09q6TjEP9hJOKeNrcfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017061; c=relaxed/simple;
	bh=7nGutUcq2VrKigcc39HyZQ+8PAOqGMQFi4USpUy1Gyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cGjGck4NYvWy+emsgEVKmuO/KKq8MSFY69KhoybAgc9AjgbHtEcofbdb2+zJHBk+lzE0jJjrVJDDeTRO3k9lNgnUkgFhaId7eLRIEXW6H3IMjajhK6bR1m0NGMemC9O17KfXhXtkb5q28+Kw6LJ3K2zJ3eQjXRMqf/I2HU27KSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0G4+lkf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0G4+lkf"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f236418so1648810b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 21:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782017059; x=1782621859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JfmyrTP4wLvqMTAPFh7dYzDX+Rx+a8MkxKB88LU4IMY=;
        b=a0G4+lkf6hociiVSsZnZQsF5jX/yod/jRHZ/N11pCOxs0w2joXd7wrZfZ3OA4Ak406
         9/FVa3XJSTF6FBA2avZRb0yXwvt3WXR/osALU+Wlo527OWxYeEjjO1SbxJG+k7/hwxOg
         hRio9En3TwPhC/Uy1SKsarn9OyjYsuyl0RYk2kbMQQKAvl4sPiOfCQe9AupoFsTOPTMy
         WX515GwI5q3rPOk2i2NS8Z3JZcTenI5bch3OMT7jNdojOeAB0Dy3X4+q2U6GHtjiqYRV
         qs1drNKsIH3H46yquU7CZSIt385KMsLKADs5LyFMWeGlQ0gaxKx5Glo5AT1WK3NZ5oMz
         cWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017059; x=1782621859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfmyrTP4wLvqMTAPFh7dYzDX+Rx+a8MkxKB88LU4IMY=;
        b=k+6QBwXN+6rtwAHCIypy+zrtwK1wVqmg023T04NkBLRo5okOMaBTgnzRszxOFY0tFp
         PnEfu1w/nR8qs2A/JGokcQMCcsT3T1fgdAYYiEFxsdxad68OI7e4w3yrsgdSysZ2q59P
         qIJKG+yQ9PZC0n7SEMWowVa+Rj++FeVinhuYT/OmxtFjDcz+JwHYm8YQp8u+E3skqbLF
         nwB90skJELmqbo4vdlR42gPLcR95FN1pdtAKA1z4iZPrOPeqE7c1J/5nTVHdRFpIX9sM
         4BRxKCpL/0HComvF0hxOuG6Ym+HR/rSfcAwhMzYuddy+g0GnMpOz9V9sgwyt2JLA3nIw
         SbuA==
X-Forwarded-Encrypted: i=1; AFNElJ8mF9dxCiyj2pQYEe3nIgmX5tFOJZRj6hVEPBM5n+9qqd5D8mCJFsEDOpC8nN28pcFLOkbZtD+ComSMlUxV@lists.linux.dev
X-Gm-Message-State: AOJu0YzkwI8T6y05t/i1y6y0Fgq4DD1GG+vhmwKNcvwsIBjqilbjx4t/
	OoZ9jxj1X5clb4HzvgWVQn9rQQGGLBBpskUWnmBWSn1SHMXzpWNXiQvS
X-Gm-Gg: AfdE7cknPnLOhaJXWd5QbEIwItIL4BigMBGfK1N79foNrXzp84F9HHd+QbvXUAaIBVf
	sQRpY0A0elRfDmwkvH5P5fKXitB1sdocM3HS2nH9w1MrQAfyXEZ9QXq3odTcugchcObjQMu6j3p
	xws1sC0a2mWxfjs4aHVjsNJQqp4pJdYFnK70hBnaz4H+X2Ru79zxY/SZPG/U7MR9l8g7fg8k4Xv
	xuBFqMyhxhkJq+LiQI3JEh4tGPCHhdLfNxIoQhLh7qlUch++icDUTr95kh0qLmFuu7jUcER8tWo
	ZrU4ddkb1cxyjs8IMsNR8bZI2OycgHLo4RBNjABpxV/Fpfk4/vT+zrTDVrO1Rrgl6BkitlOtBhH
	WI1TYJKRlyFPodIpA74kVqGyiv8bCYh4FWIcjtemm5dQL0g00YSe+cPk3TvhxXDrqC3qUAR4UBL
	gCMcN6wGybp6OHM9lNp1FJVtvXiileH5jR5SjR/uJsPvI473zqhsvLO/51/ampFFG/revMWbv0L
	DZZinlxgv9ZL5suFdKvOEebdwLi+kj+/cuvcUn2HeERM83/jN6wADM3tw==
X-Received: by 2002:a05:6a21:e098:b0:3b5:489c:7bb5 with SMTP id adf61e73a8af0-3bb34456674mr10131242637.28.1782017059185;
        Sat, 20 Jun 2026 21:44:19 -0700 (PDT)
Received: from kapoor.mahindrauniversity.edu.in ([122.184.65.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc3172827sm3545116a12.9.2026.06.20.21.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:44:18 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Sun, 21 Jun 2026 10:14:09 +0530
Message-ID: <20260621044410.57823-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: arnavk23 <kapoorarnav43@gmail.com>

checkpatch complains that a static const char * array should
probably be static const char * const.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
Signed-off-by: arnavk23 <kapoorarnav43@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..19c3da654 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.53.0

