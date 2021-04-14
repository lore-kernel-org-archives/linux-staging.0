Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB10972
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:55:11 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id i190so13085896pfc.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WOD1vszs28Y8cd70dkw1Qc027ESGrGzF9sDa2/FEUQE=;
        b=HDh7A9oc4N7gCKs6fksCjZvQrhMHeMGNy8B/Bwvd3c3O1kyh6Y+jMrRzPahdmbAJLJ
         p0ryiZGy8eu2jdPFlt9MBBbhkaex0cYqoI3kKZOCjxDQSmNdQEMs08Hi8Mq3DiJzuWz+
         7++AdU5v1ocTuEg+IJOSKCdxZYGSu3+52xG5K9QpY0gdXDTH88QblIGMkJV2MDDOsMGo
         t5VBJMWI/UeNauD+lbHpv+yTAtUhLTH4WHi4UCx5Xkr5eZBrQ4Nr2Tjb84Xi4iIA4d+Q
         kmX+WGsGKYr7HOxY1ZbxqpAGcHZV+VjnMp6nGbpYIWwZNOXMDwzXlD27EnhQg0KHJINe
         EMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WOD1vszs28Y8cd70dkw1Qc027ESGrGzF9sDa2/FEUQE=;
        b=jCQIu5ho5lZS4R7r7dY4QtA+eISJsZ0V0VL2GA0QWbzycPGRs2T4ihRyC38uZqX5Sq
         eUie2g4w+NXv8t4JOnXSi7ZaBvAFAArT5I0RliSSCiq37RvbUYJb4jpm0XFzew0nFlf3
         6TCfQk1EZE7WkJFRQaBap0hwFAcZXYm0GcyBZiIo7qWpdIdWHhSRubB5MWWqjt++KLJW
         b8QtzscbDe3c/EmZBztJdD6O9w0NxvWzPC/IqdgmT8hxQbM095Vsg5q6xbW7NF7APGSY
         NyFjst8VenZEVCMRyxilDIM0acJsOkNykJOXZQSMJr9t4y7kzV4HfJweFqybUEivMX38
         cVnA==
X-Gm-Message-State: AOAM530Yf35e/KEv9At81GjWWV82ct0PIs8CetgFGhlnYCH8o+ig7LdF
	CrJke9TY48IgkoFqbWbdYmI=
X-Google-Smtp-Source: ABdhPJy+f626OZMcaa+3EmbKIiZF7LOh3EbLZZ6ZoPisNZCSLZ2LMBXciiGo2/19o4AydWhGyfD/XQ==
X-Received: by 2002:a65:6496:: with SMTP id e22mr36756023pgv.46.1618383311404;
        Tue, 13 Apr 2021 23:55:11 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id j7sm5586444pfd.129.2021.04.13.23.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 23:55:11 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:25:03 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 1/5] staging: rtl8192e: add spaces around binary operators
Message-ID: <28cbc4825fdfacf5d5ea8bb688a8bd6a1c65f059.1618380932.git.mitaliborkar810@gmail.com>
References: <cover.1618380932.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618380932.git.mitaliborkar810@gmail.com>

Added spaces around binary operators like '+', '*', '|', '-', '&',
to improve readability and to meet linux kernel coding style.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++++----
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 4a2968566b93..b74c6ac817d4 100644
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
index 6c51323104e5..b14ed3534ffa 100644
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
@@ -188,9 +188,9 @@ void TSInitialize(struct rtllib_device *ieee)
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
@@ -517,7 +517,7 @@ void TsStartAddBaProcess(struct rtllib_device *ieee, struct tx_ts_record *pTxTS)
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

