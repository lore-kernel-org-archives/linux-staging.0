Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C33EF657
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142299; cv=none; b=ZnVyEakKrZ2v2U6YBtOj8wbpZyWRcVJLHG/W2pN/V0L+CtdDzAOdDW6CfMhEU+vvDAUStfXoAxOJzD8QVaW68iZpExswImojfWiLJ9pZiMXa/H+TToYk3CuTRfUPufscu6b86yB6PzAK2sJt+wu+s6Oc+9Cby8ULsXPDhBSFbow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142299; c=relaxed/simple;
	bh=Umtwnn3t5ONZGJG4wLaMOZgJ3t8glQ8A88Z+EOidzzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYks7EVdP9yw96Yvtb+9qMUZYgaw3YXcDpquxym+/5l9IWX8IqIZWmOvmt3Z73+AAt2TlMKOHYY44Xv53xwSR4+Fl6BMSqOtEN0otlCXD2sy8IlN8f2TXQ7OdZPNpzX6BejyLR4T3Z/hOP5JzZJti9+6mbE3sQGIukeLxAICec8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oGrpTb2r; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oGrpTb2r"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fmlWn1pHLz9txv;
	Thu,  2 Apr 2026 17:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775142293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJ/d29ZuIMmeD2zb9w0vBUu4z8/9GSXMTHMwiHrj8Ys=;
	b=oGrpTb2r4yHFtSrDv16zbW/Pb+D9b5sVy95capWUmqccAem8pBQ3rIR/5TzC+NFtQKsoOQ
	sFEQDnVKr/k23FsdBCppQOzac0hra3QOUkM9qqOdy7jGyy/mWomATJkxUt1ire7IS1q9s/
	9d8A9ZRmEkF/vn1ADmqhj2s8G5yLVsJDTns1OB9aX+S8rXlGnPVZEFXBhypt5F1zPm57qK
	OO+mH5S/zMZRY88k1s+PGGelLw3S7VF3niZhPCRP0ZmP0SBqSTIsRe9dYJiFTug8Xvmt//
	eNExAzVJ6x3y6Lnublh5hNx2L30BYlniLojLA5U1oIrY5haB08JAk9d4+AE4Pg==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 5/6] staging: rtl8723bs: hal: style cleanup
Date: Thu,  2 Apr 2026 18:04:28 +0300
Message-ID: <20260402150429.14761-6-khomenkov@mailbox.org>
In-Reply-To: <20260402150429.14761-1-khomenkov@mailbox.org>
References: <20260402150429.14761-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8srydxg8qfjyapr8r6aijdyiosy3x9ua
X-MBO-RS-ID: c6edfa4f283d053c7da

Cleanup coding style errors in the lines modified by the
previous logic changes. This includes removing extra
parentheses, fixing line wrapping for if-conditions, and
adding spaces around bitwise operators.

These changes are only style related and do not affect
the logic.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 drivers/staging/rtl8723bs/hal/odm.c           | 11 ++++------
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 20 ++++++++-----------
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  6 ++----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  5 +++--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 ++----
 6 files changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 48b35e0945e9..a3ef7320ae9a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -605,7 +605,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		odm->SupportAbility = *((u32 *)val);
 		break;
 	case HW_VAR_DM_FUNC_OP:
-		if (*((u8 *)val)) {
+		if (*(u8 *)val) {
 			/* save dm flag */
 			odm->BK_SupportAbility = odm->SupportAbility;
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index e75c5655c699..758dcf47206f 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -380,12 +380,9 @@ static void FindMinimumRSSI(struct adapter *padapter)
 
 	/* 1 1.Determine the minimum RSSI */
 
-	if (
-		(!pDM_Odm->bLinked) &&
-		(pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
-	) {
+	if (!pDM_Odm->bLinked && pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
 		pdmpriv->MinUndecoratedPWDBForDM = 0;
-	} else
+	else
 		pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
 }
 
@@ -431,7 +428,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 		for (i = 0; i < sta_cnt; i++) {
 			if (PWDB_rssi[i] != (0)) {
-				if (pHalData->fw_ractrl)/*  Report every sta's RSSI to FW */
+				if (pHalData->fw_ractrl) /* Report every sta's RSSI to FW */
 					rtl8723b_set_rssi_cmd(Adapter, (u8 *)(&PWDB_rssi[i]));
 			}
 		}
@@ -623,7 +620,7 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	}
 	odm_CCKPacketDetectionThresh(pDM_Odm);
 
-	if (*(pDM_Odm->pbPowerSaving))
+	if (*pDM_Odm->pbPowerSaving)
 		return;
 
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index a380bbcb636f..9a5425c0ee1d 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -251,12 +251,10 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 	} else
 		EDCCA_State = true;
 
-	if (
-		pDM_Odm->bLinked &&
-		!pDM_Odm->Carrier_Sense_enable &&
-		!pDM_Odm->NHM_disable &&
-		!pDM_Odm->TxHangFlg
-	)
+	if (pDM_Odm->bLinked &&
+	    !pDM_Odm->Carrier_Sense_enable &&
+	    !pDM_Odm->NHM_disable &&
+	    !pDM_Odm->TxHangFlg)
 		odm_NHMBB(pDM_Odm);
 
 	if (EDCCA_State) {
@@ -393,8 +391,8 @@ void odm_DIG(void *pDM_VOID)
 
 	/* 1 Update status */
 	DIG_Dynamic_MIN = pDM_DigTable->DIG_Dynamic_MIN_0;
-	FirstConnect = (pDM_Odm->bLinked) && !(pDM_DigTable->bMediaConnect_0);
-	FirstDisConnect = (!pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0);
+	FirstConnect = pDM_Odm->bLinked && !pDM_DigTable->bMediaConnect_0;
+	FirstDisConnect = !pDM_Odm->bLinked && pDM_DigTable->bMediaConnect_0;
 
 	/* 1 Boundary Decision */
 	/* 2 For WIN\CE */
@@ -527,10 +525,8 @@ void odm_DIG(void *pDM_VOID)
 		CurrentIGI = pDM_DigTable->rx_gain_range_max;
 
 	/* 1 Force upper bound and lower bound for adaptivity */
-	if (
-		pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY &&
-		pDM_Odm->adaptivity_flag
-	) {
+	if (pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY &&
+	    pDM_Odm->adaptivity_flag) {
 		if (CurrentIGI > Adap_IGI_Upper)
 			CurrentIGI = Adap_IGI_Upper;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 195814de0df2..612351010359 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -137,10 +137,8 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;
 	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
 
-	if (
-		(hw_init_completed) &&
-		((!fw_current_in_ps_mode) && bFwPSAwake)
-	) {
+	if (hw_init_completed &&
+	    (!fw_current_in_ps_mode && bFwPSAwake)) {
 		rtw_hal_check_rxfifo_full(Adapter);
 	}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 91fa289f81b7..95361e856adf 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -998,7 +998,8 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE |
+			  WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
@@ -2118,7 +2119,7 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 	/*  config RCR to receive different BSSID & not to receive data frame */
 	value_rxfltmap2 = 0;
 
-	if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)))
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		rcr_clear_bit = RCR_CBSSID_BCN;
 
 	value_rcr = rtw_read32(padapter, REG_RCR);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f4073f6a342f..55a85f8aa38d 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -596,10 +596,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pHalData = GET_HAL_DATA(padapter);
 	pwrctrlpriv = adapter_to_pwrctl(padapter);
 
-	if (
-		adapter_to_pwrctl(padapter)->bips_processing &&
-		adapter_to_pwrctl(padapter)->pre_ips_type == 0
-	) {
+	if (adapter_to_pwrctl(padapter)->bips_processing &&
+	    adapter_to_pwrctl(padapter)->pre_ips_type == 0) {
 		unsigned long start_time;
 		u8 cpwm_orig, cpwm_now;
 		u8 val8, bMacPwrCtrlOn = true;
-- 
2.53.0

