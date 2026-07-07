Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683A3E0226;
	Tue,  7 Jul 2026 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419707; cv=none; b=I/QbmxuMaJCTIjBMT4Me1dg8y0LdQcJL7H7JEbbFzuvNBFcvta9ZbC0l4mDy+rfYI2N66FzuNfaZkFNdd/tcuqUjvGw1j4r07Ipp8S5YWRtZtpXmDbXIhmRCKSQZUgKkDMTQn7vVI2Srs/TSGHs0ETE7yQJGAaR94fxIERjzldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419707; c=relaxed/simple;
	bh=MsstjCtCNBTfrxGiXjfb4WRuxf7nzjnmgBXvG1Xppxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bezK+5u2WdG23NZiUhMO2YkZagq1/oaIpDYiseIAfvPdVv6mf601n6TsqOkyOX1trM4Q7Q5IsCW2hfwZYEITt/t9RV2LEqPCPYQ9s3cHfn+vRPYiycSLlKrAXqT1yKitYV8jzmSThwfsYeTImc+f/TDRxiVB/RTsNuovzrIZ6aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iIApL4ui; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iIApL4ui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F033D1F000E9;
	Tue,  7 Jul 2026 10:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783419706;
	bh=BTpi15N9bZZfABQ9NJaJeUhh9gWoDkD1Bj+rzHSNQoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iIApL4uijJzf6VOza9lv3Kpnh2M7MBDSKK5u0Ep7BxtG4HRyb8BFqOa93AmHw7U2v
	 AzgYGXG+iXVNjUb8y1GzOrDN0EZ+GqU1DKb+4O8pWK+XVQ+IiEdaSe+d8T+2jtifFA
	 972Aa8Fx4TDiVcGvB6ZlhFCHDRaxOsMBiTmyKmy0=
Date: Tue, 7 Jul 2026 12:21:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8723bs: fix coding style for
 TxPwrTrackSetPwr calls
Message-ID: <2026070720-wildcard-cupping-72ac@gregkh>
References: <ahPw0yB7Ax3lfhKu@stanley.mountain>
 <20260525121004.4989-1-igorpetindev@gmail.com>
 <20260525121004.4989-3-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525121004.4989-3-igorpetindev@gmail.com>

On Mon, May 25, 2026 at 03:10:04PM +0300, Igor Putko wrote:
> Remove unnecessary braces and fix incorrect indentation for the loop 
> calling ODM_TxPwrTrackSetPwr in ODM_TXPowerTrackingCallback_ThermalMeter.
> 
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalPhyRf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> index 3d45e5e44..c7f3ad38f 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> @@ -250,7 +250,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
>  
>  		if (ThermalValue > pHalData->EEPROMThermalMeter) {
>  			for (p = RF_PATH_A; p < c.RfPathCount; p++)
> -					(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);
> +				(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);

No braces were removed :(

Also you have a trailing space in your changelog text.

thanks,

greg k-h
