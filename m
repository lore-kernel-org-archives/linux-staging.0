Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB783FC7
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 05:44:43 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id e7so1136879pgk.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 22:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=uBcl0oFTcsg+IJHeJ3hoqpsIqHeVx3Yjgs9nxKf6e0s=;
        b=ncYWYM4Fa33zgBPCY8QkFrC9CMQrJzsnaQC9/XhhBEODlO9dQebfwtZLDdi/C64nBq
         UWVJi8aLEITeApRGeW9Zf1FZwO78dKgG5j75XZX1/P2FK+hNxIVzIXDiSFsSVLGB2nbZ
         lfphBq6m0O6lUgXXEgshOCKYdj2+rvoSKDVlWbvseN50vseLCpuvpESJXxC3e2rhKKAc
         SZft8tfOxOwP3NcU6GO9HWRes7+UA1rOJnk9Sl/JsN+gOWmcyLnCMqVOlgdDNOndWVEM
         DajOJtlQgxb0X6B4P8m21lG6pj+76JqGE38muy9eC/RK5l2pWIO/haRaRubeIKBUKowH
         5D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=uBcl0oFTcsg+IJHeJ3hoqpsIqHeVx3Yjgs9nxKf6e0s=;
        b=oADT/MDHTRdjd22npZyyZj4dzBEcHFX513SnW1VC15SMr9Uv6nm3wkKv2oyGmojgPC
         FHkyHUD/Sc2MMjN6Kv1kjxDPYr7ZYNP2VSM/Ix1gtSrax1OsfHNZiwOHJSL02G0Bf1PD
         YP9X8S9W2joqBplqDp2Iv4RTD+gVmUduNK9vAAu22O6MQNeXruNwTuz3KgTvxNb0SROt
         tbuUlpONe7IODmk5Tip8FuFsNp08bsOEGCpa0r9QWlCa/az7iNXghlra/7GgYXjMPsJM
         AxzEddoMiya91EW+7pbVhczqA2+8wNjgIPm+pkv6T3K0Bs6I1nurCwghaquY5gUDkCnC
         3KFw==
X-Gm-Message-State: AOAM533EtISZG/5zOhTN04wuYnUKlpFGgwiI1uhbEWZhhDC1fUZkXM8W
	aCsKSwHyv5xU91duxVp0NpBo98BJ6G1FexCt
X-Google-Smtp-Source: ABdhPJy15WNZaqsKxKlp00nk5tpjeh7ygstxwW8sUggLurHtQGlK4QKtGFfw7lVLTyernHZHrfu9dg==
X-Received: by 2002:a63:5902:: with SMTP id n2mr2281599pgb.305.1630734283267;
        Fri, 03 Sep 2021 22:44:43 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id v190sm1024647pfv.166.2021.09.03.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 22:44:42 -0700 (PDT)
Date: Sat, 4 Sep 2021 11:14:37 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	fmdefrancesco@gmail.com, saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: hal:  remove condition with no effect
Message-ID: <YTMHxQJXKZHE5mg0@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes coccicheck warning: Remove the condition with no effect
(if == else) in odm.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index ed94f64d878d..a115bbfa8429 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -565,13 +565,8 @@ void odm_DIGInit(struct odm_dm_struct *pDM_Odm)
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DM_false_ALARM_THRESH_LOW;
 	pDM_DigTable->FAHighThresh	= DM_false_ALARM_THRESH_HIGH;
-	if (pDM_Odm->BoardType == ODM_BOARD_HIGHPWR) {
-		pDM_DigTable->rx_gain_range_max = DM_DIG_MAX_NIC;
-		pDM_DigTable->rx_gain_range_min = DM_DIG_MIN_NIC;
-	} else {
-		pDM_DigTable->rx_gain_range_max = DM_DIG_MAX_NIC;
-		pDM_DigTable->rx_gain_range_min = DM_DIG_MIN_NIC;
-	}
+	pDM_DigTable->rx_gain_range_max = DM_DIG_MAX_NIC;
+	pDM_DigTable->rx_gain_range_min = DM_DIG_MIN_NIC;
 	pDM_DigTable->BackoffVal = DM_DIG_BACKOFF_DEFAULT;
 	pDM_DigTable->BackoffVal_range_max = DM_DIG_BACKOFF_MAX;
 	pDM_DigTable->BackoffVal_range_min = DM_DIG_BACKOFF_MIN;
@@ -1345,10 +1340,8 @@ static void FindMinimumRSSI(struct adapter *pAdapter)
 	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
 		pdmpriv->MinUndecoratedPWDBForDM = 0;
-	if (check_fwstate(pmlmepriv, _FW_LINKED)) /*  Default port */
-		pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
-	else /*  associated entry pwdb */
-		pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
+
+	pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
 }

 void odm_RSSIMonitorCheckCE(struct odm_dm_struct *pDM_Odm)
--
2.32.0

