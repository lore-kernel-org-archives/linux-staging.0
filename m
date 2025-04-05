Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4690186A;
	Sat,  5 Apr 2025 00:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812149; cv=none; b=BfU7XwzOBrbxe/WdlNBXRMwjvdHPaPPw+A+NYoqQyusQIgg/SarIopf7AjrltLMzxFnfD7GiUC5tyKHx1GayDcASoxAuARtvrH/Y0kL2+UMj0Emx/C/CyJqu/AtVqxbpgJraGPDRydd1A2rySbDTLyb6E7vuaUAntUWd2sjnjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812149; c=relaxed/simple;
	bh=zBXvbJVFsM+DJctt5dKPj9OUxJmRvy3LzHiOTc/5NQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqCIM/gnIiorWH26S+62DAi0TpRU81SY0Ph9YIlyrI7Bq6QbomULiF9WqB2pM2NR4hTxo2xw3T2BiAqilCl1n2nkIR2A7+KU8qIsKklKKDvUfbgp7o4fel/5IOytcuBv/SU/Ic9zm+ky98zbBOthqysUkDU6IZieS9s2hU9gqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awLy+6lQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awLy+6lQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso109570466b.0;
        Fri, 04 Apr 2025 17:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812145; x=1744416945; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xTtg+mAJ2fpLJdIdN6Zq1vsq0Prz2ppkHTo+TZQdms=;
        b=awLy+6lQcbeEE1VYeGA/KN46KqdCJvRL4kSRPlGFi+TqXuw0H/UgSYNkB4IPi8+mGG
         8nRR8e++N3R+uEx2uxnYsrROkSgWWOUTeHSqiQ98P42kAzeWLseQfweSW60G9TMCEGoM
         lZnO+04Eqyj8eFuyxqihKmFvpgyNL2RXOANmz/RjCLWc6VqoiCzsxq2NRvLGR4CjhDll
         V6x9TO++hizydov6RJj2DoxsfHAwEhQD94H3OVNW5MIWHdHk9vi/GgA2e4kEfolUcnjR
         xh4O4H3GNFEYdO3n2BvoU9tCeZ3U76AbHMcyynDUT3+f2MH+HV85F4l1qew3T+SVR+hY
         0ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812145; x=1744416945;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xTtg+mAJ2fpLJdIdN6Zq1vsq0Prz2ppkHTo+TZQdms=;
        b=wYWw9H5wu+AswHp/sdMS7Fhwm8PnHrTYtQZygfkMegfwneIiRpkYnFSTpY/KA1OywW
         UtWSy48J06TFaTYc8yMGSHbo0M37VHyDqLeDgVK09F5wAZq9ZbduhvgeLUqrOmzKzrGe
         QNYlao/rqzUodzmcJbTEi+1NJldcLyeNcmthDVagFlZgnqje1fEjoClDSO/RE0rSgApL
         Y8V9xpplOrg8ofD8jutAbSiZ3TK5lXc3SGUpH4p1hnm/0lrZE0zbxB6CSH5ODT6TwPj8
         r69AAyXb7g+e7KdpHfpL/N9YOv+NbEOZwRpwlZj9hRBt1SBfH34A3QZejb5F7/Mtea9+
         ac+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx1M7MMH3viVjl1VmbVl+FL1qwRsCEv3dW6cNwXmCCk2N1ulfxBp3i9+NmLgbOAbgKeXpwNtiU43k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0PCUEIiudoBcUg6BRF5UtdxTWLra11QB48h0askRrnESLQRWP
	Qkk1Z/zWGTDrfEys5OmdAhHr6hyyrSqK/gJ//zhZ/he90uBoat8M
X-Gm-Gg: ASbGncuQp0ipDXfJLvP2tR9n6h7z6v8inIlgKnYrxnrzmW/pkldIE1MiQZL5fZMXDQL
	FggtizYBKqExK8WkfYOlBlnGR2NtnLdCV94LZKMUJqLOLbe7GpzVA+QRsRfm2LFwzLtZsI4t9OZ
	GKa8L1bHk+eshk9/ax1DghjrgQRDzyHjopLFZEDUXEd5tZk0LFE6RZJPXHNedzZ85lw8ippV4kM
	ci5F78IO2vJ6iPOMq0C4yi+81eLJ5i+/TvLDrKzhFvX61uP6nur7uOQh1TIVqxEYcOHrZcEa13N
	DmpwcW34YT+XfkQB7CGewPWwuU2Wi2Whn0s/HKu2i2wM75XoYyob5taqMpcB
X-Google-Smtp-Source: AGHT+IHq1CJJcCsvwnYrK1u3ewkc/0Fj0LNRfvcd/0mOcxsiRXkA1u3j4XRx4+gCrfZQFr6Ywrab6w==
X-Received: by 2002:a17:907:3f24:b0:ac7:7f14:f31b with SMTP id a640c23a62f3a-ac7d1824971mr502252966b.3.1743812144817;
        Fri, 04 Apr 2025 17:15:44 -0700 (PDT)
Received: from ubuntu ([105.112.234.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013e018sm329238966b.115.2025.04.04.17.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:15:44 -0700 (PDT)
Date: Sat, 5 Apr 2025 00:15:42 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, julia.lawall@inria.fr,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Place constants on right side of
 comparison
Message-ID: <Z/B2LjtshZU6AX2f@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Modify comparisons to place constants on the right hand side of expression
thereby following Linux kernel coding conventions.

Found and transformed by Coccinelle.

Semantic patch used for matching and transformation:

@@
constant K;
expression E;
@@
- K == E
+ E == K

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 68 +++++++++----------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index c1c7b5cc17a7..d32dbf94858f 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -1100,7 +1100,7 @@ static bool halbtc8723b2ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 
 		bCommon = true;
 	} else {
-		if (BT_8723B_2ANT_BT_STATUS_NON_CONNECTED_IDLE == pCoexDm->btStatus) {
+		if (pCoexDm->btStatus == BT_8723B_2ANT_BT_STATUS_NON_CONNECTED_IDLE) {
 			bLowPwrDisable = false;
 			pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable);
 			halbtc8723b2ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, false, 0x8);
@@ -1115,7 +1115,7 @@ static bool halbtc8723b2ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 			halbtc8723b2ant_SwMechanism2(pBtCoexist, false, false, false, 0x18);
 
 			bCommon = true;
-		} else if (BT_8723B_2ANT_BT_STATUS_CONNECTED_IDLE == pCoexDm->btStatus) {
+		} else if (pCoexDm->btStatus == BT_8723B_2ANT_BT_STATUS_CONNECTED_IDLE) {
 			bLowPwrDisable = true;
 			pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_DISABLE_LOW_POWER, &bLowPwrDisable);
 
@@ -1605,7 +1605,7 @@ static void halbtc8723b2ant_ActionSco(struct btc_coexist *pBtCoexist)
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
 
-	if (BTC_WIFI_BW_LEGACY == wifiBw) /* for SCO quality at 11b/g mode */
+	if (wifiBw == BTC_WIFI_BW_LEGACY) /* for SCO quality at 11b/g mode */
 		halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 2);
 	else  /* for SCO quality & wifi performance balance at 11n mode */
 		halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 8);
@@ -1613,7 +1613,7 @@ static void halbtc8723b2ant_ActionSco(struct btc_coexist *pBtCoexist)
 	halbtc8723b2ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0); /* for voice quality */
 
 	/*  sw mechanism */
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -1660,7 +1660,7 @@ static void halbtc8723b2ant_ActionHid(struct btc_coexist *pBtCoexist)
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
 
-	if (BTC_WIFI_BW_LEGACY == wifiBw) /* for HID at 11b/g mode */
+	if (wifiBw == BTC_WIFI_BW_LEGACY) /* for HID at 11b/g mode */
 		halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 7);
 	else  /* for HID quality & wifi performance balance at 11n mode */
 		halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 9);
@@ -1674,7 +1674,7 @@ static void halbtc8723b2ant_ActionHid(struct btc_coexist *pBtCoexist)
 		halbtc8723b2ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 13);
 
 	/*  sw mechanism */
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -1723,7 +1723,7 @@ static void halbtc8723b2ant_ActionA2dp(struct btc_coexist *pBtCoexist)
 
 		/*  sw mechanism */
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
-		if (BTC_WIFI_BW_HT40 == wifiBw) {
+		if (wifiBw == BTC_WIFI_BW_HT40) {
 			halbtc8723b2ant_SwMechanism1(pBtCoexist, true, false, false, false);
 			halbtc8723b2ant_SwMechanism2(pBtCoexist, true, false, true, 0x18);
 		} else {
@@ -1755,7 +1755,7 @@ static void halbtc8723b2ant_ActionA2dp(struct btc_coexist *pBtCoexist)
 
 	/*  sw mechanism */
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -1805,7 +1805,7 @@ static void halbtc8723b2ant_ActionA2dpPanHs(struct btc_coexist *pBtCoexist)
 
 	/*  sw mechanism */
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -1861,7 +1861,7 @@ static void halbtc8723b2ant_ActionPanEdr(struct btc_coexist *pBtCoexist)
 
 	/*  sw mechanism */
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -1912,7 +1912,7 @@ static void halbtc8723b2ant_ActionPanHs(struct btc_coexist *pBtCoexist)
 	halbtc8723b2ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 1);
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -1964,7 +1964,7 @@ static void halbtc8723b2ant_ActionPanEdrA2dp(struct btc_coexist *pBtCoexist)
 		(btRssiState == BTC_RSSI_STATE_STAY_HIGH)
 	) {
 		halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 12);
-		if (BTC_WIFI_BW_HT40 == wifiBw)
+		if (wifiBw == BTC_WIFI_BW_HT40)
 			halbtc8723b2ant_TdmaDurationAdjust(pBtCoexist, false, true, 3);
 		else
 			halbtc8723b2ant_TdmaDurationAdjust(pBtCoexist, false, false, 3);
@@ -1974,7 +1974,7 @@ static void halbtc8723b2ant_ActionPanEdrA2dp(struct btc_coexist *pBtCoexist)
 	}
 
 	/*  sw mechanism */
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -2019,7 +2019,7 @@ static void halbtc8723b2ant_ActionPanEdrHid(struct btc_coexist *pBtCoexist)
 		(btRssiState == BTC_RSSI_STATE_HIGH) ||
 		(btRssiState == BTC_RSSI_STATE_STAY_HIGH)
 	) {
-		if (BTC_WIFI_BW_HT40 == wifiBw) {
+		if (wifiBw == BTC_WIFI_BW_HT40) {
 			halbtc8723b2ant_FwDacSwingLvl(pBtCoexist, NORMAL_EXEC, 3);
 			halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 11);
 			pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780);
@@ -2037,7 +2037,7 @@ static void halbtc8723b2ant_ActionPanEdrHid(struct btc_coexist *pBtCoexist)
 	}
 
 	/*  sw mechanism */
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -2090,7 +2090,7 @@ static void halbtc8723b2ant_ActionHidA2dpPanEdr(struct btc_coexist *pBtCoexist)
 		(btRssiState == BTC_RSSI_STATE_HIGH) ||
 		(btRssiState == BTC_RSSI_STATE_STAY_HIGH)
 	) {
-		if (BTC_WIFI_BW_HT40 == wifiBw)
+		if (wifiBw == BTC_WIFI_BW_HT40)
 			halbtc8723b2ant_TdmaDurationAdjust(pBtCoexist, true, true, 2);
 		else
 			halbtc8723b2ant_TdmaDurationAdjust(pBtCoexist, true, false, 3);
@@ -2098,7 +2098,7 @@ static void halbtc8723b2ant_ActionHidA2dpPanEdr(struct btc_coexist *pBtCoexist)
 		halbtc8723b2ant_TdmaDurationAdjust(pBtCoexist, true, true, 3);
 
 	/*  sw mechanism */
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -2140,7 +2140,7 @@ static void halbtc8723b2ant_ActionHidA2dp(struct btc_coexist *pBtCoexist)
 	halbtc8723b2ant_FwDacSwingLvl(pBtCoexist, NORMAL_EXEC, 6);
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
-	if (BTC_WIFI_BW_LEGACY == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_LEGACY) {
 		if (BTC_RSSI_HIGH(btRssiState))
 			halbtc8723b2ant_DecBtPwr(pBtCoexist, NORMAL_EXEC, 2);
 		else if (BTC_RSSI_MEDIUM(btRssiState))
@@ -2173,7 +2173,7 @@ static void halbtc8723b2ant_ActionHidA2dp(struct btc_coexist *pBtCoexist)
 		halbtc8723b2ant_TdmaDurationAdjust(pBtCoexist, true, true, 2);
 
 	/*  sw mechanism */
-	if (BTC_WIFI_BW_HT40 == wifiBw) {
+	if (wifiBw == BTC_WIFI_BW_HT40) {
 		if (
 			(wifiRssiState == BTC_RSSI_STATE_HIGH) ||
 			(wifiRssiState == BTC_RSSI_STATE_STAY_HIGH)
@@ -2391,12 +2391,12 @@ void EXhalbtc8723b2ant_InitCoexDm(struct btc_coexist *pBtCoexist)
 
 void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (BTC_IPS_ENTER == type) {
+	if (type == BTC_IPS_ENTER) {
 		pCoexSta->bUnderIps = true;
 		halbtc8723b2ant_WifiOffHwCfg(pBtCoexist);
 		halbtc8723b2ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, true);
 		halbtc8723b2ant_CoexAllOff(pBtCoexist);
-	} else if (BTC_IPS_LEAVE == type) {
+	} else if (type == BTC_IPS_LEAVE) {
 		pCoexSta->bUnderIps = false;
 		halbtc8723b2ant_InitHwConfig(pBtCoexist, false);
 		halbtc8723b2ant_InitCoexDm(pBtCoexist);
@@ -2406,24 +2406,24 @@ void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 
 void EXhalbtc8723b2ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (BTC_LPS_ENABLE == type) {
+	if (type == BTC_LPS_ENABLE) {
 		pCoexSta->bUnderLps = true;
-	} else if (BTC_LPS_DISABLE == type) {
+	} else if (type == BTC_LPS_DISABLE) {
 		pCoexSta->bUnderLps = false;
 	}
 }
 
 void EXhalbtc8723b2ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (BTC_SCAN_START == type) {
-	} else if (BTC_SCAN_FINISH == type) {
+	if (type == BTC_SCAN_START) {
+	} else if (type == BTC_SCAN_FINISH) {
 	}
 }
 
 void EXhalbtc8723b2ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (BTC_ASSOCIATE_START == type) {
-	} else if (BTC_ASSOCIATE_FINISH == type) {
+	if (type == BTC_ASSOCIATE_START) {
+	} else if (type == BTC_ASSOCIATE_FINISH) {
 	}
 }
 
@@ -2436,11 +2436,11 @@ void EXhalbtc8723b2ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 
 	/*  only 2.4G we need to inform bt the chnl mask */
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U1_WIFI_CENTRAL_CHNL, &wifiCentralChnl);
-	if ((BTC_MEDIA_CONNECT == type) && (wifiCentralChnl <= 14)) {
+	if ((type == BTC_MEDIA_CONNECT) && (wifiCentralChnl <= 14)) {
 		H2C_Parameter[0] = 0x1;
 		H2C_Parameter[1] = wifiCentralChnl;
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_BW, &wifiBw);
-		if (BTC_WIFI_BW_HT40 == wifiBw)
+		if (wifiBw == BTC_WIFI_BW_HT40)
 			H2C_Parameter[2] = 0x30;
 		else {
 			pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U1_AP_NUM, &apNum);
@@ -2573,9 +2573,9 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 	}
 
 	if (
-		(BT_8723B_2ANT_BT_STATUS_ACL_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_2ANT_BT_STATUS_SCO_BUSY == pCoexDm->btStatus) ||
-		(BT_8723B_2ANT_BT_STATUS_ACL_SCO_BUSY == pCoexDm->btStatus)
+		(pCoexDm->btStatus == BT_8723B_2ANT_BT_STATUS_ACL_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_2ANT_BT_STATUS_SCO_BUSY) ||
+		(pCoexDm->btStatus == BT_8723B_2ANT_BT_STATUS_ACL_SCO_BUSY)
 	) {
 		bBtBusy = true;
 		bLimitedDig = true;
@@ -2603,8 +2603,8 @@ void EXhalbtc8723b2ant_HaltNotify(struct btc_coexist *pBtCoexist)
 
 void EXhalbtc8723b2ant_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState)
 {
-	if (BTC_WIFI_PNP_SLEEP == pnpState) {
-	} else if (BTC_WIFI_PNP_WAKE_UP == pnpState) {
+	if (pnpState == BTC_WIFI_PNP_SLEEP) {
+	} else if (pnpState == BTC_WIFI_PNP_WAKE_UP) {
 		halbtc8723b2ant_InitHwConfig(pBtCoexist, false);
 		halbtc8723b2ant_InitCoexDm(pBtCoexist);
 		halbtc8723b2ant_QueryBtInfo(pBtCoexist);
-- 
2.34.1

