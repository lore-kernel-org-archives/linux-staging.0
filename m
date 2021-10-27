Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9E2C82
	for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 18:34:53 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 83so3775152pgc.8
        for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=rZ1FB3CWtcfDgjKcIVRiQbXOzmz1nIz649iaBjymSHo=;
        b=mrbbF+vgf43ds9NpeoL/+XuV3Xfrdr6jd3L521mLardiqMytamE3RyxWtCFwhN/0Ft
         wHgvxePuJ/275+kqYouKBlRHPAApF9e6vLWbVAGo26/rB+YWRlHJvoF9tg8mPSc997O1
         fJiDIHm7ytyi+X+p6ScerhojaTKizMdoKurHDzHAUDpiLJkqHk9DF+MmlOguCUSGSEgy
         4NtDDd5NWoBZHCJZv6Oou0GMlYh/Hb5nX4FYCZb4Q+AmcYgVeJl/rGbB6y5JqAT2n4fP
         ML/q1PkhKWOQ2aVt6E5gwLzysXU7j+JUBVqPaXw7EVN+zd/Je4g5qP31PVnt6b8ehaZ3
         zVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rZ1FB3CWtcfDgjKcIVRiQbXOzmz1nIz649iaBjymSHo=;
        b=gfThtQvROrtAI3izVj1/6UWo++EF0frlB5f5BZM+dRKGttRnofyxnXPTt1NTvLrLto
         00agX0KtpKnWlFr7/qEXGsr1i+R2SnIIm/a3Z0VsXdXCY7YQGZZWMTSsCjaa/mO6w0Ud
         M0UNSBTcN+HGE3zg8erzGghtlc4V1Zh0r+h+SfXG7WyqwegOX2SpucbKcbgBozcY/Ndr
         BOkvhNuCsusk/B2vxtDQkyvbi1MjD8SrNj+/bfOfmDUCVhADk6vE70N3tZ0l9Gn2coCN
         /qIxKas3hZGN+fbTrtR+WnM6rdgILL4sBiTVDqxA94Bt2OQSFagrkp21RDXyrLMlKnEq
         kUlA==
X-Gm-Message-State: AOAM530Ohp0g561nkueMGac+zkXKvA58yCR+3GSkn8oLqOrYr6pv/IR7
	ZxWtC/A1PaKV8r/tn4Q8sRpEBi1B5zvi4w==
X-Google-Smtp-Source: ABdhPJyGnmA2pc2Astk74/frWI2/SMTiF094cWxXNalcN9sUhHtVsSOPu/xxYGoE57wt6MqhIHVOuQ==
X-Received: by 2002:a63:2cd8:: with SMTP id s207mr25375160pgs.312.1635359692896;
        Wed, 27 Oct 2021 11:34:52 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.83.133])
        by smtp.gmail.com with ESMTPSA id k14sm419556pji.45.2021.10.27.11.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 11:34:51 -0700 (PDT)
Date: Thu, 28 Oct 2021 00:04:43 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, dan.carpenter@oracle.com, will+git@drnd.me,
	mitaliborkar810@gmail.com, eduard.vintila47@gmail.com,
	saurav.girepunje@gmail.com, zhaoxiao@uniontech.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8192e: remove condition with no effect
Message-ID: <YXmap8VIxfOpqeEY@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the if and else code section for variable pHTInfo->bRegBW40MHz.
Just before the if condition variable is assign with value 1.
So if condition check for pHTInfo->bRegBW40MHz is always true.

Similarly for the variable pHTInfo->SelfMimoPs value '3' is assign.
So if condition check with value '2' will never be true. Remove the
if condition check for pHTInfo->SelfMimoPs.

Remove the extra blank lines from HTUpdateDefaultSetting function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 3b8efaf9b88c..6925654dbc03 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -72,34 +72,20 @@ void HTUpdateDefaultSetting(struct rtllib_device *ieee)
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;

 	pHTInfo->bAcceptAddbaReq = 1;
-
 	pHTInfo->bRegShortGI20MHz = 1;
 	pHTInfo->bRegShortGI40MHz = 1;
-
 	pHTInfo->bRegBW40MHz = 1;
-
-	if (pHTInfo->bRegBW40MHz)
-		pHTInfo->bRegSuppCCK = 1;
-	else
-		pHTInfo->bRegSuppCCK = true;
-
+	pHTInfo->bRegSuppCCK = 1;
 	pHTInfo->nAMSDU_MaxSize = 7935UL;
 	pHTInfo->bAMSDU_Support = 0;
-
 	pHTInfo->bAMPDUEnable = 1;
 	pHTInfo->AMPDU_Factor = 2;
 	pHTInfo->MPDU_Density = 0;
-
 	pHTInfo->SelfMimoPs = 3;
-	if (pHTInfo->SelfMimoPs == 2)
-		pHTInfo->SelfMimoPs = 3;
 	ieee->bTxDisableRateFallBack = 0;
 	ieee->bTxUseDriverAssingedRate = 0;
-
 	ieee->bTxEnableFwCalcDur = 1;
-
 	pHTInfo->bRegRT2RTAggregation = 1;
-
 	pHTInfo->bRegRxReorderEnable = 1;
 	pHTInfo->RxReorderWinSize = 64;
 	pHTInfo->RxReorderPendingTime = 30;
--
2.33.0

