Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9944E4CF;
	Mon, 20 Mar 2023 10:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27288C433EF;
	Mon, 20 Mar 2023 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679308983;
	bh=b7PFh3YhCgSl4cZHu1XnSk4/kQBLuxV+91gIq3yFMaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImOUHhynTTZoM9nBetVrrEMlNZ9aqCaSvqF4LPrJhWwbhkL/MG4hA0RnvlKyLiwfB
	 TwaDI0LwOqmHkurwpNzDggxlD7Np7ath9Q0YfGxQ2w+o5JeRSlcGoGDafpE0UmcjSO
	 Dg/Z2y1+iZaEU9eGcfllLmDKSLKpJcAg3SQHJqCU=
Date: Mon, 20 Mar 2023 11:43:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] staging: rtl8723bs: use inline functions for
 dev_to_sdio_func
Message-ID: <ZBg4tGlY+Epz0Vhd@kroah.com>
References: <20230320103441.6537-1-eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320103441.6537-1-eng.mennamahmoud.mm@gmail.com>

On Mon, Mar 20, 2023 at 12:34:41PM +0200, Menna Mahmoud wrote:
> Convert `dev_to_sdio_func` macro into a static inline function.
> it is not great to have macro that use `container_of` macro,
> because from looking at the definition one cannot tell
> what type it applies to.
> 
> One can get the same benefit from an efficiency point of view
> by making an inline function.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 490431484524..7ee821dbbae0 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -10,7 +10,10 @@
>  #include <linux/jiffies.h>
>  
>  #ifndef dev_to_sdio_func
> -#define dev_to_sdio_func(d)     container_of(d, struct sdio_func, dev)
> +static inline struct sdio_func *dev_to_sdio_func(struct device *d)
> +{
> +	return container_of(d, struct sdio_func, dev);
> +}
>  #endif

Why is the "#ifndef" check still needed now?  Really it was never
needed, but now would be a great time to remove it as it doubly does not
make any sense here.

Oh wait, no, this whole thing can just be removed entirely, right?
There already is a dev_to_sdio_func macro defined, so the #ifndef check
catches that so your change doesn't actually modify any code that is
used.  So this should all be removed, not changed to an inline function.

thanks,

greg k-h
