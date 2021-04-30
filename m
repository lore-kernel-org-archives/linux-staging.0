Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A828F2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:46 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id n2so105693007ejy.7
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8UHA9rSzQVhyxXvVNgcpiOrcASMmZu8u6+fbC09MUc=;
        b=QNKtYrJwpzJIhGfaCu2AIoSrRmMMmcc+orkeyaOJO6kovvcf4owrfJGyNmrf8l8ve6
         Rpcvorp+71ab0K9TTNxozGFpcmFld5pPZIt91Toy4F2BCtThayBS6JEu6CaIVSilI8Qa
         9fKAp7B7THyv8oTR9bBNvKnCtMUhIyfwQApfQH77Z4gNbrF3wUzMYlQyCIKicA0rr/A4
         jJn/GmJ2lkEgbqvIoAKGKvugCcVkyZEw/cbTBcWT7cHXun7rn/Y4LSVeRZPhuzMjCSsa
         Oo7qQ38ViBVqkdbdB+sYbZeIPVTy7dyZgUQ2+tBQUBRGFM14uqT/jUYOAOmUDIwSsYFN
         Yxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8UHA9rSzQVhyxXvVNgcpiOrcASMmZu8u6+fbC09MUc=;
        b=S+D7m4UvxIqN96iRQslLGvm/Sq+Eec+vn7IvgtCX5ygmgR6pqyjeCTVb69NkSqEqSn
         WyjwbCb2iSgQvGwB/ZS8U7v3luX5Nvukg/gDhaigmR5OnDn/kNa/CLqjbqB4nymzqQlL
         CwjGm/xEE9ozSVqGe7JUOauJdF10hgwJSenbMAann9xrsquh74wSGktdR/R2ZkT9XgMG
         C0Xznkip8FYp6wigb523fvfwTUKQsgb9vbtV6TYtrSgAhhjFwigA+bKf8FN0MZb44X89
         D9NAOetA/R642wSwouGVsQqykp/SUYf0iGrmNfU1Q0TYM5Y1dFoCpv8BNgPhBuDMsq4M
         bqLA==
X-Gm-Message-State: AOAM533kpfo02tF5eFmBjC9v4K/DPzDvJSHL/LbAMtXmox3lNulP5+AH
	Mznnl7UlI2lBd9RUF8ZiTKQ=
X-Google-Smtp-Source: ABdhPJwPlV/kCn/OoDI2uihBUpdxNlamAyX32vJFeWR7guNxAdkh1cKAuzIn/XnyCU89Id2Mnf0zfw==
X-Received: by 2002:a17:907:8323:: with SMTP id mq35mr4825638ejc.391.1619794665346;
        Fri, 30 Apr 2021 07:57:45 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id zo6sm2096714ejb.77.2021.04.30.07.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/43] staging: rtl8723bs: remove commented out BTC_PRINT logs
Date: Fri, 30 Apr 2021 16:56:45 +0200
Message-Id: <dd6ea6b65cb7db15254ac6ab3fbdfcabb7e66a1a.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out BTC_PRINT logs.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 911d753e51f6..300327f8706c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1055,8 +1055,6 @@ static void halbtc8723b1ant_PsTdma(
 	s8 nWiFiDurationAdjust = 0x0;
 	/* u32 		fwVer = 0; */
 
-	/* BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE_FW, ("[BTCoex], %s turn %s PS TDMA, type =%d\n", */
-	/* 	(bForceExec? "force to":""), (bTurnOn? "ON":"OFF"), type)); */
 	pCoexDm->bCurPsTdmaOn = bTurnOn;
 	pCoexDm->curPsTdma = type;
 
@@ -1423,9 +1421,6 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 		/* acquire the BT TRx retry count from BT_Info byte2 */
 		retryCount = pCoexSta->btRetryCnt;
 		btInfoExt = pCoexSta->btInfoExt;
-		/* BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE_FW_DETAIL, ("[BTCoex], retryCount = %d\n", retryCount)); */
-		/* BTC_PRINT(BTC_MSG_ALGORITHM, ALGO_TRACE_FW_DETAIL, ("[BTCoex], up =%d, dn =%d, m =%d, n =%d, WaitCount =%d\n", */
-		/* 	up, dn, m, n, WaitCount)); */
 
 		if (pCoexSta->lowPriorityTx > 1050 || pCoexSta->lowPriorityRx > 1250)
 			retryCount++;
@@ -2788,13 +2783,11 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	}
 
 	if (BTC_SCAN_START == type) {
-		/* BTC_PRINT(BTC_MSG_INTERFACE, INTF_NOTIFY, ("[BTCoex], SCAN START notify\n")); */
 		if (!bWifiConnected)	/*  non-connected scan */
 			halbtc8723b1ant_ActionWifiNotConnectedScan(pBtCoexist);
 		else	/*  wifi is connected */
 			halbtc8723b1ant_ActionWifiConnectedScan(pBtCoexist);
 	} else if (BTC_SCAN_FINISH == type) {
-		/* BTC_PRINT(BTC_MSG_INTERFACE, INTF_NOTIFY, ("[BTCoex], SCAN FINISH notify\n")); */
 		if (!bWifiConnected)	/*  non-connected scan */
 			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
 		else
@@ -2844,11 +2837,8 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 	}
 
 	if (BTC_ASSOCIATE_START == type) {
-		/* BTC_PRINT(BTC_MSG_INTERFACE, INTF_NOTIFY, ("[BTCoex], CONNECT START notify\n")); */
 		halbtc8723b1ant_ActionWifiNotConnectedAssoAuth(pBtCoexist);
 	} else if (BTC_ASSOCIATE_FINISH == type) {
-		/* BTC_PRINT(BTC_MSG_INTERFACE, INTF_NOTIFY, ("[BTCoex], CONNECT FINISH notify\n")); */
-
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 		if (!bWifiConnected) /*  non-connected scan */
 			halbtc8723b1ant_ActionWifiNotConnected(pBtCoexist);
-- 
2.20.1

