Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19B7B;
	Sat, 11 Mar 2023 14:58:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so8034563wmb.5;
        Sat, 11 Mar 2023 06:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHMcirR/d0kseQKUwfhmLV8C1xKi97ZsvINp73wm0WE=;
        b=BFDli0m4yLqGA6cjuaqJUZIXSBMXawkQCw+cH6P4/54xB07/I/M1OtP/b2WfoufIDO
         j00g4aTzYtiO+HYL2a4INamzXPUhEx0JpZC387prnOyaN4tOI0dv0tFNN+5RpM9r7b+J
         J2FGmBMAHSlb/vICDCqFCaGDMcgkDTa3Hb/iyeRn2wiw0R3gA7eA+V4T/ddKd1I1CsPv
         0DAwntz2S876jn5xbwr281svxc5AAOHLrl9b4/W5EKur4iLH4So3oyDMTLxLkCx1sdxO
         n5oV+uPbVyszALE851sgbwnTE3QoyEoq4lHaG3zEnQ1Q3i8Zr4jKyzXIqNtiEFAkAqYp
         TsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHMcirR/d0kseQKUwfhmLV8C1xKi97ZsvINp73wm0WE=;
        b=5eJ7ndhjuxXZwnimxlp9nrfZ5YSw8Khj1MEaP8ouJhSHwbuG6PZpnY4e8i23NtEPsi
         gyDbpQfvNqZrp/5PaRvaXJshUxrOu3jWSVwsO+9vKjmuM09x47bBjZGkGrcr8u6/CH7g
         lyA/c7WzP3sfFBsfMucapYfUw4rowfLNTmb0MNz7beXUf/I+YWtk4R8AwXat6eswVreD
         dVGWffxGl7r11zaKDiEgyDeVoozaFBDaBpV2He8Kue4W/7h2LkSAlDOY4MjGdUODEdrW
         u6odxaeJuvkHvdQ7v+IQDikLQdyHDIihy7lLck7PqwpS0KpPFjmaxkxn9p9iKSgsg5+I
         58JQ==
X-Gm-Message-State: AO0yUKX+k8SYwp4paBGGKmBbipDhw8po6dS87c7iF/Z9RbtaRz11QOti
	ukgZ2WKoVEsnjw/71I/sZ832Y3YRdU47Sg==
X-Google-Smtp-Source: AK7set+mQmPFifs0KWevNYp+Yp9EVN+4oNFdxjduyjxiOzzeU0Y3yT2QwK/SxBiyf73sBNaN1c1UXw==
X-Received: by 2002:a05:600c:3c8f:b0:3ea:bc08:b63e with SMTP id bg15-20020a05600c3c8f00b003eabc08b63emr6133252wmb.2.1678546692848;
        Sat, 11 Mar 2023 06:58:12 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b003e1202744f2sm3205826wmo.31.2023.03.11.06.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:58:12 -0800 (PST)
Message-ID: <fe97c33f-536a-5951-73bd-169b67d9b8d8@gmail.com>
Date: Sat, 11 Mar 2023 16:58:06 +0200
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
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
 <alpine.DEB.2.22.394.2303111537430.2802@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303111537430.2802@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١١‏/٣‏/٢٠٢٣ ١٦:٣٨, Julia Lawall wrote:
>
> On Sat, 11 Mar 2023, Menna Mahmoud wrote:
>
>> On ١١/٣/٢٠٢٣ ١٤:٥٧, Menna Mahmoud wrote:
>>> On ١١/٣/٢٠٢٣ ١٤:٥٥, Julia Lawall wrote:
>>>> On Sat, 11 Mar 2023, Menna Mahmoud wrote:
>>>>
>>>>> On ١١/٣/٢٠٢٣ ١٠:٥٩, Julia Lawall wrote:
>>>>>> On Fri, 10 Mar 2023, Menna Mahmoud wrote:
>>>>>>
>>>>>>> Fix " CHECK: Alignment should match open parenthesis "
>>>>>>> Reported by checkpath
>>>>>> See the message in the other mail about the log message.
>>>>>>
>>>>>> Also, you should not have two patches with the same subject.  Here,
>>>>>> the
>>>>>> changes are on the same file and are essentially the same, even
>>>>>> involving
>>>>>> the same function call.  So they can be together in one patch.
>>>>>>
>>>>>> julia
>>>>> okay, I will. appreciate your feedback. thanks.
>>>> Please put some blank lines around your response, so it is easier to find.
>>>>
>>>> thanks,
>>>> julia
>>>
>>> Okay, I will.
>>>
>>> thanks,
>>>
>>> Menna
>>
>>
>> Hi Julia,
>>
>> according to Alex feedback
>>
>> " I think this type of alignment is not a major problem,
>> and alignment isn't done this way in general in this
>> driver, it's probably OK to keep it that way. - Alex "
>>
>>
>> ,I won't resubmit these patches, right?
> The existing code indeed looks better to me.  So you can skip this issue.
>
> julia


Okay, thanks Julia.


>
>>
>>   -Menna
>>
>>
>>>
>>>>>>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>>>>>>> ---
>>>>>>>     drivers/staging/greybus/fw-core.c | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/staging/greybus/fw-core.c
>>>>>>> b/drivers/staging/greybus/fw-core.c
>>>>>>> index 57bebf24636b..f562cb12d5ad 100644
>>>>>>> --- a/drivers/staging/greybus/fw-core.c
>>>>>>> +++ b/drivers/staging/greybus/fw-core.c
>>>>>>> @@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle
>>>>>>> *bundle,
>>>>>>>                 }
>>>>>>>
>>>>>>>                 connection = gb_connection_create(bundle, cport_id,
>>>>>>> -                        gb_fw_mgmt_request_handler);
>>>>>>> +
>>>>>>> gb_fw_mgmt_request_handler);
>>>>>>>                 if (IS_ERR(connection)) {
>>>>>>>                     ret = PTR_ERR(connection);
>>>>>>>                     dev_err(&bundle->dev,
>>>>>>> --
>>>>>>> 2.34.1
>>>>>>>
>>>>>>>
>>>>>>>
> >
