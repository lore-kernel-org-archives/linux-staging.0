Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB98C952;
	Tue, 21 Mar 2023 16:22:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id eh3so61866251edb.11;
        Tue, 21 Mar 2023 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679415767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVACjUDTIgBWv8C/PMxK28Am87k7w8br8nJW4GJZZR0=;
        b=YeKR29GC4ZRYgPv/Y0cozd7GizqxUkCySuYWpgCi+mYAmFiNbkl5JNC/S5e+59E0Ir
         3N9crSkggg3s1Qfwqc7FQMc98ZT0fiUYezs4MqBULKIEjdDVzgIo4gHMsjJsSMlziF9O
         j+Cai+bysAZJcryv6aqjP5LPtZncWd9WnfAjagf14wy5jotYNXcSdfPgNZn7mxLIrv71
         vS2lDoO/I5o8GGcHvvWOTtwUYO2qOnB5+p+Ln9nKNfn1/FnCI8eZaRFmek5CpxKIVM9O
         +LP/ZorWWdjVc//gw1xoF/Ro2YGuBFz22a/z0PaG+T9KtrPQfWH6z1hr9RD87Z4i6GEU
         swwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679415767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVACjUDTIgBWv8C/PMxK28Am87k7w8br8nJW4GJZZR0=;
        b=YsomCnekVwiVUJUtCCnmD0kGDbwmXCglrJbZ+EqaUDX5gug2Ld1asBcO3x3LfWNvZj
         br+G18C9UP1HJlIJCfaC9gkK9ZooL4yJMYTeHTEUzZ336texhUcP9LVy0UM5dde2A4V0
         r9vTXidSbdauQGmLqhn8mTM4GSl/aBki1NBXTEA3SUqJBc3MDV8ovL9Dr/5suM6+r+vq
         VyKXgiGp/PdJQSk2XFFcKZxvBz1xc1KLC3nKeZQn8o067H0xJ5SHwFoHtxyDPqPEcYZN
         Y63zGBewI7WXL7zXjpLO8/rr+PhiWPYVFVFb71otsrnsnItMe5Am9wm4E1sJwGlmqumG
         rSfg==
X-Gm-Message-State: AO0yUKW8gj2qrFZ2r1jI+rR49XewELj8S/9euCX6hCkFLm4/Tdqq19m8
	m8I3KndMBHyNFuZZYB//Pz52baEJiRA=
X-Google-Smtp-Source: AK7set8xKZE0Kxa4lqQIAdiFOKdoiDSGBpiO/C6qFIaLk47Lyfs7Kd6bg/7JqOnXzrjm5unqdtG+kg==
X-Received: by 2002:a17:907:6f1b:b0:932:365a:c1e7 with SMTP id sy27-20020a1709076f1b00b00932365ac1e7mr3578251ejc.67.1679415767389;
        Tue, 21 Mar 2023 09:22:47 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id kb1-20020a1709070f8100b00933c4a25735sm3352516ejc.100.2023.03.21.09.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 09:22:47 -0700 (PDT)
Message-ID: <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
Date: Tue, 21 Mar 2023 18:22:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] edits in greybus driver
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٢١‏/٣‏/٢٠٢٣ ١٣:٤٦, Julia Lawall wrote:
>
> On Tue, 21 Mar 2023, Menna Mahmoud wrote:
>
>> This patchset includes change happened in greybus driver in three
>> different files two of them patch one and three related to
>> checkpatch issue and in second patch convert two
>> `container_of` macros into inline functions.
>>
>> Menna Mahmoud (3):
>>    staging: greybus: remove unnecessary blank line
>>    staging: greybus: use inline function for macros
>>    staging: greybus: remove unnecessary blank line
> Different patches should have different subject lines.
But I have already the same edit in both file, so should I re-write the 
subject for one of them?
>    You need to either
> be more specific about the file affected or merge the two patches with the
> same subject into one.

each patch related to different file. So, Can I to merge two commits for 
different files but have the same edit in one patch?

but in this case no need to create patchset for all changes in `greybus` 
driver, right?

If okay with that, should I versioning the patches to resend them again, 
or should add "RESEND" subject prefix?

please tell me the best way to resend these patches, appreciate your help.


Menna


>
> julia
>
>>   drivers/staging/greybus/gbphy.h                  | 10 ++++++++--
>>   drivers/staging/greybus/greybus_authentication.h |  1 -
>>   drivers/staging/greybus/pwm.c                    |  1 -
>>   3 files changed, 8 insertions(+), 4 deletions(-)
>>
>> --
>> 2.34.1
>>
>>
>>
