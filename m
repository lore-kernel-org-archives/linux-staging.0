Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE63D6CA4;
	Mon,  4 May 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906695; cv=none; b=XA4aiCEbrzsa2+5z3OZPg3iaMDyn77KOOO41xTxKMElfOj4OBKAxz8fpaykdbRdlNqFBGTthVyAoO8hkH0bIown2iQxjXs6/Vka7Ha45i7jQzst68Xj8lAXVp0E84d5f43NEmlL37LbHeX3Xbki3tloSvhv7a+TXiKXIqzHf750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906695; c=relaxed/simple;
	bh=J1RaCawFrOi34ZcpPXeTu6CvwP4kcVzKJ+0eWcHY4uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOVL/90BLozkJeakBEfVawP2Uab8udq6aIXCK76TAJ+k5Pfz7f3/itn/RdGf18dUsJGsnigcMyT+J1PP4VucIB96eSLlfpYxdDIb9seoe9hH8sV3D2K/PYxDrCohFTL3ywXZKevmvhNaMAt/B4xj8o65IfF7OiNuGHt4mLGJyUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=roCtShcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="roCtShcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1EEC2BCB8;
	Mon,  4 May 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906694;
	bh=J1RaCawFrOi34ZcpPXeTu6CvwP4kcVzKJ+0eWcHY4uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roCtShcyfKzGhXD+tx66wXB8btfVLd4Fw1YsNjx1YpM2e3dep5zm2AKqlZTQ9pywU
	 ooY6n2SesZrdP/8BhcN0SVeBHmbp3HNd6JJS+T8OPfS20u4C55BKN5rBvZ2DWqJIko
	 GhMNqkLHOvnGq5wWrvph0Eboy4dEj9lj1dJT9I2Q=
Date: Mon, 4 May 2026 16:52:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siwanan Bungtong <horstaufmental@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	straube.linux@gmail.com, ignacio.pena87@gmail.com
Subject: Re: [PATCH 1/2] staging: rtl8723bs: add braces to if/else arms in
 rtw_efuse.c
Message-ID: <2026050433-cube-shrubs-9d80@gregkh>
References: <20260501203121.227992-1-horstaufmental@gmail.com>
 <20260501203121.227992-2-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501203121.227992-2-horstaufmental@gmail.com>

On Sat, May 02, 2026 at 03:31:20AM +0700, Siwanan Bungtong wrote:
> Add missing braces to if/else statements to comply with kernel
> coding style and improve readability.
> 
> No functional changes.
> 
> Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 099320e4eb50..7600b723fda3 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -76,9 +76,9 @@ u16		Address)
>  				break;
>  		}
>  		return rtw_read8(Adapter, EFUSE_CTRL);
> -	} else
> +	} else {
>  		return 0xFF;
> -
> +	}
>  } /* EFUSE_Read1Byte */
>  
>  /*  11/16/2008 MH Read one byte from real Efuse. */
> -- 
> 2.53.0
> 
> 

Does not apply to my tree :(
