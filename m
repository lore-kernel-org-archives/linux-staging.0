Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC217C9
	for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 20:47:52 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id r18so10275239eja.11
        for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Sw5E53C6igqAt3mt5TIJ/j/yrMq9p4UY3mp16dAS2Hk=;
        b=VQysygBvIppUjUv4Fx+3avBOpER/pfo2eoVpm2QGQPuvycr08rwshcEjyac2WOQCNF
         7HrfT9Z8u1BrmZHgX3OoDGqjAG7ua/mIvy/vwnXUTzEX2KjztRYjCCeJMIFjVbeE5ENB
         R32iM6Gi/m4/2WXQJIgjR4FzyT7m4FaU+vxcOHmggTkrmHv7k95Jao60+0RrP2PV5wXB
         vvoNvjygh9xor/ILUTc+96+VaPOj+x/HXH6DA/wXlpE0MhFQF9If2OIGJRtC7CPRcLZW
         BgY4cKAREF5fv6g4NFlsos/U6Phi899K8AZk5OFymGcbXUAfSKAcEqTRROzIR+Siezoa
         vnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Sw5E53C6igqAt3mt5TIJ/j/yrMq9p4UY3mp16dAS2Hk=;
        b=qQQG6y2UPorDwju8niD8ZtwEulqnwOf/2hHUrCsYWj8pZwh7CFRPsmM4CtGcvfAHq4
         6OvcPg1HdbEQnYFq102mN13Ipr19kLe1XmPYk0CrdbtYPEpWrX4lu3sltcnKpdJaWHbs
         tbMteChOURLU/OuVDzMK0RrKBbyNfQQLaTEscrLOLN5RAM09/tfIdvwov2I4v9208PiC
         Z5lgMmP6OvC4bz+12kT7Tt9q7heeRFWy+7/xqZtciVxgADLr4NfzQiLgZXMOWPiPxR33
         X8OPmVE3l1eiv1yRJBqrtyCt/cB1e16QDt2mWgrmqJfilSqVZ2kjsdMrU4w8D7YVRn7o
         FnLw==
X-Gm-Message-State: ACrzQf3SEzaW+w42JWCp71OtuXVf0stVqSmrc+Tfa2xTB5fUH1y+6IiM
	D/2V6wkFXwOTv8e8mhRhsI8=
X-Google-Smtp-Source: AMsMyM5T5gFoNZB2cvS+/fmdTYfKMlB5vA+pLYEuuFkG2as/dsIpLGPrZsopklYQaWpS3yi6Sa4q7Q==
X-Received: by 2002:a17:907:75dc:b0:783:9c71:5e20 with SMTP id jl28-20020a17090775dc00b007839c715e20mr854400ejc.125.1664138871186;
        Sun, 25 Sep 2022 13:47:51 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id l19-20020a056402345300b00451319a43dasm2967532edc.2.2022.09.25.13.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 13:47:50 -0700 (PDT)
Message-ID: <81627250-cefe-1259-ff9d-c16d86009487@gmail.com>
Date: Sun, 25 Sep 2022 22:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: cleanup if statements
Content-Language: en-US
To: Valentin Vidic <vvidic@valentin-vidic.from.hr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220925125028.2495822-1-vvidic@valentin-vidic.from.hr>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220925125028.2495822-1-vvidic@valentin-vidic.from.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/22 14:50, Valentin Vidic wrote:
> Fix checkpatch warnings for if statements in rtl_wx.c
I would like to have a more precise description.
> 
> Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index bfb963768fc3..2db98d4ddb1b 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -313,7 +313,7 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
>   	/* ~130 Mb/s real (802.11n) */
>   	range->throughput = 130 * 1000 * 1000;
>   
> -	if (priv->rf_set_sens != NULL)
> +	if (priv->rf_set_sens)
OK
>   		/* signal level threshold range */
>   		range->sensitivity = priv->max_sens;
>   
> @@ -395,7 +395,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
>   	rt_state = priv->rtllib->eRFPowerState;
>   	if (!priv->up)
>   		return -ENETDOWN;
> -	if (priv->rtllib->LinkDetectInfo.bBusyTraffic == true)
> +	if (priv->rtllib->LinkDetectInfo.bBusyTraffic)
OK
>   		return -EAGAIN;
>   
>   	if (wrqu->data.flags & IW_SCAN_THIS_ESSID) {
> @@ -582,9 +582,9 @@ static int _rtl92e_wx_set_frag(struct net_device *dev,
>   	if (priv->hw_radio_off)
>   		return 0;
>   
> -	if (wrqu->frag.disabled)
> +	if (wrqu->frag.disabled) {
It is questionable if this is really required.
>   		priv->rtllib->fts = DEFAULT_FRAG_THRESHOLD;
> -	else {
> +	} else {
>   		if (wrqu->frag.value < MIN_FRAG_THRESHOLD ||
>   		    wrqu->frag.value > MAX_FRAG_THRESHOLD)
>   			return -EINVAL;
> @@ -821,7 +821,7 @@ static int _rtl92e_wx_get_sens(struct net_device *dev,
>   {
>   	struct r8192_priv *priv = rtllib_priv(dev);
>   
> -	if (priv->rf_set_sens == NULL)
> +	if (!priv->rf_set_sens)
OK
>   		return -1; /* we have not this support for this radio */
>   	wrqu->sens.value = priv->sens;
>   	return 0;
> @@ -839,7 +839,7 @@ static int _rtl92e_wx_set_sens(struct net_device *dev,
>   		return 0;
>   
>   	mutex_lock(&priv->wx_mutex);
> -	if (priv->rf_set_sens == NULL) {
> +	if (!priv->rf_set_sens) {
OK
>   		err = -1; /* we have not this support for this radio */
>   		goto exit;
>   	}
> @@ -882,7 +882,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
>   		u8 idx = 0, alg = 0, group = 0;
>   
>   		if ((encoding->flags & IW_ENCODE_DISABLED) ||
> -		     ext->alg == IW_ENCODE_ALG_NONE) {
> +		    ext->alg == IW_ENCODE_ALG_NONE) {
This is about indentation and does not really have something to do with if.
>   			ieee->pairwise_key_type = ieee->group_key_type
>   						= KEY_TYPE_NA;
>   			rtl92e_cam_reset(dev);
> @@ -919,7 +919,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
>   					 key, 0);
>   		} else {
>   			if ((ieee->pairwise_key_type == KEY_TYPE_CCMP) &&
> -			     ieee->pHTInfo->bCurrentHTSupport)
> +			    ieee->pHTInfo->bCurrentHTSupport)
This is about indentation and does not really have something to do with if.
>   				rtl92e_writeb(dev, 0x173, 1);
>   			rtl92e_set_key(dev, 4, idx, alg,
>   				       (u8 *)ieee->ap_mac_addr, 0, key);
> @@ -993,7 +993,7 @@ static int _rtl92e_wx_get_gen_ie(struct net_device *dev,
>   	struct r8192_priv *priv = rtllib_priv(dev);
>   	struct rtllib_device *ieee = priv->rtllib;
>   
> -	if (ieee->wpa_ie_len == 0 || ieee->wpa_ie == NULL) {
> +	if (ieee->wpa_ie_len == 0 || !ieee->wpa_ie) {
OK
>   		data->data.length = 0;
>   		return 0;
>   	}

A simple connection test works. But it does not cover all paths that are 
possible under the ifs.

This patch cannot be applied on top of my 10 series patch send earlier. 
Sorry for that.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>






