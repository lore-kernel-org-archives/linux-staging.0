Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C43152E03
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706540712; cv=none; b=IFvjzWtwPinwDxcw0I9NTc3UAGBltMqnR4I9MNCaumoLa9iekFpR+9MFyByCRuAtxFelmlkNW2V5R7Ihp7VsA9hpRTU/+RWV0z9XY6+gmCj5aR3qPZIFqycd6+IF4Imt+tw2pMaEFpPjVMFRyuGy7K5MrduKm3VeVVXDoZg62pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706540712; c=relaxed/simple;
	bh=w0SmiVf1VIVWURSBibSHsWqoAWrZC4py0itUpxFcYnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9OLXd1wtEUwQsPlbNSqWaJrvspOdSpLctaEcPtNyIinmXk+GiOYca1WVdyCk3GXomm93tQHSAa+2ffx7jCPR5sTvgaaUqmeOrTGZY25dMzCrcu496Y9M8zwEqyY9+YlcHaESdWZxAytqAqtHBlGiZmhw2MiBZGc3HW+7bAWSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lye1IYN6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lye1IYN6"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5110c166d70so2040990e87.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 07:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706540708; x=1707145508; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=is7ro7B8vSrt0TvYSJ+DPFn+IXQv7f7Zkz1f/rmDyPY=;
        b=Lye1IYN6xW/qiQXUK3nbXdJ2+u9qOHpM/DfVDhwZPEeR1r9qhKLsTJ822eZTn2ws6Z
         6aIuVul2EA6W6zWDPSvC3RzdW76D4+TOeDRrmPB0E6HSN4Q/kIGO9iEMMeWCic4hBJwZ
         F8Sv5P1CjS35nMq+X306ndgR2VlT4nj3EOfjX2En8wkGVRunt7b9qA7DTKsgQttX4Bzm
         vAoCAUXY6LerY74J+HJ7Se0MYGc0PcfBaxGF1wCTCeJq8+t1gLhUtFgBDJyjgY6BB0zc
         ugB16fn0tApl4Q0CmGU0XedV7YeRfILPqo8WKQsLg+RBFYvP29Nj42JiKhIGCeqiIGmx
         BMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706540708; x=1707145508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is7ro7B8vSrt0TvYSJ+DPFn+IXQv7f7Zkz1f/rmDyPY=;
        b=P+I7mnxt5nGSO+goKV3ueq1hMFvxv0agY0j/k86lSgjebmZKUaUTCgNba4+Q6HzOiq
         MgtzRkPUyET11ryhW0qQeYqixXS/joVYXM6/P4JvocJ8tfIZOGtZUOP/Jpb3OmL+0zvV
         dAspb2FKrth+z0GBD67g1QiXFHsh/MLJhur8h3G/vNuBKm9GZ4BInph+3CzNISC9kj6a
         BKYLU/NV77H4gtMdHMyujeR9GRQJbezQNAYrvTlAnAWU9YU7Tpi14NIFh5jxnDertzTF
         597bDM18FWqlUnNdrJGQ2t594s9DrueOU3iFg7xpHoUawqju8IINDH2VvaZkNaJGqhjf
         I3sw==
X-Gm-Message-State: AOJu0YxzvGTBMt7wkHAHLgTGzigUpJuOWUrN7KjDrKTNjzanTBhPYeYH
	DFtMCMB6nGAJlsLo/RbtM+HdZ2AkwTN+U+ITv2HvIOC4Jb3xDM4vR6RhRVVpbJ8=
X-Google-Smtp-Source: AGHT+IEqmh/cI1PozuMSleeGae2wsgcL+hEQKSB8fVSpWf8NAz1wVQzEOkLik3p398u18vSo0zPTnA==
X-Received: by 2002:a05:6512:20d2:b0:50e:7aaf:ec53 with SMTP id u18-20020a05651220d200b0050e7aafec53mr3597889lfr.12.1706540708419;
        Mon, 29 Jan 2024 07:05:08 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b0040e4914f28dsm14282173wmq.18.2024.01.29.07.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:05:07 -0800 (PST)
Date: Mon, 29 Jan 2024 18:05:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] Staging: rtl8723bs: Remove extra spaces
Message-ID: <080d2c0d-49b1-45e9-9b7b-fae2afaf0b4f@moroto.mountain>
References: <20240129141856.416532-1-meir6264@Gmail.com>
 <20240129141856.416532-3-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129141856.416532-3-meir6264@Gmail.com>

On Mon, Jan 29, 2024 at 04:18:54PM +0200, Meir Elisha wrote:
> Fix checkpatch warning: please, no space before tabs
> 
> Signed-off-by: Meir Elisha <meir6264@Gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 48 +++++++++++------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 5568215b35bd..a7c4350e0783 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -169,7 +169,7 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
>  {
>  	unsigned int delta_time;
>  	u32 lifetime = SCANQUEUE_LIFETIME;
> -/* 	_irqL irqL; */
> +/*	_irqL irqL; */

Just delete dead code.

>  	struct __queue *free_queue = &(pmlmepriv->free_bss_pool);
>  
>  	if (!pnetwork)
> @@ -389,7 +389,7 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
>  	d_cap = le16_to_cpu(tmpd);
>  
>  	return (src->ssid.ssid_length == dst->ssid.ssid_length) &&
> -		/* 	(src->configuration.ds_config == dst->configuration.ds_config) && */
> +		/*	(src->configuration.ds_config == dst->configuration.ds_config) && */

Here too.

>  			((!memcmp(src->mac_address, dst->mac_address, ETH_ALEN))) &&
>  			((!memcmp(src->ssid.ssid, dst->ssid.ssid, src->ssid.ssid_length))) &&
>  			((s_cap & WLAN_CAPABILITY_IBSS) ==

regards,
dan carpenter

