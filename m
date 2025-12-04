Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1A347BDD;
	Thu,  4 Dec 2025 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874480; cv=none; b=KUa5NqOVHH+sUa3IDKVnjGrqgdgruVs4GAjVlQkTrSpuIkHzOOf1vpC4FOX6aOd3H2uq5UNNUK4OB/Nk4bTwZgVOCVD0CIaFQaevXlo/1hHEL3g0SW8yMOwPVsnEZxhM8p1LMKvvkKMlHZbwUWQxfHRy1nnxQb4MsHqOQ3/x5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874480; c=relaxed/simple;
	bh=0/b/KxLNkPPpFDtLWvD/HAhudnjCckydnqbgeKYI50o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8PYOchlUy94FiltL+5xGhUoeOSv0Eoy81hVy5qL8nDL+MKeBbijD+Y2oJWAbTu6PIjuUELW4lHQkVQqBdXh8o/eRQZD/i0zn3/uVXto5YoP8LOwSkf3SCGs9EsXTz5wKfpSv6LfOIjVPT3WUk0apsHCoYBxgPBF9eA21/+oWIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iYbK1SbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iYbK1SbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12CDC4CEFB;
	Thu,  4 Dec 2025 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764874480;
	bh=0/b/KxLNkPPpFDtLWvD/HAhudnjCckydnqbgeKYI50o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYbK1SbM3wp/FszxWTUt0hP3RcMadSWXUnpg254+ZcNHRS4rxYaltLM9OAd65KsUC
	 LMGkmYhPBLnzCsNbB6pJaFUK+HMTFToFlmwHC++186NPT+4NBhLXSoUyohMEnf44Mx
	 yyd1n6IpSPDm1rXsaWfVH5/YVgblwiK3zCOzxpkM=
Date: Thu, 4 Dec 2025 19:54:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julioccps <julio191096@gmail.com>
Cc: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: arche-apb-ctrl: switch to
 device_property_read_bool
Message-ID: <2025120422-atypical-manliness-3be1@gregkh>
References: <20251204162906.45005-1-julio191096@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204162906.45005-1-julio191096@gmail.com>

On Thu, Dec 04, 2025 at 01:29:06PM -0300, Julioccps wrote:
> Switch from the deprecated of_property_read_bool() to the common
> device_property_read_bool() API. This makes the driver agnostic to
> the underlying firmware interface (DT or ACPI) and simplifies the
> logic.
> 
> Since the driver is no longer strictly dependent on Device Tree,
> include <linux/mod_devicetable.h> directly for the struct
> of_device_id definition, instead of relying on implicit inclusion
> via <linux/of_irq.h>, which has been removed as it is unused.
> 
> Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
> to better reflect the agnostic nature of the new implementation.
> 
> Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 90ab32638d3f..eea9648a461c 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -10,13 +10,14 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
> -#include <linux/of_irq.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> +#include <linux/mod_devicetable.h>
>  #include "arche_platform.h"
>  
>  static void apb_bootret_deassert(struct device *dev);
> @@ -314,7 +315,7 @@ static ssize_t state_show(struct device *dev,
>  
>  static DEVICE_ATTR_RW(state);
>  
> -static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
> +static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>  				     struct arche_apb_ctrl_drvdata *apb)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -378,7 +379,7 @@ static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
>  	}
>  
>  	/* Only applicable for platform >= V2 */
> -	if (of_property_read_bool(pdev->dev.of_node, "gb,spi-en-active-high"))
> +	if (device_property_read_bool(&pdev->dev, "gb,spi-en-active-high"))
>  		apb->spi_en_polarity_high = true;
>  
>  	return 0;
> @@ -394,7 +395,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
>  	if (!apb)
>  		return -ENOMEM;
>  
> -	ret = apb_ctrl_get_devtree_data(pdev, apb);
> +	ret = apb_ctrl_get_fw_data(pdev, apb);
>  	if (ret) {
>  		dev_err(dev, "failed to get apb devicetree data %d\n", ret);
>  		return ret;
> @@ -403,7 +404,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
>  	/* Initially set APB to OFF state */
>  	apb->state = ARCHE_PLATFORM_STATE_OFF;
>  	/* Check whether device needs to be enabled on boot */
> -	if (of_property_read_bool(pdev->dev.of_node, "arche,init-disable"))
> +	if (device_property_read_bool(&pdev->dev, "arche,init-disable"))
>  		apb->init_disabled = true;
>  
>  	platform_set_drvdata(pdev, apb);
> -- 
> 2.52.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
