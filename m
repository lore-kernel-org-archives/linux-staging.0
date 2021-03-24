Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FA66F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 16:43:00 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1lP667-0001Ly-SM; Wed, 24 Mar 2021 17:11:07 +0100
Date: Wed, 24 Mar 2021 17:11:07 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Colin King <colin.king@canonical.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: rtl8188eu: Fix null pointer dereference
 on free_netdev call
Message-ID: <20210324161107.m7gbexp4e7e5vf77@viti.kaiser.cx>
References: <20210324152135.254152-1-colin.king@canonical.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324152135.254152-1-colin.king@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hello Colin,

Thus wrote Colin King (colin.king@canonical.com):

> From: Colin Ian King <colin.king@canonical.com>

> An unregister_netdev call checks if pnetdev is null, hence a later
> call to free_netdev can potentially be passing a null pointer, causing
> a null pointer dereference. Avoid this by adding a null pointer check
> on pnetdev before calling free_netdev.

> Fixes: 1665c8fdffbb ("staging: rtl8188eu: use netdev routines for private data")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/rtl8188eu/os_dep/usb_intf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

> diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> index 518e9feb3f46..91a3d34a1050 100644
> --- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> @@ -446,7 +446,8 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
>  	pr_debug("+r871xu_dev_remove, hw_init_completed=%d\n",
>  		 if1->hw_init_completed);
>  	rtw_free_drv_sw(if1);
> -	free_netdev(pnetdev);
> +	if (pnetdev)
> +		free_netdev(pnetdev);
>  }

>  static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
> -- 
> 2.30.2

you're right. I removed the NULL check that was part of rtw_free_netdev.
Sorry for the mistake and thanks for your fix.

Reviewed-by: Martin Kaiser <martin@kaiser.cx>

Best regards,
Martin
