Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AD93E0245;
	Mon,  4 May 2026 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906642; cv=none; b=gyokfqOA8jCzFo4YKRZ71e7DHB8TLfkVmLnVjYr5S1OQiWcrGdoYhSTMR2d4Oi8kYr20SU451IBqVWnjaB9F882t30ceamZmSvFi8Ts4i4yJ5lhQpliudHIlKfrIfBQrzo7PZF/4sPaCLhu6qhBW5EgGxhI0SSR7yTvVH6OBhoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906642; c=relaxed/simple;
	bh=bZ60xL5GqomCBM73nZx7wpbCwMvQtggO2WCNHNRRwrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnT7WdS9LX2kLzqmI9sQHcWRZ3QdMz9j8HyRthko30bKqnz9ugOWoKTuB5NdvnaptBnG8WJa7AHdzz8wWZhHoPcxDKY0lCysyTy3Lv3BBCKw4XxCAItBlB3LkbgXMSZKwOxrVobqgwoyAVpDIBMUg6qUPuLdvlNsVq1Mx9y8UE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D/v3b7ty; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D/v3b7ty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEB7C2BCB8;
	Mon,  4 May 2026 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906642;
	bh=bZ60xL5GqomCBM73nZx7wpbCwMvQtggO2WCNHNRRwrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/v3b7tyqvvlZHAcptAZojIGR/MAMTiL7+LNw/c8/YMUEDYDTfZCBlu+BSuaAcUw2
	 X79pyMAhoJxd1lMqHkRke3muHZO+lFGZ18YlZZGAAIqrS1OFs09X6YgrjEUZFoZ3Q3
	 qg31XiX5vS2+05QAOzdDNtzKH3Cm2qaYuOAtR5Eo=
Date: Mon, 4 May 2026 16:47:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Seonbin Yoon <seonbin.yoon0@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix CamelCase variable name
 pHT_info_ie
Message-ID: <2026050446-catty-amenity-c1c1@gregkh>
References: <ae8x5glEKN_3Pnfl@stanley.mountain>
 <20260427111022.37282-1-seonbin.yoon0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427111022.37282-1-seonbin.yoon0@gmail.com>

On Mon, Apr 27, 2026 at 08:10:22PM +0900, Seonbin Yoon wrote:
> Rename variable pHT_info_ie to ht_info_ie to comply with
> kernel coding style (snake_case) and remove the unnecessary
> pointer prefix.
> 
> Fixes the following checkpatch warning:
> CHECK: Avoid CamelCase: <pHT_info_ie>
> 
> Signed-off-by: Seonbin Yoon <seonbin.yoon0@gmail.com>
> ---
> v2: Remove the 'p_' prefix from the variable name as suggested by Dan Carpenter.
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 4b4012411011..36af7d07269b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -798,7 +798,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  	int ret = _SUCCESS;
>  	u8 *p;
>  	u8 *ht_caps_ie = NULL;
> -	u8 *pHT_info_ie = NULL;
> +	u8 *ht_info_ie = NULL;
>  	struct sta_info *psta = NULL;
>  	u16 cap, ht_cap = false;
>  	uint ie_len = 0;
> @@ -1054,7 +1054,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  		       &ie_len,
>  		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
>  	if (p && ie_len > 0)
> -		pHT_info_ie = p;
> +		ht_info_ie = p;
>  
>  	switch (network_type) {
>  	case WIRELESS_11B:
> @@ -1091,7 +1091,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  
>  		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)ht_caps_ie);
>  
> -		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
> +		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
>  	}
>  
>  	pbss_network->length =
> -- 
> 2.53.0
> 
> 

Does not apply to my tree :(
