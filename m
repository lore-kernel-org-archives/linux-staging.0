Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9272F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:44 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id d14so17691235edc.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8UHA9rSzQVhyxXvVNgcpiOrcASMmZu8u6+fbC09MUc=;
        b=Fg6Ag5znNlFFxSDmFsZ4E8L0shdlBl2MpkjpcHv0hi9VqvuUibO+yrH676D9xQu32i
         f3f57I8ZYzHo6Ojh2kF24dhFg3EPrBXfr0D2CSSQolw9nJKq2Guu+vXFc58qsfCSbgsk
         RevLQZpsTdLMjfNKk33AOJb0GDXqfpY0mqYtAiggiz9Ru7XxhFOZcQbkAYpU7P7TTvqX
         SixJ61KH8d4bL63aoKQZKjQQ+Y/XL5Hqwt2Gh4+s67rrMb+ptCeKLmXgMOwfXfsGsEpd
         FUh8+/n6GUJYODxZvFwTSkc43xGRhH+NYFhyvMYylIHC5zV80mc4Ndn6gmoV05b4tZMM
         MG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8UHA9rSzQVhyxXvVNgcpiOrcASMmZu8u6+fbC09MUc=;
        b=RLMPe0E3ko+8SH/CPfQEKT4dqs0wIdqRuwprlPacohEyanjeRoGH4WiAIT2aMjjCFU
         2F18DMPLJbxj81f2YzucCTz5x43WKBkQ2QHIUQwCh/mGyjOcrlTi0T7hPKananHsQduu
         OT81rDdJ4Igpw0FlJpWi4jW6PMPGGLDnglM8qUGYfb77YyYnMQA3LPyEkrMEXPyj52sn
         EIMGQ17RDiE2X9LHxWeQ1UK3z+S+H4Ftf5G6rSESN3NRG9vBghC0I75vsGM71Sw7ALV9
         XOgY7kc+TRWM3pKID+a6hBp6MdxK+Mx9fBXo9fhRM3Hh1g0h5d6Y14vKDaqc6zzcF9DG
         LaQQ==
X-Gm-Message-State: AOAM532qI0SkY8/UpbM0r2gk8iU3cdAvdBCYyR553EHat/2vdseb7x7k
	5gajXj03Mh92I/6GF+tK3LzJAJMonw/s9A==
X-Google-Smtp-Source: ABdhPJzcEH2H2XjHXP00X5BUtngMTgHL+nYW3C30pFooI75WFNnK+95fsnKLxceRoEnELij7z7wKwg==
X-Received: by 2002:a05:6402:1547:: with SMTP id p7mr4158138edx.319.1619768683146;
        Fri, 30 Apr 2021 00:44:43 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id ga31sm1398146ejc.10.2021.04.30.00.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/43] staging: rtl8723bs: remove commented out BTC_PRINT logs
Date: Fri, 30 Apr 2021 09:43:41 +0200
Message-Id: <58d9c623560e7ce7f3f27f2aa254de0ff7eb9011.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
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

