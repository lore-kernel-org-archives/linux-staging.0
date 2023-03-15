Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7C538D;
	Wed, 15 Mar 2023 14:21:57 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r11so24578156edd.5;
        Wed, 15 Mar 2023 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678890115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viILU/rucad5qZXI7oROvpfUDFl4dgM2hV94PfjFjMw=;
        b=ASIZZhmaQ9pHTtcXbAZFOJ6RdjRkcxCcDpQeIIXevYEneKXpXo5Qipu9X218jl+rmb
         zusnD/GWiMYa5BctlOYbYtP3CFMr75Esg03GjG/jzxiAjeKpF8BciC5oPOdZoHHVuTiv
         a+S6rYjyyZmGdEqIdVehqQ09vHgzEW5HyYlqvr0f21Iv7f9SSTm3WVBXh9PDRZTLmtKa
         Qwc4DIL67T6xJBk2ZFXMWc2P3Krog7Zysv/3C83Y9Y/JyRy6mqkDalG4l0GzqSeZci9j
         /4MPlPJTaw/RJUtuO8pdNIE65Mr01HIwCgBU3P49CZ/g845yQaw8w/gTdmVfDBH+51jN
         dlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678890115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viILU/rucad5qZXI7oROvpfUDFl4dgM2hV94PfjFjMw=;
        b=WGqbtsDEFX529cnory243i+2FxJNIFDBLgyokN7t5QlEhuZAeP47CokIgnvf1UHQT0
         myQ1iTXFrfJliK45+Um7szBdnQPtc9bACnugKJ/CNpWsbakOcKPgWi3jX2oGcpMPQh6R
         1eVmR9tcj7qSbY4aBYWdOvI16a+bAawFrxLNDol8TJDAvn8soiB+EaPRv3SXSbR2RMJv
         zv+quc3MdMTEuY/DmOFyf8PkpYx5hRgIayAigA3CflTLdHBKbCAo64B4oJWiABC9aFoi
         572VUHWW+VmaCU/iey1Cy5gDx7QXCspJ495CGx5BBnI2CK8xAYpCHhXPFB3fqvlBXCJl
         lQFg==
X-Gm-Message-State: AO0yUKUNKqqkYFQrH5R3Bha/Os8RUydPGFpst5mR4E1rFWSdpZe3nOBi
	vA9Q93YZEkl9pDzhpdSi4as=
X-Google-Smtp-Source: AK7set+mT5bhTLLOkiGyYLeqJmbualm8LQC5QUkIj0nWVWkTMvRFbXEZUI4EDYwk3XUYf3+a+jxZQQ==
X-Received: by 2002:a17:907:760e:b0:92b:de4c:f492 with SMTP id jx14-20020a170907760e00b0092bde4cf492mr5897911ejc.40.1678890115232;
        Wed, 15 Mar 2023 07:21:55 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id sd5-20020a170906ce2500b009222eec8097sm2577742ejb.75.2023.03.15.07.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 07:21:54 -0700 (PDT)
Message-ID: <11ebbcad-a779-59ee-fb88-6303183ea115@gmail.com>
Date: Wed, 15 Mar 2023 16:21:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] staging: vme_user: add space around operators
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
 martyn@welchs.me.uk, manohar.vanga@gmail.com, zoo868e@gmail.com,
 jerrykang026@gmail.com, cuigaosheng1@huawei.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <078be1ba242950f31d0aa13fe9815d92fe96468b.1678888612.git.eng.mennamahmoud.mm@gmail.com>
 <3cb654df-c08-881-f1c-52364ce2ad2b@inria.fr>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <3cb654df-c08-881-f1c-52364ce2ad2b@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١٥‏/٣‏/٢٠٢٣ ١٦:٠٣, Julia Lawall wrote:
>
> On Wed, 15 Mar 2023, Menna Mahmoud wrote:
>
>> add a space before and after the operator, for readability.
> add -> Add
> That is, start the sentence with a capital letter.
>
>> Reported By checkpatch script:
> By -> by
> No need for capital letters in the middle of a sentence, unless you are
> referring to a proper noun (name of someone or something).
>
> julia

Okay, I will fix them.


Thanks,

Menna

>> " CHECK: spaces preferred around that '+', '<<' and '>>' ".
>>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>> change in v2:
>>          edit commit message
>> ---
>> change in v3:
>>          edit commit message
>> ---
>>   drivers/staging/vme_user/vme_tsi148.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
>> index 482049cfc664..bfa604043355 100644
>> --- a/drivers/staging/vme_user/vme_tsi148.c
>> +++ b/drivers/staging/vme_user/vme_tsi148.c
>> @@ -737,7 +737,7 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
>>   		return 0;
>>
>>   	if (!image->bus_resource.name) {
>> -		image->bus_resource.name = kmalloc(VMENAMSIZ+3, GFP_ATOMIC);
>> +		image->bus_resource.name = kmalloc(VMENAMSIZ + 3, GFP_ATOMIC);
>>   		if (!image->bus_resource.name) {
>>   			retval = -ENOMEM;
>>   			goto err_name;
>> @@ -983,7 +983,7 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
>>   		goto err_aspace;
>>   	}
>>
>> -	temp_ctl &= ~(3<<4);
>> +	temp_ctl &= ~(3 << 4);
>>   	if (cycle & VME_SUPER)
>>   		temp_ctl |= TSI148_LCSR_OTAT_SUP;
>>   	if (cycle & VME_PROG)
>> @@ -2187,14 +2187,14 @@ static int tsi148_crcsr_init(struct vme_bridge *tsi148_bridge,
>>
>>   	/* Ensure that the CR/CSR is configured at the correct offset */
>>   	cbar = ioread32be(bridge->base + TSI148_CBAR);
>> -	cbar = (cbar & TSI148_CRCSR_CBAR_M)>>3;
>> +	cbar = (cbar & TSI148_CRCSR_CBAR_M) >> 3;
>>
>>   	vstat = tsi148_slot_get(tsi148_bridge);
>>
>>   	if (cbar != vstat) {
>>   		cbar = vstat;
>>   		dev_info(tsi148_bridge->parent, "Setting CR/CSR offset\n");
>> -		iowrite32be(cbar<<3, bridge->base + TSI148_CBAR);
>> +		iowrite32be(cbar << 3, bridge->base + TSI148_CBAR);
>>   	}
>>   	dev_info(tsi148_bridge->parent, "CR/CSR Offset: %d\n", cbar);
>>
>> --
>> 2.34.1
>>
>>
>>
