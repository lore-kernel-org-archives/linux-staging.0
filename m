Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9A240586C
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107155; cv=none; b=Yj/S9Vz0PmwKgBr5j2JbZ9Y5iofkERvfUBRzbo8Cl9kNF4QlBiSAii8thOmVP6A0P2QSjBQkMieqcDRb/iWwW4Z1WLT/BH48hVsIWo49dkeCWsE/+DyL8EkSUACU7S2qxnXlWi9xwznVN8bkQOIi0fqx6I7k7EzIQjWSJx8LSXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107155; c=relaxed/simple;
	bh=5WYWLVYEy1Sj+8iYNsYJvk9qDWKXor/lDcWCdCrsy9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIayH8rGIoZLq3AW7IaA/OzxMTPqttn7MP47b+S9ccLIqxpl5uN1aGN7xgEjViY1VN6Uy09zqZUR0BuVj2DncRbAPARN2f/QEdpsr5jkwayYhWpAJGlSJoeX/Nk/1pxSC8PN4U5jdjr6fCas4GKx66rg+Xidz0slICkbRlAMoUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=EpKGYPTW; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="EpKGYPTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779107144; x=1779711944; i=artur.ugnivenko@gmx.de;
	bh=PG3PBSvic4qIKT8PMMal7GvSrNsyOSplc4WDDbIlhWc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EpKGYPTWk6CbETi2ygCUiotEgpZzrSGZICWyTrtVOPpyJ8bCimPbj+NY+KXAJjsz
	 KYc4AMYykZoaL2CSTCsHLdI29bDUC7W1fn7sOfsCfu5sWF7xxDv6OLfhXI/fvwXXn
	 KJ5lQDsMEzu7ZtQwV0ub/ph0yflxeK6d+7oRDfl6fTvaK4AoiU92CVfS8R45xExH/
	 lCixLKzjpRQ8ZrEKQi0pH1sPmdBsZrqwkOe+UAAIGKDdYPyi2bGtluOPf8GSTT/0y
	 v+u0w9JqoD711VDlI0UNoTtFyOn6Tv+p12m7J5anlJjpH1m8NyITfR6K2TM0TkgYw
	 q8UrjzhPN7o9IllReg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQkE-1xKN5M0EyG-013za4; Mon, 18
 May 2026 14:25:44 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 1/4] staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
Date: Mon, 18 May 2026 14:25:40 +0200
Message-ID: <20260518122543.15266-2-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518122543.15266-1-artur.ugnivenko@gmx.de>
References: <agr09UHduXJKU_bB@stanley.mountain>
 <20260518122543.15266-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:laEk4FYq1lkkAD96nIX7Onj1BlDAK547hkIaONrBeoJZJAXwBZm
 HWW9IW3pij1fs4U6CLC1IywCRzeLTXPiIUOHtXZZdF4I+Luurs9GmJDc7HUnJhJkPInikfm
 9Z9naOg9N8fji6uQsXqpM5uNKGDI/1cQ3HmXdGcZhJ/lgBcClQy259N4GfHrOBJI7P8DSMQ
 zYH1NcgjKswlMQKwqei8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jMQ2AE4S6ck=;3y1M8WlG4y4ebiA+dHFdPz6WoYI
 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
 SiKYwrZ0DZUMKGlWF8Kh6z2FXVbKQVVn/B14=

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

