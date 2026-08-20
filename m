Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA33D472F86;
	Thu, 20 Aug 2026 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245828; cv=none; b=a75bv3yUEjcmnYySs4oJ08VRG6wIHfRE7VrBZI+PPyyq4Dvb8d21fY+2kU3g/8SjZePMh1s/w359jCtNQucYRqeTO4D8ueeNBSAjqMfd/OjHX/Z31OMFmlfc7tdw6fwMsaZccR2Z1YBk0f5lfO7g4X4oYp2gknRnYvzykrAWY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245828; c=relaxed/simple;
	bh=jHkJipRGzn4N5TV62aHlYCj48Dhp5l7A4NoMYGXwcmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCVCsP+JfoxjBt17PHvd5ab1VaRX6TagNG76MuL2I+InmjBB2RlYJTwC2OcG8tOKa5c49aUfQ1sehkp40QQ7nCv6BZzfwnNuL42sN3FozfzctXbX84coPtEcixPkMeOf5IWOtfDHp8vCCF2UD8fkpdbynxKgwK5WpXhgBoJLeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ERgxt67x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ERgxt67x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A3E1F000E9;
	Thu, 20 Aug 2026 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787245827;
	bh=fWaWsgKNQBZCRBOmoYgC67/R3VvxXMHMW75P473kMyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ERgxt67x/5XyCiYsMHcXZC2h28lBbomvVEIZJxQX4rLqAOtlEywg5rEfroaEeBRl+
	 mIKnRJSIOcXF6DDm/43M3iCYpS4IIAAqAjvcT8Xx6M+K6LpM2JpCcOcdeednex1lVR
	 YOH2BsbKyIkNhRiRRCcMFDAIP3zXK5ZwBTh7SjPs=
Date: Thu, 20 Aug 2026 19:10:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "myeonghyeon.park" <myeonghyeon.park@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: reorder conditions to avoid else
 branch
Message-ID: <2026082057-pastrami-juncture-7030@gregkh>
References: <20260820162601.74952-1-myeonghyeon.park@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820162601.74952-1-myeonghyeon.park@gmail.com>

On Fri, Aug 21, 2026 at 01:26:01AM +0900, myeonghyeon.park wrote:
> Fix the checkpatch.pl warning:
> 
> "WARNING: else is not generally useful after a break or return"
> 
> in core/rtw_recv.c.
> 
> Return early when the SN_EQUAL() condition is met and break when
> SN_LESS() condition is false to eliminate the unnecessary else branch.
> 
> Signed-off-by: myeonghyeon.park <myeonghyeon.park@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 7568fc514d7c..5776d0212ab8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1782,14 +1782,15 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  		pnextrframe = (union recv_frame *)plist;
>  		pnextattrib = &pnextrframe->u.hdr.attrib;
>  
> -		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
> -			plist = get_next(plist);
> -		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
> +		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
>  			/* Duplicate entry is found!! Do not insert current entry. */
>  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
>  			return false;
> -		else
> +
> +		if (!SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
>  			break;
> +
> +		plist = get_next(plist);
>  	}
>  
>  	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
> -- 
> 2.52.0
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
