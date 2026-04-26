Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22F36E494;
	Mon, 27 Apr 2026 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261834; cv=none; b=BY5h2dfiSRwHZsCMU6xa8fSA54+p3/NKV12oaJsQccXXHgcyQxZB5csVR9owYOULxptZyQoTpcgo5M5pwy401TDjKvZl6YiOdsHWjAUQxra0mxZ//4iiKrM+G7AXI/EPdLjDhAfyQtHurn0iPdgY/os3wTp5QeHZCAUWTpfQAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261834; c=relaxed/simple;
	bh=6HSHMQCjRIRlwrkTSys6J4KqZN82MfGHjysuZEV32D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpiQh1ZQ3QT5OuLH2fPomj/Bb4YhjGa+A39mi1OMFMmEkvV8zU0YAp7GkqUkBUxga7mWTWBqkhgDeHzTm5A72RFa33pMjcc+2YwToFqSFusA+gyQj/aReaJARzQhUWyEJL52DRH8r7ETc28WJlp5YWjxlqw2UYX1f8IWoKd6uKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o/F2NEqW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o/F2NEqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642C3C2BCB7;
	Mon, 27 Apr 2026 03:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261834;
	bh=6HSHMQCjRIRlwrkTSys6J4KqZN82MfGHjysuZEV32D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/F2NEqWPrMj6q/b+JvbHPrU53i4pOADuKDQ8NN6T+0e+WlmFrX++QYKtuiQeIsTC
	 TXztyyfPiB5G/JdGIFpOXBwu6rnLxKprj4+h4XoWrEFAir5zanSUBCefYUW4Cr5PN4
	 OrLecMVIOXztpOsdZkbtmEmo1W4lHnlmv04khjug=
Date: Sun, 26 Apr 2026 21:06:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xinhong Hu <tp5092@foxmail.com>
Cc: linux-staging@lists.linux.dev,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: align write wait_event args
Message-ID: <2026042609-buckle-craftsman-1543@gregkh>
References: <tencent_E645C114ED280A65BC2FD65D8698F196A305@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E645C114ED280A65BC2FD65D8698F196A305@qq.com>

On Thu, Apr 16, 2026 at 07:24:36PM +0800, Xinhong Hu wrote:
> The axis_fifo_write() wait_event_interruptible() call used different
> continuation indentation than axis_fifo_read(). After matching the read
> path, the second line exceeded 100 columns, so split the condition across
> two continuation lines.
> 
> Reported by checkpatch:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Xinhong Hu <tp5092@foxmail.com>
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

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
