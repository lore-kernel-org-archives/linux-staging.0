Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE5C3ECBC1
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312748; cv=none; b=T2U/+nATYOLQEwCEsBEQAhGtyK+4JlV4VcrFA/b1zkJiiHS0oOmYi8e3ORpqLGz1bvUmQBITQngbuRs/ckudKDDrZNfuCyYEII3tS130sw+Z2/b5EZl0PjBVxkyWBNMl9qqEk+u20dbawjCeIfEPRi/caLazAmRuacfSwC8rmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312748; c=relaxed/simple;
	bh=+fnYq9ub8XbMqVJ/+d7i9VYX5fq+L7LN91JS4gyfsAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D19QeDD+T3EACVksYPl39P8ZJGGTgoKi8dxY1s36UZp/0UWcLexv3kWw+5RRwLvRgACGMnchC4mPJORY5Dfh2HU392nXFICnTLJAAk2S43FfHD6JmQqV/W+JRJ9vXvicGXdcNM9G1wsLKald+E2I9td0QhG5YzwI1I1Cf/AoixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jlhIqnn6; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jlhIqnn6"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g4BCB1xyLz9v0s;
	Mon, 27 Apr 2026 19:59:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777312742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MtiW/bjHDO7l2Cikwbhaq8R7NxTI+rcyOfKpL7E2M6k=;
	b=jlhIqnn6WcnCKRrMyb0cw1G9nxiYaAlwi4eoMPFIA3QckQ0i5JFQLjMWZtdj5emo6znq3E
	B74TXjROzOan8ZJUYp3mzyKI5QxX9UEDXIsiz8xc9e7ZYyj4BsFoVNLsyZcSALdNcljUnv
	ZtUUFwYAk4PAR1qop0rfkzUtOkFUBJyIu4AIJ12ZH5cY1UwGPZhGe8+/aXVHXvXQ/O2SUf
	NInqqzQCFkJNbdgkJEH7fgJrhF1qOvHxgBVpi18BRkAbIWMA0GrMiSA5fnJ2jrE6Npq4Hn
	QR3Jqxl8B3IjXXrh6O6qKzw0jv2OQrJkoUztdxU9CSikM4Hojk1qLkyzLQ1yfw==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v6 2/8] staging: rtl8723bs: hal: simplify boolean comparisons
Date: Mon, 27 Apr 2026 20:58:40 +0300
Message-ID: <20260427175846.23470-3-khomenkov@mailbox.org>
In-Reply-To: <20260427175846.23470-1-khomenkov@mailbox.org>
References: <20260427175846.23470-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: axt9jrwsdd4mmzs1hponfdzx1qx31t8d
X-MBO-RS-ID: 7676089ed4c2b488418

Simplify boolean comparisons to improve readability
and conform to the Linux kernel coding style.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 ++++----
 drivers/staging/rtl8723bs/hal/hal_com.c       |  4 ++--
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  4 ++--
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 ++--
 drivers/staging/rtl8723bs/hal/odm.c           |  8 +++----
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  2 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 24 +++++++++----------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 12 +++++-----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 +++++-----
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +++----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 13 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 2a2dd60be8bb..3974fa0e38b0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -164,8 +164,8 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 
 	pmlmepriv = &padapter->mlmepriv;
 
-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 			return true;
 		if (pmlmepriv->link_detect_info.busy_traffic)
 			return true;
@@ -185,8 +185,8 @@ static u32 _halbtcoutsrc_GetWifiLinkStatus(struct adapter *padapter)
 	bp2p = false;
 	portConnectedStatus = 0;
 
-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (bp2p)
 				portConnectedStatus |= WIFI_P2P_GO_CONNECTED;
 			else
@@ -528,7 +528,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 	case BTC_SET_ACT_UPDATE_RAMASK:
 		pBtCoexist->btInfo.raMask = *pU4Tmp;
 
-		if (check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE) == true) {
+		if (check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) {
 			struct sta_info *psta;
 			struct wlan_bssid_ex *cur_network;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index b4b135a9ca22..7fd6e0249390 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -94,7 +94,7 @@ bool HAL_IsLegalChannel(struct adapter *adapter, u32 Channel)
 	bool bLegalChannel = true;
 
 	if ((Channel <= 14) && (Channel >= 1)) {
-		if (is_supported_24g(adapter->registrypriv.wireless_mode) == false)
+		if (!is_supported_24g(adapter->registrypriv.wireless_mode))
 			bLegalChannel = false;
 	} else {
 		bLegalChannel = false;
@@ -563,7 +563,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		odm->SupportAbility = *((u32 *)val);
 		break;
 	case HW_VAR_DM_FUNC_OP:
-		if (*((u8 *)val) == true) {
+		if (*((u8 *)val)) {
 			/* save dm flag */
 			odm->BK_SupportAbility = odm->SupportAbility;
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 45dbe1782bae..1e5669b17d0f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -461,7 +461,7 @@ u8 PHY_GetTxPowerIndexBase(
 	u8 txPower = 0;
 	u8 chnlIdx = (Channel-1);
 
-	if (HAL_IsLegalChannel(padapter, Channel) == false)
+	if (!HAL_IsLegalChannel(padapter, Channel))
 		chnlIdx = 0;
 
 	if (IS_CCK_RATE(Rate))
@@ -489,7 +489,7 @@ s8 PHY_GetTxPowerTrackingOffset(struct adapter *padapter, u8 RFPath, u8 Rate)
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 	s8 offset = 0;
 
-	if (pDM_Odm->RFCalibrateInfo.TxPowerTrackControl  == false)
+	if (!pDM_Odm->RFCalibrateInfo.TxPowerTrackControl)
 		return offset;
 
 	if ((Rate == MGN_1M) || (Rate == MGN_2M) || (Rate == MGN_5_5M) || (Rate == MGN_11M))
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 529648036f58..e4b2ceba545e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -124,7 +124,7 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
 	/* memcpy(pmgntframe->attrib.ra, pwlanhdr->addr1, ETH_ALEN); */
 
-	if (padapter->securitypriv.binstallBIPkey == true) {
+	if (padapter->securitypriv.binstallBIPkey) {
 		if (is_multicast_ether_addr(pmgntframe->attrib.ra)) {
 			pmgntframe->attrib.encrypt = _BIP_;
 			/* pmgntframe->attrib.bswenc = true; */
@@ -170,7 +170,7 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 	pmlmepriv = &(padapter->mlmepriv);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		add_ratid(padapter, psta, rssi_level);
 	else {
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 3dffa7620768..b01e9016e30c 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -381,7 +381,7 @@ static void FindMinimumRSSI(struct adapter *padapter)
 	/* 1 1.Determine the minimum RSSI */
 
 	if (
-		(pDM_Odm->bLinked != true) &&
+		!pDM_Odm->bLinked &&
 		(pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
 	) {
 		pdmpriv->MinUndecoratedPWDBForDM = 0;
@@ -400,7 +400,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 	u32 PWDB_rssi[NUM_STA] = {0};/* 0~15]:MACID, [16~31]:PWDB_rssi */
 	struct ra_t *pRA_Table = &pDM_Odm->DM_RA_Table;
 
-	if (pDM_Odm->bLinked != true)
+	if (!pDM_Odm->bLinked)
 		return;
 
 	pRA_Table->firstconnect = pDM_Odm->bLinked;
@@ -431,7 +431,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 		for (i = 0; i < sta_cnt; i++) {
 			if (PWDB_rssi[i] != (0)) {
-				if (pHalData->fw_ractrl == true)/*  Report every sta's RSSI to FW */
+				if (pHalData->fw_ractrl)/*  Report every sta's RSSI to FW */
 					rtl8723b_set_rssi_cmd(Adapter, (u8 *)(&PWDB_rssi[i]));
 			}
 		}
@@ -623,7 +623,7 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	}
 	odm_CCKPacketDetectionThresh(pDM_Odm);
 
-	if (*(pDM_Odm->pbPowerSaving) == true)
+	if (*pDM_Odm->pbPowerSaving)
 		return;
 
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 0eaedd8f6469..7e6b49399abb 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -138,7 +138,7 @@ void ODM_CfoTracking(void *pDM_VOID)
 		pCfoTrack->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
-		if (pCfoTrack->bAdjust == false) {
+		if (!pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_HIGH || CFO_ave < (-CFO_TH_XTAL_HIGH))
 				pCfoTrack->bAdjust = true;
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index a31c8368f9d9..426989986cc3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -82,7 +82,7 @@ void odm_NHMBB(void *pDM_VOID)
 
 
 	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
-		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag == true) {
+		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
 			/* test_status = 1; */
 			pDM_Odm->adaptivity_flag = true;
@@ -99,7 +99,7 @@ void odm_NHMBB(void *pDM_VOID)
 			}
 		}
 	} else { /*  TX<RX */
-		if (pDM_Odm->adaptivity_flag == true && pDM_Odm->NHM_cnt_0 <= 200) {
+		if (pDM_Odm->adaptivity_flag && pDM_Odm->NHM_cnt_0 <= 200) {
 			/* test_status = 2; */
 			pDM_Odm->tolerance_cnt = 0;
 		} else {
@@ -189,7 +189,7 @@ void odm_AdaptivityInit(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
-	if (pDM_Odm->Carrier_Sense_enable == false)
+	if (!pDM_Odm->Carrier_Sense_enable)
 		pDM_Odm->TH_L2H_ini = 0xf7; /*  -7 */
 	else
 		pDM_Odm->TH_L2H_ini = 0xa;
@@ -232,7 +232,7 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 	pDM_Odm->IGI_target = (u8) IGI_target;
 
 	/* Search pwdB lower bound */
-	if (pDM_Odm->TxHangFlg == true) {
+	if (pDM_Odm->TxHangFlg) {
 		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_DBG_RPT_11N, bMaskDWord, 0x208);
 		odm_SearchPwdBLowerBound(pDM_Odm, pDM_Odm->IGI_target);
 	}
@@ -253,9 +253,9 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 
 	if (
 		pDM_Odm->bLinked &&
-		pDM_Odm->Carrier_Sense_enable == false &&
-		pDM_Odm->NHM_disable == false &&
-		pDM_Odm->TxHangFlg == false
+		!pDM_Odm->Carrier_Sense_enable &&
+		!pDM_Odm->NHM_disable &&
+		!pDM_Odm->TxHangFlg
 	)
 		odm_NHMBB(pDM_Odm);
 
@@ -323,7 +323,7 @@ bool odm_DigAbort(void *pDM_VOID)
 		return	true;
 
 	/* add by Neil Chen to avoid PSD is processing */
-	if (pDM_Odm->bDMInitialGainEnable == false)
+	if (!pDM_Odm->bDMInitialGainEnable)
 		return	true;
 
 	return	false;
@@ -387,14 +387,14 @@ void odm_DIG(void *pDM_VOID)
 	if (odm_DigAbort(pDM_Odm))
 		return;
 
-	if (pDM_Odm->adaptivity_flag == true)
+	if (pDM_Odm->adaptivity_flag)
 		Adap_IGI_Upper = pDM_Odm->Adaptivity_IGI_upper;
 
 
 	/* 1 Update status */
 	DIG_Dynamic_MIN = pDM_DigTable->DIG_Dynamic_MIN_0;
-	FirstConnect = (pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0 == false);
-	FirstDisConnect = (!pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0 == true);
+	FirstConnect = (pDM_Odm->bLinked) && !pDM_DigTable->bMediaConnect_0;
+	FirstDisConnect = (!pDM_Odm->bLinked) && pDM_DigTable->bMediaConnect_0;
 
 	/* 1 Boundary Decision */
 	/* 2 For WIN\CE */
@@ -529,7 +529,7 @@ void odm_DIG(void *pDM_VOID)
 	/* 1 Force upper bound and lower bound for adaptivity */
 	if (
 		pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY &&
-		pDM_Odm->adaptivity_flag == true
+		pDM_Odm->adaptivity_flag
 	) {
 		if (CurrentIGI > Adap_IGI_Upper)
 			CurrentIGI = Adap_IGI_Upper;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 4bdc8e314015..6c9337179645 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -359,7 +359,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	}
 
 	if (psmode > 0) {
-		if (hal_btcoex_IsBtControlLps(padapter) == true) {
+		if (hal_btcoex_IsBtControlLps(padapter)) {
 			PowerState = hal_btcoex_RpwmVal(padapter);
 			byte5 = hal_btcoex_LpsVal(padapter);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..5cb13a10efd6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -131,21 +131,21 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 
 	hw_init_completed = Adapter->hw_init_completed;
 
-	if (hw_init_completed == false)
+	if (!hw_init_completed)
 		goto skip_dm;
 
 	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;
 	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
 
 	if (
-		(hw_init_completed == true) &&
-		((!fw_current_in_ps_mode) && bFwPSAwake)
+		hw_init_completed &&
+		(!fw_current_in_ps_mode && bFwPSAwake)
 	) {
 		rtw_hal_check_rxfifo_full(Adapter);
 	}
 
 	/* ODM */
-	if (hw_init_completed == true) {
+	if (hw_init_completed) {
 		u8 bLinked = false;
 		u8 bsta_state = false;
 		bool bBtDisabled = true;
@@ -207,7 +207,7 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 	struct sta_priv *pstapriv = &Adapter->stapriv;
 	struct sta_info *psta = NULL;
 
-	if (Adapter->hw_init_completed == false)
+	if (!Adapter->hw_init_completed)
 		goto skip_lps_dm;
 
 
@@ -216,7 +216,7 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 
 	ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_LINK, bLinked);
 
-	if (bLinked == false)
+	if (!bLinked)
 		goto skip_lps_dm;
 
 	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 9a91fd0a96eb..aa469fe57ba8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -738,7 +738,7 @@ static void hal_ReadEFuse_BT(
 	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total);
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
-		if (hal_EfuseSwitchToBank(padapter, bank) == false)
+		if (!hal_EfuseSwitchToBank(padapter, bank))
 			goto exit;
 
 		eFuse_Addr = 0;
@@ -882,7 +882,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
+	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
 		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /*  5ms */
 	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */
 
@@ -998,7 +998,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
@@ -2119,7 +2119,7 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 	/*  config RCR to receive different BSSID & not to receive data frame */
 	value_rxfltmap2 = 0;
 
-	if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true))
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		rcr_clear_bit = RCR_CBSSID_BCN;
 
 	value_rcr = rtw_read32(padapter, REG_RCR);
@@ -2186,7 +2186,7 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 			val32 |= RCR_CBSSID_DATA|RCR_CBSSID_BCN;
 		rtw_write32(padapter, REG_RCR, val32);
 
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true)
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
 			RetryLimit = (pEEPROM->CustomerID == RT_CID_CCX) ? 7 : 48;
 		else /*  Ad-hoc Mode */
 			RetryLimit = 0x7;
@@ -2724,7 +2724,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		break;
 
 	case HW_VAR_DL_RSVD_PAGE:
-		if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+		if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 			rtl8723b_download_BTCoex_AP_mode_rsvd_page(padapter);
 		else
 			rtl8723b_download_rsvd_page(padapter, RT_MEDIA_CONNECT);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index cab4707091e2..888029e21dcb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -135,7 +135,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	precvframe->u.hdr.psta = NULL;
 	if (
 		pkt_info.bssid_match &&
-		(check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+		(check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 	) {
 		if (psta) {
 			precvframe->u.hdr.psta = psta;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index ff39077deb69..705becfe6043 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -93,7 +93,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	)
 		goto free_xmitbuf;
 
-	if (rtw_sdio_wait_enough_TxOQT_space(padapter, pxmitbuf->agg_num) == false)
+	if (!rtw_sdio_wait_enough_TxOQT_space(padapter, pxmitbuf->agg_num))
 		goto free_xmitbuf;
 
 	traffic_check_for_leave_lps(padapter, true, pxmitbuf->agg_num);
@@ -225,7 +225,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 
 			frame_phead = get_list_head(pframe_queue);
 
-			while (list_empty(frame_phead) == false) {
+			while (!list_empty(frame_phead)) {
 				frame_plist = get_next(frame_phead);
 				pxmitframe = container_of(frame_plist, struct xmit_frame, list);
 
@@ -269,7 +269,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 				}
 
 				/*  ok to send, remove frame from queue */
-				if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+				if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 					if (
 						(pxmitframe->attrib.psta->state & WIFI_SLEEP_STATE) &&
 						(pxmitframe->attrib.triggered == 0)
@@ -566,7 +566,7 @@ void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 	spin_unlock_bh(&pqueue->lock);
 
 	phead = &tmplist;
-	while (list_empty(phead) == false) {
+	while (!list_empty(phead)) {
 		plist = get_next(phead);
 		list_del_init(plist);
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index b3366830edbb..f27970ef54c8 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -584,7 +584,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pwrctrlpriv = adapter_to_pwrctl(padapter);
 
 	if (
-		adapter_to_pwrctl(padapter)->bips_processing == true &&
+		adapter_to_pwrctl(padapter)->bips_processing &&
 		adapter_to_pwrctl(padapter)->pre_ips_type == 0
 	) {
 		unsigned long start_time;
-- 
2.53.0

