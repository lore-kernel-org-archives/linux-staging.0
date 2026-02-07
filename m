Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653A9823DD;
	Sat,  7 Feb 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770466102; cv=none; b=bqK78VuIxeUHgaW0kiTfPq07qxzHQLafeW7rfSWW7UwP3yDxU3fNGugQQsnbPAOnspqsViHZAGKv/2mauiDH8do2JZj1RGhhJjpLdXggFtVDoVxCv4bLA/f/aLr62Xb5hgKT/v8Z67jB4JRPjxeY6gZGJUOQNi/qndEziSNlUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770466102; c=relaxed/simple;
	bh=d0ShvmhpzpgSMYl5lZRudCJZ9+jcTuNChDXstoR3nbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjgC+HFXhYMadhpoXZ1p2CHSBYAslaouw8volGM2ejEl8xkI0nRRHuRrErb5fwZMVVmP59+6am+JINCcDh481Z/5Hk6PVRldQK6WhGl78g2gcVfL8MoV5MgzOXj1Ho2uaSyHaU0pHNfh7ony15e7pLNdNmEfO+BJ3QUcN0PxQSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rFuBnFXS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rFuBnFXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD80C116D0;
	Sat,  7 Feb 2026 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770466102;
	bh=d0ShvmhpzpgSMYl5lZRudCJZ9+jcTuNChDXstoR3nbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFuBnFXS3TRE8rtmDUSU+48QCl4Ae9wo8vliLAuChnCfm9nYzGLs8BCnBQDuIz3uh
	 iquMw6rJYBLVDk+8trkA//H2q2jC9w6E1uf15Cn81NoCf7tQIQrCd+RcWUyBLFdS/5
	 IM303qNvmhdMfekzwUvJZttK0ibzGnWSHY5eIoF8=
Date: Sat, 7 Feb 2026 13:08:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fu Zang <t1468150755@163.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Fu Zang <t1468150755@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range for
 small delays
Message-ID: <2026020758-cartoon-common-7f71@gregkh>
References: <20260130130803.42858-1-t1468150755@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130130803.42858-1-t1468150755@163.com>

On Fri, Jan 30, 2026 at 09:08:03PM +0800, Fu Zang wrote:
> From: Fu Zang <t1468150755@gmail.com>
> 
> The msleep() function is not recommended for delays shorter than 20ms
> as it may sleep considerably longer than requested.
> 
> This patch replaces msleep(10) with usleep_range(10000, 11000) to
> provide more precise delay control while allowing the timer subsystem
> to coalesce wakeups.
> 
> Found by checkpatch.pl.
> 
> Signed-off-by: Fu Zang <t1468150755@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ef2d92b5588a..97c923015279 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		usleep_range(10000, 11000);
>  
>  	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
>  		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> -- 
> 2.43.0
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

- You sent a patch that has been sent multiple times in the past, and is
  identical to ones that has been recently rejected.  Please always look
  at the mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
