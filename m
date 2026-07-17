Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42F23ACA4B;
	Fri, 17 Jul 2026 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290550; cv=none; b=DToAA0myHO6MUIG7XF1xMhdtMDOsffpGXcPlcrA3tvsHhTndQXJrcNlKbB0hvsDlhCsk3t1O6Kqxq0u3+izT2tCWaaidRR/tdP1FbEsjITQfd0riPQ8dvdVrNy9T/ChaKHN+bSNyHwxebocLjwM9cTS/hB7yaKJfBG2GcB9zF5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290550; c=relaxed/simple;
	bh=mpcFaNVK+3RU1N/s/ukAzZKQR/7A5MN/O3J+5Yw08c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rwhh5x1z2yQB+ZGPdZEiXxwL0xN7/0Cl0JnCZn9dFrLk2V7DslVMMo1eXOX1Dst9+aioSu0HL/duCItVxaUXpLXQ1nCYO/j9cBtdPnkJierTUg6nSUSrpSEnDmRTE0SZChu1YbUhMswoHMpXY6LHFwG2KACXarE0Ht+LVcFweHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X3MQidWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X3MQidWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019FA1F000E9;
	Fri, 17 Jul 2026 12:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784290549;
	bh=aQldS0q4EByQzo1Z0/1iSD0jA8WmXvdMUQPBMBpymhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X3MQidWvQ1S/fChM6RHNYJ8dP6SsZ0MYk2NmNJHL4nimVfXn2bfFwgZcigT5+SrsB
	 8IMcBwmc+0LxKQ/Rt8u5fDqV3s5rKpT2k9uhPi3VX1wvRwc7dql9HLdVf1LAN2J7fN
	 KTinwln+XwHT6orMHJ1Q38bZ9D3ENRfxQCuByzu8=
Date: Fri, 17 Jul 2026 14:15:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in
 HalPhyRf_8723B.c
Message-ID: <2026071727-jingling-bacteria-51ca@gregkh>
References: <20260713162020.2478175-1-pratapyashkulshrestha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713162020.2478175-1-pratapyashkulshrestha@gmail.com>

On Mon, Jul 13, 2026 at 09:50:20PM +0530, Yash Pratap Kulshrestha wrote:
> Remove stray spaces before tabs throughout HalPhyRf_8723B.c,
> fixing checkpatch.pl warnings. Most of them were comments but
> some of them were variable declarations with unusual indents
> having mixed space/tab alignments.
> 
> Signed-off-by: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 116 +++++++++---------
>  1 file changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 70b68f473d58..ebebc202971c 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -354,14 +354,14 @@ static u8 phy_PathA_IQK_8723B(
>  	/* leave IQK mode */
>  	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
>  
> -	/* 	enable path A PA in TXIQK mode */
> +	/* enable path A PA in TXIQK mode */
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
>  	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
> -	/* 	disable path B PA in TXIQK mode */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
> -/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
> +	/* disable path B PA in TXIQK mode */
> +/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
> +/* PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */

That doesn't look correct anymore, right?

Why keep these lines at all?

thanks,

greg k-h
