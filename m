Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAD33FEF
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 04:57:11 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbe35e028aso2849925e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 21:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689310630; x=1689915430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5SgvJ0LD0GcBCOp6O6JeKYbZ8IbtnmLIrX6XHzA0Sk=;
        b=G8vqvtEYCFRJEuXZ8WyY3+VfH/Krm1g0Qf/thUZorLKaK4NY1jbqK2ugnZnDGytz/Y
         HNYbm0WakKw7drxW3EM56putLjpDPJReEipbtt8Kfz4bC9e1WMMUqVwMEvTjyf7noAOE
         W8uNcNtuwqrYGcmuaHLVNY4H0CQKDVPBpyW97V/TBm3Z2/JTqfaVJ5IvP26Mv6CFpIFx
         P7lf/qsT62Br9wcQ96yOzCCdVTTxpdD9tlyNsMoVcsqL/erw9X6QKK2bJZLakkLUvdIa
         bqkCfWBajFVYFN9V05hVeukGTVrbkMakXpuq47Lj5lEFmblq87ZgUK6JkTpyG+IR3tvC
         vtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689310630; x=1689915430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5SgvJ0LD0GcBCOp6O6JeKYbZ8IbtnmLIrX6XHzA0Sk=;
        b=SNTAraNKWkVGaPkTyDBdDU+aqYIx9htvVf4WsShJUM7M/YdmoDPQDVOX+wsZCTlnJM
         XwB1cFYNVbA7klmAmQM7SHG0SM/0QCKRPiBOsDL3YS313Pj6on7KPi6pVQE10xw4ngeS
         SehSsnk5Ts06ZGrXF3gkAT58YnOlon0rkqs1OP1TfhNpz2teTwE17a2K33YcWwPW1KE7
         4BsUAEsNHTdZIzkED2v1/m6HjT1JN4C/RRyVxMJhizBsiEtsljilDD2si9aoOA3M+6eh
         FViv/SNi8YlBNvw0GkAp/IbKGkiOoi8ew1LlReo2nu53Y9He1Phhkl/2M9HjSRcesHtf
         B4PA==
X-Gm-Message-State: ABy/qLaNbA/SVKdXRW1iwl8FP6Qms6NE+iT3phD3zwmMLBMIUvAEMKRA
	8i3rRy6EhLqutU9viav0KHQ=
X-Google-Smtp-Source: APBJJlG02bCqPvM2yGYWYaYSoqWswRjgV3Xcw4QX+96AaAA5SqRrHq9vkSIK+8B0xmqaUcx1xn4eWw==
X-Received: by 2002:a05:600c:4746:b0:3fb:b29b:61c3 with SMTP id w6-20020a05600c474600b003fbb29b61c3mr3145799wmo.1.1689310629565;
        Thu, 13 Jul 2023 21:57:09 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bc5d6000000b003fa968e9c27sm528321wmk.9.2023.07.13.21.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 21:57:09 -0700 (PDT)
Message-ID: <3b0804ad-bc6c-2f1c-5e67-4505b3da3d40@gmail.com>
Date: Fri, 14 Jul 2023 06:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 09/12] Staging: rtl8192e: Rename variable pBA
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, anjan@momi.ca, error27@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZK84sYjc9uHIWZcr@basil>
 <724b252e-0c72-6c77-4817-aee8d87a99cb@gmail.com> <ZLC3w4tjw16LwuEa@basil>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZLC3w4tjw16LwuEa@basil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/23 04:49, Tree Davies wrote:
> On Thu, Jul 13, 2023 at 11:54:40PM +0200, Philipp Hortmann wrote:
>> On 7/13/23 01:35, Tree Davies wrote:
>>> Rename variable pBA to pba in order to Fix checkpatch
>>> warning: Avoid CamelCase
>>>
>>> Signed-off-by: Tree Davies<tdavies@darkphysics.net>
>>> ---
>>>    drivers/staging/rtl8192e/rtl819x_BAProc.c | 106 +++++++++++-----------
>>>    drivers/staging/rtl8192e/rtllib.h         |   2 +-
>>>    2 files changed, 54 insertions(+), 54 deletions(-)
>>
>>
>> Hi Tree,
>> the p is typically for pointer. This is not wanted when you change the name.
>> But ba is is in use....
>>
>> Bye Philipp
> 
> Thanks Philipp,
>                                                                       
> A few thoughts...
> Looking at occurances of pBA, they all appear as local variable
> declarations of struct ba_record, mostly as function params.
>                                                                       
> I also see what you mentioned, as BA being already taken in
> rtl819x_BAProc.c:394 and line 292, but I don't 'think' that renaming them
> both to ba will result negatively(?).
> 
> Agreed, let's wait on Greg.
> 
> Cheers!
> Tree
> 

Hi Tree,

it is not so much about the compiler or if it works this way. When I 
read a program I often use Ctrl+Shift+F what shows me all variables in 
one folder (driver). I expect that I then always see one variable for 
one use and do not have to do a one by one decision if this belongs to 
the one content or to the other.

Please consider "readability" is important for kernel code.

Thanks for your support.

Bye Philipp
