Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA8276041
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778314061; cv=none; b=S8Rd0H9ns35uGOCezCdkzW3Vu8REpcMu/GUAAfa11569iVPx/jNbVVTc1sQIa0QLMHLaXx2ZRfGM/8IgFGgXBm7h4tPqYDONLuEjjYWQJ8e4nn2mRQuzmJUi6Q9omitTBLTrTGTyTCcQu6jeueDS0pnuaq+SuuA7nRfMfBPn22o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778314061; c=relaxed/simple;
	bh=HiSLPaFz/hPA3EjeREyQ2Wy2Vk2biUFYa8UshMupul0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YQLDG+0Ir65Y4dZjZx/Ky+ZIVpPRxjMD3M7TJnU3DpPhl506LGN3x+lRS61fuvQvHmY6VWFln8/L4uOjQbAV31m4rPhTKuPahK+zoew4jtYI34uvyA5h5ytcIIpNLu/WhzUpEBzwm//te8sIo3f8YabasnraxQTraFcgI5eVKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi7Vb0q7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi7Vb0q7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1252675b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778314059; x=1778918859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwyO1LRbYY+Gk+QpVtRmXJkPAs8P1dr2bHBA98Zj4Uc=;
        b=Vi7Vb0q7POwhLlxVqrQZ5ZOO5zDIytQ9H3o7IU83c8MlUXNOJBQUfOqwh3UTrMl/sg
         Pp8YjOJkLxUsUVEj99R1EopRpg5Z1y0FPvPtKnrloEvPH57Bf4iZEqphigdaQrnUZFV/
         nfhkAblLULymuIVMTrHxNL5KgwStfYnK1TkP2Mwxo8j80SIOssBNl7glclAA/GKw7Iuj
         pyUKGHsAumg7IzrFtXjxRutKVMCCxsbNevtPhJ151YdinYFLHRT/8oG8KlPJd6ypoMPV
         FhbHWaIPcoSIIk5iGs5QtUhfxpcw3Iw0MPm3YEL2pxx37gjEWTIgiLhi9jQJu649Be+R
         6EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778314059; x=1778918859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwyO1LRbYY+Gk+QpVtRmXJkPAs8P1dr2bHBA98Zj4Uc=;
        b=jm5GaaXPaJivGcDYxLfYgG8IMHJVTJB7iYDacwgbjNCRRDiV9aRvVdJlYt4EMcw0nS
         Ei5gZBCcANOp9wX+jrycF2QW6FMcnJgnofxhe/0HbcNLxH60SxGGFNhhFuH1cHCt9pWN
         SToYAl5Fe7gTWl7vQEUzFEeH5Ga2PN6UW7WG6SjWhLQ534/bfByyNa5NsRSQFSp8qRwQ
         4iK7Y1wqB5TyJa/fz9kS5GN00XHLrpY7R0rWLQX62CuS4GWDcBh3C5KZzpgHLkHgedsT
         cBXq+ujJzQjcLUDU12lbCeM5NB0/tWv/6N+gCfFtCNFD20rzqOp0KkXut5q+eXS7mV4t
         p7wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iD3gX3bNOH356uvf3TQC4gtOQuu2KT+c0hTbu+lXI36Gxojcqw0AlgyToPqap7Y2LBxgxSezYQBXLwuGJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyEWRh6HQniGSKy8M8Dg05Kttss4UE3xWWTI7bPu1k4hiSvvEeX
	Kt/RxeRASzUVFoWoWl1alozVnpRfJFXokdbO80fBo2LZdWRpjASnXjgr
X-Gm-Gg: Acq92OGHKb3Zh5zdAHvUQIwRGu9npjS/wEy24xjXgJo45j/VGZ7zUie96NutJOxFdwJ
	VbG3MSt18aUarSj/p0KnlsA27np/9hYIxb4VhrQugy+5QOKxeo5peNosfE3Dj/DlO3hCPNAvgOZ
	FCQXfUq+S8I17iD4cp791OG1MdMi60nhSoIrmI/DSbdRtDyfYLBMa70s+2bowk1Y8zQUXJxGSs4
	8VnhgOkrpvzKt0jKF9W/dbcTbzMQ1TbOfL5GDAutEwzL9Wy5sO3wK0VF0lE0CDTdwa70hF/3TLW
	4ykX/aRYyyzQg8tX/88A+0VpC2rYj1kLQTBsprIpJ4Q5EZcLYCrQzU+1r/Y4A3nc810WQafkH+0
	gDnIr0cAFkQeZtEo2g4Ze6gcteLLeuZygY/m1MUtGYudTHr+f/lLTOOeTExt1Kq9/VBnGZk/nY+
	rj3aB7MNyJp3G03vQ1llMhLVe8O6A=
X-Received: by 2002:a05:6a00:2d88:b0:837:fe75:104e with SMTP id d2e1a72fcca58-83cf4f760f2mr6043636b3a.5.1778314058754;
        Sat, 09 May 2026 01:07:38 -0700 (PDT)
Received: from sridhar.. ([2405:201:c034:9078:b86e:bb57:a91:e02a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965646254sm14938301b3a.10.2026.05.09.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 01:07:38 -0700 (PDT)
From: Sridhar Arra <sridhar.arra.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sridhar Arra <sridhar.arra.dev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range for short delays
Date: Sat,  9 May 2026 13:37:27 +0530
Message-Id: <20260509080727.21636-1-sridhar.arra.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl tool warns that msleep() for values less than 20ms
can be inaccurate. This patch converts the 10ms msleep to
usleep_range(10000, 11000) to provide more precise timing using
high-resolution timers.

Signed-off-by: Sridhar Arra <sridhar.arra.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..d66f17076818 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5834,7 +5834,8 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return H2C_SUCCESS;
 
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-		msleep(10);/*  10ms, ATIM(HIQ) Windows */
+		/* 10ms - 11ms, ATIM(HIQ) Windows */
+		usleep_range(10000, 11000);
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
-- 
2.34.1

