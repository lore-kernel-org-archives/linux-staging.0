Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E602F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:47 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id q6so23659224edr.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=auqmHaougiorEJiold25Fwbfcoe9phFoSmF9xCEzReU=;
        b=Hp7VAnboDNvGyraKpj+1SLEakveg+O/oIvx6JL6f/ON1JjJdsb/i8uujyLxX+0dRpW
         GMix+bWECTou1Di7bp5lNn5M1VZZiGVWm4Ic4ZGxnyjabmEN5NacDwYUccRQLwgh4XkE
         lUQCMYyLH5X8Iph3g7iT6KQvmVJ9+J1na9cV6GCwCMzhebDTbjygbSc2v9i8czPv59YP
         sb9dX550SGQMDBTuqlCtnzx3PUL67e3wTswETNaWl8KYZD9vn05zWKCtVdAi7xRYZTQr
         pwJiQIOj7wqnzAtwd6Fso4/DmEH7DZOrqlA3mQlN11cULTvmag3DMCEHR2cNaPqWYIvg
         +ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=auqmHaougiorEJiold25Fwbfcoe9phFoSmF9xCEzReU=;
        b=rkCcOF4t2rWE3WhtNVA7yVkR1I1Gy7ZoaUmpRmzRVd5UdSKTjHhu2qfzQMIxf/6v+A
         hOGA4ADYtKCw7491rPmTcYj3lv7pER9xO0XSqLye+A0rfmjlN7HQJQVfGsWj02vEBfMp
         TX/rfxSrNGSzwuFCbY6cJV+4biru1W30V0m3TcHmYZJhkybT/pFITh4nyO4MtA2aVNs2
         9BCZV/nHCyEbWqjZU1DmWzFam5YDb4SLmoXB2Y242YyzvWyMpLv932uFdKlO9KlJrC4A
         g2c8cDb1knnjqDmyCM6k4noc1s/T8oZtcnmR2YOS+mSURjJtvF6tCyd0JwBB2cuYN7Hv
         3i+A==
X-Gm-Message-State: AOAM530QOFXlYTrCXsKlfV1Ez67rHo3WymabTX3rp49Snl4ozsO2wEaW
	Tpwfq+8sMks4KRqzSe0CM78=
X-Google-Smtp-Source: ABdhPJzkCNGnj7vT5J761jhzNfxxexpO2oqIqRm3zEWN9WKG7Xs6UfO/0griXzOYFZGH+MnU1YdL/Q==
X-Received: by 2002:aa7:ccc4:: with SMTP id y4mr6244576edt.171.1619793886311;
        Fri, 30 Apr 2021 07:44:46 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id mp36sm1985859ejc.48.2021.04.30.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/43] staging: rtl8723bs: remove empty if-else blocks after BTC_PRINT removal
Date: Fri, 30 Apr 2021 16:43:51 +0200
Message-Id: <0f900bf15be532f2f224ae17c8fb7615dbca225f.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove if-else blocks left empty after BTC_PRINT removal.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 16 +---------------
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 12 +-----------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 28f41a637c96..57579d7eab71 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -606,8 +606,7 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
-				} else {
+				if (!bBtHsOn) {
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
 				}
 			}
@@ -1063,10 +1062,6 @@ static void halbtc8723b1ant_PsTdma(
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
 
-	if (pCoexDm->bCurPsTdmaOn) {
-	} else {
-	}
-
 	if (!bForceExec) {
 		if (
 			(pCoexDm->bPrePsTdmaOn == pCoexDm->bCurPsTdmaOn) &&
@@ -1373,10 +1368,6 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 
 		bCommon = true;
 	} else {
-		if (bWifiBusy) {
-		} else {
-		}
-
 		bCommon = false;
 	}
 
@@ -1528,7 +1519,6 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 1);
 				pCoexDm->psTdmaDuAdjType = 1;
 			}
-		} else {	  /* no change */
 		}
 
 		if (
@@ -3012,10 +3002,6 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 		pCoexSta->btInfoC2h[rspSource][i] = tmpBuf[i];
 		if (i == 1)
 			btInfo = tmpBuf[i];
-		if (i == length - 1)
-			{}
-		else
-			{}
 	}
 
 	if (BT_INFO_SRC_8723B_1ANT_WIFI_FW != rspSource) {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 73f1cc6bc27c..15304feb2442 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -1621,8 +1621,7 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 
 		if (!bScan && !bLink && !bRoam)
 			halbtc8723b2ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType);
-		else {
-		}
+
 	}
 }
 
@@ -2859,10 +2858,6 @@ void EXhalbtc8723b2ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 	u8 wifiCentralChnl;
 	u8 apNum = 0;
 
-	if (BTC_MEDIA_CONNECT == type) {
-	} else {
-	}
-
 	/*  only 2.4G we need to inform bt the chnl mask */
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U1_WIFI_CENTRAL_CHNL, &wifiCentralChnl);
 	if ((BTC_MEDIA_CONNECT == type) && (wifiCentralChnl <= 14)) {
@@ -2889,8 +2884,6 @@ void EXhalbtc8723b2ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 
 void EXhalbtc8723b2ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (type == BTC_PACKET_DHCP) {
-	}
 }
 
 void EXhalbtc8723b2ant_BtInfoNotify(
@@ -2915,9 +2908,6 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		if (i == 1)
 			btInfo = tmpBuf[i];
 
-		if (i == length - 1) {
-		} else {
-		}
 	}
 
 	if (pBtCoexist->bManualControl) {
-- 
2.20.1

