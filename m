Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833513B9D8F
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 16:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667515; cv=none; b=s3EaOulVt0DcYQ7u5toKBGkCxraXjGhvspR/QHWNxHySL++wM56Pvi9mSRjb264/vRZPxpcO8Fhia7OVMSwjwDinEnXL9e7Q63UsvsYg5TVaaJi7g8LmYzOKTMd5kyeOLwvZ+sCNin89hEkzONuNuIofbFY3jN3zrCpe0IKN9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667515; c=relaxed/simple;
	bh=Pzup08ajihVxMtvsEZm593psHmGpryo/JUzTTFidqOc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=UV+dUK1WhwdUs+j2P1i4lCH7wjmoFBYv3+lr8U3wcXq6MR908lvCPbYfb3GesZ6IgMo0vJuRjSv2XueNM/g+cmqVuO58Xa7Mhhn7vmCLzFrXIygyObV3UF0agvHxD5Df2la4Ro6qPSiUdFa1/OUKNbodBwtrh6uQQ4alaO8NBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wxUteqsT; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wxUteqsT"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775667512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFzuMbQwDCJmF7jHA047wFFeMHOFvlF5mPmDEQpd8KY=;
	b=wxUteqsTRxpV6R1Bz2OEpNnrxVzGTXgZUs2k9WflhHowcozLW/ixC1/UEOu+UWOpyE/9H6
	EUdTz5vvfq+3LDpKT9a0H3bliOGg297bjns5wMXe/7qlWGnEXqGQns62NXkahCEFcouOkC
	dmbrnFMeJ9hq4YY0/STHfvkRCqN6Arg=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 18:58:28 +0200
Message-Id: <DHNXLK4XR1QG.1PLA4LV3C26UF@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: <osjin83@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] staging: rtl8723bs: remove unnecessary blank lines
 in rtl8723b_phycfg.c
References: <20260408103208.7682-1-osjin83@gmail.com>
 <20260408103208.7682-4-osjin83@gmail.com>
In-Reply-To: <20260408103208.7682-4-osjin83@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 8, 2026 at 12:32 PM CEST, osjin83 wrote:
> From: tas0dev <osjin83@gmail.com>
>
> Remove unnecessary blank lines throughout rtl8723b_phycfg.c to clean
> up the code and adhere to the Linux kernel coding style.
>
> Signed-off-by: tas0dev <osjin83@gmail.com>
Your Signed-off-by tag must use you real name(First Last) to comply=20
with the Developers Certificate of Origin. You should also use your
real name for sending emails.
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/st=
aging/rtl8723bs/hal/rtl8723b_phycfg.c
> index 498f7b25a2b5..10eb96105f83 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> @@ -25,7 +25,6 @@ static	u32 phy_CalculateBitShift(u32 BitMask)
>  	return i;
>  }
> =20
> -
>  /**
>   * PHY_QueryBBReg_8723B - Read "specific bits" from BB register.
>   * @Adapter:
> @@ -46,10 +45,8 @@ u32 PHY_QueryBBReg_8723B(struct adapter *Adapter, u32 =
RegAddr, u32 BitMask)
>  	BitShift =3D phy_CalculateBitShift(BitMask);
> =20
>  	return (OriginalValue & BitMask) >> BitShift;
> -
>  }
> =20
> -
>  /**
>   * PHY_SetBBReg_8723B - Write "Specific bits" to BB register (page 8~).
>   * @Adapter:
> @@ -80,10 +77,8 @@ void PHY_SetBBReg_8723B(
>  	}
> =20
>  	rtw_write32(Adapter, RegAddr, Data);
> -
>  }
> =20
> -
>  /*  */
>  /*  2. RF register R/W API */
>  /*  */
> @@ -141,7 +136,6 @@ static u32 phy_RFSerialRead_8723B(
>  		retValue =3D PHY_QueryBBReg(Adapter, pPhyReg->rfLSSIReadBack | Maskfor=
PhySet, bLSSIReadBackData);
>  	}
>  	return retValue;
> -
>  }
> =20
>  /**
> @@ -210,7 +204,6 @@ static void phy_RFSerialWrite_8723B(
>  	PHY_SetBBReg(Adapter, pPhyReg->rf3wireOffset, bMaskDWord, DataAndAddr);
>  }
> =20
> -
>  /**
>   * PHY_QueryRFReg_8723B - Query "Specific bits" to RF register (page 8~)=
.
>   * @Adapter:
> @@ -272,12 +265,10 @@ void PHY_SetRFReg_8723B(
>  	phy_RFSerialWrite_8723B(Adapter, eRFPath, RegAddr, Data);
>  }
> =20
> -
>  /*  */
>  /*  3. Initial MAC/BB/RF config by reading MAC/BB/RF txt. */
>  /*  */
> =20
> -
>  /*----------------------------------------------------------------------=
-------
>   * PHY_MACConfig8192C - Config MAC by header file or parameter file.
>   *
> @@ -329,7 +320,6 @@ static void phy_InitBBRFRegisterDefinition(struct ada=
pter *Adapter)
>  	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBack =3D rFPGA0_XB_LSSIReadBac=
k;
>  	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBackPi =3D TransceiverA_HSPI_R=
eadback;
>  	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBackPi =3D TransceiverB_HSPI_R=
eadback;
> -
>  }
> =20
>  static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
> @@ -373,7 +363,6 @@ static int phy_BB8723b_Config_ParaFile(struct adapter=
 *Adapter)
>  	return _SUCCESS;
>  }
> =20
> -
>  int PHY_BBConfig8723B(struct adapter *Adapter)
>  {
>  	int	rtStatus =3D _SUCCESS;
> @@ -614,7 +603,6 @@ static void phy_PostSetBwMode8723B(struct adapter *Ad=
apter)
>  	u8 SubChnlNum =3D 0;
>  	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
> =20
> -
>  	/* 3 Set Reg668 Reg440 BW */
>  	phy_SetRegBW_8723B(Adapter, pHalData->CurrentChannelBW);
> =20
> @@ -725,13 +713,11 @@ static void PHY_HandleSwChnlAndSetBW8723B(
>  	if (!pHalData->bSetChnlBW && !pHalData->bSwChnl)
>  		return;
> =20
> -
>  	if (pHalData->bSwChnl) {
>  		pHalData->CurrentChannel =3D ChannelNum;
>  		pHalData->CurrentCenterFrequencyIndex1 =3D ChannelNum;
>  	}
> =20
> -
>  	if (pHalData->bSetChnlBW) {
>  		pHalData->CurrentChannelBW =3D ChnlWidth;
>  		pHalData->nCur40MhzPrimeSC =3D ExtChnlOffsetOf40MHz;

