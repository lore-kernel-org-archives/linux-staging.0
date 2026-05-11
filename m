Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2F3101B2;
	Mon, 11 May 2026 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487515; cv=none; b=jv/wZ4TT4uyO4hSqcfrPcEwC8w/JNer1qKDDc2tovLtUAqUQH2f3L1kmUXLB14wCNFu+fQM8JzPJTMpgiqZQUJgxmc6/Fq1pC3EW8ZNqAVFNT7VLVthbY9+KJZzZ5CO78GJ6mSdE4uCBLXxEJrfNLcqal9Jrneyi10NHpfEGiTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487515; c=relaxed/simple;
	bh=ZCFW1qh6DXfENFXyQ9zzyE5e55bRqX+2rYy/YXx9wLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBSIrK/wesM4bx0bFijd8AteVPnzUVePZj+xAIbjdEA+winRbBf81Y0D8NOijA54BXgIGdq7HYHQHNyGqvhHNUdErmDkgEIqLyvbU9HYZQ/aGXuTueKmk5tL1yWtu7QPdXETsFhEURbEFkYDa987RZ44TPg/uPQZNhzFC9g6+Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pttP31YC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pttP31YC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5A7C2BCB0;
	Mon, 11 May 2026 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778487513;
	bh=ZCFW1qh6DXfENFXyQ9zzyE5e55bRqX+2rYy/YXx9wLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pttP31YCgCF+jSV4yUR8A+IrgacuABVKZ2SsPdGf8dEnfUS6D/5DjG5sBNOq/gCVw
	 rRjbVn2NHv0Xvwn9eyeBQXe7Zi4UTPLxhxmuh1EJm97WalbrqmhvHN0cq35THC38+4
	 T3E4y+jZvsYhqd/twVckn0c/OAUerSythMlDhm7w=
Date: Mon, 11 May 2026 10:18:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix lines exceeding 80 characters in
 vme_tsi148.c
Message-ID: <2026051120-duration-congress-b1da@gregkh>
References: <20260511080439.3390-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511080439.3390-1-shawharshit116@gmail.com>

On Mon, May 11, 2026 at 08:04:39AM +0000, Harshit Shaw wrote:
> Wrap two dev_err() calls that exceeded the 80 character
> line limit as reported by checkpatch.pl.
> 
> No functional change.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index 4cf3486646ce..0e8a67fbf562 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -755,7 +755,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
>  					size, 0x10000, PCIBIOS_MIN_MEM,
>  					0, NULL, NULL);
>  	if (retval) {
> -		dev_err(tsi148_bridge->parent, "Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
> +		dev_err(tsi148_bridge->parent,
> +			"Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
>  			image->number, (unsigned long)size,
>  			(unsigned long)image->bus_resource.start);
>  		goto err_resource;
> @@ -2252,7 +2253,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct vme_lm_resource *lm;
>  
>  	if (geoid >= VME_MAX_SLOTS) {
> -		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
> +		dev_err(&pdev->dev,
> +			"VME geographical address must be between 0 and %d (exclusive), but got %d\n",
>  			VME_MAX_SLOTS, geoid);
>  		return -EINVAL;
>  	}
> -- 
> 2.53.0
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
