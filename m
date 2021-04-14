Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5330B72
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:56:29 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d124so13070435pfa.13
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 23:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QAdy8nO8sPO8ys8krsfaC4uTkzbD3JcH3dkMY189rx4=;
        b=Ps0hH/LUdoDEUpfQpfyZNEhz4kWUppQUJJkxmfLlhtWchAhGJ2f/CfwFFg2cU4cjoF
         9o8fbNgAkf3X4fcSAxQUoPrRHvHJqSjwCtePv0LgtRqvZEn9/h505kJcgbFVXrJ8RBe+
         5YwbBYDLpQ1TYbO4baCrVCbZgIW1JKIWnT8hlNWe3gWdk5/UApWTDkRvAXolsCyutQEX
         K7K9VOrrWpSh+gGdKwNVkFbSaoAgER3O5lkM0wJsmx2UOub45Qc81/vNIzlTag1LDHf7
         IxW5GYpPBXrfGNYkL0EzHp0GPTgNSTG+ULEFCeuMn/x1aPPbVN5R7iD0nXlX90cXO7A4
         sNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QAdy8nO8sPO8ys8krsfaC4uTkzbD3JcH3dkMY189rx4=;
        b=HOoqRen3/VAY5NlfKSkY7edApYJvG0zYm+h6KwaL7yZrqcvQST7qYm3+Z2lfprFkNt
         fceFdwneHO3pNekop2se+CxZcIPigRSFYSD8FC5YG/qVnbc0N7JJ/PFOGzoHejN9FCKu
         PNNKDho81RTTF4BeYgU5xYHRmCzaixtglMfmZW9fSEsqV2exXkmR/5xrNPiKUXAFoLas
         Y4Wb89xO3EpmtTsUkepr840yIlpI1O2k41N1Q6sqnkyh1WdaFZnnuPMqiHQ0zIzASkqg
         bx7rHkIfJwkmY2mHM78tP6aXIRK2ysPDUStOm8nNHG0bqvL1Xo3Wm0bPd8HqM0RyqJm0
         ERQQ==
X-Gm-Message-State: AOAM532QlhBVI1rmI5VakSIDL6z+SI8FgIbMuGZtl1nvdhbyTD5dy2uk
	NFeGB3WCxVlR6FLJDtCX4MU=
X-Google-Smtp-Source: ABdhPJwiPG5yRCZLBFbsCXflGJceDl1QR/7IpKdmbdRmD4a6kowvdB56Dm10Bc6QLpl4pmd64l54Tw==
X-Received: by 2002:a65:4887:: with SMTP id n7mr36018509pgs.14.1618383388867;
        Tue, 13 Apr 2021 23:56:28 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id g24sm14123731pgn.18.2021.04.13.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 23:56:28 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:26:20 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 5/5] staging: rtl8192e: removed multiple blank lines
Message-ID: <2bfe551f152a611cc49a71a4984f41ef7ee69df5.1618380932.git.mitaliborkar810@gmail.com>
References: <cover.1618380932.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618380932.git.mitaliborkar810@gmail.com>

Removed multiple blank lines to make code better and neater.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b11b0054d8cb..955442b95bdc 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -214,7 +214,6 @@ static u8 HTIOTActIsDisableMCS14(struct rtllib_device *ieee, u8 *PeerMacAddr)
 	return 0;
 }
 
-
 static bool HTIOTActIsDisableMCS15(struct rtllib_device *ieee)
 {
 	return false;
@@ -236,7 +235,6 @@ static u8 HTIOTActIsMgntUseCCK6M(struct rtllib_device *ieee,
 {
 	u8	retValue = 0;
 
-
 	if (ieee->pHTInfo->IOTPeer == HT_IOT_PEER_BROADCOM)
 		retValue = 1;
 
@@ -315,7 +313,6 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	pCapELE->PSMP = 0;
 	pCapELE->LSigTxopProtect = 0;
 
-
 	netdev_dbg(ieee->dev,
 		   "TX HT cap/info ele BW=%d MaxAMSDUSize:%d DssCCk:%d\n",
 		   pCapELE->ChlWidth, pCapELE->MaxAMSDUSize, pCapELE->DssCCk);
@@ -390,7 +387,6 @@ void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
 
 		memset(pHTInfoEle->BasicMSC, 0, 16);
 
-
 		*len = 22 + 2;
 
 	} else {
@@ -541,7 +537,6 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	else
 		pPeerHTInfo = (struct ht_info_ele *)(pHTInfo->PeerHTInfoBuf);
 
-
 #ifdef VERBOSE_DEBUG
 	print_hex_dump_bytes("%s: ", __func__, DUMP_PREFIX_NONE,
 			     pPeerHTCap, sizeof(struct ht_capab_ele));
@@ -562,7 +557,6 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 			       ((pPeerHTCap->DssCCk == 1) ? true :
 			       false) : false);
 
-
 	pHTInfo->bCurrent_AMSDU_Support = pHTInfo->bAMSDU_Support;
 
 	nMaxAMSDUSize = (pPeerHTCap->MaxAMSDUSize == 0) ? 3839 : 7935;
@@ -750,7 +744,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		if (bIOTAction)
 			pHTInfo->IOTAction |= HT_IOT_ACT_DISABLE_ALL_2SS;
 
-
 		bIOTAction = HTIOTActIsDisableEDCATurbo(ieee, pNetwork->bssid);
 		if (bIOTAction)
 			pHTInfo->IOTAction |= HT_IOT_ACT_DISABLE_EDCA_TURBO;
-- 
2.30.2

