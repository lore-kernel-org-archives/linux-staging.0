Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C83E185B
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 11:07:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y16so10094490wrt.12
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Esm2JJwSNEtII9L8+muwgLgVSZNMbFgxAhVuFsoBzJo=;
        b=c5+aIiBdvqAKKrDFxzewBNxEU0MCXXczY9NEnI9ntcRQWR59O6mh3ZcLogXk+k5/s7
         TUw5r7fWxjURengwrylerkNusffeCAOXcfnIyj48vVJyTaSc6jX/XFLPP1z3GDjUdrM0
         BBzo8BfXgu6GNnp+iiwJCrdq+f6S2BOURpsDs5iWyki6KCspnwh0tvPNNuJoQxzPxoQv
         VE7knBtABQyBW4C7Zpe6kgoWLNH2V7THs63pkR+wS79sq77bePn3OrBm9SKvrguZt762
         tnNvjPRFUdU8kdM1Kc/UjccG6GuNamLgeevFqMtRPwlUVVRLGscaMa1YdUNRD1jT60hx
         LshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Esm2JJwSNEtII9L8+muwgLgVSZNMbFgxAhVuFsoBzJo=;
        b=QgK01paYrelKLt75a/NCBntLzeB0nMF9KK6t0PgEfuDgrPMpK+bAUiOpkq7dG+Pk3G
         uPknaaPtH8bQ0pkwdgD4cu716LcjVIFtNe5CckBDxKbOPcpTkiP06wWIOfz+ybxR+uTb
         EJ9/xy1FW9GPo9E9Jl62cbyHkyAjwIBdAzjBRfgV9tafQ3KQMcPEZ3ckB5s/eEHOVYS/
         5aFVwENFY/pOvfAD5w6x+jO3CmKts2q+jWSK+oYpmMSHyj//tStNHDuLTHHbpalVQqFc
         WYF0MdZi+PfXtpaW2K7CB0wwAN5S1IrmYPXbZbxvjBwEqBX7cbEk02klj7MR7/jnyGzZ
         /42Q==
X-Gm-Message-State: ACrzQf2TxNkq9E5FH8Dru+2gfBgoMftxeYTch3nbsBkFLosJDdm2MAEQ
	/Cs0kRMmYIVex/tTDV37mreykA==
X-Google-Smtp-Source: AMsMyM6bWqNuvE/LnoopQ1YGfhnMh3Fy0fDRMD4RQRLm7T1BJFBq0X19aIWJyJU5F5wGAB58SPrnKA==
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id b14-20020adfe64e000000b0023676a90446mr26046252wrn.696.1667646418698;
        Sat, 05 Nov 2022 04:06:58 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id iv9-20020a05600c548900b003cf87623c16sm6196172wmb.4.2022.11.05.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 04:06:58 -0700 (PDT)
Date: Sat, 5 Nov 2022 11:06:56 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: convert three functions to bool
Message-ID: <Y2ZD0B6bsDbdpa6A@equinox>
References: <20221105093916.8255-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105093916.8255-1-straube.linux@gmail.com>

On Sat, Nov 05, 2022 at 10:39:16AM +0100, Michael Straube wrote:
> The functions
> 
> is_client_associated_to_ap()
> is_client_associated_to_ibss()
> is_IBSS_empty()
> 
> return boolean values. Convert their return type to bool and replace
> _FAIL, which is defined as 0, with false. Another step to get rid of
> _SUCCESS / _FAIL.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_wlan_util.c   | 18 +++++++++---------
>  drivers/staging/r8188eu/include/rtw_mlme_ext.h |  6 +++---
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> index e50631848cab..c95438a12b59 100644
> --- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
> +++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> @@ -331,35 +331,35 @@ u16 get_beacon_interval(struct wlan_bssid_ex *bss)
>  	return le16_to_cpu(val);
>  }
>  
> -int is_client_associated_to_ap(struct adapter *padapter)
> +bool is_client_associated_to_ap(struct adapter *padapter)
>  {
>  	struct mlme_ext_priv	*pmlmeext;
>  	struct mlme_ext_info	*pmlmeinfo;
>  
>  	if (!padapter)
> -		return _FAIL;
> +		return false;
>  
>  	pmlmeext = &padapter->mlmeextpriv;
>  	pmlmeinfo = &pmlmeext->mlmext_info;
>  
>  	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
>  		return true;
> -	else
> -		return _FAIL;
> +
> +	return false;
>  }
>  
> -int is_client_associated_to_ibss(struct adapter *padapter)
> +bool is_client_associated_to_ibss(struct adapter *padapter)
>  {
>  	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
>  	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
>  
>  	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
>  		return true;
> -	else
> -		return _FAIL;
> +
> +	return false;
>  }
>  
> -int is_IBSS_empty(struct adapter *padapter)
> +bool is_IBSS_empty(struct adapter *padapter)
>  {
>  	unsigned int i;
>  	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
> @@ -367,7 +367,7 @@ int is_IBSS_empty(struct adapter *padapter)
>  
>  	for (i = IBSS_START_MAC_ID; i < NUM_STA; i++) {
>  		if (pmlmeinfo->FW_sta_info[i].status == 1)
> -			return _FAIL;
> +			return false;
>  	}
>  	return true;
>  }
> diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> index e234a3b9af6f..7652e72a03f4 100644
> --- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> +++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> @@ -432,9 +432,9 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
>  u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork);
>  u16 get_beacon_interval(struct wlan_bssid_ex *bss);
>  
> -int is_client_associated_to_ap(struct adapter *padapter);
> -int is_client_associated_to_ibss(struct adapter *padapter);
> -int is_IBSS_empty(struct adapter *padapter);
> +bool is_client_associated_to_ap(struct adapter *padapter);
> +bool is_client_associated_to_ibss(struct adapter *padapter);
> +bool is_IBSS_empty(struct adapter *padapter);
>  
>  unsigned char check_assoc_AP(u8 *pframe, uint len);
>  
> -- 
> 2.38.0
> 

Hi Michael,

Thanks for the patch. Just my personal opinion, but I would prefer to
keep the return type as int, and have 0 for success and then _FAIL
replaced with an appropriate error code depending on the circumstance,
(e.g. -ENOMEM). This is generally the convention elsewhere in the
kernel. Others may not agree though.

All the best,
Phil
