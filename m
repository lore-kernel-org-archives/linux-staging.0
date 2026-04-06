Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B6309EEB
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 20:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775508326; cv=none; b=eprmp0up/djJie0jEAZBqcCv0CLfRsaxurUL8EbhNU1C/Zg2CWbFkDMCQJa0NSjkX9SUu99PWjHxniu+SEIDstLae8yfbwDKw6n44O8gWErcCmiwTzH2Py+8gST8PBFlHN2HWEyolgjbElvfS1JiYeGmaH0ZAb0dF63mxmh4pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775508326; c=relaxed/simple;
	bh=hf5bitVnCrZPJ5YjjUDF+4vcewRhf6YDp2Tu5wGaMS4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=smjXJQLaBtmUnihJhOZ1Du5hlz4kBJNzS29uXM1iTqDZkAd4xkmUV98mexg0RzNaA68vxRQx+l7RgqEen3DL2HJ5Il/drd/D4n1W0u6ezIUYh+dJm60lpQyOxvMlgiNIUHaH/l7XxMOj30A7J/hF2KUQHfJ4kQnrX9nBY9Ywabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UR9dv3oh; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UR9dv3oh"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64fc6b21789so3126916d50.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775508324; x=1776113124; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlMibYAMHBTd+tEzR601rquBA/KuPw7YADLBiPWE4SU=;
        b=UR9dv3oh8vrfHzQH37ty+5izrYdT23ZgpH1a6z/gjFy5thpvzbfW/R2fRbtsmhJnV/
         hq8S/xb5c3sLkbw1nYeht/Y9UvLSLkJ/MEBnEhHGoc85ZQEUZT8fFwyex108+Fy50J4H
         HZTdsQtBOL/FXMWPh4Y6QFUGklTuuKA8uk8jh9cGKMC3gZKFkQ5sPgJ1OJEhZhT9tVvc
         HlrzxWzqJRVCJuaXYbLcviQetuOFyflBjNy0IvKEffcd088wh6Q9VHhbYtH7acpDq4ZG
         Ky/tEL3VElPFhzV5M0yjLNKDS+ZzhiT+gCTaBH/a92porDdtfFixjFvQermO3vP5SREy
         AwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775508324; x=1776113124;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlMibYAMHBTd+tEzR601rquBA/KuPw7YADLBiPWE4SU=;
        b=GMxZnuLaNjFZhyNgSXEWQf8YKZ17coYFLoyEui/rWnF97kyEsXxAzH0ohkHK3joIzY
         ZcOS+YewvVYqMLRqKIim8EWqyuvrXT31Hy8qz9BLz2cCTTX0JRHYoF6L4qmnlDjyKBaI
         /SoKbqBAQRQY/+FjEQTnc1b2oYMCNoYD3AiJ4P3/I7PjVLtZ9GH4XRhpRGEZBoO56RKJ
         83nMdm/840ypArGQwmt/8++nlQui4Lon7nTnQkzJaQMYgh/SL15thiY3XNjswLoA+pf3
         3RZC4R2QgtpOxYGSOsKm1droLPNS8967b8fRtU2zZfWULif4Ry0gHvFi1fYLBXkZvIQu
         mwYw==
X-Gm-Message-State: AOJu0YzFc8VvL4ZKtiNDuWY6fTldVEn//5c4UnJGRiOi3gJJAlceBd4T
	vzT9E7HY5gWMx9N8GZKMoHzuodXLGo3eDoCzX/RL0aY54kv8rmpK1ld2
X-Gm-Gg: AeBDiesH0cn4+6Yt2T/EEluZEjzuwpxgmpmd5eAeaFXGwo2NvoIpldGWUPwSsbgqQV9
	gfx2eRwoO/dWjwIhE2pW/XGlkVTy7OnwYQUA2lZxuetkGilyUUMf8ekfECOCMNZ/Zrbne2UfruX
	/ldrWe1Ield68aGYV+FFCbXkcClgdb3KTE4ut97ZxtkgixCyLJp8DOBtmv4z0uQ20q6/y97gGD3
	PZho+OKHiu9qywG1lEBmBRYxMW9KCrA9puoI5pZOO/gekf9tawe4hy6Evclm6ARBP1ukDXS4I/s
	e8hgNNDzcQX88PTwUYv6uRt1OtP0H2oc+OyngBg0SaL1MU33bDy9PzwIZ1Wh7hkPIJhq/opxEkB
	dPr19JkBhESx5Acte7oxeK9zGTJA25gEfiisnK/dpeodbeCHzx7PC61jr3riSTEJjNFmuvrdS1/
	ftfar16g9WKZnskrxacqQhz3c4U93PVZl0qYiMeS9JvWgfrttTdvOIp3bIJIV7KA178m7848RW/
	3Me1POicP6Am+C1BknpqceLKDWuxfE9
X-Received: by 2002:a05:690e:1697:b0:650:5ef1:6805 with SMTP id 956f58d0204a3-6505ef16cfemr7155510d50.60.1775508324251;
        Mon, 06 Apr 2026 13:45:24 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a845123sm6510919d50.7.2026.04.06.13.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 13:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 15:45:20 -0500
Message-Id: <DHMD663XUSIL.1LZAR5LQJWAN@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [RFT PATCH v3 1/5] staging: rtl8723bs: move constant to right
 side of test in comparison
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Luka Gejak" <luka.gejak@linux.dev>, "Prithvi Tambewagh"
 <activprithvi@gmail.com>, <gregkh@linuxfoundation.org>,
 <abrahamadekunle50@gmail.com>, <b9788213@gmail.com>,
 <straube.linux@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <dan.carpenter@linaro.org>,
 <weibu@redadmin.org>, <knavaneeth786@gmail.com>,
 <ignacio.pena87@gmail.com>, <dharanitharan725@gmail.com>,
 <samasth.norway.ananda@oracle.com>, <karanja99erick@gmail.com>,
 <s9430939@naver.com>, <suunj1331@gmail.com>, <ysinghcin@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260405114132.310774-1-activprithvi@gmail.com>
 <20260405114132.310774-2-activprithvi@gmail.com>
 <F31C7F72-D267-450E-81FA-DAA3F14FDEE9@linux.dev>
In-Reply-To: <F31C7F72-D267-450E-81FA-DAA3F14FDEE9@linux.dev>

On Sun Apr 5, 2026 at 7:51 AM CDT, Luka Gejak wrote:
> On April 5, 2026 1:41:28 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gm=
ail.com> wrote:
>>Move constant from the left side to the right side of the test in a
>>comparison, where =3D=3D, !=3D, <=3D, >=3D, <, > operators are used, fixi=
ng the
>>checkpatch warning: Comparisons should place the constant on the right
>>side of the test.
>>
>>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
>>---
>> .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  4 ++--
>> drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  2 +-
>> drivers/staging/rtl8723bs/hal/hal_com.c        |  2 +-
>> drivers/staging/rtl8723bs/hal/hal_com_phycfg.c |  4 ++--
>> .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
>> drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
>> drivers/staging/rtl8723bs/include/ieee80211.h  |  4 ++--
>> 7 files changed, 18 insertions(+), 18 deletions(-)
>>
>>diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/st=
aging/rtl8723bs/hal/HalBtc8723b2Ant.c
>>index d32dbf94858f..58f6cf063498 100644
>>--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
>>+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
>>@@ -2211,7 +2211,7 @@ static void halbtc8723b2ant_RunCoexistMechanism(str=
uct btc_coexist *pBtCoexist)
>> 	}
>>=20
>> 	algorithm =3D halbtc8723b2ant_ActionAlgorithm(pBtCoexist);
>>-	if (pCoexSta->bC2hBtInquiryPage && (BT_8723B_2ANT_COEX_ALGO_PANHS !=3D =
algorithm)) {
>>+	if (pCoexSta->bC2hBtInquiryPage && (algorithm !=3D BT_8723B_2ANT_COEX_A=
LGO_PANHS)) {
>> 		halbtc8723b2ant_ActionBtInquiry(pBtCoexist);
>> 		return;
>> 	} else {
>>@@ -2490,7 +2490,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
>> 		return;
>> 	}
>>=20
>>-	if (BT_INFO_SRC_8723B_2ANT_WIFI_FW !=3D rspSource) {
>>+	if (rspSource !=3D BT_INFO_SRC_8723B_2ANT_WIFI_FW) {
>> 		pCoexSta->btRetryCnt =3D pCoexSta->btInfoC2h[rspSource][2] & 0xf; /* [=
3:0] */
>>=20
>> 		pCoexSta->btRssi =3D pCoexSta->btInfoC2h[rspSource][3] * 2 + 10;
>>diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/sta=
ging/rtl8723bs/hal/HalPhyRf_8723B.c
>>index 9df3274c1048..9e7eebfc02a9 100644
>>--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
>>+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
>>@@ -313,7 +313,7 @@ static void GetDeltaSwingTable_8723B(
>> 	u16 rate =3D *(pDM_Odm->pForcedDataRate);
>> 	u8 channel =3D pHalData->CurrentChannel;
>>=20
>>-	if (1 <=3D channel && channel <=3D 14) {
>>+	if (channel >=3D 1 && channel <=3D 14) {
>> 		if (IS_CCK_RATE(rate)) {
>> 			*TemperatureUP_A   =3D pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P;
>> 			*TemperatureDOWN_A =3D pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N;
>>diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rt=
l8723bs/hal/hal_com.c
>>index 31b3e880ae6a..597ba3d283c1 100644
>>--- a/drivers/staging/rtl8723bs/hal/hal_com.c
>>+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
>>@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
>> 	pHalData->bDisableSWChannelPlan =3D false;
>> 	chnlPlan =3D def_channel_plan;
>>=20
>>-	if (0xFF =3D=3D hw_channel_plan)
>>+	if (hw_channel_plan =3D=3D 0xFF)
>> 		AutoLoadFail =3D true;
>>=20
>> 	if (!AutoLoadFail) {
>>diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/sta=
ging/rtl8723bs/hal/hal_com_phycfg.c
>>index dc2da49e6738..9e523491a008 100644
>>--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>@@ -462,11 +462,11 @@ u8 PHY_GetTxPowerIndexBase(
>>=20
>> 	if (IS_CCK_RATE(Rate))
>> 		txPower =3D pHalData->Index24G_CCK_Base[RFPath][chnlIdx];
>>-	else if (MGN_6M <=3D Rate)
>>+	else if (Rate >=3D MGN_6M)
>> 		txPower =3D pHalData->Index24G_BW40_Base[RFPath][chnlIdx];
>>=20
>> 	/*  OFDM-1T */
>>-	if ((MGN_6M <=3D Rate && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
>>+	if ((Rate >=3D MGN_6M && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
>> 		txPower +=3D pHalData->OFDM_24G_Diff[RFPath][TX_1S];
>>=20
>> 	if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
>>diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/=
staging/rtl8723bs/hal/rtl8723b_hal_init.c
>>index 8d259820f103..02c3f4229e74 100644
>>--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>>+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
>>@@ -405,11 +405,11 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padap=
ter, bool  bUsedWoWLANFw)
>> 			break;
>> 	}
>> 	_FWDownloadEnable(padapter, false);
>>-	if (_SUCCESS !=3D rtStatus)
>>+	if (rtStatus !=3D _SUCCESS)
>> 		goto fwdl_stat;
>>=20
>> 	rtStatus =3D _FWFreeToGo(padapter, 10, 200);
>>-	if (_SUCCESS !=3D rtStatus)
>>+	if (rtStatus !=3D _SUCCESS)
>> 		goto fwdl_stat;
>>=20
>> fwdl_stat:
>>@@ -1165,15 +1165,15 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapte=
r)
>>=20
>> static void hal_get_chnl_group_8723b(u8 channel, u8 *group)
>> {
>>-	if (1  <=3D channel && channel <=3D 2)
>>+	if (channel >=3D 1 && channel <=3D 2)
>> 		*group =3D 0;
>>-	else if (3  <=3D channel && channel <=3D 5)
>>+	else if (channel >=3D 3 && channel <=3D 5)
>> 		*group =3D 1;
>>-	else if (6  <=3D channel && channel <=3D 8)
>>+	else if (channel >=3D 6 && channel <=3D 8)
>> 		*group =3D 2;
>>-	else if (9  <=3D channel && channel <=3D 11)
>>+	else if (channel >=3D 9 && channel <=3D 11)
>> 		*group =3D 3;
>>-	else if (12 <=3D channel && channel <=3D 14)
>>+	else if (channel >=3D 12 && channel <=3D 14)
>> 		*group =3D 4;
>> }
>>=20
>>@@ -1221,7 +1221,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
>>=20
>> 	memset(pwrInfo24G, 0, sizeof(struct TxPowerInfo24G));
>>=20
>>-	if (0xFF =3D=3D PROMContent[eeAddr+1])
>>+	if (PROMContent[eeAddr+1] =3D=3D 0xFF)
>> 		AutoLoadFail =3D true;
>>=20
>> 	if (AutoLoadFail) {
>>@@ -2035,7 +2035,7 @@ static void hw_var_set_bcn_func(struct adapter *pad=
apter, u8 variable, u8 *val)
>> 		val8 &=3D ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
>>=20
>> 		/*  Always enable port0 beacon function for PSTDMA */
>>-		if (REG_BCN_CTRL =3D=3D bcn_ctrl_reg)
>>+		if (bcn_ctrl_reg =3D=3D REG_BCN_CTRL)
>> 			val8 |=3D EN_BCN_FUNCTION;
>>=20
>> 		rtw_write8(padapter, bcn_ctrl_reg, val8);
>>diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/sta=
ging/rtl8723bs/hal/rtl8723bs_xmit.c
>>index a1f2cbf2cf55..9f6503ac2234 100644
>>--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
>>+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
>>@@ -413,7 +413,7 @@ int rtl8723bs_xmit_thread(void *context)
>> 		if (signal_pending(current)) {
>> 			flush_signals(current);
>> 		}
>>-	} while (_SUCCESS =3D=3D ret);
>>+	} while (ret =3D=3D _SUCCESS);
>>=20
>> 	complete(&pxmitpriv->SdioXmitTerminate);
>>=20
>>diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/stag=
ing/rtl8723bs/include/ieee80211.h
>>index 0f28c904a714..0f378830462f 100644
>>--- a/drivers/staging/rtl8723bs/include/ieee80211.h
>>+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
>>@@ -395,8 +395,8 @@ enum {
>> };
>>=20
>> #define IS_HT_RATE(_rate)				(_rate >=3D MGN_MCS0 && _rate <=3D MGN_MCS3=
1)
>>-#define IS_CCK_RATE(_rate)				(MGN_1M =3D=3D _rate || _rate =3D=3D MGN_2=
M || _rate =3D=3D MGN_5_5M || _rate =3D=3D MGN_11M)
>>-#define IS_OFDM_RATE(_rate)				(MGN_6M <=3D _rate && _rate <=3D MGN_54M =
 && _rate !=3D MGN_11M)
>>+#define IS_CCK_RATE(_rate)				(_rate =3D=3D MGN_1M || _rate =3D=3D MGN_2=
M || _rate =3D=3D MGN_5_5M || _rate =3D=3D MGN_11M)
>>+#define IS_OFDM_RATE(_rate)				(_rate >=3D MGN_6M && _rate <=3D MGN_54M =
 && _rate !=3D MGN_11M)
>>=20
>>=20
>> /* NOTE: This data is for statistical purposes; not all hardware provide=
s this
>
> Sorry, I sent it from the wrong email.
> Please use luka.gejak@linux.dev instead of lukagejak5@gmail.com.
> LGTM,
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

This doesn't even apply to staging-next.

Thanks,

ET
