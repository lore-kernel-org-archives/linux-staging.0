Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299570
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 23:05:44 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so2723024wms.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 16:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZDf3qHXAdeDRi+VVyrEKfVgmqaxkWw8JapgEiFWemZs=;
        b=M+i/EzJA5AjNXqPUHe0D9rejriaqrB3HoL0JpvOKhWOX9bxxiOSnqOkx3RhOHaPNX1
         VEwAWQ9u8KIVD8jlfFgmn46CLMTF1eSPLMJR9qfltj/9ROW3SvFH87wBORPieENn5uc4
         Yz9n/nUd52EtnV36yJJCVYxoiNYYYuu6mCn0lJPGOWXvKN8kSWqRhd0fTmSHflJ8D48v
         B0jK3GCq/pRWGZ7MHLkX/1l5fg0yh+Qru8H2LxUpx5npQ9qNs75UGYwR5yeAbd3qBuh2
         noDf5B2DIuKkpoPUjCeIRJ40hb+cibHKn7/uYxMuwnVN03NC/Luq6zZDL7C670H+6k7W
         fRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZDf3qHXAdeDRi+VVyrEKfVgmqaxkWw8JapgEiFWemZs=;
        b=umRe9TuGxZhPNLDN/dLtm0/AC5URKco24gRWuPs8oktPzFZLGNUwOJ0R4IczCUsJGG
         br0tnNnwYbovjtIPxEF00whYvG/ik+JHoG8NxxP/IaTX0WDD+JMaXKbPIM5OvTvmi9EW
         EjYfo5LXGIR+F7GIEMIDZ7TeYsXAUSBktlx+QVtSBjkIRDDi0A+aaMhKj1K+LML2kdJZ
         xFbRbrtI5CiOR1LFZQznKtVvsk2PmgKRWT2HYtLDhqzWPWeZydcpV0CEhyxdAYVDI9Tr
         cLU5cMQIBgjoYuUqukXy+TRsJ8lKeN1blxKH4yfHEW9AnXXPjSl+RtpMwAbGNpy/IzRD
         3aWg==
X-Gm-Message-State: AOAM5330k7Nhr/fxp421wogP7qpICMi5xO7v4MUda7/uECmluqBIXvzZ
	8x6UnoUzwHAZVzAv/1TyzS4lfQ==
X-Google-Smtp-Source: ABdhPJwfDiX6tIrtFjdHvGOhySJz0EdiDQ5m/1lPC2kAlW5PNkQ3QbLzz6MdcNUAUkRum7+X4DpKpg==
X-Received: by 2002:a05:600c:4657:: with SMTP id n23mr24304234wmo.46.1628031942405;
        Tue, 03 Aug 2021 16:05:42 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id i29sm330045wmb.20.2021.08.03.16.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:05:41 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: r8188eu: remove RT_TRACE calls from hal/rtl8188e_mp.c
Date: Wed,  4 Aug 2021 00:05:33 +0100
Message-Id: <20210803230535.74254-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803230535.74254-1-phil@philpotter.co.uk>
References: <20210803230535.74254-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from hal/rtl8188e_mp.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_mp.c | 43 +++--------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_mp.c b/drivers/staging/r8188eu/hal/rtl8188e_mp.c
index 510906cc6007..8f3cccfc23f4 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_mp.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_mp.c
@@ -13,17 +13,11 @@ s32 Hal_SetPowerTracking(struct adapter *padapter, u8 enable)
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
 	struct odm_dm_struct *pDM_Odm = &(pHalData->odmpriv);
 
-	if (!netif_running(padapter->pnetdev)) {
-		RT_TRACE(_module_mp_, _drv_warning_,
-			 ("SetPowerTracking! Fail: interface not opened!\n"));
+	if (!netif_running(padapter->pnetdev))
 		return _FAIL;
-	}
 
-	if (!check_fwstate(&padapter->mlmepriv, WIFI_MP_STATE)) {
-		RT_TRACE(_module_mp_, _drv_warning_,
-			 ("SetPowerTracking! Fail: not in MP mode!\n"));
+	if (!check_fwstate(&padapter->mlmepriv, WIFI_MP_STATE))
 		return _FAIL;
-	}
 
 	if (enable)
 		pDM_Odm->RFCalibrateInfo.bTXPowerTracking = true;
@@ -262,10 +256,6 @@ void Hal_SetCCKTxPower(struct adapter *pAdapter, u8 *TxPower)
 	write_bbreg(pAdapter, rTxAGC_B_CCK11_A_CCK2_11, bMaskByte0, TxPower[RF_PATH_B]);
 	tmpval = (TxPower[RF_PATH_B]<<16) | (TxPower[RF_PATH_B]<<8) | TxPower[RF_PATH_B];
 	write_bbreg(pAdapter, rTxAGC_B_CCK1_55_Mcs32, 0xffffff00, tmpval);
-
-	RT_TRACE(_module_mp_, _drv_notice_,
-		 ("-SetCCKTxPower: A[0x%02x] B[0x%02x]\n",
-		  TxPower[RF_PATH_A], TxPower[RF_PATH_B]));
 }
 
 void Hal_SetOFDMTxPower(struct adapter *pAdapter, u8 *TxPower)
@@ -514,23 +504,17 @@ void Hal_SetAntenna(struct adapter *pAdapter)
 			break;
 		}
 	}
-
-	RT_TRACE(_module_mp_, _drv_notice_, ("-SwitchAntenna: finished\n"));
 }
 
 s32 Hal_SetThermalMeter(struct adapter *pAdapter, u8 target_ther)
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(pAdapter);
 
-	if (!netif_running(pAdapter->pnetdev)) {
-		RT_TRACE(_module_mp_, _drv_warning_, ("SetThermalMeter! Fail: interface not opened!\n"));
+	if (!netif_running(pAdapter->pnetdev))
 		return _FAIL;
-	}
 
-	if (check_fwstate(&pAdapter->mlmepriv, WIFI_MP_STATE) == false) {
-		RT_TRACE(_module_mp_, _drv_warning_, ("SetThermalMeter: Fail! not in MP mode!\n"));
+	if (check_fwstate(&pAdapter->mlmepriv, WIFI_MP_STATE) == false)
 		return _FAIL;
-	}
 
 	target_ther &= 0xff;
 	if (target_ther < 0x07)
@@ -568,7 +552,6 @@ void Hal_SetSingleCarrierTx(struct adapter *pAdapter, u8 bStart)
 	pAdapter->mppriv.MptCtx.bSingleCarrier = bStart;
 	if (bStart) {
 		/*  Start Single Carrier. */
-		RT_TRACE(_module_mp_, _drv_alert_, ("SetSingleCarrierTx: test start\n"));
 		/*  1. if OFDM block on? */
 		if (!read_bbreg(pAdapter, rFPGA0_RFMOD, bOFDMEn))
 			write_bbreg(pAdapter, rFPGA0_RFMOD, bOFDMEn, bEnable);/* set OFDM block on */
@@ -586,8 +569,6 @@ void Hal_SetSingleCarrierTx(struct adapter *pAdapter, u8 bStart)
 		write_bbreg(pAdapter, rFPGA0_XB_HSSIParameter1, bMaskDWord, 0x01000500);
 	} else {
 		/*  Stop Single Carrier. */
-		RT_TRACE(_module_mp_, _drv_alert_, ("SetSingleCarrierTx: test stop\n"));
-
 		/*  Turn off all test modes. */
 		write_bbreg(pAdapter, rOFDM1_LSTF, bOFDMContinueTx, bDisable);
 		write_bbreg(pAdapter, rOFDM1_LSTF, bOFDMSingleCarrier, bDisable);
@@ -627,7 +608,6 @@ void Hal_SetSingleToneTx(struct adapter *pAdapter, u8 bStart)
 	pAdapter->mppriv.MptCtx.bSingleTone = bStart;
 	if (bStart) {
 		/*  Start Single Tone. */
-		RT_TRACE(_module_mp_, _drv_alert_, ("SetSingleToneTx: test start\n"));
 		/*  <20120326, Kordan> To amplify the power of tone for Xtal calibration. (asked by Edlu) */
 		if (IS_HARDWARE_TYPE_8188E(pAdapter)) {
 			reg58 = PHY_QueryRFReg(pAdapter, RF_PATH_A, LNA_Low_Gain_3, bRFRegOffsetMask);
@@ -660,8 +640,6 @@ void Hal_SetSingleToneTx(struct adapter *pAdapter, u8 bStart)
 
 	} else {
 		/*  Stop Single Tone. */
-		RT_TRACE(_module_mp_, _drv_alert_, ("SetSingleToneTx: test stop\n"));
-
 		/*  <20120326, Kordan> To amplify the power of tone for Xtal calibration. (asked by Edlu) */
 		/*  <20120326, Kordan> Only in single tone mode. (asked by Edlu) */
 		if (IS_HARDWARE_TYPE_8188E(pAdapter)) {
@@ -695,7 +673,6 @@ void Hal_SetCarrierSuppressionTx(struct adapter *pAdapter, u8 bStart)
 	pAdapter->mppriv.MptCtx.bCarrierSuppression = bStart;
 	if (bStart) {
 		/*  Start Carrier Suppression. */
-		RT_TRACE(_module_mp_, _drv_alert_, ("SetCarrierSuppressionTx: test start\n"));
 		if (pAdapter->mppriv.rateidx <= MPT_RATE_11M) {
 			/*  1. if CCK block on? */
 			if (!read_bbreg(pAdapter, rFPGA0_RFMOD, bCCKEn))
@@ -718,7 +695,6 @@ void Hal_SetCarrierSuppressionTx(struct adapter *pAdapter, u8 bStart)
 		write_bbreg(pAdapter, rFPGA0_XB_HSSIParameter1, bMaskDWord, 0x01000500);
 	} else {
 		/*  Stop Carrier Suppression. */
-		RT_TRACE(_module_mp_, _drv_alert_, ("SetCarrierSuppressionTx: test stop\n"));
 		if (pAdapter->mppriv.rateidx <= MPT_RATE_11M) {
 			write_bbreg(pAdapter, rCCK0_System, bCCKBBMode, 0x0);    /* normal mode */
 			write_bbreg(pAdapter, rCCK0_System, bCCKScramble, 0x1);  /* turn on scramble setting */
@@ -739,9 +715,6 @@ void Hal_SetCCKContinuousTx(struct adapter *pAdapter, u8 bStart)
 	u32 cckrate;
 
 	if (bStart) {
-		RT_TRACE(_module_mp_, _drv_alert_,
-			 ("SetCCKContinuousTx: test start\n"));
-
 		/*  1. if CCK block on? */
 		if (!read_bbreg(pAdapter, rFPGA0_RFMOD, bCCKEn))
 			write_bbreg(pAdapter, rFPGA0_RFMOD, bCCKEn, bEnable);/* set CCK block on */
@@ -760,9 +733,6 @@ void Hal_SetCCKContinuousTx(struct adapter *pAdapter, u8 bStart)
 		write_bbreg(pAdapter, rFPGA0_XA_HSSIParameter1, bMaskDWord, 0x01000500);
 		write_bbreg(pAdapter, rFPGA0_XB_HSSIParameter1, bMaskDWord, 0x01000500);
 	} else {
-		RT_TRACE(_module_mp_, _drv_info_,
-			 ("SetCCKContinuousTx: test stop\n"));
-
 		write_bbreg(pAdapter, rCCK0_System, bCCKBBMode, 0x0);	/* normal mode */
 		write_bbreg(pAdapter, rCCK0_System, bCCKScramble, bEnable);	/* turn on scramble setting */
 
@@ -782,7 +752,6 @@ void Hal_SetCCKContinuousTx(struct adapter *pAdapter, u8 bStart)
 void Hal_SetOFDMContinuousTx(struct adapter *pAdapter, u8 bStart)
 {
 	if (bStart) {
-		RT_TRACE(_module_mp_, _drv_info_, ("SetOFDMContinuousTx: test start\n"));
 		/*  1. if OFDM block on? */
 		if (!read_bbreg(pAdapter, rFPGA0_RFMOD, bOFDMEn))
 			write_bbreg(pAdapter, rFPGA0_RFMOD, bOFDMEn, bEnable);/* set OFDM block on */
@@ -802,7 +771,6 @@ void Hal_SetOFDMContinuousTx(struct adapter *pAdapter, u8 bStart)
 		write_bbreg(pAdapter, rFPGA0_XB_HSSIParameter1, bMaskDWord, 0x01000500);
 
 	} else {
-		RT_TRACE(_module_mp_, _drv_info_, ("SetOFDMContinuousTx: test stop\n"));
 		write_bbreg(pAdapter, rOFDM1_LSTF, bOFDMContinueTx, bDisable);
 		write_bbreg(pAdapter, rOFDM1_LSTF, bOFDMSingleCarrier, bDisable);
 		write_bbreg(pAdapter, rOFDM1_LSTF, bOFDMSingleTone, bDisable);
@@ -823,9 +791,6 @@ void Hal_SetOFDMContinuousTx(struct adapter *pAdapter, u8 bStart)
 
 void Hal_SetContinuousTx(struct adapter *pAdapter, u8 bStart)
 {
-	RT_TRACE(_module_mp_, _drv_info_,
-		 ("SetContinuousTx: rate:%d\n", pAdapter->mppriv.rateidx));
-
 	pAdapter->mppriv.MptCtx.bStartContTx = bStart;
 	if (pAdapter->mppriv.rateidx <= MPT_RATE_11M)
 		Hal_SetCCKContinuousTx(pAdapter, bStart);
-- 
2.31.1

