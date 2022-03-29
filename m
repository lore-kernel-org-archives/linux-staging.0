Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B62572
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 16:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92C1C340ED;
	Tue, 29 Mar 2022 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648569907;
	bh=xXdEJIbH9Ts8g7LPtQKk1FDb5fMmACcejHkKXetfK7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xBPLN2Hzb/yjdxQXqd+bxnV1vaYx971cl0k6JTbpSOuyPZ1Lk3WPI8jubglw6PBqm
	 tdouWo8QUFZkdg5gsBD+8rzuarL82GBqZVHA5l01pFZmy53O7W0v7yMtNPA4wY9sHX
	 hBCHmFcvqNq4pLqqLgd7fAVUvpuXp7zFRzD5pFK4=
Date: Tue, 29 Mar 2022 18:05:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] staging: r8188eu: remove HW_VAR_BCN_VALID from
 SetHwReg8188EU()
Message-ID: <YkMuMC1I4Cj6aIah@kroah.com>
References: <20220328113940.6396-1-straube.linux@gmail.com>
 <20220328113940.6396-10-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328113940.6396-10-straube.linux@gmail.com>

On Mon, Mar 28, 2022 at 01:39:40PM +0200, Michael Straube wrote:
> The HW_VAR_BCN_VALID case in SetHwReg8188EU() just calls rtw_write8().
> Remove HW_VAR_BCN_VALID from SetHwReg8188EU() and call rtw_write8()
> directly. This is part of the ongoing effort to getrid of the unwanted
> hal layer.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c |  5 ++++-
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c  | 12 ++++++++----
>  drivers/staging/r8188eu/hal/usb_halinit.c   |  4 ----
>  3 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index b5c2e7d4cb48..313e1a3beecb 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -5765,7 +5765,10 @@ unsigned int send_beacon(struct adapter *padapter)
>  
>  	u32 start = jiffies;
>  
> -	SetHwReg8188EU(padapter, HW_VAR_BCN_VALID, NULL);
> +	/* Clear beacon valid check bit. */
> +	/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
> +	rtw_write8(padapter, REG_TDECTRL + 2, rtw_read8(padapter, REG_TDECTRL + 2) | BIT(0));

You commented this twice, it should be a single function :)

thanks,

greg k-h
