Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3A22857EA
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389446; cv=none; b=QKlbCI6YuYEvePNZEWjKK1pqV5XE4xbYhC7r7khXX6tYErPIQYx1zRIFBi0lAcxolf7Q6CEO4go+9oPJdX1U0HoA3WxpT7cG4DHxl4D/fQAz2ezu1YYfGAFyrw9kXQxQuDHrmqrPZBkEwiV06X3FKyjsnrUaeYUcnTio2ssUDFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389446; c=relaxed/simple;
	bh=qY1a8VfVbHp9SU6Xjs5cdf3DLpswIr1H9OP4ykY6D+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lbf1SFxauTgjHqQ7MQ/NpEjjxLnG2KRSYBojZrlxq37dEdWKU0XdzwAy6PEDDtOQGIBc6C52XOiq9AYgBb/JDjaSbF/RMlRJWyb0L/Z85ZDCu0F5jOnElg13DLl6u5R+NUE6/QsvzIiDYuJ1CuXFtljJZHM9h7gcVOR0F2Yb16c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qfRR58yX; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfRR58yX"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c766cf593daso2208900a12.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389444; x=1775994244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo6ltxWShK9/OBBOwezhmDr1x0706vXzcRFsX0LiBh8=;
        b=qfRR58yXt2zj/5HO7RCZDD3XAkE0o5Sz5iyssHSIv2e6GCFv0g2Rw1jUWY4v4RCfud
         gGLmIJuBhX4ic2KcIfczcVN3faEPFVJk++Ii+TtYjVoHh9fbcePJikUuzLD7zPNTjLY8
         1Fx020HXcJC8CQ8A1xi4/iLq7BLm9YzbkjgwLFnyMHG0opX70ky4rW91nJBNMImmOblH
         CHKtWjfCutKFcYuxnNxvpNDWWFaxW7cfypfv3VB0Ze5EO/wRDI/M1PBwx8r/wl/JTRlw
         6DU3mP0wRQFXU+7hB6Dowq28yYhcWssdqK5ICCkvFSybsf0m06NpmDcg2kNpm6v3XU13
         om1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389444; x=1775994244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo6ltxWShK9/OBBOwezhmDr1x0706vXzcRFsX0LiBh8=;
        b=GtaUgrl9SHE49KGIAChsh+povAsbYfDV2usUDIoehQxLFkUzHBHLCSMJwhfN8I1OQc
         cV3abFoSryQvSwvG96Q0TqY60SBWk8cd3IUM3aGOjzs+/Ta7kobVOJHtSV+G6q99/Fbh
         +Y+eAxCs00OJ5LCjw01/PAI61MaT5MjV0i0QyEuM1mLGviWTAkY2LemDdEhBO3FP70TN
         /BlYaa7deAS5NlY8rTbK8yphJirM87E4eLQFChMoQOsBRVH7vYNGZ1FQSVYtcn4kKXmV
         UJFtUa9tfebmSZ+kuuX0xIJZXPW+ofyF4zan4cxLuS578cs2mY/DPmcXG1onB0IvoaN1
         +NKA==
X-Gm-Message-State: AOJu0Yweo49EWUxkWonTbCAlF4zLzTVwi2IcCkV3vGhZXAWdB10nh2QL
	DCpwjR4ihv3ve0+nJavclOrOGknVx7fSrefXKVy1q/RrIlKzYgotxiLd
X-Gm-Gg: AeBDieu/jsVa5uca11pe8R4uKWq7a5v1sZdC65UYPxjvN+qkLQbSwWsPwCqmVRh80bt
	TshG4gk5aFEZF8kWbPzPQfd16/1eIyAIe8MiNl5CdEr9jLiXyo4b7N96Iox3noI9tsI767k86b4
	T73+LqorCHfGrUENpNeJi15ueqkQzYQJub53KhnDk/WWGk7w9wmcvuasu3yH+kOxSAOySGDdcfE
	czAy1cWoXfPOpW/eQelhd1P8xFWgVPBDYau+IXghd86UwvlIVcfgaE29pbbgLggojSrm0Eg4Nd/
	pQvVyKTh1971+R2MU4aYRekV4h3GtEJgv/7FwBup/wB9n4NxHmfkUc7LrrUD2PggZBiNxgTNs9x
	q+VdXy+eUl26j51fb2hZ3fCXT5UC+FT9kq+FDruWasNLU5fM7bUUbmZIppvQYarqfFSmtdp0dBL
	gj2QkCYIflP/fIzpWFJG4HB0HSTT058SLXVaef70ws+v+U83TNvw==
X-Received: by 2002:a05:6a20:3d26:b0:398:f1ed:7fa3 with SMTP id adf61e73a8af0-39f2f16d600mr8791732637.57.1775389444090;
        Sun, 05 Apr 2026 04:44:04 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:03 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 1/5] staging: rtl8723bs: move constant to right side of test in comparison
Date: Sun,  5 Apr 2026 17:11:28 +0530
Message-Id: <20260405114132.310774-2-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move constant from the left side to the right side of the test in a
comparison, where ==, !=, <=, >=, <, > operators are used, fixing the
checkpatch warning: Comparisons should place the constant on the right
side of the test.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  4 ++--
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c        |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c |  4 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  |  4 ++--
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..58f6cf063498 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -2211,7 +2211,7 @@ static void halbtc8723b2ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 	}
 
 	algorithm = halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
-	if (pCoexSta->bC2hBtInquiryPage && (BT_8723B_2ANT_COEX_ALGO_PANHS != algorithm)) {
+	if (pCoexSta->bC2hBtInquiryPage && (algorithm != BT_8723B_2ANT_COEX_ALGO_PANHS)) {
 		halbtc8723b2ant_ActionBtInquiry(pBtCoexist);
 		return;
 	} else {
@@ -2490,7 +2490,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		return;
 	}
 
-	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW != rspSource) {
+	if (rspSource != BT_INFO_SRC_8723B_2ANT_WIFI_FW) {
 		pCoexSta->btRetryCnt = pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [3:0] */
 
 		pCoexSta->btRssi = pCoexSta->btInfoC2h[rspSource][3] * 2 + 10;
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9df3274c1048..9e7eebfc02a9 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -313,7 +313,7 @@ static void GetDeltaSwingTable_8723B(
 	u16 rate = *(pDM_Odm->pForcedDataRate);
 	u8 channel = pHalData->CurrentChannel;
 
-	if (1 <= channel && channel <= 14) {
+	if (channel >= 1 && channel <= 14) {
 		if (IS_CCK_RATE(rate)) {
 			*TemperatureUP_A   = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P;
 			*TemperatureDOWN_A = pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880ae6a..597ba3d283c1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		AutoLoadFail = true;
 
 	if (!AutoLoadFail) {
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index dc2da49e6738..9e523491a008 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -462,11 +462,11 @@ u8 PHY_GetTxPowerIndexBase(
 
 	if (IS_CCK_RATE(Rate))
 		txPower = pHalData->Index24G_CCK_Base[RFPath][chnlIdx];
-	else if (MGN_6M <= Rate)
+	else if (Rate >= MGN_6M)
 		txPower = pHalData->Index24G_BW40_Base[RFPath][chnlIdx];
 
 	/*  OFDM-1T */
-	if ((MGN_6M <= Rate && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
+	if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
 		txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
 
 	if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..02c3f4229e74 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -405,11 +405,11 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 			break;
 	}
 	_FWDownloadEnable(padapter, false);
-	if (_SUCCESS != rtStatus)
+	if (rtStatus != _SUCCESS)
 		goto fwdl_stat;
 
 	rtStatus = _FWFreeToGo(padapter, 10, 200);
-	if (_SUCCESS != rtStatus)
+	if (rtStatus != _SUCCESS)
 		goto fwdl_stat;
 
 fwdl_stat:
@@ -1165,15 +1165,15 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 
 static void hal_get_chnl_group_8723b(u8 channel, u8 *group)
 {
-	if (1  <= channel && channel <= 2)
+	if (channel >= 1 && channel <= 2)
 		*group = 0;
-	else if (3  <= channel && channel <= 5)
+	else if (channel >= 3 && channel <= 5)
 		*group = 1;
-	else if (6  <= channel && channel <= 8)
+	else if (channel >= 6 && channel <= 8)
 		*group = 2;
-	else if (9  <= channel && channel <= 11)
+	else if (channel >= 9 && channel <= 11)
 		*group = 3;
-	else if (12 <= channel && channel <= 14)
+	else if (channel >= 12 && channel <= 14)
 		*group = 4;
 }
 
@@ -1221,7 +1221,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 
 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
 
-	if (0xFF == PROMContent[eeAddr+1])
+	if (PROMContent[eeAddr+1] == 0xFF)
 		AutoLoadFail = true;
 
 	if (AutoLoadFail) {
@@ -2035,7 +2035,7 @@ static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 		val8 &= ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
 
 		/*  Always enable port0 beacon function for PSTDMA */
-		if (REG_BCN_CTRL == bcn_ctrl_reg)
+		if (bcn_ctrl_reg == REG_BCN_CTRL)
 			val8 |= EN_BCN_FUNCTION;
 
 		rtw_write8(padapter, bcn_ctrl_reg, val8);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a1f2cbf2cf55..9f6503ac2234 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -413,7 +413,7 @@ int rtl8723bs_xmit_thread(void *context)
 		if (signal_pending(current)) {
 			flush_signals(current);
 		}
-	} while (_SUCCESS == ret);
+	} while (ret == _SUCCESS);
 
 	complete(&pxmitpriv->SdioXmitTerminate);
 
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 0f28c904a714..0f378830462f 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -395,8 +395,8 @@ enum {
 };
 
 #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
-#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
-#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
+#define IS_CCK_RATE(_rate)				(_rate == MGN_1M || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
+#define IS_OFDM_RATE(_rate)				(_rate >= MGN_6M && _rate <= MGN_54M  && _rate != MGN_11M)
 
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
-- 
2.34.1

