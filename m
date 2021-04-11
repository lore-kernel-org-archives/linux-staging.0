Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F55C72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:34:36 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id b17so6833771pgh.7
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 21:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T2BqAHrw2lrAPveG5tNBR1zjqxaEBIbo2AlCFYFiJmQ=;
        b=P89JbJrFS35OLMoOnZ3PzsM4t153DPBw+PCNvnnp5YLyoT4G34xWY4CtV3DLczZKfS
         lSzFEl/8jUf6qnCub6OZIcMP91wYkydmsR6bDIjG8/NK3NPrWLqlQ1JiSI/dF2mo43pb
         UXTR1F/sf1fQxSUX96JGDgs3BNpCdfdxR02C8hlnC1XTmFVuYwudCNCzHBS8m8Rv9uPk
         v44oTiq0+KVV1cOIPneaekhGFexJR/ERlb9aY/2smG64jD/jmP2sYQQH4xPuSzYV1WpQ
         Owd4o3GRRqXQOE9Jsl3k3G2AyAJYFgYobbY8tIYz4JbC/SxWnxHownJcUb3b6vGUF6q9
         wJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T2BqAHrw2lrAPveG5tNBR1zjqxaEBIbo2AlCFYFiJmQ=;
        b=Ri2CheiHsgY31NeHVwsLnZLlYPk4kqCkLL6W2BQtiiv6wyrWWUeJykzkJ4iD/J7xfW
         M4KsDOPAAj7iDX7LBq6+FF7keGtH4RolzUR3i8VHGUyuzWuc4Ln+WPay1fllSMVKNi6N
         kMcnPl2sipOML58PRpuRWNtIToaM0rfd2FofhjUhe4r+c925n1mEUMWsCmhEuXVyIRLu
         cYfZ6OG+LLGYJc31LvTLDGOdB9lDaGU2joyOJNtjGQlkPk6yReDsojUu0UfLUJzNJGx1
         fh7ApbVfkyddUhB5xgo2+1vrpC1PO/e08afOWBZBwC/c+LX3yVg6tGWPOVfGRvFYnLXA
         wMhA==
X-Gm-Message-State: AOAM531VZ62QQ6cRTs5e991mASjqOwAaEM4wZ1O6jYaXCk4Li7AHDsA6
	bBVLtVH73PVGx++6Vk2aIse97Lazo3dqcQ==
X-Google-Smtp-Source: ABdhPJygjyld7FhoVZGn8ulNcZ52CjsBgouBigNZuioN19fT/HBiGY2bSCi2Sd+zxBrMECOaf/ao2g==
X-Received: by 2002:a63:2c8f:: with SMTP id s137mr20179759pgs.51.1618115675991;
        Sat, 10 Apr 2021 21:34:35 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id s195sm6218785pfc.211.2021.04.10.21.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 21:34:35 -0700 (PDT)
Date: Sun, 11 Apr 2021 10:04:30 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 2/3] staging: rtl8192e: remove unnecessary ftrace-like
 logging
Message-ID: <667dd268dd1387584cc28d2c63cb3b18edb4bc7f.1618110617.git.mitaliborkar810@gmail.com>
References: <cover.1618110617.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618110617.git.mitaliborkar810@gmail.com>

Removed unncessary ftrace-like logging by simply deleting that statement
as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- No changes made.

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

