Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567B33F166A
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422249; cv=none; b=DWTUIRROvajfaqJZQUS/hyprQXkn4THFkiA1zFLzS1LRuHfHhRdbZiJWMBCyxfhlLR2rABgzVmymNAKHlGbsEpkQPQNMrrJrJH8RtsvV1YtzZ2LLZj7D0wT+nhBrnxK/wYyFnBjfJ6bfW51/8JwQBOgmk6xuBVDc3UxO4GcylEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422249; c=relaxed/simple;
	bh=vQkfxD6dOjGfoB8J+yiOdvqI5HX4PUy55fTF6SYLPBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTYK3Ap7KNaf+XgAaJo3zdYKZ55R7Vky4OJd/Yo6swZXZqM5oBh6zBrt4n0iatrdDf8XnbgSXKmNIX6wyGDzANcH+h3iuHa4kqwRoXlL/yNwHIaFUYU3Iz6ZLOLRlckLVTzG4Uk7YQQyEHeDUSlA62Bstevrkb8VIlKXKjxkEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sb6qfoyM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sb6qfoyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AAD1F000E9;
	Tue,  7 Jul 2026 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422246;
	bh=d88mkYj+Gt29ZdZ41wb6amRjYbaNysVwW2trRD9rACE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sb6qfoyMzEUi3IUQM+SwWH+vjsMEvZ6eclo/CTE2zXSPQpZsiggxAYdr4z8/taV6R
	 v4Sl9ZR6hrp3+drEWfp9JOaXzDf6sKfroho+efXIay+sE3aNLrsWuYrXmQMMOgekGc
	 8yTQK/AISoSjQAYPJCSgw/Duz6Ms+Hp8buCfGqIg=
Date: Tue, 7 Jul 2026 13:04:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jules Debbaut <julesdebbaut@icloud.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/5] staging: rtl8723bs: fix lines exceeding 100 columns
Message-ID: <2026070752-movie-playgroup-0ebb@gregkh>
References: <20260602210407.4364-1-julesdebbaut@icloud.com>
 <20260602210407.4364-5-julesdebbaut@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602210407.4364-5-julesdebbaut@icloud.com>

On Tue, Jun 02, 2026 at 11:04:07PM +0200, Jules Debbaut wrote:
> Break long lines to fit within the 100-column limit. Extract
> local variables for repeated expressions in rtw_get_bcn_info()
> to shorten long rtw_get_ie() calls.
> 
> Signed-off-by: Jules Debbaut <julesdebbaut@icloud.com>
> ---
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 42 ++++++++++++-------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> index 7cf014e25..8f08d7e74 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -237,7 +237,8 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
>  	search_len = *ies_len - offset;
>  
>  	while (1) {
> -		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
> +		target_ie = rtw_get_ie_ex(start, search_len, eid, oui,
> +					  oui_len, NULL, &target_ielen);
>  		if (target_ie && target_ielen) {
>  			u8 *remain_ies = target_ie + target_ielen;
>  			uint remain_len = search_len - (remain_ies - start);
> @@ -274,7 +275,8 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
>  	case WIRELESS_11_24N:
>  	case WIRELESS_11BG_24N:
>  		memcpy(supported_rates, WIFI_CCKRATES, IEEE80211_CCK_RATE_LEN);
> -		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN, WIFI_OFDMRATES, IEEE80211_NUM_OFDM_RATESLEN);
> +		memcpy(supported_rates + IEEE80211_CCK_RATE_LEN,
> +		       WIFI_OFDMRATES, IEEE80211_NUM_OFDM_RATESLEN);
>  		break;
>  	}
>  }
> @@ -301,7 +303,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
>  	ie += sz;
>  
>  	/* beacon interval : 2bytes */
> -	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration.beacon_period);/* BCN_INTERVAL; */
> +	*(__le16 *)ie = cpu_to_le16((u16)pdev_network->configuration.beacon_period);
> +	/* BCN_INTERVAL; */

Comment is now in the wrong place :(

