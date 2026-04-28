Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F0A3D6CB6
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367446; cv=none; b=urM2lb8dA62BuG73PYcQBpc/cHl/KIR6MJL8uJbK3UCp6mUQQMuHeB53QweEKHajMlqySgRWdZeHVu7yEZLy0Hmw1OcOS2gZXdxAYb02YcvCsE9j7ixx9jCZ7WG96P+CA/tSpCxtWQfXLxlYfMucS+AQAz4GsSDuGEvkmHFD5vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367446; c=relaxed/simple;
	bh=gMxjLYY+d7Mfh42L5/k+dwi38O9vNjl3OJme0nfjcGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qjfd/3Jw2qvcARGwezBwrP7j1r1gSIQ2GeFrRrK8GRsGHbFYTpBRCoKeqFRI0EsxoVutVkkwf7F4D7KiEi0D1acK17ATFouHihVHPMg2aATTXl9shRzfEFaXrb9iLEywugwTOkqwSKJh/VfItLscNdtMv+lFuXZ7ubox3Er849s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWIBInYl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWIBInYl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d734223e4so7527341f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367443; x=1777972243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twOwcHlElrSKVnKMflACibfDwSBuJjofr/lFeYbCIE4=;
        b=DWIBInYlefUQjDtxyDW9Sf2CiujYC6HAIyJnUBvvyE8jN25EnEh2vJ4mGjeq3D7ubm
         lryqrG0OCegrtSf8wBKLlpWjb6jDavFUD1RJ8KTLWDXvJjuZZpMxq54wjW5wN+jcY+u0
         yCbhNlO6Z0IMePcd0yRkQY6ifY2cjep/do0qs1BDZPNSoCyNa+cm7EKyBildeyX9uBGK
         aXz9zKO4XbbUIC3O8Tmjw6BkCFFU0ZEJwJwDyi/w+MQetwSyhzlG4mjWiDDWjL3Peuka
         FjMrGol5z8RXBkoVSsJXhTHR7XKT7H9D9fFjMEt2XI/HvkyFLkf9cLHFm3p9UlO8YUx3
         553Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367443; x=1777972243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twOwcHlElrSKVnKMflACibfDwSBuJjofr/lFeYbCIE4=;
        b=C6olxPQtgknLb4Q0kr+E3u3SjyPcZ/BdtVg+Z7W+PquFDv39zejyP8gco5AS6KEVDr
         XzkrXvg0MtZnkBTdrp4nSHiRHcVpejY6MYZ/xtKQGoVWbcPfv9FGYGp/EL2a8zP+S57M
         T2K3z2l3bwp3cCJDFk+oL8dl6H8UPmq+UdJFVMZMC9PD/QbQabc1iJnFqpvFij0cqYPM
         9ztspRwxdnC5dxOyPQbS6ZWaAtPCOmW/YBFZn+44Vr8HNVkRiRhY+rbZzEwoeDyJC89n
         hdHjLuP0NX9D3rkrh+VnW4pWE1A6VGV0mEwdOYkrgMoCOKeIhpX9zvZ0j39W5BFUM3uE
         G2Cg==
X-Forwarded-Encrypted: i=1; AFNElJ8XQ9Mb69iVqVeWS42wtFFqjffUNiOPeHlgLMOXwfpTOczwPyAUE6e4Xjb9cneUb++OVk8NV0s4ctyknZ2P@lists.linux.dev
X-Gm-Message-State: AOJu0YxMUD5z7cukgRlE1nS9/XsIEj8NNuvyynL5CnnawKz8vdpu0Gov
	GmDiNHhSfKCrmxfw298BRpnNmheBn+Xy0yQa7A9ceOBMJLTs/yYwGVuZ
X-Gm-Gg: AeBDietfU9jSb0fCSLwuYl20SOboD7F4b1Aiew1BO6VD4eWLg9yBAsY0Oco631LdhHs
	J2SRvT7sHbEnydDuTPA1SXmFLIYYexUDm0u49d1vJJ+MOGORNyP1yNcmP7IjYvu8RKY5J7XMCf6
	eMUc1drxN4B2X/DPmBKfsgtJyCVN2qbwWX/g4lYOdHhrCvGE8n/oDms9/2Q3g8323/x5H1vQV6Y
	+ii5mpjw8L/Rt/K5B0zX/IiqGNyxqEkCxkgMURk0c8wIVLl+pwH6B7kiRbSMg/hotD4lFE2MNuH
	+Y49dl+DDK+ARN6l1SI8jsx0lkdAJyjzkvN0JdzJncGfveMm6kWlEUGQj/Dva/jBuUEmHg6xhpu
	w6dnhP9FIlj7tSyUxvcSZYJ26tS9Nkmm9iN2q0o0y9n9WqYIy+IbN3Qntps5cgPzyGRmsGlaNAG
	gRamDvcD9f3NBkXtIF/KJg0H0XfJ1JnbPXbL/j2qPE
X-Received: by 2002:a05:6000:25f0:b0:43d:799c:b2cb with SMTP id ffacd0b85a97d-44651ff8957mr3487885f8f.24.1777367443182;
        Tue, 28 Apr 2026 02:10:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463fa890a6sm4413025f8f.30.2026.04.28.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:10:42 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:10:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Salman Alghamdi <me@cipherat.com>
Cc: gregkh@linuxfoundation.org, luka.gejak@linux.dev,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] staging: rtl8723bs: rtw_mlme: extract local
 variables for long expressions
Message-ID: <afB5jnwGX6H5j0PG@stanley.mountain>
References: <20260427190548.156499-1-me@cipherat.com>
 <20260427190548.156499-5-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427190548.156499-5-me@cipherat.com>

On Mon, Apr 27, 2026 at 10:05:32PM +0300, Salman Alghamdi wrote:
> @@ -772,9 +783,14 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
>  				rtw_indicate_connect(adapter);
>  			} else {
>  				if (rtw_to_roam(adapter) != 0) {
> -					if (rtw_dec_to_roam(adapter) == 0
> -						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
> -					) {
> +					bool roam_failed = false;
> +
> +					if (rtw_dec_to_roam(adapter) == 0)
> +						roam_failed = true;
> +					else if (rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
> +								    1, NULL, 0) != _SUCCESS)
> +						roam_failed = true;
> +					if (roam_failed) {

Just write this as:
					if (!rtw_dec_to_roam(adapter) ||
					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
							       1, NULL, 0) != _SUCCESS) {

The "roam_failed" variable isn't beautiful and the if else makes the line
five characters longer than it would be otherwise.  Eventually we'll get
rid of the _SUCCESS but I like it to look ugly so we know which code to
change.

>  						rtw_set_to_roam(adapter, 0);
>  						rtw_free_assoc_resources(adapter, 1);
>  						rtw_indicate_disconnect(adapter);
> @@ -792,8 +808,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
>  				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
>  				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
> -					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
> -						, WLAN_REASON_ACTIVE_ROAM);
> +					u8 *mac_addr = pmlmepriv->cur_network.network.mac_address;
> +
> +					receive_disconnect(adapter, mac_address,
> +							   WLAN_REASON_ACTIVE_ROAM);
>  				}
>  			}
>  		}
> @@ -1071,6 +1089,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
>  {
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
> +	u8 signal_strength = ptarget_wlan->network.phy_info.signal_strength;
>  
>  	/*  why not use ptarget_wlan?? */
>  	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.length);
> @@ -1082,12 +1101,12 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
>  
>  	rtw_set_signal_stat_timer(&padapter->recvpriv);
>  
> -	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
> +	padapter->recvpriv.signal_strength = signal_strength;
>  	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
>  	/* the ptarget_wlan->network.rssi is raw data, we use
>  	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
>  	 */
> -	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
> +	padapter->recvpriv.rssi = translate_percentage_to_dbm(signal_strength);
>  
>  	rtw_set_signal_stat_timer(&padapter->recvpriv);
>  
> @@ -1742,6 +1761,7 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
>  {
>  	int updated = false;
>  	struct adapter *adapter = container_of(mlme, struct adapter, mlmepriv);
> +	long rssi_diff;
>  
>  	if (is_same_ess(&competitor->network, &mlme->cur_network.network) == false)
>  		goto exit;
> @@ -1759,7 +1779,8 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
>  	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms)
>  		goto exit;
>  
> -	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi < mlme->roam_rssi_diff_th)
> +	rssi_diff = competitor->network.rssi - mlme->cur_network_scanned->network.rssi;
> +	if (rssi_diff < mlme->roam_rssi_diff_th)
>  		goto exit;
>  
>  	if (*candidate && (*candidate)->network.rssi >= competitor->network.rssi)
> @@ -2133,7 +2154,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
>  
>  		wrqu.data.length = p - buff;
>  
> -		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.length : IW_CUSTOM_MAX;
> +		wrqu.data.length = umin(wrqu.data.length, IW_CUSTOM_MAX);
>  
>  		kfree(buff);
>  	}
> @@ -2522,13 +2543,14 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
>  	    (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
>  	      BIT(1)) && (pmlmeinfo->HT_info.infos[0] & BIT(2))) {
>  		int i;
> +		u8 *mcs_rate = pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate;

Reverse Christmas tree.

regards,
dan carpenter

>  
>  		/* update the MCS set */
>  		for (i = 0; i < 16; i++)
> -			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= pmlmeext->default_supported_mcs_set[i];
> +			mcs_rate[i] &= pmlmeext->default_supported_mcs_set[i];
>  
>  		/* update the MCS rates */
> -		set_mcs_rate_by_mask(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS_RATE_1R);
> +		set_mcs_rate_by_mask(mcs_rate, MCS_RATE_1R);
>  
>  		/* switch to the 40M Hz mode according to the AP */
>  		/* pmlmeext->cur_bwmode = CHANNEL_WIDTH_40; */
> -- 
> 2.54.0
> 
