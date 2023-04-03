Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24885683
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 13:50:50 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y14so29451626wrq.4
        for <linux-staging@lists.linux.dev>; Mon, 03 Apr 2023 06:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680529849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvpaphTphPILlXv+75hdRiwUo1vRIDOFyCbyVIu5Xk0=;
        b=FBZS5eB+KpZkZ6HVU/zmYXUwGAX1oFM6A459QIXUP8XyMPZEw4UjUhGMQ8p2u05eeP
         rWTfDqgJm/He7DmT13oVX2smDp/CX7vk7+DZvLUvK1D1Ek310X40M+vXJjtUEd6ollvY
         dZusuZSPe+WNc0Hcb+n9YZaQEynFW+3ZUZaV3CEjCUyzZ3z+1Atv1BFMdtSpMpzWPbwY
         Eqhycincm78b3gdEEJTohg+UBvHwNaZ+yItaHruZtA2h+jjnMajFp4dTvJ2WO0/V4oG3
         XkJesfyqk4srEiF/nmGLJpqLUo7ktOeyLnBRR82LBg8WNG0Aao36wqHI3lQWNoXKoRIS
         caog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680529849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvpaphTphPILlXv+75hdRiwUo1vRIDOFyCbyVIu5Xk0=;
        b=ywf7STikDY6+uBRpPKoYn09thnfFIaHhHB2UTvUlD6faf+dCWaM8tMV0LJWz7Vt1ai
         nOliJjxqbo9gutLkzIP3j7WeAklugGwlEsKwx/WP1xMAEPcT2Qc4T7XixI5XjbDPFaHs
         10TPpnKnVykgMldVifU44VlExrr3XcDCOxZJ6XQ3J8lo27HFDG/4czb+T5E1GQVLEI8M
         B4wM+xqIOSlp56VYrhmI8US+a1Xn2nKnrpRPIH3Re740ixpDfuIrPmJ5v9sgVkwWqm39
         6BwvctmC+s7EZT0q/sUO1rc+jbruQDoDngm0HzoqVgvsHZzSDi49V9ym2GTRch/QOVFk
         r9QQ==
X-Gm-Message-State: AAQBX9cVycqCFtki2A7r0vEdeeb7ld1aEXlZoXmzMIu2VlZUnAogy4Dh
	qabUIX8lLZze4bmbHNPXLdY=
X-Google-Smtp-Source: AKy350aJ21t/X3VvTCa4wZg4U+/UV6q/xZMbrnBVM5oCMwzGGfTbuBmMO0iLPFB6Sb11OhbdJSBu0A==
X-Received: by 2002:adf:dd4f:0:b0:2cf:ec75:8090 with SMTP id u15-20020adfdd4f000000b002cfec758090mr27014222wrm.14.1680529848836;
        Mon, 03 Apr 2023 06:50:48 -0700 (PDT)
Received: from ?IPV6:2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3? ([2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3])
        by smtp.gmail.com with ESMTPSA id p4-20020a056000018400b002c56013c07fsm9688764wrx.109.2023.04.03.06.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 06:50:48 -0700 (PDT)
Message-ID: <82421ce7-bb38-5f15-6b70-a2ee08bd7833@gmail.com>
Date: Mon, 3 Apr 2023 15:50:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do
 while error.
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
 <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
 <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>
 <2023040301-tapping-umbilical-f7b4@gregkh>
From: =?UTF-8?Q?=c3=81ngel_Alberto_Carretero?= <angelalbertoc.r@gmail.com>
In-Reply-To: <2023040301-tapping-umbilical-f7b4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/04/2023 09:21, Greg Kroah-Hartman wrote:
> On Mon, Apr 03, 2023 at 09:23:55AM +0300, Dan Carpenter wrote:
>> On Sun, Apr 02, 2023 at 08:22:35PM +0200, Ángel Alberto Carretero wrote:
>>>
>>>
>>> On 02/04/2023 15:16, Greg Kroah-Hartman wrote:
>>>> On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wrote:
>>>>> Wrap macro in a do-while statement.
>>>>>
>>>>> Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
>>>>> ---
>>>>>    drivers/staging/greybus/loopback.c | 8 +++++---
>>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
>>>>> index d7b39f3bb652..371809770ed0 100644
>>>>> --- a/drivers/staging/greybus/loopback.c
>>>>> +++ b/drivers/staging/greybus/loopback.c
>>>>> @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>>>>>    static DEVICE_ATTR_RO(name##_avg)
>>>>>    #define gb_loopback_stats_attrs(field)				\
>>>>> -	gb_loopback_ro_stats_attr(field, min, u);		\
>>>>> -	gb_loopback_ro_stats_attr(field, max, u);		\
>>>>> -	gb_loopback_ro_avg_attr(field)
>>>>> +	do {		\
>>>>> +		gb_loopback_ro_stats_attr(field, min, u);		\
>>>>> +		gb_loopback_ro_stats_attr(field, max, u);		\
>>>>> +		gb_loopback_ro_avg_attr(field);		\
>>>>> +	} while (0)
>>>>>    #define gb_loopback_attr(field, type)					\
>>>>>    static ssize_t field##_show(struct device *dev,				\
>>>>> -- 
>>>>> 2.40.0
>>>>>
>>>>>
>>>>
>>>> Any specific reason why you did not test build your change before
>>>> submitting it?
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>
>>> Apologies, we can drop the patch. I was trying to find an error as part
>>> of the eudyptula challenge and thought I was compiling the driver
>>> correctly. Upon further examination, the macro cannot be written with a
>>> do-while because it is defining functions.
>>
>> The "eudyptula challenge" and other first patch guides should be updated
>> to tell people to search for their code on lore.kernel.org before
>> sending a patch.
> 
> The "eudyptula challenge" is not currently running and has not been for
> many years now so I do not know where the original poster got their
> information from.
> 
> thanks,
> 
> greg k-h

The challenge is in fact closed but the list of exercises is publicly
available. From my limited experience, it is still one of the best
resources for getting started in linux kernel development even if it is
probably a bit outdated, and lacking a section about testing your
changes properly.

Thanks and sorry again for the mishap,
Alberto.
