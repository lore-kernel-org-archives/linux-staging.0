Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525C3C6A38;
	Tue, 28 Jul 2026 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223900; cv=none; b=Qs0+Z93PHKOyJ28YMBqfzr75D4/O2fcMMY06dwBQywF+Ua/XCwu0JG7Xm5v+GzLv5Srnal6wZ7Q2gSdiS2ClyD7yJ91PbHTZgKkkgsUkGRO6m3EpXTuQSOzMCByqrWwoR+Wwr33kVglXrAzf1nejNh3l+uc7ZIGURjg6TG8ok7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223900; c=relaxed/simple;
	bh=JPzv7KGdpomMDR11htv6Ew+iuN9LEWpoMQ+ZNUbX5IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJn5eP6G77QOQYUQHEznZ92YCOdachbmC3VbDPTrwifqBaR/30gSW5PvS7HCGKSr71mUE9umxOXdhaFR/H4RGs4mZzwEh6FpneRM28A/FO53wE2TP4FBwam27QloYBoyQFTaH54GmlVGFV20ty6ElDxXdDEwVls5R6loiHlUAJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zwBoeVtZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zwBoeVtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52B41F000E9;
	Tue, 28 Jul 2026 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223899;
	bh=1wDkKvHPhtqCdW0/ObFpehbYuHnQvIc+rwyD+1RqN80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zwBoeVtZVBBrY+01/OQWMx5EpUKFngAhLwewIKJFPNlHvTOiIJJaQl8LMESlJnKQZ
	 nYwJz5ZPUFLbppEcJGvl6zMJCVQ7LIu4Gczs27a2QFL7zUzr8Sn8RmUcFzg6hZce/0
	 MNQHx8nO4BHId2X0Wr0pzgRNVhQR+wKkHvvY0v9I=
Date: Tue, 28 Jul 2026 09:31:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix space before tab in comments
Message-ID: <2026072811-payback-smoked-0f3a@gregkh>
References: <20260720162014.641937-1-pratapyashkulshrestha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162014.641937-1-pratapyashkulshrestha@gmail.com>

On Mon, Jul 20, 2026 at 09:50:14PM +0530, Yash Pratap Kulshrestha wrote:
> Remove a stray space before a tab in two comments in
> rtl8723b_dm.c, fixing a checkpatch.pl warning.
> 
> Signed-off-by: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
> ---
> v2: rebase onto current master (v7.2-rc4), no content changes
> 
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> index 2276dc1cb44a..4fdda25969f9 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> @@ -42,7 +42,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
>  
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
> -	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
> +	/* ODM_CMNINFO_BINHCT_TEST only for MP Team */
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
>  
>  	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
> @@ -80,7 +80,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
>  	/*  Pointer reference */
>  	/*  */
>  	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
> -	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
> +	/* ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
>  
>  	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
>  
> -- 
> 2.55.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
