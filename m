Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B1E7A
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 07:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE37C3411B;
	Fri, 10 Jun 2022 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654844515;
	bh=M6EuY9oN0LZN9afnalEpOzjuWTpDRjltWbC0UqJViuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=waLjTEv9RnDloT0kKZ1mohHPRUuP1+2C3VNrZC1ujQS3ZjMQFP5rQvKKchwhSLHjQ
	 ucDqxOtvGEk/6pnIv6ewMYGb/X99A0U19rfazqyiq3N3IvsDO1ycSeD4QTjgKHJlwA
	 +j+VJgIyw4ctd6cdk5GTnunnmF8QM1v6Z+crrvnA=
Date: Fri, 10 Jun 2022 09:01:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Agam Kohli <agamkohli9@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rts5208: spi: Removed unnecessary ftrace-like
 logging
Message-ID: <YqLsYKSgLOk4jKGS@kroah.com>
References: <20220609153144.11803-1-agamkohli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609153144.11803-1-agamkohli9@gmail.com>

On Thu, Jun 09, 2022 at 11:31:44AM -0400, Agam Kohli wrote:
> Coding Style Fix
> 
> Signed-off-by: Agam Kohli <agamkohli9@gmail.com>
> ---
>  drivers/staging/rts5208/spi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rts5208/spi.c b/drivers/staging/rts5208/spi.c
> index f1e9e80044ed..0d2d065508d3 100644
> --- a/drivers/staging/rts5208/spi.c
> +++ b/drivers/staging/rts5208/spi.c
> @@ -460,7 +460,6 @@ int spi_set_parameter(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>  	spi->clk_div = ((u16)(srb->cmnd[4]) << 8) | srb->cmnd[5];
>  	spi->write_en = srb->cmnd[6];
>  
> -	dev_dbg(rtsx_dev(chip), "%s: ", __func__);
>  	dev_dbg(rtsx_dev(chip), "spi_clock = %d, ", spi->spi_clock);
>  	dev_dbg(rtsx_dev(chip), "clk_div = %d, ", spi->clk_div);
>  	dev_dbg(rtsx_dev(chip), "write_en = %d\n", spi->write_en);
> -- 
> 2.36.1
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
