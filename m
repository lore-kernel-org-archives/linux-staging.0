Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237C07E2
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 05:37:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id bj12so2345388ejb.13
        for <linux-staging@lists.linux.dev>; Wed, 02 Nov 2022 22:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6yuz4vaBpXGDDofkp9biEi/JZM9rALV78sm7Rm0mFs=;
        b=nIKDt+21vRMTOrnwSIevXDaFC6NEbImnogX/D4tvD0xfn1Pj7HmpQIpHuD8vZKnsjT
         tyU3gGqazU0vZWd6lemwHKRiic4xZqjRpEZYVZrDfUgzHGcky3HMFZcanNgKOuff3IcN
         Pzd+Zc0mS7047vA2ELUq+6AYPoE0NqyVpI/MWOrPMH6GOsxzYhUH8cxbFq4Us3RT2IYb
         zTJtJC0438wwYAVzf0fTckqgGlq3dT/+0U/bjLnuHWGshgUlOTNTc0Z/8Iit/UTNJaJB
         JyuD/uf2g0y5O8lWfrl5wgnZio2iHAWX6nXuJz1xV8gxqSYH8T8QuwK/cincf0Mk2XAW
         gHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6yuz4vaBpXGDDofkp9biEi/JZM9rALV78sm7Rm0mFs=;
        b=ZIdeFiAcslApvaZnftdd6XtT/mjSkYfrAQcdMQRu4cSBZhhhx91ZMJBJH6nrNHeKe9
         Oe2Xz4WzacCy36W+tZC3r2MB3zKDSiey+hqcwfZmWDfpB/CdLxfBvSo/xG7+/ve0V9Ko
         JoIO2hA8Yosun1n5Lb/9n3TtW3SNcklXtceXG7mEA37Q+ZTC9sMupWRUBfkEqh2RBRD0
         9oMOLPF0jG/EQw959gHnpt/i4nR0xAyN0ufnno8fGVPFoh05In1KyYy525tdxfJNmkgl
         IBavVrwNC/9acQK3y3sGxNBAii5oiNuOk9v9H910WFc4HsMe6gKi/+cjCRh3OWhn9q64
         SZZw==
X-Gm-Message-State: ACrzQf1IJZtBCUwzyC0nhGbbdhHhv1hQdJ4eNaVXybxIEl2XuQXCdRoi
	eo+65zm2gZKZekZzQm5DypI=
X-Google-Smtp-Source: AMsMyM40GLHvYKeS3BzkTPHm0n5pKPvj/IL9FROYw3v0be2+HGt7yHQWxBCrrmwFgnOOpHxbdPo1/A==
X-Received: by 2002:a17:907:3f95:b0:7a2:36c7:31bd with SMTP id hr21-20020a1709073f9500b007a236c731bdmr27738226ejc.353.1667453859321;
        Wed, 02 Nov 2022 22:37:39 -0700 (PDT)
Received: from [192.168.0.101] (ip5f5abb6c.dynamic.kabel-deutschland.de. [95.90.187.108])
        by smtp.gmail.com with ESMTPSA id lb18-20020a170907785200b00741a0c3f4cdsm11090ejc.189.2022.11.02.22.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 22:37:38 -0700 (PDT)
Message-ID: <2e065cba-8094-3900-67e6-3a647bec3a7c@gmail.com>
Date: Thu, 3 Nov 2022 06:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] staging: r8188eu: change return type of
 rtw_set_802_11_disassociate to void
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, paskripkin@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221102233637.6648-1-phil@philpotter.co.uk>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20221102233637.6648-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 11/3/22 00:36, Phillip Potter wrote:
> Change return type of rtw_set_802_11_disassociate to void. This function
> always returns 'true' no matter what, so there is no need to return a
> value, and no need to check for it in the two call sites within
> rtw_wx_set_mlme.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>   drivers/staging/r8188eu/core/rtw_ioctl_set.c    | 4 +---
>   drivers/staging/r8188eu/include/rtw_ioctl_set.h | 2 +-
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 6 ++----
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 

<snip>

> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -1020,12 +1020,10 @@ static int rtw_wx_set_mlme(struct net_device *dev,
>   
>   	switch (mlme->cmd) {
>   	case IW_MLME_DEAUTH:
> -		if (!rtw_set_802_11_disassociate(padapter))
> -			ret = -1;
> +		rtw_set_802_11_disassociate(padapter);
>   		break;
>   	case IW_MLME_DISASSOC:
> -		if (!rtw_set_802_11_disassociate(padapter))
> -			ret = -1;
> +		rtw_set_802_11_disassociate(padapter);
>   		break;
>   	default:
>   		return -EOPNOTSUPP;

You could also remove the ret variable and return 0 directly, since ret
is not changed anymore in the function.

regards,
Michael
