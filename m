Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310E1C11
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 13:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681650540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YYjPZsCNrqGMbLHPtu1l9hSHzXZoEudtLitWN2eVd14=;
	b=hQ4ZSAFnL0dRuhZPv29tZkpqqJNod9B+prjdQYeboj7zntc32NUOYSOMjEHPMgGBDSSUQ0
	RpGGrGJxUWcz7gB8SJ3Dgcvr7WCtHCvAg6qUMZT3XHAiASw3Kam4y7BbLdtAMkKYQ0vKhB
	8bmha8QRVxCybpDGTSHZ0Zq15RmEc/o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-_ybz73WuPqSAnu-8x41vSg-1; Sun, 16 Apr 2023 09:08:59 -0400
X-MC-Unique: _ybz73WuPqSAnu-8x41vSg-1
Received: by mail-ed1-f69.google.com with SMTP id b60-20020a509f42000000b00504eca73d05so7378378edf.18
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681650538; x=1684242538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYjPZsCNrqGMbLHPtu1l9hSHzXZoEudtLitWN2eVd14=;
        b=Q9lzcbnkj9Iz4kjd+lwZiz1u0EQbafYwTnnnA58J9mfhLoh7zA54dHZHhQzoIimrcl
         3Jp4kAHRotmJgaRnTLCHq3D2vvGchQ9Km+tJvCEhTjOc5iip5ZuLcavnhUX3dLmMdZE5
         GpjeCqBCY0SpaksYtQs9agLsKKJvqAVMDhICLiJMOq4x3yJd7P/N08zE25X1rCz+s92P
         kAzW9CFKCsxINJ1HTn6NqkNNDY8CR0p3LLu6QpC28luBOH9Bjwx2+jpsAftid3QQfvjr
         mUPpoHUDqdzDpmIiCv/Lh0sWa/JXo8qgadmUv+VggPmdRhB3mg1+fzmMtUcZraQpvcR9
         cenQ==
X-Gm-Message-State: AAQBX9ekyGR/DiSHT69BvD/w3AGwVNFwZlIkCXsfNf8oy6ydTC/SJWdj
	SzarTaYsiJ4mLsR4H8JaaSrC5IOp84//wz/ZKkIccGm84XRTzrgP2umw2zqF5KXnVjwgcrZx2wo
	hGJ6/RmiM5tyu1kSK2JdPjuI6Fw==
X-Received: by 2002:a17:906:5616:b0:94a:4107:3975 with SMTP id f22-20020a170906561600b0094a41073975mr3988003ejq.76.1681650537909;
        Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8T5yCBh6wbbbBr7heC2qmakzdZtsbI8F4J0aabpm/Yfbud6LdMSwb8q3jPy/KSS4e7PhRhQ==
X-Received: by 2002:a17:906:5616:b0:94a:4107:3975 with SMTP id f22-20020a170906561600b0094a41073975mr3987989ejq.76.1681650537667;
        Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g25-20020a17090613d900b0094edfbd475csm3581864ejc.127.2023.04.16.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 06:08:57 -0700 (PDT)
Message-ID: <1a4a7016-a871-abbe-e8cb-c8a7241de50f@redhat.com>
Date: Sun, 16 Apr 2023 15:08:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Staging: media: atomisp: include: mmu: include
 <linux/processor.h> instead of <asm/processor.h>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Anup Sharma <anupnewsmail@gmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, andy@kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <ZDuhnLPczec5qJnq@yoga>
 <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Veaqp4O1jcBHZZh2L5ReMU1+2vH+FfRzfLyY8CdwZwq+w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/16/23 12:01, Andy Shevchenko wrote:
> On Sun, Apr 16, 2023 at 10:20 AM Anup Sharma <anupnewsmail@gmail.com> wrote:
>>
>> Fix following checkpatch.pl warning by including
>> <linux/processor.h> instead of <asm/processor.h>
> 
> Missing period at the end. But the entire patch seems unnecessary
> since it's all about x86, and we have more arch headers there anyway.
> Anyway it's up to Hans. Also see below.

Right, given how much real work this driver still needs this
really feels like needless churn, so I'm not going to take
this patch, sorry.

Regards,

Hans



> 
> ...
> 
>>  #include <asm/intel-family.h>
>> -#include <asm/processor.h>
>> +#include <linux/processor.h>
>>
>>  #include <linux/i2c.h>
>>  #include <media/v4l2-subdev.h>
> 
> This seems a bit chaotic with the ordering of the headers here.
> 
> ...
> 
> If you want a good patch, you need to understand what headers are
> _really_ being used in the header file. Then drop unused, try to
> compile that and fix all files that will have missing headers after
> that. This will be a very useful clean up!
> 

