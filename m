Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4F336922D;
	Mon, 27 Apr 2026 03:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261891; cv=none; b=jsLwapfT0lx9xESLfiUb1OGTk64JEXnPslMCZsPX46w+63LEy107N7PTvA9kjEWfjW7ewK6F2oF6OvVaIwls5AodjOEw3Cjh/DBMd+N0PtD5g4s/Ev6bSX2nu/doAnKcI/sBxrJzdNrQeb9cJH7ek9ui+9g/rBf1P+BIshQ6BjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261891; c=relaxed/simple;
	bh=YWab7fkmg9DSKIYmqQCzbaqi+EkXQjw+Ogq+6gzIPUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5M73nZVJL3se7wta6sCgT3fdeENLa6cdgk1CPAYfZZuC6RZuf50AA4Vs2Z8JpEwPNb7UPttfBi6+bOQ4uTvzD2DZUbCAOvO5LNV56jXLmGNsIXQhDMHbhHE5fBHo8bnPEN6Gy6t6SX1KW2gezx6DkIh0c3x0ZF2K1y8FJ+6Lx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PJLI8PUe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PJLI8PUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9926C19425;
	Mon, 27 Apr 2026 03:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261890;
	bh=YWab7fkmg9DSKIYmqQCzbaqi+EkXQjw+Ogq+6gzIPUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJLI8PUeKtFRiZxjT57L70kSvCrwwTkK20kZ+KlDQipi5WjoY9mU3EFZKZf0bHjgU
	 DuqI2OmRymEDBoQoZesgj74Oz8lXQRZ9Zp3fstmv2laqiTIibn9M6DTC4BeYN6lb1E
	 NhIxoBclnbQQOujuV3ESjHPj5KNZIReqqxmjjTxk=
Date: Sun, 26 Apr 2026 22:10:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Demir =?iso-8859-1?Q?=D6zdemir?= <demirozdemir@disroot.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant else block in
 sdio_halinit.c
Message-ID: <2026042639-briskness-conch-f3cf@gregkh>
References: <aeY1Mc2uEUKkr-dB@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeY1Mc2uEUKkr-dB@archlinux>

On Mon, Apr 20, 2026 at 04:16:17PM +0200, Demir Özdemir wrote:
> Remove redundant else block after a return statement within if block in
> rtl8723bs_hal_init(). Identified through checkpatch as a warning.
> 
> Signed-off-by: Demir Özdemir <demirozdemir@disroot.org>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index f2f73c65a636..809f07855bb8 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -654,11 +654,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>  		padapter->bFWReady = false;
>  		pHalData->fw_ractrl = false;
>  		return ret;
> -	} else {
> -		padapter->bFWReady = true;
> -		pHalData->fw_ractrl = true;
>  	}
>  
> +	padapter->bFWReady = true;
> +	pHalData->fw_ractrl = true;
> +
>  	rtl8723b_InitializeFirmwareVars(padapter);
>  
>  /* 	SIC_Init(padapter); */
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
