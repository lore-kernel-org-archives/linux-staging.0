Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4DD17EF
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 09:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F38C433EF;
	Wed, 11 Jan 2023 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673427640;
	bh=m7SO/EbDaZgXdfeT/+bx2g1Qtq4M8rWYhvxV7BtWxkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=il7CiCBlRd6d1nn9B+aZDZQzBhcUBJrGsQcGKM2BFe5dpuOV2daVCXFqimf5HlIog
	 dIM6peyZg/TCaXwOkND6Yjm/wJ9MlMpY8Nk0k1zOy2bm8ne9EurR5te0OdVO5nAFgx
	 Wjoqmo+on5r3cIIlTz5B/3JD3Za67Gwj0tAB+hBE=
Date: Wed, 11 Jan 2023 10:00:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gaurav Pathak <gauravpathak129@gmail.com>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vchiq_arm.c: Declare vchiq_platform_init as
 static
Message-ID: <Y756tY0wRxl/jamp@kroah.com>
References: <20230111080124.32274-1-gauravpathak129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111080124.32274-1-gauravpathak129@gmail.com>

On Wed, Jan 11, 2023 at 01:31:24PM +0530, Gaurav Pathak wrote:
> Modified vchiq_platform_init() as static to fix sparse warning
> > warning: symbol 'vchiq_platform_init' was not declared. Should it be
> > static?

Put the warning line all on one line, no need to wrap that.

> Signed-off-by: Gaurav Pathak <gauravpathak129@gmail.com>
> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index dc33490ba7fb..ffa517077b80 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -462,7 +462,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>  	cleanup_pagelistinfo(instance, pagelistinfo);
>  }
>  
> -int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> +static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
> -- 
> 2.39.0
> 
> 

What changed to enable this version of the patch to work properly
compared to the previous submissions that broke the build?  Did you test
this and it now works properly?

thanks,

greg k-h
