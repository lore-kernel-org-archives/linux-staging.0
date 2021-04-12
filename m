Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842E72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 06:19:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D30EF6120F;
	Mon, 12 Apr 2021 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618208345;
	bh=OqQ9BxvC/MpIsNTJVxdAX+jVvRznRTSxbFDCudUdUDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbqSdBsjVTaWy67PRDy7meyuH9lidPbPl5fUK90I7EJrtAKVg2fZPoigMgV+/Bhf8
	 FMc/3hhgXs9HxMyE1CGwkr0dBu0HZhvA3jupxrxcPxHxBiRmS8A+oZRrhCWL64rOgL
	 Skv7A8lo/T/QfWBC8+X0uOzzTfmuKhHGaaByFi1A=
Date: Mon, 12 Apr 2021 08:19:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH] staging: rtl8188eu: replaced msleep() by usleep_range()
Message-ID: <YHPmVtAGH7WWGfjJ@kroah.com>
References: <YHPkbTPPra2isn5e@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHPkbTPPra2isn5e@kali>

On Mon, Apr 12, 2021 at 11:40:53AM +0530, Mitali Borkar wrote:
> Fixed the warning:-msleep < 20ms can sleep for up to 20ms by replacing
> msleep(unsigned long msecs) by usleep_range(unsigned long min, unsigned long max)
> in usecs as msleep(1ms~20ms) can sleep for upto 20 ms.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> index 50d3c3631be0..6afbb5bf8118 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> @@ -5396,7 +5396,7 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
>  			return H2C_SUCCESS;
>  
>  		if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
> -			msleep(10);/*  10ms, ATIM(HIQ) Windows */
> +			usleep_range(10000 , 20000);/*  10ms, ATIM(HIQ) Windows */

How do you know you can sleep for 20000 here?

And given that you just changed how the sleep works, are you sure the
functionality is the same now?

Only change this type of warning if you have the hardware and can test
the change properly.

thanks,

greg k-h
