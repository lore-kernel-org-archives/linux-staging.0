Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1347C
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 05:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AC0C433C1;
	Thu,  8 Sep 2022 05:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662614651;
	bh=POZ/KltkboAwic9n9k8CO+lTTiiq7KytLwkAiak7F2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+s2QJoQ6PsW+NccTYXEtqN/Tppq23MwSEqf7b7A/vvLqAlniLOFDfa4NFUJlVsjK
	 S56Fl75QVQQoksuG9aSkVcuAjVtHtVoQWVlkRR5ijMYUsK0OaGO4TRFevI733yOVoL
	 2MgUHSeEvLWgohGGDCl0tfKmUfwYfFUw0UZ726SQ=
Date: Thu, 8 Sep 2022 07:24:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Robert Mindo <mindo.robert1@gmail.com>
Cc: forest@alittletooquiet.net, linux-staging@lists.linux.dev,
	inux-kernel@vger.kernel.org
Subject: Re: [PATCH]  Adding description for device.h and Kconfig
Message-ID: <Yxl8kTRJJgMywyI5@kroah.com>
References: <YxjpxztBvDdUM4dA@root>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxjpxztBvDdUM4dA@root>

On Wed, Sep 07, 2022 at 09:58:15PM +0300, Robert Mindo wrote:
> Signed-off-by: Robert Mindo <mindo.robert1@gmail.com>
> ---
>  drivers/staging/vt6655/Kconfig  | 2 ++
>  drivers/staging/vt6655/device.h | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6655/Kconfig b/drivers/staging/vt6655/Kconfig
> index d1cd5de46dcf..57d34f05888c 100644
> --- a/drivers/staging/vt6655/Kconfig
> +++ b/drivers/staging/vt6655/Kconfig
> @@ -4,3 +4,5 @@ config VT6655
>     depends on PCI && MAC80211 && m
>     help
>       This is a vendor-written driver for VIA VT6655.
> +#WLAN Open Source ndiswrapper driver.  VT6655 WLAN Open Source ndiswrapper driver. For Fedora Linux Core 7/­Mandriva 2007.1/­Debian 4.0r0/­Ubuntu 7.04 (x86/­x86_­64).
> +#WIFI Wireless WLAN Card Drivers
> diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> index c272a4ab2fa0..a48021f134e0 100644
> --- a/drivers/staging/vt6655/device.h
> +++ b/drivers/staging/vt6655/device.h
> @@ -129,7 +129,7 @@ struct vnt_private {
>  	u32                         ioaddr;
>  
>  	spinlock_t                  lock;
> -
> +	//spinlock_t -  variable which can be in two states
>  	volatile int                iTDUsed[TYPE_MAXTD];
>  
>  	struct vnt_tx_desc *apCurrTD[TYPE_MAXTD];
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
