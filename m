Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2477F71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 01:34:43 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id p12so5161886pgj.10
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=WLzfeTzHIbRgUJOr3LYK0Jggy4qHkt6OcLXjRZXFVTs=;
        b=OMl2o3GRa493yEdsulU4D4n6BTY3GG7lYTX5AKeNoDSkiaUGNAtgIRHHX2Y5EomQ6T
         0A4c9rcv9DQGHsryKBNFDSUzKkNBB8zold9Y+IaboZ9RABJHrm40U6qTRTpUXzsvE+Mt
         ngNGGKEpwVysIUiieYRxvDfog5sl68dtemaKVc2rDZMQJbelJG7WXdD7tUnZXEe2HkS+
         qcGmjnc6v8rdbii2ANtxxzadVqez1f8AP43Xrn1NHV92UBC40hPTQYep9PiLLzDWh0Qe
         Td5L0sUb9dYMUOGb9Fp/z0MxFzIq7NWOiXETnsaeTtRxGykc+VkZet0XkWvH0sVCyFX9
         NCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=WLzfeTzHIbRgUJOr3LYK0Jggy4qHkt6OcLXjRZXFVTs=;
        b=nVvFQedqoqNHPmoQrO3cS1nHooNFrAMQWWTCFayviHRpf+OgJHmWJBPHhtHpd+cAR1
         Q5XRoGm+oAhbW+YleHOTqd8UvmfsQ7nm+7WQvkcLZ4pbBim9MDMkJSi9Nfw00AfPfxrD
         WsaMSl9W094qvYZzqzedAGBZvfFHLL/5aTyGa5jwZ2G7fhJ8ENQ9mPuIuSV9U+yml+uL
         OEW5vhuzf6e3ORN4y1cx7uy/rcDyeHlAzrXs3BqcpWRJUi0C/xdF3PnVIp98YHMgxLK0
         SMkuKq1kZdqNq8WJ2ZxP2WGuS/xPKAgo9tpOSj3Z73Pm2vixhfSt2Wn9nCzNgF6N/y+a
         rsgQ==
X-Gm-Message-State: AOAM531j0D56AqsM3MXgmWNRSECma60PXcwVR2oVGfhTncL4J/yDzsmt
	oaaUNWQxgum4B1Wd2fIJhNDjJrFSmElykA==
X-Google-Smtp-Source: ABdhPJx+004Wr3IhoolK0/oi8ypOASOp+VXeeFno12dIEeEhRyaS2qpUwaT1tP5WIhaxR1uKugo1gQ==
X-Received: by 2002:a05:6a00:2303:b029:249:b91e:72f0 with SMTP id h3-20020a056a002303b0290249b91e72f0mr238905pfh.80.1618018482607;
        Fri, 09 Apr 2021 18:34:42 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id a30sm3314226pfr.66.2021.04.09.18.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 18:34:42 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:04:37 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 1/6] staging: rtl8192e: add spaces around binary operators
Message-ID: <YHEArYPUhO4Jj9DK@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Added spaces around binary operators like '+', '*', '|', '-', '&',
to improve readability and to meet linux kernel coding style.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++++----
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index cc761d965b1d..7ed2ed9e63f6 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -138,7 +138,7 @@ u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
 		is40MHz = 1;
 		isShortGI = 1;
 	}
-	return MCS_DATA_RATE[is40MHz][isShortGI][nDataRate&0xf];
+	return MCS_DATA_RATE[is40MHz][isShortGI][nDataRate & 0xf];
 }
 
 bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
@@ -479,8 +479,8 @@ u8 HTGetHighestMCSRate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 		if (availableMcsRate[i] != 0) {
 			bitMap = availableMcsRate[i];
 			for (j = 0; j < 8; j++) {
-				if ((bitMap%2) != 0) {
-					if (HTMcsToDataRate(ieee, (8*i+j)) >
+				if ((bitMap % 2) != 0) {
+					if (HTMcsToDataRate(ieee, (8 * i + j)) >
 					    HTMcsToDataRate(ieee, mcsRate))
 						mcsRate = 8 * i + j;
 				}
@@ -577,7 +577,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 
 	pHTInfo->bCurrentAMPDUEnable = pHTInfo->bAMPDUEnable;
 	if (ieee->rtllib_ap_sec_type &&
-	   (ieee->rtllib_ap_sec_type(ieee)&(SEC_ALG_WEP|SEC_ALG_TKIP))) {
+	   (ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_WEP | SEC_ALG_TKIP))) {
 		if ((pHTInfo->IOTPeer == HT_IOT_PEER_ATHEROS) ||
 				(pHTInfo->IOTPeer == HT_IOT_PEER_UNKNOWN))
 			pHTInfo->bCurrentAMPDUEnable = false;
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index c294a6543e12..afcdb4b6a18e 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -104,7 +104,7 @@ static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
 {
 	eth_zero_addr(pTsCommonInfo->Addr);
 	memset(&pTsCommonInfo->TSpec, 0, sizeof(union tspec_body));
-	memset(&pTsCommonInfo->TClass, 0, sizeof(union qos_tclas)*TCLAS_NUM);
+	memset(&pTsCommonInfo->TClass, 0, sizeof(union qos_tclas) * TCLAS_NUM);
 	pTsCommonInfo->TClasProc = 0;
 	pTsCommonInfo->TClasNum = 0;
 }
@@ -189,9 +189,9 @@ void TSInitialize(struct rtllib_device *ieee)
 	for (count = 0; count < REORDER_ENTRY_NUM; count++) {
 		list_add_tail(&pRxReorderEntry->List,
 			      &ieee->RxReorder_Unused_List);
-		if (count == (REORDER_ENTRY_NUM-1))
+		if (count == (REORDER_ENTRY_NUM - 1))
 			break;
-		pRxReorderEntry = &ieee->RxReorderEntry[count+1];
+		pRxReorderEntry = &ieee->RxReorderEntry[count + 1];
 	}
 
 }
@@ -518,7 +518,7 @@ void TsStartAddBaProcess(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
 				  msecs_to_jiffies(TS_ADDBA_DELAY));
 		} else {
 			netdev_dbg(ieee->dev, "Immediately Start ADDBA\n");
-			mod_timer(&pTxTS->TsAddBaTimer, jiffies+10);
+			mod_timer(&pTxTS->TsAddBaTimer, jiffies + 10);
 		}
 	} else
 		netdev_dbg(ieee->dev, "BA timer is already added\n");
-- 
2.30.2

