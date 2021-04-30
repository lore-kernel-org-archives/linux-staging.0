Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86372F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gx5so13548241ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A8UHA9rSzQVhyxXvVNgcpiOrcASMmZu8u6+fbC09MUc=;
        b=PuMu0kJIhztQnU0ZMn3dZsNib7K9itM3uniM3T4z02MkaToBQlY73DeS4BIXS7wVKw
         yLzcl3gqeyjnZshQLnVeO3Tvd16eNWmwt1eNdayEf8B1HpS35s4qsUPsOaLX+GgB8LP9
         9xFMxuS/f+RImsDif/gyNUHq5PmvlrFasGv99pgWUuFY7CDqExiydVmZ/Y3U3zRWv8CW
         uuy8sLWQC9il11TmohoK0ndsii7YIc8SAoqIjz04IKFcUbVgz7qfzqtUMUvf9htzlTsM
         SmXt5WueJnT9g8OLdsnoZslCU/bpwlUW1k7CoGMdgjOEi1ZMOVdGG1JPGt7BpDyOwcoF
         p3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8UHA9rSzQVhyxXvVNgcpiOrcASMmZu8u6+fbC09MUc=;
        b=pxFwuZrY1Nu099MBUJilVYQKXYr+sLWrgoloC3F9pob9iCMyb+vDWSD1qFOu11uN56
         nvBkNdKroAfJlIWVvBxqvJtvHB8BRZkLP2SbGbgv/lWlCCi4wP4IBcrE0X60g1GOXa1X
         Ev3wgBwb1d9C9wHszkByOxSP+5NUwiU7zSSUM4ch0rV5e82Gmj8l1uii/r8KnMgnLueS
         vAaf0eAi68VUtZjs20eVevFrQScS9enDu83sxY/nzCk2ABExf0L6GymT4y4C3sSd3D3H
         zCUR0jFIih11qmD0FFkTuHBq8n0aAyM+ifdEZKKVjjNT2r9jU5JCI99eo//cKCqw9Ezu
         iESA==
X-Gm-Message-State: AOAM5312Ko6lR8I1FTof01avSvOE2e7/XuF4Mw0phAg8TvombD2hrbyI
	O7VMtjpgiWOh/kq9cPxBd1A=
X-Google-Smtp-Source: ABdhPJx08sC+svdFaU0I9I14aV2BPr0sD9/jTxbE+tjwspk5PhxFE0pXNOjC7PpffVy47U51SO1yKw==
X-Received: by 2002:a17:906:f01:: with SMTP id z1mr59313eji.535.1619793889354;
        Fri, 30 Apr 2021 07:44:49 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id ck4sm616122edb.56.2021.04.30.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/43] staging: rtl8723bs: remove commented out BTC_PRINT logs
Date: Fri, 30 Apr 2021 16:43:53 +0200
Message-Id: <6879b04d65e595c9903ac0c8d8b6d96d3c13fff1.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

