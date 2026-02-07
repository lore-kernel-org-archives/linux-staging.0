Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2C21EFFB7;
	Sat,  7 Feb 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470489; cv=none; b=gsBw51bwUiVXitTRiLG80n7troXvPvPiF1IJoNuYFigHTsyqtwwv/egSa2CajrgtWQTOzxjDXEIXJ17FCSKzW9S6XuEw6ZJu8wslHowbyyhhOVW/WqFUwqohhxM5utabbTK/46Yze4qEcH5VMcbK31PXGToT216S/UfovHDZTEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470489; c=relaxed/simple;
	bh=JnNulxX0mcOifbYiyYnq9Nkcbe64m7P4m4xUkDYJRnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWwQJMAf5RTkFbMzTgaViotbWJCn+7BQBfotU+qJjtvoJDpRXDGpIAG/ggcYOGHg0deulBj+gZwMpWKsaspeTbpIlvBgTa+aGTa1uqN57itN1Md6gInRFCRp5iI0/nvsxmriEmX0TX20i6eHsmN68vmDnHDh2EEWhi7jmnm5TUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Uiyb7LuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Uiyb7LuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1288AC116D0;
	Sat,  7 Feb 2026 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770470489;
	bh=JnNulxX0mcOifbYiyYnq9Nkcbe64m7P4m4xUkDYJRnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uiyb7LuOL/UVe0gfow7NrE3HeTdUmfkrOb1FLUmW+admqzvhL7ry9SjJRdDuySgPq
	 Exu/++AJ2VapcTqNczhq5u9PK7RjvZrlGm7n1BDR2OQJATzziAlLXMfPm+TUcyTV5B
	 kdVIjkERyTvN/g1ylONWQg9734o1bhna4P4Ug0u8=
Date: Sat, 7 Feb 2026 14:21:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: make _action_public_str const
Message-ID: <2026020713-chemo-affront-d155@gregkh>
References: <20260202131649.161215-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202131649.161215-2-giorgitchankvetadze1997@gmail.com>

On Mon, Feb 02, 2026 at 05:16:50PM +0400, Giorgi Tchankvetadze wrote:
> The _action_public_str array is never modified at runtime and 
> serves as a lookup table. Mark it 'static const char * const' 
> to allow the compiler to put it in the read-only data section.
> 
> This fixes a checkpatch warning:
> WARNING: static const char * array should probably be static const char * const
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> v2: add blank line before Signed-off-by (suggested by Dan Carpenter)
> 
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 8fdeeda88a6d..4de0875904eb 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
>  	return true;
>  }
>  
> -static const char *_action_public_str[] = {
> +static const char * const _action_public_str[] = {
>  	"ACT_PUB_BSSCOEXIST",
>  	"ACT_PUB_DSE_ENABLE",
>  	"ACT_PUB_DSE_DEENABLE",
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
