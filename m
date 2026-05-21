Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B98346FA7;
	Thu, 21 May 2026 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354647; cv=none; b=hqcB98LcrkJd/XgIK5M74v39+pob9CBAZb07f27tMeE+5LrPa5Qtn8q/AF0LjUMev/pnbC+u8XeBlQqZPh7tnTyFCHof8f+rmjJ+FR1sKWE+MGrZsvGHBZVojfUztwONwx7dtLLNgkNbMhvBRDnfZqw3olVgI2+JOBhZHrAd1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354647; c=relaxed/simple;
	bh=8ArgqI0k2/O+Orw2sox6q0HyLNASRHJza7CWpanb0Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TV7FZLsAAy69OQK1jA1tXzLhT4qr5yyrCeRY41aM5LbpT1Mbz/pqOglcKfnkG6B1Yj6XJ89XiWzDXz70tnyzw9BAgwg+scjPJKMruzg+Ev9KOU1jgqcyZF/VZNUq/iDTzL2EdiPUMFEfudO3KCPb5dZ7PL8kWGW8cASf9kxreAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BeVR4Bpo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BeVR4Bpo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962A01F000E9;
	Thu, 21 May 2026 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779354646;
	bh=uIK9CQsphST/pFjbK+fiQ0aKA9xwcS74evhP0dk+Vqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BeVR4BpoGLd21o4QizjgKV3NmXZSLKZXOK1huLrJWDc0YRAZZ6/51yLA7TUYBihSB
	 OqeCI6bXauV8znzAs4N/1PXiu9eBl7ss6/2pHbTcGxGqGphQEqFnwLBu424kpyxIL1
	 s+OE4dxYBeUGyXJ3DUFKEnvb/IFCQ2Rmw4ZqEr7o=
Date: Thu, 21 May 2026 11:10:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cong Nguyen <congnt264@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename
 ndis_802_11_network_infrastructure enum values to uppercase
Message-ID: <2026052117-snore-bladder-110d@gregkh>
References: <20260511134930.4086521-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511134930.4086521-1-congnt264@gmail.com>

On Mon, May 11, 2026 at 08:49:30PM +0700, Cong Nguyen wrote:
> --- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> +++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> @@ -43,11 +43,11 @@ struct ndis_802_11_conf {
>  };
>  
>  enum ndis_802_11_network_infrastructure {
> -	Ndis802_11IBSS,
> -	Ndis802_11Infrastructure,
> -	Ndis802_11AutoUnknown,
> -	Ndis802_11InfrastructureMax,     /*  Not a real value, defined as upper bound */
> -	Ndis802_11APMode,
> +	NDIS_802_11_IBSS,
> +	NDIS_802_11_INFRASTRUCTURE,
> +	NDIS_802_11_AUTO_UNKNOWN,
> +	NDIS_802_11_INFRASTRUCTURE_MAX,     /*  Not a real value, defined as upper bound */
> +	NDIS_802_11_AP_MODE,
>  };

Why aren't you just using the NDIS values that the kernel already
provides for these?  Don't re-invent the wheel.

thanks,

greg k-h
