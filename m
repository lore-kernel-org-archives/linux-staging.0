Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD1C7083F;
	Sun, 29 Dec 2024 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735468190; cv=none; b=h0mhA6PrpX0a/mt+nowGuEgjeihNmMa2YBK6dmxO7wCFhWFGKlp9igTxTO/6Q8pLwcEzAx+Gr4Xhym8Ao2eHVAymWp3H6kUKdSmO0lAbRrNbHm82G04RG9J5suDxfZJUa4xK54jSw3B7XoL0IVJbb4wjsUCcRdbUitz8pwwtlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735468190; c=relaxed/simple;
	bh=rx/uj3u+rlxtgQUnJahzzoYTG+JyxI0sFfxx3qosAaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUdO0OjU4pkfiQJRdBqqLRUWBdcNJ0e5gGQ44zMpVKazY7T69xGJP/TYoy/gyfNoPzTbymL+JYc5LKlEnxLa4XUv2unSo4V7GbPf4dSX8m7IE8pfnbY8DN8J0bQ+J4eJPrkzS7MzB7EJzkTn8bY+FNyyBGREibqVGsCLxnU9m7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XtDgHOPz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XtDgHOPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CDFC4CED1;
	Sun, 29 Dec 2024 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735468189;
	bh=rx/uj3u+rlxtgQUnJahzzoYTG+JyxI0sFfxx3qosAaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtDgHOPzhzXWMxQcdADebIAtZBxV8I2jU+Qbdruy1y1rcTAiaKOlZWSM9uvoI4D1d
	 YqoS3AceKNv9RJV48EUSyGYLAnzuFENmA2NFXZAAbPvv75HtTB9cDiIe2yozDyZQnJ
	 nTuFY0pLwlHbIIbl6Sbxg+GHR3/Ee1wYKskHVvYs=
Date: Sun, 29 Dec 2024 11:29:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nihar Chaithanya <niharchaithanya@gmail.com>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/15] staging: gpib: agilent_82350b: Handle
 gpib_register_driver() errors
Message-ID: <2024122926-size-playset-70c0@gregkh>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
 <20241228060800.107653-3-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228060800.107653-3-niharchaithanya@gmail.com>

On Sat, Dec 28, 2024 at 11:37:50AM +0530, Nihar Chaithanya wrote:
> The function gpib_register_driver() can fail which can result in
> semi-registered module.
> 
> In case gpib_register_driver() fails unregister the previous
> gpib and pci registering functions, return the error value.
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>  .../gpib/agilent_82350b/agilent_82350b.c      | 21 ++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 53006d0cc79c..6f077ede86a6 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -910,13 +910,28 @@ static int __init agilent_82350b_init_module(void)
>  
>  	result = pci_register_driver(&agilent_82350b_pci_driver);
>  	if (result) {
> -		pr_err("agilent_82350b: pci_driver_register failed!\n");
> +		pr_err("agilent_82350b: pci_driver_register failed: error = %d\n", result);
>  		return result;
>  	}
>  
> -	gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
> -	gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
> +	result = gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
> +	if (result)
> +		goto err_unaccel;
> +
> +	result = gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
> +	if (result)
> +		goto err_interface;
> +
> +	pr_info("agilent_82350b: module init is complete\n");

Why are you adding noise to drivers like this?  When drivers work
properly, they are quiet.


>  	return 0;
> +
> +err_interface:
> +	gpib_unregister_driver(&agilent_82350b_unaccel_interface);
> +err_unaccel:
> +	pci_unregister_driver(&agilent_82350b_pci_driver);
> +
> +	pr_err("agilent_82350b: gpib_register_driver failed!\n");

No error number here?

Same for all the other changes in this series.

thanks,

greg k-h
