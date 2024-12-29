Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4137083F;
	Sun, 29 Dec 2024 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735468137; cv=none; b=JRuZ1m9S1y88+p+II4gb5uySPmwmvVsbQrP1r0BzIxaOV0p3mta00AnrJ9gNJiza/Zb38lz71Ow3Fskww9bQMXZa9s5PwuG9XYDPxc+S335B3RnrRxGOiWbE1eUj/P76Oeja/ujlUBu2TgckceGd/oSYk44BSP5G2qbM2gQEKbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735468137; c=relaxed/simple;
	bh=qU70m2kvl5/7CHK/NlyOkqxO/7imwu8wrt8uojRvw6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8XAE0iSeYanwnaPuAxHJDn4EQB5GSnsYmqKCLX6pTcgmQLpBSt6cjIa47Utoem7/jFwFGyo+XiIPpoW1J8/R1QxeljozNTTkFi6WcjsETcAe740K5jhhlilLp/6DfwASIK7Aj2z7p6Jih+lkIOMDo4Q2ulxZbZQRu03OaQayxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WcsXL3jc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WcsXL3jc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C411C4CED1;
	Sun, 29 Dec 2024 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735468136;
	bh=qU70m2kvl5/7CHK/NlyOkqxO/7imwu8wrt8uojRvw6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcsXL3jcIbTHNxNsOmeqhHnXzL5qdP66oodXm2xxKFds8et1KTaJDopx/ylo//nQw
	 dh6W4iHJsiCR5UtZeFRzkO4+aqgZDhjJZMuW7sA8T9D+oHPtsRwLkxs5qN8t6YDrk5
	 ok1o766GDZ2c5ZEaH5TalFB7+jCRnEHdPjmr7RWo=
Date: Sun, 29 Dec 2024 11:28:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nihar Chaithanya <niharchaithanya@gmail.com>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/15] staging: gpib: ines: Handle
 gpib_register_driver() errors
Message-ID: <2024122943-fervor-unhinge-0ed2@gregkh>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
 <20241228060800.107653-12-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228060800.107653-12-niharchaithanya@gmail.com>

On Sat, Dec 28, 2024 at 11:37:59AM +0530, Nihar Chaithanya wrote:
> The function ines_pcmcia_init_module() can be replaced by calling
> pcmcia_register_driver() directly. The error value from this
> function is not returned and the previous registering functions
> are not unregistered.
> 
> The function gpib_register_driver() can fail and similar to
> pcmcia_register_driver() function failing, the previous registering
> functions are not unregistered.
> 
> Replace cb_pcmcia_init_module() with pcmcia_register_driver().
> Unregister the gpib and pci register functions if the subsequent
> gpib or pcmcia register functions fail and return the error value.
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>  drivers/staging/gpib/ines/ines_gpib.c | 81 ++++++++++++++++++++-------
>  1 file changed, 60 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
> index 9d8387c3bf01..73df4cd16926 100644
> --- a/drivers/staging/gpib/ines/ines_gpib.c
> +++ b/drivers/staging/gpib/ines/ines_gpib.c
> @@ -1227,12 +1227,6 @@ static struct pcmcia_driver ines_gpib_cs_driver = {
>  	.resume		= ines_gpib_resume,
>  };
>  
> -int ines_pcmcia_init_module(void)
> -{
> -	pcmcia_register_driver(&ines_gpib_cs_driver);
> -	return 0;
> -}
> -
>  void ines_pcmcia_cleanup_module(void)
>  {
>  	DEBUG(0, "ines_cs: unloading\n");
> @@ -1420,28 +1414,73 @@ void ines_pcmcia_detach(gpib_board_t *board)
>  
>  static int __init ines_init_module(void)
>  {
> -	int err = 0;
> +	int ret;
>  
> -	err = pci_register_driver(&ines_pci_driver);
> -	if (err) {
> -		pr_err("ines_gpib: pci_driver_register failed!\n");
> -		return err;
> +	ret = pci_register_driver(&ines_pci_driver);
> +	if (ret) {
> +		pr_err("ines_gpib: pci_driver_register failed: error = %d\n", ret);
> +		return ret;
>  	}
>  
> -	gpib_register_driver(&ines_pci_interface, THIS_MODULE);
> -	gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
> -	gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
> -	gpib_register_driver(&ines_isa_interface, THIS_MODULE);
> +	ret = gpib_register_driver(&ines_pci_interface, THIS_MODULE);
> +	if (ret)
> +		goto err_pci;
> +
> +	ret = gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
> +	if (ret)
> +		goto err_pci_unaccel;
> +
> +	ret = gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
> +	if (ret)
> +		goto err_pci_accel;
> +
> +	ret = gpib_register_driver(&ines_isa_interface, THIS_MODULE);
> +	if (ret)
> +		goto err_isa;
> +
>  #ifdef GPIB_PCMCIA
> -	gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
> -	gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
> -	gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
> -	err += ines_pcmcia_init_module();
> +	ret = gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
> +	if (ret)
> +		goto err_pcmcia;
> +
> +	ret = gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
> +	if (ret)
> +		goto err_pcmcia_unaccel;
> +
> +	ret = gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
> +	if (ret)
> +		goto err_pcmcia_accel;
> +
> +	ret = pcmcia_register_driver(&ines_gpib_cs_driver);
> +	if (ret)
> +		goto err_pcmcia_driver;
>  #endif
> -	if (err)
> -		return -1;
>  
> +	pr_info("ines_gpib: module init is complete\n");

Why did you add this debugging line here that was not here at all?

>  	return 0;
> +
> +#ifdef GPIB_PCMCIA
> +err_pcmcia_driver:
> +	pr_err("ines_gpib: pcmcia_register_driver failed: error = %d\n", ret);

Why just this error message for only this one failure?

> +	gpib_unregister_driver(&ines_pcmcia_accel_interface);
> +err_pcmcia_accel:
> +	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
> +err_pcmcia_unaccel:
> +	gpib_unregister_driver(&ines_pcmcia_interface);
> +err_pcmcia:
> +#endif
> +	gpib_unregister_driver(&ines_isa_interface);
> +err_isa:
> +	gpib_unregister_driver(&ines_pci_accel_interface);
> +err_pci_accel:
> +	gpib_unregister_driver(&ines_pci_unaccel_interface);
> +err_pci_unaccel:
> +	gpib_unregister_driver(&ines_pci_interface);
> +err_pci:
> +	pci_unregister_driver(&ines_pci_driver);
> +
> +	pr_err("ines_gpib: gpib_register_driver failed!\n");

Why not provide the error number here too?

thanks,

greg k-h
