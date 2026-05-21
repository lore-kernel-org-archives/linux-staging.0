Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754638B131
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362666; cv=none; b=cgQwHHz9K9lgNj6P8tnWLi7Gf2QayQkYaL64Ne/4xPW+cAIeulPKHbyq1GFYW2baASOT3dAoBsWCju0TYgnRk3K+7r3z0BuVQcRAsQz2us5s1NnQUoNmWDn51lWSeIt7La4aUzI5nfkCH4MI+yuHiBJaVmDYN5QvbLqa3ZpijYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362666; c=relaxed/simple;
	bh=8iwOiBL4VlrTh16766kHGnfn8SfR3ucLOA2dC/ddRew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7OXMbQ7NAYSFXGoZ72fMPc5RMuX+Yp9skCsQ8XEbWMwXxkaC7f3mkRHWgZhsScRynxtQGmYOW3sbUHfmRLM6N/Mtr+HzPhghEIGSeXOAOhIvvD1hBjPeHD2utbguUbr+OUaH9V7WJyE2a0hYdpuQeZEdPzBcCBc0TcaSTaqnwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=Oox+9OQ2; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="Oox+9OQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779362658; x=1779967458; i=artur.ugnivenko@gmx.de;
	bh=sF9z8ZY6RLOIcJlcy5UgtYxES24Ezs9yJQ/zvI83wnc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Oox+9OQ2nLntGMup8bn+LiuEyLp7MYsTUKWBJ5sALAY9MtOEHCJAaRIzr4yBjlhx
	 qUIiV96U5WgJw+UQxv01QxK8zryLSkRnEEfFp4a5VgAFhZB8q2xWtaB7Jk3pQ3pM2
	 dZKX1O+/SCsfivAtQoYrQiIs2ZZs0AgPO3VrPl0IBtb5aggMTNqvAPPgJE5Tv6C2Y
	 VaxEoy9vJO6MIlTuuBcVspjJXX/9qlYp9KABqpxvNcikY/55ZU38d6+ePVla2M/eS
	 JhIBv+siMdmBVKmeD8LuMhw9IrJvwN9KNB32X5cVzdpTcPhnAxwsUJe4kmvAnFlI5
	 aqT8xv5wg/cG4GqDsw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbRm-1wZLhs0Uz0-006ydu; Thu, 21
 May 2026 13:24:18 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v5 3/4] staging: rtl8723bs: remove excessive whitespace in hal/sdio_halinit.c
Date: Thu, 21 May 2026 13:23:44 +0200
Message-ID: <20260521112345.16604-4-artur.ugnivenko@gmx.de>
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
X-Provags-ID: V03:K1:IEXRcoITDO8jtU1/5xxEqo+uqA9kRVjWACK+UyFDMsHu/QeIZLU
 8FDMKU3uXmL2QjS/80mAzQnlxk5sZnjdNAxlUy1C7bZVeFB2zrVqgIUxOUz3Ct/9D6G3pnY
 dlofaqc4J4g9Z+A4GpjLmL5tOs6EeFYckqCymy/HHa6IFgOnyEUcOdtgaZDiBrbG3VmDMAB
 M5AZLisba9szED2E3wdwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3aKRaa4/IrY=;Y5FWV9CMNIPHU1Dulh2OvZMXoPK
 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
 KiVST5i9bZxJVYp+pI=

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

