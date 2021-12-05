Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96868
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 15:22:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so8619095wme.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 07:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9rEahx2eGYTHy18kCwRl+ypwISPthXIudXILPZK+gmk=;
        b=XJo+1n6Y5eyLhaiDowlIN6GpjUZ4ep9GPiFvVkxauguigOzsSZW/eNxLzhMwKzmHCO
         BjxKBU8d6efJ2wGgpfELa/tEq80ZmOtLEb+dxoqOgxx30Et7PsQTSYm8x4OCOuI8QQtK
         3biPGl5mBx5WJkho6DUc1XUtUZAiGUN4JaEMOeOH+nOQJLCUb3Dqnrm5Vh5BD31aprj1
         0b1bITU+l9tJ3/iCwEgds5DchcP8DwBf69fXLjkt3QoQiqPtfFCZTFbU6b6TlOvCHrQD
         k3E22A4O+Lwrk9sliD27UFxq9BuqyDoUcgonWuqFvCl/E9qMbTeZMb5DRNYLmJejxwYJ
         UF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9rEahx2eGYTHy18kCwRl+ypwISPthXIudXILPZK+gmk=;
        b=4DZxJI/YVPSTdL3Cx+kZcRKxTo3uprDVu4cUJQ5BA7pAWhfdzARrM+z1YsFiDgkLej
         63+DVEKGQeN8C3+if+ysM0x/oN68alHOMx7OwXO8xmHUan2UWOY2xLvMX0FYovd4G9ej
         fOMu5sLcK80VvkXue1RTLR2bm7BlodWeIyYTevLWmpp0xmoq58eVQbYlSp2kOpvayjKY
         2C8mOfukWar+sIMc6EQYqd+AT2tdf8aKZw/6dpJOVYXTa8lmVBo4yky3fa+gEINCdYad
         cf3kfyQfMGYGruIui9mz7v5CLCOt7j7LsCh+1iROpxWuqDoSHPUWwqUqd2Pn/iOVpNhI
         rW3w==
X-Gm-Message-State: AOAM5327JnWms4LbNz+XqVrrbQ7T2K4GAbf8qWynOJOJMqaf+D5HaRSj
	WdFIEv0GvxP7YR5fckiXyLo=
X-Google-Smtp-Source: ABdhPJwjOMhpYjmJk8Dv4UtZ//nhj/kZ6EGmnIErXNUIEnYo1CTtI2GNTbX1qlWD3BBz+tTzL7BbYg==
X-Received: by 2002:a05:600c:4e07:: with SMTP id b7mr30729607wmq.16.1638717769991;
        Sun, 05 Dec 2021 07:22:49 -0800 (PST)
Received: from ?IPV6:2a02:8108:96c0:3b88::b792? ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id g13sm8136450wmk.37.2021.12.05.07.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 07:22:49 -0800 (PST)
Message-ID: <b3886219-9a24-c119-fe10-12e5e7c6b139@gmail.com>
Date: Sun, 5 Dec 2021 16:22:48 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 12/12] staging: r8188eu: hal_data_sz is set but never used
Content-Language: en-US
To: Pavel Skripkin <paskripkin@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211205135919.30460-1-straube.linux@gmail.com>
 <20211205135919.30460-13-straube.linux@gmail.com>
 <197e167b-2225-3593-dab3-4f1f61331de9@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <197e167b-2225-3593-dab3-4f1f61331de9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/5/21 15:42, Pavel Skripkin wrote:
> On 12/5/21 16:59, Michael Straube wrote:
>> hal_data_sz in struct adapter is set but never used. Remove it.
>>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   drivers/staging/r8188eu/hal/usb_halinit.c   | 1 -
>>   drivers/staging/r8188eu/include/drv_types.h | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c 
>> b/drivers/staging/r8188eu/hal/usb_halinit.c
>> index 641aaf299109..da966538596f 100644
>> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
>> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
>> @@ -1969,5 +1969,4 @@ void rtl8188eu_alloc_haldata(struct adapter *adapt)
>>       adapt->HalData = kzalloc(sizeof(struct hal_data_8188e), 
>> GFP_KERNEL);
>>       if (!adapt->HalData)
>>           DBG_88E("cant not alloc memory for HAL DATA\n");
>> -    adapt->hal_data_sz = sizeof(struct hal_data_8188e);
>>   }
> 
> Not related to your patch, but not returning an error from this function 
>   looks very dangerous to me.
> 
> adapt->HalData is used in GET_HAL_DATA() macro all across the driver 
> code and nobody checks if it valid or not. If allocation fails here, 
> than we will likely hit GPF while accessing hal_data fields.
> 
> Maybe we can embed struct hal_data_8188e instead of storing a pointer to 
> it?

Rethinking my prevoius answer, embedding struct hal_data_8188e is the
better solution I think.

Regards,
Michael
