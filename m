Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884E3B6BF2;
	Mon, 11 May 2026 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487146; cv=none; b=EbVQ5v2pcExvZ8OpN79gME1Pkx4DqmcWlu1WUZrA9tFbhZRJHC3oWkdbc5W9OqWJvgF7Z5qNTYP7Fjwp96/bzHJ5XqwdV/jq5/7DjGqNtfED1IsTqjLioUDH1jatQDTdAq94qKKWigPV4teMPvpaELycaUFUrmhUV2JolijaP/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487146; c=relaxed/simple;
	bh=bM/ap4eS5AeAkKS8L+CgkAIF+eBApwak0t7R8UaquwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alfWsjNSKTYez2lboBQK1qXqveJ9DKqIpUcmNUi9ZjQMebUqq4ckiKwhV55phdiNKCOIOQ6bSPNL5nzk8Nr6z3PEMot3wj+wJTIjQXUL1dJlt8JZsKZkrsBmM5q0B7Ie2krc5ZswmcGfTBMkVz8Nr/gmN7Sf2YGvy4abWFD2KYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XrKAOXbd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XrKAOXbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00018C2BCB0;
	Mon, 11 May 2026 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778487145;
	bh=bM/ap4eS5AeAkKS8L+CgkAIF+eBApwak0t7R8UaquwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrKAOXbdU97UUpaHsf/OmupP8n55ZSDY+r3JKkaK+oZcX+tyoHwa28K+9ZBZDVUyv
	 6CcwFop+IEa9DAV31Ulfm6g5P4OXradCkRBNmTViXQJaSU5DSYBgFisgEfug0V/9LB
	 J3L8SJy9Np6UqGpLHttlD2S/Msg8hcCc1U9pedrA=
Date: Mon, 11 May 2026 10:12:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com
Subject: Re: [PATCH v2 4/4] staging: rtl8723bs: Enclose CHAN_ARG macro body
 in parentheses
Message-ID: <2026051129-traverse-legged-af83@gregkh>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
 <20260510175207.563378-5-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510175207.563378-5-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 01:52:07PM -0400, Pramod Maurya wrote:
> Wrap the macro expansion in outer parentheses to prevent operator
> precedence issues when the macro is used in expressions.
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/ieee80211.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
> index beee37041eeb..d1167d9ea846 100644
> --- a/drivers/staging/rtl8723bs/include/ieee80211.h
> +++ b/drivers/staging/rtl8723bs/include/ieee80211.h
> @@ -639,7 +639,7 @@ struct rtw_ieee80211_channel {
>  	/*"orig_mpwr:%d\n"*/
>  
>  #define CHAN_ARG(channel) \
> -	/*(channel)->band*/ \
> +	(/*(channel)->band*/ \
>  	/*, (channel)->center_freq*/ \
>  	(channel)->hw_value \
>  	, (channel)->flags \
> @@ -649,7 +649,7 @@ struct rtw_ieee80211_channel {
>  	/*, (channel)->beacon_found*/ \
>  	/*, (channel)->orig_flags*/ \
>  	/*, (channel)->orig_mag*/ \
> -	/*, (channel)->orig_mpwr*/ \
> +	/*, (channel)->orig_mpwr*/)

These are comments?  That macro is crazy, why not fix it up properly?

And what precedence issue is being fixed here?

thanks,

greg k-h
