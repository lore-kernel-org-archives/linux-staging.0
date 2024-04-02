Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781A364BE
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712041515; cv=none; b=evCqu+3UrOlX0cgTkNPKEnWHWho4SDSX4YVL+0xCk2xyddnqLRKAqnmc7smnQ+TfFPsKDFDdPBIZa7cegCiyU7F5xsbMmnOAAXbW8ecBz50TROQ7iUyKzTwEmiTxoTjShJsiTCWEpHCnHENtUWTO66KmA1dGRs6jrvQWL9g7oSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712041515; c=relaxed/simple;
	bh=LLCKE4A8nyzm0Hlt56n70RBLrr3fo5016WuImie0DPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdvTz8aqGBceY6BWbzUFLybxWBb8eFEepqcN6N4TL2HiVRTFF2DR+p6uxF7Kx9Vw7JcrmMXMUKY0iiGfZ5dSEjvox5f5GroV1q6hVliPbMBKPzKqCHeCXi2QIwGjM/ENe3aVTYY+h4rDYHeV+kcbZIH1dq/Z55h0jtozaDdsV9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+ZfqeeP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+ZfqeeP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a466e53f8c0so622812766b.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712041512; x=1712646312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYwBryX2K8ODu6f2N4BEpdau6lQG6ZayVMvLvmJsgP4=;
        b=h+ZfqeePYlLvwOXy+m0qSqhViMyw/zd3NxtxHQF3yj8/IbEdoxNHVfQEv4Qp1lIGBb
         5vPCtsAFmi7nY9J2plfTJC7JIe1OvQgAyrmDD8fQ4+Jq+aDKcowt86JsA+NuI3TyoXCO
         EmFSgdL9XVLQwlg7LBpBX4o8GSOggS5CDuZNlpyrRUOkvbKlTeK4A9ZEbG+HUISU9OoA
         UkAUcNsl5I0CFZK4fFWRxTs0bMD6MvthlDZxlv0R7OC+WhNMEpUJ15bbIFV4lf1VK6Be
         l8MUM3DWPpmozLxrUNXpN3a2WYymxZxNHqxrLRGkyY89zAUPfL0H74WUdbiJY92Sq32k
         NixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712041512; x=1712646312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYwBryX2K8ODu6f2N4BEpdau6lQG6ZayVMvLvmJsgP4=;
        b=PVCKr1ODWPa2GdWDd7h/aaSwInoO6cUzgt78f2jLRS+uRIu1TaFiXl+g5f0/a1y0X+
         nqWsPm3EwN8QFnkiFaX28izdx5Cp/3cB1c8UWn/Ker4aWDo72Ae8yMPlTt5akCgdfUyF
         ukmELPYrseF7hPD/qEkA9nNJ007OMf8ykPCrSbFyBvyuLnlqj+nwbGebu4fn9emgxu0x
         940DfWn9/euadGeAxG/7jAaJnsytOsZbaLYYK+sDTnuPt59Uq86inF+ILWYoxHeMYVJT
         3NyFDNIVOZtBbzUHQu+gGYlpO/CcbrWx2/4s0R3RUm/Z7ZXy/6L3kv5IcHbjA7n8dwjV
         Aj7w==
X-Forwarded-Encrypted: i=1; AJvYcCXPH8b2FoVw4aIV++0XENimqJ8vtyRbJo0hITQWQ4/r5bEAHvuoiTKrnH4bGkmk/m3itAOjqWlNtSv64T5nVL1b91x0yqa0n11Zfv+ePQ==
X-Gm-Message-State: AOJu0Yz6xlm7d9q8vuLwRwvRexxTObw3rXNigs3LJjXYbOfCKmDqSjMM
	gn82g7YtAZZH/9jSPWovdVERZNMHO6tMA32iy+R2YqR1lOkPh3p2j8WM5xqZO0Ji3cMbtP6tD6R
	2
X-Google-Smtp-Source: AGHT+IE4i0uE4zNMajZPn9EDb6fr5Exl+ezBg3jCQtWEO1B/zUdsRoEB2jy2LtigWsB2ZUsWxOxE8g==
X-Received: by 2002:a17:906:b047:b0:a4e:d27:30ab with SMTP id bj7-20020a170906b04700b00a4e0d2730abmr8456776ejb.59.1712041511989;
        Tue, 02 Apr 2024 00:05:11 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id wv11-20020a170907080b00b00a4503a78dd5sm6189435ejb.17.2024.04.02.00.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 00:05:11 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:05:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs: remove spaces before tabs in
 rtw_set_key()
Message-ID: <e26e8d4b-ce02-497f-a015-c2d2eab9bda2@moroto.mountain>
References: <20240329150953.17350-1-meir6264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329150953.17350-1-meir6264@gmail.com>

On Fri, Mar 29, 2024 at 06:09:53PM +0300, Meir Elisha wrote:
> Remove spaces before tabs in order to improve coding style.
> 
> Signed-off-by: Meir Elisha <meir6264@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 36 +++++++++++------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index bfb27f902753..5a506fe4698b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -626,10 +626,10 @@ void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
>  
>  /* select the desired network based on the capability of the (i)bss. */
>  /*  check items: (1) security */
> -/* 			   (2) network_type */
> -/* 			   (3) WMM */
> -/* 			   (4) HT */
> -/*                      (5) others */
> +/* (2) network_type */
> +/* (3) WMM */
> +/* (4) HT */
> +/* (5) others */

This comment looks weird.

>  int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork);
>  int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
>  {
> @@ -1052,9 +1052,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
>  			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
>  		}
>  
> -		/* 	Commented by Albert 2012/07/21 */
> -		/* 	When doing the WPS, the wps_ie_len won't equal to 0 */
> -		/* 	And the Wi-Fi driver shouldn't allow the data packet to be transmitted. */
> +		/* Commented by Albert 2012/07/21 */

Nobody knows who Albert is.

> +		/* When doing the WPS, the wps_ie_len won't equal to 0 */
> +		/* And the Wi-Fi driver shouldn't allow the data packet to be transmitted. */
>  		if (padapter->securitypriv.wps_ie_len != 0) {
>  			psta->ieee8021x_blocked = true;
>  			padapter->securitypriv.wps_ie_len = 0;
> @@ -1916,7 +1916,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
>  	u8 keylen;
>  	struct cmd_obj		*pcmd;
>  	struct setkey_parm	*psetkeyparm;
> -	struct cmd_priv 	*pcmdpriv = &(adapter->cmdpriv);
> +	struct cmd_priv *pcmdpriv = &(adapter->cmdpriv);
>  	signed int	res = _SUCCESS;

These declarations look bad.

>  
>  	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
> @@ -2021,8 +2021,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
>  /*  */
>  /*  Search by BSSID, */
>  /*  Return Value: */
> -/* 		-1		:if there is no pre-auth key in the  table */
> -/* 		>= 0		:if there is pre-auth key, and   return the entry id */
> +/* -1: if there is no pre-auth key in the  table */
> +/* >= 0: if there is pre-auth key, and   return the entry id */
>  /*  */
>  /*  */

Bad.

Nobody really cares about spaces before tabs.  The more important thing
is that it looks ugly.  Focus on what matters more.

regards,
dan carpenter

