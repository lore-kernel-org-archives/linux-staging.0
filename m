Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986E023AB88
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775393527; cv=none; b=dsXgy3k/BuatbpmmFi2zIB0MAO0kH57MkJP9N3lw8Lbbytu53ogctHiMDdku921E7WNoLGCRT8wX2qrioQ7qch3OWayX3cF/+OyoS5bnLMFE9lHo7uQrYZxdhJSB+QN4dcMr6vZ+JI4JQ4IF9blcmpNc53h+lOSnTz+XFbO5cgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775393527; c=relaxed/simple;
	bh=IDN5nn71QPGJYXFnv4aV/yZXnUY6loF8IQa17Lz61Q8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sFfo+3UAY4VkxDl08N9b+j6iTLNfbWKU8p5AYbEFjN/ZPiWdfhW/Tga3mryXDU/WdyZ7iVntcgFdnOdK6mfXqTW9vkL4aw5rrrw+GAWQ0keE3Aoz+rFHQeeHMxHdPQCR2u4PEnDWk4sHaVgecv7PJb6Fkz14mhObdkSwp1k39uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WoqErsmt; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WoqErsmt"
Date: Sun, 05 Apr 2026 14:51:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775393512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfzvaaJeB4oJdrwLmCgdtIvJBN9ifNKfUkMX0vMKvTA=;
	b=WoqErsmtd2ddw72QDaja29+f9Zh5b7u/t9IlO4HrT7oGGp0yMk3J6FP+TOUwExZE4TKi8Z
	nVdbgemtW4a8/F/BbS3D3y9UVxsrEHb1Cxbzw4rL+dT37gzIaTixEdZVHCPES3q4Waqy6b
	a88A8uI+XB1QlfkX710zrUQD/mCJE3k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Prithvi Tambewagh <activprithvi@gmail.com>, gregkh@linuxfoundation.org,
 abrahamadekunle50@gmail.com, b9788213@gmail.com, straube.linux@gmail.com,
 ethantidmore06@gmail.com, andriy.shevchenko@linux.intel.com,
 dan.carpenter@linaro.org, weibu@redadmin.org, knavaneeth786@gmail.com,
 ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFT_PATCH_v3_1/5=5D_staging=3A_rtl8723bs=3A_mov?=
 =?US-ASCII?Q?e_constant_to_right_side_of_test_in_comparison?=
In-Reply-To: <20260405114132.310774-2-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com> <20260405114132.310774-2-activprithvi@gmail.com>
Message-ID: <F31C7F72-D267-450E-81FA-DAA3F14FDEE9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 5, 2026 1:41:28 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gmai=
l=2Ecom> wrote:
>Move constant from the left side to the right side of the test in a
>comparison, where =3D=3D, !=3D, <=3D, >=3D, <, > operators are used, fixi=
ng the
>checkpatch warning: Comparisons should place the constant on the right
>side of the test=2E
>
>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail=2Ecom>
>---
> =2E=2E=2E/staging/rtl8723bs/hal/HalBtc8723b2Ant=2Ec    |  4 ++--
> drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec |  2 +-
> drivers/staging/rtl8723bs/hal/hal_com=2Ec        |  2 +-
> drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec |  4 ++--
> =2E=2E=2E/staging/rtl8723bs/hal/rtl8723b_hal_init=2Ec  | 18 +++++++++---=
------
> drivers/staging/rtl8723bs/hal/rtl8723bs_xmit=2Ec |  2 +-
> drivers/staging/rtl8723bs/include/ieee80211=2Eh  |  4 ++--
> 7 files changed, 18 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant=2Ec b/drivers/=
staging/rtl8723bs/hal/HalBtc8723b2Ant=2Ec
>index d32dbf94858f=2E=2E58f6cf063498 100644
>--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant=2Ec
>@@ -2211,7 +2211,7 @@ static void halbtc8723b2ant_RunCoexistMechanism(str=
uct btc_coexist *pBtCoexist)
> 	}
>=20
> 	algorithm =3D halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
>-	if (pCoexSta->bC2hBtInquiryPage && (BT_8723B_2ANT_COEX_ALGO_PANHS !=3D =
algorithm)) {
>+	if (pCoexSta->bC2hBtInquiryPage && (algorithm !=3D BT_8723B_2ANT_COEX_A=
LGO_PANHS)) {
> 		halbtc8723b2ant_ActionBtInquiry(pBtCoexist);
> 		return;
> 	} else {
>@@ -2490,7 +2490,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
> 		return;
> 	}
>=20
>-	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW !=3D rspSource) {
>+	if (rspSource !=3D BT_INFO_SRC_8723B_2ANT_WIFI_FW) {
> 		pCoexSta->btRetryCnt =3D pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [=
3:0] */
>=20
> 		pCoexSta->btRssi =3D pCoexSta->btInfoC2h[rspSource][3] * 2 + 10;
>diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec b/drivers/s=
taging/rtl8723bs/hal/HalPhyRf_8723B=2Ec
>index 9df3274c1048=2E=2E9e7eebfc02a9 100644
>--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec
>@@ -313,7 +313,7 @@ static void GetDeltaSwingTable_8723B(
> 	u16 rate =3D *(pDM_Odm->pForcedDataRate);
> 	u8 channel =3D pHalData->CurrentChannel;
>=20
>-	if (1 <=3D channel && channel <=3D 14) {
>+	if (channel >=3D 1 && channel <=3D 14) {
> 		if (IS_CCK_RATE(rate)) {
> 			*TemperatureUP_A   =3D pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P;
> 			*TemperatureDOWN_A =3D pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N;
>diff --git a/drivers/staging/rtl8723bs/hal/hal_com=2Ec b/drivers/staging/=
rtl8723bs/hal/hal_com=2Ec
>index 31b3e880ae6a=2E=2E597ba3d283c1 100644
>--- a/drivers/staging/rtl8723bs/hal/hal_com=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/hal_com=2Ec
>@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
> 	pHalData->bDisableSWChannelPlan =3D false;
> 	chnlPlan =3D def_channel_plan;
>=20
>-	if (0xFF =3D=3D hw_channel_plan)
>+	if (hw_channel_plan =3D=3D 0xFF)
> 		AutoLoadFail =3D true;
>=20
> 	if (!AutoLoadFail) {
>diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec b/drivers/s=
taging/rtl8723bs/hal/hal_com_phycfg=2Ec
>index dc2da49e6738=2E=2E9e523491a008 100644
>--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec
>@@ -462,11 +462,11 @@ u8 PHY_GetTxPowerIndexBase(
>=20
> 	if (IS_CCK_RATE(Rate))
> 		txPower =3D pHalData->Index24G_CCK_Base[RFPath][chnlIdx];
>-	else if (MGN_6M <=3D Rate)
>+	else if (Rate >=3D MGN_6M)
> 		txPower =3D pHalData->Index24G_BW40_Base[RFPath][chnlIdx];
>=20
> 	/*  OFDM-1T */
>-	if ((MGN_6M <=3D Rate && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
>+	if ((Rate >=3D MGN_6M && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
> 		txPower +=3D pHalData->OFDM_24G_Diff[RFPath][TX_1S];
>=20
> 	if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
>diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init=2Ec b/driver=
s/staging/rtl8723bs/hal/rtl8723b_hal_init=2Ec
>index 8d259820f103=2E=2E02c3f4229e74 100644
>--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init=2Ec
>@@ -405,11 +405,11 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padap=
ter, bool  bUsedWoWLANFw)
> 			break;
> 	}
> 	_FWDownloadEnable(padapter, false);
>-	if (_SUCCESS !=3D rtStatus)
>+	if (rtStatus !=3D _SUCCESS)
> 		goto fwdl_stat;
>=20
> 	rtStatus =3D _FWFreeToGo(padapter, 10, 200);
>-	if (_SUCCESS !=3D rtStatus)
>+	if (rtStatus !=3D _SUCCESS)
> 		goto fwdl_stat;
>=20
> fwdl_stat:
>@@ -1165,15 +1165,15 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapte=
r)
>=20
> static void hal_get_chnl_group_8723b(u8 channel, u8 *group)
> {
>-	if (1  <=3D channel && channel <=3D 2)
>+	if (channel >=3D 1 && channel <=3D 2)
> 		*group =3D 0;
>-	else if (3  <=3D channel && channel <=3D 5)
>+	else if (channel >=3D 3 && channel <=3D 5)
> 		*group =3D 1;
>-	else if (6  <=3D channel && channel <=3D 8)
>+	else if (channel >=3D 6 && channel <=3D 8)
> 		*group =3D 2;
>-	else if (9  <=3D channel && channel <=3D 11)
>+	else if (channel >=3D 9 && channel <=3D 11)
> 		*group =3D 3;
>-	else if (12 <=3D channel && channel <=3D 14)
>+	else if (channel >=3D 12 && channel <=3D 14)
> 		*group =3D 4;
> }
>=20
>@@ -1221,7 +1221,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
>=20
> 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
>=20
>-	if (0xFF =3D=3D PROMContent[eeAddr+1])
>+	if (PROMContent[eeAddr+1] =3D=3D 0xFF)
> 		AutoLoadFail =3D true;
>=20
> 	if (AutoLoadFail) {
>@@ -2035,7 +2035,7 @@ static void hw_var_set_bcn_func(struct adapter *pad=
apter, u8 variable, u8 *val)
> 		val8 &=3D ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
>=20
> 		/*  Always enable port0 beacon function for PSTDMA */
>-		if (REG_BCN_CTRL =3D=3D bcn_ctrl_reg)
>+		if (bcn_ctrl_reg =3D=3D REG_BCN_CTRL)
> 			val8 |=3D EN_BCN_FUNCTION;
>=20
> 		rtw_write8(padapter, bcn_ctrl_reg, val8);
>diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit=2Ec b/drivers/s=
taging/rtl8723bs/hal/rtl8723bs_xmit=2Ec
>index a1f2cbf2cf55=2E=2E9f6503ac2234 100644
>--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit=2Ec
>@@ -413,7 +413,7 @@ int rtl8723bs_xmit_thread(void *context)
> 		if (signal_pending(current)) {
> 			flush_signals(current);
> 		}
>-	} while (_SUCCESS =3D=3D ret);
>+	} while (ret =3D=3D _SUCCESS);
>=20
> 	complete(&pxmitpriv->SdioXmitTerminate);
>=20
>diff --git a/drivers/staging/rtl8723bs/include/ieee80211=2Eh b/drivers/st=
aging/rtl8723bs/include/ieee80211=2Eh
>index 0f28c904a714=2E=2E0f378830462f 100644
>--- a/drivers/staging/rtl8723bs/include/ieee80211=2Eh
>+++ b/drivers/staging/rtl8723bs/include/ieee80211=2Eh
>@@ -395,8 +395,8 @@ enum {
> };
>=20
> #define IS_HT_RATE(_rate)				(_rate >=3D MGN_MCS0 && _rate <=3D MGN_MCS3=
1)
>-#define IS_CCK_RATE(_rate)				(MGN_1M =3D=3D _rate || _rate =3D=3D MGN_2=
M || _rate =3D=3D MGN_5_5M || _rate =3D=3D MGN_11M)
>-#define IS_OFDM_RATE(_rate)				(MGN_6M <=3D _rate && _rate <=3D MGN_54M =
 && _rate !=3D MGN_11M)
>+#define IS_CCK_RATE(_rate)				(_rate =3D=3D MGN_1M || _rate =3D=3D MGN_2=
M || _rate =3D=3D MGN_5_5M || _rate =3D=3D MGN_11M)
>+#define IS_OFDM_RATE(_rate)				(_rate >=3D MGN_6M && _rate <=3D MGN_54M =
 && _rate !=3D MGN_11M)
>=20
>=20
> /* NOTE: This data is for statistical purposes; not all hardware provide=
s this

Sorry, I sent it from the wrong email=2E
Please use luka=2Egejak@linux=2Edev instead of lukagejak5@gmail=2Ecom=2E
LGTM,
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
