Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326868
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 16:40:46 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id n23so9972103pgh.8
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DgzSyakmiXAKzjKAq/b+llV9dW1iu1VDHSK5olZVPBg=;
        b=jthH+xm0FfjTjm/KbF7am/yXGqKxFX2Ocq1OQKCj6CbGbva1A1Z+oLUcquIf/HFo+x
         oWpWoAftaJmaSeJEFzLL5nI7FMDL3owTyHaePHxPYwfsTXXfXD9CK6SZuN99oFQOAhza
         8gVU71FN9mGv7Xyue+ZhrqIF6R7X9vuuUh5Q4QeM7s4cijqE73WElEN9a2+RuriXIDkq
         lmpGTFUPYDg+cswWirxtUn6pbNZXXBj3r6L1tuCLw29qMjmVibw4aJyITl78kDAacczL
         XkDM6q00Xo+Xf2pi+LPYVjZ0t0SbjDHU7yw0Np7gNHK6OwcFw/+edpobtNd1Ck7urzCs
         PnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DgzSyakmiXAKzjKAq/b+llV9dW1iu1VDHSK5olZVPBg=;
        b=sXag1zcKReRpQRxyCDw1a7UIdJg5a9hRBez4+825vcUSaqlzStEwhxA84P9z/NUMp7
         XaFHbtqf2TZiJcAJVq2iTEiB7zDHPkyyQvVRmgpoOSjC0qq1ZwOi2lOrJVBieWeNbb7b
         j8I5M5khnPqjS2+pInJ0mpialQx7IOrILaN4cFwUcDtPLq6ydtmp7fAPvRyzfkqUPIeW
         Kf2AEq1Vijudv3QowKqG184h+xDP6cNW5R9MFYLaNZIv9w/GICAjoBTZg8qby6vQ1trm
         cA/6v6TXdIVRH3xzKfLZNkdTVzVYTcNiSzhazfR1SJV9Ppxshrskpa47UR7NQcWynzXH
         82/w==
X-Gm-Message-State: AOAM530CeSyVFahXsXcTILkf3fZ1nLepzB7A5RwCNUXEA0Z/WynRC+2M
	8JicIOPpj9KZWHsCvd4dCS4=
X-Google-Smtp-Source: ABdhPJylfmwPs8JRojr5ELZouAagZraUKeDcQOoSVmBQ6nDlo7gcAOOV7a6Q+Vik8P2ftU0YSl1qzQ==
X-Received: by 2002:a63:2c15:: with SMTP id s21mr29022606pgs.189.1635871245010;
        Tue, 02 Nov 2021 09:40:45 -0700 (PDT)
Received: from [192.168.1.2] ([59.95.93.69])
        by smtp.gmail.com with ESMTPSA id l11sm15815026pfu.129.2021.11.02.09.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 09:40:44 -0700 (PDT)
Message-ID: <534dab3c-72b1-047c-c188-6f86a57005e1@gmail.com>
Date: Tue, 2 Nov 2021 22:10:39 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove the goto statement
Content-Language: en-GB
To: Pavel Skripkin <paskripkin@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com,
 martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YX7cCtVss2RWOJ/a@Sauravs-MacBook-Air.local>
 <f26b4aec-c0a1-8c93-b34e-8b1a36ac81b3@gmail.com>
 <a74bd1d9-746c-650f-74e7-4a4b597348b7@gmail.com>
 <4c566e71-2426-b776-17a2-38f5f0b6f2b6@gmail.com>
 <da61a07e-8ee8-8737-d110-c8b107cf7303@gmail.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <da61a07e-8ee8-8737-d110-c8b107cf7303@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/11/21 12:57 am, Pavel Skripkin wrote:
> On 10/31/21 22:24, Pavel Skripkin wrote:
>>> I think rtw_init_default_value should return void. It's return value is not useful.
>>
>>
>> Sure, but you need to firstly remove
>> `ret8 = rtw_init_default_value(padapter);` and then make it return bool
>                                      ^^^^
> 
> I mean void, of course :)
> 
> 
> With regards,
> Pavel Skripkin

Intention for this patch to remove the goto statement. I think removing a local variable
for return value and changing the return type of function can be one separate patch.

On this patch intent to remove the goto statement only.


Regards,
Saurav
