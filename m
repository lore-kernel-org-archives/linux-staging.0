Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958A17B
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:04:07 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id u24so4449213edb.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=mwmv7xOROMQWgRYRX1JJBkfjP0Il8vL4+C4wGKBb7jE=;
        b=fsp7GXaS3lZVimtv6FUR+M3KZzqf+JSaEkdQZ5HLgi7YWdtUanAaF9x0DIX5O0Bh8C
         bKRR7Yix/5BSckwpTYHhjwIdgf84d78ikTFd45xQ8X/s/DAdaoT7kdIaPXpIOgsHEfwc
         BrACQBfyk5D9kTJJXv7+xej/y/hVXFkXHOpCVdctYGtOrBcur4Zk+GW8/OV4wSR3AD5c
         pJWx6+xQFpuqGCMOOgO45598L+NEqYDyY2lfpKrbbRVbtoZb5kgOR6tvsXRDXbxpeTAb
         WPYoafQa/MWIz2KhEUhWf9klIbPbAktqrk84mv0rGcHmYmveXqX/3Jp58pzb6hWSwXY4
         jR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=mwmv7xOROMQWgRYRX1JJBkfjP0Il8vL4+C4wGKBb7jE=;
        b=YKAXqCAQU9hvGJSzHIehen5nkq1Lqe9MLrM2vskdizK3ikkwYQQhJL1TwAIg9+kRJ9
         LNIuT2Ejin0Nt00BhMjuv2HSubuDJLOIoSNYYlqkuWWVq0FXDaSlF+t0qEvwo8cUcx0B
         pdFNIraII8/foWu/bje2/Ju3oQHkYcfcFvba9BKZeAixFZWH58EpWrIhP8R9Zz8pZTD7
         NKGAZG3Jpr+N/1En1gXCRspORFKBH+uuWF3zHSn4uLDF1AlXAVDxPju1rTamVUOhRmuZ
         jJB4LmbOnLVQSdtIn3t9lXLC+dSFFV/xTljd67Qm5eIURyHy5JPhMImzT+DTi0EGOeiD
         1w7A==
X-Gm-Message-State: ACrzQf1CAGrzSLpmjfNF1ReJQDPqh2yDP1foOCHVUq+jX7bFZc4OdQlb
	rB9VUooux21L6QgWQU3JAaA=
X-Google-Smtp-Source: AMsMyM76avNymSbmgkL3qfd1Wgp72ASpep118M7tKa6MOdwayVER7Q3nXlcWjk1JBYHRWSpkU14vZg==
X-Received: by 2002:a05:6402:518e:b0:452:49bc:179f with SMTP id q14-20020a056402518e00b0045249bc179fmr15295393edd.224.1664057045934;
        Sat, 24 Sep 2022 15:04:05 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id kx16-20020a170907775000b00780982d77d1sm5940013ejc.154.2022.09.24.15.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:04:05 -0700 (PDT)
Date: Sun, 25 Sep 2022 00:04:03 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Rename SelfMimoPs, CurrentOpMode
 and bForcedShortGI
Message-ID: <4c59f62a95b9a77711284998b98fbc559b8db813.1664055213.git.philipp.g.hortmann@gmail.com>
References: <cover.1664055213.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664055213.git.philipp.g.hortmann@gmail.com>

Rename variable SelfMimoPs to self_mimo_ps, CurrentOpMode to
current_op_mode and bForcedShortGI to forced_short_gi to avoid CamelCase
which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     |  6 +++---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ++++++++--------
 drivers/staging/rtl8192e/rtllib_tx.c      |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index f656869523fa..6b3f280407a3 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -140,11 +140,11 @@ struct rt_hi_throughput {
 	enum ht_aggre_mode ForcedAMSDUMode;
 	u16				ForcedAMSDUMaxSize;
 
-	u8				bForcedShortGI;
+	u8 forced_short_gi;
 
-	u8				CurrentOpMode;
+	u8 current_op_mode;
 
-	u8				SelfMimoPs;
+	u8 self_mimo_ps;
 	u8 peer_mimo_ps;
 
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0f275b6333b2..1ef5c04914af 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -90,9 +90,9 @@ void HTUpdateDefaultSetting(struct rtllib_device *ieee)
 	pHTInfo->AMPDU_Factor = 2;
 	pHTInfo->MPDU_Density = 0;
 
-	pHTInfo->SelfMimoPs = 3;
-	if (pHTInfo->SelfMimoPs == 2)
-		pHTInfo->SelfMimoPs = 3;
+	pHTInfo->self_mimo_ps = 3;
+	if (pHTInfo->self_mimo_ps == 2)
+		pHTInfo->self_mimo_ps = 3;
 	ieee->bTxDisableRateFallBack = 0;
 	ieee->bTxUseDriverAssingedRate = 0;
 
@@ -300,7 +300,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	else
 		pCapELE->ChlWidth = (pHT->bRegBW40MHz ? 1 : 0);
 
-	pCapELE->MimoPwrSave		= pHT->SelfMimoPs;
+	pCapELE->MimoPwrSave		= pHT->self_mimo_ps;
 	pCapELE->GreenField		= 0;
 	pCapELE->ShortGI20Mhz		= 1;
 	pCapELE->ShortGI40Mhz		= 1;
@@ -377,7 +377,7 @@ void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
 		pHTInfoEle->RIFS			= 0;
 		pHTInfoEle->PSMPAccessOnly		= 0;
 		pHTInfoEle->SrvIntGranularity		= 0;
-		pHTInfoEle->OptMode			= pHT->CurrentOpMode;
+		pHTInfoEle->OptMode			= pHT->current_op_mode;
 		pHTInfoEle->NonGFDevPresent		= 0;
 		pHTInfoEle->DualBeacon			= 0;
 		pHTInfoEle->SecondaryBeacon		= 0;
@@ -623,7 +623,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 				   ieee->dot11HTOperationalRateSet, pMcsFilter);
 	ieee->HTCurrentOperaRate = ieee->HTHighestOperaRate;
 
-	pHTInfo->CurrentOpMode = pPeerHTInfo->OptMode;
+	pHTInfo->current_op_mode = pPeerHTInfo->OptMode;
 }
 
 void HTInitializeHTInfo(struct rtllib_device *ieee)
@@ -637,7 +637,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 
 	pHTInfo->bCurShortGI20MHz = false;
 	pHTInfo->bCurShortGI40MHz = false;
-	pHTInfo->bForcedShortGI = false;
+	pHTInfo->forced_short_gi = false;
 
 	pHTInfo->bCurSuppCCK = true;
 
@@ -774,7 +774,7 @@ void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
 
 	if (pHTInfo->bCurrentHTSupport) {
 		if (pNetwork->bssht.bd_ht_info_len != 0)
-			pHTInfo->CurrentOpMode = pPeerHTInfo->OptMode;
+			pHTInfo->current_op_mode = pPeerHTInfo->OptMode;
 	}
 }
 EXPORT_SYMBOL(HT_update_self_and_peer_setting);
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 5aad9263bed1..c8a8fad35cb5 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -358,7 +358,7 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 	if (!pHTInfo->bCurrentHTSupport || !pHTInfo->bEnableHT)
 		return;
 
-	if (pHTInfo->bForcedShortGI) {
+	if (pHTInfo->forced_short_gi) {
 		tcb_desc->bUseShortGI = true;
 		return;
 	}
@@ -440,7 +440,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 			break;
 		}
 		if (pHTInfo->bCurrentHTSupport  && pHTInfo->bEnableHT) {
-			u8 HTOpMode = pHTInfo->CurrentOpMode;
+			u8 HTOpMode = pHTInfo->current_op_mode;
 
 			if ((pHTInfo->bCurBW40MHz && (HTOpMode == 2 ||
 			     HTOpMode == 3)) ||
-- 
2.37.3

