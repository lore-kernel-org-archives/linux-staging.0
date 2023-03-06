Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045417473;
	Mon,  6 Mar 2023 21:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Myq4oW0FNya1g2HlnuWwn+aBlWwPfsZwgZBVa+Mj0+Y=;
  b=GAEXEMtJ/xd8nOEm5BB5kwL43wnEqTOGdjLCknmWLCcLqM7qJBbXVQKe
   uDppI9NsCl3E5825UEm1okaRRKCsP/PXjzRGk9UeYU0aJrfz3IrmAgj2z
   m5Oy7wzaDsVvI6Rdq7wMQjCZlh+DM12eWq7e86YLt3r+SHRJqyjP7TLFB
   0=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,238,1673910000"; 
   d="scan'208";a="95740869"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 22:08:19 +0100
Date: Mon, 6 Mar 2023 22:08:21 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Khadija Kamran <kamrankhadijadj@gmail.com>
cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
    gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: alignment should match opening
 parenthesis in axis-fifo.c
In-Reply-To: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
Message-ID: <alpine.DEB.2.22.394.2303062202500.3050@hadrien>
References: <ZAZSmPpB6fcozGa4@khadija-virtual-machine>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 7 Mar 2023, Khadija Kamran wrote:

> In file drivers/staging/axis-fifo/axis-fifo.c the alignment did not match the opening parenthesis. So, a few tabs were added to match the alignment to exactly where the parenthesis started.

Hello Khadija,

Thanks for plunging in and being the first participant!

However, there are a number of issues with the proposed patch.

1.  The log message should be at most around 70 characters wide.  You have
one long line.

2.  The log message should be written in the imperative.  Instead of "a
few tabs were added", ay "add a few tabs".

3.  I'm not sure that it is worth creating a very long line to respect the
rule about (.  On the other hand, the way the code is written at the
moment seems to be very misleading, because the third argument to
wait_event_interruptible_timeout is written as though it is the second
argument to ioread32.  So you can adjust the argument list of
wait_event_interruptible_timeout so that at least all of the arguments
that are not on the same line as the function call are lined up.

julia

>
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index dfd2b357f484..6e959224add0 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -383,7 +383,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		 */
>  		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> -			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> +						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
>  				 (read_timeout >= 0) ?
>  				  msecs_to_jiffies(read_timeout) :
>  				  MAX_SCHEDULE_TIMEOUT);
> --
> 2.34.1
>
>
>
