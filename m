Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B04833066E;
	Tue,  3 Feb 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119033; cv=none; b=Y0EnoMWWuxXgzuLrUz81TSiRQEUYQmekGEY4pHNCZhaRwnNfMi/CxEv1qnmBNfHcDNajqFl1Uf4XBejEG8qkcYBcOlAvsp7ZiYgev9AIbP+guIlcGZnn3wAwY4INnpu9OT4CB/ITsYk0pDqxVCYnmRjyjN1DnMEvefXE4U2oJQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119033; c=relaxed/simple;
	bh=yj/elnT1MN/+RUF+tE68HjjwnczIIop3JTQhUiZAvvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpyK6/a79jiIuAxAozCrgKMYMaLLm8rXoTdR+jDIMV6QM4dO5ZJTJ8ggxdNFa5qHFO+S76PxXCgwWco6jO2TSLEY5xVpF/XhSRJcgBwdwaI+lC3Id17OCxJumJts7Q9t7rncFuMae2IwOTBJHTtvDqwFA56YoFPN+w2jkG52RJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nsOurM6h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nsOurM6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F140C116D0;
	Tue,  3 Feb 2026 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770119032;
	bh=yj/elnT1MN/+RUF+tE68HjjwnczIIop3JTQhUiZAvvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsOurM6hO7KfuPrMcL9xQ1uVe13grLhvlwFQF1DrPdXoSu7wtZCmvvC4RFo/4Iihd
	 MfzqbAsN07jkekMu/FGbZJ5zhU90hi+zLmghOE5yf3qcWMthcUC7dx9IbBCZN14TtW
	 SJU/mYbbYM+8OFAZThOT+EqlVWlvvpYRMU+X93lI=
Date: Tue, 3 Feb 2026 12:43:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Baran Arda <baran9arda@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix sleep while holding mutex
Message-ID: <2026020334-frenzy-mummify-7ff2@gregkh>
References: <20260203113651.28154-1-baran9arda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203113651.28154-1-baran9arda@gmail.com>

On Tue, Feb 03, 2026 at 02:36:51PM +0300, Baran Arda wrote:
> The driver calls wait_event_interruptible_timeout() while holding a mutex. This can lead to a deadlock or poor performance as the mutex is held while the process is sleeping, preventing other processes from accessing the device. This patch moves the wait_event call outside of the mutex lock in both read and write operations.
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 30 +++++++++++++--------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 509d620d6ce7..a651c59a80ea 100644
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
> @@ -340,27 +341,26 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  			goto end_unlock;
>  		}
>  	} else {
> -		/* opened in blocking mode */
> -
> -		/* wait for an interrupt (or timeout) if there isn't
> -		 * currently enough room in the fifo
> +		/*
> +		 * Opened in blocking mode. Wait for enough room in the FIFO
> +		 * (or timeout) before acquiring the lock.
>  		 */
> -		mutex_lock(&fifo->write_lock);
>  		ret = wait_event_interruptible_timeout(fifo->write_queue,
>  						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> -								>= words_to_write,
> +						       >= words_to_write,
>  						       write_timeout);
>  
>  		if (ret <= 0) {
> -			if (ret == 0) {
> +			if (ret == 0)
>  				ret = -EAGAIN;
> -			} else if (ret != -ERESTARTSYS) {
> +			else if (ret != -ERESTARTSYS)
>  				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in write (ret=%i)\n",
>  					ret);
> -			}
>  
> -			goto end_unlock;
> +			return ret;
>  		}
> +
> +		mutex_lock(&fifo->write_lock);
>  	}
>  
>  	txbuf = vmemdup_user(buf, len);
> -- 
> 2.39.5 (Apple Git-154)
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
