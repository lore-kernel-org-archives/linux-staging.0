Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA054528D
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 19:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155249; cv=none; b=n/TRpU6zx+OMVYa54zbQTdcAOsujNefo1ujUDoUdukE7Z5EMJP9acuMhGl5mB53A4MdTS1QMi+FZVjzHeO4Exz5Uo3rT9eYwC/OeF/QfopvSgsp9hqtwkixjGwvC3EhlxvWLdDbGAHZu97pv+EWi++iepHrghy5wcqM5Azbg88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155249; c=relaxed/simple;
	bh=nCN72QXGZFJHa8RTTVAAez+As+vLOFh08KBxm7omPe8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K/3dVuPU6rSi/SDXl7aBzcW6R+81Dt03MJ+uslstg+OXUIcAujU+zehRpOVtiaCVK5VwU+DJtjSib/9gZqFwlq0uJAu/07Ix+I+RppireyH6OIRRQkg9ZqQVorC42XitWOQ30ku7vPICwM0E7llp1Yk/yj1eGnVZic0uYlthOJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJDqZi9O; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJDqZi9O"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1691564a91.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 12:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789155230; x=1789760030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3ssUuEUHsNRd3a5w/yrQ08t0yYJv7VICvPm/JnQbqg=;
        b=hJDqZi9OzMbibdRn2AwQtQpG43NwOL4TaiVib8MdrDyCxrRKPNK3FXUkyBxqB1u6uK
         F7/XJxRMh35hzdi2YUzLM1eTFrJhmdfvk0/rlJuLxjLgevq9bq3iwhH28SRSF//MJawG
         36fMe1ofoYK6WNraZ9hWu1srP2wwchCnFRv4xAZQbucfByd7B39lOrql4OBRyD2qWMH+
         kI4GwqIjDSlPfVFtkHukdfVepI2EsJtG67RZF06IpTmSIBIH3Jd6q9tkxRYmlxYvo9Dj
         wv2Cx7YPVLrdePafYXdwBiqOg0RSSf0Sm2LUaxJ9gixStP+LurFltUgi7niZK2KqtfZM
         4CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155230; x=1789760030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3ssUuEUHsNRd3a5w/yrQ08t0yYJv7VICvPm/JnQbqg=;
        b=Y2eQ+8JW+i4EZBZM8II5fOIhkQ3vjymj7hAm5ijmC2KaMrv8BhL9YzMqNoRpgEYizl
         lPiqfModVVghLENM+jVnWmY5f2ir+tbf2A9tYQNqC7WdszHJMMxaH90Sm2fVPQZLGGgY
         PEJVB5X3f6dODoprxm2vSAsFLC8Oqpd2Lf4Bryv926w1YWL08+eP/3/LFzvflgQ1K0zX
         2eJxaV3r+kUVaZIT9Jqws6OO1S03MXj+RqztFWm5cN7R5EP3TSIbNe2a88bm6paUNb52
         cKA8uLBBtZvajGKjKlH4Djwxl92NS98Agp1JA9QGOZTdRPsKSKen3JNoGiZzmr38uYck
         2esA==
X-Gm-Message-State: AFuF++mVc3F3xYM+QCMGXhvbXWatHXzoIzskxubKQ7DflnZx2aG/hKpw
	YuoicnqnBGVVDP1wugvOd4BbKJd2Wvxn3Qd8CfVQX34XA3Ul+c7y7kRaku680Q==
X-Gm-Gg: AYBFou3sLK0I9D6si5C+WmnpMf0Hr3TQV7K34YDv6a8HpE3lod19KerorM5Gq3vkPHC
	7b8ClAyJ6ADjor49uUNaEMdryN1+hTfrO8mlmKvtJt/yxO2MHkWmnVa+TMI/uvwTclpJBCFGsV8
	tBoTmuWyxCfrbJYMUdi7fuUZ3+en4DXoKCMgiBWQ1LnwtE/YoZ6Uq4AdJZkX64LFhLyce4edwmT
	L+vHcKfbZ3v/ZEEGelkklc6ayBeNmuXh5WH3+ZPvSMI0xKDySQa0Izn8XOKG4pOuR/kD3klhz7w
	OiO3GskQ84lhAVPy2n3JrGsF+3rpwlJgdVYP58wiAvwfI5kLcTWIBIFPwaVuhPDztnH6ix2t3d0
	wsLaj7a8ysWRX1OmVoUK2wxhbHABT8FfsyIeBUn9Fw6yF1oFRKeGBpexVuCSn8GswTpavzjExZP
	jt2k/I3yNftsLnpznyFL0i5x4j2meyGUE/19sk9vz7zFXQzzwvEI2L0UmuzDakdrhv6UnklEN1K
	J7Wc8OR6Q==
X-Received: by 2002:a17:90b:3947:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-39d9bc1549emr9098508a91.3.1789155230151;
        Fri, 11 Sep 2026 12:33:50 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4cf015csm9426927eec.4.2026.09.11.12.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:33:49 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 2/2] staging: rtl8723bs: delete empty comment lines in source files
Date: Fri, 11 Sep 2026 12:33:35 -0700
Message-Id: <20260911193335.6908-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911193335.6908-1-guojy.bj@gmail.com>
References: <20260911193335.6908-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete all empty comment lines in hal/ and os_dep/ source files as they
are not serving any purpose. Add back a newline if needed for spacing,
while avoiding multiple blank lines.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 16 ---------
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  8 -----
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  6 +---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  2 --
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |  6 ----
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 13 --------
 drivers/staging/rtl8723bs/hal/odm.c           | 26 ---------------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  7 ----
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  6 ----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 30 -----------------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 21 +-----------
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  2 --
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  4 ---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 33 -------------------
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 17 ----------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 +--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  6 ++--
 17 files changed, 7 insertions(+), 200 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 0613beaa3752..2845ae14977a 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -221,9 +221,7 @@ static void halbtc8723b1ant_LimitedRx(
 	bool bBtCtrlRxAggSize = bBtCtrlAggBufSize;
 	u8 rxAggSize = aggBufSize;
 
-	/*  */
 	/*	Rx Aggregation related setting */
-	/*  */
 	pBtCoexist->fBtcSet(
 		pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg
 	);
@@ -1346,7 +1344,6 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 
 		halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 2);
 		pCoexDm->psTdmaDuAdjType = 2;
-		/*  */
 		up = 0;
 		dn = 0;
 		m = 1;
@@ -1525,17 +1522,9 @@ static void halbtc8723b1ant_PowerSaveState(
 	}
 }
 
-/*  */
-/*  */
 /*	Software Coex Mechanism start */
-/*  */
-/*  */
 
-/*  */
-/*  */
 /*	Non-Software Coex Mechanism start */
-/*  */
-/*  */
 static void halbtc8723b1ant_ActionWifiMultiPort(struct btc_coexist *pBtCoexist)
 {
 	halbtc8723b1ant_PowerSaveState(pBtCoexist, BTC_PS_WIFI_NATIVE, 0x0, 0x0);
@@ -2058,12 +2047,8 @@ static void halbtc8723b1ant_InitHwConfig(
 	pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
 }
 
-/*  */
 /*  work around function start with wa_halbtc8723b1ant_ */
-/*  */
-/*  */
 /*  extern function start with EXhalbtc8723b1ant_ */
-/*  */
 void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 {
 	struct btc_board_info *pBoardInfo = &pBtCoexist->boardInfo;
@@ -2081,7 +2066,6 @@ void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	/*  set WLAN_ACT = 0 */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
-	/*  */
 	/*  S0 or S1 setting and Local register setting(By the setting fw can get ant number, S0/S1, ... info) */
 	/*  Local setting bit define */
 	/*	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 0220bacee181..f7e126c69a5a 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -167,9 +167,7 @@ static void halbtc8723b2ant_LimitedRx(
 	bool bBtCtrlRxAggSize = bBtCtrlAggBufSize;
 	u8 rxAggSize = aggBufSize;
 
-	/*  */
 	/*	Rx Aggregation related setting */
-	/*  */
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg);
 	/*  decide BT control aggregation buf size or not */
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_BT_CTRL_AGG_SIZE, &bBtCtrlRxAggSize);
@@ -1209,7 +1207,6 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 				}
 			}
 		}
-		/*  */
 		up = 0;
 		dn = 0;
 		m = 1;
@@ -2315,12 +2312,8 @@ static void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bB
 	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x40, 0x20, 0x1);
 }
 
-/*  */
 /*  work around function start with wa_halbtc8723b2ant_ */
-/*  */
-/*  */
 /*  extern function start with EXhalbtc8723b2ant_ */
-/*  */
 void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 {
 	struct btc_board_info *pBoardInfo = &pBtCoexist->boardInfo;
@@ -2338,7 +2331,6 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	/*  set WLAN_ACT = 0 */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x76e, 0x4);
 
-	/*  */
 	/*  S0 or S1 setting and Local register setting(By the setting fw can get ant number, S0/S1, ... info) */
 	/*  Local setting bit define */
 	/*	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 16a47197037e..083d60871a68 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -13,14 +13,11 @@ void ConfigureTxpowerTrack(struct dm_odm_t *pDM_Odm, struct txpwrtrack_cfg *pCon
 	ConfigureTxpowerTrack_8723B(pConfig);
 }
 
-/*  */
 /*  <20121113, Kordan> This function should be called when TxAGC changed. */
 /*  Otherwise the previous compensation is gone, because we record the */
 /*  delta of temperature between two TxPowerTracking watch dogs. */
-/*  */
 /*  NOTE: If Tx BB swing or Tx scaling is varified during run-time, still */
 /*        need to call this function. */
-/*  */
 void ODM_ClearTxPowerTrackingState(struct dm_odm_t *pDM_Odm)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(pDM_Odm->Adapter);
@@ -238,10 +235,9 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		/* 4 7.2 Configure the Swing Table to adjust Tx Power. */
 
 		pDM_Odm->RFCalibrateInfo.bTxPowerChanged = true; /*  Always true after Tx Power is adjusted by power tracking. */
-		/*  */
 		/*  2012/04/23 MH According to Luke's suggestion, we can not write BB digital */
 		/*  to increase TX power. Otherwise, EVM will be bad. */
-		/*  */
+
 		/*  2012/04/25 MH Add for tx power tracking to set tx power in tx agc for 88E. */
 
 		if (ThermalValue > pHalData->EEPROMThermalMeter) {
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index ae01560dc8dd..05cb0575f2b5 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1005,9 +1005,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 	}
 }
 
-/*  */
 /*  2011/07/26 MH Add an API for testing IQK fail case. */
-/*  */
 /*  MP Already declare in odm.c */
 
 void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index c254e3481cc2..d23fe86d53bc 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -23,15 +23,11 @@
 #include <drv_types.h>
 #include <HalPwrSeqCmd.h>
 
-/*  */
 /*  Description: */
 /*  This routine deal with the Power Configuration CMDs parsing for RTL8723/RTL8188E Series IC. */
-/*  */
 /*  Assumption: */
 /*  We should follow specific format which was released from HW SD. */
-/*  */
 /*  2011.07.07, added by Roger. */
-/*  */
 u8 HalPwrSeqCmdParsing(
 	struct adapter *padapter,
 	u8 CutVersion,
@@ -64,10 +60,8 @@ u8 HalPwrSeqCmdParsing(
 			case PWR_CMD_WRITE:
 				offset = GET_PWR_CFG_OFFSET(PwrCfgCmd);
 
-				/*  */
 				/*  <Roger_Notes> We should deal with interface specific address mapping for some interfaces, e.g., SDIO interface */
 				/*  2011.07.07. */
-				/*  */
 				if (GET_PWR_CFG_BASE(PwrCfgCmd) == PWR_BASEADDR_SDIO) {
 					/*  Read Back SDIO Local value */
 					value = SdioLocalCmd52Read1Byte(padapter, offset);
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 61cdc27a64ac..e99c94e28c47 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -15,9 +15,7 @@ struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
-/*  */
 /*		Debug related function */
-/*  */
 static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 {
 	if (!pBtCoexist->bBinded || !pBtCoexist->Adapter)
@@ -197,11 +195,9 @@ static u32 _halbtcoutsrc_GetWifiLinkStatus(struct adapter *padapter)
 
 static u32 halbtcoutsrc_GetWifiLinkStatus(struct btc_coexist *pBtCoexist)
 {
-	/*  */
 	/*  return value: */
 	/*  [31:16]=> connected port number */
 	/*  [15:0]=> port connected bit define */
-	/*  */
 
 	struct adapter *padapter;
 	u32 retVal;
@@ -539,7 +535,6 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 	case BTC_SET_ACT_CTRL_8723B_ANT:
 		ret = false;
 		break;
-	/*  */
 	default:
 		ret = false;
 		break;
@@ -548,9 +543,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 	return ret;
 }
 
-/*  */
 /*		IO related function */
-/*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
 	struct btc_coexist *pBtCoexist;
@@ -746,9 +739,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 	rtw_hal_fill_h2c_cmd(padapter, elementId, cmdLen, pCmdBuffer);
 }
 
-/*  */
 /*		Extern functions called by other module */
-/*  */
 static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 {
 	struct btc_coexist *pBtCoexist = &GLBtCoexist;
@@ -1057,10 +1048,8 @@ void EXhalbtcoutsrc_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState)
 	if (!halbtcoutsrc_IsBtCoexistAvailable(pBtCoexist))
 		return;
 
-	/*  */
 	/*  currently only 1ant we have to do the notification, */
 	/*  once pnp is notified to sleep state, we have to leave LPS that we can sleep normally. */
-	/*  */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_PnpNotify(pBtCoexist, pnpState);
@@ -1100,9 +1089,7 @@ void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
 	}
 }
 
-/*  */
 /*  Currently used by 8723b only, S0 or S1 */
-/*  */
 void EXhalbtcoutsrc_SetSingleAntPath(u8 singleAntPath)
 {
 	GLBtCoexist.boardInfo.singleAntPath = singleAntPath;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index d18df407e365..0fe59304a35a 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -358,8 +358,6 @@ bool ODM_RAStateCheck(
 	return false;
 }
 
-/*  */
-
 /* 3 ============================================================ */
 /* 3 RSSI Monitor */
 /* 3 ============================================================ */
@@ -558,13 +556,9 @@ void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
 	}
 }
 
-/*  */
 /* 3 Export Interface */
-/*  */
 
-/*  */
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
-/*  */
 void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 {
 
@@ -586,11 +580,9 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 	odm_SwAntDetectInit(pDM_Odm);
 }
 
-/*  */
 /*  2011/09/20 MH This is the entry pointer for all team to execute HW out source DM. */
 /*  You can not add any dummy function here, be care, you can only use DM structure */
 /*  to perform any new ODM_DM. */
-/*  */
 void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 {
 	odm_CommonInfoSelfUpdate(pDM_Odm);
@@ -633,18 +625,12 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	pDM_Odm->PhyDbgInfo.NumQryBeaconPkt = 0;
 }
 
-/*  */
 /*  Init /.. Fixed HW value. Only init time. */
-/*  */
 void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 Value)
 {
-	/*  */
 	/*  This section is used for init value */
-	/*  */
 	switch (CmnInfo) {
-	/*  */
 	/*  Fixed ODM value. */
-	/*  */
 	case ODM_CMNINFO_ABILITY:
 		pDM_Odm->SupportAbility = (u32)Value;
 		break;
@@ -729,13 +715,9 @@ void ODM_CmnInfoInit(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, u32 V
 
 void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void *pValue)
 {
-	/*  */
 	/*  Hook call by reference pointer. */
-	/*  */
 	switch (CmnInfo) {
-	/*  */
 	/*  Dynamic call by reference pointer. */
-	/*  */
 	case ODM_CMNINFO_MAC_PHY_MODE:
 		pDM_Odm->pMacPhyMode = pValue;
 		break;
@@ -857,13 +839,9 @@ void ODM_CmnInfoPtrArrayHook(
 	void *pValue
 )
 {
-	/*  */
 	/*  Hook call by reference pointer. */
-	/*  */
 	switch (CmnInfo) {
-	/*  */
 	/*  Dynamic call by reference pointer. */
-	/*  */
 	case ODM_CMNINFO_STA_STATUS:
 		pDM_Odm->pODM_StaInfo[Index] = (PSTA_INFO_T)pValue;
 		break;
@@ -875,14 +853,10 @@ void ODM_CmnInfoPtrArrayHook(
 
 }
 
-/*  */
 /*  Update Band/CHannel/.. The values are dynamic but non-per-packet. */
-/*  */
 void ODM_CmnInfoUpdate(struct dm_odm_t *pDM_Odm, u32 CmnInfo, u64 Value)
 {
-	/*  */
 	/*  This init variable may be changed in run time. */
-	/*  */
 	switch (CmnInfo) {
 	case ODM_CMNINFO_LINK_IN_PROGRESS:
 		pDM_Odm->bLinkInProcess = (bool)Value;
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 1716252641d3..34b0369a7936 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -46,9 +46,7 @@ s32 odm_signal_scale_mapping(struct dm_odm_t *dm_odm, s32 curr_sig)
 
 static u8 odm_evm_db_to_percentage(s8 value)
 {
-	/*  */
 	/*  -33dB~0dB to 0%~99% */
-	/*  */
 	s8 ret_val;
 
 	ret_val = value;
@@ -383,9 +381,7 @@ static void odm_Process_RSSIForDM(
 	}
 }
 
-/*  */
 /*  Endianness before calling this API */
-/*  */
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
 			  u8 *phy_status, struct odm_packet_info *pkt_info)
 {
@@ -396,10 +392,7 @@ void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info
 		odm_Process_RSSIForDM(dm_odm, phy_info, pkt_info);
 }
 
-/*  */
 /*  If you want to add a new IC, Please follow below template and generate a new one. */
-/*  */
-/*  */
 
 enum hal_status ODM_ConfigRFWithHeaderFile(
 	struct dm_odm_t *pDM_Odm,
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 13efbfa5b58a..5e291bdb61c5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -12,9 +12,7 @@
 
 /*  Global var */
 
-/*  */
 /*  functions */
-/*  */
 static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 {
 
@@ -23,9 +21,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	struct dm_priv *pdmpriv = &pHalData->dmpriv;
 	u8 cut_ver, fab_ver;
 
-	/*  */
 	/*  Init Value */
-	/*  */
 	memset(pDM_Odm, 0, sizeof(*pDM_Odm));
 
 	pDM_Odm->Adapter = Adapter;
@@ -76,9 +72,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 		| ODM_RF_CALIBRATION
 		;
 
-	/*  */
 	/*  Pointer reference */
-	/*  */
 	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
 	/* ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1389e5598d3e..789133cc1c59 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -281,11 +281,8 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 	}
 }
 
-/*  */
 /*	Description: */
 /*		Download 8192C firmware code. */
-/*  */
-/*  */
 s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 {
 	s32 rtStatus = _SUCCESS;
@@ -435,9 +432,7 @@ void rtl8723b_InitializeFirmwareVars(struct adapter *padapter)
 /* pHalData->H2CStopInsertQueue = false; */
 }
 
-/*  */
 /*				Efuse related code */
-/*  */
 static u8 hal_EfuseSwitchToBank(
 	struct adapter *padapter, u8 bank
 )
@@ -628,9 +623,7 @@ static void hal_ReadEFuse_WiFi(
 	u16 i, total, used;
 	u8 efuse_usage = 0;
 
-	/*  */
 	/*  Do NOT excess total size of EFuse table. Added by Roger, 2008.11.10. */
-	/*  */
 	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
@@ -717,9 +710,7 @@ static void hal_ReadEFuse_BT(
 	u16 i, total, used;
 	u8 efuse_usage;
 
-	/*  */
 	/*  Do NOT excess total size of EFuse table. Added by Roger, 2008.11.10. */
-	/*  */
 	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
@@ -791,9 +782,7 @@ static void hal_ReadEFuse_BT(
 	for (i = 0; i < _size_byte; i++)
 		pbuf[i] = efuseTbl[_offset+i];
 
-	/*  */
 	/*  Calculate Efuse utilization. */
-	/*  */
 	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total);
 	used = (EFUSE_BT_REAL_BANK_CONTENT_LEN*(bank-1)) + eFuse_Addr - 1;
 	efuse_usage = (u8)((used*100)/total);
@@ -932,23 +921,17 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 
 	bcn_ctrl_reg = REG_BCN_CTRL;
 
-	/*  */
 	/*  ATIM window */
-	/*  */
 	rtw_write16(padapter, REG_ATIMWND, 2);
 
-	/*  */
 	/*  Beacon interval (in unit of TU). */
-	/*  */
 	rtw_write16(padapter, REG_BCN_INTERVAL, pmlmeinfo->bcn_interval);
 
 	rtl8723b_InitBeaconParameters(padapter);
 
 	rtw_write8(padapter, REG_SLOT, 0x09);
 
-	/*  */
 	/*  Reset TSF Timer to zero, added by Roger. 2008.06.24 */
-	/*  */
 	value32 = rtw_read32(padapter, REG_TCR);
 	value32 &= ~TSFRST;
 	rtw_write32(padapter, REG_TCR, value32);
@@ -1084,11 +1067,7 @@ u8 GetEEPROMSize8723B(struct adapter *padapter)
 	return size;
 }
 
-/*  */
-/*  */
 /*  LLT R/W/Init function */
-/*  */
-/*  */
 s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 {
 	unsigned long start, passing_time;
@@ -1448,9 +1427,7 @@ void Hal_EfuseParseThermalMeter_8723B(
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
-	/*  */
 	/*  ThermalMeter from EEPROM */
-	/*  */
 	if (!AutoLoadFail)
 		pHalData->EEPROMThermalMeter = PROMContent[EEPROM_THERMAL_METER_8723B];
 	else
@@ -1464,10 +1441,7 @@ void Hal_ReadRFGainOffset(
 	struct adapter *Adapter, u8 *PROMContent, bool AutoloadFail
 )
 {
-	/*  */
 	/*  BB_RF Gain Offset from EEPROM */
-	/*  */
-
 	if (!AutoloadFail) {
 		Adapter->eeprompriv.EEPROMRFGainOffset = PROMContent[EEPROM_RF_GAIN_OFFSET];
 		Adapter->eeprompriv.EEPROMRFGainVal = rtw_efuse_read_1_byte(Adapter,
@@ -1771,12 +1745,10 @@ void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pbuf)
 	rtl8723b_cal_txdesc_chksum(pdesc);
 }
 
-/*  */
 /*  Description: In normal chip, we should send some packet to Hw which will be used by Fw */
 /*			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
 /*			Fw can tell Hw to send these packet derectly. */
 /*  Added by tynli. 2009.10.15. */
-/*  */
 /* type1:pspoll, type2:null */
 void rtl8723b_fill_fake_txdesc(
 	struct adapter *padapter,
@@ -1814,9 +1786,7 @@ void rtl8723b_fill_fake_txdesc(
 
 	SET_TX_DESC_TX_RATE_8723B(pDesc, DESC8723B_RATE1M);
 
-	/*  */
 	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
-	/*  */
 	if (bDataFrame) {
 		u32 EncAlg = padapter->securitypriv.dot11_privacy_algrthm;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 737e2a818c18..affad2a65e87 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -79,9 +79,7 @@ void PHY_SetBBReg_8723B(
 	rtw_write32(Adapter, RegAddr, Data);
 }
 
-/*  */
 /*  2. RF register R/W API */
-/*  */
 
 static u32 phy_RFSerialRead_8723B(
 	struct adapter *Adapter, enum rf_path eRFPath, u32 Offset
@@ -96,9 +94,7 @@ static u32 phy_RFSerialRead_8723B(
 	u32 MaskforPhySet = 0;
 	int i = 0;
 
-	/*  */
 	/*  Make sure RF register offset is correct */
-	/*  */
 	Offset &= 0xff;
 
 	NewOffset = Offset;
@@ -189,18 +185,13 @@ static void phy_RFSerialWrite_8723B(
 
 	Offset &= 0xff;
 
-	/*  */
 	/*  Switch page for 8256 RF IC */
-	/*  */
 	NewOffset = Offset;
 
-	/*  */
 	/*  Put write addr in [5:0]  and write data in [31:16] */
-	/*  */
 	DataAndAddr = ((NewOffset << 20) | (Data & 0x000fffff)) & 0x0fffffff;	/*  T65 RF */
-	/*  */
+
 	/*  Write Operation */
-	/*  */
 	PHY_SetBBReg(Adapter, pPhyReg->rf3wireOffset, bMaskDWord, DataAndAddr);
 }
 
@@ -265,9 +256,7 @@ void PHY_SetRFReg_8723B(
 	phy_RFSerialWrite_8723B(Adapter, eRFPath, RegAddr, Data);
 }
 
-/*  */
 /*  3. Initial MAC/BB/RF config by reading MAC/BB/RF txt. */
-/*  */
 
 /*-----------------------------------------------------------------------------
  * PHY_MACConfig8192C - Config MAC by header file or parameter file.
@@ -333,9 +322,7 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 	   pHalData->EEPROMRegulatory == 1))
 		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, CONFIG_RF_TXPWR_LMT, 0);
 
-	/*  */
 	/*  1. Read PHY_REG.TXT BB INIT!! */
-	/*  */
 	ODM_ConfigBBWithHeaderFile(&pHalData->odmpriv, CONFIG_BB_PHY_REG);
 
 	/*  If EEPROM or EFUSE autoload OK, We must config by PHY_REG_PG.txt */
@@ -355,9 +342,7 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 			PHY_ConvertTxPowerLimitToPowerIndex(Adapter);
 	}
 
-	/*  */
 	/*  2. Read BB AGC table Initialization */
-	/*  */
 	ODM_ConfigBBWithHeaderFile(&pHalData->odmpriv, CONFIG_BB_AGC_TAB);
 
 	return _SUCCESS;
@@ -389,9 +374,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
 
-	/*  */
 	/*  Config BB and AGC */
-	/*  */
 	rtStatus = phy_BB8723b_Config_ParaFile(Adapter);
 
 	/*  0x2C[23:18] = 0x2C[17:12] = CrystalCap */
@@ -413,9 +396,7 @@ int PHY_RFConfig8723B(struct adapter *Adapter)
 {
 	int rtStatus = _SUCCESS;
 
-	/*  */
 	/*  RF config */
-	/*  */
 	rtStatus = PHY_RF6052_Config8723B(Adapter);
 
 	phy_LCK_8723B(Adapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index e4f047b14827..c8b2875b909c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -125,9 +125,7 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 int PHY_RF6052_Config8723B(struct adapter *Adapter)
 {
-	/*  */
 	/*  Config BB and RF */
-	/*  */
 	return phy_RF6052_Config_ParaFile(Adapter);
 
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
index ac1249676794..5105b060f6a1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
@@ -52,9 +52,7 @@ static void process_link_qual(struct adapter *padapter, union recv_frame *prfram
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe)
 {
 	union recv_frame *precvframe = prframe;
-	/*  */
 	/*  Check RSSI */
-	/*  */
 	process_rssi(padapter, precvframe);
 	/*  */
 	/*  Check PWDB. */
@@ -62,8 +60,6 @@ void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe)
 	/* process_PWDB(padapter, precvframe); */
 
 	/* UpdateRxSignalStatistics8192C(Adapter, pRfd); */
-	/*  */
 	/*  Check EVM */
-	/*  */
 	process_link_qual(padapter,  precvframe);
 }
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 001b4b32c02e..aa12bd906302 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -492,9 +492,7 @@ static void _InitOperationMode(struct adapter *padapter)
 	pmlmeext = &padapter->mlmeextpriv;
 
 	/* 1 This part need to modified according to the rate set we filtered!! */
-	/*  */
 	/*  Set RRSR, RATR, and REG_BWOPMODE registers */
-	/*  */
 	switch (pmlmeext->cur_wireless_mode) {
 	case WIRELESS_MODE_B:
 		regBwOpMode = BW_OPMODE_20MHZ;
@@ -527,9 +525,7 @@ static void _InitInterrupt(struct adapter *padapter)
 	/*  HIMR - turn all off */
 	rtw_write32(padapter, REG_HIMR, 0);
 
-	/*  */
 	/*  Initialize and enable SDIO Host Interrupt. */
-	/*  */
 	InitInterrupt8723BSdio(padapter);
 }
 
@@ -619,9 +615,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	ret = PHY_MACConfig8723B(padapter);
 	if (ret != _SUCCESS)
 		return ret;
-	/*  */
 	/* d. Initialize BB related configurations. */
-	/*  */
 	ret = PHY_BBConfig8723B(padapter);
 	if (ret != _SUCCESS)
 		return ret;
@@ -635,9 +629,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 			return ret;
 	}
 
-	/*  */
 	/*  Joseph Note: Keep RfRegChnlVal for later use. */
-	/*  */
 	pHalData->RfRegChnlVal[0] =
 		PHY_QueryRFReg(padapter, (enum rf_path)0, RF_CHNLBW, bRFRegOffsetMask);
 	pHalData->RfRegChnlVal[1] =
@@ -651,7 +643,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	if (ret != _SUCCESS)
 		return _FAIL;
 
-	/*  */
 	_InitQueuePriority(padapter);
 	_InitPageBoundary(padapter);
 	_InitTransferPageSize(padapter);
@@ -684,29 +675,23 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitAntenna_Selection(padapter);
 
-	/*  */
 	/*  Disable BAR, suggested by Scott */
 	/*  2010.04.09 add by hpfan */
-	/*  */
 	rtw_write32(padapter, REG_BAR_MODE_CTRL, 0x0201ffff);
 
 	/*  HW SEQ CTRL */
 	/*  set 0x0 to 0xFF by tynli. Default enable HW SEQ NUM. */
 	rtw_write8(padapter, REG_HWSEQ_CTRL, 0xFF);
 
-	/*  */
 	/*  Configure SDIO TxRx Control to enable Rx DMA timer masking. */
 	/*  2010.02.24. */
-	/*  */
 	rtw_write32(padapter, SDIO_LOCAL_BASE | SDIO_REG_TX_CTRL, 0);
 
 	_RfPowerSave(padapter);
 
 	rtl8723b_InitHalDm(padapter);
 
-	/*  */
 	/*  Update current Tx FIFO page status. */
-	/*  */
 	HalQueryTxBufferStatus8723BSdio(padapter);
 	HalQueryTxOQTBufferStatus8723BSdio(padapter);
 	pHalData->SdioTxOQTMaxFreeSpace = pHalData->SdioTxOQTFreeSpace;
@@ -774,12 +759,9 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-/*  */
 /*  Description: */
 /*	RTL8723e card disable power sequence v003 which suggested by Scott. */
-/*  */
 /*  First created by tynli. 2011.01.28. */
-/*  */
 static void CardDisableRTL8723BSdio(struct adapter *padapter)
 {
 	u8 val;
@@ -924,15 +906,11 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
 	Hal_MappingOutPipe(padapter, pHalData->OutEpNumber);
 }
 
-/*  */
 /*	Description: */
 /*		We should set Efuse cell selection to WiFi cell in default. */
-/*  */
 /*	Assumption: */
 /*		PASSIVE_LEVEL */
-/*  */
 /*	Added by Roger, 2010.11.23. */
-/*  */
 static void _EfuseCellSel(struct adapter *padapter)
 {
 	u32 value32;
@@ -976,10 +954,7 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u8 *hwinfo = NULL;
 
-	/*  */
 	/*  This part read and parse the eeprom/efuse content */
-	/*  */
-
 	hwinfo = pEEPROM->efuse_eeprom_data;
 
 	Hal_InitPGData(padapter, hwinfo);
@@ -991,9 +966,7 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	Hal_EfuseParseTxPowerInfo_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseBoardType_8723BS(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
-	/*  */
 	/*  Read Bluetooth co-exist and initialize */
-	/*  */
 	Hal_EfuseParsePackageType_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseBTCoexistInfo_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseChnlPlan_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
@@ -1018,14 +991,10 @@ static void _ReadPROMContent(struct adapter *padapter)
 	_ReadEfuseInfo8723BS(padapter);
 }
 
-/*  */
 /*	Description: */
 /*		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
-/*  */
 /*	Assumption: */
 /*		PASSIVE_LEVEL (SDIO interface) */
-/*  */
-/*  */
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 {
 	u8 val8;
@@ -1139,10 +1108,8 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
 	}
 }
 
-/*  */
 /*	Description: */
 /*		Query setting of specified variable. */
-/*  */
 u8 GetHalDefVar8723BSDIO(
 	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
 )
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index da2d9088ab5a..265e773e3226 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -7,12 +7,9 @@
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
 
-/*  */
 /*  Description: */
 /*	The following mapping is for SDIO host local register space. */
-/*  */
 /*  Creadted by Roger, 2011.01.31. */
-/*  */
 static void hal_sdio_get_cmd_addr_8723b(struct adapter *adapter, u8 device_id,
 					u32 addr, u32 *cmdaddr)
 {
@@ -562,15 +559,11 @@ static s32 read_interrupt_8723b_sdio(struct adapter *adapter, u32 *phisr)
 	return true;
 }
 
-/*  */
 /*	Description: */
 /*		Initialize SDIO Host Interrupt Mask configuration variables for future use. */
-/*  */
 /*	Assumption: */
 /*		Using SDIO Local register ONLY for configuration. */
-/*  */
 /*	Created by Roger, 2011.02.11. */
-/*  */
 void InitInterrupt8723BSdio(struct adapter *adapter)
 {
 	struct hal_com_data *haldata;
@@ -598,11 +591,9 @@ void rtw_sdio_enable_interrupt(struct adapter *adapter)
 	himr = cpu_to_le32(haldata->sdio_himr);
 	sdio_local_write(adapter, SDIO_REG_HIMR, 4, (u8 *)&himr);
 
-	/*  */
 	/*  <Roger_Notes> There are some C2H CMDs have been sent before system interrupt is enabled, e.g., C2H, CPWM. */
 	/*  So we need to clear all C2H events that FW has notified, otherwise FW won't schedule any commands anymore. */
 	/*  2011.10.19. */
-	/*  */
 	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
 }
 
@@ -620,15 +611,11 @@ void rtw_sdio_disable_interrupt(struct adapter *adapter)
 	sdio_local_write(adapter, SDIO_REG_HIMR, 4, (u8 *)&himr);
 }
 
-/*  */
 /*	Description: */
 /*		Using 0x100 to check the power status of FW. */
-/*  */
 /*	Assumption: */
 /*		Using SDIO Local register ONLY for configuration. */
-/*  */
 /*	Created by Isaac, 2013.09.10. */
-/*  */
 u8 CheckIPSStatus(struct adapter *adapter)
 {
 	if (rtw_read8(adapter, 0x100) == 0xEA)
@@ -826,16 +813,12 @@ void sd_int_hdl(struct adapter *adapter)
 	}
 }
 
-/*  */
 /*	Description: */
 /*		Query SDIO Local register to query current the number of Free TxPacketBuffer page. */
-/*  */
 /*	Assumption: */
 /*		1. Running at PASSIVE_LEVEL */
 /*		2. RT_TX_SPINLOCK is NOT acquired. */
-/*  */
 /*	Created by Roger, 2011.01.28. */
-/*  */
 u8 HalQueryTxBufferStatus8723BSdio(struct adapter *adapter)
 {
 	struct hal_com_data *hal;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 4416d0ec1db9..896c457decf7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -595,7 +595,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->binstallGrpkey = true;
 
-			psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+			psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;
 
 			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
@@ -669,7 +669,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->binstallGrpkey = true;
 
-				psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+				psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;
 
 				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..0b7b58e340a7 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -24,9 +24,9 @@ static int rtw_network_mode = NL80211_IFTYPE_ADHOC;/* infra, ad-hoc, auto */
 static int rtw_channel = 1;/* ad-hoc support requirement */
 static int rtw_wireless_mode = WIRELESS_11BG_24N;
 static int rtw_vrtl_carrier_sense = AUTO_VCS;
-static int rtw_vcs_type = RTS_CTS;/*  */
-static int rtw_rts_thresh = 2347;/*  */
-static int rtw_frag_thresh = 2346;/*  */
+static int rtw_vcs_type = RTS_CTS;
+static int rtw_rts_thresh = 2347;
+static int rtw_frag_thresh = 2346;
 static int rtw_preamble = PREAMBLE_LONG;/* long, short, auto */
 static int rtw_scan_mode = 1;/* active, passive */
 static int rtw_adhoc_tx_pwr = 1;
-- 
2.34.1

