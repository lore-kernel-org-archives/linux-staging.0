Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9B3CBE6C
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160745; cv=none; b=YCHvL0k81Hcm3yRB16JIWarxm5K1EjHZVxq7AzRCPtKCm6U/84CNRq/cyd6zAtvdZuO55H5zzPqvF6e3fIA1GSYCeOpsqedOWKpYUSP/C4rhTWgM5ekUjMITZdF2BJ8qXPApyJi5paG/6QI4sDrx2RnbRBFPY4wAZ3vHYuBvOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160745; c=relaxed/simple;
	bh=1WCnA+MKLG228VTV2fHjgVkAptbznxnr3zeFTRFclc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLMa/zr/yTlNLJiUgQ4jBh6Xnf1xlgsPOvjUqsyyrvtjYWWCzOMig4V9Od6Qq+DiqwaBFGqiBwrCXHhwH70btjU+crry9gdDONW0/2W+E/OITesTznjLviOt7187ChWxvVDeK6J7B+3Tz7iiszGRMtlmyDuGFq4QPFAOWk+2OuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qjW6VDZh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjW6VDZh"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a40502e63bso485603e87.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160742; x=1776765542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3k6yHbZOWF5ogL1t2dmGLcAHzs09u52SSLr2n+2Z37I=;
        b=qjW6VDZhv2jGa0fetVEQHSf6wfPB5FQSs2N2zpb6WsZg2b/TSQDyZR+62Dt7PnPxhO
         e/yp4mEalGiNmcbpnaAL+Ziw8yOsLWCj1MZTQ7UU5OlfIRTfSHHMBRFCUCFventQhGup
         f3ero14R/V3zuRf0kRckrHMk0Xp5Nj6UwC4bmey+m937eJlo3BLdKf1drlN6Z7/jWR1R
         Lzr1pUR7q1Yr4HaIco5whlOOEfK0S8LrjdvMgPKByo9kHC2OkViBUmzfRGG4v709lduw
         j9JdeZAVy4G/g/eVQfClTE9KRTTBCxW3O67Uv3kYUZL8bgjGhq51DqR0EJpQy74TZrc2
         oCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160742; x=1776765542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3k6yHbZOWF5ogL1t2dmGLcAHzs09u52SSLr2n+2Z37I=;
        b=QUGmRR8w5XEy2s3Hluju5bqWXdYvUALpc6x1yA0IXDEkN7LO/W3LQZIxkS9/1wHM+g
         TUesnucNzLXUpjLNY1zZtaWCEhqbMsuhmnRoeD3GAAVGIgMtTERPSypt9o4PEKVkFxEZ
         DTI9ys9aKXB6mjSTu8v87HNHrRzzlxnxIyEwFgAxDrTybE9OdPw2LhjAb7FoS7MnHniq
         e6XkjC1U3/2oE3hUy5MdfTS8Q+9LtYZ5XDtnjCE909ZBTloxLgwe8Xw2LLoby/PQ8tki
         t/7wdwWUwPjyHORN9lVJFOQZbe/HGWnJUAhOyYYZRNRtABxsz3VCJ5CHM+x+/iNm9qd9
         tsRg==
X-Forwarded-Encrypted: i=1; AFNElJ/xfxwds7AMwt6XTsbAdkBgU8FLtNc13kMnY5hujFZtSrXyp4gyIDXdqujma2WYXma5XbzHRm3B+RsbhgXP@lists.linux.dev
X-Gm-Message-State: AOJu0YycBiS6EoKsF2seosWzy2107zzQjQeQP/Ppvsb5Rw6EsrcD7rXA
	JJhwTPNyULLEVIGPv4ESB/Xc0SwK7AbTrx6a7TD9XPwKoUbBdOEImJg0
X-Gm-Gg: AeBDiesELW0VoZR4awFTP1KRbbA8qDKCmcbmhJzKLRMmZG3+wjlZUweEWYdDQgnhFV+
	DUEG3UheNIS4ZkdP043ljkLMFs8G/tsCZvx/3tmq74DEwKdSfFasbt2NK1Ql+OzMk/3wzkVnjCT
	3KylHK82nfCArIGYz+foE4hOBbp500LJ1CIQOZW40nErmqtjLVGu3lCQPh/0FuFoZtItR6leG3O
	D4nitl2UUzbw0UY1bDnEvOg+qihb9uxqlbed60rxpJkVPfwkhtgoT+JQSsYcDk1FPPKZoaaW9xf
	4kl5dA/Dt84KU2AlSq5wJxlToeYTQHLWWt6GmBFCSUncsXoCyV6Bptazh7vNcVNSe9HeQwBlfM3
	+kLhG3KcGuxTxfvYAaow7XSKjs221IBV2ICBQyEahhSWKajY662WElGrfF+Sex8SEQD9vUWpugn
	g9nE3yVZgsVUYLUpOHubxy7Xqs
X-Received: by 2002:a05:6512:39d5:b0:5a4:1b8:1a9c with SMTP id 2adb3069b0e04-5a401b81ad6mr1888639e87.26.1776160742019;
        Tue, 14 Apr 2026 02:59:02 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:59:01 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 9/9] staging: rtl8723bs: wrap long lines and fix argument alignment
Date: Tue, 14 Apr 2026 12:58:33 +0300
Message-ID: <20260414095833.76480-10-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break lines that exceed 80 columns and align continuation arguments to
the opening parenthesis. Affected sites: scnprintf calls in
dump_chip_info, hw_chnlPlan assignment, Queue2Pipe[7] assignments in
the pipe-mapping functions, rtw_hal_set_hwreg in hal_init_macaddr,
c2h_evt payload read loop, rtw_write16/rtw_write8 in SetHwReg and
rtw_hal_check_rxfifo_full, rtw_get_stainfo and the UndecoratedSmoothedPWDB
assignment in GetHalDefVar, ODM_CmnInfoPtrArrayHook calls in SetHalODMVar,
and rtw_hal_read_rfreg/PHY_SetRFReg in rtw_bb_rf_gain_offset.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 71 +++++++++++++++++--------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 2688355f9265..0e3b5831d974 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -35,8 +35,10 @@ void dump_chip_info(struct hal_version ChipVersion)
 	char buf[128];
 	size_t cnt = 0;
 
-	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "Chip Version Info: CHIP_8723B_%s_",
-			IS_NORMAL_CHIP(ChipVersion) ? "Normal_Chip" : "Test_Chip");
+	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt,
+			 "Chip Version Info: CHIP_8723B_%s_",
+			 IS_NORMAL_CHIP(ChipVersion) ? "Normal_Chip" :
+						       "Test_Chip");
 
 	if (IS_CHIP_VENDOR_TSMC(ChipVersion))
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "TSMC_");
@@ -63,11 +65,12 @@ void dump_chip_info(struct hal_version ChipVersion)
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "K_CUT_");
 	else
 		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt,
-				"UNKNOWN_CUT(%d)_", ChipVersion.CUTVersion);
+				 "UNKNOWN_CUT(%d)_", ChipVersion.CUTVersion);
 
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "1T1R_");
 
-	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", ChipVersion.ROMVer);
+	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n",
+			 ChipVersion.ROMVer);
 }
 
 #define EEPROM_CHANNEL_PLAN_BY_HW_MASK 0x80
@@ -107,7 +110,8 @@ u8 hal_com_config_channel_plan(struct adapter *padapter, u8 hw_channel_plan,
 	if (!AutoLoadFail) {
 		u8 hw_chnlPlan;
 
-		hw_chnlPlan = hw_channel_plan & (~EEPROM_CHANNEL_PLAN_BY_HW_MASK);
+		hw_chnlPlan = hw_channel_plan &
+			      (~EEPROM_CHANNEL_PLAN_BY_HW_MASK);
 		if (rtw_is_channel_plan_valid(hw_chnlPlan)) {
 			if (hw_channel_plan & EEPROM_CHANNEL_PLAN_BY_HW_MASK)
 				pHalData->bDisableSWChannelPlan = true;
@@ -364,9 +368,11 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
 		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
+		pdvobjpriv->Queue2Pipe[7] =
+			pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 
 	} else { /* typical setting */
+
 		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
@@ -379,8 +385,8 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
 		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
-
+		pdvobjpriv->Queue2Pipe[7] =
+			pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 	}
 }
 
@@ -401,9 +407,11 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
 		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
+		pdvobjpriv->Queue2Pipe[7] =
+			pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 
 	} else { /* typical setting */
+
 		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
@@ -416,7 +424,8 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[4] = pdvobjpriv->RtOutPipe[0]; /* BCN */
 		pdvobjpriv->Queue2Pipe[5] = pdvobjpriv->RtOutPipe[0]; /* MGT */
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0]; /* HIGH */
-		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0]; /* TXCMD */
+		pdvobjpriv->Queue2Pipe[7] =
+			pdvobjpriv->RtOutPipe[0]; /* TXCMD */
 	}
 }
 
@@ -449,7 +458,8 @@ bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
 
 void hal_init_macaddr(struct adapter *adapter)
 {
-	rtw_hal_set_hwreg(adapter, HW_VAR_MAC_ADDR, adapter->eeprompriv.mac_addr);
+	rtw_hal_set_hwreg(adapter, HW_VAR_MAC_ADDR,
+			  adapter->eeprompriv.mac_addr);
 }
 
 void rtw_init_hal_com_default_value(struct adapter *Adapter)
@@ -502,7 +512,8 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 
 	/* Read the content */
 	for (i = 0; i < c2h_evt->plen; i++)
-		c2h_evt->payload[i] = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 2 + i);
+		c2h_evt->payload[i] =
+			rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 2 + i);
 
 	ret = _SUCCESS;
 
@@ -565,7 +576,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		u16 reg_scr;
 
 		reg_scr = rtw_read16(adapter, REG_SECCFG);
-		rtw_write16(adapter, REG_SECCFG, reg_scr | SCR_CHK_KEYID | SCR_RxDecEnable | SCR_TxEncEnable);
+		rtw_write16(adapter, REG_SECCFG,
+			    reg_scr | SCR_CHK_KEYID | SCR_RxDecEnable |
+				    SCR_TxEncEnable);
 	} break;
 	case HW_VAR_SEC_DK_CFG: {
 		struct security_priv *sec = &adapter->securitypriv;
@@ -576,7 +589,8 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
 				reg_scr |= (SCR_RxUseDK | SCR_TxUseDK);
 		} else { /* Disable default key related setting */
-			reg_scr &= ~(SCR_RXBCUSEDK | SCR_TXBCUSEDK | SCR_RxUseDK | SCR_TxUseDK);
+			reg_scr &= ~(SCR_RXBCUSEDK | SCR_TXBCUSEDK |
+				     SCR_RxUseDK | SCR_TxUseDK);
 		}
 
 		rtw_write8(adapter, REG_SECCFG, reg_scr);
@@ -657,9 +671,11 @@ u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 
 		pmlmepriv = &adapter->mlmepriv;
 		pstapriv = &adapter->stapriv;
-		psta = rtw_get_stainfo(pstapriv, pmlmepriv->cur_network.network.mac_address);
+		psta = rtw_get_stainfo(pstapriv,
+				       pmlmepriv->cur_network.network.mac_address);
 		if (psta)
-			*((int *)value) = psta->rssi_stat.UndecoratedSmoothedPWDB;
+			*((int *)value) =
+				psta->rssi_stat.UndecoratedSmoothedPWDB;
 	} break;
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)value) = hal_data->odmpriv.SupportAbility;
@@ -701,10 +717,14 @@ void SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable,
 		struct sta_info *psta = pValue1;
 
 		if (bSet) {
-			ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, psta);
+			ODM_CmnInfoPtrArrayHook(podmpriv,
+						ODM_CMNINFO_STA_STATUS,
+						psta->mac_id, psta);
 		} else {
 			/* spin_lock_bh(&pHalData->odm_stainfo_lock); */
-			ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
+			ODM_CmnInfoPtrArrayHook(podmpriv,
+						ODM_CMNINFO_STA_STATUS,
+						psta->mac_id, NULL);
 
 			/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
 		}
@@ -754,7 +774,8 @@ bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 {
 	/* switch counter to RX fifo */
-	rtw_write8(adapter, REG_RXERR_RPT + 3, rtw_read8(adapter, REG_RXERR_RPT + 3) | 0xf0);
+	rtw_write8(adapter, REG_RXERR_RPT + 3,
+		   rtw_read8(adapter, REG_RXERR_RPT + 3) | 0xf0);
 }
 
 static u32 Array_kfreemap[] = {
@@ -782,19 +803,23 @@ void rtw_bb_rf_gain_offset(struct adapter *padapter)
 
 	if (value & BIT4) {
 		if (padapter->eeprompriv.EEPROMRFGainVal != 0xff) {
-			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
+			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f,
+					   0xffffffff);
 
 			for (i = 0; i < ARRAY_SIZE(Array_kfreemap); i += 2) {
 				v1 = Array[i];
 				v2 = Array[i + 1];
-				if (v1 == padapter->eeprompriv.EEPROMRFGainVal) {
+				if (v1 ==
+				    padapter->eeprompriv.EEPROMRFGainVal) {
 					target = v2;
 					break;
 				}
 			}
-			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT18 | BIT17 | BIT16 | BIT15, target);
+			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET,
+				     BIT18 | BIT17 | BIT16 | BIT15, target);
 
-			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
+			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f,
+					   0xffffffff);
 		}
 	}
 }
-- 
2.53.0

