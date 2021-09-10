Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B02A3FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 18:40:48 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id x27so5908769lfu.5
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3vkTMGrZ3SRZIZdzzIrtgXnmVKr3uAywThftSTXEpQY=;
        b=LAXyZ71WmTVjjlIkgp8qd5/MZzB4/gg+KUl/2LCXnkwX8nvBSbTc9rOwfKC+/RTmNO
         H85MliFgE2jxwO/GH5u9rg4EwIaWjNWJ+OI7pspJusPnIczEioczoCQLC5EQBWrHEQ47
         oRndC7ATCBWesElZnBlNxuxOo6IsGKuRI5gC3EwnnzR0Z0cWYLtWIOn6elhJNMb2eQbM
         mABBmosWonK0MeS+OaG4ghyk9Uh7OglgSZwm3NCl21v01BQ8zcMIEUHBXasGHPJ3Q6Iy
         rUHShIf9lgDBgVXV9jd+fNylnPcbcR6+HbI/HsaGruFrSBVGQrs9mypM1YxYt22QttGJ
         7FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3vkTMGrZ3SRZIZdzzIrtgXnmVKr3uAywThftSTXEpQY=;
        b=GDpm196tSxse1M4HrXtsSZsfcCabp19n9BLUl3RItnRC51TDC7Xv2RdLBKNk5FoQPp
         7OvsOMqWsGVFQqHW1WUZXouK8EakNobENNOaQRjicbIt3QujzRFXPjTeuapu2Bkz90Vz
         s0E+HgSaybFKNp9ni12lSEIyAwC14gBUIO8jRPap7OkEVG+ZuQscsMAaMEIQF4YVcI95
         qBff4GfKtYSuBMR8mBpexvj2JdR3orMOACwcpf0ETW807LFWIXEcRWnnnXDHxtC3UEa/
         gi9cXUTzaFE+VkEb0ErYChToqHVslK/nXQj1BCkiKzSJOEGW6UxcC0EyjO1Ob7x2KL7n
         JeqQ==
X-Gm-Message-State: AOAM532R5SdQZ+eoEw6LOPCP4PwRZw/DMcJQgo8+glck0DNzE6P1crK0
	NCDSL5ragR7cXWzOlujoE3s=
X-Google-Smtp-Source: ABdhPJz5ZkaZjWTWzzQccHlDZvXfHwAEaCrAp3HYRTEhRBJRUP/4tK6H3AmjqeACS8MXsmjj41A61g==
X-Received: by 2002:a05:6512:304b:: with SMTP id b11mr5177111lfb.502.1631299246559;
        Fri, 10 Sep 2021 11:40:46 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.70])
        by smtp.gmail.com with UTF8SMTPSA id r13sm636505ljh.61.2021.09.10.11.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 11:40:46 -0700 (PDT)
Message-ID: <dbc1947b-f9bf-c577-6b1d-c73516e7ff49@gmail.com>
Date: Fri, 10 Sep 2021 21:40:45 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] staging: r8188eu: core: remove unused variable padapter
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YTukfSY0CxowGXlQ@user>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YTukfSY0CxowGXlQ@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/21 21:31, Saurav Girepunje wrote:
> Remove unused variable padapter from mp_init_xmit_attrib().
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>

Thanks!

> ---
>   drivers/staging/r8188eu/core/rtw_mp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
> index dabdd0406f30..8ac23d2112fb 100644
> --- a/drivers/staging/r8188eu/core/rtw_mp.c
> +++ b/drivers/staging/r8188eu/core/rtw_mp.c
> @@ -75,7 +75,7 @@ static void _init_mp_priv_(struct mp_priv *pmp_priv)
>   	memcpy(pnetwork->Ssid.Ssid, "mp_871x", pnetwork->Ssid.SsidLength);
>   }
> 
> -static void mp_init_xmit_attrib(struct mp_tx *pmptx, struct adapter *padapter)
> +static void mp_init_xmit_attrib(struct mp_tx *pmptx)
>   {
>   	struct pkt_attrib *pattrib;
>   	struct tx_desc *desc;
> @@ -107,7 +107,7 @@ s32 init_mp_priv(struct adapter *padapter)
>   	pmppriv->papdater = padapter;
> 
>   	pmppriv->tx.stop = 1;
> -	mp_init_xmit_attrib(&pmppriv->tx, padapter);
> +	mp_init_xmit_attrib(&pmppriv->tx);
> 
>   	switch (padapter->registrypriv.rf_config) {
>   	case RF_1T1R:
> --
> 2.32.0
> 


With regards,
Pavel Skripkin
