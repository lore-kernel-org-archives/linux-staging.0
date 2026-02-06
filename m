Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC0B3491C4
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364527; cv=none; b=JflXeyMt6ejbG6SlvnrVxqJr8+aCaImgfXLE1pk0hMuO8pMrQgSC0Uv1XJ44xRt/3YAe03AIaSFFEHlLT2FpoPpGNRoe5dJJcP7LSByy+Rojd0cCZpPJ6/XxN6607v8Ai2rRjFlGnyXulKoIfdVkmXtwCcL3jNhDShOWZDpGvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364527; c=relaxed/simple;
	bh=Ympjxtg3wxNwyyNQYnfrt56Zfutknju0cI5lK0AndjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBDGYDmjf1eHepA9/qDysz9KLUh2nipet09DXZNFV//shac2RHltchynkzU469QL+jER0T4tJ8CVEmgRiaBIKmtg2tR/Mw7WnUopLhbu4zNdMhtA8sR+y+naeqjRqXPAXmZT8E00EuqUCey54msPA1JnfpsWVs0iR0cBHvPf1aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Scry5khY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Scry5khY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee0291921so3545855e9.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364525; x=1770969325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d51D10FPrekbYZl2NiukUCfv0KY65SeGekxUGuvEcWg=;
        b=Scry5khYGhNThIOhOEGuAVhxaI89ykIn2dnYbFUBZHZjQoywyRBQfTQ5t3N8HgD28W
         TOZ7J2UqzkHDtFkU6R4rzJVjomij734Ba9yTHyZgAgb6DffKh/HKQh8KTv2hQgTYjoSS
         AixYRCO8qjm4qQZFAqxYJ+LYAkfFPKkPiIhWLRZg0GP0KN/kG95u9G5hoCMZoSIF7e8O
         nVErNC8JC1L5X28S0IooIR+E/Hfm2YMzmDngbD+rqkXWCbji/7gZ4dZbm7DPs8tOLmPN
         6S5CFIf/Vdem2cdUq8hyIBX+763cf0wSO33yjLIS6zl0tObbdJdbDEylQbwSzLB1hjHS
         UDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364525; x=1770969325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d51D10FPrekbYZl2NiukUCfv0KY65SeGekxUGuvEcWg=;
        b=WcQwQlhYyJ6L1l1/ICoYAs/Ppn4Tmwol0VD9rdHEnr9pev357L5pd8qRyVKYiIyAie
         JYqY7MRk9c0b109hPhyE2I9y71gJZK5617G8KNeSuEfHlNgB/bdR0Zxf2lY3sNqFGJTW
         6XoritcERuXlw5u9ZYuZlVG+XEhA2tfjIt+3H+6UDHwOEi45iNA8ccyhW4B16djzMdYv
         leGBm7mdtKfi169j7JxWk8Zt5QLXUdMU8HyhoLK/tfkovWizHs3XfK3E38s6xa9wQe5d
         EGVuCotWIeE4xAhgtLlJYTkcNvRaCE45P0sJ4auqkw3VhKVkbIc3xmiVQaju563eq1c5
         +0KA==
X-Forwarded-Encrypted: i=1; AJvYcCVpSRDuslKn1VFDzwtCDNxK2JqqtuDXn2G9Ygq24WEEJnqXf3lePYmWmkR9mNSD6uZ7Yu0B5QjzOa2rA82Y@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq1yDNNphvLzNmdH2yRS2+CxrouP6cVmJhgDD3pYtXqlpxOcKR
	SgjDTS8dY/fghwhVb1xgcYdVCjrjg8N6GboQKJ9ZXqhUZw383ZrcWPQ=
X-Gm-Gg: AZuq6aIMh72vAuSOplPc3LcDmG8ebbD0/l62Mz/8HPzALsem2nzPr+8u81NJK4AMtRX
	GnmyXUkqFnOeDC6MkB7EVfMd9/7GxxB599jPNaIbNljSiGh/GbvFli6jp2mDnmLZg4XIDimU1GB
	96HGSVPkiW9ksU2UZp3QvpYB0d3WPZIRjb9I3SGvuUPl2gO/ix2cAme3R1+6+zpV1UOPaV1S2f2
	KLo3l4O0pC5wK88KHOIg9gT6xiRKAYpmkp2mpuIXeP1zQBy+fJxTMvpFmhVuJMKekrfSyu88rpF
	Zg1wJVJY2Q2+EQ56u4W2dve/2ffi+w/29ga5Juc7A8JLWDOo0kKLy/wZK7/sOu/nFfmgVGykQiq
	wsjZ0rBvgguoIEliHnjIEYJSE3dzQ6MD0rFdgXW9pAhbkrRsOJyjYib4ymlkI9BSszFQBiagBLz
	THpujRu3xox+jl37qP59pgxYjaFg6KwqEf03CYAbwRlSrJFhXE3Cl+PVo/L7HPaKPTTVlA8XGif
	g==
X-Received: by 2002:a05:600c:458c:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-483201da2e1mr27929585e9.1.1770364524965;
        Thu, 05 Feb 2026 23:55:24 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:24 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 20/26] staging: rtl8723bs: hal: fix various line length overflows
Date: Fri,  6 Feb 2026 08:54:33 +0100
Message-ID: <20260206075439.103287-21-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Fix lines exceeding 100 characters across multiple hal files to comply
with kernel coding style. Files modified: HalBtc8723b1Ant.c,
HalBtc8723b2Ant.c, HalPhyRf.c, hal_com.c, hal_com_phycfg.c, hal_intf.c,
hal_sdio.c, odm.c, odm_DIG.c, odm_HWConfig.c, rtl8723b_rf6052.c,
rtl8723bs_recv.c, rtl8723bs_xmit.c, sdio_halinit.c.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 35 +++++++++++------
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   | 29 +++++++++-----
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      | 36 ++++++++++++------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 10 +++--
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 22 +++++++----
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           | 18 ++++++---
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 38 ++++++++++++-------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  | 17 +++++++--
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  6 ++-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  6 ++-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  5 ++-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 17 ++++++---
 14 files changed, 169 insertions(+), 78 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3d7f50fac4c..f56e799da702 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -810,7 +810,8 @@ static void halbtc8723b1ant_SetAntPath(
 	u8 H2C_Parameter[2] = {0}, u1Tmp = 0;
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer); /*  [31:16]=fw ver, [15:0]=fw sub ver */
+	/* [31:16]=fw ver, [15:0]=fw sub ver */
+	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 
 	if ((fwVer > 0 && fwVer < 0xc0000) || bPgExtSwitch)
 		bUseExtSwitch = true;
@@ -829,7 +830,8 @@ static void halbtc8723b1ant_SetAntPath(
 		/* set wlan_act control by PTA */
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+		/* BT select s0/s1 is controlled by WiFi */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1);
 
 		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x39, 0x8, 0x1);
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x974, 0xff);
@@ -847,10 +849,13 @@ static void halbtc8723b1ant_SetAntPath(
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
 		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_IS_IN_MP_MODE, &bIsInMpMode);
-		if (!bIsInMpMode)
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0); /* BT select s0/s1 is controlled by BT */
-		else
-			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+		if (!bIsInMpMode) {
+			/* BT select s0/s1 is controlled by BT */
+			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0);
+		} else {
+			/* BT select s0/s1 is controlled by WiFi */
+			pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1);
+		}
 
 		/*  0x4c[24:23]= 00, Set Antenna control by BT_RFE_CTRL	BT Vendor 0xac = 0xf002 */
 		u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
@@ -1059,8 +1064,10 @@ static void halbtc8723b1ant_PsTdma(
 
 
 	if (bTurnOn) {
-		if (pBtLinkInfo->bSlaveRole)
-			psTdmaByte4Val = psTdmaByte4Val | 0x1;  /* 0x778 = 0x1 at wifi slot (no blocking BT Low-Pri pkts) */
+		if (pBtLinkInfo->bSlaveRole) {
+			/* 0x778 = 0x1 at wifi slot (no blocking BT Low-Pri pkts) */
+			psTdmaByte4Val = psTdmaByte4Val | 0x1;
+		}
 
 
 		switch (type) {
@@ -1868,7 +1875,8 @@ static void halbtc8723b1ant_ActionWifiConnected(struct btc_coexist *pBtCoexist)
 					pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
 				);
 			else { /* busy */
-				if  (pCoexSta->nScanAPNum >= BT_8723B_1ANT_WIFI_NOISY_THRESH)  /* no force LPS, no PS-TDMA, use pure TDMA */
+				/* no force LPS, no PS-TDMA, use pure TDMA */
+				if (pCoexSta->nScanAPNum >= BT_8723B_1ANT_WIFI_NOISY_THRESH)
 					halbtc8723b1ant_PowerSaveState(
 						pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0
 					);
@@ -2246,7 +2254,8 @@ void EXhalbtc8723b1ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (type == BTC_SCAN_START) {
 		pCoexSta->bWiFiIsHighPriTask = true;
 
-		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
+		/* Force antenna setup for no scan result issue */
+		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);
 		pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
 		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
 		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
@@ -2432,7 +2441,8 @@ void EXhalbtc8723b1ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 ty
 		if (type == BTC_PACKET_ARP) {
 			pCoexDm->nArpCnt++;
 
-			if (pCoexDm->nArpCnt >= 10) /*  if APR PKT > 10 after connect, do not go to ActionWifiConnectedSpecialPacket(pBtCoexist) */
+			/* if ARP PKT > 10 after connect, skip special packet action */
+			if (pCoexDm->nArpCnt >= 10)
 				pCoexSta->bWiFiIsHighPriTask = false;
 			else
 				pCoexSta->bWiFiIsHighPriTask = true;
@@ -2578,7 +2588,8 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 
 	halbtc8723b1ant_UpdateBtLinkInfo(pBtCoexist);
 
-	btInfo = btInfo & 0x1f;  /* mask profile bit for connect-ilde identification (for CSR case: A2DP idle --> 0x41) */
+	/* mask profile bit for connect-idle identification (CSR case: A2DP idle = 0x41) */
+	btInfo = btInfo & 0x1f;
 
 	if (!(btInfo & BT_INFO_8723B_1ANT_B_CONNECTION)) {
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE;
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..42fc4de0cc64 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -830,7 +830,8 @@ static void halbtc8723b2ant_SetAntPath(
 	u8 	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
-	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
+	/* [31:16]=fw ver, [15:0]=fw sub ver */
+	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 
 	if ((fwVer > 0 && fwVer < 0xc0000) || bPgExtSwitch)
 		bUseExtSwitch = true;
@@ -901,13 +902,16 @@ static void halbtc8723b2ant_SetAntPath(
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 		}
 
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0); /* fixed external switch S1->Main, S0->Aux */
+		/* fixed external switch S1->Main, S0->Aux */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x64, 0x1, 0x0);
 		switch (antPosType) {
 		case BTC_ANT_WIFI_AT_MAIN:
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0); /*  fixed internal switch S1->WiFi, S0->BT */
+			/* fixed internal switch S1->WiFi, S0->BT */
+			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0);
 			break;
 		case BTC_ANT_WIFI_AT_AUX:
-			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280); /*  fixed internal switch S0->WiFi, S1->BT */
+			/* fixed internal switch S0->WiFi, S1->BT */
+			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x280);
 			break;
 		}
 	}
@@ -2279,7 +2283,8 @@ static void halbtc8723b2ant_WifiOffHwCfg(struct btc_coexist *pBtCoexist)
 	/*  set wlan_act to low */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
-	pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780); /* WiFi goto standby while GNT_BT 0-->1 */
+	/* WiFi goto standby while GNT_BT 0-->1 */
+	pBtCoexist->fBtcSetRfReg(pBtCoexist, BTC_RF_A, 0x1, 0xfffff, 0x780);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);
 	if (fwVer >= 0x180000) {
 		/* Use H2C to set GNT_BT to HIGH */
@@ -2289,10 +2294,13 @@ static void halbtc8723b2ant_WifiOffHwCfg(struct btc_coexist *pBtCoexist)
 		pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_IS_IN_MP_MODE, &bIsInMpMode);
-	if (!bIsInMpMode)
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0); /* BT select s0/s1 is controlled by BT */
-	else
-		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
+	if (!bIsInMpMode) {
+		/* BT select s0/s1 is controlled by BT */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x0);
+	} else {
+		/* BT select s0/s1 is controlled by WiFi */
+		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1);
+	}
 }
 
 static void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bBackUp)
@@ -2595,7 +2603,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 void EXhalbtc8723b2ant_HaltNotify(struct btc_coexist *pBtCoexist)
 {
 	halbtc8723b2ant_WifiOffHwCfg(pBtCoexist);
-	pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15); /* BT goto standby while GNT_BT 1-->0 */
+	/* BT goto standby while GNT_BT 1-->0 */
+	pBtCoexist->fBtcSetBtReg(pBtCoexist, BTC_BT_REG_RF, 0x3c, 0x15);
 	halbtc8723b2ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, true);
 
 	EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a063..2b4b5468f87b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -65,7 +65,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	u8 ThermalValue_AVG_count = 0;
 	u32 ThermalValue_AVG = 0;
 
-	u8 OFDM_min_index = 0;  /*  OFDM BB Swing should be less than +3.0dB, which is required by Arthur */
+	/* OFDM BB Swing should be less than +3.0dB, which is required by Arthur */
+	u8 OFDM_min_index = 0;
 	u8 Indexforchannel = 0; /*  GetRightChnlPlaceforIQK(pHalData->CurrentChannel) */
 
 	struct txpwrtrack_cfg c;
@@ -93,7 +94,9 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	pDM_Odm->RFCalibrateInfo.TXPowerTrackingCallbackCnt++;
 	pDM_Odm->RFCalibrateInfo.bTXPowerTrackingInit = true;
 
-	ThermalValue = (u8)PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, c.ThermalRegAddr, 0xfc00);	/* 0x42: RF Reg[15:10] 88E */
+	/* 0x42: RF Reg[15:10] 88E */
+	ThermalValue = (u8)PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A,
+					   c.ThermalRegAddr, 0xfc00);
 	if (
 		!pDM_Odm->RFCalibrateInfo.TxPowerTrackControl ||
 		pHalData->EEPROMThermalMeter == 0 ||
@@ -104,11 +107,15 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	/* 4 3. Initialize ThermalValues of RFCalibrateInfo */
 
 	/* 4 4. Calculate average thermal meter */
-
-	pDM_Odm->RFCalibrateInfo.ThermalValue_AVG[pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index] = ThermalValue;
-	pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index++;
-	if (pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index == c.AverageThermalNum)   /* Average times =  c.AverageThermalNum */
-		pDM_Odm->RFCalibrateInfo.ThermalValue_AVG_index = 0;
+	{
+		struct odm_rf_cal_t *cal = &pDM_Odm->RFCalibrateInfo;
+
+		cal->ThermalValue_AVG[cal->ThermalValue_AVG_index] = ThermalValue;
+		cal->ThermalValue_AVG_index++;
+		/* Average times = c.AverageThermalNum */
+		if (cal->ThermalValue_AVG_index == c.AverageThermalNum)
+			cal->ThermalValue_AVG_index = 0;
+	}
 
 	for (i = 0; i < c.AverageThermalNum; i++) {
 		if (pDM_Odm->RFCalibrateInfo.ThermalValue_AVG[i]) {
@@ -200,10 +207,16 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 			if (
 				pDM_Odm->RFCalibrateInfo.DeltaPowerIndex[p] ==
 				pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p]
-			) /*  If Thermal value changes but lookup table value still the same */
+			) {
+				/* If Thermal value changes but lookup table value still the same */
 				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
-			else
-				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = pDM_Odm->RFCalibrateInfo.DeltaPowerIndex[p] - pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p];      /*  Power Index Diff between 2 times Power Tracking */
+			} else {
+				/* Power Index Diff between 2 times Power Tracking */
+				s8 delta_idx = pDM_Odm->RFCalibrateInfo.DeltaPowerIndex[p];
+				s8 last_idx = pDM_Odm->RFCalibrateInfo.DeltaPowerIndexLast[p];
+
+				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = delta_idx - last_idx;
+			}
 
 			pDM_Odm->RFCalibrateInfo.OFDM_index[p] =
 				pDM_Odm->BbSwingIdxOfdmBase[p] +
@@ -245,7 +258,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	 ) {
 		/* 4 7.2 Configure the Swing Table to adjust Tx Power. */
 
-		pDM_Odm->RFCalibrateInfo.bTxPowerChanged = true; /*  Always true after Tx Power is adjusted by power tracking. */
+		/* Always true after Tx Power is adjusted by power tracking. */
+		pDM_Odm->RFCalibrateInfo.bTxPowerChanged = true;
 		/*  */
 		/*  2012/04/23 MH According to Luke's suggestion, we can not write BB digital */
 		/*  to increase TX power. Otherwise, EVM will be bad. */
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 70b5b289f9cb..1b0e38a1e993 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -792,10 +792,14 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 	/* todo: other chips */
 
 	if (save_cnt) {
+		u16 last, curr;
+
 		/* rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xa0); */
-		pdbgpriv->dbg_rx_fifo_last_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow;
-		pdbgpriv->dbg_rx_fifo_curr_overflow = rtw_read16(adapter, REG_RXERR_RPT);
-		pdbgpriv->dbg_rx_fifo_diff_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow-pdbgpriv->dbg_rx_fifo_last_overflow;
+		last = pdbgpriv->dbg_rx_fifo_curr_overflow;
+		curr = rtw_read16(adapter, REG_RXERR_RPT);
+		pdbgpriv->dbg_rx_fifo_last_overflow = last;
+		pdbgpriv->dbg_rx_fifo_curr_overflow = curr;
+		pdbgpriv->dbg_rx_fifo_diff_overflow = curr - last;
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index dc2da49e6738..2998487f8fa3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -318,7 +318,8 @@ static void PHY_StoreTxPowerByRateNew(struct adapter *padapter,	u32 RfPath,
 	u8 i = 0, rateIndex[4] = {0}, rateNum = 0;
 	s8	PwrByRateVal[4] = {0};
 
-	PHY_GetRateValuesOfTxPowerByRate(padapter, RegAddr, BitMask, Data, rateIndex, PwrByRateVal, &rateNum);
+	PHY_GetRateValuesOfTxPowerByRate(padapter, RegAddr, BitMask, Data,
+					 rateIndex, PwrByRateVal, &rateNum);
 
 	if (RfPath >= RF_PATH_MAX)
 		return;
@@ -436,7 +437,10 @@ void PHY_SetTxPowerIndexByRateSection(
 					       ARRAY_SIZE(ofdmRates));
 
 	} else if (RateSection == HT_MCS0_MCS7) {
-		u8 htRates1T[]  = {MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3, MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7};
+		u8 htRates1T[]  = {
+			MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3,
+			MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7
+		};
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					       pHalData->CurrentChannelBW,
 					       Channel, htRates1T,
@@ -846,11 +850,15 @@ void PHY_SetTxPowerLimit(
 
 	if (channelIndex == -1)
 		return;
-
-	prevPowerLimit = pHalData->TxPwrLimit_2_4G[regulation][bandwidth][rateSection][channelIndex][RF_PATH_A];
-
-	if (powerLimit < prevPowerLimit)
-		pHalData->TxPwrLimit_2_4G[regulation][bandwidth][rateSection][channelIndex][RF_PATH_A] = powerLimit;
+	{
+		s8 *pLimit = &pHalData->TxPwrLimit_2_4G[regulation][bandwidth]
+						       [rateSection][channelIndex]
+						       [RF_PATH_A];
+		prevPowerLimit = *pLimit;
+
+		if (powerLimit < prevPowerLimit)
+			*pLimit = powerLimit;
+	}
 }
 
 void Hal_ChannelPlanToRegulation(struct adapter *Adapter, u16 ChannelPlan)
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 4ca950ff20ad..f0e4d1ee866a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -120,7 +120,9 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
 }
 
-void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
+void rtw_hal_set_odm_var(struct adapter *padapter,
+			 enum hal_odm_variable eVariable,
+			 void *pValue1, bool bSet)
 {
 	SetHalODMVar(padapter, eVariable, pValue1, bSet);
 }
diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 665c85eccbdf..fb4196af681f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -23,8 +23,10 @@ u8 rtw_hal_sdio_query_tx_freepage(
 )
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
+	u8 page_free = pHalData->SdioTxFIFOFreePage[PageIdx];
+	u8 pub_free = pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX];
 
-	if ((pHalData->SdioTxFIFOFreePage[PageIdx]+pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
+	if ((page_free + pub_free) >= RequiredPageNum)
 		return true;
 	else
 		return false;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index a22354f728c1..978fb7a2630c 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -131,8 +131,13 @@ u8 CCKSwingTable_Ch14_New[CCK_TABLE_SIZE][8] = {
 
 static void odm_CommonInfoSelfInit(struct dm_odm_t *pDM_Odm)
 {
-	pDM_Odm->bCckHighPower = (bool) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT, pDM_Odm), ODM_BIT(CCK_RPT_FORMAT, pDM_Odm));
-	pDM_Odm->RFPathRxEnable = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH, pDM_Odm), ODM_BIT(BB_RX_PATH, pDM_Odm));
+	u32 cck_reg = ODM_REG(CCK_RPT_FORMAT, pDM_Odm);
+	u32 cck_bit = ODM_BIT(CCK_RPT_FORMAT, pDM_Odm);
+	u32 rx_reg = ODM_REG(BB_RX_PATH, pDM_Odm);
+	u32 rx_bit = ODM_BIT(BB_RX_PATH, pDM_Odm);
+
+	pDM_Odm->bCckHighPower = (bool)PHY_QueryBBReg(pDM_Odm->Adapter, cck_reg, cck_bit);
+	pDM_Odm->RFPathRxEnable = (u8)PHY_QueryBBReg(pDM_Odm->Adapter, rx_reg, rx_bit);
 
 	pDM_Odm->TxRate = 0xFF;
 }
@@ -267,12 +272,15 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 		struct sta_info *pstat = pDM_Odm->pODM_StaInfo[i];
 
 		if (IS_STA_VALID(pstat)) {
-			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
+			u32 rssi = pstat->rssi_stat.UndecoratedSmoothedPWDB;
+			bool changed;
+
+			if (is_multicast_ether_addr(pstat->hwaddr))
 				continue;
 
-			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
+			changed = ODM_RAStateCheck(pDM_Odm, rssi, false, &pstat->rssi_level);
+			if (changed)
 				rtw_hal_update_ra_mask(pstat, pstat->rssi_level);
-			}
 
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index f10427abd849..58bb45feea22 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -10,17 +10,23 @@
 void odm_NHMCounterStatisticsInit(void *pDM_VOID)
 {
 	struct dm_odm_t	*pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct adapter *adapter = pDM_Odm->Adapter;
 
 	/* PHY parameters initialize for n series */
-	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N+2, 0x2710);	/* 0x894[31:16]= 0x2710	Time duration for NHM unit: 4us, 0x2710 =40ms */
-	/* rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N+2, 0x4e20);	0x894[31:16]= 0x4e20	Time duration for NHM unit: 4us, 0x4e20 =80ms */
-	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N+2, 0xffff);	/* 0x890[31:16]= 0xffff	th_9, th_10 */
-	/* rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff5c);	0x898 = 0xffffff5c		th_3, th_2, th_1, th_0 */
-	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff52);	/* 0x898 = 0xffffff52		th_3, th_2, th_1, th_0 */
-	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH7_TO_TH4_11N, 0xffffffff);	/* 0x89c = 0xffffffff		th_7, th_6, th_5, th_4 */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_FPGA0_IQK_11N, bMaskByte0, 0xff);		/* 0xe28[7:0]= 0xff		th_8 */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT10|BIT9|BIT8, 0x7);	/* 0x890[9:8]=3			enable CCX */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_RSTC_11N, BIT7, 0x1);		/* 0xc0c[7]= 1			max power among all RX ants */
+	/* 0x894[31:16]=0x2710, Time duration for NHM unit: 4us, 0x2710=40ms */
+	rtw_write16(adapter, ODM_REG_NHM_TIMER_11N + 2, 0x2710);
+	/* 0x890[31:16]=0xffff, th_9, th_10 */
+	rtw_write16(adapter, ODM_REG_NHM_TH9_TH10_11N + 2, 0xffff);
+	/* 0x898=0xffffff52, th_3, th_2, th_1, th_0 */
+	rtw_write32(adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff52);
+	/* 0x89c=0xffffffff, th_7, th_6, th_5, th_4 */
+	rtw_write32(adapter, ODM_REG_NHM_TH7_TO_TH4_11N, 0xffffffff);
+	/* 0xe28[7:0]=0xff, th_8 */
+	PHY_SetBBReg(adapter, ODM_REG_FPGA0_IQK_11N, bMaskByte0, 0xff);
+	/* 0x890[9:8]=3, enable CCX */
+	PHY_SetBBReg(adapter, ODM_REG_NHM_TH9_TH10_11N, BIT10 | BIT9 | BIT8, 0x7);
+	/* 0xc0c[7]=1, max power among all RX ants */
+	PHY_SetBBReg(adapter, ODM_REG_OFDM_FA_RSTC_11N, BIT7, 0x1);
 }
 
 void odm_NHMCounterStatistics(void *pDM_VOID)
@@ -80,8 +86,8 @@ void odm_NHMBB(void *pDM_VOID)
 	pDM_Odm->NHMLastRxOkcnt =
 		*(pDM_Odm->pNumRxBytesUnicast);
 
-
-	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
+	/* Tx > 4*Rx possible for adaptivity test */
+	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt << 2) + 1) {
 		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag == true) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
 			/* test_status = 1; */
@@ -343,7 +349,9 @@ void odm_DIGInit(void *pDM_VOID)
 
 	pDM_DigTable->bStopDIG = false;
 	pDM_DigTable->bPSDInProgress = false;
-	pDM_DigTable->CurIGValue = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm));
+	pDM_DigTable->CurIGValue = (u8)PHY_QueryBBReg(pDM_Odm->Adapter,
+						       ODM_REG(IGI_A, pDM_Odm),
+						       ODM_BIT(IGI, pDM_Odm));
 	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DMfalseALARM_THRESH_LOW;
@@ -565,10 +573,12 @@ void odm_DIG(void *pDM_VOID)
 			else if (pDM_Odm->bBtConnectProcess)
 				ODM_Write_DIG(pDM_Odm, 0x28);
 			else
-				ODM_Write_DIG(pDM_Odm, pDM_DigTable->BT30_CurIGI);/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+				/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+				ODM_Write_DIG(pDM_Odm, pDM_DigTable->BT30_CurIGI);
 		}
 	} else { /*  BT is not using */
-		ODM_Write_DIG(pDM_Odm, CurrentIGI);/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+		/* ODM_Write_DIG(pDM_Odm, pDM_DigTable->CurIGValue); */
+		ODM_Write_DIG(pDM_Odm, CurrentIGI);
 		pDM_DigTable->bMediaConnect_0 = pDM_Odm->bLinked;
 		pDM_DigTable->DIG_Dynamic_MIN_0 = DIG_Dynamic_MIN;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 5bb27b872052..86f41b8f9fe2 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -372,13 +372,22 @@ static void odm_Process_RSSIForDM(
 				OFDM_pkt += (u8)(pEntry->rssi_stat.PacketMap>>i)&BIT0;
 
 			if (pEntry->rssi_stat.ValidBit == 64) {
+				u32 ofdm_weight, cck_weight;
+
 				Weighting = ((OFDM_pkt<<4) > 64)?64:(OFDM_pkt<<4);
-				UndecoratedSmoothedPWDB = (Weighting*UndecoratedSmoothedOFDM+(64-Weighting)*UndecoratedSmoothedCCK)>>6;
+				ofdm_weight = Weighting * UndecoratedSmoothedOFDM;
+				cck_weight = (64 - Weighting) * UndecoratedSmoothedCCK;
+				UndecoratedSmoothedPWDB = (ofdm_weight + cck_weight) >> 6;
 			} else {
-				if (pEntry->rssi_stat.ValidBit != 0)
-					UndecoratedSmoothedPWDB = (OFDM_pkt*UndecoratedSmoothedOFDM+(pEntry->rssi_stat.ValidBit-OFDM_pkt)*UndecoratedSmoothedCCK)/pEntry->rssi_stat.ValidBit;
-				else
+				if (pEntry->rssi_stat.ValidBit != 0) {
+					u8 valid = pEntry->rssi_stat.ValidBit;
+					u32 ofdm_sum = OFDM_pkt * UndecoratedSmoothedOFDM;
+					u32 cck_sum = (valid - OFDM_pkt) * UndecoratedSmoothedCCK;
+
+					UndecoratedSmoothedPWDB = (ofdm_sum + cck_sum) / valid;
+				} else {
 					UndecoratedSmoothedPWDB = 0;
+				}
 			}
 
 			pEntry->rssi_stat.UndecoratedSmoothedCCK = UndecoratedSmoothedCCK;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index ffb35e1ace62..e0fb36b0b666 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -113,10 +113,12 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 		udelay(1);/* PlatformStallExecution(1); */
 
 		/* Set bit number of Address and Data for RF register */
-		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);	/*  Set 1 to 4 bits for 8255 */
+		/* Set 1 to 4 bits for 8255 */
+		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireAddressLength, 0x0);
 		udelay(1);/* PlatformStallExecution(1); */
 
-		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);	/*  Set 0 to 12  bits for 8255 */
+		/* Set 0 to 12 bits for 8255 */
+		PHY_SetBBReg(Adapter, pPhyReg->rfHSSIPara2, b3WireDataLength, 0x0);
 		udelay(1);/* PlatformStallExecution(1); */
 
 		/*----Initialize RF fom connfiguration file----*/
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 399edfbf8ec6..5bbf958d792e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -300,8 +300,10 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				pkt_copy->dev = padapter->pnetdev;
 				precvframe->u.hdr.pkt = pkt_copy;
-				skb_reserve(pkt_copy, 8 - ((SIZE_PTR)(pkt_copy->data) & 7));/* force pkt_copy->data at 8-byte alignment address */
-				skb_reserve(pkt_copy, shift_sz);/* force ip_hdr at 8-byte alignment address according to shift_sz. */
+				/* force pkt_copy->data at 8-byte alignment address */
+				skb_reserve(pkt_copy, 8 - ((SIZE_PTR)(pkt_copy->data) & 7));
+				/* force ip_hdr at 8-byte alignment per shift_sz */
+				skb_reserve(pkt_copy, shift_sz);
 				memcpy(pkt_copy->data, (ptr + rx_report_sz + pattrib->shift_sz), skb_len);
 				precvframe->u.hdr.rx_head = pkt_copy->head;
 				precvframe->u.hdr.rx_data = precvframe->u.hdr.rx_tail = pkt_copy->data;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 33c23b80e11b..aac3923df6a4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -446,7 +446,10 @@ s32 rtl8723bs_mgnt_xmit(
 	pxmitbuf->priv_data = NULL;
 
 	if (GetFrameSubType(pframe) == WIFI_BEACON) { /* dump beacon directly */
-		ret = rtw_write_port(padapter, pdvobjpriv->Queue2Pipe[pxmitbuf->ff_hwaddr], pxmitbuf->len, (u8 *)pxmitbuf);
+		u8 ff_addr = pxmitbuf->ff_hwaddr;
+
+		ret = rtw_write_port(padapter, pdvobjpriv->Queue2Pipe[ff_addr],
+				     pxmitbuf->len, (u8 *)pxmitbuf);
 		if (ret != _SUCCESS)
 			rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_WRITE_PORT_ERR);
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 668616efa68a..d1f1778a4ec6 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -28,7 +28,9 @@ static u8 CardEnable(struct adapter *padapter)
 		/*  unlock ISO/CLK/Power control register */
 		rtw_write8(padapter, REG_RSV_CTRL, 0x0);
 
-		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
+		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK,
+					  PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK,
+					  rtl8723B_card_enable_flow);
 		if (ret == _SUCCESS) {
 			u8 bMacPwrCtrlOn = true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -111,7 +113,9 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 }
 
 /* Tx Page FIFO threshold */
-static void _init_available_page_threshold(struct adapter *padapter, u8 numHQ, u8 numNQ, u8 numLQ, u8 numPubQ)
+static void _init_available_page_threshold(struct adapter *padapter,
+					   u8 numHQ, u8 numNQ,
+					   u8 numLQ, u8 numPubQ)
 {
 	u16 HQ_threshold, NQ_threshold, LQ_threshold;
 
@@ -852,7 +856,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	u8 bMacPwrCtrlOn;
 
 	/*  Run LPS WL RFOFF flow */
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
 	/* 	==== Reset digital sequence   ====== */
 
@@ -881,7 +886,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
+	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
 }
 
 u32 rtl8723bs_hal_deinit(struct adapter *padapter)
@@ -1116,7 +1122,8 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 
 	if (!padapter->hw_init_completed) {
 		rtw_write8(padapter, 0x67, 0x00); /*  for BT, Switch Ant control to BT */
-		CardDisableRTL8723BSdio(padapter);/* for the power consumption issue,  wifi ko module is loaded during booting, but wifi GUI is off */
+		/* Power consumption issue: wifi module loaded at boot but GUI off */
+		CardDisableRTL8723BSdio(padapter);
 	}
 
 	return _SUCCESS;
-- 
2.52.0

