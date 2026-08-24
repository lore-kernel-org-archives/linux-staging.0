Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7041DDF0;
	Mon, 24 Aug 2026 13:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579477; cv=none; b=iXaZX35u01wrIoL7vHG/5fUSaISXunECfD2mN7Q9qhcgsu+LM9j9Xed25NJZLXgMNutkf0ZVYdTzL7y+e/L7wSLNr+5048A2RwfT/g7vJk5T26ge6kmo+u4dNMLem2dwr3AF0N/hi+l2BT+LRkc+RpESzmIi+VyIMWHi+QST6Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579477; c=relaxed/simple;
	bh=uRUy6BKEHOtrHDbbX5ec5KfQjjQydV3T4/gH1gcI3WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfobcyXGwH3M8TkFyaW1JXu8NWiYm6uyd5I1z0qUHlhjFGU/Hv8a3SeRvd843gGm29ZrMu5EFRwXOEjIWsJeOFcsWO0j47VB7rGb6jcM6hwdcKoRXVE11EihekL9EzDRg1KHEKcjXsZcqpcYFdS6ZSJKQ+FVmopbpJnXxdahANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wNqFaFzQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wNqFaFzQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766351F000E9;
	Mon, 24 Aug 2026 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787579476;
	bh=VLZu1mG0Vtv5uUmywV2t4CCcA4+W3iZbkJDKZqeziBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wNqFaFzQGeG2EeeZPPu+KtyXiONcQ5yjyNPgtyieb3Kf1lDuldyHf1vdHAkvDZIDw
	 PhJ44wUe42BMpOfsEX6TvqfI1ZxOOYBODzXF2RqLnWx9IEynTB74GisCA8cmaxrPpE
	 bTmYl7VC3rvTTYg7E4FRHtnt5Fag9f4XE4OBWtZo=
Date: Mon, 24 Aug 2026 15:51:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Zvolsky <matthew-kernel@post.cz>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary void
 function return
Message-ID: <2026082400-debate-unexpired-4951@gregkh>
References: <20260824134525.11509-1-matthew-kernel@post.cz>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824134525.11509-1-matthew-kernel@post.cz>

On Mon, Aug 24, 2026 at 03:45:25PM +0200, Matthew Zvolsky wrote:
> Remove an unneeded return statement at the end of a void function
> in atomisp_cmd.c. This cleans up the code and fixes a checkpatch.pl
> warning: "void function return statements are not generally useful".
> 
> Signed-off-by: Matthew Zvolsky <matthew-kernel@post.cz>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9fd26..81d0afae8041 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  
>  err:
>  	atomisp_css_free_stat_buffers(asd);
> -	return;
>  }
>  
>  static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
> -- 
> 2.39.5
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
