Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE07E0
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 05:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE2DC340ED;
	Thu, 31 Mar 2022 05:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648705983;
	bh=s2HSIIYLZG5A2pMvmIYg+golqPeUqyBeheXAbPx8Lno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrPicqV/QuJwTiuXrPPXUEj5G2+r12P3TLCJJrdf+VjebMmP/YRE7jveMtegRdrRo
	 MypheK5CHf++XWd3Fpg/cxk+cX8eeJEFZUSLZk2+P277MLaEkVfZxzSDYr/iiX5ftj
	 57ONkYeSqdenM64MoxZqmxDPKXPjB0N65qfyWhOk=
Date: Thu, 31 Mar 2022 07:53:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] staging: r8188eu: simplify if-else statement
Message-ID: <YkVBvF0trrcUFRUo@kroah.com>
References: <20220329202141.7028-1-straube.linux@gmail.com>
 <20220329202141.7028-7-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329202141.7028-7-straube.linux@gmail.com>

On Tue, Mar 29, 2022 at 10:21:39PM +0200, Michael Straube wrote:
> Simplify a nested if-else statement to a single if-else statement in
> rtw_set_threshold(). This improves readability and allows us to
> remove the local variable threshold.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v2: Better readable simplification.
> 
>  drivers/staging/r8188eu/core/rtw_mlme.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 086d64542082..1d52cfac1999 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -1789,20 +1789,14 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
>  
>  static void rtw_set_threshold(struct adapter *adapter)
>  {
> -	u8 threshold;
>  	struct mlme_priv *mlmepriv = &adapter->mlmepriv;
>  	struct ht_priv *htpriv = &mlmepriv->htpriv;
>  
> -	/*  TH = 1 => means that invalidate usb rx aggregation */
> -	/*  TH = 0 => means that validate usb rx aggregation, use init value. */
> -	if (htpriv->ht_option) {
> -		if (adapter->registrypriv.wifi_spec == 1)
> -			threshold = 1;
> -		else
> -			threshold = USB_RXAGG_PAGE_COUNT;
> -
> -		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, threshold);
> +	if (htpriv->ht_option && adapter->registrypriv.wifi_spec != 1) {
> +		/* validate usb rx aggregation, use init value. */
> +		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, USB_RXAGG_PAGE_COUNT);
>  	} else {
> +		/* invalidate usb rx aggregation */
>  		rtw_write8(adapter, REG_RXDMA_AGG_PG_TH, 1);
>  	}
>  }
> -- 
> 2.35.1

Oh nevermind, you already cleaned it up, sorry for the noise :)

greg k-h
