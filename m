Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD02C80
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 20:20:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id p16so938446lfa.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 13:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lpn3bDr+1bw+pbD1z3cuV2Y0NZoJOJSHErdT9t9Gido=;
        b=m/1f00hb1939PnBF54d63gR3fqHqU0p54DudyQ0J7dhLC6A8WpOmRkB0ErXdhFiLta
         9lIWwKgUk7TBl37hpenvwqkPCyWOblw3FmTn8iyGW2LwyW0tS1Nh+ScXRDU8ElrwTdzY
         ORM4/iNGfSP2jl9MS9HUUJ6e/dclUQw+b/oGOCyoFMwhWyc8xkXU+pMCwzjEOTtMnr+J
         lZWpQkxD7MfSm8UYYq4nHN59+k4A4/abqrcftUmeNruHg0G+F/L8b4fJYW92KzxvfK/8
         E5rvzYZqxF+sFDjPugskxJ8WaH16qSfpK/QkyNqf9b66QbDE58f1rwO743VWzOU5VVXm
         4gEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lpn3bDr+1bw+pbD1z3cuV2Y0NZoJOJSHErdT9t9Gido=;
        b=DiXuH8Jrp9RZj2Run1112vGKH3huDW0JEBL4R5nO7/j26Y0LlSfMeiVejtsTRjuFIm
         A2kxL96jnsH/AoPHy1k0wgYJcxH2jc4E+OCjfZ0NYrIcM7pGfX6nUagYjXBEpZXH79do
         7+IcPbSXE+GmXnIrpzWkkt3ufFTNWq3eCQchApSsMKQ95Nd1KuIp8AffNKN9R/+ZUyfX
         JeblXMTeSjpukMBcPWvOqMrY9Aiw+RdRoAwhdnH6s5b4z5tF0YbizO0QU8MFjI77o+sy
         QgGekMXZUkUO73xVu9ng2epCofMWP/O8upVbAqw17B5YFjTNHh0MXssVM3CRLm4hLrGt
         Hmww==
X-Gm-Message-State: AOAM533GC6Ln5kYp77kHaCmPm79LsRWCVX2NYMVfWOvAXcS5rKQavqz3
	HUy88VgrVQyjAIK9F4AWwA8=
X-Google-Smtp-Source: ABdhPJypK7rMxgdldHrwiZ00um/Y+CaFZRWh7yRDkoSi/cYQsCvuBcIIzMeri4SJH1FVXKeMsePjSQ==
X-Received: by 2002:a05:6512:c14:: with SMTP id z20mr7370646lfu.56.1635884453494;
        Tue, 02 Nov 2021 13:20:53 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.207])
        by smtp.gmail.com with ESMTPSA id k37sm1767639lfv.304.2021.11.02.13.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 13:20:53 -0700 (PDT)
Message-ID: <1f877ce2-e97b-7127-a212-e2f0ac774c0f@gmail.com>
Date: Tue, 2 Nov 2021 23:20:52 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove the goto statement
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com,
 martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YX7cCtVss2RWOJ/a@Sauravs-MacBook-Air.local>
 <f26b4aec-c0a1-8c93-b34e-8b1a36ac81b3@gmail.com>
 <a74bd1d9-746c-650f-74e7-4a4b597348b7@gmail.com>
 <4c566e71-2426-b776-17a2-38f5f0b6f2b6@gmail.com>
 <da61a07e-8ee8-8737-d110-c8b107cf7303@gmail.com>
 <534dab3c-72b1-047c-c188-6f86a57005e1@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <534dab3c-72b1-047c-c188-6f86a57005e1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/2/21 19:40, Saurav Girepunje wrote:
> 
> 
> On 01/11/21 12:57 am, Pavel Skripkin wrote:
>> On 10/31/21 22:24, Pavel Skripkin wrote:
>>>> I think rtw_init_default_value should return void. It's return value is not useful.
>>>
>>>
>>> Sure, but you need to firstly remove
>>> `ret8 = rtw_init_default_value(padapter);` and then make it return bool
>>                                      ^^^^
>> 
>> I mean void, of course :)
>> 
>> 
>> With regards,
>> Pavel Skripkin
> 
> Intention for this patch to remove the goto statement. I think removing a local variable
> for return value and changing the return type of function can be one separate patch.
> 
> On this patch intent to remove the goto statement only.
> 

I agree, I've just pointed out to further possible code improvements :)



With regards,
Pavel Skripkin
