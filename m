Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB923A8384;
	Tue,  4 Aug 2026 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830286; cv=none; b=YeG4pSUR7utct14cdNbSFTMoufkMGz/VyCgkDQBfYoqrNF1iPXiKAuu0+7Wsr2q4jhuWzGAYfTncEli9vMwS01vgLy3UzbnFioTpkyPcAavu7TTF8/2tu8qDwhKT/08adDEF4jPXnTWuL4G6Xjje2QnlOPcYqUeW1A4NP7M2e4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830286; c=relaxed/simple;
	bh=1VYbLvTOwnGnLW/BGqhhPmpTksNhx3KrqrYHyrkuPTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RivQR09I+OBhP6tLnhiZkkicStWZoarf/h0EJlVJhyBZ/HUwitMbXjiD2wBmGQwUTl5WrYtmpkHRzOZ92fqdSfQGDByQXkDqDHsV2MTvMWDieHH8uB7f7rt4LFx2pUCz5Mhlkq8eqWWTiAHlpOuS5va2QtPBJrGF+PQynDTx9KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ev00/eV5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ev00/eV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1512F1F000E9;
	Tue,  4 Aug 2026 07:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785830284;
	bh=RFz637lTHyhvQ7x/VDPTMxrAKEKzoQ2kPRjwtgkyeuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ev00/eV5c6DNiJQ8+NQFdCeXieybaGsurx1XG6Dj1m4WpK7yBkBeD+r+uq0P7IWcK
	 DooeKzZm1jdC4T1/iCZlSXixzaHbr1YOHANeqvkct/1GVq1PpvM4+ajr85aSSA9KNW
	 rZcp908/xX7sOzTWQVf78TdXJHKaB0BCMFjNxRk4=
Date: Tue, 4 Aug 2026 09:57:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: mchehab@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu3: remove unnecessary parentheses
 from return
Message-ID: <2026080445-reborn-jumble-92de@gregkh>
References: <20260804075112.15695-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804075112.15695-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 07:51:12AM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that return is not a function
> and therefore parentheses are not required.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index 8063401246f..84fc98dd352 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -1400,7 +1400,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
>  		if (!list_empty(&css_pipe->queue[q].bufs))
>  			break;
>  	spin_unlock(&css_pipe->qlock);
> -	return (q == IPU3_CSS_QUEUES);
> +	return q == IPU3_CSS_QUEUES;
>  }
>  
>  bool imgu_css_queue_empty(struct imgu_css *css)
> -- 
> 2.51.0.windows.1
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
