Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9104E2C21D9
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281064; cv=none; b=Sl2u1z+SIir9HMh5YeTl6TcuIajT+7HPdH32NFXRCSzWTBC2g4gDfrN9RYse5Agtx0uFtuqi0PUt4pH6zCRSAj9elhyeBRb4G/GiF/bZrvY/3DYffnMJtnOusF7g7hTf6a8i4yJK9wQ2FSHI/55xcpPGGu99nlQ1J9HSW+wb1Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281064; c=relaxed/simple;
	bh=GH5bX0PmlN2AKMnVu4z7dOKGObcLx8VTJGpQUxJzHlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG5n9J2KtK/9kxA5WKBxdzEzKBNi3bWWP8XoAkvWf/vDcmoV2NCuAcz8hMhaVuABxtAem81jRbYc+7ymwPUatSDQuvHNqVW9ls30RPpZdGIIiUh1tSS9AI3XM+IaZsZsBZ1hTjzt8xBX5hfznkFQ0E0iO1irCN66t0Ajq0IGZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQi6jBEo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQi6jBEo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so130683455e9.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777281061; x=1777885861; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZntYVnVsrGv6F9rosThtG71miTc62QxvlA4TBCc9So=;
        b=pQi6jBEorqq1id5G42OSCJGtzmD3qBW7neAR0fiwa0qchXmhkES0BH4lJJeWgfIDS4
         WqEn3ZycgCKZawTqisuyBNiwIIm00hZXPfpJmj+95Yq999na6NgSx6jTyh9nLOnXvcZz
         X58KWT+Emk/LKtDK0JtJNLayUqXb/Z/fP05Y14uqQkWNIpWsY7kLfRlw6ynYq3oqhKC6
         x6on97BhuYiV5PVU2C1B12jzlfe/VE01LFaSWcqKOGUK1bfDSY8AX42Waf/ezudqh9hp
         ChXEb0vYQHRH6ywIVXpb3PGBJEH1dZ4FPxv8bk2MK0p2/Fo/fAVa67c+u/oglaNgz03s
         5RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281061; x=1777885861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZntYVnVsrGv6F9rosThtG71miTc62QxvlA4TBCc9So=;
        b=gFvvc9e5fFYYfd7qoITxl87XaWtswWuHFTtw2+L4QqNs9YX9CgCC0zvRU/pXmUbsHz
         o1r3RdXyJd9f82c6mvu9meYVR0Syl7A+DsJjPcRg/JzU+Vqig11Y2hsxk5Mj+w/CpOnS
         fcD0hjBh6nkjwv8EZ1jCdYH3rOtblLgA48lRsSw5yVkA8CPgNRcRhGhmcat2sT3IbzF8
         izdO3r+3YDzJEaEBz8EZEuTFaTwrzTMvRjbO8X+pi3PH1hqwPNcRskWBJmE4Cw/NpnMB
         DHzFqnT4Gc3nfAeytPRYL51BPJW9t+2/QlD3SUp8EMm6V5067brnFn3jmQLircbx7duA
         473w==
X-Forwarded-Encrypted: i=1; AFNElJ8K/Lnaz9F6i/MO4VQhOlqmbkfoYfpR+xlqdcavhUS10IBav7kkNTPSRyNsOQ4niprGtVgCTs5BePsD/Zdh@lists.linux.dev
X-Gm-Message-State: AOJu0YxDuhVjngT/80hmko2zwrwIqnhB0AeojkkQ1dJUdjns8h22bWen
	98bAu6T643ffY2Y+NTvtpZUnjwYhc+zvbaPWVjoHYAPIfuoAaKlzjSg/
X-Gm-Gg: AeBDietCLfp39dM4FI6VBOztqs2gj+amB7AQr4qRGVCQW9LRqQFx6bxNxE9hWitcR/t
	3I6pcBsm+lUe3z/Oj2dDzoS0YJdGJ58YPCihVFHhSlrw96l0m7U8NtSDOmbc+lzHfoG+nDspbvt
	eDb18WWbYCiXtR/pv6DhClTOcTixliwcc3UKr5a0yYWtLbocdaZMaZqp98bjJEiIZvTx+9fajXV
	YYVGz8SYb4rO0LV2Jw8e4u/fJgtWSkgyVr6ajvOb8BjeO/BpvX2TBHu7WkzqwTb0JNR/cbMDuu8
	dCbhlNlVU/h2QekGguvMlcosDES7KKlimT+BN1WikrbrQ4mV7Rw1VbuN6oWKOU5+VukqIo8OZK9
	jqw+Qursw7/m68KzVsTR0Hfm9ADymJzQSSps2tutN14Oy+H5r91cow+O/hOIfl7vgBCaS4nD8wc
	YxbMV5TrGNY5WN33LNlccwifvCyS3jkQ==
X-Received: by 2002:a05:600c:1390:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-488fb78ea6fmr613584525e9.29.1777281060727;
        Mon, 27 Apr 2026 02:11:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm928468665e9.6.2026.04.27.02.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:11:00 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:10:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Salman Alghamdi <me@cipherat.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] staging: rtl8723bs: rtw_mlme: fix lines exceeding
 100 columns
Message-ID: <ae8oIMM08ntVQFdO@stanley.mountain>
References: <20260426225552.87114-1-me@cipherat.com>
 <20260426225552.87114-3-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426225552.87114-3-me@cipherat.com>

On Mon, Apr 27, 2026 at 01:54:59AM +0300, Salman Alghamdi wrote:
> Wrap long lines and extract local variables to bring all lines
> within the 100 column limit.
> 
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---

This patch is too big and too complicated.  If you send a patch that
only adds newlines, then I have automated ways to review that but
when you're adding variables and change code to use min_t() then
it's hard to review.


>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 284 +++++++++++++++-------
>  1 file changed, 201 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 268f294528e6..cdc631464565 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
>  	pmlmepriv->pscanned = NULL;
>  	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
>  	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
> -	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
> +	/*  1: active, 0: passive. Maybe someday we should rename
> +	 *  this varable to "active_mode" (Jeff)
> +	 */
> +	pmlmepriv->scan_mode = SCAN_ACTIVE;
>  
>  	spin_lock_init(&pmlmepriv->lock);
>  	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
> @@ -125,7 +128,8 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_beacon_ie, &pmlmepriv->p2p_beacon_ie_len);
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_req_ie, &pmlmepriv->p2p_probe_req_ie_len);
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_resp_ie, &pmlmepriv->p2p_probe_resp_ie_len);
> -	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie, &pmlmepriv->p2p_go_probe_resp_ie_len);
> +	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie,
> +			      &pmlmepriv->p2p_go_probe_resp_ie_len);
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
>  }
>  
> @@ -369,7 +373,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
>  			(d_cap & WLAN_CAPABILITY_ESS));
>  }
>  
> -struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
> +struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
> +					    struct wlan_network *network)
>  {
>  	struct list_head *phead, *plist;
>  	struct wlan_network *found = NULL;
> @@ -420,7 +425,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
>  	long rssi_final;
>  
>  	/* The rule below is 1/5 for sample value, 4/5 for history value */
> -	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
> +	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
> +	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
>  		/* Take the recvpriv's value for the connected AP*/
>  		ss_final = padapter->recvpriv.signal_strength;
>  		sq_final = padapter->recvpriv.signal_qual;
> @@ -431,11 +437,15 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
>  			rssi_final = rssi_ori;
>  	} else {
>  		if (sq_smp != 101) { /* from the right channel */
> -			ss_final = ((u32)(src->phy_info.signal_strength) + (u32)(dst->phy_info.signal_strength) * 4) / 5;
> -			sq_final = ((u32)(src->phy_info.signal_quality) + (u32)(dst->phy_info.signal_quality) * 4) / 5;
> +			ss_final = ((u32)(src->phy_info.signal_strength) +
> +				    (u32)(dst->phy_info.signal_strength) * 4) / 5;
> +			sq_final = ((u32)(src->phy_info.signal_quality) +
> +				    (u32)(dst->phy_info.signal_quality) * 4) / 5;
>  			rssi_final = (src->rssi + dst->rssi * 4) / 5;
>  		} else {
> -			/* bss info not receiving from the right channel, use the original RX signal infos */
> +			/* bss info not receiving from the right channel, use
> +			 * the original RX signal infos
> +			 */
>  			ss_final = dst->phy_info.signal_strength;
>  			sq_final = dst->phy_info.signal_quality;
>  			rssi_final = dst->rssi;
> @@ -462,13 +472,18 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
>  		&pmlmepriv->cur_network.network,
>  		&pmlmepriv->cur_network.network);
>  
> -	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
> +	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
> +	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
> +		u32 ie_len;
> +		u8 *ie;
> +
>  		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
> -		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
> +		ie_len = pmlmepriv->cur_network.network.ie_length;
> +		if (ie_len < sizeof(struct ndis_802_11_fix_ie))
>  			return;
>  
> -		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
> -								pmlmepriv->cur_network.network.ie_length - sizeof(struct ndis_802_11_fix_ie));
> +		ie = pmlmepriv->cur_network.network.ies + sizeof(struct ndis_802_11_fix_ie);
> +		rtw_update_protection(adapter, ie, ie_len - sizeof(struct ndis_802_11_fix_ie));
>  	}
>  }
>  
> @@ -604,7 +619,16 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
>  	privacy = pnetwork->network.privacy;
>  
>  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
> -		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
> +		u8 *ie_ptr;
> +		u32 ie_len_val;

Why is this not call ie and ie_len like the earlier code?
Also the declarations should be in reverse Christmas tree
order.

	long long variable_name;
	medium name;
	short n;

When you start doing things which are more complicated than
just adding newlines, then it gets controversial in ways you
don't expect.  For example, we don't really use min_t() these
days.

> +
> +		if (pnetwork->network.ie_length < _FIXED_IE_LENGTH_)
> +			return false;

This is a behavior change so we can't merge it.

regards,
dan carpenter

> +
> +		ie_ptr = pnetwork->network.ies + _FIXED_IE_LENGTH_;
> +		ie_len_val = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
> +
> +		if (rtw_get_wps_ie(ie_ptr, ie_len_val, NULL, &wps_ielen))
>  			return true;
>  		else
>  			return false;

