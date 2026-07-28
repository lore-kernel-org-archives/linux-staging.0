Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E59B3C5525;
	Tue, 28 Jul 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223620; cv=none; b=UXJ1iHFLz8NNylpN/0LaDuDKYDHZ3ZjJTszmsDPsDmNnCTqZ8xr/34VOZBBUiwst3v2GqejTGbUpuBwUFwR8I6MixW3Ss1WJUN9MZ3Cv7q7WBRi0sze5/Mfyp3m4LBfkvu37FgxNQJkU+jaLB35koP7CCSo3gdHgRUPOF60WJas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223620; c=relaxed/simple;
	bh=4fWz+bzKO0uDRedVvzlDvTz+Jm8t8YzuzWqPjN4pxCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfKxW4Y5tsnqyTspjAotgVjRC8ZXR0i6u4Q6T/JIWQ5sDqPYRkbmoholVffepNhB4Ia1n9Pl5dJCTgpmIboyhCiXhTfvBhsXKzvl8MPFIAcKiCb2qdjhAcFUjoRSqGqNto5Ouaa9H6hnoJB9tmn+0tcMKe53ksLey1cpyLujpOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FqmkUkax; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FqmkUkax"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6435C1F000E9;
	Tue, 28 Jul 2026 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785223618;
	bh=i+7BCo9O+TLcDO1WTeqWUYv9qAnDg9lF6/Tx0uVVbZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FqmkUkax3EtuTkLEZsn1UwBMX311tbxDFf5j4RB4T9/V9lBa9LObJilDUnQc+yAFs
	 ixbluskUQHSxZbvrvfv5HX8wf4+fDW+s1fBCxOBod614oTlHa2GMEUE8f/3DRWO8+3
	 Pox1x+eOhkABWLCy+IoTqB8ym2zYcmIoA+m8GteA=
Date: Tue, 28 Jul 2026 09:26:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aditya Chari <adi25charis@gmail.com>
Cc: broonie@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unused function
 declarations
Message-ID: <2026072833-glass-obedience-0f15@gregkh>
References: <20260718150750.1908-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718150750.1908-1-adi25charis@gmail.com>

On Sat, Jul 18, 2026 at 08:37:50PM +0530, Aditya Chari wrote:
> rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
> are declared in rtl8192c_recv.h but have no implementation and no
> caller anywhere in the kernel tree. They are leftover from when this
> driver was derived from Realtek's shared vendor codebase covering
> multiple chip families.
> 
> Verified via grep across the full tree that neither symbol is
> referenced outside this declaration, and confirmed via a full build
> of the module before and after removal that no warnings or errors
> are introduced.
> 
> This addresses the "find and remove any code for other chips that is
> left over" item in the driver's TODO file.
> 
> Signed-off-by: Aditya Chari <adi25charis@gmail.com>
> ---
> Changes since v2:
> - Fixed placement of changelog notes below the --- marker, per 
>   submitting-patches.rst
> 
>  drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> index 1f86654f0..b63625ab4 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> @@ -30,7 +30,4 @@ struct phy_stat {
>  /*  Rx smooth factor */
>  #define	Rx_Smooth_Factor (20)
>  
> -void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
> -void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
> -
>  #endif
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
