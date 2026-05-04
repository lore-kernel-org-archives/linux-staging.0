Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C43DA7D1;
	Mon,  4 May 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906583; cv=none; b=NzCBY4fNL2wfPztftLXdbLuXzZIHufrKjTugkZO9kE2Qsjo6jahO6YtriOKjjfSIz3NW2j2xU3duSegGZgnPTw90dg4BChNWOW4ArwCzpKH4znnhabcbDKEt5CLu+JZ/D+OD2DvGqInt7Tvpf6DeRm6qB2G2RcBQmnB/SQa1T/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906583; c=relaxed/simple;
	bh=CEUZtIYXZ7jLhF5Z0gvW5PnPk/nrW+1CY7wDiSNT8HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1YS2t+XGot90i2Sn0OpQyOHT1HjCGgeG10m+Npk8idAzRzmktkXU1SxNwIkHqwU/v70OLp179rEokP2G8c/EsvH+U/befARGFVyLE5cLpvfY3sglo3iJTDGn1paj8TI1SDgTv9FEtjzIiPut0+4TP9XW60S1DFvSdLqFwJP2ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cd8+or55; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cd8+or55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6377C2BCF6;
	Mon,  4 May 2026 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906583;
	bh=CEUZtIYXZ7jLhF5Z0gvW5PnPk/nrW+1CY7wDiSNT8HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cd8+or55Eh1yyxnfPyuhxb0FiG8W2jPJ0r7kNuEeiZLq5AHI6BxUgoTKh3j1HmjrM
	 zGuqM64btrJmanCF99Z2Gp98ocd1UtIc1xJ83IR9duMzr9JtDtiQJHSgyWBrWZ2AGw
	 vp+kv10HZoe2tDqrfuqJN17/zPX84xaPK/7LMBWM=
Date: Mon, 4 May 2026 16:17:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: net: replace pr_err with netdev_err
Message-ID: <2026050437-overhand-negation-0de3@gregkh>
References: <20260429032934.10683-1-mahamaryamjavaid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429032934.10683-1-mahamaryamjavaid@gmail.com>

On Tue, Apr 28, 2026 at 11:29:34PM -0400, Maha Maryam Javaid wrote:
> Replace pr_err() calls with netdev_err() in skb_to_mamac() to provide
> better context by including the net device name in the error messages.
> 
> Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
> ---
>  drivers/staging/most/net/net.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
> index fffdb60cd230..fc1dcff107ec 100644
> --- a/drivers/staging/most/net/net.c
> +++ b/drivers/staging/most/net/net.c
> @@ -81,18 +81,18 @@ static int skb_to_mamac(const struct sk_buff *skb, struct mbo *mbo)
>  	unsigned int mdp_len = payload_len + MDP_HDR_LEN;
>  
>  	if (mdp_len < skb->len) {
> -		pr_err("drop: too large packet! (%u)\n", skb->len);
> +		netdev_err(skb->dev, "drop: too large packet! (%u)\n", skb->len);
>  		return -EINVAL;
>  	}
>  
>  	if (mbo->buffer_length < mdp_len) {
> -		pr_err("drop: too small buffer! (%d for %d)\n",
> -		       mbo->buffer_length, mdp_len);
> +		netdev_err(skb->dev, "drop: too small buffer! (%d for %d)\n",
> +			   mbo->buffer_length, mdp_len);
>  		return -EINVAL;
>  	}
>  
>  	if (skb->len < ETH_HLEN) {
> -		pr_err("drop: too small packet! (%d)\n", skb->len);
> +		netdev_err(skb->dev, "drop: too small packet! (%d)\n", skb->len);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.34.1
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
