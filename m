Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90A2175A8A;
	Sun, 26 Apr 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777187028; cv=none; b=QPf84+80PjjCUbeRpUyXskpr2TAKxTrD/attr9K2DUpQ6CK6cppLfER8Q0Z5mQso1Vtz0Jw5VLJhtvsSpyBeOuPh35fRWU61fh1ejOJ14xI9F05Y1pLWiCl83jKfOZW3uljtWhtBuwrHJ1mDNUOSwMNJlzCFTaZOAsxte7u4ESU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777187028; c=relaxed/simple;
	bh=XSSBOmIqKm8/emIKJx9NhmTt+gD+EBb75+HQYfX81Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6ZMwPLDbZ/+iM9XRLbHA3JRsbPMREk1UGtr8XyjACVCzllUJquHe/1c4swFMYrQUgVG4F49SljCHh+r4NdqUr8PToYdpYQvmJ0lqr2+evhOCC2ixBHQenbh3gMO725yt4v0nCDx87FD1mvZX/oahG6BN0fkiohqpLtI1X2sr+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QQDwrcea; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QQDwrcea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191A7C2BCAF;
	Sun, 26 Apr 2026 07:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777187028;
	bh=XSSBOmIqKm8/emIKJx9NhmTt+gD+EBb75+HQYfX81Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQDwrceanDjk2/eDj2dYyWAPn1HXFXeak1dA/feJRc/Jkn/172lZPOzZFWPy4L45G
	 qpaenQcYi/NImbwRKCgEIbmGebHijBS4CEOmCiKsSk2FlSRI1+wD655i3MhOfHADqQ
	 XOB+q/xh2XxOllhmlwjWyzMng/TR5HKnMjQxQDlo=
Date: Sun, 26 Apr 2026 09:03:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lettice up <minecraftwemmne@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length in rtw_cmd.c
Message-ID: <2026042652-starving-dejected-6c89@gregkh>
References: <CAJYuYVmJ93xKgV2cT8=C5ah2e8Cg47tHEEBr4ka59K9Bogq96Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJYuYVmJ93xKgV2cT8=C5ah2e8Cg47tHEEBr4ka59K9Bogq96Q@mail.gmail.com>

On Sun, Apr 26, 2026 at 02:41:38PM +0800, Lettice up wrote:
> From: Lettice <minecraftwemmne@gmail.com>
> 
> Date: Sun, 26 Apr 2026 00:49:40 -0400
> 
> Subject: [PATCH] staging: rtl8723bs: fix line length in rtw_cmd.c
> 
> 
> Fix a checkpatch.pl warning where a line exceeds 100 columns
> 
> by breaking the long memcpy() call into two lines.
> 
> 
> Signed-off-by: Lettice <minecraftwemmne@gmail.com>
> 
> ---
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
> 
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> 
> index c1185c25ed36..50662d44a4b6 100644
> 
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> 
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> 
> @@ -557,7 +557,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter,
> struct ndis_802_11_ssid *ssid,
> 
> 
> 
>                 for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
> 
>                         if (ssid[i].ssid_length) {
> 
> -                               memcpy(&psurveyPara->ssid[i],
> &ssid[i], sizeof(struct ndis_802_11_ssid));
> 
> +                               memcpy(&psurveyPara->ssid[i], &ssid[i],
> 
> +                                      sizeof(struct ndis_802_11_ssid));
> 
>                                 psurveyPara->ssid_num++;
> 
>                         }
> 
>                 }
> 
> --
> 
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
