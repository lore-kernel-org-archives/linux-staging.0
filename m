Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1C385D9A;
	Thu, 21 May 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352638; cv=none; b=q2Iuw0ZGIY3HUG+Ga6g/DPhxFroUz4f5otc1CEn1RFPfTDnWaSkLh6TybTx6T5+mwdATdkExNSYCTWCJewM87jZkL8mbfpEudUNYq5v8UFAul5vfbqml0ZUdHuYUTlS1bqlyvgk2YS6wrbVoAT59GPcWRSUNf6/aLW+pDaURPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352638; c=relaxed/simple;
	bh=Gs+8vKQF2QaCsgI/K4F2Bhj+rz5QB2OfcKfgDZaGRSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQ3Gon1igwWJQUHqFBJON9R7X6tOrwCab2x6sFW/6WaAYQr7msW4i9CIHJ3BzUfpkLg9sYFlhVVJmpuwAUiT6ygPO0uvFh1b+BQxVllrVrdaOvOYHHsUlIeEKLiLMZBZsi4jxRg+zVI8Fnfl0rEc5UEEmIl/KgIUYc0tO6mEnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q9VCGQEN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q9VCGQEN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F141F01573;
	Thu, 21 May 2026 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779352636;
	bh=AxbXbaT2RN7htR7N/HykoVNH9+lxb1aO0SEo0OY6GDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q9VCGQENyTnkDmHeMD981Qi+QgDzqZZ0aGx55pKIvFh/5wDrMoqtJUpFrw4OkDYcL
	 RopXyP+7vaMLoD8opZp0V//wy8xqU77i/iVxl024cheW4+/ZLEUXAPox2Y8ZD/6fzJ
	 9m1tRF7/UnhsqldxGOI+FQeHpZK00M1T0bAhsFuQ=
Date: Thu, 21 May 2026 10:37:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AkaLuiz <luizcarlosmdea@gmail.com>
Cc: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: document locking and fix
 indentation
Message-ID: <2026052154-spearmint-eleven-1121@gregkh>
References: <20260520024128.68942-1-luizcarlosmdea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520024128.68942-1-luizcarlosmdea@gmail.com>

On Tue, May 19, 2026 at 11:41:28PM -0300, AkaLuiz wrote:
> Add comments describing what the lock fields in struct gb_tty
> protect, and fix the indentation of the
> wait_for_completion_timeout() call.
> 
> Signed-off-by: AkaLuiz <luizcarlosmdea@gmail.com>
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
