Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285341CB5A;
	Tue,  4 Aug 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827940; cv=none; b=FNH5fVkaGqUTQSKqVpLUx9gMSnmtqSO1e3OyblSQsW6afq6ZbOG2TV0SE7XEDZRYLdi+OjoiFCRyCt+maTFyi4ge4Cfdw+TvdV1uSW+YpPrdxjj+quVMcRFg8GjB+TUnozPRlwAz6MuYDQizGcc1HcCIxfMvPi4a7TZw3tCJwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827940; c=relaxed/simple;
	bh=waxMyW9BvaRZJz3wKMSF5jRppuRiNa+eYHmK4fHt3bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfoBZOtap6XT56QcU2qTq9Y9ivSDZgsXgV9gO3nQUreQLAnHRUloan70vY1UZglWSn9xLp1x6TI1fOYW1he1oxFy85Te6ID7YajxOsvrupj0EzXc3mJ36kckwjSM7Ua7ORlF2rJ+CfhkVewaoFGydk64U1ce3wjdp4j+OFaKBP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ip63jxhL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ip63jxhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC1E1F000E9;
	Tue,  4 Aug 2026 07:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785827939;
	bh=ZOBfMtxU3ZahdebTK+o1kmIBvilVsbhtQGHId9EBX1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ip63jxhLuKcz7QNM6mxruaKVRSLGDyZTMgebpTiqQu7HyZeR2Bbl0w25+eu/2bHog
	 yAmUaM221bY1gFycThu6a1W+X20VwO3KvdC8493TZjW23B7wdeHk1coyzWsW3Gom9K
	 CJPUR9UehdG/B1e3eC3inAhDy3f9z+ZlRqDDP/BQ=
Date: Tue, 4 Aug 2026 09:17:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary parentheses
 from return
Message-ID: <2026080414-concept-abrasive-364a@gregkh>
References: <20260803180605.430-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803180605.430-1-work.ashmitkumar@gmail.com>

On Mon, Aug 03, 2026 at 06:06:04PM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that return is not a function
> and therefore parentheses are not required.

Ok, but:

> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c       | 2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea..ed09be2fed4 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);

That's not what you did here :(
