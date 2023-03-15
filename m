Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA8525D;
	Wed, 15 Mar 2023 13:24:59 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id y4so46058402edo.2;
        Wed, 15 Mar 2023 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678886698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCY50QjuPjujyWujTieblfG0cFZqUjkT0Y7GLlfiD+4=;
        b=C1oVXOMB1x737taDtK3pxKjMwEVEQK+nG2Fk+ICTwQr1wwM0lIZIck4ojivkuUfT/e
         GA4+eo/kGeaVkRSX7gAkfE71+BtDtgRovQTwiCCv7uNquCEgeDGEU7ksYJZMH46J9M4W
         UELm/spu7+M/FHluwqAaJ3IhmgHgs/qwH9SoVkYiwwGrzywcGmRVEEopjHSid/d13n6m
         1KZ0KJJeVUC1Y2cZoV8F22USh9eYnHKIcFzYF9dxmVmoi4Zw2ZX2q9cu3mnPOYw5NPjh
         YBCnk+RIAjBTQhBU6RqCMUyS2tdwvs4Gm/q8DNkqU1Tt3ulrr/RZaUqgVeP4V3pVFqiE
         04ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCY50QjuPjujyWujTieblfG0cFZqUjkT0Y7GLlfiD+4=;
        b=7ksZrxCLROkGhPArdf4mRvwHI65t9Js8DBr/kY3bLVZpinp32STRIwpBIHPz70w75y
         j6laDtD80GRALlPX5NnWkM88Td+S+Jm3Cx3FNENKQ51GsaohE1PhkiDzvnCGNVXsYSk3
         F3t8ILmAoW8axO7teYYfG+DAU/9g5XPTfVevEAQTmZBHy0ks0Eqci+ulkok2pXYx1JsD
         BhIWmOAd3PSa9zvp42W45xdRYPZosqYbqY/Q6c8sNVYWJKKVmEUGLlQ5Om7NyWULjZ6j
         wcfx5vKTOmzQUhKRk+tW63crJDgRULayxOzzwJKCHwiJChk01MF+KLK9cEERhRa+avmG
         jPcg==
X-Gm-Message-State: AO0yUKU0yNzQj/rv0fDyJecdJCHRF5wXx1fQer48WiL5e33jSDnroA1d
	9TEVvLiV8Dye3HxXt1jTgRA=
X-Google-Smtp-Source: AK7set/l45QmGS/qadGp8aqBm4l1U3GuXoY3pvV9lULe0QnVlDDYzJAXlRlF8FeVQJtVtwqVKfqifQ==
X-Received: by 2002:a17:906:80cf:b0:884:930:b017 with SMTP id a15-20020a17090680cf00b008840930b017mr6463643ejx.60.1678886698170;
        Wed, 15 Mar 2023 06:24:58 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id mh1-20020a170906eb8100b008eddbd46d7esm2507185ejb.31.2023.03.15.06.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 06:24:57 -0700 (PDT)
Message-ID: <4ad4e955-3aea-7f35-fbda-e2f4f7f42693@gmail.com>
Date: Wed, 15 Mar 2023 15:24:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] staging: vme_user: remove unnecessary blank lines
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev, martyn@welchs.me.uk, manohar.vanga@gmail.com,
 zoo868e@gmail.com, jerrykang026@gmail.com, cuigaosheng1@huawei.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <b56c7b94e59a4051373af8b5d90a0685dfc9233a.1678882204.git.eng.mennamahmoud.mm@gmail.com>
 <8958127fc8fdb4fede7867f38579578af924b719.1678882204.git.eng.mennamahmoud.mm@gmail.com>
 <2403283.QvUyjg2IbA@suse>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <2403283.QvUyjg2IbA@suse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١٥‏/٣‏/٢٠٢٣ ١٥:١٩, Fabio M. De Francesco wrote:
> On mercoledì 15 marzo 2023 13:21:33 CET Menna Mahmoud wrote:
>> remove unnecessary blank lines before a close brace
>> as reported by checkpatch script
>>
>> CHECK: Blank lines aren't necessary before a close brace '}'
>> +
>> +}
>>
>> CHECK: Blank lines aren't necessary before a close brace '}'
>> +
>> +}
>>
>> CHECK: Blank lines aren't necessary before a close brace '}'
>> +
>> +	}
>>
>> CHECK: Blank lines aren't necessary before a close brace '}'
>> +
>> +}
>>
>> CHECK: Blank lines aren't necessary before a close brace '}'
>> +
>> +}
> There are no valid reasons about copy-pasting that warning 5 times in a row.
> Just say that you get that message from checkpatch.pl in five different sites
> in the file you are changing.
>
> What if you had had 20 or 30 occurrences of that same "CHECK" in the same
> file?


yes, got your point. I will edit it.


Thanks,

Menna

>
> Thanks,
>
> Fabio
>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>>   drivers/staging/vme_user/vme_tsi148.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/staging/vme_user/vme_tsi148.c
>> b/drivers/staging/vme_user/vme_tsi148.c index bfa604043355..2f5eafd50934
>> 100644
>> --- a/drivers/staging/vme_user/vme_tsi148.c
>> +++ b/drivers/staging/vme_user/vme_tsi148.c
>> @@ -1023,7 +1023,6 @@ static int tsi148_master_set(struct
> vme_master_resource
>> *image, int enabled, err_res:
>>   err_window:
>>   	return retval;
>> -
>>   }
>>
>>   /*
>> @@ -1741,7 +1740,6 @@ static int tsi148_dma_list_add(struct vme_dma_list
>> *list, list);
>>   		prev->descriptor.dnlau = cpu_to_be32(address_high);
>>   		prev->descriptor.dnlal = cpu_to_be32(address_low);
>> -
>>   	}
>>
>>   	return 0;
>> @@ -1773,7 +1771,6 @@ static int tsi148_dma_busy(struct vme_bridge
>> *tsi148_bridge, int channel) return 0;
>>   	else
>>   		return 1;
>> -
>>   }
>>
>>   /*
>> @@ -2220,7 +2217,6 @@ static int tsi148_crcsr_init(struct vme_bridge
>> *tsi148_bridge, }
>>
>>   	return 0;
>> -
>>   }
>>
>>   static void tsi148_crcsr_exit(struct vme_bridge *tsi148_bridge,
>> @@ -2530,7 +2526,6 @@ static int tsi148_probe(struct pci_dev *pdev, const
>> struct pci_device_id *id) kfree(tsi148_bridge);
>>   err_struct:
>>   	return retval;
>> -
>>   }
>>
>>   static void tsi148_remove(struct pci_dev *pdev)
>> --
>> 2.34.1
>
>
>
