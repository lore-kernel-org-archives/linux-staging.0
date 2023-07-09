Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C2328E3
	for <linux-staging@lists.linux.dev>; Sun,  9 Jul 2023 23:40:22 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6b5f362f4beso3514362a34.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Jul 2023 16:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688946021; x=1691538021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjoav9DjNTMYdRsPrPB25AzH4TrQH4BWT3WECle+jRw=;
        b=mcTOXQ0kJMF/RxY420Rp+PHc1ZeChucL/Hg8DVFkpfZ7g9j01qHNJ9GCi5R2i0t4Mh
         uSMIwBYKj031UZTAX3PtRQ0Ra4uDjEmjNEENROqwgu4TGbV0H3x+mdwnC996LN9PmQZo
         MSdM1vrll12Z7VoOXccXI68+chOVJfoJYaiLGiHHQKI4s3pTMbcl0F7PdSeDl37jRJ0v
         WGu5qHDMs+umu6sAjjhp8K9ROlsxvB3OdTOliur1Wzg1r0xMQiRVebzW3VxqmOy13KSG
         NUYMqAv6mQvrK6Ov/lmogpMOF4WHBcYAgmVHgs7c0eN+cwLuFms7t/IIwDTz6wsVCRoE
         4mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688946021; x=1691538021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjoav9DjNTMYdRsPrPB25AzH4TrQH4BWT3WECle+jRw=;
        b=GDMP6uKlVKjm4Rbmm61jwUFKwB1NyNtwXHi76c0/SR2YHOKdAZWAcZQvpWHOMIKm5m
         kA00IsKRmt4yZYUZoQu3vTATSUgM2dH6SCC7j4Zchd7F0R25muipktCjvRmrh7OMwt1c
         fa+11lYol929elvjESR450lZvyi2kanQPG5fI+wLaPdTKitQjZ/Dgha6NhWub/ST1gwy
         +Y1OCvBPolfl9ZhsssdkiAhNbBSfeAxVrxZmBzYxjCqUr3w9IkizaSsgWe0NGv727vV5
         5WJNsvANys7pj8x+gon87ia2StjcArD4McmwmHj2zx4AAbQzkM/Y3rVTqBnqYm5P8Dsx
         jRjA==
X-Gm-Message-State: ABy/qLbhIn/Cti/xbb07mDvivgYJ7McKRciLBEMoaIDmzwX/GYr7q2Ql
	n/Y6Rvcz5251Rf0b8F9qq18=
X-Google-Smtp-Source: APBJJlHuTcGDJxgHe/HTEZMUKNkUJFm15BfEgmt4V+RieeKYp8uXpcsj1ct1wATSj/VD8ZTzPv1lTA==
X-Received: by 2002:a05:6871:88a:b0:1b0:5e21:29a7 with SMTP id r10-20020a056871088a00b001b05e2129a7mr12955811oaq.10.1688946021138;
        Sun, 09 Jul 2023 16:40:21 -0700 (PDT)
Received: from [192.168.86.31] (99-145-207-128.lightspeed.austtx.sbcglobal.net. [99.145.207.128])
        by smtp.gmail.com with ESMTPSA id v19-20020a056870e49300b0019ea8771fb0sm3877233oag.13.2023.07.09.16.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 16:40:20 -0700 (PDT)
Message-ID: <52f47b43-e735-0be9-ebac-e6e099a2dd09@gmail.com>
Date: Sun, 9 Jul 2023 18:40:20 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Add struct ad9832_platform_data to the include/linux/iio
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
References: <20230707211553.GA110890@madhu-kernel>
 <2023070858-brewing-outpour-764c@gregkh>
 <20230708154506.01785c65@jic23-huawei>
From: Madhumitha Prabakaran <madhumithabiw@gmail.com>
In-Reply-To: <20230708154506.01785c65@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/23 09:45, Jonathan Cameron wrote:
> On Sat, 8 Jul 2023 13:10:29 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>
>> On Fri, Jul 07, 2023 at 04:15:53PM -0500, Madhumitha Prabakaran wrote:
>>> Add struct ad9832_platform_data to the include/linux/iio
>>> for maintaining code organization and clarity.
>>>
>>> Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
>>> ---
>>>   drivers/staging/iio/frequency/ad9832.c |  3 +--
>>>   drivers/staging/iio/frequency/ad9832.h | 34 --------------------------
>>>   include/linux/iio/frequency/ad9832.h   | 30 +++++++++++++++++++++++
>> No, not yet, sorry.  Staging drivers should be self-contained, why does
>> this .c file need a .h file at all anyway?  It should all just be in the
>> .c file, can you do that instead?
> This is an aged driver so still has definitions that would be included
> from board files, hence the header.
>
> So Madhumitha, if you are looking at getting this driver out of staging
> (which would be great!) then first job is convert it from platform data
> to device tree (or better yet generic firmware bindings using linux/property.h)

Sure, I will take a look and work on convert it from platform data to 
generic

firmware bindings.

> A side effect of that is the header would go away as equivalent job would be
> done by the dt-bindings yaml file.
>
> Jonathan
>
>> thanks,
>>
>> greg k-h
