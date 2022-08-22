Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2368F256C
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661180592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tlzmui5ajtbLtR4OUWaQmiktJo3sDd1IJ8yRtxLLoi8=;
	b=ChkuMkdGs59GtCKlENh7BdjVauYlu9CL1lwPutmOL1kcpRFm4IJTjclU0amknYNv2M3yKC
	Y++sJjA987mzC7HC27rDr36TPRStsOA5Fx8S4quS6fYeGPR9soMsWbW5ORA7ldCjG4u07m
	Rb5bONJDjnlUoftKBaGeHq9uoHOdp/E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-PtSVYCzhO7CREaHazvsy5g-1; Mon, 22 Aug 2022 11:03:11 -0400
X-MC-Unique: PtSVYCzhO7CREaHazvsy5g-1
Received: by mail-ed1-f71.google.com with SMTP id w17-20020a056402269100b0043da2189b71so7003399edd.6
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 08:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Tlzmui5ajtbLtR4OUWaQmiktJo3sDd1IJ8yRtxLLoi8=;
        b=hankXOQ9uwqvbIEzLTJjOlB+FT39RZ6CQCQUwRKXUkWSRHDdG8cdFzCuD6VA3nyuLd
         rAETQf/YK83+fjH9VFz6VIHfI+2iScrqfKcrX5WbXxi7918D3gNvHEElONug01diPhpe
         YLQ86GHk9XEokN2YEPHujEtiw49I0e7t89aR1AAAWyA430AblqG1YS/uD8P0cW72FAd0
         P0wr3YNt/1Jwhw6t8WmbXMIrOrvYlOCSf3PxXEA0sZG8dZeZvDBP3RzwH38ej0d8QetD
         fDgdDOpKKST7tHx3HE3lYQIGVqYTm4X39JX4PPUigHZHUczrfmwa2/mG2o+efTXqByey
         W2Cw==
X-Gm-Message-State: ACgBeo2RZmh5iwIGrM7PGu7gPG2srBR6yc+cfZ7GvscSuI7+wAxnj/kC
	6G8tISWLLR+a24IM6zkaXw5/YbpyAyS8NdLG6SFvgj41VNKTYx4R9NNv62yHw2RmPApMW7Dt/mK
	M619AafPWCudri/YpR2U3z9CATw==
X-Received: by 2002:a17:907:6d24:b0:731:7720:bb9b with SMTP id sa36-20020a1709076d2400b007317720bb9bmr13186715ejc.717.1661180589925;
        Mon, 22 Aug 2022 08:03:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5GcENmYTUOK/Snra3bYXwezD2rbZ+y/0FnfNgK7HseapkMA//RqNwjvM0/sz38dwcO63GZ3g==
X-Received: by 2002:a17:907:6d24:b0:731:7720:bb9b with SMTP id sa36-20020a1709076d2400b007317720bb9bmr13186695ejc.717.1661180589740;
        Mon, 22 Aug 2022 08:03:09 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v14-20020a170906b00e00b0073d6d6e698bsm2979526ejy.187.2022.08.22.08.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 08:03:08 -0700 (PDT)
Message-ID: <7978041f-f324-2554-cd64-04102330bb14@redhat.com>
Date: Mon, 22 Aug 2022 17:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 13/13] media: atomisp: Ensure that USERPTR pointers are
 page aligned
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
 Fabio Aiuto <fabioaiuto83@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-staging@lists.linux.dev
References: <20220821215027.461344-1-hdegoede@redhat.com>
 <20220821215027.461344-13-hdegoede@redhat.com>
 <CAHp75VdJETEOf_t_F0f591zOj3U_ALuadE4LHzF-8sXPPgUnEQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdJETEOf_t_F0f591zOj3U_ALuadE4LHzF-8sXPPgUnEQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/22/22 15:03, Andy Shevchenko wrote:
> On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The atomisp code needs USERPTR pointers to be page aligned,
>> otherwise bad things (scribbling over other parts of the
>> process' RAM) happen.
>>
>> Add a check to ensure this and exit VIDIOC_QBUF calls with
>> unaligned pointers with -EINVAL.
> 
> ...
> 
>>         if (buf->memory == V4L2_MEMORY_USERPTR) {
>> +               if (buf->m.userptr & ~PAGE_MASK) {
> 
> offset_in_page() ?

Ack I've switched to offset_in_page() for v2.

Regards,

Hans


> 
> Further we may utilize helpers from pfn.h in the driver.
> 
>> +                       dev_err(isp->dev, "Error userptr is not page aligned.\n");
>> +                       ret = -EINVAL;
>> +                       goto error;
>> +               }
> 

