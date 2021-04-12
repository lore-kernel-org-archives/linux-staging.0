Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FB72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 06:11:11 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id z16so8558171pga.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 23:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=IYqQaJDmst//9bdnYVVyaSBsB447C8sYHCRi8q6qoSo=;
        b=W12j8BWHXgpL0vM/RczGUl98h72QC2rDYB2oFoqBObmeShy6F1t2KdJpuh1rkZaLTy
         T9vj6Rq3gKnLGfRtO1SReFA0QoPC6S011LhsgckVjgM2KZ+XHlYTh0TeIy6HIJdBk9e3
         dpc/x5nRU/MOkMPrsuOhfTtauaMDrVIIWBfyi0qWDRURsoHkJZgz0wzxmQb0/6uaHSQh
         VJk7bz3qrMJCb6Yaclo7nbOJ2A7BiXPBmFPIFgDCHpgdYxk3o4XtgiHoxQ/ZiccKGflA
         cExbgrWVLC3ukRoK4VFVKAll+jDa+FVRz9I/JCaw4LCr8ep7Mlm/xoVPP0b0LThdz1X+
         sQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=IYqQaJDmst//9bdnYVVyaSBsB447C8sYHCRi8q6qoSo=;
        b=nGarZilnbF2OJ2IVn61GD9N7UAO1SuLAjKYOOWtG+tt+JgX6pDK6AAo2tlKeR5Pl4u
         Bja4TDrRfz7j04+AGk+d8i1ycXMlZU5Y7lqtyJpUOSSKngLHg9PShixtSUT9p+kXmBUh
         M/GtJLxzlPExqBp9bKW1b/4pvq6sY7Fi2fCdeqrkeMJk2+ZSS6ZL1RgNL5X3yVMbFSoQ
         k00ukzIj0MV32Q875RyPnrNf/cnXIcEmmYRoFDIH1IqdAgfQ7j/uPlgbtysfjSyinsM3
         y2GRxwzKuTXu03AA9G2+HwalibWGD6Jt1hD1jEjhLxAtVsNbirfsZbFIxRvsO/z+OWSK
         lA8Q==
X-Gm-Message-State: AOAM530bOATTGYg9OlK9pMt4ifka0xNOnWRcCvblL56fQlFQVZfmLerU
	f/nNXon8Q+ZAy/cUJULO3FU=
X-Google-Smtp-Source: ABdhPJwfL47PPkhOmo5lvnsX2ttVihNr5nOth4H5yuMT/EHGfsD7lYdBLDOO+q23eRkOAiQnB0L1mQ==
X-Received: by 2002:a63:3dc7:: with SMTP id k190mr26403045pga.181.1618207870533;
        Sun, 11 Apr 2021 23:11:10 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id a25sm4251251pfo.27.2021.04.11.23.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 23:11:10 -0700 (PDT)
Date: Mon, 12 Apr 2021 11:40:53 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rtl8188eu: replaced msleep() by usleep_range()
Message-ID: <YHPkbTPPra2isn5e@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed the warning:-msleep < 20ms can sleep for up to 20ms by replacing
msleep(unsigned long msecs) by usleep_range(unsigned long min, unsigned long max)
in usecs as msleep(1ms~20ms) can sleep for upto 20 ms.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 50d3c3631be0..6afbb5bf8118 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -5396,7 +5396,7 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
 			return H2C_SUCCESS;
 
 		if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-			msleep(10);/*  10ms, ATIM(HIQ) Windows */
+			usleep_range(10000 , 20000);/*  10ms, ATIM(HIQ) Windows */
 			spin_lock_bh(&psta_bmc->sleep_q.lock);
 
 			xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
-- 
2.30.2

