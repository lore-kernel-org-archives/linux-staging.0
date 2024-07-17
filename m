Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BEE1C68F
	for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721202656; cv=none; b=IJZsVFeKo/hsr5+BbvqQlCmH9pIa5+pJssm7j3GyJhiWxaQJMEuy0P70IaEyOABg0EfPflzyePhLh7mkCafP7MkRCE1EO9D7v56qZMARKKz9e+Ppauzqt345xA7pT3rpPbr6FN78VyBXaFMtnxw54h+HRpHfxqMr1pGNuLcNVh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721202656; c=relaxed/simple;
	bh=jEIiVA4Q3SEuOw83jdqjdx1Ljeo6yz/wP1dD0bNhcmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr+CAZedN9ONyqAqgbTH7SSL5Kw9x8Z5/vxdGJ+mQpwWh/qarmv41EypCOg8qgtmyjq7GS59iogRjR1VY6PmorU1xLQ6/ZvjYR/9Po6sQktJDpV18hvZBFKIw/JdRZToMU8NXFE1zZKCU/mmQqBZF74FX7ao3VSRf/m0q94C++M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f9T1oXvi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f9T1oXvi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2B7C32782;
	Wed, 17 Jul 2024 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721202656;
	bh=jEIiVA4Q3SEuOw83jdqjdx1Ljeo6yz/wP1dD0bNhcmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9T1oXviPdH2w2OaNRmEG9enb5lwRQaoiWImK4VZSF/R7sUepq34NiboAqYCiy96A
	 bo625ZJryo90WXfoWtOzrT64n4detV+pzAPihJsnPc8pTEqLLbXgvMmb26vXqBJn1T
	 onKCgu2qCdWv0NylEWUEfwlTyvydrRuiFFQWcQu4=
Date: Wed, 17 Jul 2024 09:50:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org,
	linux-staging@lists.linux.dev, trivial@kernel.org,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH] staging: greybus: Enclose multi-statement macro in
 do-while loop
Message-ID: <2024071739-mollusk-uneaten-8dec@gregkh>
References: <ZpdrmuzGgYDJ-Bb0@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpdrmuzGgYDJ-Bb0@fedora>

On Wed, Jul 17, 2024 at 01:58:34AM -0500, Juan José Arboleda wrote:
> The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> contains multiple statements, which should be enclosed in a do-while
> loop to ensure proper execution and adhere to coding standards.
> 
> This patch modifies the `gb_loopback_stats_attrs` macro to enclose
> its statements in a do-while loop, addressing the style error flagged
> by checkpatch.pl.
> 
> Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 4313d3bbc23a..a97de86c67a5 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
>  
>  #define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	do {							\
> +		gb_loopback_ro_stats_attr(field, min, u);	\
> +		gb_loopback_ro_stats_attr(field, max, u);	\
> +		gb_loopback_ro_avg_attr(field);			\
> +	} while (0)
>  
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\

Are you sure you test-built this change?

thanks,

greg k-h
