Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E972
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 11:22:07 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k8so9113506pgf.4
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IF7DiNeW+btUxyTKofRBmzZoNs1Ddr8B6E6fKZD+Y8c=;
        b=BXwH1gx1FDC5C0bniBbo3dMjUpqV6el5fFbg/3NfIieNfMr3wm3z359mGwzwNtHRAH
         MLJowFhfPp//s/QA3jlA9WgEfd/N/0Xp3xVwPluhb01sWj1aXNA6H4VYB1eEMIL3BU+v
         OjBALDIAIE72J5jzU9+JOO1cuIyWyFyuO1lyteGJaZ+eEyEcPjXXR00I9dpUFTW6iy59
         Jw7jzwaYFBugfnI9Y6ps9dhoFapwnQ9lpgLD1UaxZ/TxgkeXRa17tdcBC8oNkiLECOvv
         z9otx4BwjeKtlH8pZm4PUzy9dbOOIrtmkrPQOx5aIJpCcVOpIGtLmd7kk5Sq5ZT836E8
         DLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IF7DiNeW+btUxyTKofRBmzZoNs1Ddr8B6E6fKZD+Y8c=;
        b=ig6ttP6EJxePozTxw0w/fyecMDDc5AGjcOBCHUckGBqIv5cBNIFhj+t91Qt+WfD8mW
         6NzX+vwl2/cxzCzsItH4V1+1kLtX47mpsT9WROFUIUxVsQ6bRCHekgntMTqen61Jz8xl
         0t14ZUPTse8+dP1l9KSZqwyI2Lns3t/upoflKlNshItptimPcVrzNltAMYAqgSDLG/yW
         DDo65RYIi3++BCdK8GGaArtwjc/zFTxfpSYeSwJ0E7zsAOO67wysQvzQdl1atU/+HxaQ
         GRvNOr5TogfSIkF7bYOYEhRkOo576T2OrNiOwxRBIgbAmC5C/2KXEuVzXbUV+HBwCLm+
         iU1g==
X-Gm-Message-State: AOAM533xJmLAwPHxFrcyZuMeFlh1aAHOw3gkXJXH940vZNM0tJuCgiMq
	2YwDE1Q3oCFs3ZoVf70TWio=
X-Google-Smtp-Source: ABdhPJwtqDtVYMmCvPmJZtyEbTaswqZ6t1KZ+hhT+KqEAHG2+0SpZRK8SH6ebSyYku60XfeEE5uf4g==
X-Received: by 2002:a63:7708:: with SMTP id s8mr26647721pgc.265.1618226526669;
        Mon, 12 Apr 2021 04:22:06 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id e14sm11488811pga.14.2021.04.12.04.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 04:22:05 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:51:57 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 2/3] staging: rtl8192e: remove unnecessary ftrace-like
 logging
Message-ID: <460ba9cdd256bf1064c4e3a694caa046171cb60e.1618224838.git.mitaliborkar810@gmail.com>
References: <cover.1618224838.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618224838.git.mitaliborkar810@gmail.com>

Removed unncessary ftrace-like logging by simply deleting that statement
as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v3:- No changes.
Changes from v2:- No changes.
Changes from v1:- No changes.

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

