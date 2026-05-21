Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DA53D9DB6
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371406; cv=none; b=EtssqpdKtmCNkdhG1/ltNv6ZQ7SVr1bvIuoOj/Zt/HpICJf0oTAfixuKm5tfeAE2fSICJmwo6dQuVGvh5GS0dVLKpUJJPSTHvOcwi9RfIrWIsQOkByXSVnsFmdf2dSUdUtt4P12B6KadlQeAlFPObDtMtJmUZHJGz1FjuZxQiMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371406; c=relaxed/simple;
	bh=utDFnUCccVTfs60Pmizxlt+xGoS8tRB7u4lqasputwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pe8p//Y3Q0wwg6Bl52T2mPU+DYS8DlPuIPuOgSsJgNiKuC8PWZY/IglIX0Obc/UibJZV3nCaSS9ypJ2z90Wphjsq1OSomm0Xodt++4Gw3iFYvqx93/Rm2gbrDSsvGg3oNBjtP7X/1Gcf+Q1xYhngJWwCDbiRBeYJqPq+5Y1O6MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=qngFiaXJ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="qngFiaXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779371398; x=1779976198; i=artur.ugnivenko@gmx.de;
	bh=4sPfd/rEzr3T0I2myeTWY/KNjp84jvd/qrpWQbqAU/A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qngFiaXJukPQLhhBNdWalkflBlWDvtm27otZogXTJiu2OyQ+QfD3V2ehvJcZVfn3
	 fb2fzjmRoecSOKQad8HP8k9dUF1D2wSNGspeOZk2k+G1QZff6DYdOohdguolvCW7M
	 6CHTnLoDb/NS+BBnBVYqx4h0heXubYCfztzFcffvbtCYqjxy5wjiItE49Ap86Pl4G
	 Bdf/HUomgd2cgvv57c9ADcA+3P585bMxBr6aOQuaZ3ClgE4qYZ25qmzw+8zlcQfd7
	 LEchLVIWi/ITpsKEjdlKrBw7Nzj2rsYnEIjzZ8Y66Yw2qjVZx1H9ogtWbpeC96GHF
	 ByQgeoVhRolds/aVzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzyP-1wvG4Q46u7-00gp0v; Thu, 21
 May 2026 15:49:58 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v6 1/4] staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
Date: Thu, 21 May 2026 15:47:53 +0200
Message-ID: <20260521134756.24546-2-artur.ugnivenko@gmx.de>
In-Reply-To: <20260521134756.24546-1-artur.ugnivenko@gmx.de>
References: <20260521134756.24546-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jf6hmh06SwKPFsXWmSmKnL9HTvcrVrV0Q9iUkH1nez9HUsQJQON
 0hk0u2okf5hfaUOtnzQAwYdSRYFaF8UT4Y/+OYUbWA6QrxmoX8S5z/BsRnTxTWSecuR6wzb
 1LsskmUnu/N8J7mcR710NMgaI7l3YqWbiioc0QRgdCfElehKBrlvrAuq66vZMM7zBZRIvQs
 /7geHuQs0tyxGOn0D7wZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D8tiyG/GRCY=;XmE1ez79kAPNFugz5xiQ59gMs4v
 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
 DIHIyrE0Pr/fSvzxLk=

Fix checkpatch warnings on lines above 100 chars in length by splitting
long function calls and long comments into multiple lines.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 52 ++++++++++++++++----
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 1e0498268aee..5663f97f865c 100644
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
+		 * for the power consumption issue,  wifi ko module is
+		 * loaded during booting, but wifi GUI is off
+		 */
+		CardDisableRTL8723BSdio(padapter);
 	}
=20
 	return _SUCCESS;
=2D-=20
2.54.0

