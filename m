Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF466105
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 18:24:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id bj12so5858534ejb.13
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KK8Mv0+Ef0L2BfksqUudvrelrqtCSPHtqsyey6/U+HQ=;
        b=kS/CVc4ITQV5xbCeyzfNZSNBgVjkegfBy/p+nmYvozJB72OlsDzXTtQnk7Qw9zi9uq
         UgNuqC2oCAfMXtK6fF8tHgkCA0lpItIIL9pWTqIuRnz6LC+ZnULQENbj40dwDYuubGzK
         LM6qELQnjU9QPl/qknAYRPWm/SHiA3WL4QFTOhB+4NaBiCLAg/ZOW9+eG3/HBK5piMQH
         lCoi1lpU0ybgd5t6swzV2dl2M2FEqy8oA/HhhTFgoY60R+f4mrIe41vsT4RtFp21dVu2
         m7yAey2DvTDjTsVy4T24YafrjnW1tq61Bc3yigNjEU6yOlZLCNXJpe4l1a+ni61+ebsF
         JNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KK8Mv0+Ef0L2BfksqUudvrelrqtCSPHtqsyey6/U+HQ=;
        b=JZn0M1w5Vf2mw1Rz+TrmYE87m3YFw+9i6GSs/LzwAxVlj/T2EW0FavOQvGYhZ/BUot
         2yUbgDONzXsA4/fZ2EVBuFI3jwR8nyhjcdiFCcroHauAc2cCkjSdxfizGV+jahkZLrt1
         OF4hq18sC/bhnfF7EFgcnp/fjlBJuiK+7pGGvXfp3VC7Kk3YqWb9/fGdZE2h2WSuiRXz
         XFNEaBRH4XT58v1Y03eOyAiDVZSs1L0ZZdDIdBhL2YsMS0U1XcUmGkoxFSSyxqXgBTYv
         2wgxLqFYWx97u1nqHNeugGiutD78DwAjzNQ5DxOQ/zhPxXiDJlU27+E8GZVTsuyMOEWo
         G1LA==
X-Gm-Message-State: ACgBeo21cnbvzXsgo78Ou9o8sAfDENFVdZbGVMD6p7+5EjQKF1ROljsU
	hiCPM+kY6VnW6fjkVG3FOeY=
X-Google-Smtp-Source: AA6agR75ZXnO8WdleqxWK0w2VI/yDoZVWNqeHhyZg8UL901K2hrze6Vw5F7N1TCxVTw49bEquN1hFg==
X-Received: by 2002:a17:906:ef90:b0:730:9d18:17b3 with SMTP id ze16-20020a170906ef9000b007309d1817b3mr11112107ejb.141.1662747868160;
        Fri, 09 Sep 2022 11:24:28 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a99:7a5d:6760:faab:bf41? (p200300c78f3e6a997a5d6760faabbf41.dip0.t-ipconnect.de. [2003:c7:8f3e:6a99:7a5d:6760:faab:bf41])
        by smtp.gmail.com with ESMTPSA id d6-20020a170906304600b0076f99055520sm598266ejd.137.2022.09.09.11.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 11:24:27 -0700 (PDT)
Message-ID: <746330c2-cb85-e581-dd58-b7983d1713ed@gmail.com>
Date: Fri, 9 Sep 2022 20:24:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Fix return type for implementation of
 ndo_start_xmit
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>, GUO Zihua <guozihua@huawei.com>
References: <20220908203243.GA23048@matrix-ESPRIMO-P710>
 <YxrxywN9wDypohyY@kroah.com> <YxryqJs4k3B26/7o@kroah.com>
 <a0c8fa9d-cc86-b39b-e65f-e8a0ccf12a15@gmail.com> <Yxt/bjvVgC3H8mr6@kroah.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Yxt/bjvVgC3H8mr6@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/22 20:01, Greg Kroah-Hartman wrote:
> On Fri, Sep 09, 2022 at 07:20:09PM +0200, Philipp Hortmann wrote:
>> On 9/9/22 10:00, Greg Kroah-Hartman wrote:
>>> On Fri, Sep 09, 2022 at 09:56:59AM +0200, Greg Kroah-Hartman wrote:
>>>> On Thu, Sep 08, 2022 at 10:32:43PM +0200, Philipp Hortmann wrote:
>>>>> CFI (Control Flow Integrity) is a safety feature allowing the system to
>>>>> detect and react should a potential control flow hijacking occurs. In
>>>>> particular, the Forward-Edge CFI protects indirect function calls by
>>>>> ensuring the prototype of function that is actually called matches the
>>>>> definition of the function hook.
>>>>>
>>>>> Since Linux now supports CFI, it will be a good idea to fix mismatched
>>>>> return type for implementation of hooks. Otherwise this would get
>>>>> cought out by CFI and cause a panic.
>>>>>
>>>>> Use enums from netdev_tx_t as return value instead, then change return
>>>>> type to netdev_tx_t.
>>>>>
>>>>> Suggested-by: Dan Carpenter <error27@gmail.com>
>>>>> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
>>>>> ---
>>>>> Tested with rtl8192e
>>>>> Transferred this patch over wlan connection of rtl8192e
>>>>> ---
>>>>>    drivers/staging/rtl8192e/rtllib.h    |  2 +-
>>>>>    drivers/staging/rtl8192e/rtllib_tx.c | 10 +++++-----
>>>>>    2 files changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> Someone sent the same patch before you did:
>>>> 	https://lore.kernel.org/r/20220905130053.10731-1-guozihua@huawei.com
>>>>
>>>
>>> This patch does not apply to my tree either :(
>>>
>>> Please rebase and resubmit.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>>
>> Sorry Greg,
>>
>> I cannot find my error.
>> I just downloaded the patch and applied it to the staging-next branch and
>> that worked fine.
> 
> Try the staging-testing branch please.
> 
> thanks,
> 
> greg k-h

Hi Greg,

After switching the branch and a git pull the patch form GUO Zihua is 
already in.

Author: GUO Zihua <guozihua@huawei.com>
Date:   Mon Sep 5 21:00:53 2022 +0800

     staging: rtl8192e: Fix return type for implementation of ndo_start_xmit

So nothing to do.

Bye Philipp
