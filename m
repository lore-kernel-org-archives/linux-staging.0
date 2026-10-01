Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7763B3891
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 05:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833810; cv=none; b=Z2UPoosflWirZLOdKI2FTPu1v38TxuZp+Gqlkk9rLfdIOHwnbH/Pdk4gyeOhxlHJgzJbs7qZaYZ/Vo92bqPxBmOzCxtFAmlzdZHlWcB/lRv7jTHShIzdfLk4jjVNugVxYpiC7VEMdWqn12MyIDMwaD4viJXhOMZqpsvo58Frl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833810; c=relaxed/simple;
	bh=kyuUvnuXJi+CE1LEMhrUEKk37OVkRBVHMT9Pq1ne7BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmEMTURN8p5HTe8AK4720XNpYvvgxmUdjMWwYpXGBNyUhFP6YC39TQBX06X1dSYN6/VOfMXfPNqnyHvXHJ91GvpdFsVVuiXFchG3Zprvv1dYHbezt0or7FRYxIsIG/w+E/ye7f8bpCUrpKEuY1kkb10dsD6QuN/K930dPu0b/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y1HjYetI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y1HjYetI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7908F1F000FF;
	Thu,  1 Oct 2026 05:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833809;
	bh=Yz61eDMPUk5EUrqjgYrzqrpUWXuLUaVIL0x0iwZy3jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y1HjYetINRsJbBmVOtIBwWHpzHHf8j4kX/XqDKMIMTtstD5C5Vr0PZaKG0KYPjFCv
	 5D5xdkkjqtwqxnBTn/h9M2N33PZPg783CJvlouE79VUvxpo5/G4izwuhmLk7dRP7vm
	 DcFK8b4kICqwSulF8HM5M87jI1qet/UuXFm5Ji40=
Date: Thu, 1 Oct 2026 07:50:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moises Dominguez <dominguezsalcedom@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove redundant goto in
 rtw_alloc_xmitframe_once()
Message-ID: <2026100149-preheated-morphine-9f6b@gregkh>
References: <20260913205349.1822-1-dominguezsalcedo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913205349.1822-1-dominguezsalcedo@gmail.com>

On Sun, Sep 13, 2026 at 02:53:49PM -0600, Moises Dominguez wrote:
> From: Moises Dominguez <dominguezsalcedom@gmail.com>
> 
> Remove the redundant goto and return NULL directly when allocation fails.
> 
> Signed-off-by: Moises Dominguez <dominguezsalcedom@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 81d9e713fc12..cd659bd2f261 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -1715,7 +1715,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
>  
>  	alloc_addr = kzalloc(sizeof(*pxframe) + 4, GFP_ATOMIC);
>  	if (!alloc_addr)
> -		goto exit;
> +		return NULL;
>  
>  	pxframe = (struct xmit_frame *)N_BYTE_ALIGMENT((SIZE_PTR)(alloc_addr), 4);
>  	pxframe->alloc_addr = alloc_addr;
> @@ -1730,7 +1730,6 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
>  
>  	rtw_init_xmitframe(pxframe);
>  
> -exit:
>  	return pxframe;
>  }
>  
> -- 
> 2.55.0
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
