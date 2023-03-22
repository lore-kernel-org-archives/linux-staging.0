Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006323AD;
	Wed, 22 Mar 2023 10:16:50 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r11so70642711edd.5;
        Wed, 22 Mar 2023 03:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679480208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpDA9uUcZvzGnD9pLQgn6VIYHngYXS5+gJ+ISFCbQ4k=;
        b=BS3B+GSSEJ0WqKPR/Ct8/TRtsDaddf81nnqiToflDBOwCObEAzue/bZloBZi6Z8T3a
         k2zTRNcyJKTzaWUNeLHH3HsejObgT34xz7bkSY+AecBkPYsEPgvXO/PS5gObiyhAxdAa
         y6W3BrbODyb1e07sODfcNIOrMw0mh6I2pmfIczHnxYaL9mnyjduX/7U4j3Q2PJtYLQJp
         Atk+N0Rlobkd0WvizQ4gOE12XkvLOLxN1WJPjE4mFvX0JVMNKNUhfom/BSJKhzaonz8N
         HH4yArtKlQOR08pyd+trd+dCllFDVuGrccSnzWiW5DnAiCJ+JtapdWKTTlDtWw6TdhsP
         M7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679480208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpDA9uUcZvzGnD9pLQgn6VIYHngYXS5+gJ+ISFCbQ4k=;
        b=dIj9IHlrY9nCXmO497rTxaTcwEaqWrUPjyfo68n9ukQj7OKhYSyCuy/sCHGWBrJrRW
         xJZcL5M0x9hFz7wIKoFQaOJ9GhGAGfMoWgKRrSWE9lfD+DiX/b4a+PFM5WU9JQsaIcTB
         FAJlOuGf8AhbUHeoAob7HcmqBEJFPMFURzRPrlOs27aB9kzYOFTlxBh790u7P/FLDC2v
         EXS1pqNlgmuLrj4afggDzSBopS4tg1IuHaT7eqx3u/zG0lZisiqDWjPjtQRlcsJodu0B
         Mu9fzaiEUhNpUhErHDUXIMbU3D2QhwNLvFe2O01W2dydG5zGohjCl0+E3QabxZ5TVral
         HIJQ==
X-Gm-Message-State: AO0yUKVLu6RqC28Y6JkvKAo5LxluZcozjNeAlfTgl9bnxfN0rspXKdQN
	KJhg41MnRGzfUdVUmQOf4Cs=
X-Google-Smtp-Source: AK7set9piLYg6v1I/RemGzk8hcZOPEJZSGDct+Dz8Mm8jN4Nphd/jZq6O7eXIb6Xzl+L7wPOqJ+lpw==
X-Received: by 2002:aa7:d3d4:0:b0:4fb:78a0:eabf with SMTP id o20-20020aa7d3d4000000b004fb78a0eabfmr5776830edr.29.1679480208273;
        Wed, 22 Mar 2023 03:16:48 -0700 (PDT)
Received: from [192.168.1.16] ([41.233.203.65])
        by smtp.gmail.com with ESMTPSA id b26-20020a170906195a00b00930a4e5b46bsm6930377eje.211.2023.03.22.03.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 03:16:47 -0700 (PDT)
Message-ID: <9e339ec0-d244-ea22-d9d8-70a76ac1bc0a@gmail.com>
Date: Wed, 22 Mar 2023 12:16:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: remove unnecessary blank line
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org
References: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
 <369edb35-b93b-301c-fcef-8e64e5d4a122@inria.fr>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <369edb35-b93b-301c-fcef-8e64e5d4a122@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٢٢‏/٣‏/٢٠٢٣ ١٢:١٤, Julia Lawall wrote:
>
> On Wed, 22 Mar 2023, Menna Mahmoud wrote:
>
>> Remove unnecessary blank line before struct as reported
>> by checkpatch:
>>
>> " CHECK: Please don't use multiple blank lines"
> Since there is no vX indicator, one doesn't know that this replaces some
> previous patches.

yes, sorry I missed it because I dropped the previous commits, I will 
add it.


Menna

>
> julia
>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>>   drivers/staging/greybus/greybus_authentication.h | 1 -
>>   drivers/staging/greybus/pwm.c                    | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/greybus_authentication.h b/drivers/staging/greybus/greybus_authentication.h
>> index 7edc7295b7ab..48b4a9794d3c 100644
>> --- a/drivers/staging/greybus/greybus_authentication.h
>> +++ b/drivers/staging/greybus/greybus_authentication.h
>> @@ -41,7 +41,6 @@
>>   #define CAP_AUTH_RESULT_CR_NO_KEY	0x03
>>   #define CAP_AUTH_RESULT_CR_SIG_FAIL	0x04
>>
>> -
>>   /* IOCTL support */
>>   struct cap_ioc_get_endpoint_uid {
>>   	__u8			uid[8];
>> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
>> index 3fda172239d2..26d39e08c3b6 100644
>> --- a/drivers/staging/greybus/pwm.c
>> +++ b/drivers/staging/greybus/pwm.c
>> @@ -24,7 +24,6 @@ struct gb_pwm_chip {
>>   #define pwm_chip_to_gb_pwm_chip(chip) \
>>   	container_of(chip, struct gb_pwm_chip, chip)
>>
>> -
>>   static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
>>   {
>>   	struct gb_pwm_count_response response;
>> --
>> 2.34.1
>>
>>
>>
