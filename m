Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FC35E952
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116840; cv=none; b=Npwxttq4xDYJEOsKU5EYGfpme0HuGfH3c7eeIdSf/QxbWEx9oPbEh+ufOkk8XLiVn0g3QU3kZ4bLjroqEFhL2xWMFGORH55mgdLo5fLGTDXhLqz71jgriu4Zr6u1Mau4jaq74irJ6UDLEjxyZOEDTUl9FCOx1P78CW1ESFb97bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116840; c=relaxed/simple;
	bh=8iwOiBL4VlrTh16766kHGnfn8SfR3ucLOA2dC/ddRew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8iyiCRKjVSo2SYDnaRBLKOWQfCm/gCWSLgZsjkAFLvKyAc8RQosmDsXR3Z9dJyO1sJDcZvdsSokeHklnlJLJP2cSXgNut62LPYUHsoy1R/2ysXpZwP07KkvfTIWaqq3qf+/XZMMDzsP/Z+LZjEXTXI56Sby4g01TT4i85VizeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=kE6Y5caQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="kE6Y5caQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779116828; x=1779721628; i=artur.ugnivenko@gmx.de;
	bh=sF9z8ZY6RLOIcJlcy5UgtYxES24Ezs9yJQ/zvI83wnc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kE6Y5caQlsL6uDoJ6Xw4i7rPsUmxNSrrpZKsTULjuRJ/xOEzPiWH06h7oa+cznek
	 aDqI1XZoy4eCQR/jBHpNXcybSWgFvPJS3vJ5e8BOV3X8GKTf4XRlVumsqAdP8nXQK
	 iQI7YY/Br+7fFIB6KKqME8bSMSMvUaS5f7+mwFnw1M8fM46eiH8I4cBibfibZ2OCN
	 dWhpLANarlG7x52fOGrwHHxms52Y4kuQmQ7xtrznC45PixiHWMctFhhPJGJBamMzW
	 elEJ7icl1yaGDALBC++VPxwOvRjnsKOUKSXL54wewnygrfDyws//GppwBptomhBZ8
	 85ZduRBSwxl4pQ+sbg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlTC-1x7e380dKo-00ZgIj; Mon, 18
 May 2026 17:07:08 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 3/4] staging: rtl8723bs: remove excessive whitespace in hal/sdio_halinit.c
Date: Mon, 18 May 2026 17:07:06 +0200
Message-ID: <20260518150707.18868-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518122543.15266-1-artur.ugnivenko@gmx.de>
References: <20260518122543.15266-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kPkvQJra7tbIXWanbHFV6Od271o5BtEZhHmfWaV4p5QR3EdmHXV
 Je7pQ/UgGdkdT0RZET+bXDfaciDBbi8s6Z1ygKQcgupHvYPRiMTV7qbqp1+EOXD3PFvIa8b
 elC461HfUIprgypONyUlEGJnnL/9C0LQEY1b78kgAbBE1crnDCwqkPkWKAU8f8kmoYdYx2Z
 ERqVW8mP+nmqOx7sE4kyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8p0mBYLPePo=;8Xc9znJqoa8KhaOR1d5n/5LjOHP
 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

Fix checkpatch warnings on excessive empty lines after closing brackets,
after opening brackets and multiple empty lines at once.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 3756b8e3d8e9..e6570fa2e8fd 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -21,7 +21,6 @@ static u8 CardEnable(struct adapter *padapter)
 	u8 bMacPwrCtrlOn;
 	u8 ret =3D _FAIL;
=20
-
 	rtw_hal_get_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 	if (!bMacPwrCtrlOn) {
 		/*  RSV_CTRL 0x1C[7:0] =3D 0x00 */
@@ -235,7 +234,6 @@ static void _InitNormalChipOneOutEpPriority(struct ada=
pter *Adapter)
 	_InitNormalChipRegPriority(
 		Adapter, value, value, value, value, value, value
 	);
-
 }
=20
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
@@ -244,7 +242,6 @@ static void _InitNormalChipTwoOutEpPriority(struct ada=
pter *Adapter)
 	struct registry_priv *pregistrypriv =3D &Adapter->registrypriv;
 	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
=20
-
 	u16 valueHi =3D 0;
 	u16 valueLow =3D 0;
=20
@@ -283,7 +280,6 @@ static void _InitNormalChipTwoOutEpPriority(struct ada=
pter *Adapter)
 	}
=20
 	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
-
 }
=20
 static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
@@ -328,8 +324,6 @@ static void _InitQueuePriority(struct adapter *Adapter=
)
 	default:
 		break;
 	}
-
-
 }
=20
 static void _InitPageBoundary(struct adapter *padapter)
@@ -372,7 +366,6 @@ static void _InitWMACSetting(struct adapter *padapter)
 	struct hal_com_data *pHalData;
 	u16 value16;
=20
-
 	pHalData =3D GET_HAL_DATA(padapter);
=20
 	pHalData->ReceiveConfig =3D 0;
@@ -526,7 +519,6 @@ static void _InitOperationMode(struct adapter *padapte=
r)
 	}
=20
 	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
-
 }
=20
 static void _InitInterrupt(struct adapter *padapter)
@@ -569,7 +561,6 @@ static bool HalDetectPwrDownMode(struct adapter *Adapt=
er)
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
 	struct pwrctrl_priv *pwrctrlpriv =3D adapter_to_pwrctl(Adapter);
=20
-
 	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tm=
pvalue);
=20
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
@@ -613,7 +604,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		/* do polling cpwm */
 		start_time =3D jiffies;
 		do {
-
 			mdelay(1);
=20
 			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
@@ -744,7 +734,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/*  set 0x0 to 0xFF by tynli. Default enable HW SEQ NUM. */
 	rtw_write8(padapter, REG_HWSEQ_CTRL, 0xFF);
=20
-
 	/*  */
 	/*  Configure SDIO TxRx Control to enable Rx DMA timer masking. */
 	/*  2010.02.24. */
@@ -753,7 +742,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
=20
 	_RfPowerSave(padapter);
=20
-
 	rtl8723b_InitHalDm(padapter);
=20
 	/*  */
@@ -916,7 +904,6 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				}
=20
 				adapter_to_pwrctl(padapter)->pre_ips_type =3D 0;
-
 			} else {
 				CardDisableRTL8723BSdio(padapter);
=20
@@ -935,7 +922,6 @@ void rtl8723bs_init_default_value(struct adapter *pada=
pter)
 {
 	struct hal_com_data *pHalData;
=20
-
 	pHalData =3D GET_HAL_DATA(padapter);
=20
 	rtl8723b_init_default_value(padapter);
@@ -951,7 +937,6 @@ void rtl8723bs_interface_configure(struct adapter *pad=
apter)
 	struct registry_priv *pregistrypriv =3D &padapter->registrypriv;
 	bool bWiFiConfig =3D pregistrypriv->wifi_spec;
=20
-
 	pdvobjpriv->RtOutPipe[0] =3D WLAN_TX_HIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[1] =3D WLAN_TX_MIQ_DEVICE_ID;
 	pdvobjpriv->RtOutPipe[2] =3D WLAN_TX_LOQ_DEVICE_ID;
@@ -1003,7 +988,6 @@ static void _ReadRFType(struct adapter *Adapter)
 	pHalData->rf_chip =3D RF_6052;
 }
=20
-
 static void Hal_EfuseParseMACAddr_8723BS(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
@@ -1098,7 +1082,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *pa=
dapter)
 	if (!padapter->hw_init_completed)
 		_InitPowerOn_8723BS(padapter);
=20
-
 	val8 =3D rtw_read8(padapter, 0x4e);
 	val8 |=3D BIT(6);
 	rtw_write8(padapter, 0x4e, val8);
=2D-=20
2.54.0

