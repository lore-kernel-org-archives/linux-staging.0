Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07E3D333F;
	Wed, 25 Feb 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028955; cv=none; b=FEyl8vPhdjlY/FSndiqcnr2pgPXE6sQBKVhw8KmBw5YRH8KiAgobI51pJafwA5l/RU5FNOTrmgNrtAnBq1zaQ26VIJors2MH4rdlqV1rRu42ckwGUJobS/XYf2eycQwCeeboNzSrxzgq220zoGe5MDaR2RZusL/d5jwUBVdjGx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028955; c=relaxed/simple;
	bh=BCLU96tvSfGfXBoxxUV8VWZv5I7XWFjn893Px9lvO1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOjtiKDqdTl70Zkm2oJRlt1yCTKmcjXr39+p9gUH+3KJ+1Du7oPezfdv6NIh3E5twjSGAa+HDSC9H8pEPxNUDQV4f0LGtx2Be3MNnIFDVt48x1PNDz+7JiaFKD4kGmF9lIsCDXCsuI8L0zo5iw4x7QXfRey3oOqrOiz/9fC/2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JxQmHEvQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JxQmHEvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949CAC116D0;
	Wed, 25 Feb 2026 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772028954;
	bh=BCLU96tvSfGfXBoxxUV8VWZv5I7XWFjn893Px9lvO1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxQmHEvQO55f9OxoH4s1PcEznaH8tNaT62RLGiGRXAx6fvIbLtImKVMuGuAupYdlt
	 rObFrs9ky6Y89OrFkkrBkGPQo4Qalnoz6bpbBiUhoiKwpyHa+AsiTS1QfDI333bt+z
	 CCAjpM1ry0Byy6bP9dCglk0Z0mYIrvtre52p/ezA=
Date: Wed, 25 Feb 2026 06:15:47 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Rodrigo Filipe Faria <me@rodrigofilipefaria.org>
Cc: s9430939@naver.com, architanant5@gmail.com, andriy.shevchenko@intel.com,
	ignacio.pena87@gmail.com, strnad.jj@gmail.com,
	bryant.boatright@proton.me, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Filipe Faria <rodrigofaria@student.dei.uc.pt>
Subject: Re: [PATCH] staging: rtl8723bs: change msleep to usleep_range
Message-ID: <2026022534-absinthe-trekker-93e2@gregkh>
References: <20260225135723.60791-1-rodrigofaria@student.dei.uc.pt>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225135723.60791-1-rodrigofaria@student.dei.uc.pt>

On Wed, Feb 25, 2026 at 01:57:23PM +0000, Rodrigo Filipe Faria wrote:
> checkpatch.pl gave "WARNING: msleep < 20ms can sleep for up to 20ms".
> 
> Kernel documentation says that usleep_range() must be used for
> delays of 10us to 20ms.
> msleep() is inaccurate with the values used.
> 
> Signed-off-by: Rodrigo Filipe Faria <rodrigofaria@student.dei.uc.pt>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index abb84f8aecbe..f6293f049c75 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		usleep_range(10000, 11000);
>  
>  	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
>  		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
> -- 
> 2.53.0
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

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
