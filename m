Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426DC7F3
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 07:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFD6C433D2;
	Fri, 19 May 2023 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1684481218;
	bh=0Iw76+DN3emi3elLLNtbC3yKUGgaEG8sL8YyLz9vdrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0IAoQl22Lhkxe+2eHteSRW7Y7v4vizbyLCRFtPeVNRpZopNeLXV3irq6L+jgXTjcF
	 H4W47VXf+N/JI9HJjCzdjqf9nQeteoAjCUEi31XZdCkq/HOrdkxy+29z2BnGilqXKy
	 XVRXQ3Ru/HXS0YaTcGJ0n8kVh1OG3m0L2o6DAggA=
Date: Fri, 19 May 2023 08:26:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] Staging: rts5208: rtsx: fixed unbalanced braces
 around else statement
Message-ID: <2023051938-gondola-exfoliate-08e3@gregkh>
References: <20230519031204.20058-1-kartikey406@gmail.com>
 <20230519031204.20058-2-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519031204.20058-2-kartikey406@gmail.com>

On Fri, May 19, 2023 at 08:42:04AM +0530, Deepanshu Kartikey wrote:
> Fixed unbalanced braces around else statement
> 
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/staging/rts5208/rtsx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
> index 2284a96abcff..47dacef0aaf8 100644
> --- a/drivers/staging/rts5208/rtsx.c
> +++ b/drivers/staging/rts5208/rtsx.c
> @@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
>  				chip->srb->device->id,
>  				(u8)chip->srb->device->lun);
>  			chip->srb->result = DID_BAD_TARGET << 16;
> -		}
> -
> -		/* we've got a command, let's do it! */
> -		else {
> +		} else {
> +			/* we've got a command, let's do it! */
>  			scsi_show_command(chip);
>  			rtsx_invoke_transport(chip->srb, chip);
>  		}
> -- 
> 2.25.1
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
