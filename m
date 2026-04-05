Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312DA25785D
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775393407; cv=none; b=F35YVcFx9/6rMN8Qbv2lXJqacDpeTQP/dEQSOqbc4XLxEheZBu15ueTbZr2ntdTblZz4VSXTT6sSZAajzl9rqBdjXOBCNWfzcm8oxRooXosmovFq5pUEuSxBzdEETGHkm5zsKbEmHamdErkwPooKzMTq9kRc7o0g1irl/4C8eEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775393407; c=relaxed/simple;
	bh=LcpEC3rE6zBteaE48WUPFXLhegLAKydIJJU5eVjF05k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ffgCgyetIh+5rrsEBUp0K4edXe/9+9T2bMr0vM7zd5HSobKHNo7vIkhMRirhgCadZ9Lyb1NsHqYgY6DCp3JtSJC2TiwoQqTighWjjUbZ8p1F1IpnF0SMJXTq5HCsysi5tnJ+RatXFpgH8HO72D2VeOnb+MO9yyDFQrDrWwS3lsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrGzcDkz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrGzcDkz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so2956699f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393404; x=1775998204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c1nOmdjGmdisPsJolJO/R2r/fUOnUgCGQrzxTPrfNdA=;
        b=BrGzcDkzcvelMhh0ddva5ngJzuA0Mc06JNvy8jecdyDAcpNa6JeLGlXAmnNarzdIGm
         r3pDUOJ0iJ8wLjH2St+xpxwgNrgD6fFIySA4wQRYxx6Kl/tLi7+Lbp31wW9GYiwmnkGp
         uy+ThcplXdJByU/Upb/4cWphXhl3AfLhDhGlbqQsiKt4jhBBJ8rNu6PavReN4GYna77a
         GgsQqHPb0RULeuji/9OGSBSAYZNd3Pm3NFSv3WGp7gLscSZHorUSFyqqQjM3RE02Gl5h
         G64cTLFKFVCAF75S+kGtxIw4KhjjG2Vlmojzu7tMY2PB79DPa1KT8m1yHbibsGXZ7Tuq
         UAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393404; x=1775998204;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1nOmdjGmdisPsJolJO/R2r/fUOnUgCGQrzxTPrfNdA=;
        b=ZMAwTYoz7Oge7kURg42ZDkEAU6WCBhSF+QQYsWtu7GcXPUMAsu0Ix+ENgGtCLN4PJ7
         mbkL7LbW+sU/knqUKwDuF/bJzIgRqpDEKxzWTdiGQ+F4oiY0K2bVkqa6xwR7nW8v4Z1f
         g777mSRChb8VGrdhuWMOzCcxPTtc1AE1mTuzLNWANhaTsuz0GUd1o/meOdkZGfWIFabw
         xWXeI2nT3q0xj4ZnJx966/vNwVG+4jIgAV3ovULgXBB2NgXG3uQdbonnciYQTWTmjh0B
         P2HaSDW1fpHcyX2yE278Fh2Wmx8Z8biu3r4xJ+eTcnNoavwHjGEmk98wg8MZy/GOg38g
         1iUQ==
X-Gm-Message-State: AOJu0Yy9fR2PYsh7GyOT2GXbV8nf9uzI+HbO6wRtYNzcY/uoO8Dwom9C
	oISQDKzIobRRFyBAVchQVCh3Ev504wIDhPrIaZ+rrs029WfU1E0uOgk=
X-Gm-Gg: AeBDiesYZgsWpVPUV7VDs2Y/ONukm1SIONyViM2oOFG3QtjxVMGzSKwkaFticgeXZn9
	aoTbNFn8RlYS7ASnNkI4DSE6/V8R6BKnDneljAgb6S2i+j2BeFEMAs2cYmhWXhtI2Bn9iRU/Go9
	6bdktCM8SAkxP9Tx4qkXao/DvU2H84iC5pQcBjLNWfJY2aDyBxV/UG8hMzRY6SFF6IFq5XZx6TZ
	OgMH0GiriXI9v3rUr/BLQUJtovu5QDW1otM48CFjsP90DkPYN3jtMJ8Uyrd1PgjZUjquaqAeVrG
	hoSrwn0DyrN/BiFdWyE7rd2b+9tpNpJZxoqmaJmnNeFtJqhK6oSkk3GekSffLu72C1jkYx/prfC
	7Py9Fa/OvDhAF3ku4dLaIHocAyqnk9UqIUH2DepWzkuznagUCPiZwcFfW/FE8c0DrA4WLCOOZf8
	/6ExGIhiEZqw+2DVgROpPZNU31itckR/cHKffI2a0VrQ5ym6iwlgowt2QOAbLn0sCHLiU+tQDVe
	HgPAXwt+RtgSBHziv+bbQ==
X-Received: by 2002:a05:6000:24c5:b0:43d:33a0:f5b6 with SMTP id ffacd0b85a97d-43d33a0f5d0mr7913845f8f.2.1775393404150;
        Sun, 05 Apr 2026 05:50:04 -0700 (PDT)
Received: from ehlo.thunderbird.net ([46.239.6.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm29873755f8f.35.2026.04.05.05.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 05:50:02 -0700 (PDT)
Date: Sun, 05 Apr 2026 14:49:59 +0200
From: Luka Gejak <lukagejak5@gmail.com>
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
User-Agent: Thunderbird for Android
In-Reply-To: <20260405114132.310774-2-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com> <20260405114132.310774-2-activprithvi@gmail.com>
Message-ID: <09A5A0B6-B1FB-49CD-821A-7EFC2224101D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

LGTM,
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

On April 5, 2026 1:41:28 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gma=
il=2Ecom> wrote:
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
