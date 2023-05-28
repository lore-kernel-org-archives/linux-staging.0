Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77E3C05
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685280192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YG4jStiopgRv61U/kO8cjOPjY9KyLCxmZ6r+C4ZOzCE=;
	b=Fz1c5PXRSo7ERor3EwxE4uF7NEZy0eH4th8WvVh/Ght4c4j1x9by6/2XaFEpdZJbFisW+8
	zBMZlif+S0m/u5JaE1Yg0/QstBix9gka+kr+iCNwZB7oULp71dMjD4T0JxjFBnBtE3SFqH
	OCQQseofzZI6ESgUSaogWzaZPNapa5U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-WTJpg2kjOaeTt4UlG-j2OA-1; Sun, 28 May 2023 09:23:10 -0400
X-MC-Unique: WTJpg2kjOaeTt4UlG-j2OA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a356c74e0so220366366b.2
        for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 06:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685280189; x=1687872189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YG4jStiopgRv61U/kO8cjOPjY9KyLCxmZ6r+C4ZOzCE=;
        b=av5bRnjDpxM2ggVLlVINVqfv5dnuBeuXP501pJ+C2EhlXNrjK+aCcOFFCJpfizVBqP
         JkXW42u368YRHWizAQ36DTJhpOvsthOzMXbzFqaM7qUz6r2KTKx8T/R1W5/DXDHGVMPi
         AcEYd97GOq+s1Ljndm+DmsjK3mvZYSsd5LV3dcyDQJTbQ9rA0vyQZho6hE5MRjlo0j/0
         6C0+Nn54BDyXqqaC/DpvlDhBCT5PFlJq90AbBUt/kMI4Tdk8Csx1otuz8bC3MZ3F6udC
         pXiWwu3Sr4kUqs+EJP7l47VReFuTsmdMyY7BHur35EwuIMfr1V4bAO1BSPKeQHVhv6lV
         Dfug==
X-Gm-Message-State: AC+VfDwAYX+ePvVTYM38CVZmUH/cbfmirQ3N1xk1ESoX73F2GSy8nsBY
	UDuM7nW9AkK1ZsDzJT37uaOlgLkfHDCEpCMIgfw/LkanQE0t+LELAuvMIC+fxeBYBiLNhYXiWMq
	MgKrXF7V9oazxa1Vrp39dOtNwgQ==
X-Received: by 2002:a17:907:3206:b0:966:168d:8c9 with SMTP id xg6-20020a170907320600b00966168d08c9mr7855540ejb.32.1685280189794;
        Sun, 28 May 2023 06:23:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79MghFLcFBVgpI2+D9PGz03AoC6gFKUVaJujdmdnSnCJ5BM7KS9oBmCu9Fd00K9NRP17+dsw==
X-Received: by 2002:a17:907:3206:b0:966:168d:8c9 with SMTP id xg6-20020a170907320600b00966168d08c9mr7855515ejb.32.1685280189509;
        Sun, 28 May 2023 06:23:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kq12-20020a170906abcc00b009596e7e0dbasm4647713ejb.162.2023.05.28.06.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 May 2023 06:23:08 -0700 (PDT)
Message-ID: <76dedab6-24cf-f4e6-a780-85704f8d217e@redhat.com>
Date: Sun, 28 May 2023 15:23:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: atomisp: Fix buffer overrun in gmin_get_var_int()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>
References: <20230527155136.61957-1-hdegoede@redhat.com>
 <CAHp75Vf7bCQp+vJH02yJjmooxZSgNna5sRQ=UEq=4LmsDZPsFQ@mail.gmail.com>
 <b037dbd7-a95d-00cb-7763-f6e244626b13@redhat.com>
 <CAHp75VfN5YtBDv0caubfm=2Y8YpvqAxWeAa7dzJZe79S3teiqA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfN5YtBDv0caubfm=2Y8YpvqAxWeAa7dzJZe79S3teiqA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/28/23 09:55, Andy Shevchenko wrote:
> On Sat, May 27, 2023 at 8:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/27/23 18:55, Andy Shevchenko wrote:
>>> On Sat, May 27, 2023 at 6:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> Closes: https://lore.kernel.org/linux-media/26f37e19-c240-4d77-831d-ef3f1a4dd51d@kili.mountain/
>>>
>>> Is this a new official tag? (Just to my surprise)
>>
>> Yes, I was surprised too, checkpatch.pl now wants a Closes: tag
>> after a Reported-by: one, rather then a Link: tag.
> 
> Interesting...
> 
> ...
> 
>>>> -       char val[CFG_VAR_NAME_MAX];
>>>> -       size_t len = sizeof(val);
>>>> +       char val[CFG_VAR_NAME_MAX + 1];
>>>> +       size_t len = CFG_VAR_NAME_MAX;
>>>
>>> Why not sizeof() - 1? At least it will be a single point when change
>>> can be made and not breaking again in a similar way the code.
>>
>> I wanted to make the buffer one byte bigger to make room for
>> the terminating 0, not 1 bute smaller.
> 
> I understand, and I'm commenting only on the len assignment. Sorry for
> not being clear.
> 
> Hence you will have
> 
>   buf[SIZE + 1];
>   sizeof(buf) - 1;

That is just ugly IMHO, why take the sizeof something which
we know is SIZE + 1 and then substract 1 instead of just
writing SIZE ?

Note that for any future SIZE define changes both methods
are equally future proof in that they both automatically
adjust to the define changing.

Regards,

Hans


