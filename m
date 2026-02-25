Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878F2C15BE;
	Wed, 25 Feb 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045000; cv=none; b=PTfgHXQn8fMzvrp+O7YSX4F5cIEP/SwpmvqGFbWEVA/6YDjPUzcFZCHuA/0H0IP6OhPCt4xy/Tatqt7q2B3F9JdeuRypm6dGml0JhafFXejCgeLxHuhvCVYfYEFKLVTIUl7H2V1x7VC+fc1Zozt89Mh7jIByYf1A/dBPTS6A/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045000; c=relaxed/simple;
	bh=x3Y5ky6w6cm6G4P76BH63UhEp+MPovbDdAkNNr1ukpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8SIzFe3qSrnxNM0bImkZPsVO4g9hMbE5vyqnT0NqIgK7itfy6cHPG3a2pcHvZncJUvBx5vkS9UQUOhUrZaYd7rLo9Eicm27TMPeAxOfixDUecU6ZF1cs2h7ioPwY9/zc+yZTVx/BeVJXNHo3dWI/o1k0+Fn3AZLq+yzeM/xjGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VgYr52uY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VgYr52uY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17441C116D0;
	Wed, 25 Feb 2026 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772045000;
	bh=x3Y5ky6w6cm6G4P76BH63UhEp+MPovbDdAkNNr1ukpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgYr52uYeJzSMyvaaGx0TSV6m8dEugb9Xfj0hLa4ZAwkL5MuxBYp2qj3gBTSbsl9Q
	 n/uRXkCQXzUgs5jw//ou6RQDiH/S9ZTBI99tvh0AgdVJWE+53O5jxPqEhlx64bSvnh
	 nswr5Vlggk07f3d2QgUocGAAJSWDV9I7MzZfdz4A=
Date: Wed, 25 Feb 2026 10:43:12 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: uart: fix style issues
Message-ID: <2026022552-overbuilt-concert-4506@gregkh>
References: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>

On Thu, Feb 26, 2026 at 12:08:35AM +0530, Shubham Chakraborty wrote:
> Fix checkpatch.pl warnings by adding comments to mutex and spinlocks,
> and fixing alignment to match open parenthesis.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..1d2c4ef70865 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;
> -	spinlock_t write_lock;
> +	spinlock_t read_lock;		/* protects read operations */
> +	spinlock_t write_lock;		/* protects write operations */
>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;
> +	struct mutex mutex;		/* serializes port operations */
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
> 2.53.0
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
