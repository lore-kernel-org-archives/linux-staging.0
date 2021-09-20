Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472B3FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:49:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 671DA6108C;
	Mon, 20 Sep 2021 11:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632138562;
	bh=BjroITAddm7I+ffIPTRs/UzUiie3IMgyS+DyuPVzNyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIEcny45rYiZOxoXmZ2hSdyTXf10UHv+a8FsaHKU82XN23/wvuIGsjsuicARjmW2T
	 zmIzNDEJAnNAVjsImFEL+aWhNfMsddj7JRHCpXnNxLYDdcfJtqTHzLDXix0On4CD+H
	 BkxhZ4dC7N7ihBJjiNeibT8zt9Uf7063B3zX7pKY=
Date: Mon, 20 Sep 2021 13:49:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 08/19] staging: r8188eu: fix grammar mistake in
 usbctrl_vendorreq()
Message-ID: <YUh1P+AojRvILcP2@kroah.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
 <20210919235356.4151-9-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919235356.4151-9-fmdefrancesco@gmail.com>

On Mon, Sep 20, 2021 at 01:53:45AM +0200, Fabio M. De Francesco wrote:
> Fix a grammar mistake in usbctrl_vendorreq(): "checksumed" =>
> "checksummed".
> 
> Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index fc3da0fbf474..3ca2959f4bcd 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -85,7 +85,7 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
>  
>  		}
>  
> -		/*  firmware download is checksumed, don't retry */
> +		/*  firmware download is checksummed, don't retry */

When touching this line, also remove the leading ' ' characters in the
comment that are not needed please.

thanks,

greg k-h
