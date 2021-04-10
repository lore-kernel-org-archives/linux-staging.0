Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392FE70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 13:36:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CDB561028;
	Sat, 10 Apr 2021 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618061789;
	bh=zE7oyEro2yopPuqtrMWUastuB5GsnGSa2kFwaliFI+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZd+dbEc2KjV7az/jFra6hv3ug19y69DHBRGAPNR9UyQl/dyjwxpj/iI5pjptgALN
	 XFdnJsIigrHm3zBy/aG9kzTH03yWB6M76S5pfMT0RZiCIzLBIeNkV8GyeU+fEExl90
	 17ohOMVlJDImnxysLOo9OKU5hOoSWJYqzdPzsmto=
Date: Sat, 10 Apr 2021 15:36:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary goto jumps
Message-ID: <YHGp2yd1b9E1JTFI@kroah.com>
References: <20210410133212.422929-1-hello@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410133212.422929-1-hello@bryanbrattlof.com>

On Sat, Apr 10, 2021 at 01:33:09PM +0000, Bryan Brattlof wrote:
> The next instruction for both 'goto exit' jump statements is to
> execute the exit jump instructions regardless. We can safely
> remove all jump statements from __init rtw_drv_entry()
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 9fd926e1698f..84ac81d19746 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -517,13 +517,9 @@ static int __init rtw_drv_entry(void)
>  	if (ret != 0) {
>  		sdio_drvpriv.drv_registered = false;
>  		rtw_ndev_notifier_unregister();
> -		goto exit;
>  	}
>  
> -	goto exit;
> -
> -exit:
> -	DBG_871X_LEVEL(_drv_always_, "module init ret =%d\n", ret);
> +	DBG_870X_LEVEL(_drv_always_, "module init ret =%d\n", ret);

Why did you change this line?

thanks,

greg k-h
