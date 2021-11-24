Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5318268
	for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 10:00:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3569E60FE7;
	Wed, 24 Nov 2021 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637748020;
	bh=Y7OGHmzM/QRiOXEQt1GwzlAHT6uWnRqHgOUzWOS2iMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKq6Ay/c5woTlEQcoBB4DNSe7x/yuYbxxn9l4si8KBWSNXaznCi+qUOSbW/OIjp52
	 8EIfEBD3jvqqUB1oGI3J2eKfjwCr2Z649lMszCqqUvJTy3kwwrgSzf4bXwGFv/3157
	 LGRbrj7ggrodBQCr7U3mrj91ziuQueGxnnI0/TCg=
Date: Wed, 24 Nov 2021 11:00:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vihas Mak <makvihas@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx, paskripkin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove unnecessary NULL check
Message-ID: <YZ4NL3TvLYMa/Tzu@kroah.com>
References: <20211122195350.GA166134@makvihas>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122195350.GA166134@makvihas>

On Tue, Nov 23, 2021 at 01:23:50AM +0530, Vihas Mak wrote:
> remove unnecessary NULL check surrounding rtw_free_netdev(), as the check
> is already performed inside rtw_free_netdev() in
> drivers/staging/r8188eu/os_dep/osdep_service.c.
> 
> Signed-off-by: Vihas Mak <makvihas@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 5a35d9fe3fc9..392bd7868519 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -466,8 +466,7 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
>  		if1->hw_init_completed);
>  	rtw_handle_dualmac(if1, 0);
>  	rtw_free_drv_sw(if1);
> -	if (pnetdev)
> -		rtw_free_netdev(pnetdev);
> +	rtw_free_netdev(pnetdev);

As Dan said, this isn't usually a good idea to hide this.

And are you sure this ever could be NULL?

thanks,

greg k-h
