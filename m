Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2CC3D4107
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743078; cv=none; b=lzReQ6yktTpCVpj5YVMKi4Xx/0cPHY+JEt5LrhQF4od5z65U6tmy4y2ItRvJsFZ9CORT0vAnGERbs9DStOWGEEw0Kq/sR9qkmt1UsMkMTKaHChzv4dgZJ6IhUK4zsCVyKCvwAomxKSEERMvlXKj8D2UURj3m/xJqwjVa494K0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743078; c=relaxed/simple;
	bh=QF6gomc6U7uHS6BsqqP5lz1fqELJFJjSbECZ9NjwVzw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=GUt2fA3Ct9Yjym2tfbaE698alIu68xSlntuSCI40H3yaWnHOOTMtjLzseRhO4kLAx3ThXp3tNM7XonoRg962Yc9tMNOZNgRewapya5omXaB2ju9braO68SA29uMLm84VtpnZpayMa5UfL2uLaSiSeOkXtEjBYJlddC4TbAJdEL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZtHPn7d9; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZtHPn7d9"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775743069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4KVEHYAHiyRWP+TVuLgEwSXvDDrqJO5Cmz6Twu0nW24=;
	b=ZtHPn7d9dvXcBrJYRXH3aGFfhO2lrSA2d2vNyE/Ad2weVL3U4Vjiwg3s9pRCpd9Km/eE7x
	QRiFDb4LCL3Qloa0Fn9KnWuARNVnpu5X9Jl1vcxCNdgIT9ko8w/3lu9ulCu5DBrKPHpOq8
	Crq4j1AHEVfHalBjLuuq1ToC0zSAPTo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 15:57:46 +0200
Message-Id: <DHOODQY42WIB.K8JZ49O3K7QL@linux.dev>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: remove commented-out dead code
 in HalPhyRf_8723B.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Pranav Desai" <contact.pranavdesai@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <straube.linux@gmail.com>,
 <b9788213@gmail.com>, <bera@yuzu.li>
References: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
In-Reply-To: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 5:48 AM CEST, Pranav Desai wrote:
> Remove commented-out code blocks
>
> Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
Hi Pranav,
This patch removes some comments that describe code that is not=20
commented-out. Please carefully review this patch to ensure you are=20
only removing commented-out C code (and comments that explicitly=20
describe that dead code). Do not remove active comments.
Best regards,
Luka Gejak
> ---
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 85 -------------------
>  1 file changed, 85 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/sta=
ging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 8f6849f2277e..63c848ebd661 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -361,9 +361,6 @@ static u8 phy_PathA_IQK_8723B(
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, =
0x18000);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask,=
 0x0003f);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask,=
 0xc7f87);
> -	/* 	disable path B PA in TXIQK mode */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x=
00020); */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x=
40ec1); */
> =20
>  	/* 1 Tx IQK */
>  	/* IQK setting */
> @@ -374,7 +371,6 @@ static u8 phy_PathA_IQK_8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a)=
; */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
> @@ -401,8 +397,6 @@ static u8 phy_PathA_IQK_8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
> =20
> -	/*  delay x ms */
> -	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
>  	mdelay(IQK_DELAY_TIME_8723B);
> =20
>  	/* restore Ant Path */
> @@ -462,7 +456,6 @@ static u8 phy_PathA_RxIQK8723B(
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask,=
 0x0001f);
>  	/* LNA2 off, PA on for Dcut */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask,=
 0xf7fb7);
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); =
*/
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
> =20
>  	/* IQK setting */
> @@ -475,7 +468,6 @@ static u8 phy_PathA_RxIQK8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
> =20
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f)=
; */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
> @@ -502,8 +494,6 @@ static u8 phy_PathA_RxIQK8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
> =20
> -	/*  delay x ms */
> -	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
>  	mdelay(IQK_DELAY_TIME_8723B);
> =20
>  	/* restore Ant Path */
> @@ -546,7 +536,6 @@ static u8 phy_PathA_RxIQK8723B(
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask,=
 0x0001f);
>  	/* LAN2 on, PA off for Dcut */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask,=
 0xf7d77);
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); =
*/
> =20
>  	/* PA, PAD setting */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80=
);
> @@ -563,7 +552,6 @@ static u8 phy_PathA_RxIQK8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
> =20
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2)=
; */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
> @@ -589,8 +577,6 @@ static u8 phy_PathA_RxIQK8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
> =20
> -	/*  delay x ms */
> -	/* PlatformStallExecution(IQK_DELAY_TIME_8723B*1000); */
>  	mdelay(IQK_DELAY_TIME_8723B);
> =20
>  	/* restore Ant Path */
> @@ -642,12 +628,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapt=
er)
>      /* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> -	/* 	in TXIQK mode */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); =
*/
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMas=
k, 0x20000); */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMa=
sk, 0x0003f); */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMa=
sk, 0xc7f87); */
> -	/* 	enable path B PA in TXIQK mode */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30f=
c1);
> =20
> @@ -663,7 +643,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapte=
r)
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
> =20
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114)=
; */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
> @@ -677,7 +656,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapte=
r)
> =20
>  	/* switch to path B */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0x=
effe0); */
> =20
>  	/* GNT_BT =3D 0 */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
> @@ -686,8 +664,6 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapte=
r)
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
> =20
> -	/*  delay x ms */
> -	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
>  	mdelay(IQK_DELAY_TIME_8723B);
> =20
>  	/* restore Ant Path */
> @@ -757,7 +733,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
> =20
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f)=
; */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
> @@ -771,7 +746,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
> =20
>  	/* switch to path B */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0x=
effe0); */
> =20
>  	/* GNT_BT =3D 0 */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
> @@ -781,8 +755,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
> =20
> =20
> -	/*  delay x ms */
> -	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
>  	mdelay(IQK_DELAY_TIME_8723B);
> =20
>  	/* restore Ant Path */
> @@ -825,16 +797,11 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *pada=
pter, bool configPathB)
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, =
0x18000);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask,=
 0x0001f);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask,=
 0xf7d77);
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); =
*/
> =20
>  	/* open PA S1 & close SMIXER */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30e=
bd);
> =20
> -	/* PA, PAD setting */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x=
f80); */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x=
51000); */
> -
>  	/* IQK setting */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
> =20
> @@ -845,7 +812,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
> =20
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2)=
; */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
> @@ -858,7 +824,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
> =20
>  	/* switch to path B */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0x=
effe0); */
> =20
>  	/* GNT_BT =3D 0 */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
> @@ -867,8 +832,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf9000000);
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Pts, bMaskDWord, 0xf8000000);
> =20
> -	/*  delay x ms */
> -	/* PlatformStallExecution(IQK_DELAY_TIME_88E*1000); */
>  	mdelay(IQK_DELAY_TIME_8723B);
> =20
>  	/* restore Ant Path */
> @@ -883,12 +846,6 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padap=
ter, bool configPathB)
>  	regEAC =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bM=
askDWord);
>  	regEA4 =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, b=
MaskDWord);
> =20
> -	/* 	PA/PAD controlled by 0x0 */
> -	/* leave IQK mode */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); =
*/
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x=
180); */
> -
> -
> =20
>  	/* Allen 20131125 */
>  	tmp =3D (regEAC & 0x03FF0000)>>16;
> @@ -960,7 +917,6 @@ static void _PHY_PathAFillIQKMatrix8723B(
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] =3D rOFDM0_RxI=
QExtAnta;
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =3D 0xfffffff =
& PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] =3D rOFDM0_XAR=
xIQImbalance;
> -/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] =3D PHY_Que=
ryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] =3D 0x40000100=
;
>  			return;
>  		}
> @@ -1020,8 +976,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
> =20
>  		/* 2 Tx IQC */
>  		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3=
C0)>>6));
> -/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] =3D rOFDM0_X=
DTxAFE; */
> -/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] =3D PHY_Quer=
yBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
>  		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] =3D rOFDM0_XCTx=
AFE;
>  		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] =3D PHY_QueryBB=
Reg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
> =20
> @@ -1035,7 +989,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
> =20
>  		if (bTxOnly) {
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] =3D rOFDM0_XAR=
xIQImbalance;
> -/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] =3D PHY_Que=
ryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] =3D 0x40000100=
;
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] =3D rOFDM0_RxI=
QExtAnta;
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] =3D 0x0fffffff=
 & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
> @@ -1051,7 +1004,6 @@ static void _PHY_PathBFillIQKMatrix8723B(
>  		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] =3D PHY_QueryBB=
Reg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
> =20
>  		reg =3D (result[final_candidate][7] >> 6) & 0xF;
> -/* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg=
); */
>  		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] =3D rOFDM0_RxIQ=
ExtAnta;
>  		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] =3D (reg << 28)=
|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffff=
ff);
>  	}
> @@ -1353,11 +1305,6 @@ static void phy_IQCalibrate_8723B(
> =20
>  	_PHY_PathADDAOn8723B(padapter, ADDA_REG, is2T);
> =20
> -/* no serial mode */
> -
> -	/* save RF path for 8723B */
> -/* 	Path_SEL_BB =3D PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);=
 */
> -/* 	Path_SEL_RF =3D PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0x=
fffff); */
> =20
>  	/* MAC settings */
>  	_PHY_MACSettingCalibration8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalib=
rateInfo.IQK_MAC_backup);
> @@ -1370,14 +1317,6 @@ static void phy_IQCalibrate_8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x=
22204000);
> =20
> =20
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01=
); */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01=
); */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00)=
; */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00)=
; */
> -
> -
> -/* RX IQ calibration setting for 8723B D cut large current issue when le=
aving IPS */
> -
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, =
0x30000);
> @@ -1389,7 +1328,6 @@ static void phy_IQCalibrate_8723B(
>  /* path A TX IQK */
>  	for (i =3D 0 ; i < retryCount ; i++) {
>  		PathAOK =3D phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
> -/* 		if (PathAOK =3D=3D 0x03) { */
>  		if (PathAOK =3D=3D 0x01) {
>  			/*  Path A Tx IQK Success */
>  			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> @@ -1407,8 +1345,6 @@ static void phy_IQCalibrate_8723B(
>  	for (i =3D 0 ; i < retryCount ; i++) {
>  		PathAOK =3D phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
>  		if (PathAOK =3D=3D 0x03) {
> -/* 				result[t][0] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Befo=
re_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
> -/* 				result[t][1] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Afte=
r_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
>  				result[t][2] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_=
IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
>  				result[t][3] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_I=
QK_A_2, bMaskDWord)&0x3FF0000)>>16;
>  			break;
> @@ -1439,8 +1375,6 @@ static void phy_IQCalibrate_8723B(
>  		for (i =3D 0 ; i < retryCount ; i++) {
>  			PathBOK =3D phy_PathB_RxIQK8723B(padapter, is2T);
>  			if (PathBOK =3D=3D 0x03) {
> -/* 				result[t][0] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Befo=
re_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
> -/* 				result[t][1] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Afte=
r_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
>  				result[t][6] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_=
IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
>  				result[t][7] =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_I=
QK_A_2, bMaskDWord)&0x3FF0000)>>16;
>  				break;
> @@ -1462,9 +1396,6 @@ static void phy_IQCalibrate_8723B(
> =20
>  		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCal=
ibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
> =20
> -		/* Reload RF path */
> -/* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
> -/* 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_R=
F); */
> =20
>  		/* Allen initial gain 0xc50 */
>  		/*  Restore RX initial gain */
> @@ -1642,14 +1573,6 @@ void PHY_IQCalibrate_8723B(
> =20
>  	/* save default GNT_BT */
>  	GNT_BT_default =3D PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
> -	/*  Save RF Path */
> -/* 	Path_SEL_BB =3D PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);=
 */
> -/* 	Path_SEL_RF =3D PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0x=
fffff); */
> -
> -    /* set GNT_BT =3D 0, pause BT traffic */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
> -
> =20
>  	for (i =3D 0; i < 8; i++) {
>  		result[0][i] =3D 0;
> @@ -1742,10 +1665,6 @@ void PHY_IQCalibrate_8723B(
> =20
>  	/* restore GNT_BT */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
> -	/*  Restore RF Path */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF=
); */
> -
>  	/* Resotr RX mode table parameter */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, =
0x18000);
> @@ -1754,10 +1673,6 @@ void PHY_IQCalibrate_8723B(
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x300=
bd);
> =20
> -	/* set GNT_BT =3D HW control */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
> -/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
> -
>  	if (Is2ant) {
>  		if (RF_Path =3D=3D 0x0)	/* S1 */
>  			ODM_SetIQCbyRFpath(pDM_Odm, 0);

