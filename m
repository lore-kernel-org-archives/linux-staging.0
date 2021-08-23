Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135683FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 19:30:59 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mIFej-00066j-9E; Mon, 23 Aug 2021 21:30:49 +0200
Date: Mon, 23 Aug 2021 21:30:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: make rtw_deinit_intf_priv return void
Message-ID: <20210823193049.fhqbbxpnyji63xbn@viti.kaiser.cx>
References: <20210823184059.19742-1-paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823184059.19742-1-paskripkin@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> rtw_deinit_intf_priv() always return success, so there is no need in
> return value

> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index e002070f7fba..37694aa96d13 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -129,13 +129,10 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
>  	return rst;
>  }

> -static u8 rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
> +static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
>  {
> -	u8 rst = _SUCCESS;
> -
>  	kfree(dvobj->usb_alloc_vendor_req_buf);
>  	_rtw_mutex_free(&dvobj->usb_vendor_req_mutex);
> -	return rst;
>  }

>  static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
> -- 
> 2.32.0

Acked-by: Martin Kaiser <martin@kaiser.cx>
