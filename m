Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8538D3D9DCA
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743448; cv=none; b=iCJfHy+g2t0D5RM3D5qYEwNRkSb+VYuNndZ0uXH5DX9cLqNeF1s22zl5e8YZnCzztJ+JQ5fGyxBv0mrpCoa6i6sOVpbV93DgvgswbO+2mD9vX8TK1Gj5Zuc+mmJJeDEI5j8i5jMp1IsHMMc+e5oaP6pCJ8BZi/QE1hw1jFrjXRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743448; c=relaxed/simple;
	bh=nqpmRS/FN1paDBbX+D8emqMQOx4SLoGaehDHXVnRi5E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F0rIfYhk4A1J2Q07u68sNKKcSuJyRpS+LTYIm58PWPHiycB2MX0IDdYKZ9UV0Ig3NqkkVwBf/yuiPz6zn3E8gxAPoAcjMuflj2BQyBFazj5gHcn3B6pv4cuyK/T5Xu3VLuz04YG2PniHWrs3fXpY/2cFaT2JijWLdNW28PfeVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JAoLcvB0; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JAoLcvB0"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775743439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iN9fB8JXETytJQJhG/cg9t4tcD3AE55Rr1d8G56MLxQ=;
	b=JAoLcvB0dLhl+TcqmNVzdJSIJpXmR+fesElVcb75gNdjBYa7T+Kdh/zWnjHT/aC+zk+Z4s
	1SWFwcrZw633LBD7Edq+Y+4+VYcC3ntR4ZXbuw3ZNdihKKAYo3BlaGjoLQXaq91fWB6t1v
	LEmoV8r6NpGEFnyU8+b0NUM7nULR1jQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:03:55 +0200
Message-Id: <DHOOIGOHBSIA.122G87AINVY3G@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <straube.linux@gmail.com>,
 <b9788213@gmail.com>, <bera@yuzu.li>
Subject: Re: [PATCH 2/2] staging: rtl8723bs: fix comment style in
 HalPhyRf_8723B.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Pranav Desai" <contact.pranavdesai@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260409034859.42356-1-contact.pranavdesai@gmail.com>
 <20260409034859.42356-2-contact.pranavdesai@gmail.com>
In-Reply-To: <20260409034859.42356-2-contact.pranavdesai@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 5:48 AM CEST, Pranav Desai wrote:
> removed extra spaces for comments and formated them to be more readable
>
> Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 120 +++++++++---------
>  1 file changed, 60 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/sta=
ging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 63c848ebd661..d4e8ec172658 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -8,8 +8,8 @@
>  #include <drv_types.h>
>  #include "odm_precomp.h"
> =20
> -/*  MACRO definition for pRFCalibrateInfo->TxIQC_8723B[0] */
> -#define		PATH_S0							1 /*  RF_PATH_B */
> +/* MACRO definition for pRFCalibrateInfo->TxIQC_8723B[0] */
> +#define		PATH_S0							1 /* RF_PATH_B */
>  #define		IDX_0xC94						0
>  #define		IDX_0xC80						1
>  #define		IDX_0xC14						0
> @@ -17,8 +17,8 @@
>  #define		KEY							0
>  #define		VAL							1
> =20
> -/*  MACRO definition for pRFCalibrateInfo->TxIQC_8723B[1] */
> -#define		PATH_S1							0 /*  RF_PATH_A */
> +/* MACRO definition for pRFCalibrateInfo->TxIQC_8723B[1] */
> +#define		PATH_S1							0 /* RF_PATH_A */
>  #define		IDX_0xC4C						2
> =20
>  /*---------------------------Define Local Constant----------------------=
-----*/
> @@ -210,7 +210,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  		Final_OFDM_Swing_Index =3D pDM_Odm->DefaultOfdmIndex + pDM_Odm->Absolu=
te_OFDMSwingIdx[RFPath];
>  		Final_CCK_Swing_Index =3D pDM_Odm->DefaultCckIndex + pDM_Odm->Absolute=
_OFDMSwingIdx[RFPath];
> =20
> -		/*  Adjust BB swing by OFDM IQ matrix */
> +		/* Adjust BB swing by OFDM IQ matrix */
>  		if (Final_OFDM_Swing_Index >=3D PwrTrackingLimit_OFDM)
>  			Final_OFDM_Swing_Index =3D PwrTrackingLimit_OFDM;
>  		else if (Final_OFDM_Swing_Index <=3D 0)
> @@ -269,7 +269,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  			setCCKFilterCoefficient(pDM_Odm, PwrTrackingLimit_CCK);
>  			pDM_Odm->Modify_TxAGC_Flag_PathA_CCK =3D true;
>  			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentCh=
annel, CCK);
> -		} else if (Final_CCK_Swing_Index <=3D 0) { /*  Lowest CCK Index =3D 0 =
*/
> +		} else if (Final_CCK_Swing_Index <=3D 0) { /* Lowest CCK Index =3D 0 *=
/
>  			pDM_Odm->Remnant_CCKSwingIdx =3D Final_CCK_Swing_Index;
>  			setCCKFilterCoefficient(pDM_Odm, 0);
>  			pDM_Odm->Modify_TxAGC_Flag_PathA_CCK =3D true;
> @@ -284,7 +284,7 @@ void ODM_TxPwrTrackSetPwr_8723B(
>  			}
>  		}
>  	} else
> -		return; /*  This method is not supported. */
> +		return; /* This method is not supported. */
>  }
> =20
>  static void GetDeltaSwingTable_8723B(
> @@ -350,17 +350,18 @@ static u8 phy_PathA_IQK_8723B(
>  	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
>  	struct dm_odm_t *pDM_Odm =3D &pHalData->odmpriv;
> =20
> -	/*  Save RF Path */
> +	/* Save RF Path */
>  	Path_SEL_BB =3D PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
> =20
>  	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> -	/* 	enable path A PA in TXIQK mode */
> +	/* enable path A PA in TXIQK mode */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, =
0x18000);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask,=
 0x0003f);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask,=
 0xc7f87);
> +	/* disable path B PA in TXIQK mode */
The code that actually disabled Path B was the dead code removed in=20
patch 1. By adding this comment back in patch 2 at the end of the=20
block, you leave a dangling, highly confusing comment that implies the=20
preceding RF_PATH_A code is disabling PATH_B. This is dangerous for=20
future maintainers trying to understand the hardware configuration. In=20
this patch, ensure you are only reformatting existing, valid comments.=20
Do not introduce dangling comments for code that no longer exists.
Best regards,
Luka Gejak
> =20
>  	/* 1 Tx IQK */
>  	/* IQK setting */
> @@ -384,10 +385,10 @@ static u8 phy_PathA_IQK_8723B(
> =20
>  	/* Ant switch */
>  	if (configPathB || (RF_Path =3D=3D 0))
> -		/*  wifi switch to S1 */
> +		/* wifi switch to S1 */
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
>  	else
> -		/*  wifi switch to S0 */
> +		/* wifi switch to S0 */
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
> =20
>  	/* GNT_BT =3D 0 */
> @@ -408,7 +409,7 @@ static u8 phy_PathA_IQK_8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> =20
> -	/*  Check failed */
> +	/* Check failed */
>  	regEAC =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bM=
askDWord);
>  	regE94 =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMa=
skDWord);
>  	regE9C =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMas=
kDWord);
> @@ -444,7 +445,7 @@ static u8 phy_PathA_RxIQK8723B(
>  	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
>  	struct dm_odm_t *pDM_Odm =3D &pHalData->odmpriv;
> =20
> -	/*  Save RF Path */
> +	/* Save RF Path */
>  	Path_SEL_BB =3D PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
> =20
>  	/* leave IQK mode */
> @@ -481,10 +482,10 @@ static u8 phy_PathA_RxIQK8723B(
> =20
>  	/* Ant switch */
>  	if (configPathB || (RF_Path =3D=3D 0))
> -		/*  wifi switch to S1 */
> +		/* wifi switch to S1 */
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
>  	else
> -		/*  wifi switch to S0 */
> +		/* wifi switch to S0 */
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
> =20
>  	/* GNT_BT =3D 0 */
> @@ -504,7 +505,7 @@ static u8 phy_PathA_RxIQK8723B(
>  	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> -	/*  Check failed */
> +	/* Check failed */
>  	regEAC =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bM=
askDWord);
>  	regE94 =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMa=
skDWord);
>  	regE9C =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMas=
kDWord);
> @@ -564,10 +565,10 @@ static u8 phy_PathA_RxIQK8723B(
> =20
>  	/* Ant switch */
>  	if (configPathB || (RF_Path =3D=3D 0))
> -		/*  wifi switch to S1 */
> +		/* wifi switch to S1 */
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000000);
>  	else
> -		/*  wifi switch to S0 */
> +		/* wifi switch to S0 */
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
> =20
>  	/* GNT_BT =3D 0 */
> @@ -584,14 +585,14 @@ static u8 phy_PathA_RxIQK8723B(
>  	/* GNT_BT =3D 1 */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
> =20
> -    /* leave IQK mode */
> +	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> -	/*  Check failed */
> +	/* Check failed */
>  	regEAC =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bM=
askDWord);
>  	regEA4 =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, b=
MaskDWord);
> =20
> -	/* 	PA/PAD controlled by 0x0 */
> +	/* PA/PAD controlled by 0x0 */
>  	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780=
);
> @@ -622,10 +623,10 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padap=
ter)
>  	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
>  	struct dm_odm_t *pDM_Odm =3D &pHalData->odmpriv;
> =20
> -	/*  Save RF Path */
> +	/* Save RF Path */
>  	Path_SEL_BB =3D PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
> =20
> -    /* leave IQK mode */
> +	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
> @@ -671,10 +672,10 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padap=
ter)
>  	/* GNT_BT =3D 1 */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
> =20
> -    /* leave IQK mode */
> +	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> -	/*  Check failed */
> +	/* Check failed */
>  	regEAC =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bM=
askDWord);
>  	regE94 =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMa=
skDWord);
>  	regE9C =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMas=
kDWord);
> @@ -705,9 +706,9 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
>  	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
>  	struct dm_odm_t *pDM_Odm =3D &pHalData->odmpriv;
> =20
> -	/*  Save RF Path */
> +	/* Save RF Path */
>  	Path_SEL_BB =3D PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord);
> -    /* leave IQK mode */
> +	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
>  	/* switch to path B */
> @@ -741,7 +742,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
>  	/* LO calibration setting */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a911);
> =20
> -    /* enter IQK mode */
> +	/* enter IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
> =20
>  	/* switch to path B */
> @@ -762,10 +763,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *pada=
pter, bool configPathB)
>  	/* GNT_BT =3D 1 */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
> =20
> -    /* leave IQK mode */
> +	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> -	/*  Check failed */
> +	/* Check failed */
>  	regEAC =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bM=
askDWord);
>  	regE94 =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMa=
skDWord);
>  	regE9C =3D PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMas=
kDWord);
> @@ -819,7 +820,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapt=
er, bool configPathB)
>  	/* LO calibration setting */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rIQK_AGC_Rsp, bMaskDWord, 0x0046a8d1);
> =20
> -    /* enter IQK mode */
> +	/* enter IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
> =20
>  	/* switch to path B */
> @@ -839,10 +840,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *pada=
pter, bool configPathB)
>  	/* GNT_BT =3D 1 */
>  	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00001800);
> =20
> -    /* leave IQK mode */
> +	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
> =20
> -	/*  Check failed */
> +	/* Check failed */
>  	regEAC =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bM=
askDWord);
>  	regEA4 =3D PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, b=
MaskDWord);
> =20
> @@ -913,7 +914,7 @@ static void _PHY_PathAFillIQKMatrix8723B(
>  		pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL] =3D PHY_QueryBB=
Reg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskDWord);
> =20
>  		if (bTxOnly) {
> -			/*  <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
> +			/* <20130226, Kordan> Saving RxIQC, otherwise not initialized. */
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] =3D rOFDM0_RxI=
QExtAnta;
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] =3D 0xfffffff =
& PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
>  			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] =3D rOFDM0_XAR=
xIQImbalance;
> @@ -1009,10 +1010,10 @@ static void _PHY_PathBFillIQKMatrix8723B(
>  	}
>  }
> =20
> -/*  */
> -/*  2011/07/26 MH Add an API for testing IQK fail case. */
> -/*  */
> -/*  MP Already declare in odm.c */
> +/* */
> +/* 2011/07/26 MH Add an API for testing IQK fail case. */
> +/* */
> +/* MP Already declare in odm.c */
> =20
>  void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
>  {
> @@ -1290,14 +1291,14 @@ static void phy_IQCalibrate_8723B(
>  	};
>  	const u32 retryCount =3D 2;
> =20
> -	/*  Note: IQ calibration must be performed after loading */
> -	/* 		PHY_REG.txt , and radio_a, radio_b.txt */
> +	/* Note: IQ calibration must be performed after loading */
> +	/* PHY_REG.txt , and radio_a, radio_b.txt */
> =20
>  	/* u32 bbvalue; */
> =20
>  	if (t =3D=3D 0) {
> =20
> -		/*  Save ADDA parameters, turn Path A ADDA on */
> +		/* Save ADDA parameters, turn Path A ADDA on */
>  		_PHY_SaveADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrateIn=
fo.ADDA_backup, IQK_ADDA_REG_NUM);
>  		_PHY_SaveMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrate=
Info.IQK_MAC_backup);
>  		_PHY_SaveADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalib=
rateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
> @@ -1325,11 +1326,11 @@ static void phy_IQCalibrate_8723B(
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x60f=
bd);
> =20
> -/* path A TX IQK */
> +	/* path A TX IQK */
>  	for (i =3D 0 ; i < retryCount ; i++) {
>  		PathAOK =3D phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
>  		if (PathAOK =3D=3D 0x01) {
> -			/*  Path A Tx IQK Success */
> +			/* Path A Tx IQK Success */
>  			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
>  			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] =3D PHY_QueryRFReg(pDM_Odm-=
>Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
> =20
> @@ -1361,7 +1362,7 @@ static void phy_IQCalibrate_8723B(
>  		for (i =3D 0 ; i < retryCount ; i++) {
>  			PathBOK =3D phy_PathB_IQK_8723B(padapter);
>  			if (PathBOK =3D=3D 0x01) {
> -				/*  Path B Tx IQK Success */
> +				/* Path B Tx IQK Success */
>  				PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
>  				pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_B] =3D PHY_QueryRFReg(pDM_Odm=
->Adapter, RF_PATH_B, 0x8, bRFRegOffsetMask);
> =20
> @@ -1388,17 +1389,16 @@ static void phy_IQCalibrate_8723B(
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0);
> =20
>  	if (t !=3D 0) {
> -		/*  Reload ADDA power saving parameters */
> +		/* Reload ADDA power saving parameters */
>  		_PHY_ReloadADDARegisters8723B(padapter, ADDA_REG, pDM_Odm->RFCalibrate=
Info.ADDA_backup, IQK_ADDA_REG_NUM);
> =20
> -		/*  Reload MAC parameters */
> +		/* Reload MAC parameters */
>  		_PHY_ReloadMACRegisters8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibra=
teInfo.IQK_MAC_backup);
> =20
>  		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCal=
ibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
> =20
> -
>  		/* Allen initial gain 0xc50 */
> -		/*  Restore RX initial gain */
> +		/* Restore RX initial gain */
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0xc50, bMaskByte0, 0x50);
>  		PHY_SetBBReg(pDM_Odm->Adapter, 0xc50, bMaskByte0, tmp0xc50);
>  		if (is2T) {
> @@ -1426,8 +1426,8 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *=
pDM_Odm, bool is2T)
> =20
>  	if ((tmpReg&0x70) !=3D 0)			/* Deal with contisuous TX case */
>  		rtw_write8(pDM_Odm->Adapter, 0xd03, tmpReg&0x8F);	/* disable all conti=
nuous TX */
> -	else							/*  Deal with Packet TX case */
> -		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0xFF);		/*  block all queues=
 */
> +	else							 /* Deal with Packet TX case */
> +		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0xFF); /* block all queues *=
/
> =20
>  	if ((tmpReg&0x70) !=3D 0) {
>  		/* 1. Read original RF mode */
> @@ -1451,14 +1451,14 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t=
 *pDM_Odm, bool is2T)
>  	LC_Cal =3D PHY_QueryRFReg(padapter, RF_PATH_A, RF_CHNLBW, bMask12Bits);
> =20
>  	/* 4. Set LC calibration begin	bit15 */
> -	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFB=
E0); /*  LDO ON */
> +	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFB=
E0); /* LDO ON */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_Ca=
l|0x08000);
> =20
>  	mdelay(100);
> =20
> -	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFF=
E0); /*  LDO OFF */
> +	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xB0, bRFRegOffsetMask, 0xDFF=
E0); /* LDO OFF */
> =20
> -	/*  Channel 10 LC calibration issue for 8723bs with 26M xtal */
> +	/* Channel 10 LC calibration issue for 8723bs with 26M xtal */
>  	if (pDM_Odm->SupportInterface =3D=3D ODM_ITRF_SDIO && pDM_Odm->PackageT=
ype >=3D 0x2) {
>  		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_CHNLBW, bMask12Bits, LC_C=
al);
>  	}
> @@ -1472,7 +1472,7 @@ static void phy_LCCalibrate_8723B(struct dm_odm_t *=
pDM_Odm, bool is2T)
>  		/* Path-B */
>  		if (is2T)
>  			PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, RF_AC, bMask12Bits, RF_Bmod=
e);
> -	} else /*  Deal with Packet TX case */
> +	} else /* Deal with Packet TX case */
>  		rtw_write8(pDM_Odm->Adapter, REG_TXPAUSE, 0x00);
>  }
> =20
> @@ -1516,7 +1516,7 @@ void PHY_IQCalibrate_8723B(
>  	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
>  		return;
> =20
> -	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (r=
equired by Edlu) */
> +	/* 20120213<Kordan> Turn on when continuous Tx to pass lab testing. (re=
quired by Edlu) */
>  	if (bSingleTone || bCarrierSuppression)
>  		return;
> =20
> @@ -1533,7 +1533,7 @@ void PHY_IQCalibrate_8723B(
> =20
>  		path =3D (PHY_QueryBBReg(pDM_Odm->Adapter, rS0S1_PathSwitch, bMaskByte=
0) =3D=3D 0x00) ? RF_PATH_A : RF_PATH_B;
> =20
> -		/*  Restore TX IQK */
> +		/* Restore TX IQK */
>  		for (i =3D 0; i < 3; ++i) {
>  			offset =3D pRFCalibrateInfo->TxIQC_8723B[path][i][0];
>  			data =3D pRFCalibrateInfo->TxIQC_8723B[path][i][1];
> @@ -1544,7 +1544,7 @@ void PHY_IQCalibrate_8723B(
>  			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
>  		}
> =20
> -		/*  Restore RX IQK */
> +		/* Restore RX IQK */
>  		for (i =3D 0; i < 2; ++i) {
>  			offset =3D pRFCalibrateInfo->RxIQC_8723B[path][i][0];
>  			data =3D pRFCalibrateInfo->RxIQC_8723B[path][i][1];
> @@ -1654,8 +1654,8 @@ void PHY_IQCalibrate_8723B(
>  			_PHY_PathBFillIQKMatrix8723B(padapter, bPathBOK, result, final_candid=
ate, (RegEC4 =3D=3D 0));
>  	}
> =20
> -/* To Fix BSOD when final_candidate is 0xff */
> -/* by sherry 20120321 */
> +	/* To Fix BSOD when final_candidate is 0xff */
> +	/* by sherry 20120321 */
>  	if (final_candidate < 4) {
>  		for (i =3D 0; i < IQK_MATRIX_REG_NUM; i++)
>  			pDM_Odm->RFCalibrateInfo.iqk_matrix_regs_setting_value[0][i] =3D resu=
lt[final_candidate][i];
> @@ -1692,7 +1692,7 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm=
)
>  	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
>  		return;
> =20
> -	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (r=
equired by Edlu) */
> +	/* 20120213<Kordan> Turn on when continuous Tx to pass lab testing. (re=
quired by Edlu) */
>  	if (bSingleTone || bCarrierSuppression)
>  		return;
> =20

