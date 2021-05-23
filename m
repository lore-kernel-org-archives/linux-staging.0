Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4B470
	for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 17:45:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id g7so17038961edm.4
        for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfkC1uoHsvXviOGr7sUFuZ43nsQ29t7jlxfCG6pCO6M=;
        b=iqW4Lp7tzy9DYECYdus8Weyzx2+cCadoFDigFaqPLObtdNV1hRgbsnCl8he3z0OiX3
         WQXIhHljGMXwOa1+fH3OhYC4oON7TnJAfH4hA9SmG6Jgzz2r7914dZE0l6QIvbRUStVL
         xx2PUSun3B5wYe1VFx5aD1lg7bl9xxvBI4ZU/93wZUEEwJ71Yyw26gsSJoGrmEyDi5xx
         8ZlhPqkLR9Pl86Ph8oqKoVeQ+8uR5mUp4r7iUz6YPJQxFEG+ZboPPc/dBHo+YIv7Kl4J
         BvipRrCQAXeF8FNy8+vydu9ZyGUtEQl2R4k5y1squELJ7OKgFJpdt1WkujSN5yWh3P1N
         6LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfkC1uoHsvXviOGr7sUFuZ43nsQ29t7jlxfCG6pCO6M=;
        b=axSGi1IseqvyxHqU427viXS8+88vITLSz4HP1XiHykBP7ib4gEI1XZkkW2t8mqE3qk
         AsKsWahFl3MF9RPmoHynxA7UVIdjArg0Qb1F7E1EaNOUXXGncekdtUD3phsq6dojBptu
         tLK0U/0AVfL2TDTzjL/b9oz/78UYZrDuQxHC5vL7bh+Htl6pDr8uJIMzwlQZjspq38TU
         cZWmXfzJhvGbTL4ZWNia3AjHRQ3sPXuZfqD/HUYb2Hsjl3IrK7XfKiAYak0foVfkRiAT
         9tyo7vypf3IkTIhbTVq3MQ7ESUcSSrf98a78IB0JlUb83T0DgmVkdBq8NQ+rEOB23BgU
         7Vpw==
X-Gm-Message-State: AOAM531MeKMHtKtN6pPvrt3pGWmAjuhxxHj3XGUNghzXLTRnyNySITtI
	P7G3YfCmFF+jQrTh2TQOJd8=
X-Google-Smtp-Source: ABdhPJyHl2WTCgNJsQgxc4Gxs3dOOWqgdfxZvzEEywpggTuLBWtg2KHVdWhdrhTmqLkXhyyomRERbw==
X-Received: by 2002:a05:6402:30a2:: with SMTP id df2mr21207995edb.176.1621791951055;
        Sun, 23 May 2021 10:45:51 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id md21sm6817627ejb.110.2021.05.23.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 10:45:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Remove set but unused variables
Date: Sun, 23 May 2021 19:45:47 +0200
Message-Id: <20210523174547.20646-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variables. Issue detected by GCC running with
the warning option -Wunused-but-set-variable. Removed the storage of
the values returned but left the reads because it is possible
that removing them can prevent the hardware from working properly.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 518d5354bda4..adfdc4f14b08 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2706,9 +2706,6 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	bool bBtCtrlAggBufSize = false;
 	u8 aggBufSize = 5;
 
-	u8 u1Tmpa, u1Tmpb;
-	u32 u4Tmp;
-
 	if (pBtCoexist->bManualControl || pBtCoexist->bStopCoexDm)
 		return;
 
@@ -2716,9 +2713,9 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 		pCoexSta->bWiFiIsHighPriTask = true;
 
 		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
-		u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
-		u1Tmpa = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
-		u1Tmpb = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
+		pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
+		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
+		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
 	} else {
 		pCoexSta->bWiFiIsHighPriTask = false;
 
-- 
2.31.1

