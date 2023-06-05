Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F28134BB
	for <linux-staging@lists.linux.dev>; Mon,  5 Jun 2023 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685957373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98nYeq3pFKsuigocZLVMIcRPqxkIdBUW+cdvwG62xaU=;
	b=c3HG042KhfdIh8fqh+PU4qDq0Cdm/nmvgZ/L5p9Lw2p8eseNmh+z1ESxJA2SpZ/rx7sLnY
	myvbiv/STQJjmEpD/1Xz83csE5kNNw2ra5Fj7kKo49gxXMZhUV05RITODPtDWx5CIcbLKk
	s5nQEuIjrJTLJpaBfqJZ8CownlWelPA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-8t2r6K_8OPaj0IpPPMbcOw-1; Mon, 05 Jun 2023 05:29:32 -0400
X-MC-Unique: 8t2r6K_8OPaj0IpPPMbcOw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355c9028so337437366b.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Jun 2023 02:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685957371; x=1688549371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98nYeq3pFKsuigocZLVMIcRPqxkIdBUW+cdvwG62xaU=;
        b=jH+BnZWHlsGhCk46HUDRFFpy6Hpwjd/aujbYtWMS04wXjELfucAYmTlMvvCmwlz42i
         CEsd+a9OtncIzFVOW2XeZ5c/Cq/KwMt7tKPDG2I1cKUGjgDLIc5x3Ss8nScc2iTxV4tj
         yAPgEMjC46boxEor8YAmuXG/DyJR4EvWKkuSfVhYDWUcR306sQFomiFd2BSZBLwNyFZ7
         UlEXqAiDoK8/GJdO4V7MEXJYrIpycbCsh5muF0Pf8ynZ9mwqR6rXJDdO5LBFVYgcmGbG
         c0g7uZNKgl1qkJ1x8GOJUGos7r/8Zsg2BHWwxoC5WdCBGVsvLFCIfBz/FjWFXY9znNaQ
         H7Qw==
X-Gm-Message-State: AC+VfDwA38TNPnqbXD5ZXV9MJ1QUhxizi1HmRvTqFmEEMnUWxiZagxSf
	8zKL9BK+DCT7/i3z1JfNaP76ds60hNRVu4TrBh9/XSpyDmlKSHK70Szp8kJ9cF+7i+2LnWg7OT8
	/xK92goblflgjaBJvmZS3RnosIg==
X-Received: by 2002:a17:907:25c8:b0:949:cb6a:b6f7 with SMTP id ae8-20020a17090725c800b00949cb6ab6f7mr5137424ejc.56.1685957371638;
        Mon, 05 Jun 2023 02:29:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6adDqv06/bBGTB/iOHPlzSDcjRhww0ueLa4zPZJZcEblwVBiWyei6CTsNsTGFJCgQfuhDDyQ==
X-Received: by 2002:a17:907:25c8:b0:949:cb6a:b6f7 with SMTP id ae8-20020a17090725c800b00949cb6ab6f7mr5137414ejc.56.1685957371374;
        Mon, 05 Jun 2023 02:29:31 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bj21-20020a170906b05500b009661484e84esm4044523ejb.191.2023.06.05.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 02:29:30 -0700 (PDT)
Message-ID: <72b083af-bbf9-199b-55d2-9749e7b8a13d@redhat.com>
Date: Mon, 5 Jun 2023 11:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/5] media: atomisp: ov2680 work + add testing
 instructions
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230604161406.69369-1-hdegoede@redhat.com>
 <CAHp75Vd7t3Li7d9B2JEXzqsvc0uKvcuro5dV8Tj6x2Wai46LFw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd7t3Li7d9B2JEXzqsvc0uKvcuro5dV8Tj6x2Wai46LFw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 6/4/23 21:28, Andy Shevchenko wrote:
> On Sun, Jun 4, 2023 at 7:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is some more ov2680 sensor driver work. This work is the result
>> of trying to get the main drivers/media/i2c/ov2680.c driver in a shape
>> where it is good enough to replace the atomisp specific version.
>>
>> The plan is to port recent improvements to atomisp-ov2680.c over
>> to the main driver. While working on this I noticed some issues which
>> need fixing before copying them over to the "main" driver.
>>
>> Besides that this also adds a small patch to make testing with
>> gstreamer easier and this adds testing instruction to the TODO file.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> (a nit-pick in one patch commented separately)
> 
> Thank you!

Thank you for the reviews. I've pushed this series (with the nitpick
addressed) as well as the previous 3 fixes you reviewed to my
media-atomisp branch now.

Regards,

Hans




>> Hans de Goede (5):
>>   media: atomisp: Stop resetting selected input to 0 between /dev/video#
>>     opens
>>   media: atomisp: ov2680: Stop using half pixelclock for binned modes
>>   media: atomisp: ov2680: Remove unnecessary registers from
>>     ov2680_global_setting[]
>>   media: atomisp: ov2680: Rename unknown/0x370a to sensor_ctrl_0a
>>   media: atomisp: Add testing instructions to TODO file
>>
>>  drivers/staging/media/atomisp/TODO            |  33 +++++
>>  .../media/atomisp/i2c/atomisp-ov2680.c        |  15 +--
>>  drivers/staging/media/atomisp/i2c/ov2680.h    | 118 +++++++++---------
>>  .../staging/media/atomisp/pci/atomisp_fops.c  |   3 -
>>  4 files changed, 95 insertions(+), 74 deletions(-)
>>
>> --
>> 2.40.1
>>
> 
> 

