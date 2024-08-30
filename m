Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB83170A30
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725011555; cv=none; b=aSyUTTdjSSOkgYxplOHloo1XTMW1r4w9QuJuX6CqcV9T1CQHFE+M2cn3Qac+oiiBEwI4enw/C0DzG4gyYeDFG6sVIA32i/beGTGQqcMUcqGhx6zHTGm5k26mzbIYv6RpGIWN2WfUFZ8jMV2hZYj9szSJZ6I5+EJMB4JKDYpfj9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725011555; c=relaxed/simple;
	bh=fAz/Zn4a7drhJ5xBT/wNMpfnzPnWYO/tKJtPf8gGnuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMX+WE9WcRTrblvCPcfHoLN871XVechQbRcCR7V1XE4ffMKkjD3qMZfMx+fycth+eLa6Y9vNOESP/l0EMQBjWpPRtfEit0bRUJReSbzG2h5/yVAYpwo3JQn3bXpnbExpg+qYOi2uJPD/bKcwzM2ZWC2Xc1TpSmDrLQlAM7avVho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ma/DM7E4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ma/DM7E4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3531EC4CEC2;
	Fri, 30 Aug 2024 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725011554;
	bh=fAz/Zn4a7drhJ5xBT/wNMpfnzPnWYO/tKJtPf8gGnuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ma/DM7E4DRGKF1VN8bzqwH4KWBptFHrzumgNinino93aYN/sASuKR6srGi1u19WOn
	 yka17Q7smZlev78nNjA3skyCr8aX+CWZ23gNE4dpA9WtVpgDi8qW9l+BHdXbsuZ2rS
	 sibqzB/cuXDTN4JMFm5pdVTae8m7ldYD6GyW9zqI=
Date: Fri, 30 Aug 2024 11:52:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: fbtft: fb_ili9320: Fix 'Unnecessary parentheses
 around' issue
Message-ID: <2024083005-applied-brink-6ca8@gregkh>
References: <20240830085438.4299-1-qianqiang.liu@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830085438.4299-1-qianqiang.liu@163.com>

On Fri, Aug 30, 2024 at 04:54:38PM +0800, Qianqiang Liu wrote:
> There is no need to add parentheses around 'devcode != 0x0000' and
> 'devcode != 0x9320'
> 
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---
>  drivers/staging/fbtft/fb_ili9320.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
> index 0be7c2d51548..409b54cc562e 100644
> --- a/drivers/staging/fbtft/fb_ili9320.c
> +++ b/drivers/staging/fbtft/fb_ili9320.c
> @@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
>  	devcode = read_devicecode(par);
>  	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
>  		      devcode);
> -	if ((devcode != 0x0000) && (devcode != 0x9320))
> +	if (devcode != 0x0000 && devcode != 0x9320)
>  		dev_warn(par->info->device,
>  			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
>  			devcode);
> -- 
> 2.39.2
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

- You sent a patch that has been sent multiple times in the past,
  and is identical to ones that have been rejected.  Please always look
  at the mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
