Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C5A9440
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 21:09:24 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id s7so8856616ilv.12
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 14:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1679432963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzW9p4LhnjYzvSKLP9t4tNJ5MTuXkgLMUHLHnuCN+lo=;
        b=hJap/eyAlwh1xyFVpJSITmTyB3Yh8OVErR/Tibiu+/SnBd8cHnNtLIb8mwa3e4aRUl
         hKWCQo9qmpIO0Nvo5kI95Ww55GRUzYRmlyEmSgAnSLyzT3xnh7kTYpvm3DJpvhwCUESb
         ofk36ZUs1Xjy7fypAkB+OqFSfB6joAwtxkBLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679432963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzW9p4LhnjYzvSKLP9t4tNJ5MTuXkgLMUHLHnuCN+lo=;
        b=MsSw4UIwUupoaGYoXqx9FswGgGME2CykMaHQy2/TzwZ4bwedJxU7pgZ5yZfZHK4Oju
         5ZFdEVDC1aqcWPZonfsi8yX3+M30O5jyFtTOU8kUwLpH3tglaFHtrtrHJXHRwZ9cp1wS
         Oc62PRGo2UbcoGfw7ARpCYvySsCEz3VgMrKLZWh6DwU110UxareByxHlOvNx9tI05b0o
         evxa2oBysiu5QQaZbZm/7Smw+iDOLGL2f/QEwk2KKjSzKjqyUwDrdUw8AcjxnfN0fUeo
         AuPtPTEUyTGKhRraiy18ycqM37a7eUx2C2lsYyII5ebckBq4ch7gofNWrACm6Ntd9VVw
         k/rw==
X-Gm-Message-State: AO0yUKU4OCYP0gCeFMtT6+Ec5pQYZ6wpLLasdxZ6gqpTrutr2dW1FWwg
	H1wZIqDItremSfGpnRy6tv2k9g==
X-Google-Smtp-Source: AK7set8aAYWKSqfj95VbGURvHutzcp/JtU4vq+Utl72f2RpQonG9KHZIwW6HF+bSPT/kRjy+OMINsQ==
X-Received: by 2002:a92:c0c5:0:b0:323:515:c9fc with SMTP id t5-20020a92c0c5000000b003230515c9fcmr2629777ilf.6.1679432963564;
        Tue, 21 Mar 2023 14:09:23 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id q18-20020a056e02107200b0032304e1814bsm3872242ilj.40.2023.03.21.14.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 14:09:23 -0700 (PDT)
Message-ID: <5efa6e6d-8573-31de-639a-d15b2e9deca0@ieee.org>
Date: Tue, 21 Mar 2023 16:09:22 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: greybus: use inline function for macros
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230321183456.10385-1-eng.mennamahmoud.mm@gmail.com>
 <2e869677-2693-6419-ea25-f0cc2efcf3dd@ieee.org>
 <alpine.DEB.2.22.394.2303212140480.2919@hadrien>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <alpine.DEB.2.22.394.2303212140480.2919@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/23 3:43 PM, Julia Lawall wrote:
> 
> 
> On Tue, 21 Mar 2023, Alex Elder wrote:
> 
>> On 3/21/23 1:34 PM, Menna Mahmoud wrote:
>>> Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
>>> static inline function.
>>>
>>> It is not great to have macros that use the `container_of` macro,
>>> because from looking at the definition one cannot tell what type
>>> it applies to.
>>>
>>> One can get the same benefit from an efficiency point of view
>>> by making an inline function.
>>>
>>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>>
>> I'm sorry if this conflicts with what others have said.
>>
>> But the use of a macro (with a container_of() right-hand
>> side) to get at the structure containing a field pointer
>> is a widely-used idiom throughout the kernel.
>>
>> What you propose achieves the same result but I would
>> lean toward keeping it as a macro, mainly because it
>> is so common.
> 
> Common is not necessarily good.  Macros are less safe and less
> informative.

I do agree that the inline function is better, and
is functionally equivalent (while being explicit
with types and avoiding any macro expansion funny
business).

Do you think we should make changes like this throughout
the kernel (along the lines of the flexible array fixes,
to make things safer)?  I don't think it's a terrible idea,
but it's likely a big undertaking and I predict push-back.

Bottom line on this is that I don't think the proposed
change is wrong, but there is value in consistently
adhering to conventions.

Others can comment; I have no real objection.

					-Alex

> 
> julia
> 
> 
>>
>> 					-Alex
>>> ---
>>> changes in v2:
>>> 	-send patch as a single patch.
>>> 	-edit the name of struct object.
>>> 	-edit commit message.
>>> ---
>>>    drivers/staging/greybus/gbphy.h | 10 ++++++++--
>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/greybus/gbphy.h
>>> b/drivers/staging/greybus/gbphy.h
>>> index d4a225b76338..e7ba232bada1 100644
>>> --- a/drivers/staging/greybus/gbphy.h
>>> +++ b/drivers/staging/greybus/gbphy.h
>>> @@ -15,7 +15,10 @@ struct gbphy_device {
>>>    	struct list_head list;
>>>    	struct device dev;
>>>    };
>>> -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>>> +static inline struct gbphy_device *to_gbphy_dev(const struct device *_dev)
>>> +{
>>> +	return container_of(_dev, struct gbphy_device, dev);
>>> +}
>>>      static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
>>>    {
>>> @@ -43,7 +46,10 @@ struct gbphy_driver {
>>>      	struct device_driver driver;
>>>    };
>>> -#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
>>> +static inline struct gbphy_driver *to_gbphy_driver(struct device_driver
>>> *drv)
>>> +{
>>> +	return container_of(drv, struct gbphy_driver, driver);
>>> +}
>>>      int gb_gbphy_register_driver(struct gbphy_driver *driver,
>>>    			     struct module *owner, const char *mod_name);
>>
>>

