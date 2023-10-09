Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE719BD3
	for <linux-staging@lists.linux.dev>; Mon,  9 Oct 2023 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jQQC3ROU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E21AC433C7;
	Mon,  9 Oct 2023 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696863299;
	bh=OaNTAYTTI6xfMYggxvS0RCVlJLanN7AFRZ9YGqBczZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQQC3ROUm7l2b2swXCswHfiTJdGPlH0VMfzDAGKW7QkHnimcYOYmWTSImWdcu/cdp
	 0Ng6+I7nhuqP4I80fB85v1g3jUNBEBNDUFgM2xoAEjFTamwSBl1kuB3xSwAd2d0l4Q
	 fgGvrISa1Rm1Uv88yH9Uck8lqrMk3zSyKjtL0gT0=
Date: Mon, 9 Oct 2023 16:54:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: pipishuo <1289151713@qq.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] tty: gdm724x : Add blank line after variable declarations
Message-ID: <2023100922-unlearned-synapse-5170@gregkh>
References: <tencent_2E8EE168437721028C6DAB5A25532F8E8D08@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2E8EE168437721028C6DAB5A25532F8E8D08@qq.com>

On Mon, Oct 09, 2023 at 10:19:44PM +0800, pipishuo wrote:
> Adhere to Linux Kernel coding style.
> 
> Reported by checkpatch
> 
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: pipishuo <1289151713@qq.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 32b2e817ff04..15c246d3b1a3 100644
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

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

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
