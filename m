Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306932D45C;
	Tue, 10 Feb 2026 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705425; cv=none; b=tmUAen7RHUCpcS/Y6XbKa2DCt0lHiraDvnzx3vdSHI15Yhf1QlCOkdgfCzOnG2f5IvCpa+eSJKO8uvwVP8247DX6cyp17yQO4FeE1MU6LzKBWtbGdsHqhvPwdeqDUNi0WKUtxMb5rmNj7e23fWHPrF1YyO6NlyCjRMdDQIFnImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705425; c=relaxed/simple;
	bh=xp/Ty3Ym0J541ttVg63kpxCqX0mP0YRbxvW3Yh1Gdd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfyWzYhnuCmKLGZF0Cx+zAU1Y3eoY8KRB4E7pl2DEc8fsHKeLPQwWGdVU3+g1QlzEg22TClrSDy/N5wmtCGjuGZ9q4Tl1WS7hDI3D37MlZgmfZxXgbQ0Kc51i3ubpHla3lNNhGrYFvfk2DY5yGgHv91g4q+dajJznWZt+MSSdFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LL1QpLkA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LL1QpLkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD34C116C6;
	Tue, 10 Feb 2026 06:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770705424;
	bh=xp/Ty3Ym0J541ttVg63kpxCqX0mP0YRbxvW3Yh1Gdd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LL1QpLkAjqhwH5xkYDOktbdJPUx1+vApiuL0xLsKKTbF9m+vbbVx6SEoETnLaCNEG
	 gGpb+5L5Qdc9r+zNs351KJCTPWngeyg2Un2qAT+/e+9Dwja2y0EwYs25yAfEJUWt6h
	 baTYRdJCwNKhKiToyzsoUNidBvGJEbl8EsuokC54=
Date: Tue, 10 Feb 2026 07:37:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vo Thanh Cong <thanhcongvo079@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <2026021049-those-unaired-d20f@gregkh>
References: <20260210055859.1273923-1-thanhcongvo079@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210055859.1273923-1-thanhcongvo079@gmail.com>

On Tue, Feb 10, 2026 at 12:58:59PM +0700, Vo Thanh Cong wrote:
> Replace msleep(10) with usleep_range() to provide better accuracy
> for short delays (< 20ms) and to resolve checkpatch warning:
> "msleep < 20ms can sleep for up to 20ms".
> 
> Signed-off-by: Vo Thanh Cong <thanhcongvo079@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index b2e7f479f72b..3f5b3ca2066d 100644
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
