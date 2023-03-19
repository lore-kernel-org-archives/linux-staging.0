Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A931373;
	Sun, 19 Mar 2023 11:41:26 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id ek18so36651374edb.6;
        Sun, 19 Mar 2023 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n77gpIMkfR9vfpuZIBERj4t73L0b1VP6S1jA0RpBJo8=;
        b=QCXSg0MUnBdFzcZSLnbE1QRzI7oafpNs+rmvG0a6DhqKILIWug6uhndHwMTdbN4Jer
         hpP8xQfAbO5BzCebVDdWYV2Ao1InMZBnZRqIX7zqSv8E8Qg08b6NTqAxpauYpro6DdPE
         zQmBjfhC1LIu7hr3BWVKVYDNDHBfzFP82vV6O6QVbfWTsKr1oLKmNMgaDhNB1Adxgs/x
         TjHrRBoHKXA11LHf37vw6yzWfDZNX+dXv48BfYkqgEneeWveHONx3dmf+u4S2Q3DZgs2
         /DiJhEyF0ejesLwjJWna3BsLO/G/u6XcwqEHbGSeXH3WmggpwrKUNBovnoOx36vsZmQC
         XoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n77gpIMkfR9vfpuZIBERj4t73L0b1VP6S1jA0RpBJo8=;
        b=LtFkd4Bzzn/wek/RAP/PQx9l395x6crwDPT2H/sJQKylOZGSijVbpLmfzvW3Dc5Cej
         EJzN0ZAhU/6UJ6ayY0BRQ0ZEHCeSvHV4uhNLHtJCwnMnZ7goa2vnqtZ8NSQ/HGAc8PsA
         JiG1xXEF+dyQO2J61xf4wr7r6XHCHgYj6bA2kvn4cfberA767P7TaHeINBepQarX08B9
         9npIrBEdLNCumP4N6AqBkh8Q7CLBpscJFZp8jWtDATGh01OZIabZdqOD2JMrPUnmLP8m
         zawN+2rHMU76LbXs6TJEsiYe/VhAMHFP7LwHJ0Z/WOmdKXYtRLrGL5au/CEgXxR20P09
         KuGw==
X-Gm-Message-State: AO0yUKVHw02/F60lnRbVG/92zJmTk3dGbZHjbvt+Ltnc08gE58Z8yuhd
	gXMCLq+Eq1fsjdm6aw6Nlfw=
X-Google-Smtp-Source: AK7set9+dGMhflo93TOE2qP/DjMA7wCJ+4PQj626XCpyEja/PPRyKcmW5Gr5sblUKO2G2t6HFK2FOw==
X-Received: by 2002:a05:6402:7c3:b0:4fa:4b1c:5ea3 with SMTP id u3-20020a05640207c300b004fa4b1c5ea3mr9114104edy.23.1679226084332;
        Sun, 19 Mar 2023 04:41:24 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id f27-20020a50d55b000000b004c44d00a3b5sm3451508edj.20.2023.03.19.04.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:41:23 -0700 (PDT)
Message-ID: <6cc1e2f7-e971-b195-acba-9b4c136aa16b@gmail.com>
Date: Sun, 19 Mar 2023 13:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: add blank line after struct
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
 <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
 <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١٩‏/٣‏/٢٠٢٣ ١٣:٣٦, Julia Lawall wrote:
>
> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>
>> On ١٩/٣/٢٠٢٣ ١٣:١٩, Julia Lawall wrote:
>>> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>>>
>>>> add blank line after struct for readability as
>>> The log message should start with a capital letter, so "Add".
>>
>> Okay, I will fix it.
>>
>>>> reported by checkpatch script
>>> "reported by checkpatch" or "reported by the checkpatch script".
>>> The first is more concise, and it doesn't really matter whether checkpatch
>>> is a script or something else.
>>
>> got it.
>>
>>>> " CHECK: Please use a blank line after function/struct/union/enum
>>>> declarations"
>>> I guess the #define was concatenated to the end of the definition to show
>>> that it is closely related to the definition.  With the #define, it seems
>>> rather natural, but the better soltution would be to make a static inline
>>> function in both cases.  There would naturally be a blank line before a
>>> function definition as well.
>>
>> got your point, so, should i ignore this?
> Not sure what you mean by ignore.  If you rewrite the #define as a
> function, an use the natural placement for a function definition, then the
> checkpatch warning will go away as a side effect.


I mean ignore this patch and make another patch with rewrite #define as 
you suggested.


Menna

>
> julia
>
>>
>> Menna
>>
>>> julia
>>>
>>>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>>>> ---
>>>>    drivers/staging/greybus/gbphy.h | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/staging/greybus/gbphy.h
>>>> b/drivers/staging/greybus/gbphy.h
>>>> index d4a225b76338..1de510499480 100644
>>>> --- a/drivers/staging/greybus/gbphy.h
>>>> +++ b/drivers/staging/greybus/gbphy.h
>>>> @@ -15,6 +15,7 @@ struct gbphy_device {
>>>>    	struct list_head list;
>>>>    	struct device dev;
>>>>    };
>>>> +
>>>>    #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>>>>
>>>>    static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
>>>> @@ -43,6 +44,7 @@ struct gbphy_driver {
>>>>
>>>>    	struct device_driver driver;
>>>>    };
>>>> +
>>>>    #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
>>>>
>>>>    int gb_gbphy_register_driver(struct gbphy_driver *driver,
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>>
> >
