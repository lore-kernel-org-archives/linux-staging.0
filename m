Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303583FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 15:42:24 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y34so15209191lfa.8
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SpcuN/bsBI9VgmAGMIaDIULTEIAi8qlWKPc1ViB4NNI=;
        b=dRCaFrflWTRbihaNb7HXDF6iyIdI8YmmqAmu6KeVTTA6J50Qi5cNSFkvrR9lOhjY8f
         /d4t5+Fht6ECAKE50zOW+2zogeAEKbBES34vg3Lsofd5Ges+GsEG0wL7jbN5WDrKgR0J
         WxD8c852WfVA47i21P/i9eQVSiwzXfQ+EPVZEDVww+6KN5rP3xuno2P6/idqCiPFZRAk
         +tsxOo5g7GA5AXT1SEMEHgAFsDlyi2ldlGm1PuMrMw8HiV6KBiOIIqfQSpcNNDyjq5Zl
         7/can9T9497no7MFmFcBS4z+slAePWbwNtGj1HlFjWIs7GjPcC4iQcFxwykP7gdIz4Yx
         T/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SpcuN/bsBI9VgmAGMIaDIULTEIAi8qlWKPc1ViB4NNI=;
        b=OdMN7DJQP6lyNltrMPnju+5Q5OeGH/fVMmCum8VcOs6wEqLIP0J60FjNrVuWrNDaHl
         /HJGGU0tSpUE+JvR+DQlP0/uc6YB/QCmAycKTOLONKfJIG0jWkvV1Bo9ODDDhQNNFpW7
         Verf9/CX3h6dQb28l5RuWgJPtS5zlyGSiyDwbPDnPQe91MLwjj9P7TNTYEmOnnkwBV3U
         vVYVZW7z3ZAKsrqXNLNuagzZIwkbKDsGFWy0MJYEv8MDi2BdBubosjaNBgnzspDD3AXP
         fUUon6LoPvyxOdve86zGwKBq6DYJNTbZNaIltPI/XV0ptbSbKX8lBVw+MDI7MukJizrg
         Yo5A==
X-Gm-Message-State: AOAM532goYGH16K4YOI9PbjpkCoG3ZBn6PAofMIysbVIMDIo5sXm5ueC
	0hbg6HUz5pgF4vPXsnPtl9g=
X-Google-Smtp-Source: ABdhPJyvvu5TfPC7zdfGAANRw/Mr8Wti/DxRpQQJsJ9kmy0sVZm1C+zqCvI8clzw98XJMj2+Qyd0QQ==
X-Received: by 2002:a05:6512:ad6:: with SMTP id n22mr7616497lfu.532.1630078942153;
        Fri, 27 Aug 2021 08:42:22 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id a13sm716270ljn.120.2021.08.27.08.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 08:42:21 -0700 (PDT)
Subject: Re: [PATCH linux-next] drivers:r8188eu: remove unneeded variable
To: CGEL <cgel.zte@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jing Yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
References: <20210825061531.69678-1-deng.changcheng@zte.com.cn>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <68520ae2-23a8-7948-7feb-aa9a69cc0c59@gmail.com>
Date: Fri, 27 Aug 2021 18:42:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210825061531.69678-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/21 9:15 AM, CGEL wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Eliminate the following coccicheck warning:
> ./drivers/staging/r8188eu/os_dep/os_intfs.c:505:6-12:
>   Unneeded variable "status". Return "_SUCCESS" on line 577
> ./drivers/staging/r8188eu/os_dep/os_intfs.c:772: 4-7:
>    Unneeded variable "ret". Return "_SUCCESS" on line 818
> ./drivers/staging/r8188eu/os_dep/os_intfs.c:823:4-8:
> Unneeded variable "ret8". Return "_SUCCESS" on line 849
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
> ---
>   drivers/staging/r8188eu/os_dep/os_intfs.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 9d7d2b9..8436a43 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -502,7 +502,6 @@ void rtw_proc_remove_one(struct net_device *dev)
>   
>   static uint loadparam(struct adapter *padapter,  struct  net_device *pnetdev)
>   {
> -	uint status = _SUCCESS;
>   	struct registry_priv  *registry_par = &padapter->registrypriv;
>   
>   	GlobalDebugLevel = rtw_debug;
> @@ -574,7 +573,7 @@ static uint loadparam(struct adapter *padapter,  struct  net_device *pnetdev)
>   	snprintf(registry_par->if2name, 16, "%s", if2name);
>   	registry_par->notch_filter = (u8)rtw_notch_filter;
>   
> -	return status;
> +	return _SUCCESS;
>   }
>   

I suggest to make this function return void instead of always returning 
success

>   static int rtw_net_set_mac_address(struct net_device *pnetdev, void *p)
> @@ -751,7 +750,6 @@ void rtw_stop_drv_threads(struct adapter *padapter)
>   
>   static u8 rtw_init_default_value(struct adapter *padapter)
>   {
> -	u8 ret  = _SUCCESS;
>   	struct registry_priv *pregistrypriv = &padapter->registrypriv;
>   	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
>   	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -797,12 +795,11 @@ static u8 rtw_init_default_value(struct adapter *padapter)
>   #ifdef CONFIG_88EU_P2P
>   	padapter->bShowGetP2PState = 1;
>   #endif
> -	return ret;
> +	return _SUCCESS;
>   }

same

>   
>   u8 rtw_reset_drv_sw(struct adapter *padapter)
>   {
> -	u8	ret8 = _SUCCESS;
>   	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>   	struct pwrctrl_priv *pwrctrlpriv = &padapter->pwrctrlpriv;
>   
> @@ -828,7 +825,7 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
>   
>   	rtw_set_signal_stat_timer(&padapter->recvpriv);
>   
> -	return ret8;
> +	return _SUCCESS;
>   }
>   
>   u8 rtw_init_drv_sw(struct adapter *padapter)
> 

same




With regards,
Pavel Skripkin
