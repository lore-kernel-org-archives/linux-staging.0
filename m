Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E31FAE;
	Mon, 13 Mar 2023 06:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCF4C433D2;
	Mon, 13 Mar 2023 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678689451;
	bh=r9kW8lFttxXP+IM+CgVFDPUgdBtmyVi6pNxZ7oi2iEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDW3NWDXx+DN3mgyjqzm3PvnsVKTvI8/hkt/KAQ8mcFBRYanq9Zv67BPCkYB0RNaD
	 C8Kk0EGbyviugjrJyvp0jEAIcGDRfq3fR64XRpHczTZxDnCaN80MSQUbIMQ49Evffn
	 1yMXwiClL/P+YHQvFrM111bu4YBm/paZoOLn3HLg=
Date: Mon, 13 Mar 2023 07:37:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: axis-fifo: initialize read_timeout and
 write_timeout once in probe function
Message-ID: <ZA7EqO0XQ5L8fZej@kroah.com>
References: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZA4M3+ZeB1Rl2fbs@khadija-virtual-machine>

On Sun, Mar 12, 2023 at 10:33:19PM +0500, Khadija Kamran wrote:
> Module parameter, read_timeout, can only be set at loading time. As it
> can only be modified once, initialize read_timeout once in the probe
> function.
> As a result, only use read_timeout as the last argument in
> wait_event_interruptible_timeout() call.
> 
> Same goes for write_timeout.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index b119cec25a60..7ec8722cef7d 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -384,9 +384,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
>  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> -			(read_timeout >= 0) ?
> -			msecs_to_jiffies(read_timeout) :
> -			MAX_SCHEDULE_TIMEOUT);
> +			read_timeout);
>  
>  		if (ret <= 0) {
>  			if (ret == 0) {
> @@ -528,9 +526,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		ret = wait_event_interruptible_timeout(fifo->write_queue,
>  			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
>  				 >= words_to_write,
> -			(write_timeout >= 0) ?
> -			msecs_to_jiffies(write_timeout) :
> -			MAX_SCHEDULE_TIMEOUT);
> +			write_timeout);
>  
>  		if (ret <= 0) {
>  			if (ret == 0) {
> @@ -814,6 +810,16 @@ static int axis_fifo_probe(struct platform_device *pdev)
>  	struct axis_fifo *fifo = NULL;
>  	char *device_name;
>  	int rc = 0; /* error return value */
> +	
> +	if (read_timeout >= 0)
> +		read_timeout = msecs_to_jiffies(read_timeout);
> +	else
> +		read_timeout = MAX_SCHEDULE_TIMEOUT;
> +	
> +	if (write_timeout >= 0)
> +		write_timeout = msecs_to_jiffies(write_timeout);
> +	else
> +		write_timeout = MAX_SCHEDULE_TIMEOUT;
>  
>  	/* ----------------------------
>  	 *     init wrapper device
> -- 
> 2.34.1
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

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

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
