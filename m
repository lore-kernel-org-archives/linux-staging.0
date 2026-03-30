Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A63750DA;
	Mon, 30 Mar 2026 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886366; cv=none; b=VznyICnd4iapKAYr5RqAxd3bXSoI0uHjme4HGAqpSO6SZMflIZYC/3HZtwW66NvwRML1AzhI4wV8Mk4uE9447TmuDE1H/+yuvc4ehkBlmAfiiCXilRjlKv63wsRRqTq04GfafkckiNol/6uF3rBI+Ti+kAkm60GWpnpw8MPFPkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886366; c=relaxed/simple;
	bh=iWsnr4cfytpCHYdFTAYt3IgiDwUqUtTs/rvb5IDH26E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad/cCfSPPu6IWGuk+SyfFW6fJBmSGqGQCIJEOixbbhdJ4JRfcfll9ECzfrv/ODZRW6Nc2HkLYTgJCQDYNczBVYGyutJO3bTY/urlq7y0KvM+8hm966xgnEk9sGdNiuxgBE+ztdTb4nSZUwU1yyZ0uJozuRyDLNhM35WrZyi1cHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LXqOW8bt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LXqOW8bt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E409FC4CEF7;
	Mon, 30 Mar 2026 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886366;
	bh=iWsnr4cfytpCHYdFTAYt3IgiDwUqUtTs/rvb5IDH26E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXqOW8btqh7jrIK3dbPy8t5b87xa509pG6xwuC4ArBBtyLHGGPpSLwC+VzZ5BvmlN
	 I8Z9A0pnHSOJSSBlhu5Rx61GlLHdKdubzEpDuSC+f2tPAnASw11x0Bek41PnOQLWiA
	 GICoiHPFUzSBhuiYEpVkNByy7bZ61DyWb4ks6ssY=
Date: Mon, 30 Mar 2026 17:59:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tanjim Kamal <tanjimkamal1@gmail.com>
Cc: Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix alignment in
 wait_event_interruptible()
Message-ID: <2026033014-mousy-counting-11fb@gregkh>
References: <20260329112352.31917-1-tanjimkamal1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329112352.31917-1-tanjimkamal1@gmail.com>

On Sun, Mar 29, 2026 at 05:23:52PM +0600, Tanjim Kamal wrote:
> The line was misaligned. Align the arguments with the parenthesis above
> and wrap the line to prevent crossing the 100-character limit.
> 
> Fix a CHECK issued by scripts/checkpatch.pl.
> 
> Signed-off-by: Tanjim Kamal <tanjimkamal1@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870..1c34de020 100644
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
> 2.47.3
> 

No, the original code is fine here.

thanks,

greg k-h
