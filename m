Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CAD39BFEF;
	Mon, 11 May 2026 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485413; cv=none; b=i8v5kNnydP/0nM1S80i62OQoiFJaJrmhGWzyvmagfXIqJI4SrKWd7LJ7oqnSAPNGGXpjWGOX8UGri2OckRkyQghwXNTPx65/EiUAJeZ3TXAtPdApBQzH4YIdRpQEnjUioWtnheSjoHJbsUu+WZMsu0lpHhf0Xj4mCc6kF3sYgcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485413; c=relaxed/simple;
	bh=KF8sHqz/JvnoiKFHwKuJfkvq/1IoURc1ehGDQFIstXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBoEbCcPPDfJqPjK8Oc8ASv3eMXz3+oxJtp53A0HUqEQnf3W1GkObHRbowZTLuU1eAMLDAk2Z6wC2h8YZCgp13f5E6qFBOtq7JlXN2qQgQFl5vU0rJKYmGxH0Nte6EFBQ8bWaqSuXKk5peCPnROaqNru6inITmEfkLKHbSvYCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2FSeUsUY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2FSeUsUY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79334C2BCB0;
	Mon, 11 May 2026 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778485411;
	bh=KF8sHqz/JvnoiKFHwKuJfkvq/1IoURc1ehGDQFIstXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2FSeUsUYfDcATojeJD4LzQ/jCc4YCCsdvu4Cyv+s6BSdmKvD/r+KIgoM5c8KtEc00
	 NusAnLAhDvRYJdsjkD+phmmPhcg794jUhYwnc68JtCn20qBvJkW7sY237Cgxbb6elU
	 yUqB9KRScHFtISVeADjhbnxUk3g/j1ZAyB/UG7oA=
Date: Mon, 11 May 2026 09:43:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hanu-man12shaw <shawharshit116@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Hanu-man12shaw <harshit116@gmail.com>
Subject: Re: [PATCH] staging: vme_user: fix lines exceeding 80 characters in
 vme_tsi148.c
Message-ID: <2026051154-pang-phosphate-ea18@gregkh>
References: <20260510174215.1444-1-harshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510174215.1444-1-harshit116@gmail.com>

On Sun, May 10, 2026 at 05:42:15PM +0000, Hanu-man12shaw wrote:
> Signed-off-by: Hanu-man12shaw <harshit116@gmail.com>
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

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for a
  description of how to do this so that Greg has a chance to apply these
  correctly.

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
