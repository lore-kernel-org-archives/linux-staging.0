Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522C274670
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774130804; cv=none; b=uEWUtQyOclVLL3+ozAe23joHoQaEhyHbrNYMscT25NI3b1MrS5VkzVGjhokCGGDObU/hwU1zuFcvWUEwyd95s5/EQaAATtQ4Vybq8+CcSB+5db9EbBUQPunmybisfg5xCIHI8iuohvvWUru9rDR+Yys8CSmMzWE3IdmbffTAjpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774130804; c=relaxed/simple;
	bh=NE+o76cDCY6ufYLT4CXAQE6WZwivoJ3FwGquOiC8/E8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WiOa7pl0Gk5083JIq2gR/D3Iku1TO2bhb3hzrQq8orcs5IU2/5h4ggaWlXPituVYxHVKST5MankRWdMU7sUMJBSN9DGFAdxgpJCg7qTiSlVixY9jkcL5ydEBhhBPkIfa3WTbjsvKmmrmrFeCUiBH6DZl0nFRX3neG9SBymDdkSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQZ4qsld; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQZ4qsld"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a283c44478so1651300e87.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774130801; x=1774735601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWLQ8cISeczolM9g8jaVOfz2uGsgAmc0TWcwEI0STCg=;
        b=GQZ4qslduHG2CNXX7uGRSBXudgnHHU9m3u3xZDAQVTft/rjQyeQzpQQzYZo6HP6s0S
         zjumsz7ScX+65qjUpQe1HKtS9tgHe6wW0EGUGglXrKNilsqC2bW5dj2z+BUJTYFKAZCM
         M78n62a3MtBzfTMMovvBgnqEasyf8CMg5DeQwwc+em5tjiuryH0TEZTZVe22oplZDKqg
         qe7PoNLNN8Np67SKPZHHXWtE4uigJ4OMA8Shmbhfo0EuwfiOzahpyo7kcYuiGABbDI6R
         ma8NeNPxE4ouD1UaCLn70fICA5NQ+eHX+oCYGTF1F7Rnb95oehvTL7fgm3Mb1bYjXcr6
         xx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774130801; x=1774735601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWLQ8cISeczolM9g8jaVOfz2uGsgAmc0TWcwEI0STCg=;
        b=XfteB8ipJxhxQRCdJxtLBKlMLCpp8VPQRCsIPc/3d8SPr6JTdrvD/LYlfdbTTQxaTk
         /YWUS2CFFmU1eJYGtCAUVu3CwxKcYTnLchWPvd7ES8EAC4L+NsPrXbKz05bWKg2bEkrq
         N11dVLVgkWXgYp8imjOi4R1dF3DJqguJH1Z1+JA1acJwanfym7RfaY1DBLIgB6vhKe9E
         JRltQinEeKDkLG74aGe2KcopL2uWVBLAXPR3fBIqDvHA6CU41MO09zHuAOJKGv/XVo2b
         XBCMp/mhqJa0HmSR4hn8Kh7Z19YnNrFwI6eUrEe1YE1i4HFSUNzwjJcS2vWCiV0tXmU6
         iQCg==
X-Forwarded-Encrypted: i=1; AJvYcCXHmQ0CNQILjOIKA5+mwk4MyuJYvULVQkq+Rbuzj96BrThxzZ2udMuEzgNJzt3pOt6zIyPzDLSYQuFSar3Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzShJjRM8PqBgHdgJaDl8AvapCITiSSYjOYLg3c5s0s8qPNYyf3
	7n7c0ebeizu0E5U64chHb2mECYTRxQKF9Nw1QWpgmGeOMafFlIi3WaLy
X-Gm-Gg: ATEYQzx1nbO2xat4veUGEj25ZjOzr0LTtm++2SKXEBIp6j76Rhf1GCzU5/JBZ168/Os
	ac4jMPTDvPefmIiFN9uCqdpWUHycYDbS6iw/gS24LNiv7NQhgFG6rfh5HmwSt2GFTIasRelA9nP
	nyP0GIe96ayzkPc8hFmB2vOMbCbIR/+bKTCz4FMc6DbtbGBSsrNsj0Kgvb3+SN+0vpNepY5jpB0
	+qg5j5bkGvLfdgvG5z1IqoU+FLtGRZnNCJj2C00XazgN/LZKcgeGE9BTZbD2lIXJO2nzGxlYAGa
	Afiirttwhf8i034w4UTGNZZu1DmEnou0y68U1KnznhK1RA4r/EcrKiyib0tyWlD4ZN+XXbMj3Q6
	herJBLH0IMDWh320HIM9H4Yn/Jha/iwpFmHdcZiLsJbv43MFfHqdbaQrL+fDLmJ/0Y9prwuKFRv
	ULrEiy1uKVJfVJJ89rqZxFLmhI9z03Vfy/JnjJjB7Fz/PmXQyY7kz1yWHaCFHyzcO0uPelqN7lx
	ysF
X-Received: by 2002:a05:6512:3ba3:b0:5a1:15bd:b057 with SMTP id 2adb3069b0e04-5a28589e931mr2149597e87.0.1774130800182;
        Sat, 21 Mar 2026 15:06:40 -0700 (PDT)
Received: from localhost.localdomain (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851adeeasm1353610e87.35.2026.03.21.15.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:06:38 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary braces in single statement blocks
Date: Sat, 21 Mar 2026 23:06:12 +0100
Message-ID: <20260321220612.6560-1-rayfraytech@gmail.com>
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
v3: Fix logic bug in HalBtc8723b2Ant.c - use !bBtHsOn instead of
    bBtHsOn (reported by Dan Carpenter)
    Revert unrelated change in rtl8723b_cmd.c (0 == valid)
v2: Fix build error in HalBtc8723b2Ant.c - remove spurious '{'
    from else-if statement (reported by kernel test robot)
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603182051.NuXiZYrt-lkp@intel.com/
v1: Remove unnecessary braces in single statement blocks
    throughout rtl8723bs driver

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
index d32dbf94858f..682582920363 100644
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
+				if (!bBtHsOn)
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
index af6cdda8238d..a44f5bd58306 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -25,9 +25,8 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 	do {
 		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
+		if (0 == valid)
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

