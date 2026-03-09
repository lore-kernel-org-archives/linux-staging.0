Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1712D2236EB;
	Mon,  9 Mar 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072429; cv=none; b=kYZh3z4MyWgfA+Hby6y/7gbg0fm1D6pXuHluvO+ZhLjj1la7GijFcLn3OAuJaDUo2Ed3eDWgvGKQBaoB/oeEITPZOdxf5mtVyiCfJx5hF4INulu1NMF74X0ZN3cFoZqggrRrwjpisluVd/jDVq+xBXGoM/VHUYQj1qA+U3t4Thg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072429; c=relaxed/simple;
	bh=ewQ4+mCJ+4E1UQfOsAOR8oLWKKwzcuon2LamFyNWflc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksc+TO4CYi02tOataJB9ZLfdrNFxgip82wofglc+sDie4ZtlOLaob9FrDbMD6NFboSaNMG/hTjvg5O4iylDT9hmQj100appgNSQZb8DmGRBO/d3Pi8Np4ow9XxNYEvjw67HHf0mFVD5L2zlhh/EOkI98x+uJGS+kqBHySWWd/9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DWD1gQkZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DWD1gQkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E20C4CEF7;
	Mon,  9 Mar 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072428;
	bh=ewQ4+mCJ+4E1UQfOsAOR8oLWKKwzcuon2LamFyNWflc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWD1gQkZ+RdWyPxc1zmWnhsjORCKnYRUpHHL4rLcJXr2zuoxBXXJsDEHSL3VKm/5a
	 6NIco/oOt3C0qn7aNxJNyS49oiAxnIwzH8Z9H+GJClKgTFp7+WwFzCn35Jbp1BPip1
	 8SMPBIdPVoJFFcrni4byPYXqF5myln6jwLFr7W54=
Date: Mon, 9 Mar 2026 17:07:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: fix alignment and line length in
 wait_event_interruptible
Message-ID: <2026030948-hangnail-enduring-112c@gregkh>
References: <20260301004547.2506266-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301004547.2506266-1-objecting@objecting.org>

On Sun, Mar 01, 2026 at 12:45:47AM +0000, Josh Law wrote:
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index aa90b27197cf..aac2c58ef9b3 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
> +					       words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}
> -- 
> 2.43.0
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
