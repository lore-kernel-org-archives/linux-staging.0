Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6B3FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 11:03:44 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso7561998wms.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+oBfSTls/jelXZfAiR3pNRnb9JU1CX2FyMD8hziKDQ0=;
        b=eYRMnopUXoYrlOmkuwqRXuHSrTRE+iwUJe3ofMMk/ZHeKJmbNCQNIDdoGD38IBvVPH
         9ulrJAjsZ6TgSQ/JVXcmkfsBeXEbVlgxJ+Fqu+zXNzUAo8nfupq0ys8fU0rP4zM4/von
         Jsxjlsp9hnwJ/jVCoHP71uZinidjHwCqPnxHbAhMV/ib58JpxX8Da1z/9gEo+bXSsHvh
         fL8Fy2hD8ZC9OXFHgWth0+FcZceisy4NEUfv2CZQW3UXm7PlgepGeHlwKWqAiyHq9aDz
         rP0nN7pAabTPOKTwUdzMQNdAv8XRUmBxefkjBkFb/gLDx/8nIcWq3SZfScL0TRjKI2f0
         rU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+oBfSTls/jelXZfAiR3pNRnb9JU1CX2FyMD8hziKDQ0=;
        b=adSdcLzje6DB7CaMCyTIaq5CvhCyzL3NfkNw9b3CuSOIMSspHKTGgSCqmJBTdRHjVO
         0NUV2mBYR6EOKME8DeXB7VaVJdik5/GuHdWVkLv5wS+tfg6WvwtwLIqLVYSrBESFMb7V
         TBzbiHCHCcw/RMqP+O3vcT8Llc2ciIy0YgiuS1ou/t7+vIm7zuiky8lYxY/k+YbBL926
         Qsqb7Ac0gKRf6jjUC7JkWfjDTiuDbkoVT3aO+4PKHAd8Q/nDyf4iT2MTykA8UmXmhVUL
         TIr4dPXklRQNqBtAUVK2/waNk22Z8E5kk9WMHiMcutVhx0105591gGRsn9JJ7qFKzDfJ
         7PyQ==
X-Gm-Message-State: AOAM532q3pwY9qFNex3mf/88Iht93JN/+/umhEMA7c24CG58/NplDNQF
	ksqv1/CA/MEz1BJxow1yt7XIRXbYawc=
X-Google-Smtp-Source: ABdhPJy2xXAhK3JwFgr+FxlHKupWZkKRxvUDlPEVUIrIJksHQ1Bq0E2IeeN5MeScrbJLV4ddgQLXTA==
X-Received: by 2002:a05:600c:2f0f:: with SMTP id r15mr8044964wmn.29.1629543822429;
        Sat, 21 Aug 2021 04:03:42 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::3c39? ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id d4sm9152919wrc.34.2021.08.21.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 04:03:42 -0700 (PDT)
Subject: Re: [PATCH v2] staging: r8188eu: change declaration of
 Efuse_Read1ByteFromFakeContent
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 martin@kaiser.cx, Larry.Finger@lwfinger.net, fmdefrancesco@gmail.com
References: <20210821105615.6307-1-phil@philpotter.co.uk>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <f151ef3c-d625-a937-2096-afae4fee20f1@gmail.com>
Date: Sat, 21 Aug 2021 13:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821105615.6307-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 12:56 PM, Phillip Potter wrote:
> Remove forward declaration of Efuse_Read1ByteFromFakeContent function
> from core/rtw_efuse.c, as the function is defined in full directly
> after this and therefore this forward declaration is redundant.
> 
> In addition, convert the storage class of the function to static, as the
> function is only used with rtw_efuse.c, and tidy up the signature
> alignment.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
> 
> V1: Removed forward declaration.
> V2: Takes account of feedback from Michael Straube and Fabio M. De
>      Francesco to make storage class of the function static.
> 
> ---
>   drivers/staging/r8188eu/core/rtw_efuse.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
> index decccf7622f0..c1c70648f5bc 100644
> --- a/drivers/staging/r8188eu/core/rtw_efuse.c
> +++ b/drivers/staging/r8188eu/core/rtw_efuse.c
> @@ -29,17 +29,9 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
>   #define REG_EFUSE_CTRL		0x0030
>   #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
>   /*  */
> -
> -bool
> -Efuse_Read1ByteFromFakeContent(
> -			struct adapter *pAdapter,
> -			u16 Offset,
> -		u8 *Value);
> -bool
> -Efuse_Read1ByteFromFakeContent(
> -			struct adapter *pAdapter,
> -			u16 Offset,
> -		u8 *Value)
> +static bool Efuse_Read1ByteFromFakeContent(struct adapter *pAdapter,
> +					   u16 Offset,
> +					   u8 *Value)
>   {
>   	if (Offset >= EFUSE_MAX_HW_SIZE)
>   		return false;
> 

Looks good to me.

Acked-by: Michael Straube<straube.linux@gmail.com>


Thanks,

Michael
