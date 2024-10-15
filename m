Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA961D63F8
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 23:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034965; cv=none; b=Y8jm2c341IXz7+HH4R9jB/4zdngMfjAySh+ThJ10HybVm/WzYScuVZA9nqRST5WaYYF4BWadT5NY4FO3IT6ZO5MX2fkSrSJOBPS9G5nGz4+oZtwDKiX+O/OTxGSGuceLRt2OEJyv9enkH6MjFvIpZS4UlYLFVetKEvE8vZ+z/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034965; c=relaxed/simple;
	bh=aSwLkbAg43vtDDBoHNNuZ5YDhsqlgniTJuAAONwuPS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9oYzwFstgCUzM/OPn2LxeJjxd23MWXvMmm3VSe9yrtp+DQz35aE67MWoaBW3tC5YUgVmj0DdMj0+LIvsoisFj4IeFNYYpMFboaX/9lAu8hhD4sVJ+wI36oso2MvUznXlW8fF4Cusu8Xhp+X8/a2iE5rO2v9vticWP+Q9jNhk7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HcnSplTU; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HcnSplTU"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-83a9be2c028so6279839f.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 16:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729034961; x=1729639761; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qiwQWjNAYRLv98HF5mn8aLwRjPp1fG7H9swFAKakcak=;
        b=HcnSplTUXD6191K/RQ6ADqVB60rgzHmUuHbZrkwEYYw/BJ3w0sixtm2VG9SIQ/rzFR
         HGCBwWawkU9C0VvjhN3jn+8B5MtsnLvTAbYCOAlpIWxO6VKJuP4iR+3HHDhy+5X6nVwk
         Dtyl+OcKrAXco8CdYhmi+a/Co52AY3QdLyS/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034961; x=1729639761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qiwQWjNAYRLv98HF5mn8aLwRjPp1fG7H9swFAKakcak=;
        b=Fr+TNLG73/rxX4/U5N6Ac9IbspLPhDPBBRmXhVZaCCp86LXE0sRXYkIydHFJc08dls
         rUFE11/HkixlfLAZ+hyRZ/nfJMTaCLvQTyW7WOMbyCX1cuRQ5AB12YbQNgI9l0uyajkw
         7rA8Gs3dIs1iI9IZl1LcL5Yob3NQLFt8cRkFtwFiT3/UvSp5X4Kh9Q8wZRpwBSJC4e8Z
         m+G+lRoFiuRANaeU8i6m6EUFindKHYkS3AWe7J3x69tdWhhq5WPNmSYj1qIg+eGOnNCh
         CAl58oRmLRDHzUW6ow2C8irkr4MTjjP3UWzOsG6hXPpGqn6Sco607JyFqGCI2VLxwqY3
         TpRA==
X-Forwarded-Encrypted: i=1; AJvYcCWo/hVrrl8awFzT4/TmAKitJfCq1lODPBtI5WV49VC3sDgJl140xamHg+7wKipthqmZhHfX7z/f8Z6W7QVC@lists.linux.dev
X-Gm-Message-State: AOJu0YxH9SglMTRNe/UBuCppISfr7A+aGEO7vdmWgcs4bOcJVGUVq4Ws
	V7FgQImtdVW5p5IxgD1dssL0CAqeTeiE4Pj+rdeH9vdlnppYnqpD7MWEr5aHad8=
X-Google-Smtp-Source: AGHT+IG9/ijx8O8bt0d/vr41CJMfHDoF/ElE4j1gdOio/SpELPQZGy06Sl7jg/vuUeDNiohtllal/Q==
X-Received: by 2002:a05:6e02:1885:b0:39d:637f:97bc with SMTP id e9e14a558f8ab-3a3bccda708mr124780335ab.0.1729034961366;
        Tue, 15 Oct 2024 16:29:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3d70cd2f2sm5419945ab.43.2024.10.15.16.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 16:29:20 -0700 (PDT)
Message-ID: <748e78b9-3c70-4300-9de4-6df00dffe4c3@linuxfoundation.org>
Date: Tue, 15 Oct 2024 17:29:20 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Move free after the variable use has been
 completed
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241015215157.18571-1-everestkc@everestkc.com.np>
 <99056bd3-748f-42e8-a25a-131f7b194f55@linuxfoundation.org>
 <CAEO-vhEwkQKnPprdw_r=mg6KRbadY6B4A3R_sOsyH0ds78wb2g@mail.gmail.com>
 <f53523ff-1222-4fc0-9069-10ab895e1136@linuxfoundation.org>
 <CAEO-vhEGJ-5vX6=32VwNfiV7nSkDL4iEJVti8U0=q=NfOKrSAA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAEO-vhEGJ-5vX6=32VwNfiV7nSkDL4iEJVti8U0=q=NfOKrSAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/24 17:04, Everest K.C. wrote:
> On Tue, Oct 15, 2024 at 4:55 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 10/15/24 16:48, Everest K.C. wrote:
>>> On Tue, Oct 15, 2024 at 4:35 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>
>>>> On 10/15/24 15:51, Everest K.C. wrote:
>>>>> The variable `in_data` is freed, but used later in the code.
>>>>> Fix it by moving the freeing the memory after it use has been
>>>>> completed.
>>>>>
>>>>> This issue was reported by Coverity Scan.
>>>>> Report:
>>>>> CID 1600783: (#1 of 1): Use after free (USE_AFTER_FREE)
>>>>> 19. pass_freed_arg: Passing freed pointer in_data as an argument to
>>>>> ni_usb_dump_raw_block.
>>>>>
>>>>> Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
>>>>> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>>>>> ---
>>>>>     drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>>>>> index 1da263676f2a..75f39e1f3ed1 100644
>>>>> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>>>>> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>>>>> @@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8_t *buffer, size_t length,
>>>>>                 kfree(in_data);
>>>>>                 return parse_retval;
>>>>>         }
>>>>> -     kfree(in_data);
>>>>>         if (actual_length != length - status.count) {
>>>>>                 pr_err("%s: actual_length=%i expected=%li\n",
>>>>>                        __func__, actual_length, (long)(length - status.count));
>>>>>                 ni_usb_dump_raw_block(in_data, usb_bytes_read);
>>>>>         }
>>>>> +     kfree(in_data);
>>>>>         switch (status.error_code) {
>>>>>         case NIUSB_NO_ERROR:
>>>>>                 retval = 0;
>>>>
>>>> Looks good to me. Isn't this on next though. Don't forget to
>>>> indicate it is against next.
>>> No, it was fixed in the linux-staging repo.
>>>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>
>>
>> Okay - by the way the same problem is in ni_usb_write_registers().
>> Did coverity catch that one?
> No, there were no similar issues caught by coverity.
> Also, I just checked the function. I didn't see the variable being
> accessed after
> it had been freed.

Yeah. You are right. It was out_data that was freed after
last access. in_data is fine.

thanks,
-- Shuah

