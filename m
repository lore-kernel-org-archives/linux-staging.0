Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2328640B
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 05:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786253608; cv=none; b=dnmGwHSCe+4UDfsGQbCn0NH6qGpUPfNA0VPtiCoFci6kHPriuRmG6WKs4XQem5bdk4f9E/UKsZ5HD4rq1v/+ojVnYG2KPP1N49xsEPd4Paa1QeOA66qV/uwrR5fq2u1SBrIUv1Nov1ER1NUnkOtXf/C++I8GHLzhNthYBpLVu4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786253608; c=relaxed/simple;
	bh=hgdPB8jY0/nbgIb+GxDil7LuMbJzymt/E6nktr5HChg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y+wSP7NCaGCfOPW0XQcyUoXp29FdiYnnkJIUPDqwOg7SPBSao3TjuJa3FA20KlL0s0WWC1X06rxhS62qA4oefBBVTdtrE1hItEWlFCy3bNqTOkixGq067idwo2A1Op2reAzqN2r5yiaeGbaPR4jzCEpTLKLOuOGbBf26AB0cNOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhLzgCOF; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhLzgCOF"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2215777a12.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 22:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786253607; x=1786858407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iiw60go6Fssc+w6jEvdK+NtF+fsX/PqKIb7cNVI3nSc=;
        b=BhLzgCOFPjbI526vGcUoLjM4XXXw3gAZs1HRQeSLAAprqEJ3vW1BEuB0u9suiiJWht
         Fn+6Fr6dNIUlcWO9JKVjiE1w54Qyt09KmmdR/dEN1tvZqKD+TvJTrgo1ggMoCs42nwOH
         yMNTf2qzLSCpX1BW3pQjWH79c85IKvXTk3YriLaqcA0Cmx7L5J6iJoicFOLDp8ukCaFC
         FFwKpuJjJRijuGqH6tnbMZxYW5vj2HVXaCLK1wK37d+R3c+7iW2WbbWzQoPsCwYnyeCr
         mOd4ZRplktBzdwZ9D4Ld6uR9n6DiPKsh2QaOpyh3STeswgFfJyGRAPqVF5MAKyiRuios
         IkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786253607; x=1786858407;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iiw60go6Fssc+w6jEvdK+NtF+fsX/PqKIb7cNVI3nSc=;
        b=X/4KA1vnXoO/zipqhob2GGF30lAqESP6AIb8UY0DHGTDnZKDPy+H4LJ4/9MNOefPoz
         aQ3uQhA40ExJjbaZJjI+Qcw/jXfiarboR35dusS9U0AzTWWfS195fLXVFMgGY5XWVZGT
         XyWkF8nEg3h25N+N2XPHn7qMjVDykhuPCbFaNHYHkwKJ4UGnmcJ65C7Bjzlb5F8WM2uQ
         N0HYHaAbbbxT7ARYyveOjm6EFuwGN8X1fJiicmgQTo9tO219BJ8CUZaQMTEON08gjqBi
         TX+AN2nt7eOebvlbEiKJsWAf6Mun87eVSKLAfT3g1fgU0Lj78qhx+Mqp/IwhzoGC5yae
         NmCw==
X-Forwarded-Encrypted: i=1; AHgh+RrhkTarYFAB3trFXRaxE48aMftYC+EhQ9xguuuY4uvKROa+JI/wlsXw5RjSFOXL49wvLudZc2vLUr109Ld6@lists.linux.dev
X-Gm-Message-State: AOJu0YxYkPA/y+xLQcA1OhT0p6yN+X2kK824mxguahwVCTHBaOsA3LdE
	VGAQYHGd5ZeyrUJLNnWjctevIS04sI+AeeMHowVI/wJfD9A6vpc/MMG+
X-Gm-Gg: AR+sD13QvO1xtljNYLZnmBXgJKg4fq13QG/uFGicGU3KpuLklq3/PpEkoaz5BJ3gkWX
	C+njUeODabt0cfa4E7q0LYyhh1jokm3+kbHX9fS6gMox5ZRM0qcr9EkF4LcpHsLDjf8DeEJUEOj
	/mV4Q7wpAjR7pf11rU5o8r+Y/RamGRuU+RUTP4zE2lapI4i2vdc3Y++koPcxuLVdu1X5lmwV2nu
	tlhPt+KMkok030cbf53kMm1tk4Q/s+o7acWqcUcf6JzVC0v5dygrPIv0f4xZFCFiSkd0b/UQZsF
	gBjeQGjH5BLJSruApL4oNV/D1ONsTMcC9J+Ur1y/K83SP4cYOQQ8V4DP2lLjPJyAl7bMwh+2iDJ
	Mo0C+hFNhPfypMs6rGwCrHg20Z8zCE0RIgMMHlV5PsiRpWrgOHN4ETpnvKSrs3d8T1OG1sWoNnk
	duX4OzUC5CCqyxaNhMeK3/I0DR8XgLk9sVpxSEJwHdjBv/l8FdsYNJr2rwthU3
X-Received: by 2002:a05:6a20:7fa6:b0:3bf:ee42:192 with SMTP id adf61e73a8af0-3cbd37eeb4emr10610214637.6.1786253606859;
        Sat, 08 Aug 2026 22:33:26 -0700 (PDT)
Received: from preetish-pc.. ([36.255.86.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm44390386eec.18.2026.08.08.22.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 22:33:26 -0700 (PDT)
From: Preetish Amballi <amballip@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preetish Amballi <amballip@gmail.com>
Subject: [PATCH] staging: fbtft: Fix wrong controller name in fb_bd663474
Date: Sun,  9 Aug 2026 11:02:53 +0530
Message-ID: <20260809053253.14537-1-amballip@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The file fb_bd663474.c is a driver for the BD663474 LCD controller,
but the comment header and MODULE_DESCRIPTION incorrectly reference
'uPD161704' — a copy-paste error from fb_upd161704.c.

Fix the comment and MODULE_DESCRIPTION to say 'BD663474' instead of
'uPD161704'.

Signed-off-by: Preetish Amballi <amballip@gmail.com>
---
 drivers/staging/fbtft/fb_bd663474.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_bd663474.c b/drivers/staging/fbtft/fb_bd663474.c
index 1629c2c440a9..c34f859043ef 100644
--- a/drivers/staging/fbtft/fb_bd663474.c
+++ b/drivers/staging/fbtft/fb_bd663474.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * FB driver for the uPD161704 LCD Controller
+ * FB driver for the BD663474 LCD Controller
  *
  * Copyright (C) 2014 Seong-Woo Kim
  *
@@ -166,6 +166,6 @@ MODULE_ALIAS("platform:" DRVNAME);
 MODULE_ALIAS("spi:bd663474");
 MODULE_ALIAS("platform:bd663474");
 
-MODULE_DESCRIPTION("FB driver for the uPD161704 LCD Controller");
+MODULE_DESCRIPTION("FB driver for the BD663474 LCD Controller");
 MODULE_AUTHOR("Seong-Woo Kim");
 MODULE_LICENSE("GPL");
-- 
2.43.0

