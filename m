Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C92572
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 16:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E6EC340ED;
	Tue, 29 Mar 2022 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648569885;
	bh=5xKMZFh+1ZY7pWIA9ueK0cgs3X2KTgkwio5wE8ZfRpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCWrFhrljuxul1nFf6osKrDmlGjb0hFiXhccWLxQhBfOOR9YRDOhquVcHi2sgW4Vb
	 Pcpa5NptM8kML9zxP7iqFIqkKMGIxHh1DEUeYk6W6qwt8w72KGVQYLBdxk86yIZ92d
	 DEYAe/7ZOTU6muFSYSzuxbs3xSqpBy5IaljRQw/0=
Date: Tue, 29 Mar 2022 18:04:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] staging: r8188eu: remove HW_VAR_TX_RPT_MAX_MACID
 from SetHwReg8188EU()
Message-ID: <YkMuGjrYoiUtUyFf@kroah.com>
References: <20220328113940.6396-1-straube.linux@gmail.com>
 <20220328113940.6396-9-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328113940.6396-9-straube.linux@gmail.com>

On Mon, Mar 28, 2022 at 01:39:39PM +0200, Michael Straube wrote:
> The HW_VAR_TX_RPT_MAX_MACID case in SetHwReg8188EU() just calls
> rtw_write8(). Remove HW_VAR_TX_RPT_MAX_MACID from SetHwReg8188EU() and
> call rtw_write8() directly. This is part of the ongoing effort to get
> rid of the unwanted hal layer.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme.c     | 3 ++-
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ++-
>  drivers/staging/r8188eu/hal/usb_halinit.c   | 6 ------
>  drivers/staging/r8188eu/include/hal_intf.h  | 1 -
>  4 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 1569f719af1b..06c17a16dab9 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -1141,7 +1141,8 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta,
>  		return;
>  
>  	macid = search_max_mac_id(adapter);
> -	SetHwReg8188EU(adapter, HW_VAR_TX_RPT_MAX_MACID, (u8 *)&macid);
> +	rtw_write8(adapter, REG_TX_RPT_CTRL + 1, macid + 1);

This too should be a function to help explain what you are doing.

thanks,

greg k-h
