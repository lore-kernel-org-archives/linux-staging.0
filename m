Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60DD283CB5;
	Thu, 21 May 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355301; cv=none; b=B8WpIf3xLvrm4lV63hWEpPpAVwYkFPXA3fEC+XeqHl06IGWfFckhbzMgxrxOH3bakQ9q1J+f/K3pDwwEOpRudwsqZymVUOrr6KVOz5ZZ0fK+kyQWT8RgZrjDYERtKrobfZ5Q0nyZTILlDLb1HJxHspbC+syI/c+tZeDKFEZB9dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355301; c=relaxed/simple;
	bh=UAutrWMEOxWuEVRXXj0LwlTfC/0MWGIbIyQgo4RGrAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLiNlAoVKdou9fxrjwXtVe1IgeP++lZLelK1DjlhvX6ptDkjRPt0LgMyQfeeLtzlcEYDK+HeHHxt6SWuIoAKTN9bedguUi9sIID2naiZcuw3BWxXOUkIg2AzQ9EI0gembhzjTBS3wDOHqbt5AZgTNYOIHzThR7Zdpzmp+nJVk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A1iMPxSv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A1iMPxSv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13881F000E9;
	Thu, 21 May 2026 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779355300;
	bh=vDZhS9KxTXTBFlP0yv3OcToTik0YQVtL7Dp03X1sMjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A1iMPxSvx3za6TdY3nta1OxAzHRa0AXsHgR1WJP7bDM4hMeyb2mpGyl/YDzVwiBL6
	 2g2UotMgsysD/uMnRdg1U2tM4lvGOzdgXNDZcsCuU1KhwVgeyg7h3GOcZ9ejwl8Nzv
	 mInMtLpbfHeVL22pmVN0XrV0/lguWjhqhpS9RuN4=
Date: Thu, 21 May 2026 11:21:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	andriy.shevchenko@intel.com
Subject: Re: [PATCH 1/1] staging: rtl8723bs: Fix line length in xmit_linux.c
Message-ID: <2026052130-disregard-hatchery-ea8e@gregkh>
References: <20260512185254.604090-1-pramod.nexgen@gmail.com>
 <20260512185254.604090-2-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512185254.604090-2-pramod.nexgen@gmail.com>

On Tue, May 12, 2026 at 02:52:54PM -0400, Pramod Maurya wrote:
> Wrap long function signatures and a long expression to comply
> with the 100 column line length limit reported by checkpatch.pl.
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index dc0b77f38b1a..1c53b7bc00c5 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -46,20 +46,25 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
>  	return false;
>  }
>  
> -int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
> +int rtw_os_xmit_resource_alloc(struct adapter *padapter,
> +			       struct xmit_buf *pxmitbuf,
> +			       u32 alloc_sz, u8 flag)
>  {
>  	if (alloc_sz > 0) {
>  		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
>  		if (!pxmitbuf->pallocated_buf)
>  			return _FAIL;
>  
> -		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
> +		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)pxmitbuf->pallocated_buf,
> +							XMITBUF_ALIGN_SZ);
>  	}
>  
>  	return _SUCCESS;
>  }
>  
> -void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
> +void rtw_os_xmit_resource_free(struct adapter *padapter,
> +			       struct xmit_buf *pxmitbuf,
> +			       u32 free_sz, u8 flag)
>  {
>  	if (free_sz > 0)
>  		kfree(pxmitbuf->pallocated_buf);
> -- 
> 2.52.0
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
