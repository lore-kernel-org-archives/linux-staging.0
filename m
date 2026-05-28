Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C332AAA8
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953347; cv=none; b=sZaZE4LGDVrhKJOXWlNp7NIEKw1FIQqUTmt1tHEwuHnDPE6u4CnZHP66J+F78W1rO4DAXc5zdG5+WGu4hGMUb3kgZtULsMelp+DX3AG+vQqXbB2uKFeylmnCr8F9dF8AiTdBz78JORM+yMZ16H244XvWqNoQ95HW4YTMbCpEDtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953347; c=relaxed/simple;
	bh=Mk0GTRhjVV7E8blWcHvGiwEC7UFKDJofRMOV5EeZenY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShKv/DZZkhDx0YivqEXoCPRQPL2aHAo/d33TkjWT61bV9oOj+lkNFXkD3qdWg2KRqy0B62zbWGI+FaGCSJ4xOy9tLEN8fUdyXfKwu661IVhwh/6KJy/eniVYyRqZGokik87jjecUVjpXbGnwr9anjycA7eHPhjOVLi2odJo/Fsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p5Hs9wvj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p5Hs9wvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1DD1F000E9;
	Thu, 28 May 2026 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779953346;
	bh=DoX5o5RKpocuoV8I44qG3WNRNncSx6SGZdXnt84718Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p5Hs9wvjPK7kEP6ksmEsa/4K5Kd9lDdEJ7fM4xoUG6hkhqM+GFaKbrki62Y8sDnNG
	 x4UBwCi9H04IsVp5h7yKlLXmEsRx6aOE0WZ/aFzVHoDB3ogYqSEUWVP7IzEpwVzYgA
	 ZvR2mCepP2eHmw5TFDjyQaVUmM/JrCQwpNEfakjY=
Date: Thu, 28 May 2026 09:28:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bastien Cossette <bastiencossette29@icloud.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary NULL check
 before vfree
Message-ID: <2026052853-process-stimuli-6244@gregkh>
References: <20260528070554.40315-1-bastiencossette29@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528070554.40315-1-bastiencossette29@icloud.com>

On Thu, May 28, 2026 at 03:05:54AM -0400, Bastien Cossette wrote:
> The vfree() function handles NULL pointers natively. Cleaning up the
> redundant if check simplifies the code and adheres to core kernel
> coding styles.
> 
> Signed-off-by: Bastien Cossette <bastiencossette29@icloud.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 728a2171fbcb..00c511b38595 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -23,14 +23,11 @@ u8 rtw_hal_data_init(struct adapter *padapter)
>  
>  void rtw_hal_data_deinit(struct adapter *padapter)
>  {
> -	if (padapter->HalData) {
> -		vfree(padapter->HalData);
> -		padapter->HalData = NULL;
> -		padapter->hal_data_sz = 0;
> -	}
> +	vfree(padapter->HalData);
> +	padapter->HalData = NULL;
> +	padapter->hal_data_sz = 0;
>  }
>  
> -
>  void dump_chip_info(struct hal_version	chip_version)
>  {
>  	char buf[128];
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
