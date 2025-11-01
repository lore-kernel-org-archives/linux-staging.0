Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B041DE8B5
	for <linux-staging@lists.linux.dev>; Sat,  1 Nov 2025 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762023725; cv=none; b=R/tANjAwUdWuvdeO7KzZtzJE0cxjMaFrhne6wAFU9liYyOnX6SyGViNfkJrUVEcVjevhDSJTWr3UR2jSnrnvwG3f96eQ2KtolFWiKlVtEBArCHWr5H0m+i10cHWuRiDJmK25wDzW/QP/Q9lBFeUFv6b+1J92vTpoUt2u/mKXPP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762023725; c=relaxed/simple;
	bh=rgVRPfRE463EkoKVmaTb6EgbAu1gnlWvnpajCNRdBfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vw8W0wIWQeKfbOpP/IRY1l4guS/YSc1hm+QeOHhmQpKPq/Z9BopLMrRe6EyoXL4ND2kx4gPqStx1zi4aDaWPv0U9iL5eP9juBvDg/gjui997zdO/942Q7/rvowLjm/pA817H99Ng/PGNYRi3d2tGE5max2WovCgfL67lcadp7I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zjd75V2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zjd75V2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F34C4CEF1;
	Sat,  1 Nov 2025 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762023724;
	bh=rgVRPfRE463EkoKVmaTb6EgbAu1gnlWvnpajCNRdBfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zjd75V2AQcbmLcnlGXPG8p4y9KnWoDkZu6q+tTUoWg9dD2ls9VYesFw3HpBm3bXbp
	 lkqhDjfn2U3G2uVruzYPiCxaR3BT1jJ1RPfguwQCXQAkNAiyduUswlRbzEM5nFAUGC
	 oNgDFxljpMC8czy1NSwCMwl9PjOSsAe4l7mbpOns=
Date: Sat, 1 Nov 2025 20:02:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unused rtw_sprintf macro
Message-ID: <2025110145-fleshed-stargazer-01ed@gregkh>
References: <20251101184149.51077-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101184149.51077-1-rafiqul713@gmail.com>

On Sat, Nov 01, 2025 at 07:41:49PM +0100, rafiqul713 wrote:
> From: Rafiqul Islam <rafiqul713@gmail.com>
> 
> The rtw_sprintf macro is defined in osdep_service.h but has no callers
> in the driver. Remove the dead code.
> 
> Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index 8b1634f4091e..12369ee2ce1d 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
>  void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
>  struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
>  
> -/*  String handler */
> -/*
> - * Write formatted output to sized buffer
> - */
> -#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
> -
>  #endif
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
