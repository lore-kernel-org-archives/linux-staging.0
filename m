Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B399F72
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 12:17:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E103760F38;
	Sat, 30 Oct 2021 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635596256;
	bh=poyv5wdYEefJ+4hX2eAM86OzJSWrC+UXmF3t7TOQYws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w1+2hEbjuQOZLTR32ebdWj0ziABHJJRp8IocXHVOw44cQMWY+DUypF1FR7g7CfxMJ
	 nGi5uhovUZMqvoWpLe0SxVtqEBXzakFewH9PW86kLZFh4b5Amh9DPidgdbDiAfvHAE
	 bdzk+XUQMAD/NA+6vKoZIAbENtyHXASkZDgUI7MI=
Date: Sat, 30 Oct 2021 14:17:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Goller <gabrielgoller123@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: Removed unused comments
Message-ID: <YX033kO2Ivbn+xop@kroah.com>
References: <YX0m1jF6p6OjMTRV@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YX0m1jF6p6OjMTRV@desktop>

On Sat, Oct 30, 2021 at 01:04:54PM +0200, Gabriel Goller wrote:
> Removed commented-out code pieces that are not used anymore.
> 
> Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2mib.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
> index c04fc17b3c64..fcf8313870af 100644
> --- a/drivers/staging/wlan-ng/prism2mib.c
> +++ b/drivers/staging/wlan-ng/prism2mib.c
> @@ -679,16 +679,8 @@ static int prism2mib_priv(struct mibrec *mib,
>  					       HFA384x_RID_CNFWPADATA,
>  					       (u8 *)&wpa,
>  					       sizeof(wpa));
> -			/*
> -			 * pstr->len = le16_to_cpu(wpa.datalen);
> -			 * memcpy(pstr->data, wpa.data, pstr->len);
> -			 */
>  			pstr->len = 0;
>  		} else {
> -			/*
> -			 * wpa.datalen = cpu_to_le16(pstr->len);
> -			 * memcpy(wpa.data, pstr->data, pstr->len);
> -			 */
>  			wpa.datalen = 0;
>  
>  			hfa384x_drvr_setconfig(hw,
> -- 
> 2.30.2
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
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
