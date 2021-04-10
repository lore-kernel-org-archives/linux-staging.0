Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A4971
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 01:35:39 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so5827719pjh.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 18:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=UypD/qBMLUB6o+gYkcDEMH+/YYMDUSAMeMwPH9I+xZM=;
        b=GsvFfEE+y9TWs8iItPTW1QOD0A/A/DaDpzhKO86OcIYBj1qzNdOB1dbdsWfeWu6ZS4
         BWOdznuh1HBlhARQtZS0NC7xRURaVFH87nsZ0U0BWm76xdtvipaV44WRuUBnhk22uS/C
         SdwP0gVA9/DbO+g+eEVI6H6XoF812gZxyygh798ZjRNgpuwgLDns11TVY6+ZYXOZZEC4
         FGAeiEQtxExvJdxy7rLScE65q4SZCy/TTE/K1LUxZOWnW0V4QE6rpkozfHLAT8AfNDL2
         8AGlGEvBrLUrcrMIBozPMYItM4irGm5T0Vy+WHUim+1F94dl8pJrvl7NrMvtCVFkGX/F
         qFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=UypD/qBMLUB6o+gYkcDEMH+/YYMDUSAMeMwPH9I+xZM=;
        b=sG82dP2HtxKI/ppji0PeDEK8IjzoEMsnUqdU0yTUflRZYDg3iVJbLK15+6L0zO00QJ
         OGovckheYA95I5v79nPERz7RarTni2TYlpEK46LCD8fJW+trKCc+XTA8JCzT2gQMOA54
         AnMWgylQBrgSYHxuDt/xR1yGs95AivKKe7A0GAJqhfpeWLv3AB4EkBrdVkI+1aRspY/d
         FRqvNc7KoMBQubEXYYDV6inC0KYW0To2zRc+mektc7XxMO53L/q/lOm+vUUh0RRw7J/G
         ds1/mlNVsmo3+GBPNJTJbkdFs3O4qgI4fa/0pJ5ab4M9EuQ0V3m4FJdE5OY/DwsIjlg+
         1jvg==
X-Gm-Message-State: AOAM533CIPT74kHUaRpgs0pXF9yDGQWgS/85A06lvia1MYGweZolMR1C
	uAv/rplosXxqRgvb/PaL2lo=
X-Google-Smtp-Source: ABdhPJzewxRxDZYUYHkqn5vcntQo/XurFBdC5uclAagbjBtcKOQYX1rFC/kvZdcAidqhbvqAmhaOQg==
X-Received: by 2002:a17:90b:33c7:: with SMTP id lk7mr16681837pjb.95.1618018539509;
        Fri, 09 Apr 2021 18:35:39 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id m7sm3312883pfd.52.2021.04.09.18.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 18:35:39 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:05:33 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 5/6] staging: rtl8192e: removed multiple blank lines
Message-ID: <YHEA5QW6kbhfZ4k+@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed multiple blank lines to make code better and neater.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 12f31ba9aa13..2b9e275f42bb 100644
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
@@ -752,7 +746,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		if (bIOTAction)
 			pHTInfo->IOTAction |= HT_IOT_ACT_DISABLE_ALL_2SS;
 
-
 		bIOTAction = HTIOTActIsDisableEDCATurbo(ieee, pNetwork->bssid);
 		if (bIOTAction)
 			pHTInfo->IOTAction |= HT_IOT_ACT_DISABLE_EDCA_TURBO;
-- 
2.30.2

