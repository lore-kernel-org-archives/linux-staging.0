Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F38346ADE;
	Sun,  8 Feb 2026 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770567092; cv=none; b=PJpIDuCoxnQXvKCCW3K3fy8CAq27o3MFbgsbhKz3K6RmyVKvEtBDAtC+/mwJDsD3EErFjwzwiSZ7AsDj49xz6+JI9yNUqZp9qVh4o0u4bIrW7YRY13ZQh/7vK9LUfOxzpCqRuDx2mvP2kyk+QyQI6SnttIqKsxbf1xPgfsy628A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770567092; c=relaxed/simple;
	bh=dI/dB63ZYoZgAv4cYKINIQz6DSgHiqmMo8+ykrkbiJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpJUkEZy5vgWF9+HCfaF9UOPOeYmw0CMxjmlxVRWqyOAENhA3GODBUAfru5b97ImfsdIcCnV5t2BCPCQhQ0ryN92xCZgpYewDEyUYa+SRkA5ouyTN/Z1LZD+7BbA6LKK15B1Ji1/Mc3GNKDOCgmdgqIZnfuK9FFyR0mRPHkep/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nHCp2z9z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nHCp2z9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508B7C4CEF7;
	Sun,  8 Feb 2026 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770567091;
	bh=dI/dB63ZYoZgAv4cYKINIQz6DSgHiqmMo8+ykrkbiJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHCp2z9z4rMSzoH9qwN5UWLXc3KPT2TXDOKCzUdm837sjnzdgloIaAvHb4BL7nnqy
	 qZ6UcKNsEUCwBX7HlXvEJdk3dRjE59bIPFpTggzJhrf0SPaVtRzidEOFE4s8gsGVC6
	 yTcrlBGOmSt2TPHPgMwwrqtM66WxEvdoYZmGcd1U=
Date: Sun, 8 Feb 2026 17:11:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Filippo =?iso-8859-1?Q?Muscher=E0?= <filippo.muschera@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	b9788213@gmail.com, straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix inconsistent indentation
 detected by smatch
Message-ID: <2026020802-transform-ducking-ea25@gregkh>
References: <20260208154734.12747-1-filippo.muschera@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260208154734.12747-1-filippo.muschera@gmail.com>

On Sun, Feb 08, 2026 at 04:47:34PM +0100, Filippo Muscherà wrote:
> Fix the following inconsistent indentation warnings reported by Smatch:
> 
> drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2319
>   EXhalbtc8723b1ant_ConnectNotify(): inconsistent indenting
> drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c:1410
>   phy_IQCalibrate_8723B(): inconsistent indenting
> 
> The affected code used a mix of tabs and spaces or excessive
> indentation, making it misleading to read. Align the lines with the
> surrounding code using tabs.
> 
> While at it, wrap long lines in HalPhyRf_8723B.c to silence checkpatch
> warnings.
> 
> Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 2 +-
>  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c  | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> index b3d7f50fac4c..1af101ba9752 100644
> --- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> +++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> @@ -2316,7 +2316,7 @@ void EXhalbtc8723b1ant_ConnectNotify(struct btc_coexist *pBtCoexist, u8 type)
>  
>  	if (type == BTC_ASSOCIATE_START) {
>  		pCoexSta->bWiFiIsHighPriTask = true;
> -		 pCoexDm->nArpCnt = 0;
> +		pCoexDm->nArpCnt = 0;
>  	} else {
>  		pCoexSta->bWiFiIsHighPriTask = false;
>  		/* pCoexDm->nArpCnt = 0; */
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 9df3274c1048..efa5faf9ffdf 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -1407,8 +1407,10 @@ static void phy_IQCalibrate_8723B(
>  			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
>  			pDM_Odm->RFCalibrateInfo.TxLOK[RF_PATH_A] = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x8, bRFRegOffsetMask);
>  
> -				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16;
> -				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16;
> +			result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, 
> +										   bMaskDWord) & 0x3FF0000) >> 16;
> +			result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, 
> +										   bMaskDWord) & 0x3FF0000) >> 16;

You just added coding style issues here :(

Always run your patch through checkpatch.pl before sending it.

thanks,

greg k-h
