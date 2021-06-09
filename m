Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344672F80
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 10:02:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B7F260FDC;
	Wed,  9 Jun 2021 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623232957;
	bh=XAHxdHE0nrvWzM0uAp4XJBMA5oTRF4rAfRRW3r73HdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrEoOA5OKaJshh+BT/pNTLo9Ep5ZzaGmJYYZ8sl0HCzE7l1MgJH+x0b09M8P3BzZ4
	 yVeNROz3PjthRzMY6OFg7GA9HAskR0O4ycY5JN8DusVdyb6+Ja2PH4uhrD2KXq+trw
	 9T7K6f4402bH1McDlwYnubjA/VuLv1kjI5V7Lllk=
Date: Wed, 9 Jun 2021 12:02:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	kaixuxia@tencent.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: replace two ODM_RT_TRACE calls in
 hal/phy.c
Message-ID: <YMCRu+n23higbEcp@kroah.com>
References: <20210608235609.6726-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608235609.6726-1-phil@philpotter.co.uk>

On Wed, Jun 09, 2021 at 12:56:09AM +0100, Phillip Potter wrote:
> Within rtl88eu_dm_txpower_track_adjust function, retrieve the struct
> net_device pointer, and replace both calls to the ODM_RT_TRACE macro
> with equivalent netdev_dbg calls, as well as modifying layout, wording
> and spacing slightly. The purpose of this, and patches like it, is to
> eventually remove the need for include/odm_debug.h, which is an overly
> complex way of printing debug/tracing information about the driver.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/rtl8188eu/hal/phy.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/hal/phy.c b/drivers/staging/rtl8188eu/hal/phy.c
> index a664bff370bb..a8caf618f588 100644
> --- a/drivers/staging/rtl8188eu/hal/phy.c
> +++ b/drivers/staging/rtl8188eu/hal/phy.c
> @@ -301,11 +301,12 @@ void rtl88eu_dm_txpower_track_adjust(struct odm_dm_struct *dm_odm, u8 type,
>  				     u8 *direction, u32 *out_write_val)
>  {
>  	u8 pwr_value = 0;
> +	struct net_device *pnetdev = dm_odm->Adapter->pnetdev;
> +
>  	/*  Tx power tracking BB swing table. */
>  	if (type == 0) { /* For OFDM adjust */
> -		ODM_RT_TRACE(dm_odm, ODM_COMP_TX_PWR_TRACK, ODM_DBG_LOUD,
> -			     ("BbSwingIdxOfdm = %d BbSwingFlagOfdm=%d\n",
> -			     dm_odm->BbSwingIdxOfdm, dm_odm->BbSwingFlagOfdm));
> +		netdev_dbg(pnetdev, "%s(): BbSwingIdxOfdm = %d BbSwingFlagOfdm = %d\n",
> +			   __func__, dm_odm->BbSwingIdxOfdm, dm_odm->BbSwingFlagOfdm);

Along with what Dan said, please note that the dev_dbg() and
netdev_dbg() calls allow the user to see the function where the message
came from automatically, so there's never a need to add a __func__
string in the output.

thanks,

greg k-h
