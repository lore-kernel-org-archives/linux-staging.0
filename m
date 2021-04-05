Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6D259E
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 10:15:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 480F86128A;
	Mon,  5 Apr 2021 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617617706;
	bh=P8lomj32o8yraY8npLXMx485HIZmeqshrSBgIy6QGmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ze4plzDZcyvsSmX37TMYpWoB2DcYw9pOymwTO62bUPK2+hdWX9W5W3DXhyLWeT8iu
	 IgdAFSmLMplv/3Q9ELUbWy07Pvg2fbcKnXjDeVF1HPQGtmO0ueDkHHI08aFsupm4h6
	 ddRh39Q5O7BXalb7gM1IRwBeG45FmXMBSehD2U00=
Date: Mon, 5 Apr 2021 12:15:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: dev.dragon@bk.ru
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8192u: ieee80211: fixed a trailing
 statements of condition.
Message-ID: <YGrjKEjr9GJtJlO5@kroah.com>
References: <20210404132613.5464-1-dev.dragon@bk.ru>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210404132613.5464-1-dev.dragon@bk.ru>

On Sun, Apr 04, 2021 at 04:26:14PM +0300, dev.dragon@bk.ru wrote:
> From: Dmitrii Wolf <dev.dragon@bk.ru>
> 
> Fixed a coding style issue.

Really?

> 
> Signed-off-by: Dmitrii Wolf <dev.dragon@bk.ru>
> ---
>  drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> index 690b664df8fa..29a6ce20e2bd 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> @@ -2048,12 +2048,12 @@ void ieee80211_softmac_xmit(struct ieee80211_txb *txb, struct ieee80211_device *
>  	/* if xmit available, just xmit it immediately, else just insert it to the wait queue */
>  	for (i = 0; i < txb->nr_frags; i++) {
>  #ifdef USB_TX_DRIVER_AGGREGATION_ENABLE
> -		if ((skb_queue_len(&ieee->skb_drv_aggQ[queue_index]) != 0) ||
> +		if ((skb_queue_len(&ieee->skb_drv_aggQ[queue_index]) != 0)
>  #else
> -		if ((skb_queue_len(&ieee->skb_waitQ[queue_index]) != 0) ||
> +		if ((skb_queue_len(&ieee->skb_waitQ[queue_index]) != 0)
>  #endif
> -		    (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) || \
> -		    (ieee->queue_stop)) {
> +		 || (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) \
> +		 || (ieee->queue_stop)) {

This feels really wrong.

The || should be on the end of the line, why is checkpatch complaining
about this?

And that '\' is not needed at all :(

thanks,

greg k-h
