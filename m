Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5893B961A;
	Mon, 11 May 2026 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486779; cv=none; b=Ll1iKp5kqC6++K0k0UOMMjlHEf+dcQXEQRsY+pg73DB0Ev1EuDcWTl8HEiq+wkoxFllB+oNxT83yC7b+NrX4KddlCvrnxtsih2qDuojZRXv4gE92DMLCr4hG1gxQOSCwFt3BJii/7GkzHuH/eh23+cI68OMNVYwfJOfxEzpQaig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486779; c=relaxed/simple;
	bh=PaZvDgzdvzP5mrwS/mb4gPjGeM8DiNn+xk0dbdyDqvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3I5JSqC7LzEXpFnlBv5ad4fXihiPMwiF2WDd3nv+C9Jnww76pM1XS9iya0KThjq5+A9zS56fTItCXV5id3v5oFZ9e/7GmiAvbACeYjZXN46g5SE5bcCm66jzwNRxYFA89RR6XlsuD5eUA0K1FPSK+n5yi1IXAEZKFv19cqoUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mG53dua5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mG53dua5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3789C2BCF5;
	Mon, 11 May 2026 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486778;
	bh=PaZvDgzdvzP5mrwS/mb4gPjGeM8DiNn+xk0dbdyDqvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mG53dua55sthBXjBxSaYrDu5nrd41T1Ayk2gLtH+lee9v/kcCKndaTqM1hyi5HNE/
	 KFzAdMfCFnV0LaZR8Wm0mx6W3YwaRtjLloAvpOq1I7Pl6yL4yBcaT1nAqcCT5Q33VX
	 TQSrtyMkRNqouejaAvH5fdwT85HfBPxkbiYfULLo=
Date: Mon, 11 May 2026 10:06:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sridhar Arra <sridhar.arra.dev@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range for
 short delays
Message-ID: <2026051104-other-excluding-ee40@gregkh>
References: <20260509080727.21636-1-sridhar.arra.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509080727.21636-1-sridhar.arra.dev@gmail.com>

On Sat, May 09, 2026 at 01:37:27PM +0530, Sridhar Arra wrote:
> The checkpatch.pl tool warns that msleep() for values less than 20ms
> can be inaccurate. This patch converts the 10ms msleep to
> usleep_range(10000, 11000) to provide more precise timing using
> high-resolution timers.
> 
> Signed-off-by: Sridhar Arra <sridhar.arra.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 5f00fe282d1b..d66f17076818 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -5834,7 +5834,8 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
>  		return H2C_SUCCESS;
>  
>  	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
> -		msleep(10);/*  10ms, ATIM(HIQ) Windows */
> +		/* 10ms - 11ms, ATIM(HIQ) Windows */
> +		usleep_range(10000, 11000);
>  
>  		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
>  		spin_lock_bh(&pxmitpriv->lock);
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
