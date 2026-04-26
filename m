Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FD363C7F;
	Mon, 27 Apr 2026 03:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261881; cv=none; b=rqwoMEUNuH6WHGgNJcI1ozCT36TTaL+q1oW7Cnaor60QHwTinY2Dx/3lfnssJmGUbMKligDx+QG3EGf4+lA4hOSjG1J1dojUmXNVEMD/4OU7DRfgtdbrLmfdo8UTioK1pkvOrXNrbIiqWWHaZUG6ooVnR+QInqdVXQzdbNnVRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261881; c=relaxed/simple;
	bh=GA1D/bDduRnzj/P0dqqXacRvqqW1K9suoflMw6lsVzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiWTsEHlIQRo24/gZ8aZUxzf9yZ5MM5yzTa73Fz+5oWh8DornFBFzWnzR3LhbNlBCkpYqgw1xi9xWSSmJXusiN8ZFK/JO2znVmN38dy9EP7Dq1feFUBcnE57RqxjjKAU/EDfbvM+ytQP9LWnc8x+YJJFzyZWwShd37mjfZglzUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uuSvQEXy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uuSvQEXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F19C19425;
	Mon, 27 Apr 2026 03:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261881;
	bh=GA1D/bDduRnzj/P0dqqXacRvqqW1K9suoflMw6lsVzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uuSvQEXyjzIbRHwbeMDgf8H4tA2plLcIA9zOuWyKfG4cM0WVWLRkGQsLjre6MLAzH
	 WuS+At99NVi3yETZv9sJIZam9Edsz8SIHwgpqipA6DKx169Gu1fflNPE0U+2NFsaty
	 JHszWnX1AeGw049A8ZL0GzidW/AgZRMLyKYh78Cs=
Date: Sun, 26 Apr 2026 22:04:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 03/11] staging: rtl8723bs: os_dep: fix spacing around
 operators
Message-ID: <2026042621-italics-landfall-82b9@gregkh>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
 <20260413101432.158925-4-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413101432.158925-4-luka.gejak@linux.dev>

On Mon, Apr 13, 2026 at 12:14:24PM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> Fix spaces around operators in the os_dep directory to adhere to the
> Linux kernel coding style. This resolves multiple spacing warnings
> reported by checkpatch.pl.
> 
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
>  drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d0feb28b7043..95523c3a508b 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -77,7 +77,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
>  
>  	sdio_release_host(func);
>  
> -	return err?_FAIL:_SUCCESS;
> +	return err ? _FAIL : _SUCCESS;
>  }
>  
>  static void sdio_free_irq(struct dvobj_priv *dvobj)
> diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
> index f9c4d487badf..ce835802c442 100644
> --- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
> +++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
> @@ -93,7 +93,7 @@ static int _rtw_reg_notifier_apply(struct wiphy *wiphy,
>  
>  static const struct ieee80211_regdomain *_rtw_regdomain_select(struct
>  							       rtw_regulatory
> -							       *reg)
> + * reg)

What just happened?  How was this generated?  What tool did you use?

And this series is way too big.  Please break it up into smaller parts
per patch.

thanks,

greg k-h
