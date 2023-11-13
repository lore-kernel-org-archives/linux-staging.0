Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE44C86
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 01:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B68dmU3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B82C433C8;
	Mon, 13 Nov 2023 01:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699839232;
	bh=0yF8+FZ7zcKN6WWD9Rf8ykvgtqY4RokjqwbcvQjsePU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B68dmU3x2+OXvxUvTRXSBZ3YE1pBtVRdrYa/acvjQ8GFiZdFh1MoN9JqiPzQZkx20
	 sZqIf/Cp/QLzMXHKQmR3AWsdV1V5g6BQEv0I6M1Vx7GCagZEJyq/N4LRX4oo7Cugu3
	 oDjN2MmL6qsY525A9Q1sMI7GYJrM5KFct+IO8+2M=
Date: Sun, 12 Nov 2023 20:33:51 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch no spaces before tabs
 warning
Message-ID: <2023111255-flaccid-derby-b7b3@gregkh>
References: <20231112185710.101990-1-wiktor.grzywacz@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112185710.101990-1-wiktor.grzywacz@3mdeb.com>

On Sun, Nov 12, 2023 at 07:57:10PM +0100, Wiktor Grzywacz wrote:
> There is some old commented out code, that triggers
> a checkpatch.pl no spaces before tabs warning.
> 
> Signed-off-by: Wiktor Grzywacz <wiktor.grzywacz@3mdeb.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> index 2028791988e7..eb4e4f44d4cb 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
> @@ -46,7 +46,6 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
>  
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
> -	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
>  	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);

Deleting that commit seems odd, why did you do that?  why not just fix
this properly?


>  
>  	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
> @@ -83,8 +82,6 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
>  	/*  */
>  	/*  Pointer reference */
>  	/*  */
> -	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
> -	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */

Why delete one comment and then one line of commented out code?

thanks,

greg k-h
