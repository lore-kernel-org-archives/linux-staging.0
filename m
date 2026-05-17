Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408BD2F8BC0
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029790; cv=none; b=KMuI+yT0SQS8HEqW0OMSGHIi62CbaqWPBaDg2+DsSyFseU/k3Lf2lr1WZnE7Eh/cgXBfdzoZ12AcWIVKJc5qfd0lVwbr0osyNskkf5ypz0dMozzyQKd4JDAzJxIb/Q7tPnk4BtoH4sfOsrBBg1BujVPSSD5QUK/yzvmNX2ye6tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029790; c=relaxed/simple;
	bh=9Yq3oaar/9z6rT6SIsein9mg6C3dj6iNxO9eD68kbOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOy2ppMSLYfN6RLKN4WzKlSdJfw7WOTVM4K2ElwsKI+cklbUqGeoZitIU0Mh//zua6clW5QBzTbmFRmLA96MrNjk5jqDxQaJhlT5kFBHiuO8hjcVlqv+pJR0Oe4OQcRk9g09OQdcm5nG+E3K7up/+XdoiYqwENBGbIfGofUL0y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MBdLEmAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MBdLEmAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54FE2C2BCFB;
	Sun, 17 May 2026 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779029789;
	bh=9Yq3oaar/9z6rT6SIsein9mg6C3dj6iNxO9eD68kbOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBdLEmAwhOfx12dDQRxrU8UpBArv8kuTFZ3SOdsbt4VX73oU3cZXLzjNMwpzzhvFe
	 Db92XMcP/Zvx55lnEQbltEjPHWr9VGHkvsErTCd/kGVq2dYcfICi38d/5LAiRy8+m2
	 hfTTOmHJ1dhx+A3V2Dpsk/G0KJkb10rr3SQWubKU=
Date: Sun, 17 May 2026 16:56:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix missing brace in
 rtw_efuse_read_1_byte
Message-ID: <2026051715-credibly-modulator-6998@gregkh>
References: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
 <20260517143723.13281-5-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517143723.13281-5-mokshpanicker.7@gmail.com>

On Sun, May 17, 2026 at 02:37:23PM +0000, Moksh Panicker wrote:
> Fix missing brace and add space before inline comment in
> rtw_efuse_read_1_byte() to comply with kernel coding style.
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
>  rtw_efuse_read_1_byte
> 
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index ef0cec40d388..a9bbfe2d6fb2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  		return rtw_read8(Adapter, EFUSE_CTRL);
>  	} else {
>  		return 0xFF;
> -
> -} /* rtw_efuse_read_1_byte */
> +	}
> +} /* rtw_efuse_read_1_byte */
>  
>  /*  11/16/2008 MH Read one byte from real Efuse. */
>  u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
> -- 
> 2.34.1
> 
> 

You can not break the build and then fix it in a later patch.  All
patches must never add a warning or a build breakage.

thanks,

greg k-h
