Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC1136358;
	Fri, 13 Feb 2026 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967695; cv=none; b=MvooZjMJL+QAP6LdHHDNijPHyUcYbc6SMWgcxKtbv47IM3AzYh8Jv+LVKJPqwtIelmJm0LxnAy1gLMjqtoTSI5/C38GcLCibwYSHeDiUstSZM80DG6f7Iy6kq8aZBqAOvkYzfYtiWMCeQMRIUManfCIk7wy0wGFkmBWtaUfadIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967695; c=relaxed/simple;
	bh=JlcXCDOhGKQSF2bQN7pUNh5tMXzDoaG7U1jXHwvZbfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4f1AY5aTx5L8wGyzNa6Avc5gO0s5PMXAFwPolMCggEkGBJaDddMKtYAVscgT7WrtVTbmByf936nHf5J2MizQWuXbv5xcyoVY6WPVeagkXZ7dzyQmOsRbbrGw3ZHH1XjrABFpTiO1JcFQsz2kj3Ee3zTDGCNDN/FLFFgSt/j9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vspWibSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vspWibSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329C5C116C6;
	Fri, 13 Feb 2026 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770967694;
	bh=JlcXCDOhGKQSF2bQN7pUNh5tMXzDoaG7U1jXHwvZbfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vspWibSmOcH8NJpoZx2VKF2qrMIEp4QvKfrOqsKCAod4wlzCwy2P3rV6qb5ES1nkO
	 tw3YOYmJnFERO4rzyfovsWXikh9MgmLXSgsndTE5TOk1MdEigLWGyozf48XUat9617
	 LvHspXfcwdIuBWEe6ztVAb2x7rQlBFI0SjS18u/E=
Date: Fri, 13 Feb 2026 08:28:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuho Choi <yqc5929@psu.edu>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	tgkim@psu.edu
Subject: Re: [PATCH v2] staging: rtl8192u: ieee80211_rx: free rxb on reorder
 alloc failure
Message-ID: <2026021359-energetic-that-2759@gregkh>
References: <20260212232931.32029-1-yqc5929@psu.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212232931.32029-1-yqc5929@psu.edu>

On Thu, Feb 12, 2026 at 06:29:31PM -0500, Yuho Choi wrote:
> RxReorderIndicatePacket() allocates prxbIndicateArray with kmalloc_array().
> If the allocation fails, the function returns without freeing the incoming
> prxb and its subframes.
> 
> With JOHN_NOCPY enabled, this leaks the original skb as well because skb
> ownership is transferred to rxb->subframes[] and ieee80211_rx() does not
> free skb in that configuration.
> 
> Free all prxb->subframes[] and prxb before returning on the allocation
> failure path.
> 
> Signed-off-by: Yuho Choi <yqc5929@psu.edu>
> ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> index b58e75932ecd..942ded5a3bae 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> @@ -598,8 +598,14 @@ static void RxReorderIndicatePacket(struct ieee80211_device *ieee,
>  	prxbIndicateArray = kmalloc_array(REORDER_WIN_SIZE,
>  					  sizeof(struct ieee80211_rxb *),
>  					  GFP_ATOMIC);
> -	if (!prxbIndicateArray)
> +	if (!prxbIndicateArray) {
> +		int i;
> +
> +		for (i = 0; i < prxb->nr_subframes; i++)
> +			dev_kfree_skb(prxb->subframes[i]);
> +		kfree(prxb);
>  		return;
> +	}
>  
>  	/* Rx Reorder initialize condition.*/
>  	if (pTS->rx_indicate_seq == 0xffff)
> -- 
> 2.43.0
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
