Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59199134C1
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685210085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8eJ/cXDkAmlYB3L6yJyK01/JHnXRcbD7xaxDyk7iTU=;
	b=DHDofQOYiAQ+bvjluGWvoFe62cIrVW3ptgk8fEIXs+u5RH1u5qt86/Zccifr3XsQkMt8q1
	s8fkYaDNF5XpJLUzTIxDulgkRyNWh//RYNqGIduLyN0oG04mjNuMg/xrmoFgZw3a4LUIxE
	kc0IjhX12THDKM11ZRAxM5NOd8nBBJM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-T-IbgXH-N9GY30qxtPsj7w-1; Sat, 27 May 2023 13:54:43 -0400
X-MC-Unique: T-IbgXH-N9GY30qxtPsj7w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-96f9aa23593so171577866b.1
        for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 10:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685210082; x=1687802082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8eJ/cXDkAmlYB3L6yJyK01/JHnXRcbD7xaxDyk7iTU=;
        b=ZAGxMEgopbaYghDJFPBrSJ1OGQo+YPYDQLLZJJgwsKpKuylvhgFTYisYGHoK1sGaSg
         5c2FwZX/DCNXJUlNkWx66bwBit/CWJMLWUBpAVCHJpsRifY/Y34eIsbBnbjWVSkKIAYB
         GwUZYtlGMCbio+E0Uy1mAvyVH97le71CqXsZ3AHk2KDQTBwEBkzCC8kNZjM416+y/AK6
         tLLB000HW2YR24bmEnhV9TkKVGls/DpKz6UJKsrTNKtmISH6SsCADTm50QUCSbtfPFQc
         dxiSZL+1dSTdltWcjcgo3L98lXZIsdNWaUXAi3PrJYMpUVnW/k2ZQqR2bbdKUf1fbQeO
         faZA==
X-Gm-Message-State: AC+VfDyZv6e5IOBwiKT8Aa2o66nDtVB/8oNYGZp4MXbSwmlQ1mJoljAn
	CLqTvJE0HaadTueKI20AKvPw3MuqKqhNDNZt8Abt6qIVa4Wp6NG8e2fUfcWLtNKykoEypqzAEYR
	ERCW+lXZFzx13kNkksOXj4uCjtA==
X-Received: by 2002:a17:907:70b:b0:965:d18b:f03a with SMTP id xb11-20020a170907070b00b00965d18bf03amr6913257ejb.58.1685210082645;
        Sat, 27 May 2023 10:54:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yoMMDWiis+yTe+JXsJtl4DUk8Lys+TDdbwmh/+SDqIocKPM+9g3hvwCRMJHoRsmxuUDQXYw==
X-Received: by 2002:a17:907:70b:b0:965:d18b:f03a with SMTP id xb11-20020a170907070b00b00965d18bf03amr6913243ejb.58.1685210082388;
        Sat, 27 May 2023 10:54:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id uz16-20020a170907119000b00965a56f82absm3656320ejb.212.2023.05.27.10.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 10:54:41 -0700 (PDT)
Message-ID: <b037dbd7-a95d-00cb-7763-f6e244626b13@redhat.com>
Date: Sat, 27 May 2023 19:54:40 +0200
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf7bCQp+vJH02yJjmooxZSgNna5sRQ=UEq=4LmsDZPsFQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/27/23 18:55, Andy Shevchenko wrote:
> On Sat, May 27, 2023 at 6:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Not all functions used in gmin_get_var_int() update len to the actual
>> length of the returned string. So len may still have its initial value
>> of the length of val[] when "val[len] = 0;" is run to ensure 0 termination.
>>
>> If this happens we end up writing one beyond the bounds of val[], fix this.
>>
>> Note this is a quick fix for this since the entirety of
>> atomisp_gmin_platform.c will be removed once all atomisp sensor
>> drivers have been moved over to runtime-pm + v4l2-async device
>> registration.
> 
> ...
> 
>> Closes: https://lore.kernel.org/linux-media/26f37e19-c240-4d77-831d-ef3f1a4dd51d@kili.mountain/
> 
> Is this a new official tag? (Just to my surprise)

Yes, I was surprised too, checkpatch.pl now wants a Closes: tag
after a Reported-by: one, rather then a Link: tag.

> 
> ...
> 
>> -       char val[CFG_VAR_NAME_MAX];
>> -       size_t len = sizeof(val);
>> +       char val[CFG_VAR_NAME_MAX + 1];
>> +       size_t len = CFG_VAR_NAME_MAX;
> 
> Why not sizeof() - 1? At least it will be a single point when change
> can be made and not breaking again in a similar way the code.

I wanted to make the buffer one byte bigger to make room for
the terminating 0, not 1 bute smaller.

Regards,

Hams

