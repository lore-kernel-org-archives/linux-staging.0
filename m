Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E52459DC
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870476; cv=none; b=P9b4Bs8hGj4rw78mYWVwWshHTS0OS6ZhZ7d/YMkfcC62l9d5wjFolVruldSqlHJ41tyLTnMQHjKw2eTcpIwd5gAjIncXpoRTXTN4pAJ3jJsqYast6yrmYyNYM/8Vl9bTwT3qT0p8AYEN4+aZzjR1t0IE180pjpuKpVql4oLmH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870476; c=relaxed/simple;
	bh=NrkEMKv/OjVK8Al5t2JOrX+5lNBTCMuIpTfnJq0FZKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m36EHpFVmDwdmMfk5JIeHqT1MjRfASBZp9XktLKmg9+8n854xAS8E0P3dBnX9l//4X38Cu6nkU3upQpSV3aaIeQy1y9fcoGvR+W8qOn3ZjkI75rRTsPoB1Fz7/RSIX73y3osaKUk/G6M85FhNwRBCgdPYJ8HGjqKxPni0sM5iwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBYh+k8Q; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBYh+k8Q"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b00d1e7082so1775378e87.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783870472; x=1784475272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OQ1k+7+OKgDOPXNXeWWLucG/wIn4+UMOi+5rR6YEEIk=;
        b=KBYh+k8Q+3l70LzvFJyU9hHotUNc2nEPuj2yyifBBGZW3JTmluS9AM+FaSpJMoRqB+
         CicEW8ZQ9rGchv17idPjqoRBcRz2FShPHo3DRc/OdQjxS0agf+9IWto5YcN1/KJifSw4
         Ab/hyuI9UHkKYp45nYkUIp0S0UoGZhdufqSWTOEbhy4KJUghBO/FAVWLg8e08UwXF7hP
         nRmQo7swF2i9bxwm+K6t359TxZeNxahopacspRzkf+QnGkjLmkkdVX1AdQCJER1VQeEn
         RyTsJw3vCto5jAZCd6hShErscusvRZ/0HUgXnLrll1CPUAP9HQBvzwseRqesFtksSJ8T
         zaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870472; x=1784475272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQ1k+7+OKgDOPXNXeWWLucG/wIn4+UMOi+5rR6YEEIk=;
        b=sjoOcVat5r4zPEvmO0NdWn6R6OhG0oxUHoOKBS6iVLkSOSl6yfWCFoylBDtB/sUS+r
         YBWh9Eu1RkzUI9XV0YIBY+yhhgrf0RROUaB64ZU2R3WUY1aunyzYkZptdSWPiRIdT1LQ
         OYnCj7hJmI/bf+yqaFSHh5NBQcfA0+rI3zPqkRC7vamdptUWEVT4Z6hj/rUc3RFynoN4
         nrVIc2mpG0xCwNpSw82KUZTYAFM54oqJNaSW4fAZCS1lSBA4s7H55KNF3PJkJ/r7RtYM
         5oIfAk9zjzu8Yd48eRABl2hhk81cLbzy234in7GhOkXJYpymRi5PcESaEUuA9DRteHe9
         DWCg==
X-Gm-Message-State: AOJu0YwVYeGA1T1JAcmUpRkdywk2denjd6XMBGZJc6qBhCOEGRS8Gpbz
	GwJpvYUFw5CuufPkpgyePQfp6eHMXPV0RGaf5kfVV+Ns8iEdjsmxBJFH
X-Gm-Gg: AfdE7ckt+Qi+TlY+TojUh4tqQjHXxsDhClsdwPmr+SP7dhkXnkEwwFH9dZIXU30U2PT
	aaFX3+56Mk1OOGOHai36Ghy1KL9zLy/HtTk/GP/V06VeEtRNmyPE9ucBpqAwVc+dgcsmtvNnlvG
	iMPrikN+M5ipV2Y26z5DduZy8DTTaNl91gN0acAZ10at9XNkEd0jfOXB0E9P5IU3/xFVGT3n6tI
	2PYqTFoOOUuClHswh3i8B8PvMkj78bj/O9cWaqFJqKPd194PVaLOA1ii/hU5GrPpfbKSWqgfsGu
	bTVGjOjWBdi5etCuJZG53K6TsUgCpZJpKbpdfvNwkGlXgwVu4uUtCoyxO+zuadml6y7zdD+Urkj
	+oPRgn9Mh08i1nZ3ymouKHJtvrc0TU50Dm6cPIY0/gSFigrYw9b4Gc1hpS+OQmMzgEzMLquYksB
	yNwyh88O2LvnIpyqNFOkykBUnTh+WMQO4wFVqSIeIYp9et/hXC1oWkJJ3t+klLJ9dOOlcdBF2ol
	MEo17S6baY1J2k=
X-Received: by 2002:ac2:48ac:0:b0:5b0:bc3:dc11 with SMTP id 2adb3069b0e04-5b023669296mr1082053e87.22.1783870472267;
        Sun, 12 Jul 2026 08:34:32 -0700 (PDT)
Received: from archlinux ([94.180.100.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa66c0sm2191773e87.63.2026.07.12.08.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:34:31 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces
Date: Sun, 12 Jul 2026 22:34:23 +0700
Message-ID: <20260712153423.130472-1-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant curly braces from single-statement blocks in
rtl8723b_hal_init.c to adhere to the Linux kernel coding style.
This resolves warnings reported by checkpatch.pl.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 51 +++++++++----------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index a364f4507..7862cea83 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -194,9 +194,9 @@ static s32 polling_fwdl_chksum(
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & FWDL_ChkSum_rpt)) {
+	if (!(value32 & FWDL_ChkSum_rpt))
 		goto exit;
-	}
+
 
 	if (g_fwdl_chksum_fail) {
 		g_fwdl_chksum_fail--;
@@ -235,9 +235,9 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & WINTINI_RDY)) {
+	if (!(value32 & WINTINI_RDY))
 		goto exit;
-	}
+
 
 	if (g_fwdl_wintint_rdy_fail) {
 		g_fwdl_wintint_rdy_fail--;
@@ -1031,9 +1031,9 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	rate_bitmap = hal_btcoex_GetRaMask(padapter);
 	mask &= ~rate_bitmap;
 
-	if (pHalData->fw_ractrl) {
+	if (pHalData->fw_ractrl)
 		rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, psta->raid, psta->bw_mode, short_gi_rate, mask);
-	}
+
 
 	/* set correct initial date rate for each mac_id */
 	pdmpriv->INIDATA_RATE[mac_id] = psta->init_rate;
@@ -1184,9 +1184,9 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 
 	/*  Check 0x8129 again for making sure autoload status!! */
 	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
-	if (EEPROMId != RTL_EEPROM_ID) {
+	if (EEPROMId != RTL_EEPROM_ID)
 		pEEPROM->bautoload_fail_flag = true;
-	} else
+	else
 		pEEPROM->bautoload_fail_flag = false;
 }
 
@@ -1566,13 +1566,13 @@ u8 SCMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib)
 		if (pattrib->bwmode == CHANNEL_WIDTH_40) {
 			SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
 		} else if (pattrib->bwmode == CHANNEL_WIDTH_20) {
-			if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER) {
+			if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 				SCSettingOfDesc = HT_DATA_SC_20_UPPER_OF_40MHZ;
-			} else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) {
+			else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
 				SCSettingOfDesc = HT_DATA_SC_20_LOWER_OF_40MHZ;
-			} else {
+			else
 				SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
-			}
+
 		}
 	} else {
 		SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
@@ -1596,9 +1596,9 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 	/*  Thomas, Lucas@SD4, 20130515 */
 	count = 16;
 
-	for (index = 0; index < count; index++) {
+	for (index = 0; index < count; index++)
 		checksum |= le16_to_cpu(*(__le16 *)(usPtr + index));
-	}
+
 
 	ptxdesc->txdw7 |= cpu_to_le32(checksum & 0x0000ffff);
 }
@@ -1772,11 +1772,10 @@ static void rtl8723b_fill_default_txdesc(
 		ptxdesc->mbssid = pattrib->mbssid & 0xF;
 
 		ptxdesc->rty_lmt_en = 1; /*  retry limit enable */
-		if (pattrib->retry_ctrl) {
+		if (pattrib->retry_ctrl)
 			ptxdesc->data_rt_lmt = 6;
-		} else {
+		else
 			ptxdesc->data_rt_lmt = 12;
-		}
 
 		ptxdesc->datarate = MRateToHwRate(pmlmeext->tx_rate);
 
@@ -1867,9 +1866,9 @@ void rtl8723b_fill_fake_txdesc(
 		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
 	}
 
-	if (IsBTQosNull) {
+	if (IsBTQosNull)
 		SET_TX_DESC_BT_INT_8723B(pDesc, 1);
-	}
+
 
 	SET_TX_DESC_USE_RATE_8723B(pDesc, 1); /*  use data rate which is set by Sw */
 	SET_TX_DESC_OWN_8723B((u8 *)pDesc, 1);
@@ -2184,9 +2183,9 @@ void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len)
 #define	GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 6, 1)
 #define	GET_8723B_C2H_TX_RPT_RETRY_OVER(_Header)	LE_BITS_TO_1BYTE((_Header + 0), 7, 1)
 
-	if (GET_8723B_C2H_TX_RPT_RETRY_OVER(pdata) | GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(pdata)) {
+	if (GET_8723B_C2H_TX_RPT_RETRY_OVER(pdata) | GET_8723B_C2H_TX_RPT_LIFE_TIME_OVER(pdata))
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
-	}
+
 /*
 	else if (seq_no != padapter->xmitpriv.seq_no) {
 		rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_CCX_PKT_FAIL);
@@ -2555,9 +2554,9 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 			/*  Forece leave RF low power mode for 1T1R to prevent conficting setting in Fw power */
 			/*  saving sequence. 2010.06.07. Added by tynli. Suggested by SD3 yschang. */
-			if (psmode != PS_MODE_ACTIVE) {
+			if (psmode != PS_MODE_ACTIVE)
 				ODM_RF_Saving(&pHalData->odmpriv, true);
-			}
+
 
 			/* if (psmode != PS_MODE_ACTIVE)	{ */
 			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
@@ -2871,11 +2870,11 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 		break;
 
 	case HAL_DEF_TX_PAGE_BOUNDARY:
-		if (!padapter->registrypriv.wifi_spec) {
+		if (!padapter->registrypriv.wifi_spec)
 			*(u8 *)pval = TX_PAGE_BOUNDARY_8723B;
-		} else {
+		 else
 			*(u8 *)pval = WMM_NORMAL_TX_PAGE_BOUNDARY_8723B;
-		}
+
 		break;
 
 	case HAL_DEF_MACID_SLEEP:
-- 
2.55.0

