Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC427FB2D
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349287; cv=none; b=Jy5FI24WSKn+6E09AhTaFWNFDznYrLNFeH1rAGEYi3eoahji0OkmVIN9c6i+XJVqf8IbzesNC3zeiTNIugmUjyGn1ISKDtpS5lU4CLl6GfpzorSCkeekEhEdUZcYsmKDKO2gEKQ3+OHK9ytSC/c693LyNujMEQmXl92TX4/hGM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349287; c=relaxed/simple;
	bh=Sc+b77pFNji4q0msqqATyGLZmiPeXTUJ5IWhoftIRc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx3UAuYe/zpYIaJzsr6hRtk9lGBLQw7Hg5M4PGLKLze7nfpaoK3qbiQUOfnrIa+CTvtY5HGJ4Nn5p/KD4JQmhP8U4TuuDAI03deoJwU4MZGzQJXR74777XVtdHwdXVWvn0lcQlMYA6QnPvnQlLMcU4OyxrgcopNKxgbloujh7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MuMlmjge; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MuMlmjge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC08C4CEF4;
	Thu, 24 Jul 2025 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753349286;
	bh=Sc+b77pFNji4q0msqqATyGLZmiPeXTUJ5IWhoftIRc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MuMlmjge7O/bc6RvFXheLdPVsDsQunWapbumU4yujzyLr/XBbMM7xNZ71rh31gpUP
	 2wu6DO2fUBZdwTw8A5qjwtvtp2d1memfti5du/kJez2GOBkmKprrtTiTSxKYREutyp
	 Tp3wefhe7oyQFub9a+cyDvkSKebFb654+KvGpm7I=
Date: Thu, 24 Jul 2025 11:28:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: remove unnecessary commented
 code in rtl8723b_cmd
Message-ID: <2025072421-landfall-laboring-78a6@gregkh>
References: <20250716175113.81519-1-ignacio.pena87@gmail.com>
 <20250716175113.81519-2-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716175113.81519-2-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 01:51:13PM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Remove commented out code that serves no purpose, as suggested by
> Greg KH. This includes both single line comments and block comments
> that are not providing useful documentation.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
> Changes in v2:
> - Remove entire commented blocks instead of just fixing formatting
> - Combined comment removal patches as they serve the same purpose
> 
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index abc123def..def456abc 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -78,7 +78,6 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
>  		else {
>  			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
>  			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
> -/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
>  		}
>  
>  		*(u8 *)(&h2c_cmd) |= ElementID;
> @@ -433,16 +432,6 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
>  
>  		}
>  
> -/* offload to FW if fw version > v15.10
> -		pmlmeext->DrvBcnEarly = 0;
> -		pmlmeext->DrvBcnTimeOut =7;
> -
> -		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
> -			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
> -*/
> -
> -	}
> -

Does this build?

It doesn't apply, so it doesn't matter much :)

thanks,

greg k-h
