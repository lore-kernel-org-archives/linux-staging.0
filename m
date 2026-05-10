Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1803B39B483;
	Sun, 10 May 2026 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429394; cv=none; b=QC5khGJLQxoQPU61blA89aPTJzc3fEFg2rpi+GV0EKzOkBan3KXIzjpZUkCWKF/aIx1Z9WcBrN4eYOwHqB3w7x5/qAfEdeY40FSVzLQwN538cQnluLQeHO/L3i88w7GyxKRNwmQzNwHDNjiYN9ic5/VMhwNPWzpA1hiQ41PTYBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429394; c=relaxed/simple;
	bh=6/qBy+30UOU5yShzCH/a1o4rLsX2M3n2P6q/NMQJFbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXB2IYpcWD97YOcFwT2E2Bi4TT2L0zUB8+ZVWMdsXr9//umlV0qmxk2rmhCzNE6ek33sQ0tN4e8svqxtkk6tAfk7NeU0yDf4jXuddIdHrOeo64NQh89uK/avD8QEd5giSTgt+TmLS0HwVShtnsvmrhieRG8jbq6pyUWnCzP6eJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p4SPS1N9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p4SPS1N9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D48C2BCB8;
	Sun, 10 May 2026 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778429393;
	bh=6/qBy+30UOU5yShzCH/a1o4rLsX2M3n2P6q/NMQJFbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4SPS1N9p7FKvK531lhI83wdgumScSJOY4tP0N1zASAVfh3QESDh+XCzdv4gOhJ5u
	 AQC0bKvXaNi4BQkw6vrxsnA9i5P7mq76yJ243N+x16vd00EbxPdGBAB/MqeMU6Wkmc
	 +ueHqI6ReAOyRcLhMkbGmL++BL39kBR87qMp9ih0=
Date: Sun, 10 May 2026 18:09:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: Jacob Feder <jacobsfeder@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Fix alignment of
 wait_event_interruptible arguments
Message-ID: <2026051047-dining-overcome-d9dc@gregkh>
References: <20260509171538.46396-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509171538.46396-1-pramod.nexgen@gmail.com>

On Sat, May 09, 2026 at 01:15:38PM -0400, Pramod Maurya wrote:
> The second argument to wait_event_interruptible() was indented with a
> single tab instead of being aligned to the opening parenthesis. Since
> the full aligned form exceeds 100 columns, break the condition at the
> comparison operator and align both continuation lines to the opening
> parenthesis.
> 
> Fixes the following checkpatch.pl warning:
>   CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..1c34de020cf8 100644
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
> 2.52.0
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
