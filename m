Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAFD3BED54
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773344495; cv=none; b=QereRU2A+10m29Us/3IB5Y1FqE5dQqpUYRY22cPCtmnII1OpNd0FDf6jQp4pnlsi0CFPqDYWNtljkFEDJzsur5k9xOUFQKwRAC9NGRP3b65JB57NBcarsRnFny6xIrxVb29ORuUX0rZp3OhBBsqNKRqtw3bo5vwj1uZiXknLtYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773344495; c=relaxed/simple;
	bh=1JbFu3SPFZCegpoKe4A1BtNPr2IFETr+j21TK31sH2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UX4VAgyuHp1K53YSZZF9+lqep66fsTrW9VaNYN1piNigy/b/d1IpfLnC3mMTNOex1eAUAVs6bqgND9LxKjlV4EUJiOdB9EvfjkzblUMpfbd3GR8YU2JN0ic6xZpsKeUds0GC6E5+QgcWKjGRh/Aq+GFFEExwCYBP/gKgLF23rw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daeRhz5Y; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daeRhz5Y"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a01c80c34so11884781fa.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773344490; x=1773949290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v84gCtI+kZD7S0PdooEcYmZ9r1QP6lXkIffyjh12zDI=;
        b=daeRhz5Y3bxiSpu8NaA7pfbkTbbAaPz6Ts2okkjUmPkb/8wYBQgPIwumD9eSMEHZC2
         BU1fbU8vc/7IlSjpCfKztXL6/W9N5fJnOKOuBR0FmZ1GkP4ogZ8XG5a/qqkpdN+5H/zw
         ZuiC43Bf/u6SFeyuwu07d3c0burA7djFB5xNff3AolOSiIV4Y3jzP8Okai1RajVVqgRK
         qPcaSuDlkqbU8ma4Eyj4xNt59v2TaeV2TZ1aCcUr8l7RcXPeMMixCNCBQ9tdxFfEIcNK
         QWCDZwbgrEtPzHb5bSPT34Qesj+2damq/1cy03CezBSEqFUQdlX90dJ2CoO1LEHd/rAB
         cKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773344490; x=1773949290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v84gCtI+kZD7S0PdooEcYmZ9r1QP6lXkIffyjh12zDI=;
        b=AQ9qLQYIbPFqq0s+n/Lcx4Jk8ySPSptvmBHp8eNC9+EhJVYkaV9c4ipsCLX6NGxVyI
         5WbTz2m4TfrZOlvPPJrrOZfmqpHyyB8jhWre5EK5eJO9S29mzFuq4ndXtUgJ7jCJeThl
         HdIcyBXbDA+4EcuIncQ9UzF+nU4yhpdcS+WIWs+ucTy5MxIPBelkFLKeA7wajBXNAlhu
         iv1T/wZ99pEVOZNu4T89iNcOqKtyu4eS0mzdmaqrmZfpGVbi7V6rIblI/MMs6cJu9ohB
         hWsK4/Fz0TtCbABr2xhwk6MCOgiTa5/jt9WFTeaBUGNEPP5AEex07xpz76Uqv9DJE4RV
         u3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUkOaqhM257rDHtG21AakhGFvgPHPTXMo3HI1iQaP4ojfc1CsTDWx/9pWMEKbw9M3tsZjuMqdF3uD8D/GhJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7Ott3HTP0gCRdjnGLnT7SRycehlKSSV2Rk1uL5os3oT3jFJSh
	ynchHYPGQCCupms2/BZFyZFvkO/nvoser1GVn0CICfx3L5tPmwoq1eTZ
X-Gm-Gg: ATEYQzyHo6BWy0L6MY7MLbT1CJkcPkLJfMV298q2NnZR1D1lP92ZeVtTPNCE4YpsiD2
	ITWUdpGS4npPvsPF1CrYXdBOJWeVtiKxDzOSFEoX9V3M9y7zj3EXBItLhDVFyh9Ue9tb/axoxVS
	7kDcUyAMJbuvlCDlLAAN48zk0ph14eUnU47kQJJfuOM5cyTBCdFIBnfn4mO7nhtND+LDiSXPdS/
	Vl/1k68TBMX+to3tOS0K+IALy2v4rvy8+lpnbLX2DototSPPRiVsipfaZUBIPre3RdDh9d1Jt05
	0zfg1N/i06WcifqKLBzhATY1cx0GdYFOj0BxPQTL7JGj8+/SkxGUV6WVflXcc3+/zO9L7Zv1hry
	jInKoN7pBh49CZS0PEu6WA17melDgPHgfIFWvz8g+csEQ0/HqRcaQPgybyfnvTLhE63aazWrtU+
	sHbMHc1TsqtGyrfX96drd96ccSvqpCppRIYeTAunYKhbYwX1cRgDymtLbJ5Oy36dparvTm5Glnm
	Q==
X-Received: by 2002:a05:651c:325a:b0:38a:366b:9086 with SMTP id 38308e7fff4ca-38a897da69dmr1316471fa.39.1773344489220;
        Thu, 12 Mar 2026 12:41:29 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67dbfe6fsm10260291fa.20.2026.03.12.12.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:41:28 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: rtl8723bs: add blank lines after variable declarations
Date: Thu, 12 Mar 2026 20:41:11 +0100
Message-ID: <20260312194112.1876-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing blank lines after variable declarations throughout the
rtl8723bs driver to comply with kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      | 1 +
 drivers/staging/rtl8723bs/hal/hal_btcoex.c        | 1 +
 drivers/staging/rtl8723bs/hal/hal_com.c           | 2 ++
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c    | 5 +++++
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 2 ++
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 +++++
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 1 +
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    | 1 +
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 2 ++
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 4 ++++
 10 files changed, 24 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732687..e3a92ee853b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -991,6 +991,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 77f02c160cb5..45a2150b115b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -364,6 +364,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 	case BTC_GET_U4_WIFI_TRAFFIC_DIRECTION:
 		{
 			struct rt_link_detect_t *plinkinfo;
+
 			plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
 
 			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
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
index 736d99d6cd4b..25414ce1d532 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -421,6 +421,7 @@ void PHY_SetTxPowerIndexByRateSection(
 
 	if (RateSection == CCK) {
 		u8 cckRates[]   = {MGN_1M, MGN_2M, MGN_5_5M, MGN_11M};
+
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					     pHalData->CurrentChannelBW,
 					     Channel, cckRates,
@@ -428,6 +429,7 @@ void PHY_SetTxPowerIndexByRateSection(
 
 	} else if (RateSection == OFDM) {
 		u8 ofdmRates[]  = {MGN_6M, MGN_9M, MGN_12M, MGN_18M, MGN_24M, MGN_36M, MGN_48M, MGN_54M};
+
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					       pHalData->CurrentChannelBW,
 					       Channel, ofdmRates,
@@ -435,6 +437,7 @@ void PHY_SetTxPowerIndexByRateSection(
 
 	} else if (RateSection == HT_MCS0_MCS7) {
 		u8 htRates1T[]  = {MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3, MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7};
+
 		PHY_SetTxPowerIndexByRateArray(padapter, RFPath,
 					       pHalData->CurrentChannelBW,
 					       Channel, htRates1T,
@@ -498,6 +501,7 @@ s8 PHY_GetTxPowerTrackingOffset(struct adapter *padapter, u8 RFPath, u8 Rate)
 u8 PHY_GetRateIndexOfTxPowerByRate(u8 Rate)
 {
 	u8 index = 0;
+
 	switch (Rate) {
 	case MGN_1M:
 		index = 0;
@@ -854,6 +858,7 @@ void PHY_SetTxPowerLimit(
 void Hal_ChannelPlanToRegulation(struct adapter *Adapter, u16 ChannelPlan)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
+
 	pHalData->Regulation2_4G = TXPWR_LMT_WW;
 
 	switch (ChannelPlan) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index a44f5bd58306..51fa95ba2a65 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -671,6 +671,7 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 		if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		} else {
 			struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
+
 			pwrctl->fw_psmode_iface_id = padapter->iface_id;
 		}
 
@@ -934,6 +935,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
+
 		pwrctl->fw_psmode_iface_id = padapter->iface_id;
 	}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index cfada1c375c9..061b1d61cc39 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1626,6 +1626,7 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 static u8 fill_txdesc_sectype(struct pkt_attrib *pattrib)
 {
 	u8 sectype = 0;
+
 	if ((pattrib->encrypt > 0) && !pattrib->bswenc) {
 		switch (pattrib->encrypt) {
 		/*  SEC_TYPE */
@@ -2024,6 +2025,7 @@ static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
 		rtw_write8(padapter, bcn_ctrl_reg, (EN_BCN_FUNCTION | EN_TXBCN_RPT));
 	else {
 		u8 val8;
+
 		val8 = rtw_read8(padapter, bcn_ctrl_reg);
 		val8 &= ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
 
@@ -2217,6 +2219,7 @@ s32 c2h_id_filter_ccx_8723b(u8 *buf)
 {
 	struct c2h_evt_hdr_88xx *c2h_evt = (struct c2h_evt_hdr_88xx *)buf;
 	s32 ret = false;
+
 	if (c2h_evt->id == C2H_CCX_TX_RPT)
 		ret = true;
 
@@ -2306,6 +2309,7 @@ void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length)
 {
 	struct c2h_evt_hdr_t	C2hEvent;
 	u8 *tmpBuf = NULL;
+
 	C2hEvent.CmdID = pbuffer[0];
 	C2hEvent.CmdSeq = pbuffer[1];
 	C2hEvent.CmdLen = length-2;
@@ -2389,6 +2393,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
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
index e4ab0502458f..10a1d3389dc1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -239,6 +239,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 						if (pxmitbuf->len > 0 &&
 						    pxmitbuf->priv_data) {
 							struct xmit_frame *pframe;
+
 							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 							pframe->agg_num = k;
 							pxmitbuf->agg_num = k;
@@ -323,6 +324,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 		if (pxmitbuf) {
 			if (pxmitbuf->len > 0) {
 				struct xmit_frame *pframe;
+
 				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 				pframe->agg_num = k;
 				pxmitbuf->agg_num = k;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0fa1b22fdf9a..dc1d75fcd4fc 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -31,6 +31,7 @@ static u8 CardEnable(struct adapter *padapter)
 		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
 		if (ret == _SUCCESS) {
 			u8 bMacPwrCtrlOn = true;
+
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 		}
 	} else
@@ -214,6 +215,7 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	u16 value = 0;
+
 	switch (pHalData->OutEpQueueSel) {
 	case TX_SELE_HQ:
 		value = QUEUE_HIGH;
@@ -341,6 +343,7 @@ static void _InitTransferPageSize(struct adapter *padapter)
 	/*  Tx page size is always 128. */
 
 	u8 value8;
+
 	value8 = _PSRX(PBP_128) | _PSTX(PBP_128);
 	rtw_write8(padapter, REG_PBP, value8);
 }
@@ -1147,6 +1150,7 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_SET_REQ_FW_PS:
 		{
 			u8 req_fw_ps = 0;
+
 			req_fw_ps = rtw_read8(padapter, 0x8f);
 			req_fw_ps |= 0x10;
 			rtw_write8(padapter, 0x8f, req_fw_ps);
-- 
2.43.0

