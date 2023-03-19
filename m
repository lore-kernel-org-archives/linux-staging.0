Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF77C;
	Sun, 19 Mar 2023 22:17:24 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id o12so39909122edb.9;
        Sun, 19 Mar 2023 15:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679264243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVy2G3SF8lZXkIybrDraAoXDYSJJCjoWvYCpyBKYDUY=;
        b=VPfIuNhvPMHz6+stzUwdKPPkBMph20dX7ogWPqHkAkUFPYWAONYngoBKRxZNo6/kmk
         B/FptYlPhbVh5+9DVCKAk5l3RQODjOC4W4axVmkxSgOe/6twu0kg5jxG7Xv9d8Ciw3AJ
         UMJgI6WjVf/jZ5RGfgAVELeQeVul1+6900nCiWZZvQc/EcgYEN4wc65k3dP8UfXQmXSG
         UqCQL8FS/KzhdYn9NCP3ggy2GelQOlxcEP8zcegLr9RV8b786Qg2Ns6vmXLNf+NjDnxz
         0ifklrgI7mq9B/FiYemL199vtxdgW3iWF6MOufvAWsXxy9gl+BD7ug4jzkyD8t4D1kQP
         CuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679264243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVy2G3SF8lZXkIybrDraAoXDYSJJCjoWvYCpyBKYDUY=;
        b=SJIiVsME2ZhdMKoX/HnWVZ2XKy6BPEU7PUaovtN34/eS67m/qapJGZ+3Z1OcrqBLYx
         K8KKrOQPgbkqlJEbxU66+jlZ5tLbO7V1JCUrsOHbtQl2AX/GUkMpbWmEsohwIr1Fl9LS
         XQHUoDlqkoJQe4SF4vcYmNMWCbrq4XOWvvkEC3qXCeUa8KWg1qe4/ekbS6CtrCG9tNuc
         r9GnuhrbONsso6SY9WX4GukltyDIfrfg1vBPA7d5J9z2Aya7xMjV5i3wPNymtQJWvqIn
         Q7nKJ+q/zMi4uRt6PjSb22APHBMgYnZuun0JMSBK5qtyJiJCbD5BN2Byrd/Lk6zmmoDP
         8Dxw==
X-Gm-Message-State: AO0yUKXlAu6LihOka11bHi1sTjp6JCq4cESeBRCI4d/H/EzIBX9bgI/I
	HCOY11Wl+JVo9XJ+G0SngUk=
X-Google-Smtp-Source: AK7set+ddYLBNSELTms5vvW+xnnhYfyJ2l6J0SkGFd4krMvDOrgU3OljWSUE3iexrieUEaQkxDtrLg==
X-Received: by 2002:a17:907:9482:b0:933:130e:e81a with SMTP id dm2-20020a170907948200b00933130ee81amr6564533ejc.32.1679264242842;
        Sun, 19 Mar 2023 15:17:22 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id k7-20020a1709062a4700b008b176df2899sm3620112eje.160.2023.03.19.15.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 15:17:22 -0700 (PDT)
Message-ID: <8e9724a0-226d-eb81-69c3-d59889e37e1f@gmail.com>
Date: Mon, 20 Mar 2023 00:17:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: use inline function for macros
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230319201324.253874-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303192121170.2867@hadrien>
 <0f02a3ff-801b-1e1f-5c03-009a05708709@gmail.com>
 <alpine.DEB.2.22.394.2303192151330.2867@hadrien>
 <402ffcbe-bb29-7035-68f4-2741532a6d67@gmail.com>
 <alpine.DEB.2.22.394.2303192225590.2867@hadrien>
 <649afe06-e069-e046-21ec-0d86243a4bfa@gmail.com>
 <alpine.DEB.2.22.394.2303192303130.2867@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303192303130.2867@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٢٠‏/٣‏/٢٠٢٣ ٠٠:٠٦, Julia Lawall wrote:
>
> On Mon, 20 Mar 2023, Menna Mahmoud wrote:
>
>> On ١٩/٣/٢٠٢٣ ٢٣:٢٦, Julia Lawall wrote:
>>> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>>>
>>>> On ١٩/٣/٢٠٢٣ ٢٢:٥٥, Julia Lawall wrote:
>>>>> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>>>>>
>>>>>> On ١٩/٣/٢٠٢٣ ٢٢:٢١, Julia Lawall wrote:
>>>>>>> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>>>>>>>
>>>>>>>> Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
>>>>>>>> static inline functions.
>>>>>>>>
>>>>>>>> it is not great to have macro that use `container_of` macro,
>>>>>>>> because from looking at the definition one cannot tell what type
>>>>>>>> it applies to.
>>>>>>>>
>>>>>>>> One can get the same benefit from an efficiency point of view
>>>>>>>> by making an inline function.
>>>>>>>>
>>>>>>>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>>>>>>>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>>>>>>>> ---
>>>>>>>>      drivers/staging/greybus/gbphy.h | 10 ++++++++--
>>>>>>>>      1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/staging/greybus/gbphy.h
>>>>>>>> b/drivers/staging/greybus/gbphy.h
>>>>>>>> index 1de510499480..42c4e3fe307c 100644
>>>>>>>> --- a/drivers/staging/greybus/gbphy.h
>>>>>>>> +++ b/drivers/staging/greybus/gbphy.h
>>>>>>>> @@ -16,7 +16,10 @@ struct gbphy_device {
>>>>>>>>      	struct device dev;
>>>>>>>>      };
>>>>>>>>
>>>>>>> You have made the patch against your previous patch that added a
>>>>>>> newline
>>>>>>> here.  It should be against Greg's tree.
>>>>>>>
>>>>>>> julia
>>>>>> you mean I should remove this newline, right?
>>>>> You should apply your change to the state of Greg's tree, not the state
>>>>> after your patch.
>>>>>
>>>>> Assuming that you have committed both the patch adding the new line and
>>>>> the patch changing the macro to a function, and have made no other
>>>>> changes, you can do git rebase -i HEAD~2 and the put a d at the
>>>>> beginning
>>>>> of the line related to the patch adding the newline.
>>>> you mean drop this patch "staging: greybus: remove unnecessary blank
>>>> line"?
>>> No, the one that removes the blank line looks fine.
>>>
>>> At some point, you added a blank line below the two structure definitions.
>>> That blank line is not in Greg's tree, so you shoulsn't send a patch that
>>> assumes that it is there.
>>
>> I'm sorry I mean this patch "staging: greybus: add blank line after struct",
>> Julia I understood the issue
>>
>> but I am confused about how to fix it, should I drop the patch that added the
>> newline? then what should I do?
> If the git rebase solution is not clear to you, then another simple
> solution is just to clone Greg's tree again somewhere else, and make your
> changes.
>
>> and version that I have submitted, should I do anything about it as you said
>> it is wrong solution?
> My concern was the blank line after each of the structure definitions,
> which is not in Greg's tree, so he can't apply the patch.  Other than
> that, if the code compiles it is at least going in the right direction.
>
> Please fix the newlines issue, and then send the patch again.
>
> julia


Okay I will fix it, but will send it as a new patch not v3, right?


Menna

>
>>
>> Menna
>>
>>> julia
>>>
>>>> Menna
>>>>
>>>>
>>>>> If you have made
>>>>> more changes, you can adapt the HEAD~ part accordingly.
>>>>>
>>>>> julia
>>>>>
>>>>>
>>>>>> Menna
>>>>>>
>>>>>>>> -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>>>>>>>> +static inline struct gbphy_device *to_gbphy_dev(const struct
>>>>>>>> device
>>>>>>>> *d)
>>>>>>>> +{
>>>>>>>> +	return container_of(d, struct gbphy_device, dev);
>>>>>>>> +}
>>>>>>>>
>>>>>>>>      static inline void *gb_gbphy_get_data(struct gbphy_device
>>>>>>>> *gdev)
>>>>>>>>      {
>>>>>>>> @@ -45,7 +48,10 @@ struct gbphy_driver {
>>>>>>>>      	struct device_driver driver;
>>>>>>>>      };
>>>>>>>>
>>>>>>>> -#define to_gbphy_driver(d) container_of(d, struct gbphy_driver,
>>>>>>>> driver)
>>>>>>>> +static inline struct gbphy_driver *to_gbphy_driver(struct
>>>>>>>> device_driver
>>>>>>>> *d)
>>>>>>>> +{
>>>>>>>> +	return container_of(d, struct gbphy_driver, driver);
>>>>>>>> +}
>>>>>>>>
>>>>>>>>      int gb_gbphy_register_driver(struct gbphy_driver *driver,
>>>>>>>>      			     struct module *owner, const char
>>>>>>>> *mod_name);
>>>>>>>> --
>>>>>>>> 2.34.1
>>>>>>>>
>>>>>>>>
> >
