Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED66C6A
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 14:59:07 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id u17so18326501pfk.11
        for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IepTlBuHR+SAb5h03gTcfvlJ5IvGp0rMxG8cXCwldQs=;
        b=ge6XZRTUFMm7Lw5XV2A6gTN45bAVZhYA3XyojJPKeCP+BanFPRiREWgxLM89cvinby
         G4LIkJv0s8vIhkxPsFzqmSIGzQZEC3OPVzu0nvZ3NP4CkICx+D5ylaqnDEqD+d8XsZMP
         fZDFwcFlHgQ0l1WHLPuS4RKplwWR0/TpomWITY6xbEzLq6mQr2gOb00c4hRtbBFSAlmf
         kqnwKkhSoWmmmruKk5ah5M3NOwdkSU/Ruub1NXU1ZmmQ+5xdzjyZRZxo8JdqWFQZCwbn
         p8n0th2BC6ev/fMYEAipp1UoXKvvoowWZhhWNfQGvwDyuqEK43CCr6zN8qMqYqWx1dSb
         Gmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IepTlBuHR+SAb5h03gTcfvlJ5IvGp0rMxG8cXCwldQs=;
        b=2Vd1VNHicScaUmxuvRuvvsCdHKP2QDDo+ZxtGKp/UgyRd/xmFiJ2zOwvYeVjHoZTon
         ip5K5N1PcFeGeQ0WuA7eMqTHNsWzBF4Y+iJJqxPT9i45Xzx8UaJ+yrKxfjFw730x2m3l
         Yl2AnaRFRq2FBU+aIeV/E7YAbGZXrF/IxE9LpFf3esYf/yeE1HWG1jgIDOfSAr2lH8SN
         uihXFbeV9HQuKZJjy9USFWnzLj1ckCqAn8caKwPoG975EXg7AJFm33jBPCvWU/fJXpw5
         3y8fbR8BYCCPRdhZrDbKfNc1dTJhyFL+aJXUV618Q58w8LYguZHG5z0sw6lCkZ3+i2tw
         QQPA==
X-Gm-Message-State: AOAM531BcMOm4qh7zZ1NFVVJ81vfVRRqM21TP1BoRFv9Iyxlraxx54Nl
	1E3ZoPg5bLeI5A57mqJr8dk=
X-Google-Smtp-Source: ABdhPJz3sK/PKvcu/GPrKaFwy32bd5HeM9MUPsEgSpZZkX+dcjPKcEHa4azDB/RFfCon/zye8hXsJA==
X-Received: by 2002:a63:1620:0:b0:375:948e:65bf with SMTP id w32-20020a631620000000b00375948e65bfmr22587716pgl.49.1647961146674;
        Tue, 22 Mar 2022 07:59:06 -0700 (PDT)
Received: from [192.168.225.67] ([157.49.254.255])
        by smtp.gmail.com with ESMTPSA id u17-20020a056a00125100b004fab9b19dcasm3149992pfi.163.2022.03.22.07.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 07:59:05 -0700 (PDT)
Message-ID: <745be03a-2ef6-f59e-2f05-6e9858c133fd@gmail.com>
Date: Tue, 22 Mar 2022 20:29:01 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] staging: rtl8712: Fix CamelCase warnings
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220318101440.13887-1-skumark1902@gmail.com>
 <YjRswrHu0JUm9331@kroah.com> <3a85ae64-00c1-6483-f1d7-c12abdd3ff3a@gmail.com>
 <1786742.atdPhlSkOF@leap> <YjmzlGZJaBxLljq2@kroah.com>
From: Sathish Kumar <skumark1902@gmail.com>
In-Reply-To: <YjmzlGZJaBxLljq2@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/03/22 5:01 pm, Greg KH wrote:
> On Tue, Mar 22, 2022 at 11:42:21AM +0100, Fabio M. De Francesco wrote:
>> On martedì 22 marzo 2022 05:30:29 CET Sathish Kumar wrote:
>>> On 18/03/22 4:58 pm, Greg KH wrote:
>>>> On Fri, Mar 18, 2022 at 03:44:40PM +0530, Sathish Kumar wrote:
>>>>> This patch fixes the checkpatch.pl warnings like:
>>>>> CHECK: Avoid CamelCase: <blnEnableRxFF0Filter>
>>>>> +   u8 blnEnableRxFF0Filter;
>>>>>
>>>>> Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>>       - Remove the "bln" prefix
>>>>> ---
>>>>>    drivers/staging/rtl8712/drv_types.h   | 2 +-
>>>>>    drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
>>>>>    drivers/staging/rtl8712/xmit_linux.c  | 4 ++--
>>>>>    3 files changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> [...]
>>>>>
>>>>>    	do {
>>>>>    		msleep(100);
>>>>> -	} while (adapter->blnEnableRxFF0Filter == 1);
>>>>> +	} while (adapter->enable_rx_ff0_filter == 1);
>>>> Ah, that's funny.  It's amazing it works at all and that the compiler
>>>> doesn't optimize this away.  This isn't a good pattern to use in kernel
>>> Do you mean the following code is not a good pattern in kernel?
>>> do {
>>> msleep();
>>> } while(condition);
>> Exactly, this is not a pattern that works as you expect :)
>>
>> I was waiting for Greg to detail something more about this subject but,
>> since it looks like he has no time yet to respond, I'll try to interpret
>> his words.
>>
>> (@Greg, please forgive me if I saying something different from what you
>> intended to convey :)).
>>
>> The reason why this pattern does not work as expected is too long to be
>> explained here. However, I think that Greg is suggesting to you to research
>> and use what are called "Condition variables".
> Kind of.  The problem is that "condition" here is just looking at a
> random variable.  There is no sort of assurance that the variable will
> actually change or that that compiler even has to read from memory for
> it.  It could cache the value the first time it is read and then never
> update it for the whole loop logic.
>
> Please read Documentation/memory-barriers.txt for how to fix this all up
> and do it properly.
>
> Again, it's amazing that the current code even works at all.  So maybe
> it doesn't!  :)
>
> thansks,
>
> greg k-h

Thank you Greg and Fabio for your inputs. Will check and fix this up.

Regards,

Sathish

