Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8A870
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:28:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8914D6115B;
	Sat, 10 Apr 2021 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618064902;
	bh=vk1fqmBpzYPSIfjHRbqJl6UNW9VB0opCtMSgs5Q7qEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlnlAOsbehlgX6YKs0PIZQQBoYZGJkv69VvcLxO1MLn1zwHouCpPecJVeKtMSHoEB
	 +HiVDvC0OIRDit54UsxNzIwqG2mezTwZkYH73EoHL3fB2znbp2GyIAlPtizicg9Lvt
	 meTi+NqAicp7sPjiMQRtaRzzuKy21PeBY1G4LjHE=
Date: Sat, 10 Apr 2021 16:28:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary goto jumps
Message-ID: <YHG2A4rJdl1uiZjV@kroah.com>
References: <20210410141945.424238-1-hello@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210410141945.424238-1-hello@bryanbrattlof.com>

On Sat, Apr 10, 2021 at 02:20:19PM +0000, Bryan Brattlof wrote:
> The next instruction for both 'goto exit' jump statements is to
> execute the exit jump instructions regardless. We can safely
> remove all jump statements from __init rtw_drv_entry()
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
> Changes from:
>   v1: removed unnecessary edit of DBG_871X_LEVEL
> 
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 9fd926e1698f..39b6d4b6dec4 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -517,12 +517,8 @@ static int __init rtw_drv_entry(void)
>  	if (ret != 0) {
>  		sdio_drvpriv.drv_registered = false;
>  		rtw_ndev_notifier_unregister();
> -		goto exit;
>  	}
>  
> -	goto exit;
> -
> -exit:
>  	DBG_871X_LEVEL(_drv_always_, "module init ret =%d\n", ret);
>  	return ret;
>  }
> @@ -540,6 +536,5 @@ static void __exit rtw_drv_halt(void)
>  	DBG_871X_LEVEL(_drv_always_, "module exit success\n");
>  }
>  
> -
>  module_init(rtw_drv_entry);
>  module_exit(rtw_drv_halt);

Any reason you removed this extra line?

thanks,

greg k-h
