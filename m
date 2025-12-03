Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D721E1A17;
	Wed,  3 Dec 2025 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764746430; cv=none; b=OTzaP+HQ0njR+xFCyoPR7FoST4F9GJLTV0JXBEIICPJefaEiWp4SgZ43zM6PSklP21YLMIvXzAAUc7khhkm9zlhyQjZ/VJPDnyrcGhN+TdwdnNppX5xMrHDjWGBx5bi2Qr0BAMWiAhdpepj+SSQ9wrueknCUaJiDflDd4jjsqIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764746430; c=relaxed/simple;
	bh=I0l3c1Rh9/uFvtsAxxVp8dItPngcR3A0ruJ9UmMUpYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2jZGuRxNdWg/Qo0c0ZrMgyl/dpEGLZsZbsWHoVQi4a0nWRr0yTH8gPUcttfvDl01nwoKFBTK6NKLDwaUm1hDFOMoL6t0v6RdCBPx+K5oLqHQFNpeLBRtf1Lut9eRaLV0UPgo4pPXqQo9aLFmz1SLMl489RvzTkf4ecqIaisHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kxu7HLe6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kxu7HLe6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B6AC4CEFB;
	Wed,  3 Dec 2025 07:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764746429;
	bh=I0l3c1Rh9/uFvtsAxxVp8dItPngcR3A0ruJ9UmMUpYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxu7HLe6QVfga7eZpYVmKnClrLZdYywWOBB0Lu4MiBFmv7k1xWN7w9zcXTpjhmY5O
	 AwQzQpK8+kOFf9a2GB6292dYIVleR7rNxndUm5ukHAsfnzrc9lCysiW6T6Wtihn2y6
	 xDPXKBytMwa1oudvGy2NkJGEuT3bc9GUA378HWNA=
Date: Wed, 3 Dec 2025 08:20:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: duccdev <duccybaka@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up comments in rtw_ap.c
Message-ID: <2025120312-kitten-carnival-7325@gregkh>
References: <20251203013229.696285-1-duccybaka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203013229.696285-1-duccybaka@gmail.com>

On Wed, Dec 03, 2025 at 04:32:29AM +0300, duccdev wrote:
> Fixed 4 multi-line comments to follow kernel coding style.
> Improved clarity and fixed overly long lines reported by checkpatch.
> 
> Signed-off-by: duccdev <duccybaka@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 0908f2234f67..210fa5388a01 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -391,7 +391,7 @@ void update_bmc_sta(struct adapter *padapter)
>  
>  		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
>  
> -		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
> +		/* psta->dot118021XPrivacy is already set earlier; do not reset it here. */
>  
>  		/* prepare for add_RATid */
>  		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
> @@ -658,9 +658,11 @@ void start_bss_network(struct adapter *padapter)
>  	cur_bwmode = CHANNEL_WIDTH_20;
>  	cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
>  
> -	/* check if there is wps ie, */
> -	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd, */
> -	/* and at first time the security ie (RSN/WPA IE) will not include in beacon. */
> +	/*
> +	 * Check for a WPS IE. When WPS information is present in the beacon,
> +	 * hostapd updates the beacon twice during startup. On the first update,
> +	 * the security IE (RSN/WPA) may not yet be included.
> +	 */
>  	if (!rtw_get_wps_ie(pnetwork->ies + _FIXED_IE_LENGTH_,
>  			    pnetwork->ie_length - _FIXED_IE_LENGTH_, NULL, NULL))
>  		pmlmeext->bstart_bss = true;
> @@ -841,8 +843,16 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
>  
>  	/* beacon interval */
> -	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
> -	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short*)p); */
> +	/*
> +	 * In the beacon IE, the layout starts with:
> +	 *   - 8 bytes: timestamp
> +	 *   - 2 bytes: beacon interval
> +	 *   - 2 bytes: capability info
> +	 * rtw_get_beacon_interval_from_ie() extracts the beacon interval field.
> +	 */
> +	p = rtw_get_beacon_interval_from_ie(ie);
> +
> +	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short *)p); */
>  	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
>  
>  	/* capability */
> @@ -1147,7 +1157,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  	/*  update AP's sta info */
>  	update_ap_info(padapter, psta);
>  
> -	psta->state |= WIFI_AP_STATE;		/* Aries, add, fix bug of flush_cam_entry at STOP AP mode , 0724 */
> +	/* Aries, add, fix bug of flush_cam_entry at STOP AP mode, 0724 */
> +	psta->state |= WIFI_AP_STATE;
>  	rtw_indicate_connect(padapter);
>  
>  	pmlmepriv->cur_network.join_res = true;/* for check if already set beacon */
> -- 
> 2.52.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
