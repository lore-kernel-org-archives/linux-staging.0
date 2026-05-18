Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC0324B33
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102748; cv=none; b=OkUF8I1+r+pvAa373wYJu9AWPiNQ6A1T++DCeAB01Q/CFL0J1z3h0DxjuiFMLf1Irl2I4dxOhnjDw30TtrcNST8nRoVM0uX1Tqk3Vi8GbE3V01LKyf52bYml+TXeAoLWHFdaIYjZICzdsbdO0oqKjfPed2AJTdc10sZ8h7gR+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102748; c=relaxed/simple;
	bh=8iwOiBL4VlrTh16766kHGnfn8SfR3ucLOA2dC/ddRew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0LWd0UwK94s22JNBR4VnvqCx+uVYChDKPOzYQ6W1OYEa8QRqnj/NVb1C4iYI3azRWn6xo8OlTUhtwiU+sIpFRIL1ZqilLAWSjZScLLwhVo5gs6UrD/jrtdCjzmBdmaSObA+jkwLOOcLRUXRauMsOpD5MmakwQvAYb1ETBaoZBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=MkGlI2oE; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="MkGlI2oE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779102729; x=1779707529; i=artur.ugnivenko@gmx.de;
	bh=sF9z8ZY6RLOIcJlcy5UgtYxES24Ezs9yJQ/zvI83wnc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MkGlI2oEyuvzgM0b094ZYzRbM0BX9ozXxpfxFEM6pGb1Uw0h13EzwELo8EuXFc8z
	 4BNiZTcz8O4l1qaSYrvdA3Oup6jCmmFn5rz2ey+/5Tw3Itm+oIceXccoGIe0Uqwo0
	 JrXFbhYyZFQilAXEa++uKvQMJxap0Q32x68LHsvg4UP+vUb8pWc1pdLmzCrhcGIfQ
	 MNzjxaqXNjN7VCUir55kIjaYi1gbjs/G+xfEQmnzw3z8lnGL5iji/QaR1l9qzhnC2
	 DghvCJjSK4Sz5mS8BphXtaO03BnpvyZPBqYR9esHwdhJB2/+ygS+xUqUBtjtbpjLa
	 39yCSzMiV5VDChLDUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mirna-1x3TJM3rSG-00lDIK; Mon, 18
 May 2026 13:12:09 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 3/4] staging: rtl8723bs: remove excessive whitespace in hal/sdio_halinit.c
Date: Mon, 18 May 2026 13:12:06 +0200
Message-ID: <20260518111207.23143-4-artur.ugnivenko@gmx.de>
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
X-Provags-ID: V03:K1:wn1sdF0muHNq4V8k9yFd+yWtuLWzeDgjg2XFT9WkkSVEEUvD1QT
 qiPGiM3d4gCruamUTqNR4CAGRudofaXOUyVi7Lju9R/hWEyYRtLB7Azl3sZteEW8bO5E/Qb
 Nwp8dtwkdBRsZmmCFIbvw3BPGwleFEMcb9rce8gFVJjD91o0tyvHcPa65IPTKHAOj/vzfDN
 fqGUOsP5DzDuXFtFj0J7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ljGGULeaZlA=;j4ngOjSrGOZ+rjbq89V5IUmFgkr
 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
 1TL1qQ==

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

