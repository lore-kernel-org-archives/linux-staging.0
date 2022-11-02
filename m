Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43F27C
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 07:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAD8C433D6;
	Wed,  2 Nov 2022 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667374232;
	bh=RcE92gcTKzZxjgG7AzwhbXdDtnRn/iOFeap18wOjnMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4PKEOqJrCxCUzD9UUPt1EnatgYpx1+7VxWix2YDOjVay3xs2wxvZbL9QjoE0Le1x
	 COkA3Ymqkk/UB2GMGheNHLtXy38GeJvGusrGgVjNmG/bUJoIScVI13GHP5zZe8/6H6
	 oXTMDVcLMvKdI4C5ybYNLnKwcMWafoUord1iGjxY=
Date: Wed, 2 Nov 2022 08:31:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: chen zhang <chenzhang@kylinos.cn>
Cc: error27@gmail.com, ztong0001@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH v2] staging: rtl8192u: Fix typo in comments
Message-ID: <Y2IczkObmP7u8gYo@kroah.com>
References: <20221102030330.22049-1-chenzhang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102030330.22049-1-chenzhang@kylinos.cn>

On Wed, Nov 02, 2022 at 11:03:30AM +0800, chen zhang wrote:
> Fix spelling typo in comments.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 0a60ef20107c..f6a0992b059b 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -4574,7 +4574,7 @@ static int rtl8192_usb_probe(struct usb_interface *intf,
>  	return ret;
>  }
>  
> -/* detach all the work and timer structure declared or inititialize
> +/* detach all the work and timer structure declared or initialize
>   * in r8192U_init function.
>   */
>  static void rtl8192_cancel_deferred_work(struct r8192_priv *priv)
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
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
