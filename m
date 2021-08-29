Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3243FC3
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 12:48:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id u14so24687744ejf.13
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fx2U/XtzQdPMmzz3ViClmHkgP7ZRkumubzXlcaMQAgc=;
        b=H7J+kJ0FaROaSAEynu14/HHVZ7CW4MZShaUQBSZW+7FzWI/CNBHzVd1d4LJS05zrT6
         QuJEJzHHbycc3CirYzrYyEIcJwA5oTcenjy+6lSvA8/X5LuLGiifCkJzQojiAuSIp+NC
         vUtR5o9YfDl4fU4U66GGLb8ukikmRFaSESPZaUhusSJWtYFQqJZ+NanVpb1bGrAjMaWt
         th/5+7jm3DxXGsrdkW5NOipxUWdbB/R7FM2QvecvM+QgUjArRWxMmCTGejJCNvZZOBFv
         d1/mfVDcf8M/UWr5R7uO2rAPvUI/IYIHaM0ya3P6q2GajyXOAG27CDIaMFifVoppyk53
         UZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fx2U/XtzQdPMmzz3ViClmHkgP7ZRkumubzXlcaMQAgc=;
        b=Np0y/r8T5cUSjR+rsmyJctxKKBD2OMjK3IFc//pdBjTMXw9tELDejiBwMXcSfrvxpN
         A1Tcmxc2dtyB5NZUyD/Td7z8TrGNNfSojbHPykPdTUd3gcdeEvjVxyj9jKIyAgo9lGjS
         gDj9qmU/bWkzxG8fD+TWCAWAY1dpzil39B6YxrbAX6kPMtYiXitC7UpOVdxhz2Y5wusg
         /IeNzAc8/V7cjvpPEyRXWrW24SUeaJO/vX4lrqVraUJthSqsmdRtISJAn3RX+eSxdq+A
         ZAgg1IG3Y3zpLeTsXen90Ob6+1GLc/wbFQe/uVU7Ra27LIDjhOPoeRD6QidYCScn4x2b
         kOIQ==
X-Gm-Message-State: AOAM530sUax19xdXMZJ9X1UgzIxKOAr0jp8cD1u0kY3xkVNtBYZFl79X
	OfVp8nBB+YkHIwx0xIVKB1Q=
X-Google-Smtp-Source: ABdhPJyQXKQ2ht5+zMqKD0ywC/NdJXwdMwtgrwZPoAVAoOQhRvOxBQyX7Sk38fQnW9SmT48k3JjPBA==
X-Received: by 2002:a17:906:3ed2:: with SMTP id d18mr19158501ejj.311.1630241288257;
        Sun, 29 Aug 2021 05:48:08 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::16fa? ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with UTF8SMTPSA id i19sm6091154edx.54.2021.08.29.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 05:48:07 -0700 (PDT)
Message-ID: <67d0244b-03d8-7775-8384-88a25b17769e@gmail.com>
Date: Sun, 29 Aug 2021 14:48:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YStM2wxtkDAnRemt@user>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YStM2wxtkDAnRemt@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/21 11:01, Saurav Girepunje wrote:
> Remove the condition with no effect (if == else) and group multiple
> cases which execute same statement in rtw_mlme_ext.c
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 5a472a4954b0..4178b3c1ff57 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -453,17 +453,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
>   		fallthrough;
>   	case WIFI_ASSOCREQ:
>   	case WIFI_REASSOCREQ:
> -		_mgt_dispatcher(padapter, ptable, precv_frame);
> -		break;
>   	case WIFI_PROBEREQ:
> -		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
> -			_mgt_dispatcher(padapter, ptable, precv_frame);
> -		else
> -			_mgt_dispatcher(padapter, ptable, precv_frame);
> -		break;
>   	case WIFI_BEACON:
> -		_mgt_dispatcher(padapter, ptable, precv_frame);
> -		break;
>   	case WIFI_ACTION:
>   		_mgt_dispatcher(padapter, ptable, precv_frame);
>   		break;
> --
> 2.32.0
> 

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
