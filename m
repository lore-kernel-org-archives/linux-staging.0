Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C51FA7
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 16:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B5CC433C1;
	Sun,  6 Nov 2022 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667752808;
	bh=LyOp62cjZP3dNAd8XRe1V09GUeAtpY0II7lncWg3Kdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+ThkAotMh+uLMdFtM7keufX4DtxdhyPE6kOOXKXCCSSKKsPLCoqhKAMOZYEDb1eQ
	 SBUkqZT/aeHufSnkSzWgFXlucq07Jxgj24ZEHkz66qsLBMOmQ3nBktL6K9UXqGfug0
	 Ty6mBAVODaViqlwgUcbOvbIJ60lA67iiuBnQc4hs=
Date: Sun, 6 Nov 2022 17:40:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: philipp.g.hortmann@gmail.com, dragan.m.cvetic@gmail.com,
	wjsota@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Rename variables TM_Trigger and
 TxPowerCheckCnt to avoid CamelCase
Message-ID: <Y2fjZbZdoZE86u50@kroah.com>
References: <20221106131811.GA50668@zephyrus>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106131811.GA50668@zephyrus>

On Sun, Nov 06, 2022 at 06:48:11PM +0530, Yogesh Hegde wrote:
> Rename variables
> * TM_trigger to tm_trigger
> * TxPowerCheckCnt to txpower_check_count
> to avoid CamelCase which is not accepted by checkpatch.pl .
> 
> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index 767c746fc73d..0652940eecc5 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -919,32 +919,32 @@ static void _rtl92e_dm_check_tx_power_tracking_tssi(struct net_device *dev)
>  static void _rtl92e_dm_check_tx_power_tracking_thermal(struct net_device *dev)
>  {
>  	struct r8192_priv *priv = rtllib_priv(dev);
> -	static u8	TM_Trigger;
> -	u8		TxPowerCheckCnt = 0;
> +	static u8 tm_trigger;
> +	u8 txpower_check_count = 0;

While this is nice overall, I think you just found a bug in the driver.

Why is this a static variable?  That means this affects all devices that
this driver touches, which seems very wrong, right?

So shouldn't tm_trigger be a per-device attribute?

>  	if (IS_HARDWARE_TYPE_8192SE(dev))
> -		TxPowerCheckCnt = 5;
> +		txpower_check_count = 5;
>  	else
> -		TxPowerCheckCnt = 2;
> +		txpower_check_count = 2;
>  	if (!priv->btxpower_tracking)
>  		return;
>  
> -	if (priv->txpower_count  <= TxPowerCheckCnt) {
> +	if (priv->txpower_count  <= txpower_check_count) {
>  		priv->txpower_count++;
>  		return;
>  	}
>  
> -	if (!TM_Trigger) {
> +	if (!tm_trigger) {
>  		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4d);
>  		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4f);
>  		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4d);
>  		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4f);
> -		TM_Trigger = 1;
> +		tm_trigger = 1;

It also should be a boolean, right?

Can you fix this up to be a per-device attribute instead?

thanks,

greg k-h
