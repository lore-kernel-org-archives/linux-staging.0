Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3222C80
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 08:38:40 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id b1so69514294lfs.13
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 00:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gzuYTHikBe26I+lZwL81eSuxVz26qz/YlIXM31Ln6EI=;
        b=Lgus0m/stliOjA3sXKPX3rz6SfPPwsbK9f3zkWF7l2U001fYRg2xWti2N18mQOyk6u
         R4nm0u6YyQlcxj8rotcePby74gjzAPhBXfnZTr3tOkg/RUJuWAJMOpFhu8rNL/i7M4jK
         aSp+ETEdAYIk9LX6W5WeiryQPnPKBXMqIJww8PR8dANL6Vg3wEopLJwTAt4CUniDwuyq
         ihfSBzj3dJkwzLV2r+8efgFkzbK1YKA/ei1vvL2NBDrMPPRgGCAAesdEnU6s9vhS+Y0A
         ximJxMG1hfRIRoUpwQHiG1ZOZ0oYKjQWs94zVeSvvIwE7FequCP+m5M9oqCHAqGdE0Hb
         GMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gzuYTHikBe26I+lZwL81eSuxVz26qz/YlIXM31Ln6EI=;
        b=DQuY3t5ILU7VXxRdLJ8pJJON18sSPdQnYBAA3fsWAsfvR4D8iA61ZNw6Dlc7IRj/J6
         Ie0qE9wHmQxjLXaH/62v6BxKVP1aFNO3rKD/9knEnAHFi0iwvwWoK55hWSNovfWdkomf
         /l+n8eiemel/I0jOw8475M3XlZD8f4DdblGmxW/W8A0MN1eSuN4Bp9+hhxYL1eIp0am4
         swGIxVHFm33y3ahGIhrEqTkiSmPKB0MqSh4cnN46Hnwg0VysWQz/uKwPpSP8Aj/tXD/d
         Kon+jXL0gr2pxeJIQtiJ6tyPK3EJ3mKjyrGvoBX8DnSMJvVo5XZwJO080TorRIhJ1mtR
         qZDw==
X-Gm-Message-State: AOAM533PsuhXS+kr6CXWZvE1XboNMAo/CXtPoNqYWhk3ZklQ20C9yRtr
	euDYAuZqSOI+NGaiqPIt5Is=
X-Google-Smtp-Source: ABdhPJyr8Plxv0vgsC3vzC/FNnMnMOxWWH+gB39YilTAybkuEcGavqE69DGb/gQVFQesy1jnlfu2FQ==
X-Received: by 2002:a05:6512:239d:: with SMTP id c29mr11229926lfv.454.1638434318432;
        Thu, 02 Dec 2021 00:38:38 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id l16sm291157lfg.90.2021.12.02.00.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:38:37 -0800 (PST)
Message-ID: <2f238cca-e609-f98c-41cd-6eb19adffbd8@gmail.com>
Date: Thu, 2 Dec 2021 11:38:35 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH -next v4 0/3] some fix and cleanup for rtl8192e
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com
References: <20211202030704.2425621-1-yangyingliang@huawei.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211202030704.2425621-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/21 06:07, Yang Yingliang wrote:
> v4: Fix crypt_info leak. Add fix tags for patch #1 and #2.
> v3: Fix more leaks.  Break it up into multple patches.
> v2: Make rtllib_softmac_init() return error codes.
> 
> patch #1, #2:
>    fix error handle case in alloc_rtllib()
> 
> patch #3:
>    remove unnecessary assignment
> 
> Yang Yingliang (3):
>    staging: rtl8192e: return error code from rtllib_softmac_init()
>    staging: rtl8192e: rtllib_module: fix error handle case in
>      alloc_rtllib()
>    staging: rtl8192e: rtllib_module: remove unnecessary assignment
> 
>   drivers/staging/rtl8192e/rtllib.h         |  2 +-
>   drivers/staging/rtl8192e/rtllib_module.c  | 17 ++++++++++++-----
>   drivers/staging/rtl8192e/rtllib_softmac.c |  6 ++++--
>   3 files changed, 17 insertions(+), 8 deletions(-)
> 

Thank you!

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>



With regards,
Pavel Skripkin
