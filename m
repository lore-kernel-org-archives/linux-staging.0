Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1B242D6B;
	Mon, 27 Apr 2026 03:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261834; cv=none; b=ipcUxFp7O4oi194/IpX1Of3naduGLzvlMB8ytjtPV4vuVeVK/3Zn6BOKjbSb7Ntk1Ewhc9s1g+GsO9IEhK/RZvYNlBumgVJzhEHePNJVsR09Ba/q91H+pca0NV0WtGQ4elqmapqIxnnv/IURfJ8+xJhQ9HHJOBZgFADN9Y4IotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261834; c=relaxed/simple;
	bh=V4RuAQuj9W/ef79kphFHlOaPLZzLWbCn8LFgsrIKbFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJI8QUerwuIpvVKKR9sHPMvYshxOTFND5+eDvnSGLUQfo2y8SbqHlKScqRYsKRSPgLifU0GK/EUez8g9V5NyrE3vsKEDbGwxquSgMpVn/TbX99Quz6yeIi1gmIOL4Oi1pAfZ48FdNRUb6gC6OPKi565hoRquRSpRCtrqiP7ACQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BSAJ80Fa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BSAJ80Fa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE61DC2BCB7;
	Mon, 27 Apr 2026 03:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261833;
	bh=V4RuAQuj9W/ef79kphFHlOaPLZzLWbCn8LFgsrIKbFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSAJ80FakGmR7LHkKl52i5aDKOjOxD6oyMVoO/7KK2khOGRpfr1EXdQ2tUGzDQx3m
	 L+VjaXOvU1wiSqs6mghUVO++FLunrqDgOJ8tyr3nbzkuY3PuiFw7aa8FF3nV8h72GP
	 iTghfxzoY8g8gYMB+PcqfAAnf7+3rcsUe3z+APyk=
Date: Sun, 26 Apr 2026 21:05:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Baran Arda <baran9arda@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix sleep while holding mutex
Message-ID: <2026042644-resurface-founding-49cf@gregkh>
References: <20260203112029.27894-1-baran9arda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203112029.27894-1-baran9arda@gmail.com>

On Tue, Feb 03, 2026 at 02:20:29PM +0300, Baran Arda wrote:
> Signed-off-by: Baran Arda <baran9arda@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 30 ++++++++++++++-------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 509d620d6ce7..21dc9521afab 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -197,11 +197,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  			goto end_unlock;
>  		}
>  	} else {
> -		/* opened in blocking mode
> -		 * wait for a packet available interrupt (or timeout)
> -		 * if nothing is currently available
> +		/*
> +		 * Opened in blocking mode. Wait for a packet available
> +		 * interrupt (or timeout) before acquiring the lock.
>  		 */
> -		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
>  						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
>  						       read_timeout);
> @@ -214,8 +213,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  					ret);
>  			}
>  
> -			goto end_unlock;
> +			return ret;
>  		}
> +
> +		mutex_lock(&fifo->read_lock);
>  	}
>  
>  	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
> @@ -342,25 +343,26 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  	} else {
>  		/* opened in blocking mode */
>  
> -		/* wait for an interrupt (or timeout) if there isn't
> -		 * currently enough room in the fifo
> +		/*
> +		 * Wait for a packet available
> +		 * interrupt (or timeout) before acquiring the lock.
>  		 */
> -		mutex_lock(&fifo->write_lock);
> -		ret = wait_event_interruptible_timeout(fifo->write_queue,
> -						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> -								>= words_to_write,
> -						       write_timeout);
> +		ret = wait_event_interruptible_timeout(fifo->read_queue,
> +						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> +						       read_timeout);
>  
>  		if (ret <= 0) {
>  			if (ret == 0) {
>  				ret = -EAGAIN;
>  			} else if (ret != -ERESTARTSYS) {
> -				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in write (ret=%i)\n",
> +				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in read (ret=%i)\n",
>  					ret);
>  			}
>  
> -			goto end_unlock;
> +			return ret;
>  		}
> +
> +		mutex_lock(&fifo->read_lock);
>  	}
>  
>  	txbuf = vmemdup_user(buf, len);
> -- 
> 2.39.5 (Apple Git-154)
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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
