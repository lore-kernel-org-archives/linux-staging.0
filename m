Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6231072
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:35:34 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b26so2169180pfr.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vA8lw1ubzFZMaLM7kqq8oMrtyRFAa93RWghGoalPd7A=;
        b=D5Gk92YsRMpnAtiafUraa1IM89Wi/bc2KSEwOC2hgUUTEtI+eGY9sJYv3WTwOTZ8D5
         ijZ1rtM2iYbRocFVqg8J1AqDgjMzYzAWsqHVeSaPtPko81t2T/J8X99ftzKT9/AkcFy0
         Lq0iKICotnX9mKeVeKzKPrtBeIQ04UddS4e4AHFWbHHUuxvvt5dBpaf/uNDiNHJYdAyI
         KUZQtnohHC0ajVgiYQ6KDFyER52AFqI70MxAh96HOPw411HYaNS2rNEAPQkiC8Z09XBC
         Dc31qJeO64b4c+HMq3RU84DMUTBZQ694XXw1hEkBVzxNGBX69VwVNEclqpCWjIpRE3Cf
         liLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vA8lw1ubzFZMaLM7kqq8oMrtyRFAa93RWghGoalPd7A=;
        b=hMkNdscRwkAxxQYIiBaQmpOWvEa9kEiUw/4z7Fh/WusLyT8u3nDfkf+6vSn3J1Yf6l
         xt6DYdim056N0aMYDq/iEJnRQ/zVkEI6XjMXkSY68fSLIQPVcN0rotW2UxQ4KpIvZj6e
         MYr1ipS8jbv6ezq9jXkNpE94b4uQH+i9TsrG2xZzP88CVh/BA8XroPF9aYJ9WpI0Dzl7
         0c9UeiliWCLOrlKlhz4JPQSzBLB02FaL8j0oyWLLz1CRAo9ZKoP+M51vQdOV1otFkR2f
         QAejb5Nu76CaBZO8j55WStql6oGMpHz733H8fen5sk0S5PuCR/n8zgo5NsGHNobxGfgu
         07Rg==
X-Gm-Message-State: AOAM532D7IbYjDb7C1XGLrnTTP6gjOJgmFTREUlvNZQG8uSK/P88mB2i
	s2uo67HVFRHsp9eeiIepOKw=
X-Google-Smtp-Source: ABdhPJyGkP1rrZjMFDWS31reanTv93OoKhwT190NZ7P+y0yD3TuiCALdC9KgQlw9wZs7DADFFlYZAQ==
X-Received: by 2002:a62:2cc8:0:b029:23d:bd0d:2ac3 with SMTP id s191-20020a622cc80000b029023dbd0d2ac3mr20390208pfs.41.1618140933800;
        Sun, 11 Apr 2021 04:35:33 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id l25sm8731836pgu.72.2021.04.11.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:35:33 -0700 (PDT)
Date: Sun, 11 Apr 2021 17:05:24 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 2/3] staging: rtl8192e: remove unnecessary ftrace-like
 logging
Message-ID: <460ba9cdd256bf1064c4e3a694caa046171cb60e.1618139271.git.mitaliborkar810@gmail.com>
References: <cover.1618139271.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618139271.git.mitaliborkar810@gmail.com>

Removed unncessary ftrace-like logging by simply deleting that statement
as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v3:- No changes.
Changes from v2:- No changes.
Changes from v1:- NO changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0b1e92f17805..89d0e9ec188d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -630,7 +630,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
 	pHTInfo->bCurrentHTSupport = false;
 
 	pHTInfo->bCurBW40MHz = false;
@@ -698,7 +697,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 	u8	bIOTAction = 0;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
 	/* unmark bEnableHT flag here is the same reason why unmarked in
 	 * function rtllib_softmac_new_net. WB 2008.09.10
 	 */
@@ -832,8 +830,6 @@ static void HTSetConnectBwModeCallback(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
-
 	if (pHTInfo->bCurBW40MHz) {
 		if (pHTInfo->CurSTAExtChnlOffset == HT_EXTCHNL_OFFSET_UPPER)
 			ieee->set_chan(ieee->dev,
-- 
2.30.2

