Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438471
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 09:55:46 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id q10so7112279pgj.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 02:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9+Tud+EwHobwTf+ByrLi6YGTbViJEd1nIvc/V1lBmp0=;
        b=pFNSOKCBR6L8loV8oFAVLnvUBfHS1UArAffhRwOUDaoA0Iw7fq9YY2MRVVwHOy5IEB
         /B7OfrSOP9Uqw1UKBOBr+qICE0Spu+oD/23kav/Jzy93/nHi8oJ9YIaTVoCnnFvDwf+r
         wG3ErJudWtO/tbgwhT9r+DvJ7m5EQLKBLjp4FZh5AhBUbhn27baht5Z23LdHKm93Zs+e
         X/xRjJP22immfK+Za7ZWmV5MjRoopyI2e/PATVD7VHnlhY6KcnXXQZtnaLbGcfBjqQc/
         V1WDUY46W0YjvOo3JydPwk/RXBZsjHfp83JtiVFp4QufIrCaNbL2NsQXCYACStULlI+F
         rTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9+Tud+EwHobwTf+ByrLi6YGTbViJEd1nIvc/V1lBmp0=;
        b=a4YuAwVGWlIBLaKcux7VNoT8Y+Lwxu38F4uW7eccAuwk5Txp4lZ4dovpbvYorN1KfH
         Qul9KW9JR9eBljrKWtQA295yg4W5iwvCJUvw9ATaU4oraaUtaNyn+TtVDHSEAMP++q7+
         q6fzmUOgR89h3Ti6k77JY31H/stOOfs0Wfg5BifnaNk3kM2VKf23vMzkcA1jQpge16Qc
         80qpDIr/zyEhOX55eL6s8E60TqUW1qzZfpCXus1/EWRa1223f1yc0qfUHRVMwiR4hhMC
         VIpJc5drGeHBx9yVXhrZ9jP0hWX+Gah8Ftxd/XeTEFvj8XCgK3L06l6dTDT5YXQqdqoF
         pIJA==
X-Gm-Message-State: AOAM530wi0n1SoVeuKuROlJP3nkClFFVyNvwwml1duzQ2xZUPJt7mWIK
	cvxSPuNS+Q7Cq6idPa7bcAY=
X-Google-Smtp-Source: ABdhPJwf0po7d6X6MCXuOW2FKDqHxJSioh/sgIqwIGqzjsM5dRdxmV4tRnFr/W4oDeQ9EO5UYzgRSw==
X-Received: by 2002:a63:43c2:: with SMTP id q185mr21052350pga.41.1618134946241;
        Sun, 11 Apr 2021 02:55:46 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id e7sm6581072pfv.107.2021.04.11.02.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 02:55:45 -0700 (PDT)
Date: Sun, 11 Apr 2021 15:25:39 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v3 2/3] staging: rtl8192e: remove unnecessary ftrace-like
 logging
Message-ID: <460ba9cdd256bf1064c4e3a694caa046171cb60e.1618133351.git.mitaliborkar810@gmail.com>
References: <cover.1618133351.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618133351.git.mitaliborkar810@gmail.com>

Removed unncessary ftrace-like logging by simply deleting that statement
as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
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

