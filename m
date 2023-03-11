Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257617B;
	Sat, 11 Mar 2023 14:54:36 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c18so5211853wmr.3;
        Sat, 11 Mar 2023 06:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmHWUjlzHy2uq6jgsY9kZteuN3pTbKb2ImH/1jCF6eQ=;
        b=LuURsCpZIINQtFwtZK+glZ+15xCNMYJZRgAuwTxksczmt7cTvU0Q7IQJ5rCUBix3qT
         uOva/zkx6kJEyeX+pAzSc2sSERls0OLmfnyrgkgiy0oXQUYuVovxkbjOZxxGoya9I8rj
         5fSm+sCSkkvDO4uSluV35M9l+PQ6IMKlx/c3b5anbcrgU28SvJIbrxpUx5xW6KXNFWRv
         eabrNhI1as/QJcZu0QUL8EkTQxbaj8zoLbW+YGpzxy6iaQdMoQTVJktKt3lIaS9pWnTz
         5UE7FxZRiojOT2jbPtgYjWUaCB75M/mkYrcm6P2p9FgDWT7W3a7j22djkiDJZ2Jenyab
         l1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmHWUjlzHy2uq6jgsY9kZteuN3pTbKb2ImH/1jCF6eQ=;
        b=TMYKAgQgZLecWfauHNurIZ6mZ3WymwKDJstxx7loq5F/6x2uxS7Hx876qRLG8besjp
         frF6yDh6X5J2bcqxTyJOfUb3BQDKR3NjGI+61XKFpbbn2UAPqcmqSj2XZt5BZ15Y6w3C
         4D1ehHud8pzLAQScHYKcvQr7HN++CQsWVLy4wqWIg1yCFbfYjq+rAjUkc4/Wyh9L7r7l
         DaaRYmjOqn3dDgzCXjUOLwSrUda6bIJYNbSba1ECbWfd93u0mI+xN6Bz+GNLRekMzq4a
         jhVVIliLkjVQuedL/Mi4vW0qCUjRiYqZagzecaWPUodcqPlfbGCjjffoRk/WRVOqyEuk
         /QPw==
X-Gm-Message-State: AO0yUKUicF5hIkRBH/JswvqRLXeR56a0vHv+vZR1Q/0d7BSnWHukc0Yb
	RqVe5Fpzd+v8FBvdYGyPQ7g=
X-Google-Smtp-Source: AK7set90czPe22mXRrMADvmQVUGpzqxCAePGoxPQnobgXgkhJKiobmxLyCSsg/wO+NYFohLbFNaELg==
X-Received: by 2002:a05:600c:19d3:b0:3eb:5d17:8ddc with SMTP id u19-20020a05600c19d300b003eb5d178ddcmr5991322wmq.18.1678546474349;
        Sat, 11 Mar 2023 06:54:34 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003eb2e33f327sm4017105wmo.2.2023.03.11.06.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:54:33 -0800 (PST)
Message-ID: <7a2a8cb7-7e4b-9cef-7fea-1e3ece48194b@gmail.com>
Date: Sat, 11 Mar 2023 16:54:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: greybus: eclose macro in a do - while loop
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303111532220.2802@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303111532220.2802@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١١‏/٣‏/٢٠٢٣ ١٦:٣٦, Julia Lawall wrote:
> Menna,
>
> There is a typo in the subject line.
>
> On Sat, 11 Mar 2023, Menna Mahmoud wrote:
>
>> " ERROR: Macros with multiple statements should be enclosed in a do -
>> while loop"
>>
>> Reported by checkpath.
>>
>> do loop with the conditional expression set to a constant
>> value of zero (0).This creates a loop that
>> will execute exactly one time.This is a coding idiom that
>> allows a multi-line macro to be used anywhere
>> that a single statement can be used.
>>
>> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
>> fix checkpath error
> The log message should focus on what is done and why.  The checkpatch
> warning text and the fact that the problem was detected using checkpatch
> is useful, but less, so it should come last, not first.
>
> Here, what is done is to enclose a sequence of statements in a macro
> definition in a do-while loop with a test expression 0.
>
> The reason why is to make it safe to use the sequence anywhere a single
> statement can be used.
>
> A period at the end of a sentence should be followed by some whitespace
> before starting the next sentence.
>
> julia


got it, thank you.


Menna

>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>>   drivers/staging/greybus/loopback.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
>> index 1a61fce98056..e86d50638cb5 100644
>> --- a/drivers/staging/greybus/loopback.c
>> +++ b/drivers/staging/greybus/loopback.c
>> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>>   }									\
>>   static DEVICE_ATTR_RO(name##_avg)
>>
>> -#define gb_loopback_stats_attrs(field)				\
>> -	gb_loopback_ro_stats_attr(field, min, u);		\
>> -	gb_loopback_ro_stats_attr(field, max, u);		\
>> -	gb_loopback_ro_avg_attr(field)
>> +#define gb_loopback_stats_attrs(field)					\
>> +	do { \
>> +		gb_loopback_ro_stats_attr(field, min, u);		\
>> +		gb_loopback_ro_stats_attr(field, max, u);		\
>> +		gb_loopback_ro_avg_attr(field);				\
>> +	} while (0)
>>
>>   #define gb_loopback_attr(field, type)					\
>>   static ssize_t field##_show(struct device *dev,				\
>> --
>> 2.34.1
>>
>>
>>
