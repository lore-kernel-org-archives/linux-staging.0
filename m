Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A649D2EAD1C;
	Mon, 30 Mar 2026 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886006; cv=none; b=ZyqGT7/GryDdHYdMcEVEgVky47yM6kXa+Eh92OJ3p1BiGwR+OfL6bJCFPdQjqVdnGB9n+fWot+uMCrZR2VyxfElF1Q0s1Tm0zsLEz4ckOEXQPKNMqJAhQeppk+kSEq+Hz4LUdvvQk3GdOur8Mo11AydVsbOpcAJl7UCH8njL3w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886006; c=relaxed/simple;
	bh=ilZetO5xH+RbGlJUSsrgdvmPfHUNlHCafVlwAUMAb2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZYf3dGL5s7kU54O/frpW8B6e8GdFALv0CLI+TVmlzQiJExo8RAZIH4DLeOMLPv8jziK/+q+/AU2DKANd2U8ixExXMdCplYsPrrFWP0zfi9RtjgFUAcHNYfG/3gY3DHIgp/qBejCkdwPcJ7OMmloBUbIyoburvEjzqVj8Pa9Q24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XK19O3JN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XK19O3JN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1628AC4CEF7;
	Mon, 30 Mar 2026 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886006;
	bh=ilZetO5xH+RbGlJUSsrgdvmPfHUNlHCafVlwAUMAb2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XK19O3JNBXlE7vdC3xEciQW0I184qQDvauZmGweAZXDaO8copp5114BHB04fqQMs6
	 YrbR8uuAlv9T7E0HWIK2yEPHTadCf+c4UQ5eZ4KqoKYZW/tW2I0BWdjo+2aYqQeDGq
	 RdMId76zYU6CAD0ljKzmkHU4mATSQTQQ0HBmr0dE=
Date: Mon, 30 Mar 2026 17:53:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: remove unused conn argument from
 loopback macro
Message-ID: <2026033007-hypocrite-sabotage-eb4a@gregkh>
References: <20260319012008.248-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319012008.248-1-dennylin0707@gmail.com>

On Thu, Mar 19, 2026 at 01:20:08AM +0000, Hungyu Lin wrote:
> The 'conn' argument in the gb_dev_loopback_ro_attr macro is not
> used in the macro body. Remove it to clean up the code and fix
> the checkpatch warning.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index aa9c73cb0..34e79e99c 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -193,7 +193,7 @@ static ssize_t field##_store(struct device *dev,			\
>  }									\
>  static DEVICE_ATTR_RW(field)
>  
> -#define gb_dev_loopback_ro_attr(field, conn)				\
> +#define gb_dev_loopback_ro_attr(field)				\
>  static ssize_t field##_show(struct device *dev,		\
>  			    struct device_attribute *attr,		\
>  			    char *buf)					\
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
