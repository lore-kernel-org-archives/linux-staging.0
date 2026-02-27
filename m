Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AE46AF11
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223844; cv=none; b=CoKhD4a57087EAdrAmS9vFfzAgqiJh80R0YwsHkNLZoyUyzn/xFAc+szN69nNmkxHWSr39zElAk7gjRbQPJzEemcMpLpVm4/zyV3zd3p4i4KOg+KDy0BdBxJdRqgljzf43F5BHh7YKEuL/CGkl3vKItEdZ5exCPNqetEtsIBzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223844; c=relaxed/simple;
	bh=xyspJMVWlf/XtFXB7tjHDYTbNTPXuymBmlMwY92w+OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cM1TNQRwiHnk2PkInL7vKa4ibQTMgOdheh9+qcr/5m6qXWRroPcUG2JOzmhpwnqaYxscsHf3DCRTQA2UaJhrWJN9kwCe2K1XAslChtbd/BfqlbvLQsk7uGv4diNI1I3g6n9rG7JnwWja63E8Gc9V43+7EKO9YMboU58eqd8CWeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b5iaY6iO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b5iaY6iO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6DEC2BCB1;
	Fri, 27 Feb 2026 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772223844;
	bh=xyspJMVWlf/XtFXB7tjHDYTbNTPXuymBmlMwY92w+OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5iaY6iObNeFeExOv1DfbCeLMnii2mays2XhI+fFKyDLBmNVkkGHaWvKZSpTpJOJU
	 yZrDSQJ0zy61BNOP0B3YbexODVpwD4KV10M46lzHBaVR4YXBnDUgid1sDnhQZL/Xoe
	 dVijR3QYQlLc+f5Z0fi9y+FJy/jHL430aZb/YRbQ=
Date: Fri, 27 Feb 2026 15:23:51 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: axis-fifo: fix alignment to match open
 parenthesis
Message-ID: <2026022711-showoff-bakery-8235@gregkh>
References: <20260227171746.24969-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227171746.24969-1-lucas.fariamo08@gmail.com>

On Fri, Feb 27, 2026 at 02:17:41PM -0300, Lucas Faria Mendes wrote:
> Fix checkpatch CHECK for alignment in the wait_event_interruptible()
> call. Align the continuation line to match the open parenthesis as
> required by the kernel coding style.
> 
> Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index aa90b27197cf..c64a7249feca 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> +					       >= words_to_write);

Now it looks worse :(

This is one of those lines you just can not win, sorry, it keeps going
back and forth.  Just leave it as is please.

thanks,

greg k-h
