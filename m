Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71382E2EF9
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738033; cv=none; b=c7QJW2v7jdMRH94OArlp2Qd2UzTarAvJRiRfllG/1NhTBueprLocqRYVh1y6jLZmpmghWxW1IL+2IxcgHBvzEyI9WzGcBu4fezfyI+9fOXZazYM936/noIGkSvQeGvZymuY2JrJG2Sz8gTOjakEw8ZKDovn4Fjq6s7w5w0lAFvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738033; c=relaxed/simple;
	bh=ha5PQule/LvvizNtVOx1usYg/En4VytgmK5+elzZbt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i45Cm2pIezT1N8aE2gob7ElOztWM3s33fJYjq4ttBVj9WpmhjCkWULZanbADXnWJRI/t1dyNbhXvAc2qgDwTpsXkX6zRukGJd25/y9AHKsQqO9qmpj0nrMszzZMsCOQizGdPfMvds7TAaW+6u3kNIiJSgC4jZQq55xQ5GtFVIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b5zTvqWk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b5zTvqWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E41C116C6;
	Tue, 10 Feb 2026 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770738032;
	bh=ha5PQule/LvvizNtVOx1usYg/En4VytgmK5+elzZbt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5zTvqWkpfBEz9PATsXnpY7p8Q9gbdwI+hDYjXVKZusbJ7zIt7a6Usc9W/Tt4c2Do
	 SGAgJag76swCx9Hyhk1LE/kq6kKSO4ZUn78Svqo6uaY1obdV+BuhMik0GpT8qvitu3
	 OfwUeHsD9Fhqf5KaRtqcDBt3aXANh3S4UbAYnsMI=
Date: Tue, 10 Feb 2026 16:40:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: soufianeda@tutanota.com
Cc: sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <2026021001-recolor-macaroni-b00b@gregkh>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>

On Tue, Feb 10, 2026 at 04:26:31PM +0100, Soufiane via B4 Relay wrote:
> From: Soufiane <soufianeda@tutanota.com>
> 
> Validate sizeimage against the allocated frame buffer size before
> hmm_store() to prevent out-of-bounds write.
> 
> Signed-off-by: Soufiane <soufianeda@tutanota.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 3a4eb4f6d3be..ca7ffc7855ac 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
>  		goto err;
>  	}
>  
> +	if (arg->fmt.sizeimage > res->data_bytes) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
>  	tmp_buf = vmalloc(arg->fmt.sizeimage);
>  	if (!tmp_buf) {
>  		ret = -ENOMEM;
> 
> ---
> base-commit: 72c395024dac5e215136cbff793455f065603b06
> change-id: 20260210-atomisp-fix-8e083f753688
> 
> Best regards,
> -- 
> Soufiane <soufianeda@tutanota.com>
> 
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
