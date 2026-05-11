Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7D3A960A;
	Mon, 11 May 2026 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486378; cv=none; b=C5SQqTf1zqoJXK8qweyoIPxxjABjZZuYGcsn8NLVF38N+APuIaQxpKVym+U/VVWarDoaPyk3z2vdG9R+Kb93/ZtXJpjQAbLao+Ubb9qAbXTuOAzNSVkQpDh/OR2BLknW6Vf7aDqBk8CdGvb16OonYmLssSfousIOjt+3KGXG0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486378; c=relaxed/simple;
	bh=wAPvxH/b6rZoPn49vYzkQMrIDojz7/QiyUOo678uPpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B12+RWxgS7v271CgWjRThny+Y0Y8sylBErSxLwrGpCeEBlMdltHCHK+sRHL1cXxxXUikMiyZJ8HDuuUWiRgmKGrt+HgAEUAYjlUIG6N9rNKMH2HQa+0CPkfh/BUlnG89xjhzh1FlNOvzjdDDvFaV3OqgijP9vAf5d+GQj56pmRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b4/NBJXM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b4/NBJXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCED9C2BCF5;
	Mon, 11 May 2026 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486377;
	bh=wAPvxH/b6rZoPn49vYzkQMrIDojz7/QiyUOo678uPpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4/NBJXM075s5ZjYFRy8s/6252s68WJbdsWVXL5OPXWUNwO0OZT1910djl6+fIUpa
	 HGhTo4lS+kO4CcntbWcsp74EvlcspvqdkzgNdGYfUqqFxntOYgw/j9PEAfwIm0gfM/
	 Woo2lHckwto3feofiCd++tAv1c9EQckHIC1wlJ40=
Date: Mon, 11 May 2026 09:59:34 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v6] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Message-ID: <2026051124-washout-squander-471c@gregkh>
References: <19e033056fb.47bb4db720358.3907801390816381202@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e033056fb.47bb4db720358.3907801390816381202@zohomail.in>

On Thu, May 07, 2026 at 09:36:00PM +0530, Ashwin Gundarapu wrote:
> 
> 
> >From 50c6b6259becbb357e3d7c9f8e26cef10b4e0ef3 Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Thu, 7 May 2026 21:29:11 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c
> 
> Remove braces around single statement blocks.
> 
> Found by checkpatch.pl --strict
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 9cf1c95dd924..c14b8dbd478b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -483,13 +483,13 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>                         break;
>                 }
>  
> -               if (rtw_roam_flags(adapter)) {
> +               if (rtw_roam_flags(adapter))
>                         /* TODO: don't select network in the same ess as oldest if it's new enough*/
> -               }
> +
>  
>                 if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
>                         oldest = pnetwork;
> -       }
> +
>  
>         /*
>          * If we didn't find a match, then get a new network slot to initialize
> @@ -2410,9 +2410,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
>  
>         len = 0;
>         p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> -       if (p && len > 0) {
> +       if (p && len > 0)
>                 /* todo: */
> -       }
>  
>         if ((pregistrypriv->bw_mode & 0x0f) > 0)
>                 cbw40_enable = 1;
> -- 
> 2.43.0
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
