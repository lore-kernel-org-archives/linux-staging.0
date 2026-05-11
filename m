Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AD33A5E61;
	Mon, 11 May 2026 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486439; cv=none; b=R3CnsDF4kX0B+RlkG7w51t2xTEmYDy6VESOPKNTGm2Vm+kQHK/GxUnlrOAnGiHyMLNMC+yyTFFAiEiN5cM6Atr+ZW5cfkdFhfmJXoaBHWFGjjXec9H3YTBogsj/BkgdoC17wKee0G/ysacvo/RjNjdOZlCTdQPjsfjlfpPi/Q9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486439; c=relaxed/simple;
	bh=gmA3l8MFsnlGhoyD1HQSO0+mo13ybnLGhHm64rrzYys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqY8WZA1jB4gp+J6ugYlgoUZ6lHwKj8cB4rMVJrOEJZse1Z7n63T6MVOesWK+M58Xfz2Ea3hvT//NNauAXT1FW5/KqDhCJ9he23YDV6Umw86KqCCMEiIKtrC10Zq56nvfmDB4V5F4+nzMDi8OkPolbl9GVVGr8hz25fpYC/6YNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C0T4Xw/J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C0T4Xw/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417E3C2BCB0;
	Mon, 11 May 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486437;
	bh=gmA3l8MFsnlGhoyD1HQSO0+mo13ybnLGhHm64rrzYys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0T4Xw/JAL+RxWfxNlaawBgi+LABHHxyZ+5NM4uP8dyGT0N5t8nQH2uA570O7zuEF
	 97yNaLQQURzH2aIwvAtsxrEBw7JNYkuZOmhx2vYv+t1zTd1A+4u+fTND5+jaTETaCS
	 TLr05CjjoymAg2wBaKqgLZEBZu8WcNHkiob2Q1gU=
Date: Mon, 11 May 2026 10:00:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daisuke Iwasa <iwadjp@gmail.com>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix alignment in
 wait_event_interruptible()
Message-ID: <2026051124-synopses-vaseline-8aaa@gregkh>
References: <20260507184037.43613-1-iwadjp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507184037.43613-1-iwadjp@gmail.com>

On Fri, May 08, 2026 at 03:40:37AM +0900, Daisuke Iwasa wrote:
> Fix a checkpatch warning for alignment in the
> wait_event_interruptible() call in axis_fifo_write().
> 
> Adjust the indentation of the condition argument to align with
> the opening parenthesis and wrap lines to satisfy line length
> constraints.
> 
> This is a whitespace-only change with no functional impact.
> 
> Signed-off-by: Daisuke Iwasa <iwadjp@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..0ec9b6c5e7d2 100644
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
