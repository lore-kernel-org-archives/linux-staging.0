Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FF37C10F
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666972; cv=none; b=AnzZISW7hhu3ujxD/lvCPIhfnGfYi7zFbVWawMI8trXAItIHQ3hJZK7kEfnghucIaV1P1XGsmgXW3MVzj1kba/c3a14PKcLs8Ldzdq04QxVeGf6+9MIHn9uB9lMQzEPpK0tU/CtS8sdyi7AoWOZ9HqmpICIBP7B8cePXjqrJT4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666972; c=relaxed/simple;
	bh=gQcuDxltatQ2fD3H6jFUX9M7tNM7/8EIXV05Cq2onhk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cKiVUYgtxyAMST4ZmzXHoI+H1ZQNU3dubYYk+rLHVPG9X1tME5HoioXXmKMoM02q652zuQLMkF2g/iF0qEl0axQx0DG0WnTDG37rMDPP3hLQjZNSskNrIEhBp9lFS/FkrkDLEMDOXpROiN4pe7p9jgwm+eFnk/bhOecrn6Ljw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t/2PZPWh; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t/2PZPWh"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775666969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFY/V2nu/f6LLJHxrDVgTfomDyx5vIKBFwJGIjsSfvk=;
	b=t/2PZPWhfyPpHBghj5dYkDImbey4y6bBxPcS7WhRz95fDOmk7ztSXOZWBcHU7hoTCbDN00
	Yv4Bl08h8JIxGQY3htqxhqVuXtZIBANQju3LIgNFo661L32QHN+kdAr/JZaIbPhe+eSXe/
	/Y54ZVwX2QTMb9EaMxP/zsER5GS5R1g=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 18:49:19 +0200
Message-Id: <DHNXEK4HXV6B.11ERHS1TR2LW1@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix spacing around operators in
 rtl8723b_phycfg.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: <osjin83@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20260408103208.7682-1-osjin83@gmail.com>
 <20260408103208.7682-2-osjin83@gmail.com>
In-Reply-To: <20260408103208.7682-2-osjin83@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 8, 2026 at 12:32 PM CEST, osjin83 wrote:
> From: tas0dev <osjin83@gmail.com>
>
> Fix various spacing issues reported by checkpatch.pl to improve code
> readability and conform to the Linux kernel coding style.
>
> Specifically, this patch:
> - Adds missing spaces around binary operators (| , >> , << , + , &).
> - Corrects the spacing in bitwise expressions within function calls.
> - Ensures consistent use of whitespace in arithmetic operations.
>
I think this section above is unnecessary as you have already mentioned=20
that this patch handles spacing.
> These changes are purely cosmetic and do not alter the functional
> behavior of the driver.
>
> Signed-off-by: tas0dev <osjin83@gmail.com>
Your Signed-off-by tag must use you real name(First Last) to comply=20
with the Developers Certificate of Origin. You should also use your
real name for sending emails.
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 44 +++++++++----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/st=
aging/rtl8723bs/hal/rtl8723b_phycfg.c
> index 7fac1c2ba8e0..cfa00775341b 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> @@ -19,7 +19,7 @@ static	u32 phy_CalculateBitShift(u32 BitMask)
>  	u32 i;
> =20
>  	for (i =3D 0; i <=3D 31; i++) {
> -		if (((BitMask>>i) &  0x1) =3D=3D 1)
> +		if (((BitMask >> i) &  0x1) =3D=3D 1)
>  			break;
>  	}
>  	return i;
> @@ -109,18 +109,18 @@ static u32 phy_RFSerialRead_8723B(
>  	NewOffset =3D Offset;
> =20
>  	if (eRFPath =3D=3D RF_PATH_A) {
> -		tmplong2 =3D PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforP=
hySet, bMaskDWord);
> -		tmplong2 =3D (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSS=
IReadEdge;	/* T65 RF */
> -		PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWo=
rd, tmplong2&(~bLSSIReadEdge));
> +		tmplong2 =3D PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | Maskfo=
rPhySet, bMaskDWord);
> +		tmplong2 =3D (tmplong2 & (~bLSSIReadAddress)) | (NewOffset << 23) | bL=
SSIReadEdge;	/* T65 RF */
> +		PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskD=
Word, tmplong2 & (~bLSSIReadEdge));
>  	} else {
> -		tmplong2 =3D PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforP=
hySet, bMaskDWord);
> -		tmplong2 =3D (tmplong2 & (~bLSSIReadAddress)) | (NewOffset<<23) | bLSS=
IReadEdge;	/* T65 RF */
> -		PHY_SetBBReg(Adapter, rFPGA0_XB_HSSIParameter2|MaskforPhySet, bMaskDWo=
rd, tmplong2&(~bLSSIReadEdge));
> +		tmplong2 =3D PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter2 | Maskfo=
rPhySet, bMaskDWord);
> +		tmplong2 =3D (tmplong2 & (~bLSSIReadAddress)) | (NewOffset << 23) | bL=
SSIReadEdge;	/* T65 RF */
> +		PHY_SetBBReg(Adapter, rFPGA0_XB_HSSIParameter2 | MaskforPhySet, bMaskD=
Word, tmplong2 & (~bLSSIReadEdge));
>  	}
> =20
> -	tmplong2 =3D PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPh=
ySet, bMaskDWord);
> -	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWor=
d, tmplong2 & (~bLSSIReadEdge));
> -	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2|MaskforPhySet, bMaskDWor=
d, tmplong2 | bLSSIReadEdge);
> +	tmplong2 =3D PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | Maskfor=
PhySet, bMaskDWord);
> +	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskDW=
ord, tmplong2 & (~bLSSIReadEdge));
> +	PHY_SetBBReg(Adapter, rFPGA0_XA_HSSIParameter2 | MaskforPhySet, bMaskDW=
ord, tmplong2 | bLSSIReadEdge);
> =20
>  	udelay(10);
> =20
> @@ -129,16 +129,16 @@ static u32 phy_RFSerialRead_8723B(
>  	udelay(10);
> =20
>  	if (eRFPath =3D=3D RF_PATH_A)
> -		RfPiEnable =3D (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1|Ma=
skforPhySet, BIT8);
> +		RfPiEnable =3D (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1 | =
MaskforPhySet, BIT8);
>  	else if (eRFPath =3D=3D RF_PATH_B)
> -		RfPiEnable =3D (u8)PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1|Ma=
skforPhySet, BIT8);
> +		RfPiEnable =3D (u8)PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1 | =
MaskforPhySet, BIT8);
> =20
>  	if (RfPiEnable) {
>  		/*  Read from BBreg8b8, 12 bits for 8190, 20bits for T65 RF */
> -		retValue =3D PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBackPi|Maskfor=
PhySet, bLSSIReadBackData);
> +		retValue =3D PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBackPi | Maskf=
orPhySet, bLSSIReadBackData);
>  	} else {
>  		/* Read from BBreg8a0, 12 bits for 8190, 20 bits for T65 RF */
> -		retValue =3D PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack|MaskforPh=
ySet, bLSSIReadBackData);
> +		retValue =3D PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack | Maskfor=
PhySet, bLSSIReadBackData);
>  	}
>  	return retValue;
> =20
> @@ -203,7 +203,7 @@ static void phy_RFSerialWrite_8723B(
>  	/*  */
>  	/*  Put write addr in [5:0]  and write data in [31:16] */
>  	/*  */
> -	DataAndAddr =3D ((NewOffset<<20) | (Data&0x000fffff)) & 0x0fffffff;	/* =
 T65 RF */
> +	DataAndAddr =3D ((NewOffset << 20) | (Data & 0x000fffff)) & 0x0fffffff;=
	/*  T65 RF */
>  	/*  */
>  	/*  Write Operation */
>  	/*  */
> @@ -266,7 +266,7 @@ void PHY_SetRFReg_8723B(
>  	if (BitMask !=3D bRFRegOffsetMask) {
>  		Original_Value =3D phy_RFSerialRead_8723B(Adapter, eRFPath, RegAddr);
>  		BitShift =3D  phy_CalculateBitShift(BitMask);
> -		Data =3D ((Original_Value & (~BitMask)) | (Data<<BitShift));
> +		Data =3D ((Original_Value & (~BitMask)) | (Data << BitShift));
>  	}
> =20
>  	phy_RFSerialWrite_8723B(Adapter, eRFPath, RegAddr, Data);
> @@ -385,11 +385,11 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
> =20
>  	/*  Enable BB and RF */
>  	RegVal =3D rtw_read16(Adapter, REG_SYS_FUNC_EN);
> -	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal|BIT13|BIT0|BIT1));
> +	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal | BIT13 | BIT0 | BIT=
1));
> =20
>  	rtw_write32(Adapter, 0x948, 0x280);	/*  Others use Antenna S1 */
> =20
> -	rtw_write8(Adapter, REG_RF_CTRL, RF_EN|RF_RSTB|RF_SDMRSTB);
> +	rtw_write8(Adapter, REG_RF_CTRL, RF_EN | RF_RSTB | RF_SDMRSTB);
> =20
>  	msleep(1);
> =20
> @@ -397,7 +397,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
> =20
>  	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL|FEN_PCIEA|FEN_DIO_PCIE|FE=
N_BB_GLB_RSTn|FEN_BBRSTB);
> =20
> -	rtw_write8(Adapter, REG_AFE_XTAL_CTRL+1, 0x80);
> +	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
> =20
>  	/*  */
>  	/*  Config BB and AGC */
> @@ -631,7 +631,7 @@ static void phy_PostSetBwMode8723B(struct adapter *Ad=
apter)
> =20
>  		PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x0);
> =20
> -		PHY_SetBBReg(Adapter, rOFDM0_TxPseudoNoiseWgt, (BIT31|BIT30), 0x0);
> +		PHY_SetBBReg(Adapter, rOFDM0_TxPseudoNoiseWgt, (BIT31 | BIT30), 0x0);
>  		break;
> =20
>  	/* 40 MHz channel*/
> @@ -641,11 +641,11 @@ static void phy_PostSetBwMode8723B(struct adapter *=
Adapter)
>  		PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x1);
> =20
>  		/*  Set Control channel to upper or lower. These settings are required=
 only for 40MHz */
> -		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40Mhz=
PrimeSC>>1));
> +		PHY_SetBBReg(Adapter, rCCK0_System, bCCKSideBand, (pHalData->nCur40Mhz=
PrimeSC >> 1));
> =20
>  		PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
> =20
> -		PHY_SetBBReg(Adapter, 0x818, (BIT26|BIT27), (pHalData->nCur40MhzPrimeS=
C =3D=3D HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
> +		PHY_SetBBReg(Adapter, 0x818, (BIT26 | BIT27), (pHalData->nCur40MhzPrim=
eSC =3D=3D HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
>  		break;
>  	default:
>  		break;

