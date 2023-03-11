Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550377B;
	Sat, 11 Mar 2023 12:57:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so7918984wms.2;
        Sat, 11 Mar 2023 04:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678539422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqeWpaGZmWaUB81ceB/6jhQ/prrf3w9V/zttV1zTCNg=;
        b=ZxgPpCgu19gjppNxdYRtNXBW3Bbj0yJsFTnOeSqi/xXOEm/JswDKVgpr5fiJv6S4aX
         SA5cmX6pkIj/TJZnDCoOKt5hJsuYiQbecwQucxLoiK+CgE1ss5vtvEhTyv4AKxsrI79/
         B/zzd3WEotyuKkV/vimLwmhiv3BtrNnaX2LXG3BqSt0oqZycXsTz+X9o+QdKrbrXgl9O
         wg9HeLba4SZ9NkCdoaoe7zREDp9cZo7j+GRFnsC4zmgQWh851g1u+Zv+MUFeffTu107E
         wBudNG+axXabjwjTapcuiCC7xRB9MAywM3qoucrgV6u9RzJXzTsuHDEEJfET61F61pvH
         f/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678539422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqeWpaGZmWaUB81ceB/6jhQ/prrf3w9V/zttV1zTCNg=;
        b=OBQxg7DLczwV566sN0rx5CsoHoxc70XC6fMYUKsWiIO8+sKQfk43zGdObW7p26RyJ0
         BKU7eGejEr4V8lIg1Qo1SEzQYvNO1qp/uULCticuc/rg5tYPrT4P4RCqP4lO/vjILF5F
         8BgFnR1Qf3IoMKnQVCp61JtynzPmflz7P9wLqeVzuUPJ7/ZfkQr2BJGXz9RLagHzrol5
         lC8jCIeFt6LDL8IUlVnSXinlgHMwQlBmWHiHgN1VGWxHShnWk4wbAHTF/wVniHZzSeMN
         pGxLcz0AZbmRvIct/lCSu8XwiEUzc16SAtqK+Ql0vkLxJ2VI+b4cDizljo9dEYJeOt6W
         wZEQ==
X-Gm-Message-State: AO0yUKXIzU0hKxU2Bvon+9pw1KKD1e8UCeu3YyqU8zXa29dJNUboKRNf
	aH1RO8jcHxja4u7rcUXwsy8=
X-Google-Smtp-Source: AK7set8bL6wKE2LLLC1IQXV6iAHTZwh7aSfEseMbwlLVg1xdbLclZSdqdryVvs4t6E6psPfZHEchaA==
X-Received: by 2002:a05:600c:4e4c:b0:3eb:9693:3857 with SMTP id e12-20020a05600c4e4c00b003eb96933857mr5490922wmq.5.1678539422470;
        Sat, 11 Mar 2023 04:57:02 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id v6-20020a1cf706000000b003eb966d39desm2753744wmh.2.2023.03.11.04.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 04:57:02 -0800 (PST)
Message-ID: <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
Date: Sat, 11 Mar 2023 14:57:00 +0200
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
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١١‏/٣‏/٢٠٢٣ ١٤:٥٥, Julia Lawall wrote:
>
> On Sat, 11 Mar 2023, Menna Mahmoud wrote:
>
>> On ١١/٣/٢٠٢٣ ١٠:٥٩, Julia Lawall wrote:
>>> On Fri, 10 Mar 2023, Menna Mahmoud wrote:
>>>
>>>> Fix " CHECK: Alignment should match open parenthesis "
>>>> Reported by checkpath
>>> See the message in the other mail about the log message.
>>>
>>> Also, you should not have two patches with the same subject.  Here, the
>>> changes are on the same file and are essentially the same, even involving
>>> the same function call.  So they can be together in one patch.
>>>
>>> julia
>> okay, I will. appreciate your feedback. thanks.
> Please put some blank lines around your response, so it is easier to find.
>
> thanks,
> julia


Okay, I will.

thanks,

Menna


>>>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>>>> ---
>>>>    drivers/staging/greybus/fw-core.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/greybus/fw-core.c
>>>> b/drivers/staging/greybus/fw-core.c
>>>> index 57bebf24636b..f562cb12d5ad 100644
>>>> --- a/drivers/staging/greybus/fw-core.c
>>>> +++ b/drivers/staging/greybus/fw-core.c
>>>> @@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>>>>    			}
>>>>
>>>>    			connection = gb_connection_create(bundle, cport_id,
>>>> -						gb_fw_mgmt_request_handler);
>>>> +
>>>> gb_fw_mgmt_request_handler);
>>>>    			if (IS_ERR(connection)) {
>>>>    				ret = PTR_ERR(connection);
>>>>    				dev_err(&bundle->dev,
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>>
> >
