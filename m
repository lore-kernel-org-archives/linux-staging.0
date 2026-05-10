Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD943A1E72;
	Sun, 10 May 2026 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429306; cv=none; b=mPUjTVajuVYdJy2bplWsSgft/afMCzK/v/piLGGBnJBymHFb8fmYUODkRR5caT4X4V3VOg2IHQWOSmtH8RYqdkwTJFRbK7PQJbvKPsysVL3HrZRJpGAJGtcuwUn8VsPCXAki12X/hiTk8rEQmQ3vU0r7RRj2g4NlADjHZX5iQVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429306; c=relaxed/simple;
	bh=J78P0T3oeQ7kdgq3BHbAVC37ueh2ueoVmZOho8VhdTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKebfO1cPWxmdDh6u55RV+zfVCoAL/2TDKGa5sy4QIDtnw2+Wm4KMXNOpYN5IGph5NjEOlEZ8aKT+h3GJB7PcW7yOvni+NrBLu4U7S6kveCgTz2WazEPWd92D41QMq2yJtrxnQ65fn4gnBpNSrx09S1VHY4UQI61iojZkYhIHjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ARu6V1yJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ARu6V1yJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D9CC2BCB8;
	Sun, 10 May 2026 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778429305;
	bh=J78P0T3oeQ7kdgq3BHbAVC37ueh2ueoVmZOho8VhdTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ARu6V1yJKIZE0vBfqAsQ9TqEaTQBQA0TcjbX0CrJ15KeTF7VxFdNvBt6VM/3HApXY
	 7q4LTCIxyeYbH1Ct11H+AdnR6ByDCAXfQugN7AgRBe5P5EkCBhrXdq7W6Lo3A9Aj6k
	 RdeXKoOVjueirYyfDmzKUTSsoA1f13q1DUOrT0Iw=
Date: Sun, 10 May 2026 18:07:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vivek N <nagaraj.vivek@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: align arguments with open parenthesis
Message-ID: <2026051012-detection-circle-c16f@gregkh>
References: <20260510074547.10003-1-nagaraj.vivek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510074547.10003-1-nagaraj.vivek@gmail.com>

On Sun, May 10, 2026 at 01:15:47PM +0530, Vivek N wrote:
> The wait_event_interruptible call had its arguments incorrectly aligned
> with the opening parenthesis, which violated the Linux kernel coding
> style. Re-align the arguments to improve code readability.
> 
> Signed-off-by: Vivek N <nagaraj.vivek@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..e8facc9b429b 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr +
> +					       XLLF_TDFV_OFFSET) >= words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}
> -- 
> 2.51.0
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

- You sent a patch that has been sent multiple times in the past, and is
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
