Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBF52D780A;
	Tue,  4 Aug 2026 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830271; cv=none; b=aCaJ/R3PDXiSYUhg6+XiYE8tT6IX95vqVU+EWMkiI1AzXCmH9thefA325+RN7VkxtbeeCovRGoLH3jdqJGfiRfatV8ownBkgvAxoElUIbY43ksBjOWRM0x9W380EmdkIMWKrSdqbTH19H0wBOIowZYheLJpusKeRrT288jk6ujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830271; c=relaxed/simple;
	bh=iVqhLKs7sHL4gzXwsNIewKImFDVTFNvoJqG81zYhURM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VertsU6vOBGikTgMDv8SZFtdYq66J4e6R76QeHJV32zYq+4slIbMGGOi0XZYl5zh9asP0YXsqWwzWkAc+ZHvbjBqaDdYPQtn0tEREQXubhtq/iaBUetOQVFbTg1GUlgFiQXfLIH4PPWotsMKzn/ehThwOsxKlVvCdT1kHrSRcxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UtQpsjfQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UtQpsjfQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169B81F000E9;
	Tue,  4 Aug 2026 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785830269;
	bh=8pH6fuqoNOcMa42p05lpqI1rXKBWyiAH2/SW0/rJPLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UtQpsjfQ2Vd4ToH5TIn8Y3OP9YbEdpb+S4mtcbFn7X4aq3i8ABoGOZAHv+PN1b7Xa
	 hgX8VbSra5rFpptKzrxMCf0hwMFuKkC1rsYSDbEfcEE5yBF74W1eBIDZJbIDg2tRyA
	 9SWoXo2Jdw/rp9kLAqLY0cagBtvlnttXlivrDL0w=
Date: Tue, 4 Aug 2026 09:57:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove redundant ternary
 operators from return
Message-ID: <2026080423-target-bright-052a@gregkh>
References: <20260804074900.14423-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804074900.14423-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 07:49:00AM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that boolean expressions
> do not need a redundant `? true : false` ternary operator.
> Additionally, return is not a function and therefore parentheses
> are not required.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index 4cfdf7c6234..214c1fd9b3e 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -130,7 +130,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
>   */
>  inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
>  {
> -	return (cbuf->write == cbuf->read - 1) ? true : false;
> +	return cbuf->write == cbuf->read - 1;
>  }
>  
>  /**
> @@ -141,7 +141,7 @@ inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
>   */
>  inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
>  {
> -	return (cbuf->write == cbuf->read) ? true : false;
> +	return cbuf->write == cbuf->read;
>  }
>  
>  /**
> -- 
> 2.51.0.windows.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
