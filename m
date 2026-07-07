Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808636655C;
	Tue,  7 Jul 2026 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418485; cv=none; b=AbTqCp1ySg+FmkDUqZKLZhKGHfwYXfIfhB1xbuPWB5TJJS6ZIdBn5c5hqis236OE+QxQPnwvUwc/NS0b9lCpJYuFQyU88ZWz1dR363TlAqAUnI2sshna4zdFgZX+hRYNElkMPdL+u0Idq3F/O1s8HrcR0Oa7YevArtQ97RKEUx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418485; c=relaxed/simple;
	bh=peAQcNDOsfeY1g5P48bUfSGK6QvDEVemRvtVkNib1vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0+JWHB628YBx/7k9paY9pIRrxv34wwyfLlO/NL+xL9OYkxONoh29jvTO2/dmLzur0dCY57CZGMxZD8XaZRiVqQKOqGoJKupw2EVzMUjhC+TXGchq+ugjLeq+qg6Vw5yP6qoyVW8sjCb8NJfzPkiwNMC4978qt7pA2cVsctMw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Sx7GWAjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Sx7GWAjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989491F000E9;
	Tue,  7 Jul 2026 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783418484;
	bh=XgM11lnki3yShdoec4RDxht3yzUWATvwzY9CR9YtZxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sx7GWAjm0cAwTMoK/aK+pSyz7jdocSwsfmY2fF6TEH/S9fzMTJt8wEqZAcbOFKKqA
	 DkwI3bBXIztz99OKGOptuRlaxxh57rqoR9GrnIcLv197rbaK4Ra/HGxJrLWjvJ6cWG
	 jWxIuVtwgqGa2bAzPMPeaetMv7tW5IzFnSIoX1n8=
Date: Tue, 7 Jul 2026 12:01:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, gustavopiazdasilva2102@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Fix alignment of
 wait_event_interruptible arguments
Message-ID: <2026070753-deprecate-storm-b4be@gregkh>
References: <20260523193845.195475-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523193845.195475-1-pramod.nexgen@gmail.com>

On Sat, May 23, 2026 at 03:38:45PM -0400, Pramod Maurya wrote:
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> Cc: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
> Cc: linux-staging@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org

Something went wrong, this shouldn't be in the body of the email :(

> 
> The second argument to wait_event_interruptible() was indented with a
> single tab instead of being aligned to the opening parenthesis. Since
> the fully-aligned form exceeds 80 columns, break the condition at the
> comparison operator and align the continuation line to the opening
> parenthesis.
> 
> Fixes the following checkpatch.pl warning:
>   CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..1c34de020cf8 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
> +					       words_to_write);

No, the original is easier to understand, right?

thanks,

greg k-h
