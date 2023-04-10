Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8803220
	for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 18:33:19 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-947a47eb908so119875766b.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 11:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681151597; x=1683743597;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZFeRkYCJo0iqZMbAfv9fGEdJHowxuiq/Bt59UpUq00=;
        b=aksNfi5N9Kf91Kl8ogtFznlyfV3va1w5ZOLKLBbauYqBFbdhhmmKV/laqb6qDxYPFB
         hscr2iYR8SB5qeEND00rgMKv0wN3T99zMs88JFqXZW5al3R/lbbYWogReL2yAI2SaEfD
         pQGa2iHI2mnd9Ou7x9CZAQAb5YtQt0s7J6BV6vajdiWT2eR5VC97bXEknz9jyK454beT
         VysqbhCedtavTqsTOB2Ypu1c/wNVaS+AC/57tG0DjO3v2IXJr4xdsR23U0B7X8OtJNEs
         jMXZhYZz2gMORNA674KqbuLOzTknRiFKGPOhOGX6PhtVLdJYTXrUP0xkIlZWNe5O55lt
         vdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681151597; x=1683743597;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZFeRkYCJo0iqZMbAfv9fGEdJHowxuiq/Bt59UpUq00=;
        b=zXjywBVh0BBwnebuKujpgf6MXKwda7ROWS6oJ26MvHuhQfTAXvCHJCt53yxbvBjRvy
         OnCeIRivWxYj9cP4XEPUVq79bqKvNLslu7TVqO/UKTLZEuyQU7SCvvLH1k3PR2nRFfwf
         kM7b8A+H1oOD1FBlBALJ1B8SUTJ3eVfP83mYxEzA+XAz4dsDw+eYjyO3z6Km2o2IO6Ji
         NgTq1zTTBb/mKD6V/0LfVCW8esuBntwG0c3OPRxnG2drbg9NUQf5xK9YScwyLQb5N+rH
         EXPiY0m3wDAseizqcQO024J/hhqGntEhsLEGCpWlmAPhbnIYHaB8OEq5cnUkZNZkjY8/
         ejHg==
X-Gm-Message-State: AAQBX9cFy5ylktSFW+7cJRQMVBqxXBEGnGMKkn+2FDfge+JvjulyNUIu
	pmSNeCgUhOccYjJX8J6fhE0=
X-Google-Smtp-Source: AKy350ZIPvZ2Cxzd+SprtIXznT+1BROVxLGVn36lSz/30/vVZ3YhYknh/2HLdQS9sKPdeZrX0k7N9w==
X-Received: by 2002:a17:906:19c:b0:947:bff2:1c2d with SMTP id 28-20020a170906019c00b00947bff21c2dmr7347711ejb.3.1681151597207;
        Mon, 10 Apr 2023 11:33:17 -0700 (PDT)
Received: from [192.168.0.102] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id v21-20020a170906859500b0094a7c882638sm1522518ejx.90.2023.04.10.11.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 11:33:14 -0700 (PDT)
Message-ID: <0c8fcf29-7264-690e-2d7b-8de174f2e0e4@gmail.com>
Date: Mon, 10 Apr 2023 20:33:12 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH] staging: rtl8192e: Remove functions _rtl92e_wx_get_sens
 and _rtl92e_wx_set_sens
To: Yogesh Hegde <yogi.kernel@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZDPNo9HI1vrdyD64@Zephyrus-G14>
Content-Language: en-US
In-Reply-To: <ZDPNo9HI1vrdyD64@Zephyrus-G14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/23 10:49, Yogesh Hegde wrote:
> Both of these functions depend on the function rf_set_sens, which is declared
> but never defined. Hence calling this function will cause an oops.
> Because there is no definition of the function priv->rf_set_sens will always be NULL.
> 
> As a result _rtl92e_wx_set_sens and _rtl92e_wx_get_sens will always return -1.
> 
> Hence,
> * Removed function definition rf_set_sens
> * Removed usage of variable priv->rf_set_sens
> * Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
> * Cleaned up the variables sens and max_sens used in these functions
> 
> This bug was pointed out by Philipp Hortmann[1].
> 
> [1]: https://lore.kernel.org/linux-staging/004210bd-0ed1-58d5-0315-47499c850444@gmail.com/
> 
> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 --
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 45 --------------------
>   2 files changed, 48 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> index 2b2d8af4cf6e..a949a3833cca 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> @@ -234,7 +234,6 @@ struct r8192_priv {
>   	struct rt_stats stats;
>   	struct iw_statistics			wstats;
>   
> -	short (*rf_set_sens)(struct net_device *dev, short sens);
>   	u8 (*rf_set_chan)(struct net_device *dev, u8 ch);
>   
>   	struct rx_desc *rx_ring[MAX_RX_QUEUE];
> @@ -274,8 +273,6 @@ struct r8192_priv {
>   	short	promisc;
>   
>   	short	chan;
> -	short	sens;
> -	short	max_sens;
>   	bool ps_force;
>   
>   	u32 irq_mask[2];
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index cb28288a618b..0bb657fda06c 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -311,10 +311,6 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
>   	/* ~130 Mb/s real (802.11n) */
>   	range->throughput = 130 * 1000 * 1000;
>   
> -	if (priv->rf_set_sens != NULL)
> -		/* signal level threshold range */
> -		range->sensitivity = priv->max_sens;
> -
>   	range->max_qual.qual = 100;
>   	range->max_qual.level = 0;
>   	range->max_qual.noise = 0;
> @@ -807,45 +803,6 @@ static int _rtl92e_wx_get_retry(struct net_device *dev,
>   	return 0;
>   }
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
>   static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
>   				     struct iw_request_info *info,
>   				     union iwreq_data *wrqu, char *extra)
> @@ -1066,8 +1023,6 @@ static iw_handler r8192_wx_handlers[] = {
>   	[IW_IOCTL(SIOCGIWFREQ)] = _rtl92e_wx_get_freq,
>   	[IW_IOCTL(SIOCSIWMODE)] = _rtl92e_wx_set_mode,
>   	[IW_IOCTL(SIOCGIWMODE)] = _rtl92e_wx_get_mode,
> -	[IW_IOCTL(SIOCSIWSENS)] = _rtl92e_wx_set_sens,
> -	[IW_IOCTL(SIOCGIWSENS)] = _rtl92e_wx_get_sens,
>   	[IW_IOCTL(SIOCGIWRANGE)] = _rtl92e_wx_get_range,
>   	[IW_IOCTL(SIOCSIWAP)] = _rtl92e_wx_set_wap,
>   	[IW_IOCTL(SIOCGIWAP)] = _rtl92e_wx_get_wap,


You need to watch the messages from checkpatch. Two lines are too long 
from your description. Over 75 chars....

I think that the maintainer wants that this patch is a v2 even when 
almost everything of this patch has changed. So if you resend, name the 
patch v3 with revision change history.

Instead of the pointed out by you need to choose from:
13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html
Please look for the place as this is critical. Or omit this line...
As I will test this patch and get therefore credit... hopefully...

applied, compiled and tested... all OK.

Thanks for your support,

Bye Philipp





