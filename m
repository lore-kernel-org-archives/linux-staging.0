Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB79541A919
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791030943; cv=none; b=VCx3hU2RgLSU8ACYTBcOP3Jgs2yoj3BlyEpNoHikbp6qE1ijUnm2X/SiWCO1T/Uv+aTGAlVMDnLhetWEdaFqZVx0i0MUZfFFBVZPSZHNeXbsvo3teE0wgPp0nlz5xzRWA8yeSOAElVIm732dPPIP9g/PVwBmdB/ufwuMuR6fAtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791030943; c=relaxed/simple;
	bh=NgFahYtdFjel8ig+ecctGl3RiWAO4QUYnOU3lrySZio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpsQxYsE0H4+GpOOCQLG3t3qs1KQPFKDzbbvMeqJ+HrfXoUSWdzBxQNXrxbK4J4Y+O6BFcWQI9YEBzu2eXlNRiD4d9ZMUYwoQHOcuFNd0ozdppRgUqZdlA/yCSZcQaBLPkvyOIT+4SjfqX3QaByOtWnJxp4p7oaIYg6PnQFA1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tHNfBi2l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tHNfBi2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA641F0089B;
	Sat,  3 Oct 2026 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791030942;
	bh=3SrSbPCb2GeM0j07+BzgK3kHiEfYT4CySYFxDZ1TXnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tHNfBi2lXeb9lHI426Xo/FY45hllc6/Vb6T3oGnYvvuMj/cH20GJPDthu4mUhQ06x
	 mLANTaXggjvFNV6r5nRoRB3cdkO7ILqXhCt5AkjnYMkqpM4Y8E+K6/HQNONJMy6Wyb
	 /GeM0mFbyuROpAZJDQ1XKB3xKw1OLpamVYZrtNjY=
Date: Sat, 3 Oct 2026 14:35:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luca Hernandez <lucay202@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove CamelCase variable
 pbDriverStopped
Message-ID: <2026100306-bluff-eggbeater-2c89@gregkh>
References: <20261003115819.23641-1-lucay202@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003115819.23641-1-lucay202@gmail.com>

On Sat, Oct 03, 2026 at 12:58:19PM +0100, Luca Hernandez wrote:
> Rename the pointer variable pbDriverStopped to driver_stopped to eliminate
> the use of CamelCase and Hungarian notation prefixes. This aligns the
> driver's HAL code with standard Linux kernel coding style guidelines and
> resolves checkpatch.pl audit warnings.
> 
> Signed-off-by: Luca Hernandez <lucay202@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm.c | 2 +-
>  drivers/staging/rtl8723bs/hal/odm.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
> index f3989fa33d9f..505c21bd1847 100644
> --- a/drivers/staging/rtl8723bs/hal/odm.c
> +++ b/drivers/staging/rtl8723bs/hal/odm.c
> @@ -773,7 +773,7 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
>  		break;
>  
>  	case ODM_CMNINFO_DRV_STOP:
> -		pDM_Odm->pbDriverStopped =  pValue;
> +		pDM_Odm->driver_stopped =  pValue;

So this is only set but never done anything with at all?  Why is this
needed?  Why not just remove this field entirely?

thanks,

greg k-h
