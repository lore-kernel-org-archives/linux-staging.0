Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66B3BB44;
	Sun, 11 Jan 2026 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135790; cv=none; b=LqVGFR6/Prsf0GRSdUmkDJQDJyvxHjGz/8GMyjKEZ7VHOMNxVruuWstmBTjyudP5Akerh7f5citrjQSevRRhJdrmL4lkCNPPVGpVWDzn8qPuv0M6xhGsMyGw/b31YFXbM4r/ofwgnl117r6B6L7PzrL33Xj61QsQ/OxB/uWDToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135790; c=relaxed/simple;
	bh=Rph9xfMTEYtbo9m9FxrdrAZANYSEBx60Eu5mmCX+vXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXf3C++938nR0S/8t+jSorfQzWHgLwgHTdOTq/1dyPaf8VH+i753fAJzgjIPNapUFc7ZQyyXKxDmIPv+Wpp8o1Rb7CIaBuG0ZXlnoIhxZZUZmJf5oRtdTy75uBmNeEeUNwtzPJcrOb4phOXrRmr8KSvwtpgPTgzrdWAHF9J3m0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LP/sMJ0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LP/sMJ0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8358CC4CEF7;
	Sun, 11 Jan 2026 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768135789;
	bh=Rph9xfMTEYtbo9m9FxrdrAZANYSEBx60Eu5mmCX+vXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LP/sMJ0nSDKmvmPGdaGIRxl4SwtFM/aPwYBauyYfdpFKxXKi009Z1BVhrk+Rqmwyn
	 itlIyjIrtrfGzfDR6Hj49spyMESVBs7GTRCaRcHyCYNOlTFOTgw5EvNZG1WCZDL8/2
	 +WghY/vEIXF2NCvJpSROUEzF9/LXfm5Ym8WmypL0=
Date: Sun, 11 Jan 2026 13:49:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?ScWfxLFraGFuIEnFnklL?= <isikhan2005@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <2026011132-tweak-enchanted-5b25@gregkh>
References: <20260110204445.15571-1-isikhan2005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260110204445.15571-1-isikhan2005@gmail.com>

On Sat, Jan 10, 2026 at 11:44:45PM +0300, Işıkhan IŞIK wrote:
> The checkpatch script flags a warning that msleep < 20ms can sleep
> for longer than expected.
> 
> Replace msleep(10) with usleep_range(10000, 11000) to ensure
> more precise delay handling.
> 
> Signed-off-by: Işıkhan IŞIK <isikhan2005@gmail.com>
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
> 2.52.0
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

- You sent a patch that has been sent multiple times in the past days,
  and is identical to ones that has been recently rejected.  Please
  always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
