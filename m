Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1922FAF
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:40:51 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id b15so2752286ejg.10
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l0GE7O9lgTGJhOP7fE0g74eXRovQf9cW+0IjH4bHJbA=;
        b=ccWcM8AXjUhcSVmHYJXhvqv/LY8yZJeP49V8eVhiaYYp3prmRr4Y95buOjVap82Qnm
         Ly6ZW1FBf0cex2Uknwt1nNpJazOao86lWh/iMSAO2LceYoYavdjGGXBB4cj+tTuFXty2
         GSSVwgnz/15PEL1dZggfebasIgWhnAG7ntcuexwhKGkwivGIhvnaGFArI93dvY43DAvh
         +Q0gDfNOqGua+d7TXtN3UOOExUoOdeaEEHhJf3Y8Ba/TcDABxKttWzS4XMokdHapTUsN
         ISjIH5rQ/FWKpM91ujfZpAl5dFG2sMQYAPU/6yN/DgQapBelktPlgiHG6XXfzDT4Ey38
         n7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l0GE7O9lgTGJhOP7fE0g74eXRovQf9cW+0IjH4bHJbA=;
        b=hiAydxl8cpq+/mjcciMu6XpejM3vgnfphRHTE/kY1peQeNgXonkwGbiKKfNDvmBAz1
         0DVtZAmzB8kl2uKLH8KM5iJS0r6L6yxKEUvtWSdzfasKfJYcTwej2nowDJSxc/mLXaju
         lyEtnRHnPaaMkgqzqu49lf7neu/RhFxWbmJbbKgjLGVhuxwCcXjpW858zvKeyZoT3LPH
         CqVgql0RMj1W61a3gAJYvfaJOdzyZjvCOaqIoQ1yfwYbGOHWMehuv04RpjAHQ1amPh3D
         Za8LQ7bvORrj0ZXf5lh6crupyTMaBMJVzLrkZ1/6/RssAwiNgHmjEIjSXT4JJazAIyft
         OzKw==
X-Gm-Message-State: AOAM531uDS2i4Ylxc+/wATt54Pl60di4Yop7zdgP1V2yCDQLIMSzOemN
	DQKWR+AoxErB+dqOYJuS27w=
X-Google-Smtp-Source: ABdhPJw0jFKRAtlaFluKfoZSoXIdCnCAw7WU6OmdSLXHsK9LCpQ+/d8H9b30W4RiTPTzt21up7tu1A==
X-Received: by 2002:a17:906:704e:: with SMTP id r14mr8141339ejj.293.1629268849643;
        Tue, 17 Aug 2021 23:40:49 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id c21sm2059686edv.27.2021.08.17.23.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 23:40:49 -0700 (PDT)
Subject: Re: [PATCH v3] staging: r8188eu: Remove unused including
 <linux/version.h>
To: Cai Huoqing <caihuoqing@baidu.com>, dan.carpenter@oracle.com,
 greg@kroah.com, yangyingliang@huawei.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210818063653.2851-1-caihuoqing@baidu.com>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <ccfad7c8-35df-6ffb-4bc1-d45ee59ba0e7@gmail.com>
Date: Wed, 18 Aug 2021 08:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210818063653.2851-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/18/21 8:36 AM, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it
> 
> v1->v2: remove "based on staging-next" from commit message
> v2->v3: add changelog to commit message

You should put the v1->v2 lines below the --- line, so it
will not appear in the final commit message.

> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---

--> here

>   drivers/staging/r8188eu/core/rtw_mlme.c      | 1 -
>   drivers/staging/r8188eu/os_dep/os_intfs.c    | 1 -
>   drivers/staging/r8188eu/os_dep/rtw_android.c | 1 -
>   drivers/staging/r8188eu/os_dep/xmit_linux.c  | 1 -
>   4 files changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index d5ef5783f4ad..82b74ebdaabd 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -3,7 +3,6 @@
>   
>   #define _RTW_MLME_C_
>   
> -#include <linux/version.h>
>   #include "../include/osdep_service.h"
>   #include "../include/drv_types.h"
>   #include "../include/recv_osdep.h"
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index f4bf4732578a..aef978eef4d7 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -12,7 +12,6 @@
>   
>   #include "../include/usb_osintf.h"
>   #include "../include/rtw_br_ext.h"
> -#include <linux/version.h>
>   
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
> diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
> index bdd381606ba6..af0072e2cb5f 100644
> --- a/drivers/staging/r8188eu/os_dep/rtw_android.c
> +++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
> @@ -3,7 +3,6 @@
>   
>   #include <linux/module.h>
>   #include <linux/netdevice.h>
> -#include <linux/version.h>
>   #include "../include/rtw_android.h"
>   #include "../include/osdep_service.h"
>   #include "../include/rtw_debug.h"
> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> index 4f1ce346b3a5..69966c696130 100644
> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> @@ -3,7 +3,6 @@
>   
>   #define _XMIT_OSDEP_C_
>   
> -#include <linux/version.h>
>   #include "../include/osdep_service.h"
>   #include "../include/drv_types.h"
>   #include "../include/if_ether.h"
> 

Thanks,
Michael
