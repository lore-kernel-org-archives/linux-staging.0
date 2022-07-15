Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7873D68
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 16:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657901458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XaMq6FvBqOfWKFWfBu8sC/EEX51ptx9f4Z6IWwEgNU=;
	b=ggttuFwpPT2J54XZxtTeQUwQo2taFNZeeQ7ss1m9NCKFxlxuqEXvUkPtvvf6RzQtRTcFtD
	GdTzlJPbxkVvHS66VxPOapcWbtVAAQNpwRLjCecDkNs1dQsDs6UghgFyvagPRdVW3DLZrU
	XhpZFoY8CFD76SVy0graZcojBGpkdrQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-Zhso8OJ4Ps6pz6wWNa8uXQ-1; Fri, 15 Jul 2022 12:10:57 -0400
X-MC-Unique: Zhso8OJ4Ps6pz6wWNa8uXQ-1
Received: by mail-ed1-f69.google.com with SMTP id z14-20020a056402274e00b0043ae5c003c1so3739569edd.9
        for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 09:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8XaMq6FvBqOfWKFWfBu8sC/EEX51ptx9f4Z6IWwEgNU=;
        b=Ai6XI8tZHAcboi+qgT9G5/FCnBmM5128+X/nqj5ngYdXi10xvE6YC6YVd/2wJ6H+Qv
         FKmXQ0L9HKU9N1VOKS3e1TAHUc7sHZL86TZvxty5IfG4OXbS+QaJMYb3Us3JnPzOXXtm
         rf3Nnwl/ka1TK6fvwzuZOFSE2KMnUe8ayEpwDiQUm/djRD4Qb/6NefGAz+BeJkhXrlwa
         LRYyazTZy3iwc+Rcwid9vLcQbRGgGTEKzj7FxW7ifKdG5lQEAumMgnJ5LJQBxvAQggs/
         L/nYaiaqE7OIVyztXr0nGKjzbtjZ3hk5DB3oF1MDhEk/X3SuMR4DniK3Te8hM2g0Ne5s
         jaoQ==
X-Gm-Message-State: AJIora9FbrBmMmyIOiXrRxLWyIX/Pdoc0Y+t9Z0ROiWeO455KWCl4AKE
	10RGCusN4LIFwUawKWpHopuuYXxTWdFqdAU9pBX+3H+Inb2Yp/gFFDcWyd5TjM+D6SUEDwqVfFu
	reXUhQ5Tg5WVQ1TcBIXgXUkoKoA==
X-Received: by 2002:a17:907:7395:b0:72b:86f2:4fd5 with SMTP id er21-20020a170907739500b0072b86f24fd5mr14809503ejc.332.1657901456512;
        Fri, 15 Jul 2022 09:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sGPF962LQCuMf7LW05Hw5qyEz2ftp+YloQEdNuGIYE5083G6ZICW18glU++kGuR6cW460ohw==
X-Received: by 2002:a17:907:7395:b0:72b:86f2:4fd5 with SMTP id er21-20020a170907739500b0072b86f24fd5mr14809472ejc.332.1657901456284;
        Fri, 15 Jul 2022 09:10:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id f21-20020a17090631d500b0072ee7b51d9asm1635141ejf.39.2022.07.15.09.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 09:10:55 -0700 (PDT)
Message-ID: <7622e82e-f5ec-1aa4-0497-12f16e3a2755@redhat.com>
Date: Fri, 15 Jul 2022 18:10:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RESEND PATCH 0/3] staging: media: atomisp: Convert to
 kmap_local_page()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tsuchiya Yuto <kitakar@gmail.com>,
 Martiros Shakhzadyan <vrzh@vrzh.net>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>
References: <20220707200718.26398-1-fmdefrancesco@gmail.com>
 <becfe58a-b4c3-4ae1-4ab2-456057ac7d22@redhat.com>
 <20220709174645.080fc795@sal.lan> <2264743.ElGaqSPkdT@opensuse>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2264743.ElGaqSPkdT@opensuse>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/12/22 12:43, Fabio M. De Francesco wrote:
> On sabato 9 luglio 2022 18:46:45 CEST Mauro Carvalho Chehab wrote:
>> Em Fri, 8 Jul 2022 17:55:26 +0200
>> Hans de Goede <hdegoede@redhat.com> escreveu:
>>
>>> Hi,
>>>
>>> On 7/7/22 22:07, Fabio M. De Francesco wrote:
>>>> After waiting months, I'm resending three conversions to
>>>> kmap_local_page(). I'd like to ask if there is anything which 
> prevents
>>>> these patches from being accepted.
>>>>
>>>> Please note that these patches were submitted on April 2022.
>>>>
>>>> For you convenience here are the links to the patches, the "Reviewed-
> by:" 
>>>> and "Tested-by:" tags:
>>>>
>>>> [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_store()
>>>> https://lore.kernel.org/lkml/20220413225531.9425-1-fmdefrancesco@gmail.com/
>>>> https://lore.kernel.org/lkml/Yli+R7iLZKqO8kVP@iweiny-desk3/
>>>> https://lore.kernel.org/lkml/2d096f20-dbaa-1d49-96e9-a7ae6c19f7fe@redhat.com/
>>>>
>>>> [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_set()
>>>> https://lore.kernel.org/lkml/20220413212210.18494-1-fmdefrancesco@gmail.com/
>>>> https://lore.kernel.org/lkml/YldNhErgt53RqYp7@iweiny-desk3/
>>>> https://lore.kernel.org/lkml/0b04ad1a-e442-1728-ef2c-bab386a4c64c@redhat.com/
>>>>
>>>> [PATCH] staging: media: atomisp: Convert kmap() to kmap_local_page()
>>>> https://lore.kernel.org/lkml/20220408223129.3844-1-fmdefrancesco@gmail.com/
>>>> https://lore.kernel.org/lkml/b0aed731-b56f-4378-b50e-fc0cbccbdb84@redhat.com/
>>>>
>>>> Fabio M. De Francesco (3):
>>>>   staging: media: atomisp: Convert kmap() to kmap_local_page()
>>>>   staging: media: atomisp: Use kmap_local_page() in hmm_set()
>>>>   staging: media: atomisp: Use kmap_local_page() in hmm_store()  
>>>
>>> Thanks, the entire series looks good to me:
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Yesterday, I applied all pending patches at media-stage, including those. 
>> Please check if  everything is ok, as I had to solve some trivial 
>> conflicts.
>>
>> Regards,
>> Mauro
>>
> I just checked those patches at media-stage and everything seems fine.
> Thanks for applying them.

The landing of my series in media-stage looks good too,

Thanks.

Regards,

Hans

