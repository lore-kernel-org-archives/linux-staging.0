Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2703E346781
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954142; cv=none; b=WYXnqzoH6X5mAyRgFNkiiP81fJ31Ym6ThVo2lz/V6htNlSi+dApRyiGXgcXeK4oR95POVmW6k14A1YlIIObgLkDsGdWUwQ6yCmyUGzWCVh7qAKnWUfGbE9lXJi8zToylif/kymqTp/GWf8erBdTtQuJaGc3+u+Fw5BEWAPnxkNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954142; c=relaxed/simple;
	bh=L8Aju28SNnsa9X1jjSBrPb30i6ozHTGSebIJuIs7uOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMZNGjnEEURi52Oq01AiwvEusA8pc6TXHN8C+EL8XnKqdfRtfkTnUOA7hQnFsdEltqca0/qNVqiker5a8jR5HlOnk+tBw3SuN0EAn9Bokb3cLictxxr3BQNIWmN1M8tN8649tOKXEQ0abnxWR71LYGR30wYX7R5elG8E+iYrjDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxGrrEHh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxGrrEHh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-444826c16ffso10482916f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779954139; x=1780558939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1RWKBmOblRQ9JzyUAc3NqFYDPuEb8OvU279r5Zg/zQ=;
        b=oxGrrEHh0wyhU0tGp/w5405QtaP9dnRMbObUe8WSmNsdWRhkhrzxwR6cMeMFLraD0L
         3fl7xl/5E/NcJYuBElYVHRs5ze/rABIOZzM3djtupRG+MfSXDui2CS2HS292TAuR4WBp
         VgI5pv5o6snK8DKXY9BJXE4AagMPBfwbWVzXBbSYSeX0r1AP+wstW1btnICowZsMN3RK
         Rgs+YXJr296vhV+NDnZx6gkCzC8hPCx9YrZ9E8QaeYdRfQdrgGqGytrrQRICnLhkmEyp
         MDEPCpKfpnxhapbc3E8o1Fb0zE21YCp2IdOxEwoglWfg+PeFZQC5MPnXFQTSHmqfgJXu
         OJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954139; x=1780558939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1RWKBmOblRQ9JzyUAc3NqFYDPuEb8OvU279r5Zg/zQ=;
        b=jDMkfVwtRPkdW4pp2l/26ETFqoS/q8nTsPkzQWeK0coJh2mYfE0zmo0qWpjcQjtu6P
         zQxqlRJX0mgzB+Qqh0N1CO5f0oFL/FqIUbrM4fW3z/53TcZLx6zRFyIz5poR6BmlgWaP
         UsIOkHIgOX8mINZwn0yWPulsetYAtFI1xPrHFIqIwJNzO71SF2SRll7VQ3YCFlZaLgTl
         lYAK8Kf7NTdtIrQecYStdN+5yL8D+K96MDz/1fu3AL05u9KBg+WDnkNIjJBDNlPHqssp
         4nGjmnMl7+f7iFHKd5Wen7TZQIdD8efeCheB00wPfNef/EgtCg3U+6uA+Z5jStK/B/2S
         wu6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kO6LKWj7jP/K6l+hL9mI5If3KQWP5Qm5JYpT2ugcRbivnGkX3rPSIaL8eCofexLBmdSOuEqIgKkVyBz5O@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6bhFGIfjT2f9TshJ33OqrjBnvM1pdmcyCHt0ZTWtjVoXhQRTG
	bqoH7iAjTsNc4LyvLXudcy51LO2uTPo64N8i7RDEDI2xR5sn2xjdDCDG
X-Gm-Gg: Acq92OEc9SIEZmEexpjZRwqxvNsuyoTcbDHQTXLIF37IgbK72WI6P/dthUMr53xwsya
	suhmsgzz4C1knyXklpYduMxIe0//CvRjTQGJUTjGAa/AVDSivYWzEUl7QQYdh5+BPlAySZ1Ke9G
	sgqybHC8XhI3OUrwr3AZ4yIJhl9sed/HuQX1WbxK3zF/ewrBhh5xdbTNbX+8dLsF26CcAceQTan
	rJKyOxoM5vQFRTXBq6QEu8O6SHRys/OPc5tAveChbMSDKoy0q3VM9Ma/3EPhpNq56dfoSwAcLXc
	uWH2549PRQJLwMaXAqMqzlTVBEyjs/mO8Zsyl+FV4ScAGcHY0CyDllEgrJG6DjXgx163AvUIovC
	AKwSYL2w/oAA+8TUnzYZDUt/n7D+GlIK0+idZPBEMW4ScYODR+iSo3UQhNiHMYODQqHZQ42uGXZ
	AHW8rHkPGkEXHWkiVfSG6ocvTRmEJpQXt5nA==
X-Received: by 2002:a5d:6f01:0:b0:45e:e95c:8106 with SMTP id ffacd0b85a97d-45ee95c81f4mr1853395f8f.13.1779954139501;
        Thu, 28 May 2026 00:42:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b19aasm12894837f8f.25.2026.05.28.00.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:42:18 -0700 (PDT)
Date: Thu, 28 May 2026 10:42:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: artur.ugnivenko@gmx.de
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ahmet@sezginduran.net
Subject: Re: [PATCH v8 3/3] staging: rtl8723bs: refactor queue priority
 initialization
Message-ID: <ahfx1lZoIlL4IeCs@stanley.mountain>
References: <20260525163532.20317-3-artur.ugnivenko@gmx.de>
 <20260525173619.5012-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525173619.5012-1-artur.ugnivenko@gmx.de>

On Mon, May 25, 2026 at 07:36:19PM +0200, artur.ugnivenko@gmx.de wrote:
> From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> 
> Pack individual priority values into an enum-indexed array
> to simplify the initialization code and prevent passing around
> six loose values as function parameters.
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> ---
> Changes in v8:
> - Remove the struct from v7, use an enum-indexed array instead
> - Remove other lines ending in parentheses fixes to keep the
>   commit small
> Changes in v7:
> - Add changelog.
> - Add transmit_queues struct in include/drv_types.h to improve
>   style of _InitNormalChipRegPriority
> Changes in v6: Make the patch apply to gregkh/staging-testing.
> Changes in v5: No changes in this patch.
> Changes in v4: No changes in this patch.
> Changes in v3: Split the patch into multiple patches.
> Changes in v2: Make patch apply to gregkh/staging-testing.
> 
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 108 +++++++++---------
>  drivers/staging/rtl8723bs/include/drv_types.h |  10 ++
>  2 files changed, 65 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index 6f2aea984b30..01911188fd44 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -188,25 +188,18 @@ static void _InitTxBufferBoundary(struct adapter *padapter)
>  	rtw_write8(padapter, REG_TDECTRL + 1, txpktbuf_bndy);
>  }
>  
> -static void _InitNormalChipRegPriority(
> -	struct adapter *Adapter,
> -	u16 beQ,
> -	u16 bkQ,
> -	u16 viQ,
> -	u16 voQ,
> -	u16 mgtQ,
> -	u16 hiQ
> -)
> +static void _InitNormalChipRegPriority(struct adapter *Adapter,
> +				       u16 queues[TX_Q_MAX])
>  {
>  	u16 value16 = (rtw_read16(Adapter, REG_TRXDMA_CTRL) & 0x7);
>  
>  	value16 |=
> -		_TXDMA_BEQ_MAP(beQ)  |
> -		_TXDMA_BKQ_MAP(bkQ)  |
> -		_TXDMA_VIQ_MAP(viQ)  |
> -		_TXDMA_VOQ_MAP(voQ)  |
> -		_TXDMA_MGQ_MAP(mgtQ) |
> -		_TXDMA_HIQ_MAP(hiQ);
> +		_TXDMA_BEQ_MAP(queues[TX_Q_BE])  |
> +		_TXDMA_BKQ_MAP(queues[TX_Q_BK])  |
> +		_TXDMA_VIQ_MAP(queues[TX_Q_VI])  |
> +		_TXDMA_VOQ_MAP(queues[TX_Q_VO])  |
> +		_TXDMA_MGQ_MAP(queues[TX_Q_MGT]) |
> +		_TXDMA_HIQ_MAP(queues[TX_Q_HI]);
>  
>  	rtw_write16(Adapter, REG_TRXDMA_CTRL, value16);
>  }
> @@ -231,17 +224,18 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
>  		break;
>  	}
>  
> -	_InitNormalChipRegPriority(
> -		Adapter, value, value, value, value, value, value
> -	);
> +	u16 queues[TX_Q_MAX];

Don't declare a variable in the middle of a function.

> +
> +	for (int i = 0; i < TX_Q_MAX; i++)
> +		queues[i] = value;
>  
> +	_InitNormalChipRegPriority(Adapter, queues);
>  }
>  
>  static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
>  {
>  	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
>  	struct registry_priv *pregistrypriv = &Adapter->registrypriv;
> -	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
>  
>  	u16 valueHi = 0;
>  	u16 valueLow = 0;
> @@ -263,50 +257,58 @@ static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
>  		break;
>  	}
>  
> +	u16 typical_queues[TX_Q_MAX] = {
> +		[TX_Q_BE] = valueLow,
> +		[TX_Q_BK] = valueLow,
> +		[TX_Q_VI] = valueHi,
> +		[TX_Q_VO] = valueHi,
> +		[TX_Q_MGT] = valueHi,
> +		[TX_Q_HI] = valueHi,
> +	};
> +
> +	u16 wmm_queues[TX_Q_MAX] = {
> +		[TX_Q_BE] = valueLow,
> +		[TX_Q_BK] = valueHi,
> +		[TX_Q_VI] = valueHi,
> +		[TX_Q_VO] = valueLow,
> +		[TX_Q_MGT] = valueHi,
> +		[TX_Q_HI] = valueHi,
> +	};

Same.

> +
>  	if (!pregistrypriv->wifi_spec) {
> -		beQ = valueLow;
> -		bkQ = valueLow;
> -		viQ = valueHi;
> -		voQ = valueHi;
> -		mgtQ = valueHi;
> -		hiQ = valueHi;
> +		_InitNormalChipRegPriority(Adapter, typical_queues);
>  	} else {
>  		/* for WMM , CONFIG_OUT_EP_WIFI_MODE */
> -		beQ = valueLow;
> -		bkQ = valueHi;
> -		viQ = valueHi;
> -		voQ = valueLow;
> -		mgtQ = valueHi;
> -		hiQ = valueHi;
> +		_InitNormalChipRegPriority(Adapter, wmm_queues);
>  	}
> -
> -	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
> -
>  }
>  
>  static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
>  {
>  	struct registry_priv *pregistrypriv = &padapter->registrypriv;
> -	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
>  
> -	if (!pregistrypriv->wifi_spec) {
> -		/*  typical setting */
> -		beQ = QUEUE_LOW;
> -		bkQ = QUEUE_LOW;
> -		viQ = QUEUE_NORMAL;
> -		voQ = QUEUE_HIGH;
> -		mgtQ = QUEUE_HIGH;
> -		hiQ = QUEUE_HIGH;
> -	} else {
> -		/*  for WMM */
> -		beQ = QUEUE_LOW;
> -		bkQ = QUEUE_NORMAL;
> -		viQ = QUEUE_NORMAL;
> -		voQ = QUEUE_HIGH;
> -		mgtQ = QUEUE_HIGH;
> -		hiQ = QUEUE_HIGH;
> -	}
> -	_InitNormalChipRegPriority(padapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
> +	u16 typical_queues[TX_Q_MAX] = {
> +		[TX_Q_BE] = QUEUE_LOW,
> +		[TX_Q_BK] = QUEUE_LOW,
> +		[TX_Q_VI] = QUEUE_NORMAL,
> +		[TX_Q_VO] = QUEUE_HIGH,
> +		[TX_Q_MGT] = QUEUE_HIGH,
> +		[TX_Q_HI] = QUEUE_HIGH,
> +	};
> +

No blank lines in the declaration block.

regards,
dan carpenter

> +	u16 wmm_queues[TX_Q_MAX] = {
> +		[TX_Q_BE] = QUEUE_LOW,
> +		[TX_Q_BK] = QUEUE_NORMAL,
> +		[TX_Q_VI] = QUEUE_NORMAL,
> +		[TX_Q_VO] = QUEUE_HIGH,
> +		[TX_Q_MGT] = QUEUE_HIGH,
> +		[TX_Q_HI] = QUEUE_HIGH,
> +	};
> +
> +	if (!pregistrypriv->wifi_spec)
> +		_InitNormalChipRegPriority(padapter, typical_queues);
> +	else
> +		_InitNormalChipRegPriority(padapter, wmm_queues);
>  }
>  
>  static void _InitQueuePriority(struct adapter *Adapter)
> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> index 552d0c5fa47f..b2c43f53571a 100644
> --- a/drivers/staging/rtl8723bs/include/drv_types.h
> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> @@ -373,6 +373,16 @@ struct adapter {
>  	unsigned char     in_cta_test;
>  };
>  
> +enum transmit_queues {
> +	TX_Q_BE = 0,
> +	TX_Q_BK,
> +	TX_Q_VI,
> +	TX_Q_VO,
> +	TX_Q_MGT,
> +	TX_Q_HI,
> +	TX_Q_MAX,
> +};
> +
>  #define adapter_to_dvobj(adapter) (adapter->dvobj)
>  #define adapter_to_pwrctl(adapter) (dvobj_to_pwrctl(adapter->dvobj))
>  #define adapter_wdev_data(adapter) (&((adapter)->wdev_data))
> -- 
> 2.54.0
