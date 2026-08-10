Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A639BFE7
	for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345835; cv=none; b=q082p51IOgn9nWJAgE6nAK/sAzOQP+c7EobfuxxSbPJL2bgYstUJAbzo9cY1T1QshSBk9Vxcm3Rq9cOK+ddi4vP5z852YaLuiODdJY8rSI1GTN5Dtjem+n1ztVPCrq7qwd0RqqLj/XRLZ+SnHojqDBN0rMySymFI92Dh63dhkgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345835; c=relaxed/simple;
	bh=bpIjd0JSD5iJRN7x9LGStehSlvHl6S8vFDF2XG8IT5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AAcZ7xw7tGB5oi3FsSrsOwnO29vGOua5OVxhNyLHekDL2/K4vaprJgUY2Bv+DrClSQIUmAGgRH4aax/z1dSDRK68egQbHjRC4hrXg3fjTZVEu+tAym8w4pFS0bQqw73So9qT+4R5rH89B01SJb5fdwlEwivUPh5E15CU6d0o3lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAsPn0Tj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAsPn0Tj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1244151a91.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345833; x=1786950633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9nB2oQTUrELANq8ic+RN9MK7QqxEtLte4dfvgMoHiU=;
        b=kAsPn0TjcFEYX8Nyu4vngk96gM9HXtxojIItmx12GaHccrIVsPd1/PHzn80mA/uVyy
         wVNhG07BYc9qNapYSccmzJ7hBMrRkLF0Ejjax0EhlQZ3Tgcgykn4jNzX3MTm3pdnSiom
         k6cCVtIj/qDD5jL9l+bTajh1beZTOclvh1vdsFUE3HkeIkGWanTf5PvbahMSQ0PyqrFd
         C4L6dogpcFsFpAwANJYhEjWlfKjYO08n5tP1hPg8wZ8jiLs02pGOHemF5Yc5WfQ0mtso
         W9HnvExIiiyIVKQ8MNNh3O0dAdnMan4ns/L2c/3b9DozVGAIEMa3zyBMOEQz940lEazK
         faPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345833; x=1786950633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9nB2oQTUrELANq8ic+RN9MK7QqxEtLte4dfvgMoHiU=;
        b=N0OZM4eAcx67pYrp5EbUFmIKi50WZdyLJ5jKHLFpuMhX4u4wrB5leyCKhSMzwheksB
         z9S3jbUSYqZI39L4DeGLBf1nWs2b0WtCA/+JgxjYCO+i3YHSKGEBRMIaqH8IhGHy/kBy
         Ptg8Al01Z66gtpnC0AYXtnrnCtS6usZzs1au7N3pBrTBoEokhIcOC9GCslb9zmwvU0/R
         S6HgZT1MFjVfzaWncI/poBrqt+nwLTGcLrXdVmUF+q1H+SU0V2o0qemgYCavG99q14mD
         xRGfpAxUMjylYJwEfRqPZVwQknUhPBwVjjjQVAm4pTTiBZZc/QUHZPV8xQAJcUjOMw9j
         S8mw==
X-Gm-Message-State: AOJu0Yx8DeMRYqtl403a69szP/y6x0fsiqeOa7D7NLWLJL883qmICzO5
	TjzR7+evO9jQ26Q1j2WK52Z7KRIOe5hJku4siScn7JkbrvsDM2cJLHh3DDt3Rg==
X-Gm-Gg: AR+sD112sG8vTTNuKvQQi0hgeVWqdR377xE6aaToCn//qiXIbsclOphH6FBW4fH1FkB
	lcKYf9WaDunHIRi+SQ4mYYix6TE5LMOv/B4wTlX/fDN/NyTMUkVisojVFAMjdVKf5OzGKrxdrFY
	41inh2YislgDJCyXZoHjrvM6bErUIg0eS+/eHaQAPFZGDK0tNuPgJAm2TUAp+DtG3eQkamtJNAI
	AAqkX4+nXdACVCQgK8zJRYa1n83WsL3QvQ/DMuTFp3NdUNWpXYSfLAaoo0Eknhu3ns3/JVkzdio
	YUBnZxdef+0jLxTDqSmk1Tm5iDK61pNPmoIOgR+0Nme1I9hgKI4UOTTs8xejC7Vo06ubM8eAXC/
	6di8EORtadLSZbPjdhqYJvR5OZ58zGotJvIeqvz12e/q9JU7ztICofdprrC66Z+K5krrRnOieMG
	Pk47a52RIZ2pEixg8VO09mOzXoXkJ90svVWQCp6CilEpC1yO+0tUSTTraBe4gRdA==
X-Received: by 2002:a17:90b:3d91:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3928461bf33mr7453914a91.5.1786345833007;
        Mon, 10 Aug 2026 00:10:33 -0700 (PDT)
Received: from localhost ([103.210.95.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085c393d5sm13679304a91.0.2026.08.10.00.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:10:32 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in HalBtc8723b2Ant.c
Date: Mon, 10 Aug 2026 12:39:17 +0530
Message-ID: <20260810070917.114190-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary curly braces around single statement if/else
blocks throughout the file, as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 118 +++++++-----------
 1 file changed, 48 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 6da6940c9043..56d6e79a6008 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -35,49 +35,43 @@ static u8 halbtc8723b2ant_BtRssiState(
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (btRssi < rssiThresh) {
+			if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preBtRssiState;
-		}
 
 		if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preBtRssiState == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (btRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				btRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (btRssi < rssiThresh) {
+			else if (btRssi < rssiThresh)
 				btRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (btRssi < rssiThresh1) {
+			if (btRssi < rssiThresh1)
 				btRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				btRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -104,49 +98,43 @@ static u8 halbtc8723b2ant_WifiRssiState(
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else {
-			if (wifiRssi < rssiThresh) {
+			if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	} else if (levelNum == 3) {
-		if (rssiThresh > rssiThresh1) {
+		if (rssiThresh > rssiThresh1)
 			return pCoexSta->preWifiRssiState[index];
-		}
 
 		if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
 		) {
-			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
-			}
 		} else if (
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_MEDIUM) ||
 			(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_MEDIUM)
 		) {
-			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT)) {
+			if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
 				wifiRssiState = BTC_RSSI_STATE_HIGH;
-			} else if (wifiRssi < rssiThresh) {
+			else if (wifiRssi < rssiThresh)
 				wifiRssiState = BTC_RSSI_STATE_LOW;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
-			}
 		} else {
-			if (wifiRssi < rssiThresh1) {
+			if (wifiRssi < rssiThresh1)
 				wifiRssiState = BTC_RSSI_STATE_MEDIUM;
-			} else {
+			else
 				wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
-			}
 		}
 	}
 
@@ -168,7 +156,7 @@ static void halbtc8723b2ant_LimitedRx(
 	u8 rxAggSize = aggBufSize;
 
 	/*  */
-	/* 	Rx Aggregation related setting */
+	/*	Rx Aggregation related setting */
 	/*  */
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg);
 	/*  decide BT control aggregation buf size or not */
@@ -181,7 +169,7 @@ static void halbtc8723b2ant_LimitedRx(
 
 static void halbtc8723b2ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
@@ -318,11 +306,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			} else if (pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_2ANT_COEX_ALGO_A2DP;
 			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 2) {
@@ -332,11 +319,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 			} else if (pBtLinkInfo->bA2dpExist) {
 				algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
 			} else if (pBtLinkInfo->bPanExist) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_SCO;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			}
 		} else {
 			if (
@@ -348,20 +334,18 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bHidExist &&
 				pBtLinkInfo->bPanExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			} else if (
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_A2DP_PANHS;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_A2DP;
-				}
 			}
 		}
 	} else if (numOfDiffProfile == 3) {
@@ -388,11 +372,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID_A2DP;
-				} else {
+				else
 					algorithm = BT_8723B_2ANT_COEX_ALGO_HID_A2DP_PANEDR;
-				}
 			}
 		}
 	} else if (numOfDiffProfile >= 3) {
@@ -417,7 +400,7 @@ static void halbtc8723b2ant_SetFwDacSwingLevel(
 	struct btc_coexist *pBtCoexist, u8 dacSwingLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	/*  There are several type of dacswing */
 	/*  0x18/ 0x10/ 0xc/ 0x8/ 0x4/ 0x6 */
@@ -430,7 +413,7 @@ static void halbtc8723b2ant_SetFwDecBtPwr(
 	struct btc_coexist *pBtCoexist, u8 decBtPwrLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	H2C_Parameter[0] = decBtPwrLvl;
 
@@ -473,16 +456,14 @@ static void halbtc8723b2ant_SetSwRfRxLpfCorner(
 	bool bRxRfShrinkOn
 )
 {
-	if (bRxRfShrinkOn) {
+	if (bRxRfShrinkOn)
 		/* Shrink RF Rx LPF corner */
 		pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1e, 0xfffff, 0xffffc);
-	} else {
+	else
 		/* Resume RF Rx LPF corner */
 		/*  After initialized, we can use pCoexDm->btRf0x1eBackup */
-		if (pBtCoexist->bInitilized) {
+		if (pBtCoexist->bInitilized)
 			pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1e, 0xfffff, pCoexDm->btRf0x1eBackup);
-		}
-	}
 }
 
 static void halbtc8723b2ant_RfShrink(
@@ -504,7 +485,7 @@ static void halbtc8723b2ant_SetSwPenaltyTxRateAdaptive(
 	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
 )
 {
-	u8 	H2C_Parameter[6] = {0};
+	u8	H2C_Parameter[6] = {0};
 
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
@@ -743,7 +724,7 @@ static void halbtc8723b2ant_SetFwIgnoreWlanAct(
 	struct btc_coexist *pBtCoexist, bool bEnable
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	if (bEnable)
 		H2C_Parameter[0] |= BIT(0);		/*  function enable */
@@ -775,7 +756,7 @@ static void halbtc8723b2ant_SetFwPstdma(
 	u8 byte5
 )
 {
-	u8 	H2C_Parameter[5] = {0};
+	u8	H2C_Parameter[5] = {0};
 
 	H2C_Parameter[0] = byte1;
 	H2C_Parameter[1] = byte2;
@@ -824,7 +805,7 @@ static void halbtc8723b2ant_SetAntPath(
 	u32 fwVer = 0, u4Tmp = 0;
 	bool bPgExtSwitch = false;
 	bool bUseExtSwitch = false;
-	u8 	H2C_Parameter[2] = {0};
+	u8	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
@@ -2197,13 +2178,11 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 {
 	u8 algorithm = 0;
 
-	if (pBtCoexist->bManualControl) {
+	if (pBtCoexist->bManualControl)
 		return;
-	}
 
-	if (pCoexSta->bUnderIps) {
+	if (pCoexSta->bUnderIps)
 		return;
-	}
 
 	algorithm = halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
 	if (pCoexSta->bC2hBtInquiryPage && (algorithm != BT_8723B_2ANT_COEX_ALGO_PANHS)) {
@@ -2221,9 +2200,8 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	if (halbtc8723b2ant_IsCommonAction(pBtCoexist)) {
 		pCoexDm->bAutoTdmaAdjust = false;
 	} else {
-		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm) {
+		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm)
 			pCoexDm->bAutoTdmaAdjust = false;
-		}
 
 		switch (pCoexDm->curAlgorithm) {
 		case BT_8723B_2ANT_COEX_ALGO_SCO:
-- 
2.55.0

