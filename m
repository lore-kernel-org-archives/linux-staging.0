Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E60F427A0D
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194965; cv=none; b=NTKElpWQLydUp4E6231jGUwe67I2u3CXimCGibDtJMHZ/jOWMfPzCmZ4QWtjN0Phj+oH6lUOPqYrDW49WI7CK94P9ih0zin2tUPEQQa+gw/JDJnEyt7b2+aX5hDlDSuHEJ9cb+Bx+TmRrlqTY5AyN+oie+PfeOTKQ/fpolIosZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194965; c=relaxed/simple;
	bh=QxjEV7M/IWty11RhvO/MIe23WzNwxoNUOmN0jDW+7hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldh9bgONWWwsqjeEYvORUAoctJpm3bnT40Ss9fcPRxXLvQ+73MXoNS5yR4YvS4jV3eZNNljtx5c8c2Y38VNA+M0iBHRNAyEqLuMQDI3XDs0TTOJv5R4idD0gM83leiVWzXLxmOEV/HdlCqVAS0kA7+X75fDycbEXIl9DNi0y9CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eetUqrx7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eetUqrx7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490af320e2aso92647135e9.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194963; x=1781799763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRADOgopJk66ZnTPIYMN6F7DeBLjTiy/56Uxi/lwew4=;
        b=eetUqrx7pdE7nHblQjUajgtzpIStyrbAoJpP2Rn75Wrm9bBChLwOu0mgiiNkGASxXF
         vZWQo6AWQKNyXuq+VIpRvUFS4Iuze3TmI89/z+DIkSwY/FlWUO418PjmWkE9Uf5zcLzo
         U2x0Wxi4Gxc8zMv2BwYnQ8MBAHV+lFuGis5Wnujrsr7fAc6BuS/h0Is0BsHqfcy9gG+/
         n1NycSNxIxuYcOqIVrdhg/V6FvgjZvnBed2Ll3UO1zvMCitx1NxzIqwT9nuaP9zZIklB
         8vNGlJlSBG4CT3gLMH6Z5Yn7pCLO7cntiHZ7cC2FEMH7nE/Tnr3jnpAeaHtHCVLpXL8d
         EEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194963; x=1781799763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jRADOgopJk66ZnTPIYMN6F7DeBLjTiy/56Uxi/lwew4=;
        b=DSQAMuz+RFPDEK955HqJx+sEKqTFGjcAce9PmDSB7C9LB6pMJqHkS1vEnRvj19etkK
         Ks/nxfqM3BCDuwuRInLPMRBcATiT164WBG/Cwfdtc2Z92+RDbQRjmwJRlvqDItL+1r9R
         Vj6e8B1+slf/i8jfKh5M2QhG6OaSDHiZ2nqf0CfKETaSeC4fsvX/seQf4iRTsKIKR/kb
         /GmzXV19da3JA+bDkAVTCru3l54b3cRs275xtTuMu5PFEV3Qf0l6I9Q/cFekrzQdC9/2
         E5MZ1tehMGf0rPdRoBeH1TFRgx+JWhBwNPcFQMpYLuUQ9FgD6GNes+LoUoNTG/5bXK49
         /MJQ==
X-Gm-Message-State: AOJu0YzXpK6mBGazRe9k+ynoHuuRG7CKdJ8OHgYbPdHhl9bNmXZHpwDI
	qvjibJzFQ2SrRKioymXmm0B+kOD7olwgnZO/BYdlJ0nRrmVY8dPM63rU
X-Gm-Gg: Acq92OEob9thIhiEvnhDUQ4K02i3z8LgyZI/hcf/Mz5TD2oJsZCZPB+I6yXaATQ5m5v
	RMMcoxQjaqtsJtKAMw0DGw52VIAnmlgXcxWsVVkwOuwwSzmr4Ibb/rYZ1MCjDvx6GiKNIw6QgJt
	8rKmF8sqdC2tV3Rq5/dN2/cED1jqlKmF0lhQfN+ONubjSzvOtUK9kjPp8sb4ckNT4qBHlrGSaEm
	7UqsT1BLNqszAi2hZirEAOEn/JJEYwFZ0tnqd7hSm5e4UXztjDsk9CPYv0rwXn9dswqECb6Kcq/
	AdHEWdnBtTFmsK++axdNQcDI3LcCH7OfxcXnqRK/fSRZVZ4KV2P+1fX8GIdc4MP22iGf8jXyom0
	OcuzG32hjQfMa3ajgSikDQe3i3WafjNRzlIPC1Bma8tqWxl3aFKERnOgtJucGKL1KsZQ/VhG1Lw
	nMgH/VxaGKIMvVwGftZDHozv/Pag==
X-Received: by 2002:a05:600c:8b56:b0:490:be44:32ea with SMTP id 5b1f17b1804b1-490e55c264fmr50361625e9.7.1781194962592;
        Thu, 11 Jun 2026 09:22:42 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:ac27:e02b:2f26:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e46a75c8sm70344585e9.2.2026.06.11.09.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:22:42 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH 8/9] staging: rtl8723bs: hal: fix whitespace in rtl8723b_hal_init.c
Date: Thu, 11 Jun 2026 17:21:27 +0100
Message-ID: <20260611162128.57870-8-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611162128.57870-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..6cfae9e920a0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -286,8 +286,8 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 }
 
 /*  */
-/* 	Description: */
-/* 		Download 8192C firmware code. */
+/*	Description: */
+/*		Download 8192C firmware code. */
 /*  */
 /*  */
 s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
@@ -440,7 +440,7 @@ void rtl8723b_InitializeFirmwareVars(struct adapter *padapter)
 }
 
 /*  */
-/* 				Efuse related code */
+/*				Efuse related code */
 /*  */
 static u8 hal_EfuseSwitchToBank(
 	struct adapter *padapter, u8 bank
@@ -1088,9 +1088,9 @@ void rtl8723b_init_default_value(struct adapter *padapter)
 
 	/*  init dm default value */
 	pdmpriv->TM_Trigger = 0;/* for IQK */
-/* 	pdmpriv->binitialized = false; */
-/* 	pdmpriv->prv_traffic_idx = 3; */
-/* 	pdmpriv->initialize = 0; */
+/*	pdmpriv->binitialized = false; */
+/*	pdmpriv->prv_traffic_idx = 3; */
+/*	pdmpriv->initialize = 0; */
 
 	pdmpriv->ThermalValue_HP_index = 0;
 	for (i = 0; i < HP_THERMAL_NUM; i++)
@@ -1197,7 +1197,7 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-/* 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter); */
+/*	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter); */
 	u16 EEPROMId;
 
 
@@ -1330,7 +1330,7 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct TxPowerInfo24G	pwrInfo24G;
-	u8 	rfPath, ch, TxCount = 1;
+	u8	rfPath, ch, TxCount = 1;
 
 	Hal_ReadPowerValueFromPROM_8723B(padapter, &pwrInfo24G, PROMContent, AutoLoadFail);
 	for (rfPath = 0 ; rfPath < MAX_RF_PATH ; rfPath++) {
@@ -1576,7 +1576,7 @@ u8 BWMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib)
 		BWSettingOfDesc = 0;
 
 	/* if (pTcb->bBTTxPacket) */
-	/* 	BWSettingOfDesc = 0; */
+	/*	BWSettingOfDesc = 0; */
 
 	return BWSettingOfDesc;
 }
@@ -1859,8 +1859,8 @@ void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pbuf)
 
 /*  */
 /*  Description: In normal chip, we should send some packet to Hw which will be used by Fw */
-/* 			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
-/* 			Fw can tell Hw to send these packet derectly. */
+/*			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
+/*			Fw can tell Hw to send these packet derectly. */
 /*  Added by tynli. 2009.10.15. */
 /*  */
 /* type1:pspoll, type2:null */
@@ -2254,11 +2254,11 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 		break;
 
 	case C2H_CCX_TX_RPT:
-/* 			CCX_FwC2HTxRpt(padapter, QueueID, pC2hEvent->payload); */
+/*			CCX_FwC2HTxRpt(padapter, QueueID, pC2hEvent->payload); */
 		break;
 
 	case C2H_EXT_RA_RPT:
-/* 			C2HExtRaRptHandler(padapter, pC2hEvent->payload, C2hEvent.CmdLen); */
+/*			C2HExtRaRptHandler(padapter, pC2hEvent->payload, C2hEvent.CmdLen); */
 		break;
 
 	case C2H_HW_INFO_EXCH:
@@ -2274,8 +2274,8 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 
 	/*  Clear event to notify FW we have read the command. */
 	/*  Note: */
-	/* 	If this field isn't clear, the FW won't update the next command message. */
-/* 	rtw_write8(padapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE); */
+	/*	If this field isn't clear, the FW won't update the next command message. */
+/*	rtw_write8(padapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE); */
 exit:
 	return ret;
 }
@@ -2294,11 +2294,11 @@ static void process_c2h_event(struct adapter *padapter, struct c2h_evt_hdr_t *pC
 		break;
 
 	case C2H_CCX_TX_RPT:
-/* 			CCX_FwC2HTxRpt(padapter, QueueID, tmpBuf); */
+/*			CCX_FwC2HTxRpt(padapter, QueueID, tmpBuf); */
 		break;
 
 	case C2H_EXT_RA_RPT:
-/* 			C2HExtRaRptHandler(padapter, tmpBuf, C2hEvent.CmdLen); */
+/*			C2HExtRaRptHandler(padapter, tmpBuf, C2hEvent.CmdLen); */
 		break;
 
 	case C2H_HW_INFO_EXCH:
@@ -2435,7 +2435,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			break;
 		case 2:
 			/*  sta add event callback */
-/* 				rtw_btcoex_MediaStatusNotify(padapter, RT_MEDIA_CONNECT); */
+/*				rtw_btcoex_MediaStatusNotify(padapter, RT_MEDIA_CONNECT); */
 			break;
 		}
 		break;
@@ -2588,9 +2588,9 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			}
 
 			/* if (psmode != PS_MODE_ACTIVE)	{ */
-			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
+			/*	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
 			/*  else { */
-			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, false); */
+			/*	rtl8723b_set_lowpwr_lps_cmd(padapter, false); */
 			/*  */
 			rtl8723b_set_FwPwrMode_cmd(padapter, psmode);
 		}
-- 
2.43.0

