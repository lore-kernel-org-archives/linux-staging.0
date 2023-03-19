Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A621373;
	Sun, 19 Mar 2023 11:52:41 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id fd5so36669441edb.7;
        Sun, 19 Mar 2023 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLj0P1lq2bvFo+/6zRlEm0LLZrtFvTkebdhPbz6tAow=;
        b=RF3a/GCx8fBvZKTPgsUV9XVNsAJagR0XmHOKMLH2StTNeRbv7PAry1esWVwyj7Se9T
         +GbeuXz4rDcnxFRQ0ifEtFNi4SpGrzAoB3bpSgPJwEOqGY0tTTMd35kRSm1+1c7GKq3y
         Jh2ImdKHcRbqYZnSOdsTMYpq7WltsBVpxxXu2dC+n7zycw27CYXu9tZV1J/sMKHbccec
         XlvsZq9FZ3ByGW9L/KVF1DXWMQcAfUm2l5ZHZBvet3Z6sKAMrN95wPeK/Agdohdd7B9m
         Xa2u8aEVBsIKxN3tVJ8f4o/qE4vRTTV20C0OonkYqLet9VphEZfTkiLXg0SEL2VnPxXN
         8ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLj0P1lq2bvFo+/6zRlEm0LLZrtFvTkebdhPbz6tAow=;
        b=2VINWExy2ERv4hVovP7Q4A61LQnwdWZWVKjXPOpC6eQIanv6s1uNclk9DSrp2N2+4N
         jtYZRjQecBFdSWydVm42T8jmUm7FyoiTH3gobLOzpcF5xVamvd7OlzVESIPl1ckSrCHA
         eD+rbfV+N1NG5uBOyCQamocA61zc6KyCBEfsiOXzUFcs7NcYcLjOCS6FtEVu+L1cjWQx
         l8BiQ1oIZI3zJXO+hci59uGCA1f63qcq/qzocqa/Dzn8zjkT/Tzohgp9k2XWtxNPzWPj
         hvl98NA/VRli3wvmDxdNoeFavHSO/B6hKMrw5iNtqxJ0FZfdjSsGIG0rxL6++HFxMHxQ
         JK5Q==
X-Gm-Message-State: AO0yUKU6z+Nz0zzAuxr8nzovw5HivFIwtQ2gnlLCAZwvacxC5B5Fv0w2
	8SsJQ9s3SNR+sViz5+Heh3g=
X-Google-Smtp-Source: AK7set9h4sX9QnfNlzB8p4fQlOOvU+gnT/OTj9SGs/mAADG3tXujvXMnY8dX/DqRFM5xOPh71P9wGw==
X-Received: by 2002:aa7:d48b:0:b0:4ac:bcf9:6d6c with SMTP id b11-20020aa7d48b000000b004acbcf96d6cmr8217438edr.36.1679226759954;
        Sun, 19 Mar 2023 04:52:39 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v6-20020a50d086000000b004fb00831851sm3379178edd.66.2023.03.19.04.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:52:39 -0700 (PDT)
Message-ID: <c82427af-dc37-734b-348c-371103a4ff90@gmail.com>
Date: Sun, 19 Mar 2023 13:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: add blank line after struct
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
 <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
 <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
 <6cc1e2f7-e971-b195-acba-9b4c136aa16b@gmail.com>
 <alpine.DEB.2.22.394.2303191246190.2867@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303191246190.2867@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١٩‏/٣‏/٢٠٢٣ ١٣:٤٦, Julia Lawall wrote:
>
> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>
>> On ١٩/٣/٢٠٢٣ ١٣:٣٦, Julia Lawall wrote:
>>> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>>>
>>>> On ١٩/٣/٢٠٢٣ ١٣:١٩, Julia Lawall wrote:
>>>>> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>>>>>
>>>>>> add blank line after struct for readability as
>>>>> The log message should start with a capital letter, so "Add".
>>>> Okay, I will fix it.
>>>>
>>>>>> reported by checkpatch script
>>>>> "reported by checkpatch" or "reported by the checkpatch script".
>>>>> The first is more concise, and it doesn't really matter whether
>>>>> checkpatch
>>>>> is a script or something else.
>>>> got it.
>>>>
>>>>>> " CHECK: Please use a blank line after function/struct/union/enum
>>>>>> declarations"
>>>>> I guess the #define was concatenated to the end of the definition to
>>>>> show
>>>>> that it is closely related to the definition.  With the #define, it
>>>>> seems
>>>>> rather natural, but the better soltution would be to make a static
>>>>> inline
>>>>> function in both cases.  There would naturally be a blank line before a
>>>>> function definition as well.
>>>> got your point, so, should i ignore this?
>>> Not sure what you mean by ignore.  If you rewrite the #define as a
>>> function, an use the natural placement for a function definition, then the
>>> checkpatch warning will go away as a side effect.
>>
>> I mean ignore this patch and make another patch with rewrite #define as you
>> suggested.
> Yes :)  That's fine ("drop" would be better than "ignore").
>
> julia
>
Okay :D, Thanks Julia.

Menna

>>
>> Menna
>>
>>> julia
>>>
>>>> Menna
>>>>
>>>>> julia
>>>>>
>>>>>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>>>>>> ---
>>>>>>     drivers/staging/greybus/gbphy.h | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/staging/greybus/gbphy.h
>>>>>> b/drivers/staging/greybus/gbphy.h
>>>>>> index d4a225b76338..1de510499480 100644
>>>>>> --- a/drivers/staging/greybus/gbphy.h
>>>>>> +++ b/drivers/staging/greybus/gbphy.h
>>>>>> @@ -15,6 +15,7 @@ struct gbphy_device {
>>>>>>     	struct list_head list;
>>>>>>     	struct device dev;
>>>>>>     };
>>>>>> +
>>>>>>     #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>>>>>>
>>>>>>     static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
>>>>>> @@ -43,6 +44,7 @@ struct gbphy_driver {
>>>>>>
>>>>>>     	struct device_driver driver;
>>>>>>     };
>>>>>> +
>>>>>>     #define to_gbphy_driver(d) container_of(d, struct gbphy_driver,
>>>>>> driver)
>>>>>>
>>>>>>     int gb_gbphy_register_driver(struct gbphy_driver *driver,
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>>>
>>>>>>
> >
