Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C333563C2
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649194; cv=none; b=YypwgZT8eyrZ5t7jSq3oK5MzCrf0SO4Hnq9SrS7RbVOTIsn3IeQDrr5V/fZaeds2nKbXvbepj8pmHHlIq4GbEbKlDvHE9GZk7bUpvu43v/6ps+pRnVV91bhicsGkDKSZB4GuNBd5GJ5UduE5TWqTBY2lXGTBlxqfCvqPeKyOHp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649194; c=relaxed/simple;
	bh=QAe0qOQULSDijy/Rdlguz/CCtwcyMqYCTdDDl3/BTcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsFWR7uK8ZbezTjnqrdWA5/sY5+7xNvU8waB8QBg7APE5KPPZoLSoAPWm1Gcv3t9OFHfH6y5LxJDymgrrjT2y8BRdPnbMWBrWlttbM4hLNQVgMOhM1RW213DJc+Ug49SAQ31dL3s36n3B3901XwPSxMUNMvPLEXq0viSSqSf+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3bOWx/+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3bOWx/+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37526545e9.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649192; x=1774253992; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NebB9FX++Sl8vrkNbafXiRbZn2hJyPCLF4EcIHgo1GE=;
        b=g3bOWx/+X/0BEL/tGRceRtO5pRHWwSd9/FdQUDKiDoiBPI/rTy02aV3AMbUJaKE4FO
         3qHRjJQZ36ZRgA2E+vcvySoqxxDGaMjkwbc29Y/2Ke91bjv3lYm1VuaRC+inqJvaSv9U
         7frDAqNpneIZOg9vm16tcZwXCHG5klZc1GCP4TWAvNSG/fH88lY1BDjhHVMIbhDUlzxL
         zv4TZOdzGH2Iry2BCQIMFGbepn5HBAmaSHWAQTIkAqiBXq0EcM+SK1MOseaFcJ2YxzhS
         5m47huMPOpD5Mnowbk700dd3G1pZu27PgwjlcfcOc8zlJGfkkSK20O27OpGcw78syuP/
         nlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649192; x=1774253992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NebB9FX++Sl8vrkNbafXiRbZn2hJyPCLF4EcIHgo1GE=;
        b=cmNv5stWtwsXCTg3BN4QpaRZjik2OTXIUedaHUsImYrkTrGK15NtBQUFmLiLykSN0K
         CTYKLiPbgUdbPyOWlokqr/jjmjESAO+VuMeJnrDbTeXWEx+3qJgtTdpnaLYhsi8nEsJD
         ecSDBYHMlsQLKCdmU1yESzAHiADQaWUHsAFx/DcAPz0oJ9ZCM5mFKYVIk8Uyo6KtJ/aR
         J6PDba/DwYkyxEMzD5oJDZbUGF9FPawJd/zkwug0IJJ9xDw0wAssgRr5R5KxNsmXBOCJ
         tXF8oI9KUMA5KJQ1O9lzZodihMMQkYAcfNJQ/I9vIN/Ze1bvdiGvJ1XXBlpj8ciW8Sd8
         oPAw==
X-Forwarded-Encrypted: i=1; AJvYcCX76VAvJChJq5qNmxz64erdfjI/fMae2TjS8kgW+zRp+Uix5MM81Zf7HITAKMYUVtU1AbD0lwJ+EKKOU3QC@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6zCGW0KdvfOzmM1kcHQtPGIRWtjpUOef5ZRov4tLGilqavPzr
	Gd6YGK+UBIyzdba/Z2BkKa35EwqNQyGV2jwMIUpt2VhwIuyQ3MM4Ocns7hIFGljB4X8=
X-Gm-Gg: ATEYQzx3tqKVAupeVHmsaRqT3h29efeN5IyAV+S0n/xxzu84tIO/vtvdEILRRVxV6Y7
	i3+um2cDUa/xXQI5M+kstE0UMRqoasnzIMa1dae82vhD8vOdUdaPqxZ7cv7aOLsUUPyCNWEVx3f
	TyOwOA8Nu5NIOeuWz7HeAg8DKOy+f2gIX/1pbatmeFhhtFcZnegDYn6JYlp2cXUuKF0HredemcB
	O57e212ntQs7SWRM2rufBLJhHiMZJ2JEASk2UPkuwl/mUhlX3WzFEOWt4ROJvVL0vPYT67eK0j0
	G7Yw9RUtp/OzO2ZJFwMyuBMGvC7D1zIJNxytT4uLc9lXGHOs3WJXhxN8EDM1rARvdGaXzU2OjPZ
	vbkw5VRbPIJ1sMBudSKBwSlvwsCpygtcJE6tBQfVWWKu40LdxoZDe9QJ8OYrhTnTLXyURK+rSmY
	oj/iCtMZa+Ow3XPo0lN2AS5z7Zbcjq
X-Received: by 2002:a05:600c:a46:b0:485:3bb5:92c5 with SMTP id 5b1f17b1804b1-485566d52c8mr210915185e9.14.1773649191735;
        Mon, 16 Mar 2026 01:19:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm502929415e9.8.2026.03.16.01.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:19:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:19:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Improve error handling
Message-ID: <abe9JBLTt75_xwlk@stanley.mountain>
References: <20260313124908.579-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313124908.579-2-b9788213@gmail.com>

On Fri, Mar 13, 2026 at 03:49:08PM +0300, Bera Yüzlü wrote:
> Remove unnecessary ret variable and goto exit pattern. The function now
> returns immediately when an error occurs. Additionally, ensure that
> intf_free_irq() is called when pm_netdev_open() fails to avoid leaving
> the allocated IRQ uncleared.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
> V2: Used int_free_irq() in error condition.
> V1 Link: https://lore.kernel.org/linux-staging/20260312131933.29505-2-b9788213@gmail.com/
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 28 ++++++++-------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 7ba689f2d..e86b8af8b 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -1124,35 +1124,28 @@ static int rtw_resume_process_normal(struct adapter *padapter)
>  	struct pwrctrl_priv *pwrpriv;
>  	struct mlme_priv *pmlmepriv;
>  
> -	int ret = _SUCCESS;
> -
> -	if (!padapter) {
> -		ret = -1;
> -		goto exit;
> -	}
> +	if (!padapter)
> +		return -1;
>  
>  	pnetdev = padapter->pnetdev;
>  	pwrpriv = adapter_to_pwrctl(padapter);
>  	pmlmepriv = &padapter->mlmepriv;
>  	/*  interface init */
>  	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
> -	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
> -		ret = -1;
> -		goto exit;
> -	}
> +	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS))
> +		return -1;
> +
>  	rtw_hal_disable_interrupt(padapter);
>  	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
> -	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
> -		ret = -1;
> -		goto exit;
> -	}
> +	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS))
> +		return -1;

I have written a howto on error handling.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

So after the ->intf_init() you need a deinit() etc.  The blog hopefully
explains.

regards,
dan carpenter

