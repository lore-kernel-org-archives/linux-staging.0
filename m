Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087D3BFE4D
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362644; cv=none; b=YaFuntXYFgNvsDS+OlFJZFhCpQ3mnK4nMYcGn6NnRvkB2o+KsE7Sly56F+iVy0b3ejSGLKNshsfkc/BmeMHz14RIj2rkIfvcqRe2mKTRESKthKjYwylpkfuDQ+p6YxW3S/eGGPvb8VZ4HfZW5HI7auy8ol/RLiTmpa0QuRM3gvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362644; c=relaxed/simple;
	bh=5WYWLVYEy1Sj+8iYNsYJvk9qDWKXor/lDcWCdCrsy9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODbw/sz81do52Zgx3rXdq0B5HqpC1s4ZYEDl1XrXBBor0LAuCMhQFtI86pokxcR2zBLTNU0go0kZHNed0rQwms3PMW0JNhEpiQOMcOSCm/E3xKEzWZ6f4frDhmn64eZExa4ce6DKgT1q8ny3wnwWvfJn42Fpdb8Gj2K74EZRgyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=nmIEhWB7; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="nmIEhWB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779362637; x=1779967437; i=artur.ugnivenko@gmx.de;
	bh=PG3PBSvic4qIKT8PMMal7GvSrNsyOSplc4WDDbIlhWc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nmIEhWB7agBrUqUHA0sw8mlCvlFu1KDevCg8gmQxZ8swctjU7c3XOwKSrQUQVJ/9
	 0xSxkKQiQ5jM7iiB6oVJth6RCtOb2+OjWF/jKESrt8hYvzM67bYSfzHUhJw7cCcmd
	 PKxfFRjl5D5/qtROlaAgGykLNI7ub3W1wXEJc6GoJFAG1He6muUDRTCzNEruqfj0k
	 kdKqoX321VNtsMX6zvCi2XNfGzI1eiGEIsSols4BFFpE/DI1Bis6Mjr6x/w0uGfqN
	 orT60yN07xmUUTUW6Bhj5TaafsP5vRqZfNQm8FAlCRyobmpkNiF3gvsTjqpImp3nJ
	 mur4vz64K7MLL4SAWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1wnYdq3C9a-00LEKz; Thu, 21
 May 2026 13:23:56 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v5 1/4] staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
Date: Thu, 21 May 2026 13:23:42 +0200
Message-ID: <20260521112345.16604-2-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
References: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XkbYio1k24ctbFslUI2cHdLRHcPQdwj+ugBre3Z/y/MWa/kxSa6
 UHZxkqKba/ZVe+8HIJKXb33zvtff9oz4e97e+zC4J+TfbqfT/6K4dRhpqKkUPtIkN5VAkFK
 7wHjWDfsjqIDKICu80xizsDFf1XP7JW4DIU5VmC22PisKu76vAwqvpjzbNNHWRxXun9u6+2
 ET7nDaWgqEnne8uMSOXXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+Tzz7gHYGas=;4mv5th8e6/d0ZnGyby1TJVitL7I
 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
 FQzqICmLYt2noUYNrK5tTEroIDCjSWRUY2UUX1k

Fix checkpatch warnings on lines above 100 chars in length by splitting
long function calls and long comments into multiple lines.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 52 ++++++++++++++++----
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 1e0498268aee..dd2736fb5c04 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -28,7 +28,11 @@ static u8 CardEnable(struct adapter *padapter)
 		/*  unlock ISO/CLK/Power control register */
 		rtw_write8(padapter, REG_RSV_CTRL, 0x0);
=20
-		ret =3D HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK,=
 PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
+		ret =3D HalPwrSeqCmdParsing(padapter,
+					  PWR_CUT_ALL_MSK,
+					  PWR_FAB_ALL_MSK,
+					  PWR_INTF_SDIO_MSK,
+					  rtl8723B_card_enable_flow);
 		if (ret =3D=3D _SUCCESS) {
 			bMacPwrCtrlOn =3D true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -105,7 +109,11 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 }
=20
 /* Tx Page FIFO threshold */
-static void _init_available_page_threshold(struct adapter *padapter, u8 n=
umHQ, u8 numNQ, u8 numLQ, u8 numPubQ)
+static void _init_available_page_threshold(struct adapter *padapter,
+					   u8 numHQ,
+					   u8 numNQ,
+					   u8 numLQ,
+					   u8 numPubQ)
 {
 	u16 HQ_threshold, NQ_threshold, LQ_threshold;
=20
@@ -794,7 +802,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 			restore_iqk_rst =3D pwrpriv->bips_processing;
 			b2Ant =3D pHalData->EEPROMBluetoothAntNum =3D=3D Ant_x2;
-			PHY_IQCalibrate_8723B(padapter, false, restore_iqk_rst, b2Ant, pHalDat=
a->ant_path);
+			PHY_IQCalibrate_8723B(padapter,
+					      false,
+					      restore_iqk_rst,
+					      b2Ant,
+					      pHalData->ant_path);
 			pHalData->odmpriv.RFCalibrateInfo.bIQKInitialized =3D true;
=20
 			hal_btcoex_IQKNotify(padapter, false);
@@ -825,7 +837,11 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
adapter)
 	u8 bMacPwrCtrlOn;
=20
 	/*  Run LPS WL RFOFF flow */
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF=
_SDIO_MSK, rtl8723B_enter_lps_flow);
+	HalPwrSeqCmdParsing(padapter,
+			    PWR_CUT_ALL_MSK,
+			    PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK,
+			    rtl8723B_enter_lps_flow);
=20
 	/*	=3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */
=20
@@ -854,7 +870,11 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
adapter)
=20
 	bMacPwrCtrlOn =3D false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
-	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF=
_SDIO_MSK, rtl8723B_card_disable_flow);
+	HalPwrSeqCmdParsing(padapter,
+			    PWR_CUT_ALL_MSK,
+			    PWR_FAB_ALL_MSK,
+			    PWR_INTF_SDIO_MSK,
+			    rtl8723B_card_disable_flow);
 }
=20
 u32 rtl8723bs_hal_deinit(struct adapter *padapter)
@@ -866,7 +886,10 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				u8 val8 =3D 0;
=20
 				rtl8723b_set_FwPwrModeInIPS_cmd(padapter, 0x3);
-				/* poll 0x1cc to make sure H2C command already finished by FW; MAC_0x=
1cc =3D 0 means H2C done by FW. */
+				/*
+				 * poll 0x1cc to make sure H2C command already finished by FW;
+				 * MAC_0x1cc =3D 0 means H2C done by FW.
+				 */
 				do {
 					val8 =3D rtw_read8(padapter, REG_HMETFR);
 					cnt++;
@@ -875,10 +898,13 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				/* H2C done, enter 32k */
 				if (val8 =3D=3D 0) {
 					/* set rpwm to enter 32k */
-					val8 =3D rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
+					val8 =3D rtw_read8(padapter,
+							 SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
 					val8 +=3D 0x80;
 					val8 |=3D BIT(0);
-					rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
+					rtw_write8(padapter,
+						   SDIO_LOCAL_BASE | SDIO_REG_HRPWM1,
+						   val8);
 					adapter_to_pwrctl(padapter)->tog =3D (val8 + 0x80) & 0x80;
 					cnt =3D val8 =3D 0;
 					do {
@@ -1080,8 +1106,14 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *p=
adapter)
 	_ReadPROMContent(padapter);
=20
 	if (!padapter->hw_init_completed) {
-		rtw_write8(padapter, 0x67, 0x00); /*  for BT, Switch Ant control to BT =
*/
-		CardDisableRTL8723BSdio(padapter);/* for the power consumption issue,  =
wifi ko module is loaded during booting, but wifi GUI is off */
+		/*  for BT, Switch Ant control to BT */
+		rtw_write8(padapter, 0x67, 0x00);
+
+		/*
+		 * for the power consumption issue,  wifi ko module is loaded during bo=
oting,
+		 * but wifi GUI is off
+		 */
+		CardDisableRTL8723BSdio(padapter);
 	}
=20
 	return _SUCCESS;
=2D-=20
2.54.0

