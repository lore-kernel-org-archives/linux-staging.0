Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621B3A1A2F
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779545729; cv=none; b=aiftBCm2VCboLv3UyISSo6p4sAHectH5z3bj42lPkfiazTHmBcSVRjD0AVOL8QS5hHKoKGBSrFNSzpXqj17xdMTL/quLr3yrYm/P6q4X7NLf+oBLZNv/VBLuifgS7EQ5llF7BrpN5/JACNF2mVHzyhIquxYPPSGOkEK8SkAfk2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779545729; c=relaxed/simple;
	bh=RXEpopoX8Fk/YQ/l26qsnSVHsDDIBwl5a3p7rtE3ZkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQirLLFxt3KzG71rfXD4xcIr3F+kzFgEC1VAW3fUb3EhOjGLspeZ6PsiZ+r8lxVJF65J0bRLiObJHOWKab5Ve3lgzertFpjOpbZKBfYNVguQP1ie3SYmoAkEMvdLWlPdZM3WpkRgzec3eSRrzHuOmx28kPe0hRxhp6bf+n+EQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyGb+Vec; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyGb+Vec"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so7937651a91.3
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779545727; x=1780150527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vjlx9mrn/1jbT9UvO+aNfQ56s819NVxGraTyv+fbkE=;
        b=lyGb+Vec0GvEgeAkv5omWp1rXTU6v0EmS2NUBNG7fDyXmutpSM2ExHdvfNwFPrWDYB
         TuZak//0RSGIuy9o94cjVYYOx/+ltoXLnVbQSz+bSF2+zmhjF5Hlgv6H9l8/gzQdaAJZ
         axM7lQuR1rcJn38RoU4Jyj6AaH+H1Jvc85tkd2k9dybIC2GpPylV8qB8ZwmKprdim4PQ
         HxycJt2hBRX9zL8TrjY57RXS8RkwfBKaT3e9jVaDP9Fb4pohtaW7cL0Q5RlLTNZzmLVw
         z+XrjttlMg3TFs8ZPwt+2gW09tqDJVJHsPjOppTIribLNeakl6qcOtFSMGCk4I3KMcgx
         mOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779545727; x=1780150527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vjlx9mrn/1jbT9UvO+aNfQ56s819NVxGraTyv+fbkE=;
        b=QYspcpi72TTGXtCdG0M6DsRGfBuOGlaY1ruk+bGzsR0DDtVOvlryY5YNSLzMuQ9SWH
         xuPeqmrvgZyDMaFknFxEC7wRaVlHKaKHJt1XoPurWdjNHkxm1+UojQQ4PaoecMnCAILG
         560+ZcSOiWUogYvqSinUrMU2DoPD3v4g4aYyOdSCpFfz1j2diOLyCK8R7ncovlmwUtam
         zGEI+H8gCwt6sN5+OKKixtfqCYfMjOoyAaiq5RXyiuKpF225WdLCNvzEG1wRaJsprBo1
         FMbqqjUqalfUNr+NsP27DDvXjXoXjoNzotVSlJKsIhbicdYIiIUJ/zkQuUBHm7GPCGBP
         3omQ==
X-Gm-Message-State: AOJu0Yz455B0MibO0rbyKIBtPD/A2Ya5tI14BvIWvkRY6h4IEImg27wU
	2eGCrDN9qMF7ewfGkT1NleTac/mONAbDZGr7rjom1UFJDQrRPDflWs+S
X-Gm-Gg: Acq92OGTDqtl3bkskGnHuhAQHQiKxCxjjfkvO2PFE3trfXm+uuXLk4eT+ekX7MAh/rA
	m8rqo7pFfMDZdH8Otutj+VoDCsDrWqPAJJZDD1SDkVGSEsdR0Yrmub8tfLHl6zPO1U4uOEnvRuz
	R6CdBDWbncFf99DIpEB6Ze/6rM6olVB2Nd3lELBRKcZpYVczG0/5QDZkhAieAlhqvqBI9yPTNPN
	N3zOl5Z3sMsXI8V6AEMBCi7TeEEI6X1S7SpAK0lg3//ZPxSqxyp63ZXHO+3OgtZlhxPRTj4ubwm
	2ynNLT4dNjLsQJgepuFlVOsLZO5S82dUUtMjEa92sO3p387dNm1A9HvA9j8GEkprHs/QvP41Qdn
	s37Qh+9k3iSVdHvUuJkJ3sGdiKz/OP9+4RZjsaxNx7wGfuP3ZRGX/1cOLD7iIjN5XZGzfxOMgDL
	3qPEpOy5eI/FAtz9BVdk8AqiFW
X-Received: by 2002:a17:90b:3791:b0:36a:a16b:5f65 with SMTP id 98e67ed59e1d1-36aa16b65e4mr1429437a91.11.1779545726492;
        Sat, 23 May 2026 07:15:26 -0700 (PDT)
Received: from atharv-VM ([103.97.104.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6d88a63fsm2135440a91.12.2026.05.23.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 07:15:26 -0700 (PDT)
From: Atharv Margur <atharvmargur@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Atharv Margur <atharvmargur@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtl8723b_hal_init.c
Date: Sat, 23 May 2026 19:43:41 +0530
Message-ID: <20260523141341.21607-1-atharvmargur@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around single statement blocks
to improve readability and conform to kernel coding style.

No functional changes intended.

Signed-off-by: Atharv Margur <atharvmargur@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3ca..14ec258c0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -197,9 +197,8 @@ static s32 polling_fwdl_chksum(
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & FWDL_ChkSum_rpt)) {
+	if (!(value32 & FWDL_ChkSum_rpt))
 		goto exit;
-	}
 
 	if (g_fwdl_chksum_fail) {
 		g_fwdl_chksum_fail--;
@@ -238,9 +237,8 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & WINTINI_RDY)) {
+	if (!(value32 & WINTINI_RDY))
 		goto exit;
-	}
 
 	if (g_fwdl_wintint_rdy_fail) {
 		g_fwdl_wintint_rdy_fail--;
@@ -1048,9 +1046,8 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	rate_bitmap = hal_btcoex_GetRaMask(padapter);
 	mask &= ~rate_bitmap;
 
-	if (pHalData->fw_ractrl) {
+	if (pHalData->fw_ractrl)
 		rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, psta->raid, psta->bw_mode, short_gi_rate, mask);
-	}
 
 	/* set correct initial date rate for each mac_id */
 	pdmpriv->INIDATA_RATE[mac_id] = psta->init_rate;
@@ -1621,9 +1618,8 @@ static void rtl8723b_cal_txdesc_chksum(struct tx_desc *ptxdesc)
 	/*  Thomas, Lucas@SD4, 20130515 */
 	count = 16;
 
-	for (index = 0; index < count; index++) {
+	for (index = 0; index < count; index++)
 		checksum |= le16_to_cpu(*(__le16 *)(usPtr + index));
-	}
 
 	ptxdesc->txdw7 |= cpu_to_le32(checksum & 0x0000ffff);
 }
@@ -1892,9 +1888,8 @@ void rtl8723b_fill_fake_txdesc(
 		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
 	}
 
-	if (IsBTQosNull) {
+	if (IsBTQosNull)
 		SET_TX_DESC_BT_INT_8723B(pDesc, 1);
-	}
 
 	SET_TX_DESC_USE_RATE_8723B(pDesc, 1); /*  use data rate which is set by Sw */
 	SET_TX_DESC_OWN_8723B((u8 *)pDesc, 1);
@@ -2211,9 +2206,9 @@ void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len)
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
@@ -2583,9 +2578,8 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 
 			/*  Forece leave RF low power mode for 1T1R to prevent conficting setting in Fw power */
 			/*  saving sequence. 2010.06.07. Added by tynli. Suggested by SD3 yschang. */
-			if (psmode != PS_MODE_ACTIVE) {
+			if (psmode != PS_MODE_ACTIVE)
 				ODM_RF_Saving(&pHalData->odmpriv, true);
-			}
 
 			/* if (psmode != PS_MODE_ACTIVE)	{ */
 			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
-- 
2.53.0

