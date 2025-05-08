Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8322B8B6
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712606; cv=none; b=BMSr/tymMC8ZBeRzgj/+6eeVSTmBLmJhySLLjrIFrjXmLeRQZ8Af9fSuSHpyGC5gtH8kNkaFyb7PVbmLejo1cdj5e608+W6kjDG4T7SYQT7vW77rpQFaWTRUbB6XYeEyQoIbDBFzvkmSvR3Ru3Q5dik/ubgaUXZwucULhsOHuo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712606; c=relaxed/simple;
	bh=c6C0IDh8jGfLHYAmrhCgs46oNWjgnTtyZ8KVsxZOoT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHai0TqboktyQG5glPpWRNfijx1DFSIPLC5QK6fTFgs1htHxtNycZ0pbiPjo8jhhzNncjBuDQrMP7FM5MRYbwK8X3ZEkvfTnKFR83VwoLfsjKvGXnRPoH5WmcDcfMlYijDFgv+u0hqJGSsZzopivRhWKaSIzG6zX/626fyErark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cjYb4tRx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cjYb4tRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4T8aqjWnvUph2fimAuP0M4LAoZzE8Kq74Pp22qiTivI=;
	b=cjYb4tRxQ39lG7WnJY0VcN3C3IwaAHpH4UaAGRNVLYN8mylRw5u2LEfG3Sx1XwQ9faIgRc
	dtqM5WA0cJz7T1ARkr7Jv7eQ/TTARPDADmkSv0MH7UPFufiT4gt4nA/4yBiHct5YlXPu3j
	iEa6UskiaQ+7vChcHIgNMuZZayx8fTs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-V9wXPwiZNLicAs9GdRKA9g-1; Thu, 08 May 2025 09:56:42 -0400
X-MC-Unique: V9wXPwiZNLicAs9GdRKA9g-1
X-Mimecast-MFC-AGG-ID: V9wXPwiZNLicAs9GdRKA9g_1746712602
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac710ace217so80421266b.1
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 06:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712601; x=1747317401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4T8aqjWnvUph2fimAuP0M4LAoZzE8Kq74Pp22qiTivI=;
        b=xHtWYIxPruVkUbp8H4DVKkRpLhDBaInltzJ8/XamnvcU/jA4inUBd5DoMNie+A7J+W
         kTRA+NxlWUGthzobtYfTTrWfjVGRfZU3YguIeLDXT4wURe09en5IB5uxsNBgRr6DFQYC
         tYE3AVyKclKx/b7j7nHuRkByDJzo1sPayfmgJzMVGmm6JG/9KQeXhS6xBuBsqlt0fghb
         /TTPC3YL6Y537kQwGOLa1n3Q8aKdT/Mh8Bz7pWnnCHS020MDiy92zngepEDZfF2puxzS
         R4zolH+rfM/03lbGnDmtBLbQSO7QeJMlDi723JKyaSuTEcHrASYeRPYVpA2deU5xU+0b
         KUuA==
X-Forwarded-Encrypted: i=1; AJvYcCWtRgYkdeSnmW4eTSHx7BX6fD5hPHEbHv3h7NpfSouVUNBzodIouYESRbRfmVeEvtqVlxkHIL2h49FkziNl@lists.linux.dev
X-Gm-Message-State: AOJu0YwDxujvZcbVk2JrNGT3sXtmk4j3o7XPErApIWzhuZxbCrWdUZah
	dhuOn04u1SjL+hHZgXVnzF4AJy0eTArhCKi5XsfizYGco47pJ+EdLIm14QEVsIMOBlThITC8LOS
	p/O+6JzKwQuG9cdH8IV1epjTCIFB3SLJNg8UxXGDCf35hndKFwem+uNPgdl7nIf4=
X-Gm-Gg: ASbGncuTwp5hwRZtKRco6pC9xQOHwe84UQmhpoDdpL494xxYrFe6kO8FmIM2WWlVx7k
	428ceqd7LZW4Ms73rybjNqOxKLgRQ4hg7lfmvwbaqa+EDF2xPNJz4BU38BN00NxqbsaID+FduXk
	+Id6fPnEENzHZo2v1RVPPBrM4oH5x2L8JqMu+DB7iKEedcrwFGHY/dHMq+zGarGiV6Da/cp3ahH
	9/71H88LBgxXJawTXRY7s5OPIYjMYarR2Ce3hK+tVIw+/1vIcZSSfGslyI1El7PK5KxjrI4OhwZ
	UpR/swAp+Ps7OVLsf97D1l6LIDLaOnRXETZX74wLsRJVBopLX4xJF+KaHgXH114IgPc55DbABQM
	pZeOfzxQ6xGU/BjronStge91KBJQIDB7W89tLG7gR4LOJ+Je74Oju6TOn+DyK2w==
X-Received: by 2002:a17:907:181a:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1fe6c087fmr295870166b.21.1746712601579;
        Thu, 08 May 2025 06:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHONZfcA79C9YJCxJXm9PYVFvyZiVs0xzW0M3ZiHJd3VPv1yoYEcXa7Qpf6U9oWkZRVxppOhg==
X-Received: by 2002:a17:907:181a:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1fe6c087fmr295867766b.21.1746712601203;
        Thu, 08 May 2025 06:56:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146d4dsm1096324666b.15.2025.05.08.06.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:56:40 -0700 (PDT)
Message-ID: <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
Date: Thu, 8 May 2025 15:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
 <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
 <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1DqHuTbC7RRaqtDqPzphRDcsOuZhV2n7yB4tjmikJpc_1746712602
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 3:48 PM, Ilpo Järvinen wrote:
> On Thu, 8 May 2025, Hans de Goede wrote:
>> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
>>> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>>>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>>>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>>>> driver.
>>>>
>>>> Besides avoiding code duplication the int3472 version of the code also
>>>> supports more features, like mapping the powerdown GPIO to a regulator on
>>>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
>>>
>>> ...
>>>
>>> Don't you need the Kconfig(s) update to have proper dependencies all
>>> over these cases?
>>
>> Yes I do, I thought about doing this already but forgot to actually
>> do it, thank you for catching this.
>>
>> When I've some time for it I'll prepare a v2 of just this patch
>> addressing this and your s/then/than/ remark.
>>
>> Since you and Sakari are happy with them patches 1-5 can be picked up
>> and merged by Ilpo as is, so I do not plan to send a v2 of those.
> 
> Thanks for the quick reviews.
> 
> I took patch 1-5 into the review-ilpo-next branch with one typo in 
> change log fixed (reser -> reset).

Great, thank you!

Regards,

Hans


