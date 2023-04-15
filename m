Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF005323D
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 16:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F8AC433D2;
	Sat, 15 Apr 2023 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681574449;
	bh=D0HSWh6Smg0oJJDtN9Pl6WiCLYsAMPO6Nt5cBy3sWUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sL/SSxEuoPCBxDhTtPJmESESa0ACu2su7njnLsY/7lyO6AbsaeqKOETHkD3HqZuUR
	 2n9pps8Ia3GIxyHCO/YYr5HELRURzrMZ/86Dm/FjnnTM6oMABIRzntk3DzVJ9tIXkU
	 5E6oNb35Up/3nVl59e5Vr7KZf0VH7D31tU2twFPg=
Date: Sat, 15 Apr 2023 18:00:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH v3] staging: rtl8192e: Fix comparison to NULL of variable
 rf_set_sens
Message-ID: <2023041537-probing-carpenter-cb71@gregkh>
References: <ZDbvoULAO6wdeso1@Zephyrus-G14>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDbvoULAO6wdeso1@Zephyrus-G14>

On Wed, Apr 12, 2023 at 11:21:29PM +0530, Yogesh Hegde wrote:
> Functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens depend on the
> function rf_set_sens, which is declared but never defined.
> Hence calling this function will cause an oops.

So can an oops happen?  I'm confused.


> Because there is no definition of the function priv->rf_set_sens
> will always be NULL.

Ok, but is it used?  I'm confused.

> 
> As a result _rtl92e_wx_set_sens and _rtl92e_wx_get_sens will always
> return -1.

So it does work?  Or it doesn't?  What about the oops?

> 
> Hence,
> * Removed function definition rf_set_sens
> * Removed usage of variable priv->rf_set_sens
> * Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
> * Cleaned up the variables sens and max_sens used in these functions

"Hence" is an odd way to write this.

And when you list things in a changelog, that usually means you want to
have multiple patches, right?

> Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> 
> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>

No blank line between these please.

> ---
> Changed in v3:
> - Fixed description to fit within 75 chars
> - Added suggested tags
> 
> as Suggested by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> 
> Changed in v2:
> - Removed function definition rf_set_sens
> - Removed usage of variable priv->rf_set_sens
> - Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
> - Cleaned up the variables sens and max_sens used in these functions
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 --
>  drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 45 --------------------
>  2 files changed, 48 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> index 2b2d8af4cf6e..a949a3833cca 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> @@ -234,7 +234,6 @@ struct r8192_priv {
>  	struct rt_stats stats;
>  	struct iw_statistics			wstats;
>  
> -	short (*rf_set_sens)(struct net_device *dev, short sens);
>  	u8 (*rf_set_chan)(struct net_device *dev, u8 ch);
>  
>  	struct rx_desc *rx_ring[MAX_RX_QUEUE];
> @@ -274,8 +273,6 @@ struct r8192_priv {
>  	short	promisc;
>  
>  	short	chan;
> -	short	sens;
> -	short	max_sens;
>  	bool ps_force;
>  
>  	u32 irq_mask[2];
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index cb28288a618b..0bb657fda06c 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -311,10 +311,6 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
>  	/* ~130 Mb/s real (802.11n) */
>  	range->throughput = 130 * 1000 * 1000;
>  
> -	if (priv->rf_set_sens != NULL)
> -		/* signal level threshold range */
> -		range->sensitivity = priv->max_sens;
> -
>  	range->max_qual.qual = 100;
>  	range->max_qual.level = 0;
>  	range->max_qual.noise = 0;
> @@ -807,45 +803,6 @@ static int _rtl92e_wx_get_retry(struct net_device *dev,
>  	return 0;
>  }
>  
> -static int _rtl92e_wx_get_sens(struct net_device *dev,
> -			       struct iw_request_info *info,
> -			       union iwreq_data *wrqu, char *extra)
> -{
> -	struct r8192_priv *priv = rtllib_priv(dev);
> -
> -	if (priv->rf_set_sens == NULL)
> -		return -1; /* we have not this support for this radio */
> -	wrqu->sens.value = priv->sens;
> -	return 0;
> -}
> -
> -static int _rtl92e_wx_set_sens(struct net_device *dev,
> -			       struct iw_request_info *info,
> -			       union iwreq_data *wrqu, char *extra)
> -{
> -	struct r8192_priv *priv = rtllib_priv(dev);
> -
> -	short err = 0;
> -
> -	if (priv->hw_radio_off)
> -		return 0;
> -
> -	mutex_lock(&priv->wx_mutex);
> -	if (priv->rf_set_sens == NULL) {
> -		err = -1; /* we have not this support for this radio */
> -		goto exit;
> -	}
> -	if (priv->rf_set_sens(dev, wrqu->sens.value) == 0)
> -		priv->sens = wrqu->sens.value;
> -	else
> -		err = -EINVAL;
> -
> -exit:
> -	mutex_unlock(&priv->wx_mutex);
> -
> -	return err;
> -}
> -
>  static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
>  				     struct iw_request_info *info,
>  				     union iwreq_data *wrqu, char *extra)
> @@ -1066,8 +1023,6 @@ static iw_handler r8192_wx_handlers[] = {
>  	[IW_IOCTL(SIOCGIWFREQ)] = _rtl92e_wx_get_freq,
>  	[IW_IOCTL(SIOCSIWMODE)] = _rtl92e_wx_set_mode,
>  	[IW_IOCTL(SIOCGIWMODE)] = _rtl92e_wx_get_mode,
> -	[IW_IOCTL(SIOCSIWSENS)] = _rtl92e_wx_set_sens,
> -	[IW_IOCTL(SIOCGIWSENS)] = _rtl92e_wx_get_sens,

You are removing 2 ioctls, so at the minimum, this should be 2 different
patches.  Please make a patch series here and read up on how to write a
bit better of a changelog text to make it more obvious what is happening
here.

thanks,

greg k-h
