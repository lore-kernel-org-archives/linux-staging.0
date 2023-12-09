Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1D1427A
	for <linux-staging@lists.linux.dev>; Sat,  9 Dec 2023 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iB0XeusZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a1c6dad2dd0so91332566b.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Dec 2023 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702142217; x=1702747017; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0iaRScDWRdOL6VuGlkfkdUquvKPIfgyBFrg9jM7oZI=;
        b=iB0XeusZAj09zHeb+y0lXZ2ycjSkpIgzpl9hAiVcgxY2gGJaBhsB4h3zDXeWWveGPt
         AzTnqHCwelFnyWzIbxODOlrjzo1xhz59k/YwSczJG+wsEP7jkJ5kBpTk2pr1/VYx7QwR
         2ZAR77rH8uAtqXJGoIV1pGlSKgFRaJXveJBGNQcrepMMTapq0m9/EVrr9P6SNrT0LZAN
         7DK840x0MmMwdHiMtvpgLtlV1yFdSvi0EtxG5C7oO7cNxkpSghC+C/J4Wrg7ILQYOUHY
         7Fg/BLr+K4VBPjfl6QAebOXzMGl27YmKif8e3DcwyexbomF1//c4DIGlJ69V9/aKO8/P
         rd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702142217; x=1702747017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0iaRScDWRdOL6VuGlkfkdUquvKPIfgyBFrg9jM7oZI=;
        b=M90Am/WdOQ4tWqmVdUH0wzkaptdy0Bh8UeR+BSJtzFUglA4zLrYjKaisEFtGRt6+Qg
         EaN4uXffZk+afEwXy08xYyOOYXcUnZzG4TZ98CpZGBZiZ5VANQlFiMTxdlXMGhFipuYi
         /3ykxQB/XUb4ob0CF9SCmKEk68MjaGKWM0lybvxkTpwykEgadWUGi2K4YbBdV9xaFvfQ
         0RTl8mm73dithxZHqe3k9Yc+qfpnI/eijVyV1O56ezu1AC3HpkpMeyuZH5oLzAWw8+lU
         1mcauPquk97Bczu0W6rhoIKEivZ3c/oUCeqCRiNggsFbHfNwtuzqx4qbIFjleqj5OfOa
         DYQw==
X-Gm-Message-State: AOJu0YzY4tXIouOvyE24fnLhAhY/QmCo0zPz7rv8nHpQKfTXKFVBxvtl
	e3aH6iMXHcQTqCZJl43ZdWU=
X-Google-Smtp-Source: AGHT+IGlgbz4xf/enP2HGJJ/RAHMI8BHNFqCOz1xUlkE4B63mvlzDQdOytvAIjDjQJLY29LgIloX0g==
X-Received: by 2002:a17:907:c207:b0:a18:96e3:ae2a with SMTP id ti7-20020a170907c20700b00a1896e3ae2amr1913831ejc.5.1702142216961;
        Sat, 09 Dec 2023 09:16:56 -0800 (PST)
Received: from [192.168.0.103] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm2415251ejc.64.2023.12.09.09.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 09:16:56 -0800 (PST)
Message-ID: <fec3284b-ee1d-4c53-8f01-76ab209584b8@gmail.com>
Date: Sat, 9 Dec 2023 18:16:55 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: rtl8192e: patch series renames (5) different
 variables
Content-Language: en-US
To: Gary Rookard <garyrookard@fastmail.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231208015536.21013-1-garyrookard@fastmail.org>
 <493fe783-46b3-4da7-b0d9-01425e6adf2a@gmail.com>
 <87y1e4dy2g.fsf@fastmail.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <87y1e4dy2g.fsf@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/23 22:56, Gary Rookard wrote:
> 
> Philipp Hortmann <philipp.g.hortmann@gmail.com> writes:
> 
>> On 12/8/23 02:55, Gary Rookard wrote:
>>> Hi,
>>> This patch series renames 5 different variables with the checkpatch
>>> coding style issue, Avoid CamelCase.
>>> Patch 1/5) renamed variable bCurShortGI40MHz
>>> Patch 2/5) renamed variable bcurShortGI20MHz
>>> Patch 3/5) renamed variable CCKOFDMRate
>>> Patch 4/5) renamed variable HTIOTActIsCCDFsync
>>> Patch 5/5) renamed variable IOTPeer
>>> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
>>> Gary Rookard (5):
>>>     staging: rtl8192e: renamed variable bCurShortGI40MHz
>>>     staging: rtl8192e: renamed variable bCurShortGI20MHz
>>>     staging: rtl8192e: renamed variable CCKOFDMRate
>>>     staging: rtl8192e: renamed variable HTIOTActIsCCDFsync
>>>     staging: rtl8192e: renamed variable IOTPeer
>>>    .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  4 +-
>>>    drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 22 +++----
>>>    drivers/staging/rtl8192e/rtl819x_HT.h         |  6 +-
>>>    drivers/staging/rtl8192e/rtl819x_HTProc.c     | 58 +++++++++----------
>>>    drivers/staging/rtl8192e/rtllib_tx.c          |  4 +-
>>>    5 files changed, 47 insertions(+), 47 deletions(-)
>>>
>>
>>
>> Please use present-tense as outlined here:
>> https://kernelnewbies.org/PatchPhilosophy
>> So rename instead of renamed
>>
>> Please use a more unique Subject for your coverletter.
>> It often cannot cover everything. But more unique is better.
>>
>>
>>
>> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> 
> Okay, "rename" it be, instead of me thinking in the past simple tense,
> of "renamed".
> 
> As for the coverletter(s)...repetition a big problem.
> 
> There's not much in the way of uniqueness that can be added...regretfully
> Tagging the Subject line with a numeric value is possible and
> should deviate the coverletter(s) enough so they don't "appear the same".
> e.g. staging: rtl8192e: this patch series (1) blah blah blah...
> e.g. staging: rtl8192e: this patch series (2) blah blah blah...
> e.g. staging: rtl8192e: this patch series (3)  "    "    "
> 
> Regards,
> Gary
> 

Hi Gary

Here is a proposal:
[PATCH 0/5] staging: rtl8192e: Rename variable bCurShortGI40MHz and further

That will give a pretty good recognizable name.

Thanks for your support.

Bye Philipp
