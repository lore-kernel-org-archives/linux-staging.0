Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A11846;
	Mon, 20 Mar 2023 10:46:25 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id b20so11899209edd.1;
        Mon, 20 Mar 2023 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679309184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QE4spIUhieywTPmbfU5JkyQsvGJhPjI5IlXn9hUlyMg=;
        b=kSbyDQSDa9jw+RK3Cwwnsv8iwMfCrBT5KPAbXGEUWz8YFFLIE0g5Sbj5uFYNhIjM3t
         vrspPZse/wL3z/ANq52hXK0oJjf87+AlXJOog5nWkyx0KirJKXpuSaSaqh6eZ2C12/fa
         oW+E8KVxwsjJsqeU0mdmw8DuTk8qxpcdmyXQFtfCeMp7KwgTf4qk5e/dpQR7AkfQTEs0
         dP5xc1Bi4HGuQpQdHr1rwP8P0wj1ciWgKiCDSlCWEmA3Wc7/b+4CBTVDVUfU4Io1Om6/
         3lhHRB6Ea01qo2q0oIDTwluPYBykkFUjN25QdGt7FCuiphvnFFIjpEFkRVNiQ74nmXOE
         7bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679309184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QE4spIUhieywTPmbfU5JkyQsvGJhPjI5IlXn9hUlyMg=;
        b=UjrlqXRkyfXg/mEtu4317gciAdvu5SFUdNrYSJYBsWsGNCY79XYDG6EtUttFT6sspK
         sBNF6yxxN/7+mF92E01DCbcfH95k3Ws4sWGX15RxpDk6CimxVw9DnG1J/VZUAGB464Qv
         gkrOQq+hhh1ZntxPG3T3fzJvAASWhjpYBontvF29e4M3hBeAU31semN2EfLWMwJ+bMxi
         fMgU4yO+3pUhhyHzQkIs1yds0XDIFa1pxfIYYk3BuqtjZexjuEukE3KpQxUFUVPJrJqi
         lMzlBitiXGkwTZ/nlv6OpMFBmEa/PJVQ2vVQLTQiZmBSTzHIxyOC14Ux8MDspb91Mj66
         tSOA==
X-Gm-Message-State: AO0yUKVZI6DI7gTA6iMhBFWB69LR+x57UwQHcFeBhvHnd9tmlDM84sr1
	b3oF3FDrisDZzqYOo/LrJkg=
X-Google-Smtp-Source: AK7set9foj5JTf3GpQW2uMkxmSxrU69hOx1A+Sbbm6/DmpdIlp/WVoyJqf0+SvMKxiwVLxIloqbwxQ==
X-Received: by 2002:aa7:c857:0:b0:4fb:d10e:d9b4 with SMTP id g23-20020aa7c857000000b004fbd10ed9b4mr12028226edt.16.1679309183843;
        Mon, 20 Mar 2023 03:46:23 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id w3-20020a50c443000000b004ac54d4da22sm4726760edf.71.2023.03.20.03.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:46:23 -0700 (PDT)
Message-ID: <3d433474-93bd-b62c-1de5-7b029b1353f9@gmail.com>
Date: Mon, 20 Mar 2023 12:46:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: rtl8723bs: use inline functions for
 dev_to_sdio_func
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
References: <20230320103441.6537-1-eng.mennamahmoud.mm@gmail.com>
 <ZBg4tGlY+Epz0Vhd@kroah.com>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <ZBg4tGlY+Epz0Vhd@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٢٠‏/٣‏/٢٠٢٣ ١٢:٤٣, Greg KH wrote:
> On Mon, Mar 20, 2023 at 12:34:41PM +0200, Menna Mahmoud wrote:
>> Convert `dev_to_sdio_func` macro into a static inline function.
>> it is not great to have macro that use `container_of` macro,
>> because from looking at the definition one cannot tell
>> what type it applies to.
>>
>> One can get the same benefit from an efficiency point of view
>> by making an inline function.
>>
>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> index 490431484524..7ee821dbbae0 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
>> @@ -10,7 +10,10 @@
>>   #include <linux/jiffies.h>
>>   
>>   #ifndef dev_to_sdio_func
>> -#define dev_to_sdio_func(d)     container_of(d, struct sdio_func, dev)
>> +static inline struct sdio_func *dev_to_sdio_func(struct device *d)
>> +{
>> +	return container_of(d, struct sdio_func, dev);
>> +}
>>   #endif
> Why is the "#ifndef" check still needed now?  Really it was never
> needed, but now would be a great time to remove it as it doubly does not
> make any sense here.
>
> Oh wait, no, this whole thing can just be removed entirely, right?
> There already is a dev_to_sdio_func macro defined, so the #ifndef check
> catches that so your change doesn't actually modify any code that is
> used.  So this should all be removed, not changed to an inline function.

yes, got it.


Thanks,

Menna

>
> thanks,
>
> greg k-h
