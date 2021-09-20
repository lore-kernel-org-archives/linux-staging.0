Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693833FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:48:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B5FD6108C;
	Mon, 20 Sep 2021 11:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632138534;
	bh=OKUMEPr+LdUl+LywNfZOIjZmodlkdEiNYc1QEoqjxJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSbRLGT+SrQhLS5nptVWn1D8yJzYNRwqtCbmIa621N3eW/+UBtRmXXEHgNA3rNCYt
	 vRa8YK2IjYxi6GCrlwSReXBqRI+ZJhIRSKcayQ3b1OK63VZhd7024KWFvBdGH4LjZD
	 2XzkPqaM4jUiT/yc9JblXLOL1I4CVXqQwnaWwank=
Date: Mon, 20 Sep 2021 13:48:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 07/19] staging: r8188eu: remove unnecessary comment in
 usbctrl_vendorreq()
Message-ID: <YUh1I694ZxDvOh5f@kroah.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
 <20210919235356.4151-8-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919235356.4151-8-fmdefrancesco@gmail.com>

On Mon, Sep 20, 2021 at 01:53:44AM +0200, Fabio M. De Francesco wrote:
> Remove an unnecessary comment in usbctrl_vendorreq().
> 
> Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index a52aeb2558ad..fc3da0fbf474 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -73,7 +73,6 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
>  				/* status != len && status >= 0 */
>  				if (status > 0) {
>  					if (requesttype == REALTEK_USB_VENQT_READ) {
> -						/*  For Control read transfer, we have to copy the read data from io_buf to data. */
>  						memcpy(data, io_buf,  len);
>  					}

And now you have a coding style issue :(

Don't try to fix up one and add another one please.

thanks,

greg k-h
