Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70E2E764D;
	Tue,  7 Jul 2026 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418560; cv=none; b=gcVl02lKKk2Au0BVfe5I6nCRIemXOofkYwOyu76O21tPVxXA0J+dx1FnefZSz+6OncF1YiyLcHX6DggjSWfgeX1W/4PS1r4zcvNA7TRqJYi/YjX+M945aRjERcBw4zdNJb3djr2OuLqPu/J0j6+6psHNIlz9yx1hJee2ImTARk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418560; c=relaxed/simple;
	bh=1sCH0DlEewrPmiuO8IZOxSH2CgeEKz2UtTwva3Ok/Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovYJif8MJ+JXIb3EW+o0wdXu44kJl8AOAjfC3BBes8GHhfk99uuT0YNkZHufMcTQaE8mh4aWv4wmg/Plci0GsuDFzFwyxSKocwE6H1h3BhfYVzTCswfX3T4zzt+59+c+t8fs65HIevXxeCr9U6dSNlnCwKQs17OdQsV2Jqy4YpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PUNduoV4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PUNduoV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C904A1F000E9;
	Tue,  7 Jul 2026 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783418559;
	bh=57CDmQjoLbyKk8RR+KVf5l43yCOdiki/c1QQ/u5yaes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PUNduoV4qD1VdtPByu06MNikO/GZOr5w816luyGSQ0bOJkQIVSj2I7HRRrn1CVhfI
	 CRrTCO6OraqjC2W9BfncGVaneO5QHtVLPv68b4ArGVGbZZsz6tBScFG2No8L+QuGYs
	 VhoPxb/fwFSJTLJF7f9q731oIWKAPZ+ORFo83PGU=
Date: Tue, 7 Jul 2026 12:02:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Condition00 <anant.kavuru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ovidiu.panait.oss@gmail.com, error27@gmail.com,
	gustavopiazdasilva2102@gmail.com
Subject: Re: [PATCH] staging: axis-fifo: fix wait_event_interruptable()
 continuation alignment
Message-ID: <2026070714-purge-sweat-3066@gregkh>
References: <20260525120116.86216-1-anant.kavuru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525120116.86216-1-anant.kavuru@gmail.com>

On Mon, May 25, 2026 at 05:31:16PM +0530, Condition00 wrote:
> Fixed the continuation indentation in axis-fifo_write() so the code matches
> the kernel style and passes the checks by scripts/checkpatch.pl.
> 
> Signed-off-by: Condition00 <anant.kavuru@gmail.com>

Real name please.

But:

> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..7b96be052c55 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr +
> +							   XLLF_TDFV_OFFSET) >=
> +					       words_to_write);

Isn't this now harder to understand?

thanks,

greg k-h
