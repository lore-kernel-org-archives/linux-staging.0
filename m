Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1D352C2C
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605553; cv=none; b=UMuax4lQQK/vuLJGYyvUtpZ/4r6DbZKYJitAlq7IChrI6ZrVmUxQc3XvZ9S2wGQ/C56wiLHzD4OKdv0hOlsz2hH/rpw3qjxJSPJ+3VuabmeQWzOAtjuvvty0/X5UrDEbpCrBCnwqycTH8/HT6EkZKo+kkSY0iRvCuclyf0td1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605553; c=relaxed/simple;
	bh=qMQztr31ehCLx79MeKeM95KNf1DeWlp0EuETjnVrXWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtyxIaSQgZ9afDeyrXZC3gCudPiCtshnn1xxN/LtOBsnOnNT/uqlIQILX2GBBm7IuRcXOUnccvSwgldg29lXoFW6Xosb4g1MudKe1mrZ12PKSOESyklvEsyqNPQvbIkC0AQbht4U0JfL6SulVrN+gJHCTZvh5nKnEGzta0z+KQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYYNh473; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYYNh473"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so6425795e9.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 05:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769605548; x=1770210348; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qU4jF0CQFdY1aD9mZyVAe5ktl2tg22/xPDeIqxTGTNc=;
        b=CYYNh473pDTCguZ6suB0xm6iCNT71OpLQHGmxVXiBNaYiQLatzNv+cC2kwwtsfZH2R
         ZY3iMtOcteZiWq6/M+bVjtq3KF1toZ8qTJQ+Zb7cWZiVMEgQUU+Jmukud+YUDiMadW0J
         wZICz6UER29vAjwpHedsfeosf8OFDwEiioGyTX1NBuDooPsEMC2MWBtku/qJrHyfBOEc
         +JtEYac/grVFI77wE6gArATiivn/a2GP8g4X15IRd1juaKqk9xYK4WhCYjYlapIZsMoT
         CJudyTR02kyz/B3Ncx8HvKWNvvrdTI3um3DYy3ErqWr2vb1U4IRcBZiTR7cslQE8SMMK
         sn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605548; x=1770210348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qU4jF0CQFdY1aD9mZyVAe5ktl2tg22/xPDeIqxTGTNc=;
        b=ULkwN3M9ij3CMSf/7k1atgzwYems3HtNXGCXzgTMwjhXx8EpHbyhSSaZTDK6xMtu56
         E8MYiISb+qi/mmwTIc9rjHMWzKDuswKNsPNnp7ZDAWWquRZnGKJ7a3bvwFuFndBuRDm2
         +JsLPZNjXckQ8arwXCspHhME6YcvwPIqx+yuZQOJs2E7ml/Pom4oe3vuJWzdIkacu0Ad
         4rkyT4XKwmddnGBKxQIF7+M+nDVKvnMNft0+nCi7r3XIX6qLwvIsNdABUDwUBhaQN4+v
         rXJd/IhYr3C7JYVWmIoXV/36jio4HvF8wK1RJdsl1XELGeI/OM15c/LqS91YfphCRPeY
         iwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW11UHO2HCPl6o+Rtx17LoVgK2MX4/DYIhebC8TnxNMcom9fT64AXrAEuaJl5iaeqEfLppnxmGZmv5QM4t4@lists.linux.dev
X-Gm-Message-State: AOJu0YwR1uRO+VjPFLo29ieiCVrdn0gTluGHy5E1uwRvytOwx+WMUCmn
	NW4IwLJSyVFceF5Rv1rnCkSrYxzqOj/bpD0bXOmCfNxFNF7+x9RDOKfr5utz+X99V6M=
X-Gm-Gg: AZuq6aLIefn5DaOELkjI7GAFwShze0ujKnDanXRAK1py3OIZwqROXLeszsIq+6q6qPf
	GV6RxE6HvbktlnzwtRH5jsQgmHabYCdGEEZVGOBAMDwMGhUAG9iH87gO4MNHVBeD2LSO6RGiGnx
	CZuAzouKZ0KKC2tkmuTROn2e5j1ObFZVdScLfJ2+yX9cFo+HXRa2BuIB8YLoFZvH4nAkT+gS7U4
	rJDxcFP9QZM/HrzVE3Yu5+e+lU7rb2wP4TQcmmwA7B5SJpg5INlthDwCC6J5/gvCeqcoVbl1obi
	MlJnLSEMnheP9oQcc+AGe0Utd/aJjmNn3tUCKwkw4dMaDEs0H53/KlXMBdFirOfeQ7sq24J6s7+
	pnVmasdYEDNycIzkpBCHPsWRizSjwYjcyHXqj54lh3Q1UG4pyvZiRVQtbUkZ0fBenu9LhVJKA81
	CgtXsxZFQv861eUy5d
X-Received: by 2002:a05:600c:620b:b0:47e:e981:78b4 with SMTP id 5b1f17b1804b1-48069e79968mr64084575e9.12.1769605548217;
        Wed, 28 Jan 2026 05:05:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480705956f1sm33549375e9.11.2026.01.28.05.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:05:47 -0800 (PST)
Date: Wed, 28 Jan 2026 16:05:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] staging: rtl8723bs: rename LinkDetectInfo and
 clean up related code
Message-ID: <aXoJqB23ytxSBh2l@stanley.mountain>
References: <20260127200427.3669-1-khushalchitturi@gmail.com>
 <20260127200427.3669-3-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127200427.3669-3-khushalchitturi@gmail.com>

On Wed, Jan 28, 2026 at 01:34:26AM +0530, Khushal Chitturi wrote:
> This patch renames LinkDetectInfo instance to link_detect_info and updates
> the fields of rt_link_detect_t to follow kernel naming conventions.
> Local variables in traffic_status_watchdog were also updated for
> consistency.
> 
> Related checkpatch.pl warnings triggered by the rename were also fixed.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> 
> ---
> Changelog:
> v4 -> v5: Rebased onto current staging-testing.
> v3 -> v4: Narrow rename scope to affect link detection, and adjusted
> formatting.
> v2 -> v3: Resubmitted as a versioned series.
> v1 -> v2: Corrected commit messages.
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 103 ++++++++++--------
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  15 +--
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  16 +--
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  10 +-
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c     |   4 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     |   2 +-
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   6 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   4 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme.h  |  31 ++++--
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   8 +-
>  12 files changed, 108 insertions(+), 95 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 27da987d881f..64d98761cdf3 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1130,12 +1130,16 @@ static void collect_traffic_statistics(struct adapter *padapter)
>  
>  u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  {
> -	u8 bEnterPS = false;
> -	u16 BusyThresholdHigh = 25;
> -	u16 BusyThresholdLow = 10;
> -	u16 BusyThreshold = BusyThresholdHigh;
> -	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
> -	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
> +	bool should_enter_ps = false;
> +	u16 busy_threshold_high = 25;
> +	u16 busy_threshold_low = 10;
> +	u16 busy_threshold = busy_threshold_high;
> +	bool busy_traffic = false;
> +	bool tx_busy_traffic = false;
> +	bool rx_busy_traffic = false;
> +	bool higher_busy_traffic = false;
> +	bool higher_busy_rx_traffic = false;
> +	bool higher_busy_tx_traffic = false;

You've change the types of bEnterPS, bBusyTraffic, bTxBusyTraffic etc
from u8 to bool and you've split them across multiple lines.  I wish
you would have done that in a separate patch.

This patch has a number of unrelated changes as well which I have
listed below.  They're not wrong necessarily but do them in separate
patch.

regards,
dan carpenter

>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
>  	collect_traffic_statistics(padapter);
> @@ -1145,57 +1149,61 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  	/*  */
>  	if ((check_fwstate(pmlmepriv, _FW_LINKED))
>  		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
> -		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
> -		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
> -			BusyThreshold = BusyThresholdLow;
> +		/*  if we raise busy_traffic in last watchdog, using lower threshold. */
> +		if (pmlmepriv->link_detect_info.busy_traffic)
> +			busy_threshold = busy_threshold_low;
>  
> -		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
> -		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
> -			bBusyTraffic = true;
> +		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > busy_threshold ||
> +		    pmlmepriv->link_detect_info.num_tx_ok_in_period > busy_threshold) {
> +			busy_traffic = true;
>  
> -			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
> -				bRxBusyTraffic = true;
> +			if (pmlmepriv->link_detect_info.num_rx_ok_in_period >
> +			    pmlmepriv->link_detect_info.num_tx_ok_in_period)
> +				rx_busy_traffic = true;
>  			else
> -				bTxBusyTraffic = true;
> +				tx_busy_traffic = true;
>  		}
>  
>  		/*  Higher Tx/Rx data. */
> -		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > 4000 ||
> -		    pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > 4000) {
> -			bHigherBusyTraffic = true;
> +		if (pmlmepriv->link_detect_info.num_rx_ok_in_period > 4000 ||
> +		    pmlmepriv->link_detect_info.num_tx_ok_in_period > 4000) {
> +			higher_busy_traffic = true;
>  
> -			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
> -				bHigherBusyRxTraffic = true;
> +			if (pmlmepriv->link_detect_info.num_rx_ok_in_period >
> +			    pmlmepriv->link_detect_info.num_tx_ok_in_period)
> +				higher_busy_rx_traffic = true;
>  			else
> -				bHigherBusyTxTraffic = true;
> +				higher_busy_tx_traffic = true;
>  		}
>  
>  		/*  check traffic for  powersaving. */
> -		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
> -		    (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
> -			bEnterPS = false;
> +		if ((pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period +
> +		     pmlmepriv->link_detect_info.num_tx_ok_in_period) > 8 ||
> +		    pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 2) {
> +			should_enter_ps = false;
>  
> -			if (bBusyTraffic) {
> -				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
> -					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 4;
> +			if (busy_traffic) {
> +				if (pmlmepriv->link_detect_info.traffic_transition_count <= 4)
> +					pmlmepriv->link_detect_info.traffic_transition_count = 4;
>  
> -				pmlmepriv->LinkDetectInfo.TrafficTransitionCount++;
> +				pmlmepriv->link_detect_info.traffic_transition_count++;
>  
> -				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount > 30/*TrafficTransitionLevel*/)
> -					pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 30;
> +				/* Check if traffic transition count exceeds the threshold */
> +				if (pmlmepriv->link_detect_info.traffic_transition_count > 30)
> +					pmlmepriv->link_detect_info.traffic_transition_count = 30;
>  			}
>  		} else {
> -			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount >= 2)
> -				pmlmepriv->LinkDetectInfo.TrafficTransitionCount -= 2;
> +			if (pmlmepriv->link_detect_info.traffic_transition_count >= 2)
> +				pmlmepriv->link_detect_info.traffic_transition_count -= 2;
>  			else
> -				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
> +				pmlmepriv->link_detect_info.traffic_transition_count = 0;
>  
> -			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
> -				bEnterPS = true;
> +			if (pmlmepriv->link_detect_info.traffic_transition_count == 0)
> +				should_enter_ps = true;
>  		}
>  
>  		/*  LeisurePS only work in infra mode. */
> -		if (bEnterPS) {
> +		if (should_enter_ps) {
>  			if (!from_timer)
>  				LPS_Enter(padapter, "TRAFFIC_IDLE");
>  		} else {
> @@ -1215,17 +1223,18 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  			LPS_Leave(padapter, "NON_LINKED");
>  	}
>  
> -	pmlmepriv->LinkDetectInfo.NumRxOkInPeriod = 0;
> -	pmlmepriv->LinkDetectInfo.NumTxOkInPeriod = 0;
> -	pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod = 0;
> -	pmlmepriv->LinkDetectInfo.bBusyTraffic = bBusyTraffic;
> -	pmlmepriv->LinkDetectInfo.bTxBusyTraffic = bTxBusyTraffic;
> -	pmlmepriv->LinkDetectInfo.bRxBusyTraffic = bRxBusyTraffic;
> -	pmlmepriv->LinkDetectInfo.bHigherBusyTraffic = bHigherBusyTraffic;
> -	pmlmepriv->LinkDetectInfo.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
> -	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
> -
> -	return bEnterPS;
> +	pmlmepriv->link_detect_info.num_rx_ok_in_period = 0;
> +	pmlmepriv->link_detect_info.num_tx_ok_in_period = 0;
> +	pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period = 0;
> +	pmlmepriv->link_detect_info.busy_traffic = busy_traffic;
> +	pmlmepriv->link_detect_info.tx_busy_traffic = tx_busy_traffic;
> +	pmlmepriv->link_detect_info.rx_busy_traffic = rx_busy_traffic;
> +	pmlmepriv->link_detect_info.higher_busy_traffic = higher_busy_traffic;
> +	pmlmepriv->link_detect_info.higher_busy_rx_traffic = higher_busy_rx_traffic;
> +	pmlmepriv->link_detect_info.higher_busy_tx_traffic = higher_busy_tx_traffic;
> +
> +	return should_enter_ps;
> +

Unnecessary blank line.

>  }
>  
>  static void dynamic_chk_wk_hdl(struct adapter *padapter)
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> index 587a87fbffeb..b190cb1392a0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -61,9 +61,7 @@ u8 rtw_do_join(struct adapter *padapter)
>  		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
>  		/* we try to issue sitesurvey firstly */
>  
> -		if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
> -			|| rtw_to_roam(padapter) > 0
> -		) {
> +		if (!pmlmepriv->link_detect_info.busy_traffic || rtw_to_roam(padapter) > 0) {

You've changed the == false to !.

>  			/*  submit site_survey_cmd */
>  			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
>  			if (ret != _SUCCESS)
> @@ -113,9 +111,8 @@ u8 rtw_do_join(struct adapter *padapter)
>  
>  				/* when set_ssid/set_bssid for rtw_do_join(), but there are no desired bss in scanning queue */
>  				/* we try to issue sitesurvey firstly */
> -				if (pmlmepriv->LinkDetectInfo.bBusyTraffic == false
> -					|| rtw_to_roam(padapter) > 0
> -				) {
> +				if (!pmlmepriv->link_detect_info.busy_traffic ||
> +				    rtw_to_roam(padapter) > 0) {
>  					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
>  					if (ret != _SUCCESS)
>  						pmlmepriv->to_join = false;
> @@ -374,13 +371,13 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
>  		res = false;
>  		goto exit;
>  	}
> -	if (padapter->hw_init_completed == false) {
> +	if (!padapter->hw_init_completed) {
>  		res = false;
>  		goto exit;
>  	}
>  
> -	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
> -		(pmlmepriv->LinkDetectInfo.bBusyTraffic == true)) {
> +	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) ||
> +	    pmlmepriv->link_detect_info.busy_traffic) {
>  		/*  Scan or linking is in progress, do nothing. */
>  		res = true;
>  
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 8e1e1c97f0c4..459f19e3b7fe 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1185,8 +1185,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  
>  	spin_lock_bh(&pmlmepriv->lock);
>  
> -	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
> -	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
> +	pmlmepriv->link_detect_info.traffic_transition_count = 0;
> +	pmlmepriv->link_detect_info.low_power_transition_count = 0;
>  
>  	if (pnetwork->join_res > 0) {
>  		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
> @@ -1627,7 +1627,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
>  			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
>  				goto exit;
>  
> -			if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
> +			if (pmlmepriv->link_detect_info.busy_traffic)
>  				goto exit;
>  		}
>  
> @@ -1655,12 +1655,12 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
>  	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
>  		&& !(hal_btcoex_IsBtControlLps(adapter))
>  		) {
> -		u8 bEnterPS;
> +		bool should_enter_ps;

Changes type from u8 to bool.

>  
>  		linked_status_chk(adapter);
>  
> -		bEnterPS = traffic_status_watchdog(adapter, 1);
> -		if (bEnterPS) {
> +		should_enter_ps = traffic_status_watchdog(adapter, 1);
> +		if (should_enter_ps) {
>  			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
>  			rtw_hal_dm_watchdog_in_lps(adapter);
>  		} else {
> @@ -2517,8 +2517,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
>  	struct pkt_attrib *pattrib = &pxmitframe->attrib;
>  	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
>  
> -	/* if (bmcst || (padapter->mlmepriv.LinkDetectInfo.bTxBusyTraffic == false)) */
> -	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100))
> +	/* if (bmcst || (padapter->mlmepriv.link_detect_info.tx_busy_traffic == false)) */
> +	if (bmcst || (padapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100))
>  		return;
>  
>  	priority = pattrib->priority;
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 884fcce50d9c..8eafb929938c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1522,7 +1522,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
>  	if (ignore_received_deauth == 0)
>  		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
>  
> -	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
> +	pmlmepriv->link_detect_info.busy_traffic = false;
>  	return _SUCCESS;
>  }
>  
> @@ -1574,7 +1574,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
>  
>  	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
>  
> -	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
> +	pmlmepriv->link_detect_info.busy_traffic = false;
>  	return _SUCCESS;
>  
>  }
> @@ -4776,9 +4776,9 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
>  
>  	timer_delete_sync(&pmlmeext->link_timer);
>  
> -	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
> -	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
> -	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
> +	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
> +	pmlmepriv->link_detect_info.traffic_transition_count = 0;
> +	pmlmepriv->link_detect_info.low_power_transition_count = 0;
>  
>  }
>  
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 0ef788abf403..5fab7b32d4d4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -210,7 +210,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
>  		}
>  
>  	} else { /*  from rx path */
> -		if (pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 4/*2*/) {
> +		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4/*2*/) {
>  			if (adapter_to_pwrctl(padapter)->bLeisurePs
>  			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
>  			    && !(hal_btcoex_IsBtControlLps(padapter)))
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 0a8725686721..80d0c5884a2a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -680,10 +680,10 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
>  	sz = get_recvframe_len(prframe);
>  	precvpriv->rx_bytes += sz;
>  
> -	padapter->mlmepriv.LinkDetectInfo.NumRxOkInPeriod++;
> +	padapter->mlmepriv.link_detect_info.num_rx_ok_in_period++;
>  
>  	if ((!is_broadcast_ether_addr(pattrib->dst)) && (!is_multicast_ether_addr(pattrib->dst)))
> -		padapter->mlmepriv.LinkDetectInfo.NumRxUnicastOkInPeriod++;
> +		padapter->mlmepriv.link_detect_info.num_rx_unicast_ok_in_period++;
>  
>  	if (sta)
>  		psta = sta;
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 314027ea79a4..06537f21bbe6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -1392,7 +1392,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
>  	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
>  		pkt_num = pxmitframe->agg_num;
>  
> -		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
> +		pmlmepriv->link_detect_info.num_tx_ok_in_period += pkt_num;
>  
>  		pxmitpriv->tx_pkts += pkt_num;
>  
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> index 9105594d2dde..9c84f4cf1dda 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -167,7 +167,7 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
>  	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
>  		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
>  			return true;
> -		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
> +		if (pmlmepriv->link_detect_info.busy_traffic)
>  			return true;
>  	}
>  
> @@ -364,9 +364,9 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
>  	case BTC_GET_U4_WIFI_TRAFFIC_DIRECTION:
>  		{
>  			struct rt_link_detect_t *plinkinfo;
> -			plinkinfo = &padapter->mlmepriv.LinkDetectInfo;
> +			plinkinfo = &padapter->mlmepriv.link_detect_info;
>  
> -			if (plinkinfo->NumTxOkInPeriod > plinkinfo->NumRxOkInPeriod)
> +			if (plinkinfo->num_tx_ok_in_period > plinkinfo->num_rx_ok_in_period)
>  				*pU4Tmp = BTC_WIFI_TRAFFIC_TX;
>  			else
>  				*pU4Tmp = BTC_WIFI_TRAFFIC_RX;
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 33c23b80e11b..32533a748f4d 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -202,7 +202,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>  
>  		if (
>  			(check_pending_xmitbuf(pxmitpriv)) &&
> -			(padapter->mlmepriv.LinkDetectInfo.bHigherBusyTxTraffic)
> +			(padapter->mlmepriv.link_detect_info.higher_busy_tx_traffic)
>  		) {
>  			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
>  				err = -2;
> @@ -482,7 +482,7 @@ s32 rtl8723bs_hal_xmit(
>  		(pxmitframe->attrib.ether_type != 0x888e) &&
>  		(pxmitframe->attrib.dhcp_pkt != 1)
>  	) {
> -		if (padapter->mlmepriv.LinkDetectInfo.bBusyTraffic)
> +		if (padapter->mlmepriv.link_detect_info.busy_traffic)
>  			rtw_issue_addbareq_cmd(padapter, pxmitframe);
>  	}
>  
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
> index 2a128568c6df..3cec80135fcd 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
> @@ -93,18 +93,25 @@ struct sitesurvey_ctrl {
>  };
>  
>  struct rt_link_detect_t {
> -	u32 			NumTxOkInPeriod;
> -	u32 			NumRxOkInPeriod;
> -	u32 			NumRxUnicastOkInPeriod;
> -	bool			bBusyTraffic;
> -	bool			bTxBusyTraffic;
> -	bool			bRxBusyTraffic;
> -	bool			bHigherBusyTraffic; /*  For interrupt migration purpose. */
> -	bool			bHigherBusyRxTraffic; /*  We may disable Tx interrupt according as Rx traffic. */
> -	bool			bHigherBusyTxTraffic; /*  We may disable Tx interrupt according as Tx traffic. */
> +	u32			num_tx_ok_in_period;
> +	u32			num_rx_ok_in_period;
> +	u32			num_rx_unicast_ok_in_period;
> +	bool			busy_traffic;
> +	bool			tx_busy_traffic;
> +	bool			rx_busy_traffic;
> +
> +	/* For interrupt migration purpose. */
> +	bool			higher_busy_traffic;
> +
> +	/* We may disable Tx interrupt according as Rx traffic. */
> +	bool			higher_busy_rx_traffic;
> +
> +	/* We may disable Tx interrupt according as Tx traffic. */
> +	bool			higher_busy_tx_traffic;
> +
>  	/* u8 TrafficBusyState; */
> -	u8 TrafficTransitionCount;
> -	u32 LowPowerTransitionCount;
> +	u8 traffic_transition_count;
> +	u32 low_power_transition_count;
>  };
>  
>  /* used for mlme_priv.roam_flags */
> @@ -171,7 +178,7 @@ struct mlme_priv {
>  
>  	struct ht_priv htpriv;
>  
> -	struct rt_link_detect_t	LinkDetectInfo;
> +	struct rt_link_detect_t	link_detect_info;
>  	struct timer_list	dynamic_chk_timer; /* dynamic/periodic check timer */
>  
>  	u8 acm_mask; /*  for wmm acm mask */
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 476ab055e53e..5a82279fa681 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -1232,7 +1232,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
>  		goto check_need_indicate_scan_done;
>  	}
>  
> -	if (pmlmepriv->LinkDetectInfo.bBusyTraffic == true) {
> +	if (pmlmepriv->link_detect_info.busy_traffic) {

You removed the == true.

>  		static unsigned long lastscantime;
>  		unsigned long passtime;
>  
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index f7f23d1b1709..eb1186e69bdf 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -606,11 +606,11 @@ void rtw_reset_drv_sw(struct adapter *padapter)
>  	padapter->xmitpriv.tx_pkts = 0;
>  	padapter->recvpriv.rx_pkts = 0;
>  
> -	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
> +	pmlmepriv->link_detect_info.busy_traffic = false;
>  
> -	/* pmlmepriv->LinkDetectInfo.TrafficBusyState = false; */
> -	pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
> -	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
> +	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
> +	pmlmepriv->link_detect_info.traffic_transition_count = 0;
> +	pmlmepriv->link_detect_info.low_power_transition_count = 0;
>  
>  	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
>  
> -- 
> 2.52.0
> 
