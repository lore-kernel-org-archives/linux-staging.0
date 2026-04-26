Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0636E486;
	Mon, 27 Apr 2026 03:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261826; cv=none; b=gzyfWEE7rg+7YvovTtaFyUx5uXrbIhv9iVEHHKQABSZhTH4JW3LSSOFxYZ5SldJCJfEI3bQyKq9SHCCMoGh8RIowJM8WaFQPvVGQjScv2no3fmjt1XGOfm8HtN6X21KAa9f346VdPSPEwrc5N5FC4xZkIAAsGdX8P5dFqvpSxjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261826; c=relaxed/simple;
	bh=UsstZH5U59/riub7MGuZPbBc2TAI960jt9R3F0fXWBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUVEQcxu4NrByzlOrSbVw5GpKsIJT9+ZKhCSG2KaKLRbFyd3wjlfDM4zod8/1AH1UvoIr0UiZdB0R8k4iuL8kY5trZyVcttoFFPBVQHIRUqFt9YGsXJrmqgB/xA/+rCWVGs0NfEmlj4m0lzYQSO3O39js97KbkqEIfGgihnnYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g3BJqEpG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g3BJqEpG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453A8C4AF09;
	Mon, 27 Apr 2026 03:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261826;
	bh=UsstZH5U59/riub7MGuZPbBc2TAI960jt9R3F0fXWBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3BJqEpGvFG9JAx4odJuH/w8pLANXI3CqmXv9pObUHDtYw2SKNWtVXsqxxKL2NaLQ
	 QbiPraOoq9HymwwH522hjNNL1DZsp0IRegPSuTB2P7OGGC1QMkK/Y99zU3EXw89OOg
	 NbBIAFXqCE1QEbSjNAcCx5TLbiGkBJe0owixr+Go=
Date: Sun, 26 Apr 2026 21:01:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Francisco Maestre <francisco@maestretorreblanca.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] staging: nvec: fix block comment formatting
Message-ID: <2026042639-rearrange-spotlight-772a@gregkh>
References: <20260409220608.98566-1-francisco@maestretorreblanca.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409220608.98566-1-francisco@maestretorreblanca.com>

On Thu, Apr 09, 2026 at 05:06:08PM -0500, Francisco Maestre wrote:
> Fix a multi-line block comment that was not following the kernel
> coding style. The continuation lines should start with ' * ' and
> the closing '*/' should be on its own line.
> 
> Assisted-by: Claude:claude-opus-4-5
> Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
> ---
>  drivers/staging/nvec/nvec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08..0e655f79e 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
>  			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			 * do not replace by usleep_range
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.50.1 (Apple Git-155)
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
