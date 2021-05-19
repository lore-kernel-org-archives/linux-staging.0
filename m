Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709F2FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:56:56 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id g18so8533706pfr.2
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Ewak3FTzWtebTNxoU2UtRKv4KOXoJSP/mAhC0k4hkGM=;
        b=hkd5bEswK+JxcSDlikju+ubqHI1xgQN8FMkYsn7Vos/ojbGpOVlnVRo46fJcopr+2/
         dZoWgvHogx/isb9Pbvj5zLSOPJqa0tZErbp9pINkN634jI7lLNYngeljfYeCHA1cZ5f1
         n5i2TpmPC7pERnWWD/VGE6/UcA3SGhtph8kshiQz9fVQFfna3U2Ogd/y99NyOJA6FiDe
         H9PF1MjWBY6NcbJNa5GV3defOCr2B7Fb4xWYSq4fo5uALRhXLPsedBLvz8vAmPjeaZRP
         87SAZk9cQqNYZJQd2B5ND5UOS+FRU32J0ZMQ3A0uuUcfKSkWDrEjTBNMrxFHb7N+CtoN
         hKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ewak3FTzWtebTNxoU2UtRKv4KOXoJSP/mAhC0k4hkGM=;
        b=qgUTZsNJFuh6X5L5E0VSS1nz8+Q6QZThaI8rO3oR0+D6nHfKTOwwMWOFi4Zi6GPk5h
         bVENHNWL76QK5g2/kDznIoT60GX1vSl7YS1zQTd0pj1nZbG+3Ly7IUbYkw+gqUWH3b5v
         L8OgkZ6nJ7ywEghLQPSwIDqQw65UmYFZH7jFnR5fcRBJd1pWBaatcCJRsllLlPZu6G40
         s5NcZKmWFXEFtyda2CtO4s+Odw8iWlJw2zE1caopLBpTKmKMJgm+kPuG6Cdx36LrMrD6
         K+iwyyBB5E6N5WREGo+HjcfQiDuWK6edf5W6VKNXsp/ekOR48Hb4vObxSHz+vlwjOUeR
         n+bg==
X-Gm-Message-State: AOAM533Sn036A+c3VXfXUhc4aHLZBjR69lvt6/3v6YKpeGqgcpNgzQKr
	JqFE165MBDpYTWxStLG0UL+S+29OyN9jc58/
X-Google-Smtp-Source: ABdhPJw9825Sqsf9H9wHD5H3DXvyJJo/Vpqnzgh5AFQb9O1AmveZhjrk2GjlrBvHahxN3M2cunyddg==
X-Received: by 2002:aa7:97ad:0:b029:2e0:26a8:8da5 with SMTP id d13-20020aa797ad0000b02902e026a88da5mr2154968pfq.37.1621439815488;
        Wed, 19 May 2021 08:56:55 -0700 (PDT)
Received: from [192.168.1.2] ([103.196.78.23])
        by smtp.gmail.com with ESMTPSA id u21sm14568714pfm.89.2021.05.19.08.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 08:56:54 -0700 (PDT)
Subject: Re: [PATCH] staging: android: ashmem: Declared file operation with
 'const' keyword
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan
 <surenb@google.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20210519081958.7223-1-hridayhegde1999@gmail.com>
 <YKTM8KmXI8bXUSqp@kroah.com> <0ddb894f-f66f-f31b-ef8a-0646e0a99b9f@gmail.com>
 <YKTfbdFhvM7fbpet@kroah.com> <08cf8110-cf84-8784-c919-eba27474b796@gmail.com>
 <YKUm8tf3bKvCf1YI@kroah.com>
From: Hriday Hegde <hridayhegde1999@gmail.com>
Message-ID: <3d382048-17d5-e933-7c5e-1af7de218a16@gmail.com>
Date: Wed, 19 May 2021 21:26:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YKUm8tf3bKvCf1YI@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 19-05-2021 20:25, Greg Kroah-Hartman wrote:
> On Wed, May 19, 2021 at 08:06:14PM +0530, Hriday Hegde wrote:
>> On 19-05-2021 15:20, Greg Kroah-Hartman wrote:
>>> A: http://en.wikipedia.org/wiki/Top_post
>>> Q: Were do I find info about this thing called top-posting?
>>> A: Because it messes up the order in which people normally read text.
>>> Q: Why is top-posting such a bad thing?
>>> A: Top-posting.
>>> Q: What is the most annoying thing in e-mail?
>>>
>>> http://daringfireball.net/2007/07/on_top
>>>
>>> On Wed, May 19, 2021 at 03:00:08PM +0530, Hriday Hegde wrote:
>>>> I am not really sure how to do that and how to reflect it in the patch i followed what was taught in the Beginners course and it does not mention building. I know i need to test it out but is running 'patch -p1 < x.patch what i need to do?
>>> That does not build the code you changed, right?
>>>
>>> I'm sure whatever course you took, it did reference the fact that you
>>> need to ensure that your change actually works properly by the very
>>> least being able to be compiled correctly.  Please go over those
>>> instructions again.
>>>
>>> good luck!
>>>
>>> greg k-h
>> I am using the A Beginner's Guide to Linux Kernel Development (LFD103) by the linux foundation for this but i cant find any commands to as to build and test , the only way i tried compiling is with a custom Makefile and it didn't work, i've got a few errors so the const keyword might not work here since the variable is being written to.
>>
>>
> That is correct, when compiling (i.e. building), the compiler shows that
> this is not a correct change.
>
> thanks,
>
> greg k-h
Oh ok will work with something else.

Thanks.

