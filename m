Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDF7B;
	Sat, 11 Mar 2023 14:06:54 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso8021505wmb.0;
        Sat, 11 Mar 2023 06:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543613;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHLAIzc+GmiWBlK16hvBHcIL2RgKMlFXd7qg8d6tzz0=;
        b=clznqfjoXpVBWxFJpYNEApaXb5B24L94OTY5WjXa8hMFUJSfEXpDYgqJtv5lIu6pRv
         dbD/PW16AhwcYIRjEdpYvJmcRWK1K2XCQeRmpaHxQc+t4Sk21l86IvDpPUQyUJe1EW6s
         BWAIrQ4+kxyq2IHKEwBU1G03s7xYLSOiWe+gYZREe7k8AHog6C9Tiq4ZUJJr3PR9wisV
         bslBH7FtNqap6bfiFNkmbQPi5C0Db0B2td7hqegzuZU7nDV5oXV7nDTzNtDsXw2avO6M
         vYrWU9LrY1FVcBjc2Wlkqm/UjHMtfZBAH3cCVXLBl+3DxydLQpf50GgV69oKGySm1JNA
         vCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543613;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHLAIzc+GmiWBlK16hvBHcIL2RgKMlFXd7qg8d6tzz0=;
        b=SyuJPVXF+VIPjTy4/v/v9hPtcmR9JthBDwmhkhZHvex2S2ogmsL2W4tle6EWccbx7H
         gSlEM2ELd6it6I07JeBoavZeNVwGkhJ8PIg8Xd/+GKjH413NPg0T90chKn6IZes1rkKc
         pCAVxw4Hg6Cb8OcMcIdY1uwz3ptOTTjnE1ZEfWb2FBkTCaq25ZMIjJB/EX9T4BI1joNd
         IVYjdYzThxI3OOcA3bqyeOp6obXSBd9Q+75DYj5wyjG3HKPq1SBcQboatNtBjxnJ7BTM
         eiV3tcFd+lcwexvxZbzmalBnFFGJv6fjWqmF3YZZtvqayMax2mW9U6d5rN58RZpVYaXc
         7M3Q==
X-Gm-Message-State: AO0yUKViHlTJie1vIB7MEjQOR912Kr+hf+iSM9YeeJchp6CA4q/+W67M
	uy2Qi6XdiGT57f8t+chy9Lo=
X-Google-Smtp-Source: AK7set9KsaidIkzAnDLCxIaUvaXd2BbuKHxUXSBqTPm7xDCfRhsZE0EKNiXlZBXgfm7IC31OeR8YKQ==
X-Received: by 2002:a05:600c:1f0f:b0:3df:ef18:b0a1 with SMTP id bd15-20020a05600c1f0f00b003dfef18b0a1mr5825500wmb.12.1678543613212;
        Sat, 11 Mar 2023 06:06:53 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003daf672a616sm2900260wmc.22.2023.03.11.06.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:06:52 -0800 (PST)
Message-ID: <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
Date: Sat, 11 Mar 2023 16:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
In-Reply-To: <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١١‏/٣‏/٢٠٢٣ ١٤:٥٧, Menna Mahmoud wrote:
>
> On ١١‏/٣‏/٢٠٢٣ ١٤:٥٥, Julia Lawall wrote:
>>
>> On Sat, 11 Mar 2023, Menna Mahmoud wrote:
>>
>>> On ١١/٣/٢٠٢٣ ١٠:٥٩, Julia Lawall wrote:
>>>> On Fri, 10 Mar 2023, Menna Mahmoud wrote:
>>>>
>>>>> Fix " CHECK: Alignment should match open parenthesis "
>>>>> Reported by checkpath
>>>> See the message in the other mail about the log message.
>>>>
>>>> Also, you should not have two patches with the same subject.  Here, 
>>>> the
>>>> changes are on the same file and are essentially the same, even 
>>>> involving
>>>> the same function call.  So they can be together in one patch.
>>>>
>>>> julia
>>> okay, I will. appreciate your feedback. thanks.
>> Please put some blank lines around your response, so it is easier to 
>> find.
>>
>> thanks,
>> julia
>
>
> Okay, I will.
>
> thanks,
>
> Menna



Hi Julia,

according to Alex feedback

" I think this type of alignment is not a major problem,
and alignment isn't done this way in general in this
driver, it's probably OK to keep it that way. - Alex "


,I won't resubmit these patches, right?


  -Menna


>
>
>>>>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>>>>> ---
>>>>>    drivers/staging/greybus/fw-core.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/staging/greybus/fw-core.c
>>>>> b/drivers/staging/greybus/fw-core.c
>>>>> index 57bebf24636b..f562cb12d5ad 100644
>>>>> --- a/drivers/staging/greybus/fw-core.c
>>>>> +++ b/drivers/staging/greybus/fw-core.c
>>>>> @@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle 
>>>>> *bundle,
>>>>>                }
>>>>>
>>>>>                connection = gb_connection_create(bundle, cport_id,
>>>>> -                        gb_fw_mgmt_request_handler);
>>>>> +
>>>>> gb_fw_mgmt_request_handler);
>>>>>                if (IS_ERR(connection)) {
>>>>>                    ret = PTR_ERR(connection);
>>>>>                    dev_err(&bundle->dev,
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>>
>>>>>
>> >
