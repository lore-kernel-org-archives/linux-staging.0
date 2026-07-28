Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049A93D8915;
	Tue, 28 Jul 2026 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222506; cv=none; b=bNUrSabvxeZrJhLYQZFCiqZ7muHLS2R3imIDyYtoewg0U2nfCGeO1eajzveLqF1re0j94mpvi2sXpEqbskg9+ynOejlS25Hs3THJzEWus+imE+6NJbRvhB84uBr9f4t2pg2nwiUl2gYQSJbiIf2UqercDHind8KSmwsnLBVk8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222506; c=relaxed/simple;
	bh=hRuVzlUiPTt4QAfKDyBGuzpFcLZPj8vTdLMdBUW0JDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6qkvTKxiiUha9N5yGDCOr3qHYgMhqmLwZim8kTJT/SSg9Xx7bXWxi43Ww6+NfRVBiYxp78H7U+UGaGjpOx9nHp20XV8AmDGTgvGFUBCdpsbSXsozOVRUObEXIm91TsQLinGi37/fxP6BbLfV9YbPJ5X2srqssbvL9Q9i9/tdoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ftBwn+lR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ftBwn+lR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948151F000E9;
	Tue, 28 Jul 2026 07:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785222504;
	bh=1OKW1ti8Q1K4dXKLUm1SWmHQiBuAPDOq3lzIl0dIiqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ftBwn+lR+3xOFjtPIXaoCIJTRaofimJhes5LNWFj1nLebpPe/Vcw2jON/4+9scb98
	 NuS3tuPRppy/JvAOPA0jdb3/GiOTzgptbzFa1h8TRXbOyNVrlHKxv5n/V4KatCPsdz
	 2BPHNhgO7SSNGkzv4aF5+m7GWq92369axpzdz2y8=
Date: Tue, 28 Jul 2026 09:08:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, error27@gmail.com,
	gustavopiazdasilva2102@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Fix alignment in open parentheses
Message-ID: <2026072848-crinkly-resolved-cc55@gregkh>
References: <20260723163110.126797-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723163110.126797-1-jeffinphilip14@gmail.com>

On Thu, Jul 23, 2026 at 10:01:10PM +0530, Jeffin Philip wrote:
> Fix checkpatch error:
> "Alignment should match open parenthesis" in axis-fifo.c
> 
> Thanks,
> Jeffin

No need for this in the middle of a changelog text :)

> 
> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..e8facc9b429b 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr +
> +					       XLLF_TDFV_OFFSET) >= words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}
> -- 
> 2.55.0
> 

This change:
	https://lore.kernel.org/r/20260721030618.27784-1-amnashamraze1@gmail.com
does it a bit better, right?

thanks,

greg k-h
