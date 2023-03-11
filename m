Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487547B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 07:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDA0C433EF;
	Sat, 11 Mar 2023 07:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678520452;
	bh=p/ePXgGwwQ4V3LCHxl/qnUoHPik+bZDVnHW4K+HqRuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCLH+xyWqY5ceBcStzWLc32MjO8kRw/BJDE0Apjcg5KFfzx1it5VEc6C5wNWR2xqK
	 9AVnOkAk8PSzQly/7Fqn3kyZs1qI/Vz9goFmpuWSL8B0zzUNle8muY81RoDraVjBDI
	 UbRRPIk1YgMs4GiE8jMzfYpopOj+495h6H1+rfwE=
Date: Sat, 11 Mar 2023 08:40:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Archana <craechal@gmail.com>
Cc: drv@mailo.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: wlan-ng: remove unnecessary kfree statements
Message-ID: <ZAwwgsZd+2OAD1DM@kroah.com>
References: <20230310205917.2161-1-craechal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310205917.2161-1-craechal@gmail.com>

On Fri, Mar 10, 2023 at 08:59:16PM +0000, Archana wrote:
> The function uses goto free_result in rest of its implementation.
> 
> Signed-off-by: Archana <craechal@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2fw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
> index 02a2191d5c4d..98ed9bb9192c 100644
> --- a/drivers/staging/wlan-ng/prism2fw.c
> +++ b/drivers/staging/wlan-ng/prism2fw.c
> @@ -1008,12 +1008,11 @@ static int writeimage(struct wlandevice *wlandev, struct imgchunk *fchunk,
>  	rstmsg = kzalloc(sizeof(*rstmsg), GFP_KERNEL);
>  	rwrmsg = kzalloc(sizeof(*rwrmsg), GFP_KERNEL);
>  	if (!rstmsg || !rwrmsg) {
> -		kfree(rstmsg);
> -		kfree(rwrmsg);
>  		netdev_err(wlandev->netdev,
>  			   "%s: no memory for firmware download, aborting download\n",
>  			   __func__);
> -		return -ENOMEM;
> +		result = -ENOMEM;
> +		goto free_result;
>  	}
>  
>  	/* Initialize the messages */
> -- 
> 2.34.1
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
