Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFA29CA
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 11:57:33 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id y16-20020a05600c17d000b0030db7a51ee2so4228136wmo.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KTUXxm7XcmuhId9PdFaJGE2BUd7Idqxheq/X+bEr7U4=;
        b=YEtOfCJKUCLQ+wLFNEaQGVr88IHegrLP6Mj1B9XjEoVOCi9eMZWInaQ5uQdN1irtxf
         IQ32nbPmDHy+reY2nCrtev/BjDHQ7nbvto+jIPazHGOnDatQrlmFSAFqiTB7xX00WddT
         eohkCT+pYXb/ZUxgO7of06DnIPqei8zGOe7LQaVzJ0qS7H7JUlpzdmcCEniQn07qDy/P
         wRrDX2QKvWR1OmffcehOgvgBjN0V/0FO9jn3MF27XDwyOq09TaPn2CCxwp1wXbLl5sjp
         55C8G2XjGmirHfnzHAi4C8o3PDDiBWCdTWH4CcAVMW3RiW7KAFdNmXpdk+XBbmGAn2Nk
         hXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KTUXxm7XcmuhId9PdFaJGE2BUd7Idqxheq/X+bEr7U4=;
        b=gxZ2ir5gvk2KvFdd6uY3yJBox87rulOLoAQ/ROIfBWTpkwPeczYgMN91m7K9E21KgG
         Cv4wWLVeS0GAgPyCk+q2PPMk5b60OesS38Rddo6bT0S+Yebfez94pzmfODluD1uOSdYz
         sD7WBfaKiiroUCdKg+2EQEQCHyoAbNUHi7H7JbWwIOfGNcdDGEIUGwQ+kbmur5fgM9g7
         hAk7XjB3XOgJpp+JUC67mEm+Ss1KkeGqTgKtiVBgCLwdb6JL3oS/mnyqSDxiJipv87Cs
         Q2sm/D+0+5tqiy3dbsjNjm6hcN7Mk2ic75A1rNUk8q2nllPWn4X1L62eRSxPhqxz6i6A
         5F+g==
X-Gm-Message-State: AOAM533JlhCrnxaopR81o7BvvvUz9Ec22YlyqTsZ2pd8AM+RnE5bwEV3
	w2h545sc8PkhqAfQU9uqr08=
X-Google-Smtp-Source: ABdhPJxRX9wwXaN1s71eQ2hYKwTnVO3d7AzM8rhtf/44vQJ6ejDN/nOOSwDV0d0Jr2Q473PEmC83Ng==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr38350061wmh.23.1634471851865;
        Sun, 17 Oct 2021 04:57:31 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id z8sm9783706wrq.16.2021.10.17.04.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 04:57:31 -0700 (PDT)
Message-ID: <4a496b20-21bc-890b-54bc-a2358932b1ba@gmail.com>
Date: Sun, 17 Oct 2021 13:57:30 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 8/8] staging: r8188eu: CurrentWirelessMode is not used
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016113008.27549-1-martin@kaiser.cx>
 <20211016113008.27549-9-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016113008.27549-9-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 13:30, Martin Kaiser wrote:
> CurrentWirelessMode in struct hal_data_8188e is not used. Remove the
> component and the enum with its possible values.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 8 --------
>   drivers/staging/r8188eu/include/rtl8188e_hal.h   | 1 -
>   2 files changed, 9 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> index 58377edf724d..6f901ce607e8 100644
> --- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> +++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
> @@ -48,14 +48,6 @@ enum rf_radio_path {
>   						 * total three groups */
>   #define CHANNEL_GROUP_MAX_88E		6
>   
> -enum wireless_mode {
> -	WIRELESS_MODE_UNKNOWN = 0x00,
> -	WIRELESS_MODE_B			= BIT(0),
> -	WIRELESS_MODE_G			= BIT(1),
> -	WIRELESS_MODE_AUTO		= BIT(5),
> -	WIRELESS_MODE_N_24G		= BIT(3),
> -};
> -
>   /* BB/RF related */
>   enum RF_TYPE_8190P {
>   	RF_TYPE_MIN,		/*  0 */
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> index 5fdee1c6299c..ced7e12d9013 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> @@ -162,7 +162,6 @@ struct hal_data_8188e {
>   	u8	PGMaxGroup;
>   	/* current WIFI_PHY values */
>   	u32	ReceiveConfig;
> -	enum wireless_mode CurrentWirelessMode;
>   	enum ht_channel_width CurrentChannelBW;
>   	u8	CurrentChannel;
>   	u8	nCur40MhzPrimeSC;/*  Control channel sub-carrier */
> 

Acked-by: Michael Straube <straube.linux@gmail.com>
