Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E13386557
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727064; cv=none; b=Wg3nuGCpTtejxeC1DrgmNLz14RJFrv1bO6rmD1aymBGRjwCCZVEu0ePFVNvbljjYWUhpieIpHchE43WosSOBY91QkO304sNpQ7c6UPygzye5S0lWGexV3vS+oOAXkyo/KvjbkUUCtt5qvLnKAy+mddOqGbygTCEp0vgNHFDp6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727064; c=relaxed/simple;
	bh=eG4l1JN/xYnbtnAO52zcFul5ooOssu3F6sW5FYwPjoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAtX9UQTIB0xC+O2ptxUi95iHBm+PWGDYEbeLeRklFWOAoHZS4ZexGNMd8GC8MQ81GkkTiMx9QYCa0352JxRZlAYpdqzOA6+LYbxSF0A1Bo8qclcgFsuG1tkeSPYOb5QBZHq/vnqqbWYItBACyqF2Jfq3Evr4VEy+odniYbT/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=NoZEcNw2; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="NoZEcNw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779727054; x=1780331854; i=artur.ugnivenko@gmx.de;
	bh=LUVYtbXkFCEHjXtz1Mwgwkse5/zPLs87aecnNDE+WMM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NoZEcNw2cTTMyr4UXG33yyJo3n9IwMMZR/oAyAFEaLWB/V9tXTHKdF1U9xSh+NAZ
	 S/4YUdcdZQlmRQ4uMM6hSztym6vh0XgR7b4NKA06/GnDIdwc1DsM+RE4V0eM7JjyW
	 EMLIHisFP4nGGeP257RfTy/PVsNZAVFMDQ49DBTvRlpa0NmrHYQuuF81sDpXgYxdM
	 oK2gCIbWu6GHf321oMKPOrM1RaQx/lYgpcwLH8aFQZprmawCDzMomptmUfcycAGVy
	 hWVwjrIjydY+s0v2z27wAyt5wq1dWEvfR9SXObut1G/8mh6AL5dxpymDP2vbjZuU7
	 EKFjNVkep2VcwpEIIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Mj-1x1i8b13ER-00psZg; Mon, 25
 May 2026 18:37:34 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v8 1/3] staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
Date: Mon, 25 May 2026 18:35:30 +0200
Message-ID: <20260525163532.20317-2-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525163532.20317-1-artur.ugnivenko@gmx.de>
References: <20260525163532.20317-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YSdsdux6NIycwRc0AQWuSx/iSShRP8H1oDL+Sjxl9exteFqBCvL
 awIgm2wYVDQClV57N/vWxwAIvxTWZes5LyYcu4jidlpbNMULHRYnpP2NY2tGqTkkng7cUXo
 URioBS7YhACbauy2tVdeHKawd+5qmpgZkfRg2iDHnC3CRBcTv8n+F9JJ7UcMXndqKF0d1B7
 Z6X1R9KeuOYv05GdFF7Zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PsLHZWiyqm0=;d83Zx0ylER/gSsshyMKspinLRro
 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

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix checkpatch warnings on lines above 100 chars in length by splitting
long function calls and long comments into multiple lines.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
Changes in v8: No changes in this patch.
Changes in v7: Add changelog.
Changes in v6: Make the patch apply to gregkh/staging-testing.
Changes in v5: No changes in this patch.
Changes in v4: No changes in this patch.
Changes in v3: Split the patch into multiple patches.
Changes in v2: Make the patch apply to gregkh/staging-testing.

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 52 ++++++++++++++++----
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index ed9b8fb07fec..43f9c45967f4 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -27,7 +27,11 @@ static u8 CardEnable(struct adapter *padapter)
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
@@ -104,7 +108,11 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
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
@@ -781,7 +789,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
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
@@ -812,7 +824,11 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
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
@@ -841,7 +857,11 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
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
@@ -853,7 +873,10 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
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
@@ -862,10 +885,13 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
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
@@ -1063,8 +1089,14 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *p=
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
+		 * for the power consumption issue, wifi ko module is loaded during boo=
ting,
+		 * but wifi GUI is off
+		 */
+		CardDisableRTL8723BSdio(padapter);
 	}
=20
 	return _SUCCESS;
=2D-=20
2.54.0

