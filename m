Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC78E70
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 21:55:07 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so7222718otk.5
        for <linux-staging@lists.linux.dev>; Thu, 03 Jun 2021 14:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O0AHKb8SzFFWyVM+WVdBKXLWI+pRbVoX23KoodBk3sU=;
        b=C1mfTlItCazDj4zyHIyO33ijPj7JmggfgHu2V/Nvpv2qUNrwjWkFVbGnNVxrx1nhZ3
         m1AMpkKgydBbcVS0JKfDnWOfq7oiWGitw4yiEsZjdylIsG4RZdrpUvltw7k7/P9WlIfD
         kzrcqqbtk5mD2CmX13u4xWB6sg1iDm3Zg2ZLtdqrmBXpF7tLQ8VMHLNxXKlUQL/gxipI
         TuM8glglk02b6tDmFv6GxfesZ0+otfLxcGrSKQzGA9JLw0RQPY/rxi56mzRL/YKoDBYW
         CP3BzHMHSFsOdDrYHzSD/b0/i/U1p8L3ZBnmS9RQi0tobvoNx4sHi2hV4EVxXQEwmRXQ
         EOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O0AHKb8SzFFWyVM+WVdBKXLWI+pRbVoX23KoodBk3sU=;
        b=ckgKDfJ+jSRLRd3pLIq90TmjvC0IBTlfZcn+jaJj2N88dtxiNOCVfOT8abOVO1ET/n
         J1OZ48tNxqOfRZ04ilMKMCdLPv+wk1wpy2Uaau9LcsRarKe2Pn3mSOL0CBTiDTSL2tCM
         +HCYJqk7T0cZQd4k9NfXeIA+Ov2MwvT82zo/ly6IM3NX+P5Rn5nDgZ1iKvP2JieYxW5k
         mtC1deRhGjkrEXuaR2LG5LoUfdAXRemizgJlHgcTBKqzWLLlrZZFxWx5qnu8vb8oomhr
         E+4Fjayg9KuAvMWE1x4bODsOz7iA6D8BKWGZQwaik28Qk4gBMs0it3mugFPtMLlsKs7L
         smSw==
X-Gm-Message-State: AOAM532fpf9i7/BvnBmlrdB31NotN1OgPE5KBd+/p9op3kgZ1jFtrGJg
	FWsSLg8bes2bibtoODIuloqAYg==
X-Google-Smtp-Source: ABdhPJxP6X/Ko1xj6k9t4gVYLe86TlzGsdTkR4Pt66q4EqQYMk8GaP890NfpcG5tndgN9xlkjBFN2w==
X-Received: by 2002:a9d:7750:: with SMTP id t16mr1170972otl.135.1622757306927;
        Thu, 03 Jun 2021 14:55:06 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id i4sm31997oth.38.2021.06.03.14.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 14:55:06 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
To: David Laight <David.Laight@ACULAB.COM>,
 'Manikishan Ghantasala' <manikishanghantasala@gmail.com>,
 Alex Elder <elder@ieee.org>
Cc: Alex Elder <elder@kernel.org>,
 "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
 <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <10ad30e2-c906-b210-bf0e-5e20b6de1993@linaro.org>
Date: Thu, 3 Jun 2021 16:55:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/3/21 4:48 PM, David Laight wrote:
> From: Alex Elder
>> Sent: 03 June 2021 22:46
>>
>> On 6/3/21 4:22 PM, David Laight wrote:
> ...
>>>>>> --- a/drivers/staging/greybus/gpio.c
>>>>>> +++ b/drivers/staging/greybus/gpio.c
>>>>>> @@ -20,9 +20,9 @@
>>>>>>     struct gb_gpio_line {
>>>>>>         /* The following has to be an array of line_max entries */
>>>>>>         /* --> make them just a flags field */
>>>>>> -     u8                      active:    1,
>>>>>> -                             direction: 1,   /* 0 = output, 1 = input */
>>>>>> -                             value:     1;   /* 0 = low, 1 = high */
>>>>>> +     u8                      active:1,
>>>>>> +                             direction:1,    /* 0 = output, 1 = input */
>>>>>> +                             value:1;        /* 0 = low, 1 = high */
>>>
>>> Why are you even using bitfields at all?
>>> If you cared about the structure size you'd not have a byte-size pad here.
>>
>> Apparently I committed this, and it was part of the very first
>> Greybus drivers...
>>
>> These would be better defined as Booleans; there are others in
>> the same structure after all.  That would have avoided the
>> checkpatch problem in the first place.
> 
> Using 'u8' can be sensible.
> Boolean will be 32bit.

Not necessarily, sizeof(bool) is implementation defined.
And I thought you didn't think the size of the structure
was very important...

In any case, I'm open to changing the type of these fields,
and my preference would be bool rather than u8, because it
is completely clear what it represents.

					-Alex

> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

