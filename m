Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D733ACF00;
	Sun, 10 May 2026 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778429354; cv=none; b=r+fp3Uc0WV16525nUgW4dpO6KJc6MFC94bC36a671vyKIR2S/ipqKkEm1YIsaKA3+L4yUeKqGMWMNvKY3Ki6jNoXi5wnlFVkrymN2rtWts0kTiC9gQOKGrknEGOEYbWckvlNf5Bm7KnD69YHV6hb6Wd5lHL7qbz3ZEgPBrqc9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778429354; c=relaxed/simple;
	bh=r6ypH5vOnmCdK1x0mVxId89IQ4X3q82AZwHSPatmsmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKeL5W74xPsNCgo2D1YbfOHSv9F7ip6P9S830TYwpjBmkZ2k4ZrKgQiqYWBdrzHbisVjzcd0+kOR2tUo4WB9DM5585R2Sp3q9mCXtpukk8HXw9Nz4poQt9h1Wk4C8wSeuW6sreShGn8hoJ9hea2jASy283Wo561p3j0c0Y21CIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tWtXrdRf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tWtXrdRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08537C2BCB8;
	Sun, 10 May 2026 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778429354;
	bh=r6ypH5vOnmCdK1x0mVxId89IQ4X3q82AZwHSPatmsmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWtXrdRfffFp2d/AUGJlBgx19JteV1Qzqb29AY/rGQ9w0H4qtBsBgVuGexkO0SgJT
	 w9S2+C3PXR4bxP46Iu/j9JPhxtb2V1VWEuRIYThnaD6e0CQZiNEcnu84xPwb7gbZmB
	 0zkV3W20atjHSWrrz7joxRUn/9ksg3aC/IT7BBac=
Date: Sun, 10 May 2026 18:08:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in rtw_efuse.c
Message-ID: <2026051009-overcast-art-f552@gregkh>
References: <20260510063314.34066-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510063314.34066-1-mokshpanicker.7@gmail.com>

On Sun, May 10, 2026 at 06:33:14AM +0000, Moksh Panicker wrote:
> Fix the following checkpatch.pl warnings in rtw_efuse.c:
> - Reformat multi-line function signature to fit on a single line
> - Add braces to else branch to balance with the if block
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index a7a636449813..b4e1b6efdc77 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>   * 09/23/2008	MHC		Copy from WMAC.
>   *
>   */
> -u8
> -rtw_efuse_read_1_byte(
> -struct adapter *Adapter,
> -u16		Address)
> +u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  {
>  	u8 Bytetemp = {0x00};
>  	u8 temp = {0x00};
> @@ -76,17 +73,13 @@ u16		Address)
>  				break;
>  		}
>  		return rtw_read8(Adapter, EFUSE_CTRL);
> -	} else
> +	} else {
>  		return 0xFF;
>  
>  } /* rtw_efuse_read_1_byte */
>  
>  /*  11/16/2008 MH Read one byte from real Efuse. */
> -u8
> -rtw_efuse_one_byte_read(
> -struct adapter *padapter,
> -u16	addr,
> -u8	*data)
> +u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16   addr, u8	*data)
>  {
>  	u32 tmpidx = 0;
>  	u8 bResult;
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
