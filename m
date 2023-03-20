Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6955F8477;
	Mon, 20 Mar 2023 21:19:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id w9so52260540edc.3;
        Mon, 20 Mar 2023 14:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679347167;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=re7TiJqeCbSUaRdCloCtXvztCWbhKAf+laHVsbnE85A=;
        b=OPA0CGlYz6Lx1Z5TkSTqcRfskHhs15sHVyCcD3aoDOm2ayy0QirKlroxrche6VuSRj
         IUJ/1FYHEfKBsUR7hknlHpgNpeFXPtVTBMrZdD3+3FObItuYjXNSXrNj6iECufUtettG
         7lQUM8RitYICzuQcTX6ZMg3WDqgcYm1+Zgq6VeyzHlpmzyN572XbNoAS7n6qLQG0kQVL
         YIbTdjy1bqgiWiiRT1TrjIOMdFogjTvBL1q2l+OIy5aOlwGOGAjnnc45+RdHeRLYHk5v
         rnwKkcrT617o9VK6aN7QRT0KfhHXlU1CkPG5KGcMv5rUYyzICVVckIb410hf5VVWSIzC
         /MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679347167;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=re7TiJqeCbSUaRdCloCtXvztCWbhKAf+laHVsbnE85A=;
        b=BuSudMZ437JAcOxM3++gMyqUilrNXHDeWfrCGs+kyPgd1dyrxOr4Qdh4qksBIZy+1e
         P141bmh1teQpAeN1la1FfsI2S7VQfVcI/h2c3qc9IXzw8smkpbD7zTk3y214iQW/bCuW
         DDC9W7swj9++ZHHSoFOcgLvnuymE31XRZIa8XCiZ8dbP2+OjNLbXFjI4msMC0nAV4SAB
         +SIDKS3914WAoZdHK03Z1gnMQ6Phs71psGoQTQNNS7lXjHKbXW7vlb4ByVejuV9wND0/
         NCwNq5iIfBSgkQR/+V1c9iUoF/HkLifopjFm0ScEAtcsOeQ5vYip8DBdqL8mbNWNpy3n
         JQAg==
X-Gm-Message-State: AO0yUKVkETEo5z2VrWcYzi1+HsI3mtU3L4NesO57xBBOQQM8WhqQTbgR
	zY8QEph0U1CO09W4BYk0KOo=
X-Google-Smtp-Source: AK7set+fgu+fiUg5TbsaAFkrWf+8ogVfbF9xmEoNK/wPpcrtX/1kzhY3Bk1Y6KtgIm0dKqckm9okxw==
X-Received: by 2002:a05:6402:517c:b0:4fb:395a:6aa5 with SMTP id d28-20020a056402517c00b004fb395a6aa5mr946951ede.9.1679347167464;
        Mon, 20 Mar 2023 14:19:27 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id m23-20020a509317000000b004fb95f51f54sm5368798eda.12.2023.03.20.14.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 14:19:27 -0700 (PDT)
Message-ID: <0bfcb878-1886-b838-cea7-3256d8024ddd@gmail.com>
Date: Mon, 20 Mar 2023 23:19:23 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: most: use inline functions for iface_to_hdm
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
 parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
 drv@mailo.com, dave@stgolabs.net, yang.lee@linux.alibaba.com,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230320205207.20062-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303202217110.2906@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303202217110.2906@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٢٠‏/٣‏/٢٠٢٣ ٢٣:١٧, Julia Lawall wrote:
> Maybe "define iface_to_hdm as an inline function" would be better.  "use"
> is not very precise.

Okay, I will edit it.


Menna

>
> julia
>
> On Mon, 20 Mar 2023, Menna Mahmoud wrote:
>
>> Convert `iface_to_hdm` macro into a static inline function.
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
>> change in v2:
>> 	edit subject line.
>> ---
>>   drivers/staging/most/dim2/dim2.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
>> index b8bd01ca1f11..21d1c9f24c3d 100644
>> --- a/drivers/staging/most/dim2/dim2.c
>> +++ b/drivers/staging/most/dim2/dim2.c
>> @@ -108,7 +108,10 @@ struct dim2_platform_data {
>>   	u8 fcnt;
>>   };
>>
>> -#define iface_to_hdm(iface) container_of(iface, struct dim2_hdm, most_iface)
>> +static inline struct dim2_hdm *iface_to_hdm(struct most_interface *iface)
>> +{
>> +	return container_of(iface, struct dim2_hdm, most_iface);
>> +}
>>
>>   /* Macro to identify a network status message */
>>   #define PACKET_IS_NET_INFO(p)  \
>> --
>> 2.34.1
>>
>>
