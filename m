Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA832206C
	for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731691; cv=none; b=sFNRNrppAzheZklkI09akWoxWXRvtiQsVYw2hVpjSash7Rc1ZwVNNdZ1EJOWvsf1HL92K9nFeb65nsRuPSxdQ6G3aFqi1nbSXwtvBWp8YwgVwCX3U4x+pYQBFw1UvXrzfLONIB0YXfIzeVunc3M3FcIPViP9ANSdHiwdYVWNchE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731691; c=relaxed/simple;
	bh=LP0SVM4zANcE16ZCf3lnVQEx3fF0+VnawnvnS4QpQYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H610967t9404HaqfYqenGjkXiVh0pfk6QRG9ZmwtAyc2iPpIUBX75KDQOkmLFHMm3sVvj4HKGY322XWQXD6q46GNFbZwJuEOuind2tyyGSK0+jJo1Mnl9kXpcwj+KmEWqXxO0RhZ3DVy40QvoYxLP7l9nQPwv5OO7dMSnKarrg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OluN7npB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OluN7npB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5159e6d31a3so694078e87.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 10:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711731688; x=1712336488; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgKPKTTDQgEgY8lj4hlaReR5NBDNtvQ5L48mb+0x4WA=;
        b=OluN7npBCcBMp9tespsOxxancL5QENjuBssJnW5fEKYC9mhuDYN6voKBSz5L9UNk7+
         ogm1GNMgeGL9A8uNckrij9uTYmfETBmgIoqoFcHGD47Ru13MbrLZ6r2K71fF6C7Wu04P
         5QB1u7Z+T3mWhojZoqzFmscKHoiKfwJr+BS5e4ErCU2CkDKh11jB2PaT9Zq7+r0yIt+s
         BkuMskGDLfqov2L+D0VLzHrlSdH9Hm+ZHWXKqvFa8xImZveqF5O80ghIMqBvD80kZoAQ
         /TDBPtbNMv+7tVyJ8B0e3tTGuwMVY0RZpVPU78+1yB1UgmhNULdNRnFcdHTyB6/rsnfI
         WdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711731688; x=1712336488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgKPKTTDQgEgY8lj4hlaReR5NBDNtvQ5L48mb+0x4WA=;
        b=DOByTRtrTz/pmH+1HsM9OlGUC5MbLxq+tUR66v+TubJ6J5SiKuyY9+D6myEf+brMDq
         RCZ/g7tdFZ7UKLeLl1Mz9T5Cn+iGvbwf5K6kB8lPxq4oDEWYauPXFuv+JhQzRCNFOD95
         GgcmwGQ45+vdH81mrL6Tplet7VZfVe41L2t2H3SB0vfzf4Gr+754EYhOEB9fVRkxVZTt
         bKwAhgl9sVOwzTBtG+MYiqxVNbBM7n1lYvG+fg2YALf2QD0rk/tK135MGpLOU6cjJXaI
         dcAF0zjEoEP+1DBKPBBef7Ttc0eYBj6Hde6lVY3obC/Wlqiq1OHfxTteCa0jhDQ4DwiQ
         e/iQ==
X-Gm-Message-State: AOJu0YxWlQ3YKCCEWPYwuvgDvAfl1yeysSjjDiJan1XzEebftlPLVN31
	egv2M2Zc/tO2Jy/m4HOJRXbZ4EKtO+RyulZT5iLh35ycUT/41XLXl4nVmFos
X-Google-Smtp-Source: AGHT+IGbzUlYjpg2H6wy5rwHetA0LZ3y7qQGSobT7HctFnWI9n67GlsHS93OVi9HU1Kh08LuNnXHOw==
X-Received: by 2002:ac2:5b08:0:b0:513:ec32:aa87 with SMTP id v8-20020ac25b08000000b00513ec32aa87mr1763697lfn.6.1711731687515;
        Fri, 29 Mar 2024 10:01:27 -0700 (PDT)
Received: from [192.168.0.103] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id z25-20020a170906075900b00a4e4108a86bsm333688ejb.23.2024.03.29.10.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 10:01:27 -0700 (PDT)
Message-ID: <e1c87cd1-8542-4170-820f-0deeabc22e83@gmail.com>
Date: Fri, 29 Mar 2024 18:01:24 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: remove unnecessary wrapper
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240329111458.14961-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240329111458.14961-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/24 12:14, Michael Straube wrote:
> _rtl92e_dm_ctrl_initgain_byrssi() is just a wrapper around
> _rtl92e_dm_ctrl_initgain_byrssi_driver(). Using a wrapper here adds
> no value, remove it. Keep the name _rtl92e_dm_ctrl_initgain_byrssi().
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> Compile-tested only.
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index 4c67bfe0e8ec..aebe67f1a46d 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -163,7 +163,6 @@ static	void	_rtl92e_dm_check_tx_power_tracking(struct net_device *dev);
>   
>   static void _rtl92e_dm_dig_init(struct net_device *dev);
>   static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev);
> -static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev);
>   static void _rtl92e_dm_initial_gain(struct net_device *dev);
>   static void _rtl92e_dm_pd_th(struct net_device *dev);
>   static void _rtl92e_dm_cs_ratio(struct net_device *dev);
> @@ -929,11 +928,6 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
>   		dm_digtable.rx_gain_range_min = DM_DIG_MIN;
>   }
>   
> -static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
> -{
> -	_rtl92e_dm_ctrl_initgain_byrssi_driver(dev);
> -}
> -
>   /*-----------------------------------------------------------------------------
>    * Function:	dm_CtrlInitGainBeforeConnectByRssiAndFalseAlarm()
>    *
> @@ -952,7 +946,7 @@ static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
>    *
>    ******************************************************************************/
>   
> -static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
> +static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
>   {
>   	struct r8192_priv *priv = rtllib_priv(dev);
>   	u8 i;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
