Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712F3587CA;
	Fri,  9 Jan 2026 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951811; cv=none; b=G3GyVExQ/l5Q1EtNW0xVpKW4Z31QKYGzbUJe6tURz2l27/Ny9qOHGiaMz/AAHVh66tdlFrlXvHLTLkOXTjIw28dbw5b/hESlhJFzYS9R27VYFEyCg63E9HonbC8TCSuINTwY3eLoTFacCWK+GX0tdmQFWN25MccIZ36gI7txxEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951811; c=relaxed/simple;
	bh=sSjZvJZDCYWVXcBwEUqXy6GVj/K9pDhHe8lns/i4akE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3dMDAe8cSAs4hkx2YmuFsfwClwP5RFjMB/SXkYpBpI261dd9Q5oo/arlJwir69vyJsfjcTPiwVE2YHkt9lGbcCYCgwHm4mnJBvcsIEnBSYWo73udFQYts5TupB/hD/tUSweIyMazMFadwlPn7mB/riB43+fDrrYj9/aaW/hdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=irm32P6W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="irm32P6W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA82C19423;
	Fri,  9 Jan 2026 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767951811;
	bh=sSjZvJZDCYWVXcBwEUqXy6GVj/K9pDhHe8lns/i4akE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irm32P6Wru+yaDirFbewfzGkO4kGuIB5Sy258kOJhCeJnvyfXitJUKrIeAhPPFh/H
	 c7RyWpCijHdxUN/jae8O+WJQtwBhnlKCYuccSSQU9sCSGc1W/ZSvAF/hf6uL4fGa9f
	 b79XiqevYKcZZ+Yy5hlAuONrWNvOtCd2ayJvtBlI=
Date: Fri, 9 Jan 2026 10:43:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in
 osdep_service.c
Message-ID: <2026010912-fabulous-fade-4d4e@gregkh>
References: <20260109093801.15334-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109093801.15334-1-nayana.mariyappa@gmail.com>

On Fri, Jan 09, 2026 at 09:38:01AM +0000, Nayana Mariyappa wrote:
> Fix block comment alignment, remove extra blank lines, add a blank
> line after declarations, and avoid multiple assignments to comply
> with kernel coding style.
> 
> No functional changes.
> 
> Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index a00f9f0c85c5..c082a0359064 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -6,10 +6,10 @@
>   ******************************************************************************/
>  #include <drv_types.h>
>  
> -/*
> -* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
> -* @return: one of RTW_STATUS_CODE
> -*/
> +/**
> + * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
> + * @return: one of RTW_STATUS_CODE
> + */
>  inline int RTW_STATUS_CODE(int error_code)
>  {
>  	if (error_code >= 0)
> @@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
>  		kfree(ori);
>  }
>  
> -
>  /**
>   * rtw_cbuf_full - test if cbuf is full
>   * @cbuf: pointer of struct rtw_cbuf
> @@ -204,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
>  void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
>  {
>  	void *buf;
> +
>  	if (rtw_cbuf_empty(cbuf))
>  		return NULL;
>  
> @@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
>  	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
>  
>  	if (cbuf) {
> -		cbuf->write = cbuf->read = 0;
> +		cbuf->write = 0;
> +		cbuf->read = 0;
>  		cbuf->size = size;
>  	}
>  
> -- 
> 2.43.0
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
