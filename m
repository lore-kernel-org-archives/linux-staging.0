Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA233D6
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 18:53:44 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 12so9075212oix.12
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 11:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Fu1lGl7KUsvDaTbuVWYLbekm8YyPZlc63692CIkIOQ4=;
        b=kqvea8iiRG8zzVfBOX5D9/92tO/jUsNRwm8NhE4XILL2h++pMU788D91v8CUG5ab3L
         nQui74RKeviFn6UtUTJmy1XTkDdPkjsQAAKpkc8mZfqj9wYM6ieI2ezHfMc3zxd+UEfI
         fjMvAA9s4ZCIEwFISUBRqPx+JXwyiI4Jzkd3AUcoirDfKqi8A8TkX0mkXsAWbykJWhYW
         YvWh53jZM/kHtsVMCxt/0ay45rl8NFummy1hFReLcJwDUGuOEeH9M6vJPxkKGUqfFzZQ
         LbwwcxR3kw6evTwT0B/E92PD7EuFE+0PiEJPA98/2M+XdrpITfQtwNytGrQDpy2E+gru
         16aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Fu1lGl7KUsvDaTbuVWYLbekm8YyPZlc63692CIkIOQ4=;
        b=1eEqzu6Zm0L4s8cFekWKfvGUC8Yrhf4j/psgJu+FSONGKwSOotkWtWO8ozU6b5clVe
         vQbaj6GJA+wbn7XdYjYZ8AN1K4swNWApq3eSHXgRbTuENHDo4y7VjLKf9SSdwqZSrVIP
         DO1CG4QvIKo4+VkpasW+Y0Myi+Mywjan0g9ffF0zStaCjuCedSDKq5PQ62ruBv8BglmO
         Co10EBWWwU/5fjmKnr/HAn0X6OPIqcm8PSaKZUu1ssT4/dKc6X6B+lqMLUIi4zsy6sA3
         uqtTuWQcwKITkyqWu/j2ZmICcWtMz6JslmWMbdfYQ7OF5oxHAxk+bKxDdsF9105xwPca
         bv4g==
X-Gm-Message-State: AOAM533Nx/2StKa5AtfeN7mu/+0qzWVuUhgGUsEp0TZU+MqaIxYuXkxj
	KEDhCgzTqvdbYTauwe7WnAI=
X-Google-Smtp-Source: ABdhPJznuDVyropBxNhH5yTKZPNKWm7Cidno3n2BjA4yf3avgq+kAyHoURBEJ50hEZGRJwJRbj5FAA==
X-Received: by 2002:a05:6808:2023:b0:2da:5b6a:a526 with SMTP id q35-20020a056808202300b002da5b6aa526mr181185oiw.264.1650048823338;
        Fri, 15 Apr 2022 11:53:43 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id m5-20020a056870194500b000d9a0818925sm1828218oak.25.2022.04.15.11.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 11:53:42 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <dc1e02b4-1cb6-5f7c-b612-7d2dd21cbda6@lwfinger.net>
Date: Fri, 15 Apr 2022 13:53:41 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/8] staging: r8188eu: clean up comments in struct
 rt_firmware_hdr
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220415121023.11564-1-straube.linux@gmail.com>
 <20220415121023.11564-4-straube.linux@gmail.com>
 <f4f8d381-9ee1-c504-c41c-97a9332066c9@lwfinger.net>
 <bd1b3310-3867-5b3c-cce1-cdb374b3d819@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <bd1b3310-3867-5b3c-cce1-cdb374b3d819@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/22 13:05, Michael Straube wrote:
> On 4/15/22 17:44, Larry Finger wrote:
>> On 4/15/22 07:10, Michael Straube wrote:
>>> The comments in struct rt_firmware_hdr are not needed.
>>> Remove them.
>>>
>>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>>> ---
>>> v3:
>>> - no changes
>>>
>>> v2:
>>> - no changes
>>>
>>>   drivers/staging/r8188eu/core/rtw_fw.c | 37 ++++++++-------------------
>>>   1 file changed, 11 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/staging/r8188eu/core/rtw_fw.c 
>>> b/drivers/staging/r8188eu/core/rtw_fw.c
>>> index 7cd08268f3b9..323e0c634c4e 100644
>>> --- a/drivers/staging/r8188eu/core/rtw_fw.c
>>> +++ b/drivers/staging/r8188eu/core/rtw_fw.c
>>> @@ -14,37 +14,22 @@
>>>       (le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||    \
>>>       (le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
>>> -/*  This structure must be careful with byte-ordering */
>>> -
>>>   struct rt_firmware_hdr {
>>> -    /*  8-byte alinment required */
>>> -    /*  LONG WORD 0 ---- */
>>> -    __le16        Signature;    /* 92C0: test chip; 92C,
>>> -                     * 88C0: test chip; 88C1: MP A-cut;
>>> -                     * 92C1: MP A-cut */
>>> -    u8        Category;    /*  AP/NIC and USB/PCI */
>>> -    u8        Function;    /*  Reserved for different FW function
>>> -                     *  indcation, for further use when
>>> -                     *  driver needs to download different
>>> -                     *  FW for different conditions */
>>> -    __le16        Version;    /*  FW Version */
>>> -    u8        Subversion;    /*  FW Subversion, default 0x00 */
>>> +    __le16        Signature;
>>> +    u8        Category;
>>> +    u8        Function;
>>> +    __le16        Version;
>>> +    u8        Subversion;
>>>       u8        Rsvd1;
>>> -
>>> -    /*  LONG WORD 1 ---- */
>>> -    u8        Month;    /*  Release time Month field */
>>> -    u8        Date;    /*  Release time Date field */
>>> -    u8        Hour;    /*  Release time Hour field */
>>> -    u8        Minute;    /*  Release time Minute field */
>>> -    __le16        RamCodeSize;    /*  The size of RAM code */
>>> +    u8        Month;
>>> +    u8        Date;
>>> +    u8        Hour;
>>> +    u8        Minute;
>>> +    __le16        RamCodeSize;
>>>       u8        Foundry;
>>>       u8        Rsvd2;
>>> -
>>> -    /*  LONG WORD 2 ---- */
>>> -    __le32        SvnIdx;    /*  The SVN entry index */
>>> +    __le32        SvnIdx;
>>>       __le32        Rsvd3;
>>> -
>>> -    /*  LONG WORD 3 ---- */
>>>       __le32        Rsvd4;
>>>       __le32        Rsvd5;
>>>   };
>>
>> The comments "LONG WORD" are useless, but the comments describing the fields 
>> are still useful. I do not like this patch.
>>
> 
> Hi Larry,
> 
> You are right the in-line comments are useful. I'll send v4 keeping
> them.
> 
> You only mentioned the in-line comments, just to get it right this
> time:
> 
> What about the "8-byte alignment required" comment? You said in another
> thread that the __le16 references need alignment 4. Should I make the
> struct __aligned(8) or at least __aligned(4)?

Routines cpu_to_le16() and le16_to_cpu() require two-byte alignment. Similarly, 
the 32-bit versions need 4-byte alignment. The layout of the struct will ensure 
that as long as the entire struct has 4-byte alignment.

This struct is only used in rtl8188e_firmware_download() where it is created on 
the stack. That means it will be 8-byte aligned for x86_64 and 4-byle aligned on 
32-bit systems. I'm sure that Dan or GregKH will correct me if I got this wrong, 
but that should be sufficient. Making it __aligned(8) could waste 4 bytes on the 
stack for 32-bit systems. Using __aligned(4) would have no effect on any system.

I say remove the comment.

> 
> And about "/*  This structure must be careful with byte-ordering */" ?
> I think it's obvious because of the __le16 and __le32 fields and can be
> removed. Do you agree on that?

Using the __leNN implies little-endian, thus that comment is useless. Yes, I agree.


Larry
