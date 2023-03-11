Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE77B;
	Sat, 11 Mar 2023 12:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02895C433EF;
	Sat, 11 Mar 2023 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678537601;
	bh=9YpHoplazewHr1nZXu365XUjLxsDneDUTbn5yRvSytw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYJq0EIKX3uSEZkC2fdRfFBZuMvdQYIhMVW1L7SQPCSGDShMEEQxqbFN4MXDSVl2E
	 YsEvkbTuX0whYqqU+BAFKoTbKVcxCWNwGtaD9mrC1knfI905PPJTsxiJlAJ1OTX9ig
	 s1r+vfvOinxaFdGzr9nRGY7XepH44URSvrR0CJGM=
Date: Sat, 11 Mar 2023 13:26:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: axis-fifo: remove tabs to align arguments
Message-ID: <ZAxzfiOoW0SfW5qD@kroah.com>
References: <ZAxsyX8n7G92nlJh@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAxsyX8n7G92nlJh@khadija-virtual-machine>

On Sat, Mar 11, 2023 at 04:58:01PM +0500, Khadija Kamran wrote:
> In file drivers/staging/axis-fifo/axis-fifo.c, in line 386 and 529, the
> last argument is indented as if it were an argument of the second
> argument. Remove tabs to align the arguments.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
> Changes in v3:
>  - Do not align the line 530 since it is not part of the last argument.
> 
>  drivers/staging/axis-fifo/axis-fifo.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index dfd2b357f484..b119cec25a60 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -384,9 +384,9 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
>  		mutex_lock(&fifo->read_lock);
>  		ret = wait_event_interruptible_timeout(fifo->read_queue,
>  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> -				 (read_timeout >= 0) ?
> -				  msecs_to_jiffies(read_timeout) :
> -				  MAX_SCHEDULE_TIMEOUT);
> +			(read_timeout >= 0) ?
> +			msecs_to_jiffies(read_timeout) :
> +			MAX_SCHEDULE_TIMEOUT);

People have been trying to "polish" this mess for a long time, and I
think it's better to step back and see what is really needed here.

There is a module parameter, read_timeout, that can only be set at
loading time.  As it can only be modified once, why are we doing an if
statement each and every time it is read from?

Instead, in the module probe function, how about doing something like:
	if (read_timeout >= 0)
		read_timeout = msecs_to_jiffies(read_timeout);
	else
		read_timeout = MAX_SCHEDULE_TIMEOUT;

and then only ever use "read_timeout" here in the
wait_event_interruptiable() call?  That should simplify this much more
overall, and hopefully allow us to just get rid of the module parameter
eventually as that's not how drivers should be working at all anymore.

Same goes for write_timeout.

Overall the code should be much simpler and easier to understand, which
is the end goal here.

Can you try doing that instead?

thanks,

greg k-h
