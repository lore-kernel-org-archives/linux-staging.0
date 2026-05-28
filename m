Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B833F9298
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988134; cv=none; b=J6tA+zGjKxqcIynUW/6ASDhfqVj3Pc0gTkmAAXZe8sPpB67D+2OpghTuEAUcAaSbiV6ATzUd7aX0x38lv2YuWVI9EXsLjIqP49WEQ79OS0AqoDSfX692N4jdOWYva0h8YiZM/vV1cGoEEP0T1k01htDR+DoWnmGXEyy2abESZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988134; c=relaxed/simple;
	bh=X0rLQM4cAKLreV5zDIVNx6Zr0lh3Ji9SWNuEdgQ6qR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aDxIJP3qqHhNdS3HQjItLwJfmq2mt9CTpWuXgWGc7Ttjerxa1V6uw0r8J1qePUuamRCbYNF9Ocmis4Ga4eO+KcotjsjqORkaGRV7rfxkOOV/5dPOjESsSgZvU1e/2jFK/sEbWwyBhIvkChK10WnvBoFYYx0R/PnDpHMmSpxXj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=EqcU2sAA; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="EqcU2sAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779988127; x=1780592927; i=artur.ugnivenko@gmx.de;
	bh=jncgJ9PWmf3XLP6u805unRD7AtcYLvkAh4avsFl2BQE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EqcU2sAAxNlxsC/dHYa+CuiRoebi8vWk3KqZkkJUqBTibECsCEJFVSrD/7SALXsl
	 nzjsge7KsHooJdDTCoDJyt99hHmyR5MUvxn63BcM5Xku/qSSIAAs6iKAsJ4GPrSH6
	 Fi15nfmDC/ZF12/gfX9emfKaNhJOX6sQP8D/FtNh0JUjzaN7f0px6Y4q0l5xc2k3m
	 F5Uq0VYHrsi+gyXsZDkfUJph+zRHExPmQvRXxwNlHObrobFrU5t/xuo2akxLj9esH
	 98BgHqSuyZ02QqSExCyF0lBm3eQyNQJM4/dqp79PTS7ezFd9276LpNBqmOvH46SWn
	 Fke5LhTHxHNyPUYzyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDNl-1x63iC0l4B-00lAUi; Thu, 28
 May 2026 19:08:47 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: ahmet@sezginduran.net,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v9 1/3] staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
Date: Thu, 28 May 2026 19:06:43 +0200
Message-ID: <20260528170645.30861-2-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
References: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ylJhXNZMChs2qxT+RSL9b+CQ007DdXSAP0dmWx6yiO9ja5c95yo
 WwVQnqnWlK5u7/q3sd0JNTwDTvgCBqKLllrqI3qOacuiJnhfwbKC5rOBOsEZTnVln4qTufc
 2wpZLeglVysM50zKl7MaxUlUx4N+ltDXufQaXhkjP3ThwVL5VdiYF3vhvk/pci9sZNaG92M
 LoBRpHWbZSz4AEXSvTqFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OCz57HEELYg=;xj/yGrQRwBtlPnkL1pPkFTDOaR1
 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

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix checkpatch warnings on lines above 100 chars in length by splitting
long function calls and long comments into multiple lines.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
Changes in v9: No changes in this patch.
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

