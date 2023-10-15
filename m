Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F15CA4D;
	Sun, 15 Oct 2023 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y/eyc2CY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE29DC433C7;
	Sun, 15 Oct 2023 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697398097;
	bh=NvvSDT0DdlGAaVq23B5QUDrtCIF+hE6S3uS807DItYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/eyc2CYnBWgrZpCISUQpFR7Qdg4bi3xLWY/PtEClfbRwA042rTK6+aO1k+2QPM15
	 xwbTpMQl8x7LrWy90VPiEWGpra+7usQ+gUnnUpg/RWgwQColTCeX2nwZW8bJZWasGT
	 Yf7e1Dtt0HW1o8l00nSJNc+yzkbNreYnbzEownfM=
Date: Sun, 15 Oct 2023 21:28:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gdm724x: Add blank line after declaration
Message-ID: <2023101501-sprung-lance-c017@gregkh>
References: <20231015192139.3121-1-soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231015192139.3121-1-soumya.negi97@gmail.com>

On Sun, Oct 15, 2023 at 12:21:37PM -0700, Soumya Negi wrote:
> Fix WARNING: Missing a blank line after declarations
> Issue found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 4e5cac76db58..0c61eaff6122 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
>  
>  	while (remain) {
>  		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
> +
>  		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
>  					(void *)(buf + sent_len),
>  					sending_len,
> -- 
> 2.42.0
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
