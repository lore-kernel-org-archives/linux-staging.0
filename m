Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8C02C82
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 18:19:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b189-20020a1c1bc6000000b0030da052dd4fso2993261wmb.3
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R/dz9+WiCzlF7Mip7NpDVh0nc3yRnz/ch3JiE8P+Gec=;
        b=n9ZhygoEwy6GIbJWEKJbPGMoh4j1vFIJRpHwMe+FzMGv7A3ZowubZZxgNQCjo/BN8k
         poFov7qVco1ERmPYhEkEcLKwIapVzTPC/2L7ED4zGJfv/0JtEVj6+7xUheXnSKS3hsxA
         0QLfKpCJHrTQ6i8B9SlktCeWLw4s+BE3OXKodW0Hg3yTZhjWXY4FdRvLCCwos49oe6An
         ZMhVXfs5YKUfzUhc9oLFcFk/eEuSEpHiVKJiA1/bxopPAyquB/1wTb/oQdbvTfEFEyPo
         umwnVIsUW5vD5D66JmV+fQKB4jPRMd+8T88tK8hp7DbXiZx8Og/7HtbXj+9eMnu706hU
         ij4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R/dz9+WiCzlF7Mip7NpDVh0nc3yRnz/ch3JiE8P+Gec=;
        b=h3dxEa/QgH3eimX+JEWzZe+kByg1wKQ3BdFRaJNzPn8grlN6dz1JK/XL/dbfUxRKnO
         Z72tp/SlIOv/JUIM5trgY+eOtqM0UQs3cWewossDgxenE9tLFh50T1smwwWpsRu4mu6e
         cTf99sZ7WT/dKvlnlwTVJscBnguTj23NkFW55Arz2M3NhR4z4iiuhKvx0BJ2QCdG5g9g
         logWjB2PrePf9BcrGHJCeVMpUSdLZU8ayCLQiA6NWJnLut6n6VSkmIUYhi3jB0r+/CA0
         pCKx9bqJa1N6kqNGamexsAZNAVykUk3O6qTDIJCgqOhgHNGdrI86CV6o+oXJ+bPkMyt6
         8JIg==
X-Gm-Message-State: AOAM533KS4ToULMErD0AKkKPxkl/T/6dbOZjMJF5pY/0+n86SUc9OiW+
	CsoOiZdS2vqz8HpZd7CwBWc=
X-Google-Smtp-Source: ABdhPJxOLZD9ADgpllTByySgB7oz5wprdBfEFUcsccB1dnwRDJNjkkkVhPn9CUt1zJxj0VvvhW1eXg==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr27810416wmc.180.1634321986864;
        Fri, 15 Oct 2021 11:19:46 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::ad78? ([2a02:8108:96c0:3b88::ad78])
        by smtp.gmail.com with ESMTPSA id s13sm11448168wmc.47.2021.10.15.11.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 11:19:46 -0700 (PDT)
Message-ID: <2c826db6-dab1-2135-14b1-d9fda25951d9@gmail.com>
Date: Fri, 15 Oct 2021 20:19:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 0/7] staging: r8188eu: odm cleanups
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
References: <20211015163507.9091-1-straube.linux@gmail.com>
 <YWnDVkwcnVEEoxm4@equinox>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YWnDVkwcnVEEoxm4@equinox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/21 20:07, Phillip Potter wrote:
> On Fri, Oct 15, 2021 at 06:35:00PM +0200, Michael Straube wrote:
>> This series removes:
>> - empty / unused functions from odm.c
>> - two never set / unused fields from odm_dm_struct
>> - the function ODM_CmnInfoPtrArrayHook()
>>
>> Tested on x86_64 with Inter-Tech DMG-02.
>>
>> Michael Straube (7):
>>    staging: r8188eu: remove empty functions from odm.c
>>    staging: r8188eu: remove ODM_SingleDualAntennaDefaultSetting()
>>    staging: r8188eu: remove GetPSDData()
>>    staging: r8188eu: remove ODM_AntselStatistics_88C()
>>    staging: r8188eu: pBandType is never set
>>    staging: r8188eu: pMacPhyMode is not used
>>    staging: r8188eu: remove ODM_CmnInfoPtrArrayHook()
>>
>>   drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |   2 +-
>>   drivers/staging/r8188eu/hal/odm.c             | 144 ------------------
>>   drivers/staging/r8188eu/hal/odm_HWConfig.c    |   7 +-
>>   drivers/staging/r8188eu/hal/odm_interface.c   |   5 -
>>   drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   2 +-
>>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   |   5 +-
>>   drivers/staging/r8188eu/include/odm.h         |  38 -----
>>   .../staging/r8188eu/include/odm_interface.h   |   2 -
>>   drivers/staging/r8188eu/include/odm_precomp.h |   2 -
>>   9 files changed, 6 insertions(+), 201 deletions(-)
>>
>> -- 
>> 2.33.0
>>
> 
> Dear Michael,
> 
> Looks good to me. Built and tested on my USB-N10 Nano, works well. Many
> thanks.
> 
> For whole series:
> Acked-by: Phillip Potter <phil@philpotter.co.uk>
> 
> Regards,
> Phil
> 

Thank you for testing and your ack Phillip.

Regards,
Michael
