Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D893A6411;
	Thu, 21 May 2026 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360404; cv=none; b=dpIvrLy8UsHzM0YoDWSpI0fcyWWdq1JvYhWsPg99G7ypFZ78L0cfGdrKaIGMCIIgJYIshYcGgGDTvnhnv+IwFXexcdi/MFrqA6QxNt5fgS+3z6WyHrkjbIvHeqrXBkqaRtcytJoUjXU5KAIZMTMad1QC9ScuHvm1erzS875xA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360404; c=relaxed/simple;
	bh=emtXT2ncnGWd8SqhjCQDBWLxSPea/XBugXZ3B5N7avQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5AvXnW72R1RfGRegJOQKdha5tWr/IJpIf+kb9sRuq8MyFKqgDIVsFmZA4rjeA/BD+/QHbEA/C+WV16OgS+YGxFyoD18Qcik7GPM1OY4LirXQaSPoMygYxlViHkp1RBuLnQMJz43DiABgzNJ/yzVvXQPIGJ3CGaqiSYbOYSBSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G2L/Ypuo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G2L/Ypuo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587921F000E9;
	Thu, 21 May 2026 10:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779360402;
	bh=6WE6bk5JZw5U3qjwmp6dFTS8SWV73Z5LDTvT4mGrQX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2L/YpuoiwD92NhUS2pL2fbHJfDy/FxzPT7uERw8CKp3X25QzcA5MHUOxOBKOcv+v
	 YA7YlHx6MRLYe5ws4EC09DzRfleyNwM2RO8dtqRSf6e8T9wml/ryAI/Q9jVmds/G/L
	 tGbaZG3OljCCdWcXZmVsoBjd46UQLA+EQXFwW2dQ=
Date: Thu, 21 May 2026 12:46:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luiz Carlos <luizcarlosmdea@gmail.com>
Cc: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: uart: document locking and fix
 indentation
Message-ID: <2026052125-bath-lapel-651d@gregkh>
References: <2026052154-spearmint-eleven-1121@gregkh>
 <20260521101245.5540-1-luizcarlosmdea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521101245.5540-1-luizcarlosmdea@gmail.com>

On Thu, May 21, 2026 at 07:12:45AM -0300, Luiz Carlos wrote:
> Add comments describing what the lock fields in struct gb_tty
> protect, and fix the indentation of the
> wait_for_completion_timeout() call.
> 
> Signed-off-by: Luiz Carlos <luizcarlosmdea@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..85586e9a4341 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock; /* protects iocount and oldcount for TIOCMIWAIT */
> +	spinlock_t write_lock; /* protects write_fifo and credits */
>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;
> +	struct mutex mutex; /* protects disconnected during lookup and removal */
>  	u8 ctrlin;	/* input control lines */
>  	u8 ctrlout;	/* output control lines */
>  	struct gb_uart_set_line_coding_request line_coding;
> @@ -318,7 +318,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty)
>  		return 0;
>  
>  	ret = wait_for_completion_timeout(&gb_tty->credits_complete,
> -			msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
> +					  msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
>  	if (!ret) {
>  		dev_err(&gb_tty->gbphy_dev->dev,
>  			"time out waiting for credits\n");
> -- 
> 2.54.0
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

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
