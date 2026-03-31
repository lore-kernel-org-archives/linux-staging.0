Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407FC3D2FEC;
	Tue, 31 Mar 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946314; cv=none; b=Nc/O0CT1DatokA4BbWI7b6tO/dJhh3Lkf4wY0gmiW/STPLT0wnv2JFyE15Bk8ZtH+VYreIfMCUV1gl4jZZr1pJ0BHS3F+2V/ijAJnpc9jSeq0eh2GuMS8BXyd9UBqsAwkF7FVDuwzeU6jAjbZKyA/6S65Y7e5w/n0yLr8GDbKo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946314; c=relaxed/simple;
	bh=jt7ABtTeElomuYLj8s8D8tq1Hs0lPDusINfHpbYxCnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz/q7KyqFl5VyR1SEtz+NN3osME6Y9nNoG1NcNfwZTAdC3jF/dyCCzJSpcsVJNgVkBNj3i/YTPrqsoyY1RR2pEyGb65VzY+weiZvVnbn7IhZBE/AkuQS3TuNotaE4Yy0sORdjahezqbltHZRX6x6nCo2EJc6+U/i6bkP8jiaDA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J94L7oNZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J94L7oNZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E860C2BCB0;
	Tue, 31 Mar 2026 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774946314;
	bh=jt7ABtTeElomuYLj8s8D8tq1Hs0lPDusINfHpbYxCnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J94L7oNZnM5QKrqQxy3ZiPBp46FKet1bTM7gg4sCBuWei5BNXtUQlPFb/D9QTRpom
	 AkhRPmEN9kJhoy0fEDCLPRlpg0P2bmj9YlhBU3Fuuo8QKqY1AA3oq5PdBzemda9K/L
	 Vp6Hunu4j3LwKQr22MW+mhmUzhiSaT9RhCLzN+yY=
Date: Tue, 31 Mar 2026 10:38:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhavya Gupta <anim8tor.ing@gmail.com>
Cc: ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename camelCase variable
Message-ID: <2026033119-dreadful-disdain-df66@gregkh>
References: <acjdwatHpEkfBiXT@gamin8ing>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acjdwatHpEkfBiXT@gamin8ing>

On Sun, Mar 29, 2026 at 01:37:29PM +0530, Bhavya Gupta wrote:
> Rename the "pIE" variable to "ie" to comply with the linux kernel coding
> style.
> 
> This fixes the following checkpatch.pl warnings:
> 	CHECK: Avoid CamelCase: <pIE>
> 
> Signed-off-by: Bhavya Gupta <anim8tor.ing@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 4cdcdddf6b33..4b4012411011 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -1364,20 +1364,20 @@ static void update_bcn_erpinfo_ie(struct adapter *padapter)
>  		       &len,
>  		       (pnetwork->ie_length - _BEACON_IE_OFFSET_));
>  	if (p && len > 0) {
> -		struct ndis_80211_var_ie *pIE = (struct ndis_80211_var_ie *)p;
> +		struct ndis_80211_var_ie *ie = (struct ndis_80211_var_ie *)p;
>  
>  		if (pmlmepriv->num_sta_non_erp == 1)
> -			pIE->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
> +			ie->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
>  		else
> -			pIE->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
> +			ie->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
>  					  RTW_ERP_INFO_USE_PROTECTION);
>  
>  		if (pmlmepriv->num_sta_no_short_preamble > 0)
> -			pIE->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
> +			ie->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
>  		else
> -			pIE->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
> +			ie->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
>  
> -		ERP_IE_handler(padapter, pIE);
> +		ERP_IE_handler(padapter, ie);
>  	}
>  }
>  
> -- 
> 2.53.0
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
