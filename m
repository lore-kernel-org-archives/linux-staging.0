Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D4B3F8881;
	Fri, 17 Jul 2026 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290678; cv=none; b=AVOqKJODROB601HiH+zAFTxRenZB4NLI7FhqrOLfufcx+tROzFXPLX8mbO3Z1rjVLDmZwqratuTSYMejVZLj4Iun7k9v7EFIT/1kQGRdX9WRAd8odXHxcnGoeS0KOj+S/zUgAeaiVOcP2gGgIROwGAVFkVxsY4M42yp5h0v2QW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290678; c=relaxed/simple;
	bh=RUEP2IjOuQRirqHMpr2/iudmHLKQqK4UnM+PioS93T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndIkPszyDsssc0RRRg9sZ4HMvszix1j8yanQ2FySJJOGJG8UgU4Kk89NRt119KnmHpPyLZ6VSYoOQemHnbPKBFNg2kCYDGc1Y8biQes/osNvnNAKreQ8OXJXjfYoNNj01KPGpjmnXALXzIh4LetISLXWWFEecv5uArFfURXlioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fkd70Z5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fkd70Z5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03EAE1F000E9;
	Fri, 17 Jul 2026 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784290674;
	bh=DG/q/3D8xuIJmYplixhkqB1hwGBgOG04ZKaEZ4vWcNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fkd70Z5BrkqEpUQOn7vmNXbdggXe0Ecx7Q3pUazWx5yHBWtzFwwR5417gP72BhohT
	 5njLSkoQf2FJfeU62hVp7hpw9O3NjK+6llXwFGiBOGsTVI+v3Mv2AgficfsppRQ/aZ
	 qFxJWeZRBmT3YCBmi5ARyBv3rJBWnNLxP8738eXs=
Date: Fri, 17 Jul 2026 14:17:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in comments
Message-ID: <2026071734-countless-unfazed-e0d1@gregkh>
References: <20260711172401.243212-1-pratapyashkulshrestha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711172401.243212-1-pratapyashkulshrestha@gmail.com>

On Sat, Jul 11, 2026 at 10:54:01PM +0530, Yash Pratap Kulshrestha wrote:
> Remove a stray space before a tab in two comments in
> rtl8723b_dm.c, fixing a checkpatch.pl warning.
> 
> Signed-off-by: Yash Pratap Kulshrestha <pratapyashkulshrestha@gmail.com>
> ---
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

Does not apply to the latest tree :(
