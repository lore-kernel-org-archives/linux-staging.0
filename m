Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E12D0C8F
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999659; cv=none; b=MK+bXeN0TOiuQdwVDMeUcci/LjT1Dxashz1tJtV2FT0Doo9oq4kEmZjmPrDAdDcLJ8K1fz1TYePVV1Hpz62+XjYJ39Xe3h9tuTTZ4edsDBDxiXUs3OxTxWcM06sjrnB2GddcGCUWwKXaZfpoByYE00PFs1DNTNTxy0cVRX+IK9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999659; c=relaxed/simple;
	bh=ilsRLDKtjOaWwKZA7oSztj37lEQ8NhKHfmFzR/SJcsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJOLuaAftJrnsIDuE1ZP344i+XFRBurOn7FNNtoj7oe9wATDtmXPvXfAol2OgZPHsuRt4/B40mYdZ0v28kYNPNeWNZt3gtAnyHjST8DTOb3lKTqPvh522VIfmDg1UfZXM8OcsOXJEjTOHoqYK41PucLXHfQXI9nW3L5bCoyIW+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtIY6eVy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtIY6eVy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so16170995e9.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773999657; x=1774604457; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N+8nIJ3x1Qf641YK4G2cmVSR2UpWjbK5A1KcEh3P0xU=;
        b=vtIY6eVy6VmPoceZL7pFjTGeDscaQZ8n6eOk8YbJKUY8xpkVvh6I9DDC3yekpcokrx
         bUEHJClovF32XkDy1qxmtQsO2C7GwpfnVi/y0YIfjy3RLkOH7D6VMvJXw/2m5NpxWVaT
         O0pxRSOlxuYe3B61q6l61K2QHl33+qhGHRfl0fN6ngsbu9hlvlBGM6AstpkwzT6KUV7p
         0CHQhP6+e9av/VXjFfRQY7snsMeoKbP2TDJLznIRAcK48pf2fSh4e+iC0XfASP/FtM0w
         bevwYIs+X3ixH7Tdr3LEcYaPTnTYNCTvmqMtIIpiPjtJ6jzqVLbGhMJ1qHR2xo6g/IT/
         4+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999657; x=1774604457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+8nIJ3x1Qf641YK4G2cmVSR2UpWjbK5A1KcEh3P0xU=;
        b=W87mrpfGuDU/pDdqPatex6k5cm08MNmXnIMAA5k4ZswpNYKkUkXXCXZ608WRB2/gvl
         vebmGHI7y2LzRjQCXmHad2Lyo8xZrndCZlzr4LgEkrzFSs9m1yA/3l92pDhQ3VSOLesA
         szA6XdJi+wtshWVX8rK1bQGWNSEtmW5TPkfUyf9MhdAy9Z4UN7CR0nC0TeppCkdCnG4Z
         3+/BgttPBjJtw4EtcXTLVgr47BDjoqoS6GHMA2CcQ7Px+K5+Kebm2yFlRw6pNZyuy/Rs
         tP9Fi14SBdTSKMMz+UdLqAm3MIW54bJpdmAsDITvtYesQ970OuYn9GbpxuAkxdgkJZ6D
         SZRA==
X-Gm-Message-State: AOJu0Yxa8JbjptxRGArWpa4ywR/NBjcr34sv785/a4GITiTyxuV0wDdZ
	dn2962VJ5z/ZeW1Zb7d8CvWtxBBoaOTxxNtVy5XZewWLuwcyDMRyWOaKX/Wz2FzgFD0=
X-Gm-Gg: ATEYQzxIGrhJsY7NHbKeMskeGWuOOLwKcfAYKdU1Hx3eusLUFQwFBZItvyoPKBU9/jo
	VAQ+c3yGWRX901sNqBb2LnecAJjp3c40GU+yJuJ7BunVlzXQ8s+GDpMdHKtRPzbL/lLeXKd9S2N
	QQUfv9Ij++pEsowcRcvewbwCYdNH6LBDhwbEuylMdNXMqm+1VLeeGgPliJrsD9WKRORa06LcxEq
	YI61qST2/UCMx32qwrlwWVBkyjT+iis627zQxtzKPV27MU1QSRYxuv6/swJW/SV7ePEbb5CUD2N
	riyVuBUTD8/0k0t1KgCsPmGfcT2jW5aM4XRhrBoA9woF41a88Pksilw49DmZ71mDBOV/6JcOyfa
	1HFdfrI7fCe+gCC6acP9mZxiR5YvBEBcQWkiI/ZZeUEDVVMRc0+rGzsPEEtxtBswQCGQza2c9th
	MbFghOEnd+wYAUTIOX9pBZaiSFdJzb
X-Received: by 2002:a05:600c:468b:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-486feb5a4f8mr37936095e9.0.1773999656508;
        Fri, 20 Mar 2026 02:40:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700524864sm10344085e9.5.2026.03.20.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:40:56 -0700 (PDT)
Date: Fri, 20 Mar 2026 12:40:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: refactor
 rtw_joinbss_event_prehandle to reduce indentation
Message-ID: <ab0WH6lA4GY6lp8J@stanley.mountain>
References: <20260319231344.569418-1-azpijr@gmail.com>
 <20260319231344.569418-3-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319231344.569418-3-azpijr@gmail.com>

On Fri, Mar 20, 2026 at 12:13:35AM +0100, Jose A. Perez de Azpillaga wrote:
> The rtw_joinbss_event_prehandle function has excessive indentation due
> to deeply nested if-statements.
> 
> Refactor the function using early returns and guard clauses for the
> failure paths. This flattens the code and significantly improves
> readability.
> 
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 134 +++++++++++-----------
>  1 file changed, 69 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 805427353aa6..2a192c1dd038 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1175,84 +1175,88 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  	pmlmepriv->link_detect_info.traffic_transition_count = 0;
>  	pmlmepriv->link_detect_info.low_power_transition_count = 0;
>  
> -	if (pnetwork->join_res > 0) {
> -		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
> -		retry = 0;
> -		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
> -			/* s1. find ptarget_wlan */
> -			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
> -				if (the_same_macaddr) {
> -					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
> -				} else {
> -					pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
> -					if (pcur_wlan)
> -						pcur_wlan->fixed = false;
> -
> -					pcur_sta = rtw_get_stainfo(pstapriv, cur_network->network.mac_address);
> -					if (pcur_sta)
> -						rtw_free_stainfo(adapter,  pcur_sta);
> -
> -					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
> -					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> -						if (ptarget_wlan)
> -							ptarget_wlan->fixed = true;
> -					}
> -				}
> +	if (pnetwork->join_res == -4) {
> +		rtw_reset_securitypriv(adapter);
> +		_set_timer(&pmlmepriv->assoc_timer, 1);
>  
> -			} else {
> -				ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
> -				if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> -					if (ptarget_wlan)
> -						ptarget_wlan->fixed = true;
> -				}
> -			}
> +		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
> +			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>  
> -			/* s2. update cur_network */
> -			if (ptarget_wlan) {
> -				rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
> -			} else {
> -				netdev_dbg(adapter->pnetdev,
> -					   "Can't find ptarget_wlan when joinbss_event callback\n");
> -				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> -				goto ignore_joinbss_callback;
> -			}
> +		goto ignore_joinbss_callback;
> +	}
>  
> -			/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
> -			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> -				ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
> -				if (!ptarget_sta) {
> -					spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> -					goto ignore_joinbss_callback;
> -				}
> -			}
> +	if (pnetwork->join_res <= 0) {

This preserves how the existing code works, but originally there was
a comment here which said that join_res could only be < 0.  Emotionally,
I would prefer if zero were treated as success.  Can join_res actually
be zero?

Update: I looked and join_res can be zero.  It comes from:

	res = pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4))&0x3fff);

in the OnAssocRsp() function.  I guess preserve the <= 0, but also
preserve the comment.

> +		_set_timer(&pmlmepriv->assoc_timer, 1);
> +		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
> +		goto ignore_joinbss_callback;
> +	}
> +
> +	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
> +	retry = 0;
> +
> +	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
> +		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> +		goto ignore_joinbss_callback;
> +	}
> +
> +	/* s1. find ptarget_wlan */
> +	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
> +		if (the_same_macaddr) {
> +			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
> +		} else {
> +			pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
> +			if (pcur_wlan)
> +				pcur_wlan->fixed = false;
> +
> +			pcur_sta = rtw_get_stainfo(pstapriv, cur_network->network.mac_address);
> +			if (pcur_sta)
> +				rtw_free_stainfo(adapter, pcur_sta);
>  
> -			/* s4. indicate connect */
> +			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> -				pmlmepriv->cur_network_scanned = ptarget_wlan;
> -				rtw_indicate_connect(adapter);
> +				if (ptarget_wlan)
> +					ptarget_wlan->fixed = true;
>  			}
> +		}
> +	} else {
> +		ptarget_wlan = _rtw_find_same_network(&pmlmepriv->scanned_queue, pnetwork);
> +		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> +			if (ptarget_wlan)
> +				ptarget_wlan->fixed = true;
> +		}
> +	}
>  
> -			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> +	/* s2. update cur_network */
> +	if (!ptarget_wlan) {
> +		netdev_dbg(adapter->pnetdev, "Can't find ptarget_wlan when joinbss_event callback\n");

This line is too long.  In the original code there was a newline after
the comma so it would have been 84 characters.  Try to make as few
unrelated changes as possible.


> +		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> +		goto ignore_joinbss_callback;
> +	}
>  
> -			spin_unlock_bh(&pmlmepriv->lock);
> -			/* s5. Cancel assoc_timer */
> -			timer_delete_sync(&pmlmepriv->assoc_timer);
> -			spin_lock_bh(&pmlmepriv->lock);
> -		} else {
> +	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
> +
> +	/* s3. find ptarget_sta & update ptarget_sta after update cur_network only for station mode */
> +	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> +		ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
> +		if (!ptarget_sta) {
>  			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> +			goto ignore_joinbss_callback;
>  		}
> -	} else if (pnetwork->join_res == -4) {
> -		rtw_reset_securitypriv(adapter);
> -		_set_timer(&pmlmepriv->assoc_timer, 1);
> -
> -		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
> -			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
> +	}
>  
> -	} else {/* if join_res < 0 (join fails), then try again */
> -		_set_timer(&pmlmepriv->assoc_timer, 1);
> -		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
> +	/* s4. indicate connect */
> +	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> +		pmlmepriv->cur_network_scanned = ptarget_wlan;
> +		rtw_indicate_connect(adapter);
>  	}
>  
> +	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> +
> +	/* s5. Cancel assoc_timer */

Put this comment after the spinlock (the way it was in the original
code).

> +	spin_unlock_bh(&pmlmepriv->lock);
> +	timer_delete_sync(&pmlmepriv->assoc_timer);
> +	return;

Originally, we took a lock and then fell through to the unlock after
the ignore_joinbss_callback label.  Which is obviously bogus so your
return is better.  I also think it might be even better yet to get
rid of the ignore_joinbss_callback label entirely.  A simple

	spin_unlock_bh(&pmlmepriv->lock);
	return;

Is only one more line of code, but it's much more readable.

regards,
dan carpenter

> +
>  ignore_joinbss_callback:
>  
>  	spin_unlock_bh(&pmlmepriv->lock);

