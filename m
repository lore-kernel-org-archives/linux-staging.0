Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD51914BF97;
	Mon, 30 Mar 2026 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885826; cv=none; b=eP9Or97vveqXzqowNc26YOjJbMiWgOR7WYndfqpLBPe1pfVyZnh8R+7qmdD4KmBKm9SkJOpVH4YErxY57IbwlUVaVABXqXXxPaRuFY+EDEc2gJtTpUR6pIDDHt3U02Md5fchIMwuMXIiKH761MMiE6LnYnXxB40SGC7RPGRPYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885826; c=relaxed/simple;
	bh=6PMwdtxctVrwWZXsKsT+FtdFd0RLdcPbTXwSBUpY3dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OItpP/+/gZT9pqFntRRLoFivbFIQZAiwq9MPNmYE+vwF/tg5QB81CKetUlW1U1DZCX0fDvEngKkPlSBHFhDbQSl5YNaMVFiQDabolfbuVEFSqlDX14T06AVfR3yaQPo3d5QSU4+jlAwOhhaS39adj/Ql1xZLk2iaQfti5p5dZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=feTlouA8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="feTlouA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF436C19423;
	Mon, 30 Mar 2026 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774885826;
	bh=6PMwdtxctVrwWZXsKsT+FtdFd0RLdcPbTXwSBUpY3dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feTlouA8T6JAKyajsP6Oan77imRvtBOYjhv7JnvzToK5/jPCDG0/Z3UiNk/Kz/Su6
	 OYvheDUYKKx+NIRC6YBJn1VRmOEAN0K1UMriwghJ0yUCG+G0UZuMNsIvRImvJ+KCNw
	 oIVNOG0OHiTyNlUe6VA3sQ66GwkP4Gmaoh4opmzI=
Date: Mon, 30 Mar 2026 17:50:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: Fix comment style code
Message-ID: <2026033019-unpleased-preamble-4792@gregkh>
References: <20260327180403.27685-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327180403.27685-1-marcosandrade95963@gmail.com>

On Fri, Mar 27, 2026 at 06:04:03PM +0000, Marcos Andrade wrote:
> Fix a comment line wrap to improve readability and adhere to the
> kernel coding style. This change is purely cosmetic.
> 
> No functional changes intended.
> 
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..62013019a25b 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			nvec_tx_set(nvec);
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
> -			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			/*
> +			 * delay ACK due to AP20 HW Bug
> +			 * do not replace by usleep_range
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.53.0
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
