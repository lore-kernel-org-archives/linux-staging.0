Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963461A6838;
	Sat, 21 Mar 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076653; cv=none; b=aUrr/yMOopAoWMFFr9tXTXes6nRLUd/A9NkN+JOC2U0OCsxDk4glUgNdExxirIfqU12C+95uAh/okX6ZudPQ38KWsmAZ6Po8F5tfIO8/3KP64BflwYts3BIje7KPmLgjRRjP8Lofdi14QsgTK/5pbDy4HH7N1/hSpm7XBz9fh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076653; c=relaxed/simple;
	bh=QDnrJU0ABwoNUPKMiz8C4HDWwaQpamt6A9+VTyYzZxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOvpFGVxpJqR3KPqcTEYagLeDo6TPLtUMfe09PWI9mwBNpOlj2/TB4ICDCdoZNEO6YqN3UKV2zWNRYmJ0d9ep0GwjKvhXR9dxTQHpDX7MUtodeDXF0XezkPusVOjvTXf4G5uXztXxDItNcyIIUP/dWS8l5sZpav9Shnv+OwY5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l+Qmd3cY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l+Qmd3cY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D39C19421;
	Sat, 21 Mar 2026 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774076653;
	bh=QDnrJU0ABwoNUPKMiz8C4HDWwaQpamt6A9+VTyYzZxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+Qmd3cYcfh6FCkHU0bMOPOrzUqn84BT7//f0oTwEiF/igc6M2oqeSD0iyWTK1C38
	 Z4PWMKPXu8ivfghFnt5JnY0WdXy0cBj1QRTBGv3UKJ9WNRL8NxOu34BDlKnTAwatUF
	 HS5xa/6mIlr19YJFLJPZqSXgYYbiH4KhaPD6923M=
Date: Sat, 21 Mar 2026 08:03:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: change error handling to use
 standard errno
Message-ID: <2026032137-absinthe-truth-99e5@gregkh>
References: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
 <20260320094824.66349-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320094824.66349-1-omer.e.idrissi@gmail.com>

On Fri, Mar 20, 2026 at 10:48:24AM +0100, Omer El Idrissi wrote:
> Replace non-standard return values with descriptive linux kernel error
> codes in probe path.
> Also replace the variable name 'status' with 'ret' to be more
> consistent with other kernel code.
> 
> Changes since v1:
> -- Replace -ENOMEM with -ENODEV for sdio_dvobj_init fail path
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 +++++++++++++-------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..4c16c514ca39 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -345,38 +345,46 @@ static int rtw_drv_init(
>  	struct sdio_func *func,
>  	const struct sdio_device_id *id)
>  {
> -	int status = _FAIL;
> +	int ret;
>  	struct adapter *if1 = NULL;
>  	struct dvobj_priv *dvobj;
>  
>  	dvobj = sdio_dvobj_init(func);
> -	if (!dvobj)
> +	if (!dvobj) {
> +		ret = -ENODEV;
>  		goto exit;
> +	}
>  
>  	if1 = rtw_sdio_if1_init(dvobj, id);
> -	if (!if1)
> +	if (!if1) {
> +		ret = -ENOMEM;
>  		goto free_dvobj;
> +	}
>  
>  	/* dev_alloc_name && register_netdev */
> -	status = rtw_drv_register_netdev(if1);
> -	if (status != _SUCCESS)
> +	ret = rtw_drv_register_netdev(if1);
> +	if (ret) {
> +		ret = -EIO;
>  		goto free_if1;
> +	}
>  
> -	status = sdio_alloc_irq(dvobj);
> -	if (status != _SUCCESS)
> +	ret = sdio_alloc_irq(dvobj);
> +	if (ret) {
> +		ret = -EIO;
>  		goto free_if1;
> +	}
>  
> -	status = _SUCCESS;
> +	ret = _SUCCESS;
>  
>  free_if1:
> -	if (status != _SUCCESS && if1)
> +	if (ret != _SUCCESS && if1)
>  		rtw_sdio_if1_deinit(if1);
>  
>  free_dvobj:
> -	if (status != _SUCCESS)
> +	if (ret != _SUCCESS)
>  		sdio_dvobj_deinit(func);
>  exit:
> -	return status == _SUCCESS ? 0 : -ENODEV;
> +	return ret;
>  }
>  
>  static void rtw_dev_remove(struct sdio_func *func)
> -- 
> 2.51.0
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
