Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F296E70
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 17:34:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E98C2610A6;
	Mon,  3 May 2021 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620063280;
	bh=l5084I0XKY6JtLZEwaFpVgC0DG2CBnu4D3e5ZRVCmn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0V/TaYaw7x41bco9T+fqnFiTwFDRyH4rLUFUkbL8OFb/9dbY2XGoGdZSnnUdg91B1
	 q8I/Aa+ZPSSGNKWkEUoPADnRdLiJQEh/f6RKXImn4fUGrrXEj7AzqZEv3gNmUkAohK
	 O5xBF6LCOPP9uU1eL5XVvrlfd8rcKLGkYhUQnaVI=
Date: Mon, 3 May 2021 19:34:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jordan Vaughn <jordanvaughn1@gmail.com>
Cc: ganesanr@broadcom.com, linux-staging@lists.linux.dev,
	Jordan Vaughn <jordvaughn1@gmail.com>, jchandra@broadcom.com
Subject: Re: [PATCH] netlogic: This patch formats existing comments to Linux
 standards found in TODO.
Message-ID: <YJA0LrENB0DhSIzu@kroah.com>
References: <20210503170353.66415-1-jordvaughn1@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503170353.66415-1-jordvaughn1@gmail.com>

On Mon, May 03, 2021 at 05:03:53PM +0000, Jordan Vaughn wrote:
> Netlogic: xlr_net: Fix styling problems with comments 
> 
> Signed-off-by: Jordan Vaughn <jordvaughn1@gmail.com>
> ---
>  drivers/staging/netlogic/xlr_net.c | 67 +++++++++++++++---------------
>  drivers/staging/netlogic/xlr_net.h |  3 +-
>  2 files changed, 36 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/staging/netlogic/xlr_net.c b/drivers/staging/netlogic/xlr_net.c
> index 69ea61faf8fa..c1539b6b75b8 100644
> --- a/drivers/staging/netlogic/xlr_net.c
> +++ b/drivers/staging/netlogic/xlr_net.c
> @@ -15,20 +15,19 @@
>  #include <linux/jiffies.h>
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
> -

This was not a comment change :(

And please write a better changelog.

>  #include <asm/mipsregs.h>
> -/*
> +
> +/**

That's a kernel-doc format marker, why did you do that?

thanks,

greg k-h
