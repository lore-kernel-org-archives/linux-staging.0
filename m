Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6494A29D6
	for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 16:51:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D3AE6052B;
	Thu, 22 Jul 2021 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626972715;
	bh=JHxY2G9vBdeDxHTAdoaoPweCFGidPsKxUDCIIhoKzu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ja0lbdba8Wq7UI1Zo689PACLPuLBf6mhfbS5jERyQ0vQqryfZ3PQDefBcF657yNRg
	 azqQmrlhXY4eXVIvme/MUdEeGunc6LRUo7Zk6d8/lXm+wH53BsJdnqCAjl93HSRSmy
	 HgKkm991WRK2BcDKaW4Zb3DclysEMStrlSQ6Hu7c=
Date: Thu, 22 Jul 2021 18:46:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jignesh Patel <jigs0101@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Paul McQuade <paulmcquad@gmail.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: Line over 100 characters
Message-ID: <YPmhA3JbzlwE66NL@kroah.com>
References: <20210722164144.377781-1-jigs0101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722164144.377781-1-jigs0101@gmail.com>

On Thu, Jul 22, 2021 at 10:11:37PM +0530, Jignesh Patel wrote:
> Break various lines into multiple lines to respect 100 character width limit.
> Reported by checkpatch.pl
> 
> Signed-off-by: Jignesh Patel <jigs0101@gmail.com>
> ---
>  drivers/staging/rtl8188eu/core/rtw_ap.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
> index b817aa8b9de4..b83d6da01b7c 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ap.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
> @@ -254,9 +254,12 @@ void expire_timeout_chk(struct adapter *padapter)
>  			updated = ap_free_sta(padapter, psta, true,
>  					      WLAN_REASON_DEAUTH_LEAVING);
>  		} else {
> -			/* TODO: Aging mechanism to digest frames in sleep_q to avoid running out of xmitframe */
> +			/** TODO: Aging mechanism to digest frames in

Does this line look correct now?

Please look at how comments are formatted...

thanks,

greg k-h
