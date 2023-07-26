Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0451DA3C
	for <linux-staging@lists.linux.dev>; Wed, 26 Jul 2023 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690383591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJMF9LzzPNqBVN3P1BEd2BHKU8Jyc/6qhmCqGoJE7EM=;
	b=TiomJ4p1Vf4DgtThuI8taitI8n4Nnvuq/R0hcvk3U2IJSbscPo46gM4vMOAuekTE5U+thk
	7IHSwjlGYAqXh9UTICqt3VYxTolGbvRpsdEG51mHp2ZkVwtvkUPPMGbJVfRPqz3F96vDOT
	hsB5I9kU5lejF74zSmBxpxNHdslaSOc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-_iSxulT5MWy08KWpoOTB8A-1; Wed, 26 Jul 2023 10:59:49 -0400
X-MC-Unique: _iSxulT5MWy08KWpoOTB8A-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b9bee2d344so270431fa.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Jul 2023 07:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690383588; x=1690988388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJMF9LzzPNqBVN3P1BEd2BHKU8Jyc/6qhmCqGoJE7EM=;
        b=V7PFPBy5JFA2B3jsvy7yzmGmYgFckCeEcU6TUFLVVWtgzFy7xbRQScQcS8j+mm42m8
         LnW+civkw+jz5AwCfIobqS6DB05Ur5ffdH0VMNC/rRTw/eO9swynYovZfRi2sVJItJE4
         4D8A62o2CEf9HQpJJ1W3/8Rxde7sD2RxAjnqSKEJmvw4zKA1bPOWrtmGfLu0xABXJx3g
         rnaBIISpKx3hn9RI7MbMKQ2LcjeRinxl9hZ0yDRjtVmNSVnvOunSv50TchKEf90GaFrh
         qiVkU2tgyOKXWFwLOBhH0xmbTJAjPlFl28kIhlewfF1p/Y/TlQOCoG76z2ud3bpDf0I7
         twqA==
X-Gm-Message-State: ABy/qLZRSpAnZTwY8i8bs0L52STLEHEGKBtSusKkjHuyJid15/bk/pin
	83jOtQhrzIImA9qBxXEK9kh94nzi13jrVHNkghoK+9HuDXVf0RHoTwt3UUInZJFt7VsU69Sp5Y6
	ZFG6RZdPXEzos/oudcUod9znFTQ==
X-Received: by 2002:a05:6512:2030:b0:4fe:c40:3583 with SMTP id s16-20020a056512203000b004fe0c403583mr1416338lfs.39.1690383587727;
        Wed, 26 Jul 2023 07:59:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfjw+xBa4NmPtRFoaGioLqISBqspdvCpM6W0plVO8/ha3LOl8KBGeaWuVQNQS9994+Bxo2jQ==
X-Received: by 2002:a05:6512:2030:b0:4fe:c40:3583 with SMTP id s16-20020a056512203000b004fe0c403583mr1416325lfs.39.1690383587406;
        Wed, 26 Jul 2023 07:59:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906230200b00997e52cb30bsm9573752eja.121.2023.07.26.07.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 07:59:46 -0700 (PDT)
Message-ID: <5be97e28-2a05-8bdc-fdc2-91de0ee0ac77@redhat.com>
Date: Wed, 26 Jul 2023 16:59:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] media: atomisp: Remove empty isys_public.h
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Tsuchiya Yuto <kitakar@gmail.com>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230715170906.3627-1-hdegoede@redhat.com>
 <CAEth8oGmY+GTGw2Xs61GbD1uFycoCSetk1NQecphp4Sw9XbM0g@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAEth8oGmY+GTGw2Xs61GbD1uFycoCSetk1NQecphp4Sw9XbM0g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kate,

On 7/17/23 05:23, Kate Hsuan wrote:
> Hi Hans.
> 
> On Sun, Jul 16, 2023 at 1:09 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> isys_public.h is empty, remove it.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../hive_isp_css_include/host/isys_public.h   | 19 -------------------
>>  .../atomisp/pci/isp2400_input_system_public.h |  1 -
>>  2 files changed, 20 deletions(-)
>>  delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
>>
>> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
>> deleted file mode 100644
>> index 9dacef7a5cc1..000000000000
>> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_public.h
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> -/*
>> - * Support for Intel Camera Imaging ISP subsystem.
>> - * Copyright (c) 2015, Intel Corporation.
>> - *
>> - * This program is free software; you can redistribute it and/or modify it
>> - * under the terms and conditions of the GNU General Public License,
>> - * version 2, as published by the Free Software Foundation.
>> - *
>> - * This program is distributed in the hope it will be useful, but WITHOUT
>> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> - * more details.
>> - */
>> -
>> -#ifndef __ISYS_PUBLIC_H_INCLUDED__
>> -#define __ISYS_PUBLIC_H_INCLUDED__
>> -
>> -#endif /* __ISYS_PUBLIC_H_INCLUDED__ */
>> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
>> index 375c0db84b55..b1360eeb58df 100644
>> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
>> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
>> @@ -17,7 +17,6 @@
>>  #define __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
>>
>>  #include <type_support.h>
>> -#include "isys_public.h"
>>
>>  typedef struct receiver_state_s                        receiver_state_t;
>>
>> --
>> 2.41.0
>>
> 
> Thank you for working on this.
> 
> This file can be removed and it looks for me.
> 
> Reviewed-by: Kate Hsuan <hpa@redhat.com>

Thank you for the reviews.

I've pushed all 3 patches to my hansg/media-atomisp branch now.

Regards,

Hans




