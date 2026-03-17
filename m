Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700423EAA6
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779870; cv=none; b=GALH3XAbjs88I6gk34z5aueu4dEzmPQ5sWeqb785xgKwgt6KsTS6eEtZMDCN6vniDcHqWLpKHeb+lUNuR+EYnAQLnb0/qsk4FujINOF1jpYwmfdGWxfy875Y0bokWhUCpWrg5kh2UzRJw/t1t/MIA6lPoEN7DWVq15pOa4DLt28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779870; c=relaxed/simple;
	bh=eylZyckuOxlb47mlUouWOK+xDBYh34o6D3PmyUDOPdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sp1Ls57vW7WOQMGJZPU3S4tuOER7YAi7zai4cb7iQZkc9bq+6ZzHY3wuN7nOn8V0JL2lOK9c01dIqN4p1pIVoqT/T54E314RNzxV4aCaOYnsRzlf7gaOSypT5F4eIXWQ72wGr3ANUZ1VRDoGNW47YVXD2EYg0uxOm8atEfGv3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvTQqdUq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvTQqdUq"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2793d0d6fso429812e87.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779867; x=1774384667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DdNFO+2ydakR+PDJC3cXORVt9OpIgJn/oZez6SnVYdQ=;
        b=cvTQqdUq/xDSS1Ln958R2fVlCdrXXaA3+s91Xm6iPnh8679fnLIpb5PwuN7HAr5wdf
         2eI6SuTgvFFaFurrFJzlpo78X9a1zrqLFzDUac+25iTbyQAjQQbCrpXrE6DngXnDqB1Q
         GPwFbikNODdvjFmQUt5XJvkVp0Vg30weOGaPXWgzSCphwk/+fq+gJYG111Ti4MPTIkHT
         5SaOU3fdhVQWfWV74jLDjWTwQeZwRqw3NeJXZpiIBsnq3vl0pyjeLUhvdOe1zcrJ/jm9
         Yn7VEABAsAluGiRNFshGsMAUJGMWK5zV6Gw7Z1rjl5tdE7gVYL0l3TP8hRoRITO+N3ZI
         LlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779867; x=1774384667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdNFO+2ydakR+PDJC3cXORVt9OpIgJn/oZez6SnVYdQ=;
        b=qjwKk2lNNvpYNeKS8jzUTCaIz09HyypdQEr89rb8UQt1PaNfANe0wuV5ZIeDNysY82
         lpap5nJqpFLxW6xRgeimuz/xErEziWtevrIAyw/MEeHq7wBR4N1/44d7R6iDYLzrvSVK
         dPveqj+rprPfS24U0ixv2Mil/rK8whoTQbE4kBsQ63VykJCQPiflwgiZfA5AO9yvCvCh
         3tB60QzNC0I9GUdTVysaosFB4h4LPTDcbY1y2/+8TktgbKJ0aZXGeAnWgtQSjY6M/prQ
         O+sc7+NH2ViiET2I2Xyu/UJdBHzg6SrK+g4/cldP9YwFKzxCe+Sbe4beNsL9SYsPNUfB
         nUPA==
X-Forwarded-Encrypted: i=1; AJvYcCVkegahUqlsAb5LkOLjqFNQIWgAUUvKQRBO2dEyMmCCYLBTbpPplJcXaMqBeWpzh9MBKHBlWhDqx4L3/H9z@lists.linux.dev
X-Gm-Message-State: AOJu0YxmW8XCtlV12ShnNGLuERjIFz6h4SvE/2lPOYUL8FbUoSnNa+kr
	ixAPpXuzj6QhGvQTo8M8cPuSBFOsgINiXevbJMMeFrjEjfJI+KZFdWsv
X-Gm-Gg: ATEYQzxTnU/NG/Fx0NZp33sizMP6Lc7AIr8Jz6ebq4MpTQXgeOIw4X+whKTMAKnWkbR
	bkkbxw8MiC81Hn7R3qTPy5tJuX70/xONOZjrbDRi1XGCx7MghpTuu4HiGdKyCUp/bP5dqK+UzPJ
	gDQq+bQxgO0XoiPdINPtvbX7wc57qBzlWaMMP9VUck6L/1zPhyN/eckapqMmeju0ZdKQXFS69I9
	0M7e9p7fL5TSCm923W2O9DnogCMfiW5EmFgiD19ICmv+IsDGWfxSthAXXmvT5ec8soG6FoQwgGc
	QtKrLgUGV1nUJeQEqZu3lOncO0p+LqBS1sMlSEUbW8WzNQxIMFbAyHMMjdpKnZxB0mN51i9eWD9
	RP9FQ0n53IRIhCB353zeFx5hDeaZPZxF1J+7WOnU4RixritqPL6mTBiXnIy6Z87isjuOIlFWsea
	xvZZgBxyxVNDUF/eOG0I4M2R6iH0946xJ+NlV3xT2THQu2hCQ67xlZDeJ04JNIIdwBtYA56Moug
	g==
X-Received: by 2002:a2e:7809:0:b0:383:20cd:52fe with SMTP id 38308e7fff4ca-38bd58563d3mr3363001fa.17.1773779866514;
        Tue, 17 Mar 2026 13:37:46 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5156dedsm1784891fa.3.2026.03.17.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:37:45 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in single statement blocks
Date: Tue, 17 Mar 2026 21:37:15 +0100
Message-ID: <20260317203715.7430-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around single statement blocks throughout
the rtl8723bs driver to comply with kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   5 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 112 +++++++-----------
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |   3 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  21 ++--
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   9 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |   6 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   6 +-
 drivers/staging/rtl8723bs/hal/odm.c           |   4 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |   3 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |   3 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  42 +++----
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  12 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   3 +-
 13 files changed, 86 insertions(+), 143 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 1a52d3e1d285..5aa2f7e1b54a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1339,11 +1339,10 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 
 	}
 
-	if (ret == _FAIL) {
+	if (ret == _FAIL)
 		goto exit;
-	} else if (ret == RTW_RX_HANDLED) {
+	else if (ret == RTW_RX_HANDLED)
 		goto exit;
-	}
 
 
 	if (!psta) {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..c1ec8e3ddd61 100644
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
+			else if (wifiRssi < rssiThresh) {
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
 
@@ -294,9 +282,8 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 
-	if (!pBtLinkInfo->bBtLinkExist) {
+	if (!pBtLinkInfo->bBtLinkExist)
 		return algorithm;
-	}
 
 	if (pBtLinkInfo->bScoExist)
 		numOfDiffProfile++;
@@ -319,11 +306,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
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
@@ -333,11 +319,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
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
@@ -349,20 +334,18 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
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
@@ -389,11 +372,10 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
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
@@ -403,10 +385,8 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
-				} else {
+				if (bBtHsOn)
 					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
-				}
 			}
 		}
 	}
@@ -480,9 +460,8 @@ static void halbtc8723b2ant_SetSwRfRxLpfCorner(
 	} else {
 		/* Resume RF Rx LPF corner */
 		/*  After initialized, we can use pCoexDm->btRf0x1eBackup */
-		if (pBtCoexist->bInitilized) {
+		if (pBtCoexist->bInitilized)
 			pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1e, 0xfffff, pCoexDm->btRf0x1eBackup);
-		}
 	}
 }
 
@@ -2202,13 +2181,11 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
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
 	if (pCoexSta->bC2hBtInquiryPage && (BT_8723B_2ANT_COEX_ALGO_PANHS != algorithm)) {
@@ -2226,9 +2203,8 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	if (halbtc8723b2ant_IsCommonAction(pBtCoexist)) {
 		pCoexDm->bAutoTdmaAdjust = false;
 	} else {
-		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm) {
+		if (pCoexDm->curAlgorithm != pCoexDm->preAlgorithm)
 			pCoexDm->bAutoTdmaAdjust = false;
-		}
 
 
 		switch (pCoexDm->curAlgorithm) {
@@ -2406,11 +2382,10 @@ void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 
 void EXhalbtc8723b2ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (type == BTC_LPS_ENABLE) {
+	if (type == BTC_LPS_ENABLE)
 		pCoexSta->bUnderLps = true;
-	} else if (type == BTC_LPS_DISABLE) {
+	else if (type == BTC_LPS_DISABLE)
 		pCoexSta->bUnderLps = false;
-	}
 }
 
 void EXhalbtc8723b2ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -2486,9 +2461,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 
 	}
 
-	if (pBtCoexist->bManualControl) {
+	if (pBtCoexist->bManualControl)
 		return;
-	}
 
 	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW != rspSource) {
 		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [3:0] */
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a063..5d2562dae16a 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -118,9 +118,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	}
 
 	/* Calculate Average ThermalValue after average enough times */
-	if (ThermalValue_AVG_count) {
+	if (ThermalValue_AVG_count)
 		ThermalValue = (u8)(ThermalValue_AVG / ThermalValue_AVG_count);
-	}
 
 	/* 4 5. Calculate delta, delta_LCK */
 	/* delta" here is used to determine whether thermal value changes or not. */
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 8f6849f2277e..50e81a67138b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1108,9 +1108,8 @@ static void _PHY_SaveADDARegisters8723B(
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
 
-	for (i = 0 ; i < RegisterNum ; i++) {
+	for (i = 0 ; i < RegisterNum ; i++)
 		ADDABackup[i] = PHY_QueryBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord);
-	}
 }
 
 
@@ -1122,9 +1121,8 @@ static void _PHY_SaveMACRegisters8723B(
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		MACBackup[i] = rtw_read8(pDM_Odm->Adapter, MACReg[i]);
-	}
 	MACBackup[i] = rtw_read32(pDM_Odm->Adapter, MACReg[i]);
 
 }
@@ -1141,9 +1139,8 @@ static void _PHY_ReloadADDARegisters8723B(
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	for (i = 0 ; i < RegiesterNum; i++) {
+	for (i = 0 ; i < RegiesterNum; i++)
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, ADDABackup[i]);
-	}
 }
 
 static void _PHY_ReloadMACRegisters8723B(
@@ -1152,9 +1149,8 @@ static void _PHY_ReloadMACRegisters8723B(
 {
 	u32 i;
 
-	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 0 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		rtw_write8(padapter, MACReg[i], (u8)MACBackup[i]);
-	}
 	rtw_write32(padapter, MACReg[i], MACBackup[i]);
 }
 
@@ -1178,9 +1174,8 @@ static void _PHY_PathADDAOn8723B(
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[0], bMaskDWord, pathOn);
 	}
 
-	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++) {
+	for (i = 1 ; i < IQK_ADDA_REG_NUM ; i++)
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord, pathOn);
-	}
 
 }
 
@@ -1194,9 +1189,8 @@ static void _PHY_MACSettingCalibration8723B(
 
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], 0x3F);
 
-	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++) {
+	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++)
 		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT3)));
-	}
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT5)));
 
 }
@@ -1528,9 +1522,8 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm, bool is2T)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFFE0); /*  LDO OFF */
 
 	/*  Channel 10 LC calibration issue for 8723bs with 26M xtal */
-	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2) {
+	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO && pDM_Odm->PackageType >= 0x2)
 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Cal);
-	}
 
 	/* Restore original situation */
 	if ((tmpReg&0x70) != 0) { /* Deal with contisuous TX case */
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9c84f4cf1dda..012ddbae68a1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1026,15 +1026,14 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (pktType == PACKET_DHCP) {
+	if (pktType == PACKET_DHCP)
 		packetType = BTC_PACKET_DHCP;
-	} else if (pktType == PACKET_EAPOL) {
+	else if (pktType == PACKET_EAPOL)
 		packetType = BTC_PACKET_EAPOL;
-	} else if (pktType == PACKET_ARP) {
+	else if (pktType == PACKET_ARP)
 		packetType = BTC_PACKET_ARP;
-	} else {
+	else
 		return;
-	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
 /* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index dc2da49e6738..736d99d6cd4b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -323,9 +323,8 @@ static void PHY_StoreTxPowerByRateNew(struct adapter *padapter,	u32 RfPath,
 	if (RfPath >= RF_PATH_MAX)
 		return;
 
-	for (i = 0; i < rateNum; ++i) {
+	for (i = 0; i < rateNum; ++i)
 		pHalData->TxPwrByRateOffset[RfPath][rateIndex[i]] = PwrByRateVal[i];
-	}
 }
 
 static void PHY_StoreTxPowerByRateOld(
@@ -361,9 +360,8 @@ void PHY_StoreTxPowerByRate(
 
 	if (pDM_Odm->PhyRegPgVersion > 0)
 		PHY_StoreTxPowerByRateNew(padapter, RfPath, RegAddr, BitMask, Data);
-	else if (pDM_Odm->PhyRegPgVersion == 0) {
+	else if (pDM_Odm->PhyRegPgVersion == 0)
 		PHY_StoreTxPowerByRateOld(padapter, RegAddr, BitMask, Data);
-	}
 }
 
 static void
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..45634b5e5082 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -208,9 +208,8 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 		add_ratid(padapter, psta, rssi_level);
-	else {
+	else
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
-	}
 }
 
 void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
@@ -254,9 +253,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
-	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
+	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
 		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
-	}
 }
 
 void beacon_timing_control(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 639b6da2302b..859c816911e2 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -270,9 +270,9 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
 				continue;
 
-			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
+			if (ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB,
+					     false, &pstat->rssi_level))
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
-			}
 
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 994b8c578e7a..1e67e27994c7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -240,9 +240,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	if (is_cck_rate) {
 		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
 	} else {
-		if (rf_rx_num != 0) {
+		if (rf_rx_num != 0)
 			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
-		}
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..f4b2854bada7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -25,9 +25,8 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 	do {
 		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
+		if (valid == 0)
 			read_down = true;
-		}
 	} while ((!read_down) && (retry_cnts--));
 
 	return read_down;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 513d0c346c5e..87817bef180e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -197,9 +197,8 @@ static s32 polling_fwdl_chksum(
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & FWDL_ChkSum_rpt)) {
+	if (!(value32 & FWDL_ChkSum_rpt))
 		goto exit;
-	}
 
 	if (g_fwdl_chksum_fail) {
 		g_fwdl_chksum_fail--;
@@ -238,9 +237,8 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & WINTINI_RDY)) {
+	if (!(value32 & WINTINI_RDY))
 		goto exit;
-	}
 
 	if (g_fwdl_wintint_rdy_fail) {
 		g_fwdl_wintint_rdy_fail--;
@@ -1048,9 +1046,8 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	rate_bitmap = hal_btcoex_GetRaMask(padapter);
 	mask &= ~rate_bitmap;
 
-	if (pHalData->fw_ractrl) {
+	if (pHalData->fw_ractrl)
 		rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, psta->raid, psta->bw_mode, short_gi_rate, mask);
-	}
 
 	/* set correct initial date rate for each mac_id */
 	pdmpriv->INIDATA_RATE[mac_id] = psta->init_rate;
@@ -1203,9 +1200,9 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 
 	/*  Check 0x8129 again for making sure autoload status!! */
 	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
-	if (EEPROMId != RTL_EEPROM_ID) {
+	if (EEPROMId != RTL_EEPROM_ID)
 		pEEPROM->bautoload_fail_flag = true;
-	} else
+	else
 		pEEPROM->bautoload_fail_flag = false;
 }
 
@@ -1590,13 +1587,12 @@ u8 SCMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib)
 		if (pattrib->bwmode == CHANNEL_WIDTH_40) {
 			SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
 		} else if (pattrib->bwmode == CHANNEL_WIDTH_20) {
-			if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER) {
+			if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 				SCSettingOfDesc = HT_DATA_SC_20_UPPER_OF_40MHZ;
-			} else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) {
+			else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
 				SCSettingOfDesc = HT_DATA_SC_20_LOWER_OF_40MHZ;
-			} else {
+			else
 				SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
-			}
 		}
 	} else {
 		SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
@@ -1621,9 +1617,8 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 	/*  Thomas, Lucas@SD4, 20130515 */
 	count = 16;
 
-	for (index = 0; index < count; index++) {
+	for (index = 0; index < count; index++)
 		checksum |= le16_to_cpu(*(__le16 *)(usPtr + index));
-	}
 
 	ptxdesc->txdw7 |= cpu_to_le32(checksum & 0x0000ffff);
 }
@@ -1796,11 +1791,10 @@ static void rtl8723b_fill_default_txdesc(
 		ptxdesc->mbssid = pattrib->mbssid & 0xF;
 
 		ptxdesc->rty_lmt_en = 1; /*  retry limit enable */
-		if (pattrib->retry_ctrl) {
+		if (pattrib->retry_ctrl)
 			ptxdesc->data_rt_lmt = 6;
-		} else {
+		else
 			ptxdesc->data_rt_lmt = 12;
-		}
 
 		ptxdesc->datarate = MRateToHwRate(pmlmeext->tx_rate);
 
@@ -1891,9 +1885,8 @@ void rtl8723b_fill_fake_txdesc(
 		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
 	}
 
-	if (IsBTQosNull) {
+	if (IsBTQosNull)
 		SET_TX_DESC_BT_INT_8723B(pDesc, 1);
-	}
 
 	SET_TX_DESC_USE_RATE_8723B(pDesc, 1); /*  use data rate which is set by Sw */
 	SET_TX_DESC_OWN_8723B((u8 *)pDesc, 1);
@@ -2209,9 +2202,8 @@ void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len)
 #define	GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 6, 1)
 #define	GET_8723B_C2H_TX_RPT_RETRY_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 7, 1)
 
-	if (GET_8723B_C2H_TX_RPT_RETRY_OVER(pdata) | GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(pdata)) {
+	if (GET_8723B_C2H_TX_RPT_RETRY_OVER(pdata) | GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(pdata))
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
-	}
 /*
 	else if (seq_no != padapter->xmitpriv.seq_no) {
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
@@ -2578,9 +2570,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 			/*  Forece leave RF low power mode for 1T1R to prevent conficting setting in Fw power */
 			/*  saving sequence. 2010.06.07. Added by tynli. Suggested by SD3 yschang. */
-			if (psmode != PS_MODE_ACTIVE) {
+			if (psmode != PS_MODE_ACTIVE)
 				ODM_RF_Saving(&pHalData->odmpriv, true);
-			}
 
 			/* if (psmode != PS_MODE_ACTIVE)	{ */
 			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
@@ -2894,11 +2885,10 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 		break;
 
 	case HAL_DEF_TX_PAGE_BOUNDARY:
-		if (!padapter->registrypriv.wifi_spec) {
+		if (!padapter->registrypriv.wifi_spec)
 			*(u8 *)pval = TX_PAGE_BOUNDARY_8723B;
-		} else {
+		else
 			*(u8 *)pval = WMM_NORMAL_TX_PAGE_BOUNDARY_8723B;
-		}
 		break;
 
 	case HAL_DEF_MACID_SLEEP:
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 379d29d3f9d3..f31884a0dfc1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -140,9 +140,8 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (ret != _SUCCESS)
 		return _SUCCESS;
-	}
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
@@ -373,9 +372,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 0) {
+	if (ret == 0)
 		return _SUCCESS;
-	}
 
 	/*  dequeue frame and write to hardware */
 
@@ -393,9 +391,8 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 1) {
+	if (ret == 1)
 		goto next;
-	}
 
 	return _SUCCESS;
 }
@@ -410,9 +407,8 @@ int rtl8723bs_xmit_thread(void *context)
 
 	do {
 		ret = rtl8723bs_xmit_handler(padapter);
-		if (signal_pending(current)) {
+		if (signal_pending(current))
 			flush_signals(current);
-		}
 	} while (_SUCCESS == ret);
 
 	complete(&pxmitpriv->SdioXmitTerminate);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..a86252ccac76 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.43.0

