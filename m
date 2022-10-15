Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61520E0
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:42:03 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bp15so11430012lfb.13
        for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3HHUyAX1B91skwUMpCNzF5YH2X1NSjsOWajnMHTyfg=;
        b=NcMgL1fI/W6UHod6hJJkyRTb5pbZ24URofllLCclllXe7jqHORqbqxW6iGd40O3Xg7
         famY83tWIAKrqDNcN8QXJj6wkJ7/a79K0Yq1+WnKVwGSysxot408y117Ox2aj5gD4Y0/
         RN9iUUOyDf010En5ysQC6HP1/j6tPdg/dv5xbWMFX58JHDO8CgB59Q8qcuF6YYnHljSq
         9NHifa8v3H8tHNP1OWXlEot0HZgc7UQYZsWk7Wv66CBoNf3wfC6oQUJ5cpONxR8v58ty
         Aj/AnDEIxc8tEWSxu6o015SNir+gQ57OrE/7hRXAW12Ti+vTd+PIY9E826aSP73/D4We
         /RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3HHUyAX1B91skwUMpCNzF5YH2X1NSjsOWajnMHTyfg=;
        b=L3UMD+iziJruyFLQsMDQh8TGeIV2Gek+cuF1PhbHBdYCeCChS83vZFXrNFj6ssAivw
         jb3GJh7M0h+3UNBUdLL+Xy33hFuyS4aj0r6/Hx/Zn/dTdpSwW6462FSv+CITJUB0JDaQ
         N8tW5WzLiNPrFZ1AWta5Ca8g8CqGiPwWvhK5BAZHffYKnfnJqSqHiW9dEIHwNouicklh
         11VKwdmppUJFPTRNfJh55f6fiqykI5CVqH+4hw4BMCcI94+odXXl7RL6xBh5eBo0abpT
         i4TPZXQh/rHm7Lg5DFkn55meNtNlsfGPRO6KtBLASnHLFZ6q20QLFXVvovi3yTC1GP2X
         VHMg==
X-Gm-Message-State: ACrzQf3DkSLTuMbmizT+iY0qiyAuzUYCyqpg5OVJT0kIlA7Zz1YjUOzp
	UwB5b9ugWw+PnWBX/YjtaFc=
X-Google-Smtp-Source: AMsMyM6Wy7WYd6X5pGMIDcG/lk2nziAz1b/YfYrOGhcYSODfIStqVlvhLSZVA8L/8ohsY/V3iTDasg==
X-Received: by 2002:a05:6512:1196:b0:4a2:4ddb:8415 with SMTP id g22-20020a056512119600b004a24ddb8415mr1139044lfr.518.1665848521488;
        Sat, 15 Oct 2022 08:42:01 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.224.165])
        by smtp.gmail.com with ESMTPSA id du13-20020a056512298d00b0048b143c09c2sm761317lfb.259.2022.10.15.08.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:42:00 -0700 (PDT)
Message-ID: <7d72c804-265e-b515-78a7-976deaa06310@gmail.com>
Date: Sat, 15 Oct 2022 18:42:00 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 03/10] staging: r8188eu: fix status updates in SwLedOff
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221015151115.232095-1-martin@kaiser.cx>
 <20221015151115.232095-4-martin@kaiser.cx>
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20221015151115.232095-4-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

Martin Kaiser <martin@kaiser.cx> says:
> Update bLedOn only if we could update the REG_LEDCFG2 register.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/core/rtw_led.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> index 4f1cad890cae..38433296d327 100644
> --- a/drivers/staging/r8188eu/core/rtw_led.c
> +++ b/drivers/staging/r8188eu/core/rtw_led.c
> @@ -43,10 +43,11 @@ static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
>   static void SwLedOff(struct adapter *padapter, struct led_priv *pLed)
>   {
>   	if (padapter->bDriverStopped)
> -		goto exit;
> +		return;
> +
> +	if (rtw_write8(padapter, REG_LEDCFG2, BIT(5) | BIT(3)) != _SUCCESS)
> +		return;
>   
> -	rtw_write8(padapter, REG_LEDCFG2, BIT(5) | BIT(3));
> -exit:
>   	pLed->bLedOn = false;
>   }
>  

If we don't always update the state then, I think, it's better to inform 
the callers about it

I guess, this won't happen often, but you are changing semantic of the 
function



With regards,
Pavel Skripkin
