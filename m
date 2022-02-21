Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920C5EBB
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 17:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E2DC340E9;
	Mon, 21 Feb 2022 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645463784;
	bh=hOo8EVPxASwZeK28tfDq8KEHLaCOknGxUF68Yqnl/sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1HX/pX2MsbcEs6iGjOcwfoko6GxCKx9gkE8DhyVnQx7swBLTeHG6rBzf9cYvWhVUq
	 JBXQ19OlMZuHftENRuUMMgbotQk9eSaLETWRXD+mDhfQBqSVNtac6FTVJRaihDu0tX
	 Wwh4SvzmLzNKaQhJShwW+r4lhS2fc8FrKT2AZKwA=
Date: Mon, 21 Feb 2022 18:16:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tong Zhang <ztong0001@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Colin Ian King <colin.i.king@googlemail.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	=?iso-8859-1?Q?Cl=E1udio?= Maia <clrrm@isep.ipp.pt>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: cleanup proc fs entries upon exit
Message-ID: <YhPI5iDRUpzYWDyY@kroah.com>
References: <20220220231554.2510567-1-ztong0001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220220231554.2510567-1-ztong0001@gmail.com>

On Sun, Feb 20, 2022 at 03:15:53PM -0800, Tong Zhang wrote:
> proc fs entries need to be removed when module is removed, otherwise
> when we try to insert the module again, kernel will complain
> 
> [  493.068012] proc_dir_entry 'net/ieee80211' already registered
> [  493.271973]  proc_mkdir+0x18/0x20
> [  493.272136]  ieee80211_debug_init+0x28/0xde8 [r8192u_usb]
> [  493.272404]  rtl8192_usb_module_init+0x10/0x161 [r8192u_usb]
> 
> [   13.910616] proc_dir_entry 'net/rtl819xU' already registered
> [   13.918931]  proc_mkdir+0x18/0x20
> [   13.919098]  rtl8192_usb_module_init+0x142/0x16d [r8192u_usb]
> 
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 364e1ca94f70..683afdc667bc 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -4825,6 +4825,11 @@ static int __init rtl8192_usb_module_init(void)
>  static void __exit rtl8192_usb_module_exit(void)
>  {
>  	usb_deregister(&rtl8192_usb_driver);
> +	remove_proc_entry(RTL819XU_MODULE_NAME, init_net.proc_net);
> +
> +#ifdef CONFIG_IEEE80211_DEBUG
> +	ieee80211_debug_exit();
> +#endif

Please do not put #ifdef in .c files.  They should be in a .h file
instead.

thanks,

greg k-h
