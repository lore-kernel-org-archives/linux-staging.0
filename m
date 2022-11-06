Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406B023A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 08:36:11 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id k2so23053451ejr.2
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7CekdsHq3o9kP3EBlvL2Isxys3n4Y2CKKaBFtZHFmY=;
        b=jtSJGBK1bieEG6sijFoat41fEfFt2bMDnVRsldhV8stdSoZNPoLuWbh7z3CK4+Y7IR
         9wkdJ2DUxJfe2NykXYBrOltrog2pdZWKGrm9wZ4nxQ0BAKNWVfif/rUtM1vuauQTZgd8
         tlYcF8K0dfwxamnY24gFvN77nO9Lkr89r9YvId47XIVXItBWVFrA14Q076CeVsvP+tRM
         g+WJR2rWuf7cK5w1SXeAfwL/BCR0ge33A3S29nezEwHlyhSiShREGwgE0KvIfjXHN383
         slF34HDr++WiyETl3eATA76SdLZqszMbDPpzfTiP7SfKwQ9QFWHRXbH4ZUQLpt1StUcn
         7ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7CekdsHq3o9kP3EBlvL2Isxys3n4Y2CKKaBFtZHFmY=;
        b=HpTdMR68HGXlnHNVuA18+MvX5efVLrDUSUpiFdXFerl9RiDuer9ff9eIqp8rr2wijI
         JX+/9n+r3JolQaMtZO2nuuWn+jymw4R2axnZI9RA+SmQfn1VBe9wKUBuPnj5Dt9AUie+
         q0nFXr9rjwr51/rgxbnrdNOUqgyMsW67wzRSeZN4LYOmGM2QA+C9Ar6y4nJxiLv6DeCO
         O3PsB6qt+tcKDh7U1skNPSmJPwztXCqBi+NUJRUEOnphukgB57qO3K6RZ46GCmhZC+p0
         WqFpxf0XlLQKzVfr/RsQnEA5p7D0Ql7Vr2YeaQzx3M/7i53b9CWNHp7+aHp/JEMEfMEI
         Wc5w==
X-Gm-Message-State: ACrzQf3wk/ZJYeS2b8+2WzMrk+dy4v7YQtOs5wR8OXIE33g6Z9m9gJVc
	5pUYiSYz01QFoFnCNExM8pE=
X-Google-Smtp-Source: AMsMyM6O6gGj9j+axrISZpxtKlQI88MGa12/mobBrIOrm3TgGf5zFgJsDuMWH59fCp5ujW0QwWLbpA==
X-Received: by 2002:a17:907:1def:b0:7ad:9673:8668 with SMTP id og47-20020a1709071def00b007ad96738668mr41376461ejc.698.1667723769523;
        Sun, 06 Nov 2022 01:36:09 -0700 (PDT)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id g26-20020a056402321a00b00463bc1ddc76sm2314024eda.28.2022.11.06.01.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:36:09 -0700 (PDT)
Message-ID: <9d8ed71b-abee-bc3e-df66-fc9d8d498d1d@gmail.com>
Date: Sun, 6 Nov 2022 09:36:08 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: convert three functions to bool
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221105093916.8255-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221105093916.8255-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/22 10:39, Michael Straube wrote:
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
>   drivers/staging/r8188eu/core/rtw_wlan_util.c   | 18 +++++++++---------
>   drivers/staging/r8188eu/include/rtw_mlme_ext.h |  6 +++---
>   2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> index e50631848cab..c95438a12b59 100644
> --- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
> +++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> @@ -331,35 +331,35 @@ u16 get_beacon_interval(struct wlan_bssid_ex *bss)
>   	return le16_to_cpu(val);
>   }
>   
> -int is_client_associated_to_ap(struct adapter *padapter)
> +bool is_client_associated_to_ap(struct adapter *padapter)
>   {
>   	struct mlme_ext_priv	*pmlmeext;
>   	struct mlme_ext_info	*pmlmeinfo;
>   
>   	if (!padapter)
> -		return _FAIL;
> +		return false;
>   
>   	pmlmeext = &padapter->mlmeextpriv;
>   	pmlmeinfo = &pmlmeext->mlmext_info;
>   
>   	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
>   		return true;
> -	else
> -		return _FAIL;
> +
> +	return false;
>   }
>   
> -int is_client_associated_to_ibss(struct adapter *padapter)
> +bool is_client_associated_to_ibss(struct adapter *padapter)
>   {
>   	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
>   	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
>   
>   	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
>   		return true;
> -	else
> -		return _FAIL;
> +
> +	return false;
>   }
>   
> -int is_IBSS_empty(struct adapter *padapter)
> +bool is_IBSS_empty(struct adapter *padapter)
>   {
>   	unsigned int i;
>   	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
> @@ -367,7 +367,7 @@ int is_IBSS_empty(struct adapter *padapter)
>   
>   	for (i = IBSS_START_MAC_ID; i < NUM_STA; i++) {
>   		if (pmlmeinfo->FW_sta_info[i].status == 1)
> -			return _FAIL;
> +			return false;
>   	}
>   	return true;
>   }
> diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> index e234a3b9af6f..7652e72a03f4 100644
> --- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> +++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> @@ -432,9 +432,9 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
>   u8 *get_my_bssid(struct wlan_bssid_ex *pnetwork);
>   u16 get_beacon_interval(struct wlan_bssid_ex *bss);
>   
> -int is_client_associated_to_ap(struct adapter *padapter);
> -int is_client_associated_to_ibss(struct adapter *padapter);
> -int is_IBSS_empty(struct adapter *padapter);
> +bool is_client_associated_to_ap(struct adapter *padapter);
> +bool is_client_associated_to_ibss(struct adapter *padapter);
> +bool is_IBSS_empty(struct adapter *padapter);
>   
>   unsigned char check_assoc_AP(u8 *pframe, uint len);
>   
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
