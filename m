Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EDEA2C
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 05:36:15 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id dv25so61845216ejb.12
        for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 22:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yg99Um8d4jt64FWgHGDUMNsUzte0vMXpvNDgCLw++4A=;
        b=hFJqUgf2XKWeSq36EsXW9QHsjKLUgSVuxKV/NF6MVOHMD1+PdwVQ3iC6n50Q2IDfNO
         5BXO9qATcm7dOcWNYpktwz1WMNtSdUd0pdrtU6Nx0xgc/EyVKCynx4cuHNbzxFG7a28u
         LXHtRRWkNcxiJTVdvfkK3yyPTnu9YhJy++qPIoNNtCoSX6/h3sd/A7AsfCAVMrzm2med
         VsdluvF/lkVC7z90c1GIP6kYIPczbokJDIGJ89ptoM/gB5bQ8EHN2mi0joapuwY8cNYP
         ru+kKe3Tf8JuGffGy1ZXafQXldHkkif4uNWjuDfNCPbcPL6Ez/da8LvydviTFz8k4enj
         uwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yg99Um8d4jt64FWgHGDUMNsUzte0vMXpvNDgCLw++4A=;
        b=bGR/7S63z1gkxNet2DdpkzgIxzYHL/xZk6DEDKkNe5ZFTT2V+Utd7xQsulT6rqM2SU
         +5mKkPD9McbpOD0lkpsVPhYbUnRULDLV1B0y1duo7qrRK7K6fHzHNJZLTyka4jZ64GTI
         I/6uV2kjtKDTvPdsX+xFeVRPtpPq+NwFr4v5N44sQcCk+ff0h4GguQtwrI4nPms7Vt+7
         Ii6Q36JrFPDDZYzi+hBatZg1WLKqbjG27xDstmI8AEATeAn6XjdFELDoHri95DpI4QtT
         l625rAmqev4H1GRj+iqzemN5QhGqPiMpALD3LC8C0Xmmju/RwMmeTpmBX7c/LPuvlMrO
         TcDw==
X-Gm-Message-State: ACrzQf2RXOvowmhmJDa5WfBzquNtdGfRfPh01IJHntuyGMoS8+Pl5Npx
	mrwYpyXKTUNgfofuTfBlarQ=
X-Google-Smtp-Source: AMsMyM4XF8gtvbv4+z2G0MzqTKOsCMRQ/B6fKxehQZaawAsX8vvHIyO+2b6TzdoxC544j8HCDPXrlA==
X-Received: by 2002:a17:906:eecb:b0:73c:5bcb:8eb3 with SMTP id wu11-20020a170906eecb00b0073c5bcb8eb3mr11704435ejb.284.1663565773503;
        Sun, 18 Sep 2022 22:36:13 -0700 (PDT)
Received: from [192.168.0.100] (ip5f5abb62.dynamic.kabel-deutschland.de. [95.90.187.98])
        by smtp.gmail.com with ESMTPSA id g1-20020a17090604c100b0078027e6e92csm8544982eja.84.2022.09.18.22.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 22:36:12 -0700 (PDT)
Message-ID: <8b17ac60-b2ec-26eb-d82c-9770e9733cdf@gmail.com>
Date: Mon, 19 Sep 2022 07:36:11 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/6] staging: r8188eu: remove duplicate bSurpriseRemoved
 check
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220918175700.215170-1-martin@kaiser.cx>
 <20220918175700.215170-6-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220918175700.215170-6-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/22 19:56, Martin Kaiser wrote:
> We don't have to check bSurpriseRemoved in the SwLedOn function.
> 
> SwLedOn calls rtw_read8 which in turn calls usb_read. This function checks
> bSurpriseRemoved for us.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/core/rtw_led.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
> index 744247af5956..989808a2b171 100644
> --- a/drivers/staging/r8188eu/core/rtw_led.c
> +++ b/drivers/staging/r8188eu/core/rtw_led.c
> @@ -35,7 +35,7 @@ static void SwLedOn(struct adapter *padapter, struct led_priv *pLed)
>   	u8	LedCfg;
>   	int res;
>   
> -	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
> +	if (padapter->bDriverStopped)
>   		return;
>   
>   	res = rtw_read8(padapter, REG_LEDCFG2, &LedCfg);

Hi Martin,

same could be done in SwLedOff.

regards,
Michael
