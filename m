Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B0E3D75D1;
	Thu, 30 Apr 2026 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534837; cv=none; b=l1SdanJgXMYavPZNBypSbf5eZ8ssvlhGg041VGnydNxL0eneZqoAIM5oJRWEg642Zp8BBxh2xUCn1AUz37TpswkTJnTbr5j1Ee5paJqYjqOhIafiMq1M+G+G1sG72JDyNuYVdgysOk9eoGtD+cpADEZc4wI6s+MBEhAaOmE7zII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534837; c=relaxed/simple;
	bh=Bqh6wwvM/uSrblB04mHM/qXj+llExjD0Nur/+NvNzQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjVByHCkSDrOGoO2yzu4cRB+5kzR7+0WE8mn00Vzdvi7W4AVluft1OR0Z9Kc0OPrX6Io9UL2+076m4bbhw2KcTeD1GXln61XKYeslpJZzB6IW6+AMmZfQP56iShpaS91UE9zuoUsrWHa1CceC82RitRqj+iDuO3DohP3W8O+Su0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bwl2+D23; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bwl2+D23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4136C2BCB3;
	Thu, 30 Apr 2026 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777534837;
	bh=Bqh6wwvM/uSrblB04mHM/qXj+llExjD0Nur/+NvNzQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwl2+D23yY9PVhGbV21m4iZpL6hUkRvjHzM0o8EZY8y9y0ZyaFBXR7kjl8yEjrsJI
	 P+NWRuBo/ugZQKsBnR0wZVZ/cKxrO7B5TXX/46QnCsm9GyBONTkM6JbUT4pFQDXLN2
	 GHZJqeOJ/W28+KthHxzWGqSD82jV6hIUf7AsvLqU=
Date: Thu, 30 Apr 2026 09:39:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernelcoredev <sonionwhat@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: bootrom: replace dev_info with
 dev_dbg for firmware name
Message-ID: <2026043046-prelaunch-supermom-ecce@gregkh>
References: <20260430002220.3665-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430002220.3665-1-sonionwhat@gmail.com>

On Wed, Apr 29, 2026 at 08:22:20PM -0400, kernelcoredev wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.
> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.
> 
> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c..058044ba7 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -163,18 +163,13 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
>  	 *
>  	 * XXX Name it properly..
>  	 */
> -	snprintf(firmware_name, sizeof(firmware_name),
> +snprintf(firmware_name, sizeof(firmware_name),
>  		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_s2l.tftf",
>  		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>  		 intf->vendor_id, intf->product_id);
>  
> -	// FIXME:
> -	// Turn to dev_dbg later after everyone has valid bootloaders with good
> -	// ids, but leave this as dev_info for now to make it easier to track
> -	// down "empty" vid/pid modules.
> -	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
> +	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
>  		 firmware_name);
> -
>  	rc = request_firmware(&bootrom->fw, firmware_name,
>  			      &connection->bundle->dev);
>  	if (rc) {
> -- 
> 2.54.0
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
