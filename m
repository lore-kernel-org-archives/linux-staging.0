Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31003DDAE5
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290466; cv=none; b=qI5zzGRb40QHNsV++Zt31aMfT+CGWMKQFSPF+yS0mQ1Ma/ND5ezdi1Ka6Y43b3KcwpGmsgsG8Xe0rZ1TSqJV90pFyX26HGb1zLxQVAJpIYWO/Jg7s9cCGUEB1/hlz4XvWUubEcOVFSypl7FmPSvJvn4HWAVLxFp85ykJHab2KD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290466; c=relaxed/simple;
	bh=f8jR8zyp2h4APy2ffZPp1zDiwZG/GXCOGGIBZ5OqB5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqc0a1D/Eq3B+5NZffk5giYa4yea1f6cWtbCNZza2SQE0q6egh6tthacLswl4pbv1U76DQUr2VbCjYFNWDZluySPeP8V7ZjbSsXFDycmSR85wvq87qJCXToPSrAjoonPbVrE2/92uiJu2MGrdyJv/w3SItavranilQPTRwZA3YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D4GSocA2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D4GSocA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF00B1F000E9;
	Fri, 17 Jul 2026 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784290464;
	bh=eOaOahG3XeYTWLde842vtgwx31fnectwKcg3lSGBY4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D4GSocA2tifRTXcvBNbkwzSyfXRok4EhGk5HnQSeRSx9/LErPS5Xwh00X0FSotEvl
	 p5lPtku85Z5EJEUgxaSyf0XOMAE2fxJqdY2FmvI+BjKWRwdGVuoaXWetX+houcylTh
	 dmeq5y32LuSBhEpgzNw6EcbK3aIiUOk88uyf84lA=
Date: Fri, 17 Jul 2026 14:14:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hussien Sajjad Ali <teamakeads@gmail.com>
Cc: linux-staging@lists.linux.dev, straube.linux@gmail.com,
	hansg@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix while loop checkpatch logic in
 enqueue_reorder_recvframe
Message-ID: <2026071703-whole-directory-6416@gregkh>
References: <20260712191858.369535-1-teamakeads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712191858.369535-1-teamakeads@gmail.com>

On Sun, Jul 12, 2026 at 10:18:58PM +0300, Hussien Sajjad Ali wrote:
> Signed-off-by: Hussien Sajjad Ali <teamakeads@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 16ec2248b083..915559f64b40 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1763,7 +1763,6 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
>  
>  	return true;
>  }
> -
>  static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, union recv_frame *prframe)
>  {
>  	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
> @@ -1782,16 +1781,17 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  		pnextrframe = (union recv_frame *)plist;
>  		pnextattrib = &pnextrframe->u.hdr.attrib;
>  
> -		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
> -			plist = get_next(plist);
> -		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
> -			/* Duplicate entry is found!! Do not insert current entry. */
> -			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> -			return false;
> -		else
> +		if (!SN_LESS(pnextattrib->seq_num, pattrib->seq_num)) {
> +			if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num)) {
> +				/* Duplicate entry is found!! Do not insert current entry. */
> +				/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> +				return false;
> +			}
>  			break;
> -	}
> +		}
>  
> +		plist = get_next(plist);
> +	}
>  	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
>  	/* spin_lock(&ppending_recvframe_queue->lock); */
>  
> -- 
> 2.55.0
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
