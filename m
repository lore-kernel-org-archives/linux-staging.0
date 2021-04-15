Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB16D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:16:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so1992122wmf.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DeXDeXRzRy6XeBITm1wvQ0gcDeECEHBICqvLtdhOGSI=;
        b=ULxk+4yqlbHmpoJ3Qp2um9iggnfyBOrzKWB7u1KSZhsBa65PQnGBDN6jN7SH1iMOfk
         QtZHd4OazysP8bnTLU8AckxlKctvNP6DH4sfHDiIaaPrlT4QOb3voDfAFCMWjzxGh4VA
         1PS5mF0xyWCxvTcjornEABaPoCm3jXPrNW5uxDoZcgq4OXbZXTG8Rr6t6CEnAewDhoIg
         8lfz7jfWml9d1IbP+aiU0f9pw6XoEkLGgLLbVqggUwexYBAL+f6DPezbyrCBLaOWeJRj
         DEYIc7DNUiaJ824nyU+2psNISzyXIQ5u8aVVZIrq6WnRTX4Im+g7AWiz0vb05qBYMF0k
         dNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DeXDeXRzRy6XeBITm1wvQ0gcDeECEHBICqvLtdhOGSI=;
        b=hP5YCC3LOpRNagAt942YFSGUyYsD3j3YtRPDhtm8HQTc5jJrBGjk4sMjFeG4laWxiX
         n6wYe7EyXtinGdXDMDSq5gHLr9sRMbXLkjrEo+uRnnXHNwgnaXEgUo5zJ6STj7qg/q3d
         YBBXnRaqvYy9z0jYLgP0iS5OFh2ZeUla8tEHPfj4MMjndYkZTMlu8WG8Ffhoi2n90cmc
         Rr3MSX/VRn8EhTuYXsqjyYAyjJ16W7FQ+TOaczKUG2YXYkBy5qRRCpK6CgLvN6m1shPw
         g0O+mvYUH410fD3/dwdxWxRAoAQryKAqeDh9Vw4Ku/IUHxBl+xRG5ENM9SR9iP/OVSQh
         GV2w==
X-Gm-Message-State: AOAM530ecipOsMQTIGXcqqHKVuwvofIc4QBCnRVwuWYt6qDDNvcGPpIa
	K/J1FFAD1YNaTQaQKS/t7gE=
X-Google-Smtp-Source: ABdhPJwCZ9qaO20cLQTF7H4S2efkWPm+h/6++I/OvtzI19nUe/EehNvLrSrEm06Aaf37GZ6NLN/cNQ==
X-Received: by 2002:a05:600c:25ca:: with SMTP id 10mr2223182wml.0.1618478186813;
        Thu, 15 Apr 2021 02:16:26 -0700 (PDT)
Received: from agape.jhs ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id 3sm1993895wma.45.2021.04.15.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:16:26 -0700 (PDT)
Date: Thu, 15 Apr 2021 11:16:23 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stanley@BB.SD3,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 57/57] staging: rtl8723bs: hal: sdio_halinit: Remove
 unused variable 'ret'
Message-ID: <20210415091622.GC1431@agape.jhs>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-58-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210414181129.1628598-58-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 14, 2021 at 07:11:29PM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c: In function ‘CardDisableRTL8723BSdio’:
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c:881:5: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
> Cc: Stanley@BB.SD3
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> index f6d734dd1a24f..60d3d6d1ba678 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
> @@ -878,10 +878,9 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
>  {
>  	u8 u1bTmp;
>  	u8 bMacPwrCtrlOn;
> -	u8 ret = _FAIL;
>  
>  	/*  Run LPS WL RFOFF flow */
> -	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
> +	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
>  
>  	/* 	==== Reset digital sequence   ====== */
>  
> @@ -909,9 +908,8 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
>  	/* 	==== Reset digital sequence end ====== */
>  
>  	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
> -	ret = false;
>  	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
> -	ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
> +	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
>  }
>  
>  static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
> -- 
> 2.27.0
> 

perhaps it's better to check the return value and return it
to the caller if something goes wrong,

https://lore.kernel.org/linux-staging/YHQVKPOoGS3auAeQ@kroah.com/

thank you,

fabio
