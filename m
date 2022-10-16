Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7FD7E1
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 09:13:26 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g27so12208052edf.11
        for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW3EPR5jKO70Dh7Y08XV5EJBDFeZLamcX9yvxRHs2i4=;
        b=hsuSx3BEUM9P5v4aqIgnycixlvLI9eDqSh8IjP+sM9IyK6ymwgGnjh7rpaJO/v9zRo
         Mh3Z9JeUpEWSZ/UoIqm8Xgsrju1e7huxWqWFBZ1h8/swBZiJ4z9o+hs7CiVHAe/XWWu4
         0xRsDUKffPhnpWCqJwUgPRVjbp8/J/O9h+afK6xO0nm57UE9QMLu0gXgXEDbS8SXt0qE
         DU93pzQ80P2oCxJiPZ+v4RMQqRnpR5O1/uG953H1vRvGkz7N9/3kxIYIcwQPC29RKd4J
         LApfzzmV3Sb6br91Hzqcjt43BTSWs5nTTyxBNrnMZ5HAVS5OMYKxAzRRxG9pytNDD3au
         j9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IW3EPR5jKO70Dh7Y08XV5EJBDFeZLamcX9yvxRHs2i4=;
        b=A/Mlhhb4BuG10L/VBFwfPMWOWZAMzbzLcb8R6HbSoTFIdr8mxY22JyGbtw79LrPYqC
         I0e2mZUTK30ywvWjv+WBL5KtRJ8KyDCx82MqJjL5QkOlIM2x3nn7fB9G8pMeHOFtCW9Q
         djwYpq56zBgX/sGEdWrR3U7oL4PAaDHYiXKf/Q847ohi3FkJMY4/OiLsqB6lm1AzEkrT
         9qW1vCQ1f/1iTPLOGnXg8ExvLM/pve+vkpXyulwmJuZAUSKpELeTi3hnvGYIWF1Chnla
         eCorASuRgawEg9yexzovspZ1MQKOzUTomk7g9WyaEdOqkDnZACQ+sX6Kp/WZ84cer5Wy
         DR4Q==
X-Gm-Message-State: ACrzQf1xHl/8L1b3kB04ld4ca+I5Zw0ZlcGDZ98VTlF38nOAjZiqRL0y
	voqV76nk3URyS3RUD9Br8u8=
X-Google-Smtp-Source: AMsMyM4+tZXRdieCgwmJXCZ6T/lHdCcwYAYpb4bmgHmw0RsNPyJ07FzlcUTrRXjfilxcwguaSSN7Sg==
X-Received: by 2002:a05:6402:33c4:b0:448:e63e:4f40 with SMTP id a4-20020a05640233c400b00448e63e4f40mr5382804edc.203.1665911604399;
        Sun, 16 Oct 2022 02:13:24 -0700 (PDT)
Received: from [192.168.0.100] (ip5f5abb9b.dynamic.kabel-deutschland.de. [95.90.187.155])
        by smtp.gmail.com with ESMTPSA id b29-20020a170906729d00b00782ee6b34f2sm4288914ejl.183.2022.10.16.02.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 02:13:23 -0700 (PDT)
Message-ID: <c8c03bd1-9fa4-fc79-d4fe-727753e1df2c@gmail.com>
Date: Sun, 16 Oct 2022 11:13:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 01/10] staging: r8188eu: fix led register settings
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, straube.linux@gmail.com
References: <20221015151115.232095-1-martin@kaiser.cx>
 <20221015151115.232095-2-martin@kaiser.cx>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20221015151115.232095-2-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/22 17:11, Martin Kaiser wrote:
> Using an InterTech DMG-02 dongle, the led remains on when the system goes
> into standby mode. After wakeup, it's no longer possible to control the
> led.
> 
> It turned out that the register settings to enable or disable the led were
> not correct. They worked for some dongles like the Edimax V2 but not for
> others like the InterTech DMG-02.
> 
> This patch fixes the register settings. Bit 3 in the led_cfg2 register
> controls the led status, bit 5 must always be set to be able to control
> the led, bit 6 has no influence on the led. Setting the mac_pinmux_cfg
> register is not necessary.
> 
> These settings were tested with Edimax V2 and InterTech DMG-02.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8cd574e6af54 ("staging: r8188eu: introduce new hal dir for RTL8188eu driver")
> Suggested-by: Michael Straube <straube.linux@gmail.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/core/rtw_led.c | 25 ++-----------------------
>   1 file changed, 2 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> index 2527c252c3e9..5b214488571b 100644
> --- a/drivers/staging/r8188eu/core/rtw_led.c
> +++ b/drivers/staging/r8188eu/core/rtw_led.c
> @@ -31,40 +31,19 @@ static void ResetLedStatus(struct led_priv *pLed)
>   
>   static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
>   {
> -	u8	LedCfg;
> -	int res;
> -
>   	if (padapter->bDriverStopped)
>   		return;
>   
> -	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);
> -	if (res)
> -		return;
> -
> -	rtw_write8(padapter, REG_LEDCFG2, (LedCfg & 0xf0) | BIT(5) | BIT(6)); /*  SW control led0 on. */
> +	rtw_write8(padapter, REG_LEDCFG2, BIT(5)); /*  SW control led0 on. */
>   	pLed->bLedOn = true;
>   }
>   
>   static void SwLedOff(struct adapter *padapter, struct led_priv *pLed)
>   {
> -	u8	LedCfg;
> -	int res;
> -
>   	if (padapter->bDriverStopped)
>   		goto exit;
>   
> -	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);/* 0x4E */
> -	if (res)
> -		goto exit;
> -
> -	LedCfg &= 0x90; /*  Set to software control. */
> -	rtw_write8(padapter, REG_LEDCFG2, (LedCfg | BIT(3)));
> -	res = rtw_read8(padapter, REG_MAC_PINMUX_CFG, &LedCfg);
> -	if (res)
> -		goto exit;
> -
> -	LedCfg &= 0xFE;
> -	rtw_write8(padapter, REG_MAC_PINMUX_CFG, LedCfg);
> +	rtw_write8(padapter, REG_LEDCFG2, BIT(5) | BIT(3));
>   exit:
>   	pLed->bLedOn = false;
>   }

I tested this also with a TP-Link TL-WN725N now and it works fine.

Tested-by: Michael Straube <straube.linux@gmail.com> # InterTech DMG-02, 
TP-Link TL-WN725N
