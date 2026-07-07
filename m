Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA13F65E8;
	Tue,  7 Jul 2026 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423489; cv=none; b=hcSt1yy3uRub1zdo6J9gqGQjFo3SUG2opCrHcEt2e//j4noQM+i1I1ZQ7ni6eX7lkAKXjNfQHP5m07DD+UiwMUeHOA+zC4YGevDNsKoo1R5H/38587eHcyB/sHp3fsJ9Cr1qX1TXq4zLSx6sgt1nloC2HEfTqHKikf6WfuKa3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423489; c=relaxed/simple;
	bh=DmnrYG0peErF7au1eMVnD6YJFNZx2wXZmquBsi9k6rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y44jjLTjrgbPdrBsrQZmMqJPP8T8Am5HNITS2K5PNK+Frlx0ajgUajBJmI+pavc/QRF8Lr6kB5LRHiZaTwUvGQDNpv6KKfGnRlRG+UtIn7Adz+OQ/Y0t8ENnVB8Ilw6uJJD3bDivEHEvWdYfhgUQ4XBC1czx39E0GSQrDEP4fM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C1ZqpoRo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C1ZqpoRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E0D1F000E9;
	Tue,  7 Jul 2026 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423487;
	bh=JntFbbTrdJQ/oF5tAGniZk0MqKeMUfe6xUZfOW63xrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C1ZqpoRoUFPxbNK7DwJD29YLw5ZwvAmP9gUEb5AQxlVCIaWKcDVBBRvLvy63dXb9i
	 B5y1kr/7SPZCdOwQLrxH0QqH/mSXrF8HT+YhOe7cwtpqN7Wr58UFKTjks/q4D/Ua9D
	 GfU8m6AhTmCg/VL4/66NAW7JSH3GQowKv4F/Kuhg=
Date: Tue, 7 Jul 2026 13:24:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: put logical continuation on previous
 line in rtw_mlme.c
Message-ID: <2026070721-education-deafness-e902@gregkh>
References: <ajf8qOpXZ9fFFczS@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajf8qOpXZ9fFFczS@koolguy>

On Sun, Jun 21, 2026 at 03:00:56PM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> Move logical operators from continuation lines to the previous line
> to conform to the linux kernel coding style.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 4fb74729180f..e3a17b5cbbf4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -342,8 +342,8 @@ bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
>  
>  inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
>  {
> -	return (a->ssid.ssid_length == b->ssid.ssid_length)
> -		&&  !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
> +	return (a->ssid.ssid_length == b->ssid.ssid_length) &&
> +		!memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
>  }
>  
>  int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature)
> @@ -751,8 +751,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
>  		}
>  	} else {
>  		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
> -			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
> -				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
> +			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
> +			    check_fwstate(pmlmepriv, _FW_LINKED)) {
>  				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
>  					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
>  						, WLAN_REASON_ACTIVE_ROAM);
> @@ -925,8 +925,7 @@ void rtw_scan_abort(struct adapter *adapter)
>  
>  	start = jiffies;
>  	pmlmeext->scan_abort = true;
> -	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
> -		&& jiffies_to_msecs(start) <= 200) {
> +	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) && jiffies_to_msecs(start) <= 200) {

While it's great you made this change, it doesn't match up with what you
wrote in the description of the patch :(

thanks,

greg k-h
