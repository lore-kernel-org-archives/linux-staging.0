Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3E70
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 17:26:28 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id q15so20579135pgg.12
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kc0+FMTh1fPx01D55Spy3LcqXmB7S09x8WY0Dxu365k=;
        b=fVTQMabckqboIr0/IMEVPxBxbF/HEtsovdQRtkXQiqkQOqTNwm/ID92EtPEYT2H6mg
         SqbYfSzv882VpyKwCoqaA73Eui7m/pXDku0QSpXoSkMuRnvYAASMG+8WRBna3VYsnVVi
         L1e8PRnRcoXF9TOvo5YuQ1H2x66VegH60wjEcUHtXFMqt+JQFwjUan+hCT7kW52DU2TC
         +q5aV/Li2YAeFmdKrBsykqJMSiCQ7HtkkpFGhIfLF7jx6ZordI5EAYh+akXgBcfIyChX
         a5DpY3PvYwZYz37rxG+g5THKVaNCdi7Y8uv1EnRIcdzlMzrF8wAF4uKey1CzScXHkryP
         GykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kc0+FMTh1fPx01D55Spy3LcqXmB7S09x8WY0Dxu365k=;
        b=i+XHFgXp8c/o0yCY4PhRulETgVjFG0+9cGbrB3WA03SiNqWrjoXZCPRmMbs3CfFkvb
         X2Pn2+mHIz4h1ug3RC9vzf7+yYKq7/wC2KrDd3nQAYavNj6DMPR8Wo3fgQBQhKqkpgMt
         U2GQiiierN5GWhTJW+h2pl1VgaHlpKjhgSgMFq38T87x8xgZKY9ldwAUwFcrtcxbkzGM
         A3fu+RJ+73GF74iZlY2T3+DdsZ8Eexpr7JatxcH3Z2m8idxaQwBhRzdPzJF0vTH/dG92
         LgYuXU9RuiuwBDuB+zJbRNNhcgwu7eULpxk15IZgSVVEcLdpTOWNZdy3MKkGXPXZVZFq
         ujPA==
X-Gm-Message-State: AOAM533PVoOAKNVhkNu0vBPwnnYJ/V7i0rwHjgKMaZbSjCr9GhjrZPmp
	lJv7PiM7pS76oJ5LYzmAZIQ=
X-Google-Smtp-Source: ABdhPJzBL7dL+K4AaWffSd8Hhot68UFvNRF8DXg4o7RNb8LfCBNLbMB7ygs96g4hHsXIBRcg3JzZ8w==
X-Received: by 2002:a63:7107:: with SMTP id m7mr14927390pgc.287.1621877187748;
        Mon, 24 May 2021 10:26:27 -0700 (PDT)
Received: from [192.168.93.106] ([118.200.63.8])
        by smtp.gmail.com with ESMTPSA id c16sm11392439pfd.206.2021.05.24.10.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 10:26:27 -0700 (PDT)
Subject: Re: [PATCH] staging: vchiq_arm: Using copy_from_user() to copy data
 from userspace address
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: nsaenz@kernel.org, gregkh@linuxfoundation.org, stefan.wahren@i2se.com,
 arnd@arndb.de, dan.carpenter@oracle.com, phil@raspberrypi.com,
 amarjargal16@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210522053429.82710-1-phind.uet@gmail.com>
 <YKilx7iNSBYYbXSs@zeniv-ca.linux.org.uk>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <51eaace6-e464-147f-85be-ec8188e0e2ef@gmail.com>
Date: Tue, 25 May 2021 01:26:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YKilx7iNSBYYbXSs@zeniv-ca.linux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/5/21 2:33 pm, Al Viro wrote:
> On Sat, May 22, 2021 at 01:34:29PM +0800, Nguyen Dinh Phi wrote:
>> This commit to fix the following sparse warning:
>> incorrect type in assignment (different address spaces)
>> expected void *[assigned] userdata
>> got void [noderef] __user *userdata
>>
>> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index afbf01b7364c..2a4fc599f977 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -960,7 +960,10 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
>>   			current->pid);
>>   		userdata = &waiter->bulk_waiter;
>>   	} else {
>> -		userdata = args->userdata;
>> +		if (copy_from_user(userdata, args->userdata, sizeof(args->userdata))) {
> 
> 	The contents of userdata (local variable of type void *) is uninitialized at that
> point.
Sorry, That was my mistake.

> Just what do you think that call of copy_from_user() would do? 

Because according to the definition of struct vchiq_queue_bulk_transfer, 
the args->userdata pointer is userspace address.
