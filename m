Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12A71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 01:35:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y2so3582386plg.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 18:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AmH+UMyc1cUAc4hzdn/oSiz/QnBV7R1v32Iys4DOp0s=;
        b=M8B463kyH+a1W5utxKfyOtivuPkCqs7onqXldRTgrHV18AjrJ2/Uyfu6dgIxjuyvul
         SnyfibvyXDqFSEcHjxvHdirLL7j91yqJ1yb1QIRaXmkzODWdpgbuV+4A6pxuABqIQ4KV
         8zBEbNGx89je4ikUkD6ot1pmV6y4SVL6LZxvw18cZEwn6/iKWbKtS57Aq3nEmVXqMVAy
         l8kRS8ytZG63jSXQJcWdAT5EeseNwwIEvtx8YKq/y7A/BhbKiVNkr4SMTe4KqY+GAJVW
         3Eu+IHozQueMbFfIt+koiJZBc8C8j333DaiTKiuIpXkkd8PmECvH3+n72ZDIor3K6oG1
         FoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AmH+UMyc1cUAc4hzdn/oSiz/QnBV7R1v32Iys4DOp0s=;
        b=kZ2+DoO89mqPXOzuRhgPo7fwQWdBCR/u4TB8+SGB59rVowyzFYPtYRpupoNHeIWZLU
         81Eoo7jF6g2balBJsCelBHjV5hCVwYNiIJa2q21M2nfgDuIGIApXC4B1nu2911U/M9CO
         HIg23JT+Xh1exLeQPiKE0rkm822Fh1+3lO97b565CVEiiEG+eNKKHYGlcQ99PZ5Wn5r7
         x4hFFmB0doIEKrM2T6BBdL/NC19hjgye+Oe1Y0cRn0GMYYcGkBgtkeDrqNuwRkQ0ISBQ
         sYxmNea6L9HgVTSm/qfWO0wPKdKPQC29ntugATeTwx5TqLZmG+RTgzgWR3+xPEdIHuEw
         4zBQ==
X-Gm-Message-State: AOAM5313dImhchvNnKA55MLodEBt1ozgm/4afz8AdSr2NqpV0AdvrQT5
	4dGk+5qcm7cxl9rDKgEb618=
X-Google-Smtp-Source: ABdhPJwTde34qNXCq6fW6I4cIgzIH+xEe09llhnZzIrZkL+1Aj9CKxWjrRLmhzBpG35A1QHuc3ZFOw==
X-Received: by 2002:a17:90a:20c:: with SMTP id c12mr16288412pjc.224.1618018513395;
        Fri, 09 Apr 2021 18:35:13 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id j188sm3352388pfd.64.2021.04.09.18.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 18:35:13 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:05:07 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 3/6] staging: rtl8192e: remove unncessary blank line after
 brace
Message-ID: <YHEAy+SVBJQk0HDB@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed an exra blank line after close brace '{' as it was not
necessary.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index e188e9e6b11e..0ded86da1562 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -492,7 +492,6 @@ u8 HTGetHighestMCSRate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 static u8 HTFilterMCSRate(struct rtllib_device *ieee, u8 *pSupportMCS,
 			  u8 *pOperateMCS)
 {
-
 	u8 i;
 
 	for (i = 0; i <= 15; i++)
@@ -686,7 +685,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 
 void HTInitializeBssDesc(struct bss_ht *pBssHT)
 {
-
 	pBssHT->bd_support_ht = false;
 	memset(pBssHT->bd_ht_cap_buf, 0, sizeof(pBssHT->bd_ht_cap_buf));
 	pBssHT->bd_ht_cap_len = 0;
-- 
2.30.2

