Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEFD18027;
	Thu, 12 Mar 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309518; cv=none; b=Sr0zejKq6kv8WrcjYgg+ySykToQCZtPMA6D8LBYEspkKEfABwuZvf9T1SnORdbwQyGlYxaa9gzYzPcwmzc3WbQqUWh5ZCeg8Z2i8CBv+iyB0t25xsmFcSuM+J74/9Abs9tbMr3tO+Lbte+6whvs0fd/0rrNOv0xZcbLRTYcYaIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309518; c=relaxed/simple;
	bh=jInK/LGLCbwq5jabr/e+FgPgHULnENP/235shKIXYDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7PFQMTuc43iiepMFjtyK/g1hS5OzAggMNcSnUwyHyU1g/X0wGq+d3H4evmgyn1A+DXYvEwp5dfVEmxS6mCrwj33Byr2WsZTqAMmFJSw6uGfTgcnTk+9rQJslCvhEZ3P7kLK5Z2KhwT52RWU+dx4CUBAWlbeoRHDL4NYnIVmJcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lf37sTkW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lf37sTkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6133C4CEF7;
	Thu, 12 Mar 2026 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773309518;
	bh=jInK/LGLCbwq5jabr/e+FgPgHULnENP/235shKIXYDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lf37sTkWYCyvtTiq7r96c5GIpVBSw65e6wX8EF7DSJzCUJgGHlhHS3jtYjXupvTtI
	 nq0Dkdn/dNHehY7tz/+rCIfFvH4/AU3afNlY9QccjORLjkkvJZBqKjuro5VoquMsTA
	 ymE2lUlyD7SqhA/37oarQcfVBlXloXsuqFnCN86E=
Date: Thu, 12 Mar 2026 10:58:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zile Xiong <xiongzile99@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix indentation
Message-ID: <2026031212-passivism-henna-eeb0@gregkh>
References: <20260312093721.84291-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312093721.84291-1-xiongzile99@gmail.com>

On Thu, Mar 12, 2026 at 05:37:21PM +0800, Zile Xiong wrote:
> Fix indentation to satisfy checkpatch.pl:
> 
> CHECK: Alignment should match open parenthesis
> 
> No functional change intended.
> 
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index aa90b27197cf..c64a7249feca 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> +					       >= words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}
> -- 
> 2.20.1
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
