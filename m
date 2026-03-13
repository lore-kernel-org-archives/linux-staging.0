Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCCD386448
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773441483; cv=none; b=rL5fabZGxY+2J+eY589urn5tlKEG14Imppv4vojaW/FiLaYoy+TZPmXHK8IsGokkSrcHZxdt97EcC/KNQ494XBF8QqEJkHiLMX8P8pyntEvKB+ePckKGloVnbR7DhWR6IeeD/3FikOHroBMWNsF6HQcpgETaH4zsTPoPbx7ZY3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773441483; c=relaxed/simple;
	bh=9tq/qGC15KlUByhcRrc80P0kPXYk7oAScKG20XjPOGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rn08zSzILdYCRpBG2OLK0hmUz11BaDArt9Lvw0abgTZuFQNJ7RM+Esuhhh/paMPRin+bor2aG2mzzyj+jDDkmyeCupfas6ekSkUEoIzBYL2NwriAYasoxPWAiaB9JvIJwM/SnQJZIfusLaKiY0hP8xmM6NCGoPP+/xD2jH+/dss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWTpufT1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWTpufT1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a133b686f7so2654738e87.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773441480; x=1774046280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1SmoDNhSI8rloFz0/nbEl5vJigqCojGMSSrEc4sDT8=;
        b=ZWTpufT1GICOJhJE35l+mfUGvEXkVcOmXStzAklKKiR4byX6Z9UK1QSqXzMcXoqCCX
         8N6c5LGnMqM1BXwllqJlWuLKLOWNcmdHiY3O9OJToN2D9DiN8TVXiyF67GIH6j5RTWR5
         cgd6UUy6P1wRoyZR3N9Uh/D1IrVPS84T5eJk98QSqlShsDIOCHxeziOUn3+ipZ5piY13
         OiF8lWZzgYAODbmfY+PRjmAz5y4xUQ8ynVzJZ/MD1E0QLWjHHfTDUYXAUdWgebtW57bS
         LT4DbWeIurBRWzKPzUvS0244982TfcTf5MIVBRAA8IFrM7GcD0OUrod5iQIQN0Vv0RLC
         jbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773441480; x=1774046280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1SmoDNhSI8rloFz0/nbEl5vJigqCojGMSSrEc4sDT8=;
        b=ojrahxgy8SPmEvKHmObycXWmVkbBJHfpQMlOsGUHkC1SHb+PfISpxeAmZEFSNIOEU+
         48lHBzkwHv0mJbd9gUDswd6xFPO7qF+DsK55XDV2rWWVcJm+P4rnU6u4tT2IugtApOBg
         wAc4JppfCS0DXSwAWX3IvI8ctRd2oZ/5Es4DMa786VTI6V67XJPILmU/qB90cGg9pWA1
         QuKLrnJyvxrjLdMlhPQvZhVs4eMmhsptN3EHyVA3XVmgkR0OYmJ6gL7BsQRlLzQtnHvi
         7pVWGyzHzQbrcArCoU4h7EAHBQr+4QmPt1DqiHOJjv6WdcOxXNEWlda+8dm1NbOcvJPi
         K4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW7ExSgDrnys7hn59zV/oY14wJtb6Y9589xdonRbNYS8+z8o5XKvBW1q54NLzUWbz5LKeDFDML/e2fcwVSF@lists.linux.dev
X-Gm-Message-State: AOJu0YxOJlE9iVZKve9li9h1CoT5YklV6CsgUeXaSTbj6RMBjesnxTXx
	pLoFJn/9DqpR5Nbfh0+Y3ID0QtDc6FbutcAYknw9hmoTPpNIUYiL9yr9
X-Gm-Gg: ATEYQzy2eZ0lJZrVhclTeed9PcK37hvmWItV8V0tBdZIleYJ8dgrPhUkdRCBhdNJUug
	Oy3+NACJRNHVlbf/YO+rBOcAUoy8FMozHt91QX0/usPQ+JwIApWY++dDvmjP0otUw4uAgihtrSj
	esEm/clv2beOOYH7HYM9Idt62RMjcN8bkb0NeqY23MQp3Xc7E84uP5DF1OEjJ+Ka7bIQhD8wPrh
	50WD8QOtDZ3tvdUnowIrhm66BJpNGB6j/xcUCqcz8H/jg6q4VQBxZBd0vNW2Ji9LP6Z4kK85cn6
	p6Bvovo1oaUsIfopCz+GfcVKrfMto0lcEfLCWEfoVu1zSYBv9u6NiOAeLyHw3YhEmYThDIzzpmd
	BlnxG5OrO2Fi5JvX4C+66r0X4x+WdXSoWsHoBPKy7UnDqUc1E/rvMVP/1gcN9SDtqT73AwHg3eF
	f8R+0fACFKs92ydiG2yxZQtnz/drPxD+aamcWDFwpdtKIfp1TmrWuW64qD1Dag0px+uQbOOOajf
	w==
X-Received: by 2002:ac2:4885:0:b0:5a1:53a5:b096 with SMTP id 2adb3069b0e04-5a16270ee05mr1197577e87.19.1773441479673;
        Fri, 13 Mar 2026 15:37:59 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162b8dsm1833243e87.44.2026.03.13.15.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 15:37:58 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: rtl8723bs: add missing blank lines after declarations
Date: Fri, 13 Mar 2026 23:37:38 +0100
Message-ID: <20260313223738.7657-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing blank lines after variable declarations in several files
throughout the rtl8723bs driver to comply with kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c        | 1 +
 drivers/staging/rtl8723bs/hal/hal_com.c           | 2 ++
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c    | 5 +++++
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 2 ++
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 +++++
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 1 +
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    | 1 +
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 2 ++
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 3 +++
 9 files changed, 22 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9c84f4cf1dda..2a2dd60be8bb 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -364,6 +364,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 	case BTC_GET_U4_WIFI_TRAFFIC_DIRECTION:
 		{
 			struct rt_link_detect_t *plinkinfo;
+
 			plinkinfo = &padapter->mlmepriv.link_detect_info;
 
 			if (plinkinfo->num_tx_ok_in_period > plinkinfo->num_rx_ok_in_period)
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880ae6a..3986371f2197 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -616,6 +616,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 	case HW_VAR_DM_FUNC_SET:
 		if (*((u32 *)val) == DYNAMIC_ALL_FUNC_ENABLE) {
 			struct dm_priv *dm = &hal_data->dmpriv;
+
 			dm->DMFlag = dm->InitDMFlag;
 			odm->SupportAbility = dm->InitODMFlag;
 		} else {
@@ -727,6 +728,7 @@ void SetHalODMVar(
 	case HAL_ODM_STA_INFO:
 		{
 			struct sta_info *psta = pValue1;
+
 			if (bSet) {
 				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, psta);
 			} else {
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index dc2da49e6738..771ec682864a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -423,6 +423,7 @@ void PHY_SetTxPowerIndexByRateSection(
 
 	if (RateSection == CCK) {
 		u8 cckRates[]   = {MGN_1M, MGN_2M, MGN_5_5M, MGN_11M};
+
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					     pHalData->CurrentChannelBW,
 					     Channel, cckRates,
@@ -430,6 +431,7 @@ void PHY_SetTxPowerIndexByRateSection(
 
 	} else if (RateSection == OFDM) {
 		u8 ofdmRates[]  = {MGN_6M, MGN_9M, MGN_12M, MGN_18M, MGN_24M, MGN_36M, MGN_48M, MGN_54M};
+
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					       pHalData->CurrentChannelBW,
 					       Channel, ofdmRates,
@@ -437,6 +439,7 @@ void PHY_SetTxPowerIndexByRateSection(
 
 	} else if (RateSection == HT_MCS0_MCS7) {
 		u8 htRates1T[]  = {MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3, MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7};
+
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					       pHalData->CurrentChannelBW,
 					       Channel, htRates1T,
@@ -500,6 +503,7 @@ s8 PHY_GetTxPowerTrackingOffset(struct adapter *padapter, u8 RFPath, u8 Rate)
 u8 PHY_GetRateIndexOfTxPowerByRate(u8 Rate)
 {
 	u8 index = 0;
+
 	switch (Rate) {
 	case MGN_1M:
 		index = 0;
@@ -856,6 +860,7 @@ void PHY_SetTxPowerLimit(
 void Hal_ChannelPlanToRegulation(struct adapter *Adapter, u16 ChannelPlan)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
+
 	pHalData->Regulation2_4G = TXPWR_LMT_WW;
 
 	switch (ChannelPlan) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index af6cdda8238d..12416e499ac3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -672,6 +672,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 		if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		} else {
 			struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
+
 			pwrctl->fw_psmode_iface_id = padapter->iface_id;
 		}
 
@@ -935,6 +936,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
+
 		pwrctl->fw_psmode_iface_id = padapter->iface_id;
 	}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 513d0c346c5e..e794fe3caf9d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1631,6 +1631,7 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 static u8 fill_txdesc_sectype(struct pkt_attrib *pattrib)
 {
 	u8 sectype = 0;
+
 	if ((pattrib->encrypt > 0) && !pattrib->bswenc) {
 		switch (pattrib->encrypt) {
 		/*  SEC_TYPE */
@@ -2031,6 +2032,7 @@ static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 		rtw_write8(padapter, bcn_ctrl_reg, (EN_BCN_FUNCTION | EN_TXBCN_RPT));
 	else {
 		u8 val8;
+
 		val8 = rtw_read8(padapter, bcn_ctrl_reg);
 		val8 &= ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
 
@@ -2225,6 +2227,7 @@ s32 c2h_id_filter_ccx_8723b(u8 *buf)
 {
 	struct c2h_evt_hdr_88xx *c2h_evt = (struct c2h_evt_hdr_88xx *)buf;
 	s32 ret = false;
+
 	if (c2h_evt->id == C2H_CCX_TX_RPT)
 		ret = true;
 
@@ -2314,6 +2317,7 @@ void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length)
 {
 	struct c2h_evt_hdr_t	C2hEvent;
 	u8 *tmpBuf = NULL;
+
 	C2hEvent.CmdID = pbuffer[0];
 	C2hEvent.CmdSeq = pbuffer[1];
 	C2hEvent.CmdLen = length-2;
@@ -2397,6 +2401,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_CHECK_BSSID:
 		{
 			u32 val32;
+
 			val32 = rtw_read32(padapter, REG_RCR);
 			if (*val)
 				val32 |= RCR_CBSSID_DATA|RCR_CBSSID_BCN;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 6d5e531505f9..7fac1c2ba8e0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -575,6 +575,7 @@ static void phy_SetRegBW_8723B(
 )
 {
 	u16 RegRfMod_BW, u2tmp = 0;
+
 	RegRfMod_BW = rtw_read16(Adapter, REG_TRXPTCL_CTL_8723B);
 
 	switch (CurrentBW) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 5faac9f28b02..cab4707091e2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -143,6 +143,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 		}
 	} else if (pkt_info.to_self || pkt_info.is_beacon) {
 		u32 adhoc_state = WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE;
+
 		if (check_fwstate(&padapter->mlmepriv, adhoc_state))
 			if (psta)
 				precvframe->u.hdr.psta = psta;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 379d29d3f9d3..f50726d2ed0c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -240,6 +240,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 						if (pxmitbuf->len > 0 &&
 						    pxmitbuf->priv_data) {
 							struct xmit_frame *pframe;
+
 							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 							pframe->agg_num = k;
 							pxmitbuf->agg_num = k;
@@ -324,6 +325,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 		if (pxmitbuf) {
 			if (pxmitbuf->len > 0) {
 				struct xmit_frame *pframe;
+
 				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 				pframe->agg_num = k;
 				pxmitbuf->agg_num = k;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index e32f051ed415..f2f73c65a636 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -214,6 +214,7 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	u16 value = 0;
+
 	switch (pHalData->OutEpQueueSel) {
 	case TX_SELE_HQ:
 		value = QUEUE_HIGH;
@@ -341,6 +342,7 @@ static void _InitTransferPageSize(struct adapter *padapter)
 	/*  Tx page size is always 128. */
 
 	u8 value8;
+
 	value8 = _PSRX(PBP_128) | _PSTX(PBP_128);
 	rtw_write8(padapter, REG_PBP, value8);
 }
@@ -1147,6 +1149,7 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_SET_REQ_FW_PS:
 		{
 			u8 req_fw_ps = 0;
+
 			req_fw_ps = rtw_read8(padapter, 0x8f);
 			req_fw_ps |= 0x10;
 			rtw_write8(padapter, 0x8f, req_fw_ps);
-- 
2.43.0

