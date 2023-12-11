Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DF725741;
	Mon, 11 Dec 2023 16:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JfB8QdQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E22C433C7;
	Mon, 11 Dec 2023 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702312704;
	bh=w4XxbFybPgO0yNAs3VILv8qJBukBweqBcvoWPXmJMPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfB8QdQFsbZ6KTTiorcr1ZbEkHj7IVno7xI27OCO/v5oKoYJ86O8RWAwSjz0fUtql
	 6KixKySZuGjkokyS5oBxC0zC2ZAcLKL6QiCzOJLKVlUUOuDISZ3q06lAcfqu+4wSak
	 eVxeP1aR2qjqY4w32mM7MEQhBoN/m37Nzq56uctg=
Date: Mon, 11 Dec 2023 17:38:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Piro Yang <piroyangg@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Linux Outreachy <outreachy@lists.linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2]staging:vme_user:fix the issue of using the wrong
 error code
Message-ID: <2023121105-grimy-move-311e@gregkh>
References: <20231211162717.105915-1-piroyangg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211162717.105915-1-piroyangg@gmail.com>

On Tue, Dec 12, 2023 at 12:27:17AM +0800, Piro Yang wrote:
> the error code of ENOSYS indicates Invalid system call number, but there is not system call
> 
> Signed-off-by: Piro Yang <piroyangg@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 5c416c31ec57..9bc2d35405af 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -341,7 +341,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
>  
>  	if (!bridge->slave_set) {
>  		dev_err(bridge->parent, "Function not supported\n");
> -		return -ENOSYS;
> +		return -EINVAL;
>  	}
>  
>  	if (!(((image->address_attr & aspace) == aspace) &&
> -- 
> 2.25.1
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
