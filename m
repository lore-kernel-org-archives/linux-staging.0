Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082FFA3C
	for <linux-staging@lists.linux.dev>; Fri,  5 Aug 2022 06:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7779BC433B5;
	Fri,  5 Aug 2022 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659681603;
	bh=S+AJva2MQ5IDZ8U+0eF0MnRXAqZAtMJ7OmZXdEEDWmY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=YJVrP1BL3fLDv7G6mlyWKDLsA0+P829LYGVjKalr3coSQ+qULuwNNNCNlRzGpWJcJ
	 uicYUC8WduJC7dXXsO262HSRIeV8ImsBmjRWg6hOhVZMJ1a7ZtPD5s134FchZwWxs1
	 w5vENgChj6zMuM8wBUBZf1RqgYalVUlviOOvhAgY=
Date: Fri, 5 Aug 2022 08:40:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Grzegorz Szymaszek <gszymaszek@short.pl>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] staging: r8188eu: make use of the DRV_NAME macro
Message-ID: <Yuy7QSh/clQ5Ki09@kroah.com>
References: <6c83e05e5dbccff5630ccfed9e40bf84c889b647.1659565180.git.gszymaszek@short.pl>
 <c1f348be8de5c767e72171590c6e405f6fb2bb59.1659565180.git.gszymaszek@short.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f348be8de5c767e72171590c6e405f6fb2bb59.1659565180.git.gszymaszek@short.pl>

On Thu, Aug 04, 2022 at 12:29:01AM +0200, Grzegorz Szymaszek wrote:
> The DRV_NAME macro is defined with the name of the r8188eu driver, but
> it seems it wasn't actually used anywhere. Replace a hardcoded constant
> string of the same value in the driver's struct rtw_usb_drv, field
> .usbdrv.name. The affected file already includes include/drv_types.h,
> where the macro is declared.
> 
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 68869c5daeff..256b9045488e 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -54,7 +54,7 @@ struct rtw_usb_drv {
>  };
>  
>  static struct rtw_usb_drv rtl8188e_usb_drv = {
> -	.usbdrv.name = "r8188eu",
> +	.usbdrv.name = DRV_NAME,

Should just be KBUILD_MODNAME.

thanks,

greg k-h
