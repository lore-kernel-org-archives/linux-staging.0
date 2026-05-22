Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2DA3A48E8
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456013; cv=none; b=s70oQmjg2BMvwaeUQNR7og4JQVIkIGrA6yvHCRwAxCM3RcjOSRL1RYp2PoG2C8svp3U3k+hEUHeU88Z/+m55r3RVfvCE5xxRPnMpfKMtZJCUXh9o8/fHfzsS6tccGxGmcLX34qhTYlEuic50MnhC17sNgwYyfs89DpASKbOWnE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456013; c=relaxed/simple;
	bh=1+AF6DARYwQfGsT1ki7skD5qE30yqg2xtl6v7ZyUdsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwtKzZO83u9fPAiuEfsqVcXAAZioY/+Mh5weMn52XkU70PufJ6MZb7fEbSOb0msNFIsWkvQH35s3WJfmwnJUNVd5y/ANlIGZQFZQFx+yFQa2M+6liru6M4Ha0dLztHUA7HSAg0S7UZJs2aPwU23SYX9N9zLWrLan4OI7NcFrH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=jE5Pa4HS; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="jE5Pa4HS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779456008; x=1780060808; i=artur.ugnivenko@gmx.de;
	bh=VL+JsbDvkSUVT5qOdRG3QMevH/0ScpD9WPCJ9co3tJU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jE5Pa4HSYCJeHPS/cTROXM8kjMBCsqsp7tXMJdmwuPZDR91x7rOB8heJaYHo4sYd
	 Ttb8PJ3SJQTwoCtrqT5iKJFZ1wkTZZdbgtOW3PNp4Y/smp+SVYTm8MogKeghjkLN/
	 BOQIOXqnEXIFwp463GEvPv5++pyL2nTJoquhpgVRncif1cCIm9tsEYGEn59+gx8I4
	 dF06TAXUIDv5v10I+WAU85SBRq3O/aHMoP0P4Bn76Gu5Z28pMOIBZxnLE87ooKbFZ
	 4py+v7HfKvxS0qATE/bBMTTq76uP1XmxU7k1T7MVHDz1IA5AAnpUM4eDOMIKvE+58
	 8dqyBxtWQAK84IxApg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIMfc-1wVw7Q1E8K-00CVtI; Fri, 22
 May 2026 15:20:08 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v7 1/3] staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
Date: Fri, 22 May 2026 15:19:59 +0200
Message-ID: <20260522132001.4771-2-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
References: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6R7SsmtTFMAe5SAvcDwRybcfeVfZgbdp0TAyzCzzXyo5HNyAPCB
 Y0FTjZ3W7g4wTc4H6UXHAb7/CGM7ibhVwACrOk9tRo750cRDCCT9VI09lUJ+n9t3uvNgoiX
 cR7NBQ5lqrJuLhjmmbCLczluUpmCtvSoVKbx9vWB/bLLE3Tq10E0Wmf/OjtWrv8uQGHhb1u
 HoB20/QWlUvLtQ3If3G4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1SRvwGZ7mbA=;w2PNxI2hLbQGduMiWDqlT/detaD
 +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
 NPcMFzDBigB+oDkyb/lcjCaXkiU=

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix checkpatch warnings on lines above 100 chars in length by splitting
long function calls and long comments into multiple lines.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
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

