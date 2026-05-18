Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E203F167A
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102756; cv=none; b=c7edjnvd0EbZR3yOx2bIIEADi5jwLCsk1lgiM+QP8Kd/Xfs2byV12UM0G/bqwxApYrcmVHMxbyKqMTfUyEcCVsza/YPxqrsCrx3poR//1dh4EW7zkeEiUnu68IJ5hhaFUl/9TVchQVwTmhSzz+QiE2okIyjgPw3ik1De3HL3tHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102756; c=relaxed/simple;
	bh=5WYWLVYEy1Sj+8iYNsYJvk9qDWKXor/lDcWCdCrsy9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsybokAtIHmY4LZtB9iloWHhyVVGYZgJarLGV+FACZMB6gk+RPidW+bKm9Joa188MHBjxT21UIBGlQr1GAAGOvM+TynZX4cVSOJ9cV5Z1Na6v32FDTyzQXMQEowbKlIHR/khxF8CXcyAfSiVscA/j2zNMUcrZiIxNhP3wNmV5j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=ODxPj7MC; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="ODxPj7MC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779102728; x=1779707528; i=artur.ugnivenko@gmx.de;
	bh=PG3PBSvic4qIKT8PMMal7GvSrNsyOSplc4WDDbIlhWc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ODxPj7MCWOvBP9/KdpnG1zKSSoyNpZMe42kFLojItvAGH73bNZb109Mr2IkzdRxU
	 Nv77dsBKRUO2r4nMoFb2PiALfF6Rh8ILaxbuV0ys8v5KH4zdtZRiY/jxkMWHaVYTo
	 iJNaa+JrSQW6RQj3sDbdHPkt3ot0YgQGyuWIZCCHD8GK8O/TQHyYbU+ZJ6SXHFbtU
	 n1r0uZzVWhwgPy28BrNw8McZ8j+3UWgew9aihbPXsnQCZCF1dPmB7F6Ji+JM8zr8U
	 yqKMpJb8pg9WV6u0DoIvYC4+1Gna3qQP/rtLFiJVQ9+mB8v/uY21LZnRxFRQxAkPX
	 Gx0py0WfsC0kJD0xhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMfW-1wdAz61xx6-0032q4; Mon, 18
 May 2026 13:12:08 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 1/4] staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
Date: Mon, 18 May 2026 13:12:04 +0200
Message-ID: <20260518111207.23143-2-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518111207.23143-1-artur.ugnivenko@gmx.de>
References: <agqlgeaakrF1wNIu@stanley.mountain>
 <20260518111207.23143-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a8FiYhX4F4okQcIVVfXSuouaJopvTpVGCK/CgfTRjo4h0o3UY4D
 hBhWaYxJC2sCA3viRHHfp2AtprfDPlGrLmL4MZLvaP5ViL074yPSipcqezoQNvCOYUA7G8E
 lJyMIfnlYt9InIrY2y+/FTq/PzRnuuyRIR1urWAKyuJT0AbYwaKMpNa0/0CgMQij9gufJHW
 pftUyUt0RcpGwr0/ZvFBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rf5r9NxSHf4=;PbIH+JrlzV1zp0rHylvGX0lNALw
 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
 vRv3w+tEynIm8DQ==

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

