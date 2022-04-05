Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B52F3A
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 14:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212A4C385A0;
	Tue,  5 Apr 2022 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649168059;
	bh=iZiKzlaCdiL7IWBslwNKbqVzttLxVImUfOeQx9NnVUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nWdxN7YrHrzMCDGsHyy5S7maXW02cB88esApZehmKD+BXdSwk65Vf4qZgFfIQ4P2W
	 GQ4f+kRiSv7gW3qCDgVBPXZX5ucvJfKwAEo1y1TavKiF7jqM0h6LEzIu2aI4HJGFaK
	 wHjRjFBgVEHdorkBq7gpQXQFgQGOWabfpzM/3aRU=
Date: Tue, 5 Apr 2022 16:14:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vihas Makwana <makvihas@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: simplify
 rtw_inc_and_chk_continual_urb_error
Message-ID: <YkxOueWoitw83chA@kroah.com>
References: <20220405124239.3372-1-makvihas@gmail.com>
 <20220405124239.3372-4-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405124239.3372-4-makvihas@gmail.com>

On Tue, Apr 05, 2022 at 06:12:40PM +0530, Vihas Makwana wrote:
> The if check and variable "value" is redundant. Drop it and simplify
> the funciton.
> 
> Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> ---
>  drivers/staging/r8188eu/include/usb_ops.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
> index ddc46cb44..c5982704c 100644
> --- a/drivers/staging/r8188eu/include/usb_ops.h
> +++ b/drivers/staging/r8188eu/include/usb_ops.h
> @@ -27,12 +27,7 @@
>   */
>  static inline bool rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
>  {
> -	int value = atomic_inc_return(&dvobj->continual_urb_error);
> -
> -	if (value > MAX_CONTINUAL_URB_ERR)
> -		return true;
> -
> -	return false;
> +	return atomic_inc_return(&dvobj->continual_urb_error) > MAX_CONTINUAL_URB_ERR;
>  }

Let's leave this as-is because it's a mess and should be fixed up
anyway.  No need to count urb errors as atomic values, this is crazy.

thanks,

greg k-h
