Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1498D302753
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667465; cv=none; b=N8pCX/vX/f2IrbR0Mk7egKb/NuD9bGHKx2FTkU3HUkYNJtEcxasUvHwviS3VGJmnsutnQGQSNV2D+0mqqFpCzcZZUGPWfH0dt6I1xkebF4LQ5Cp+re+wGP7Ogwxl3+/TX7G1rea0Z0rpHlLpfL4uCdOZ1abAUVN0C1f7uXZmNiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667465; c=relaxed/simple;
	bh=HC/DTZiKAAnQt9QqE6oAnGSymTt5PfZeIikVKnurgBQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Y6ZNb45Ux36FCn++PDE8+kgZGQsVRM0uXNNoC78ghNbhhXfYbZ7fColezmdBHHNk9gkdy1CC0I7ilcOVIwrOlzeijkcbcie7BNceUmB0++X/j4u72TtGvGpy92aL87Pisa9AHtaQRe+mG2vfAwSrl+6ritPKAUcGHQfaFzXQBfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xGLc3975; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xGLc3975"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775667461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/1Mik6iYS9EPbWnLt49dNFEcOBay8gsVfhomPjFcnk=;
	b=xGLc397505xo2/WAlAvqRFcca4T5aKmOi6GHTusccgawhFsJG+C55n3QXS8wCClBmbJzeF
	FlVsdeQtzlUXUpFlvAD+Wn+l7pSjb04/pXxkNg/DXHVZ7YFRnA//Bw3JJxb+YlOcAYMXRX
	i2mG2JNUIFmbflkG8BtaofRJ7+OibUU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 18:57:30 +0200
Message-Id: <DHNXKTBLBK9W.2GG4M9TF56191@linux.dev>
To: <osjin83@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] staging: rtl8723bs: fix casting and alignment
 spacing in rtl8723b_phycfg.c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260408103208.7682-1-osjin83@gmail.com>
 <20260408103208.7682-3-osjin83@gmail.com>
In-Reply-To: <20260408103208.7682-3-osjin83@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 8, 2026 at 12:32 PM CEST, osjin83 wrote:
> From: tas0dev <osjin83@gmail.com>
>
> Clean up spacing issues related to type casting and function parameter
> alignment as flagged by checkpatch.pl.
>
> Specifically, this patch:
> - Removes the unnecessary space between a type cast and the variable,
>   changing "(u8) value" to "(u8)value".
> - Adjusts the alignment of arguments in function calls to match the
>   open parenthesis.
Also is this above same as thing under this comment as it accounts=20
for the same change?
> - Standardizes the formatting of multi-line function parameters for
>   better readability.
You should follow the rule of atomic patch per logical change, which=20
means that you should split this patch into multiple patches. One
for unnecessary spaces and one for breaking rtw_write8 line.
>
> These changes are stylistic improvements and have no impact on the
> runtime logic of the driver.
>
> Signed-off-by: tas0dev <osjin83@gmail.com>
Your Signed-off-by tag must use you real name(First Last) to comply=20
with the Developers Certificate of Origin. You should also use your
real name for sending emails.
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/st=
aging/rtl8723bs/hal/rtl8723b_phycfg.c
> index cfa00775341b..498f7b25a2b5 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
> @@ -395,7 +395,8 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
> =20
>  	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
> =20
> -	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL|FEN_PCIEA|FEN_DIO_PCIE|FE=
N_BB_GLB_RSTn|FEN_BBRSTB);
> +	rtw_write8(Adapter, REG_SYS_FUNC_EN,
> +		   FEN_PPLL | FEN_PCIEA | FEN_DIO_PCIE | FEN_BB_GLB_RSTn | FEN_BBRSTB)=
;
> =20
>  	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
> =20
> @@ -531,7 +532,7 @@ u8 PHY_GetTxPowerIndex(
>  	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
>  	s8 txPower =3D 0, powerDiffByRate =3D 0, limit =3D 0;
> =20
> -	txPower =3D (s8) PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWi=
dth, Channel);
> +	txPower =3D (s8)PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWid=
th, Channel);
>  	powerDiffByRate =3D PHY_GetTxPowerByRate(padapter, RF_PATH_A, Rate);
> =20
>  	limit =3D phy_get_tx_pwr_lmt(
> @@ -551,7 +552,7 @@ u8 PHY_GetTxPowerIndex(
>  	if (txPower > MAX_POWER_INDEX)
>  		txPower =3D MAX_POWER_INDEX;
> =20
> -	return (u8) txPower;
> +	return (u8)txPower;
>  }
> =20
>  void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 Channel)

