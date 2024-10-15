Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638201B3948
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032938; cv=none; b=uHLDKMUP8CvbIPB5BVTaD3d/rbtPys6Tth0cynzm701UlSD1UznN1kLpRXOkOrW6AJVQPZrpJtRZHvIG0s4X8iRHu3jPWJEZEvd9MKuH1o6N+KdX8yhKRXuUKFadPckD0cyQ96Pi/g7Dfx/+8ARtbw1bBYUWSoV37dgglKSIY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032938; c=relaxed/simple;
	bh=WQjK5FLZEEhU+dVrTCVPzYt+9HCaHPxg4Hx5JdLTVfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlF0LxSz6urObh5S1s7HTTZSwtSNZf57eEVleG0IYAYSv9xrQ9ROq5WQ+mCqtmrcvbnhnsxggiq4ujX9szC/eln3WZy2gp/yvL4MhUUcnei6MdQTFWWznpeLTeYq8UcuhlRYbhz9eGRTFOMC621YYmvlUCd1FB70nm45flkg/PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QF3nMAwF; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QF3nMAwF"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8354cecdfd3so241510539f.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729032935; x=1729637735; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7k93xeOUo10oQWujiX8Ujtq4yazAve1WQxIDNWLeUB8=;
        b=QF3nMAwFMuY/EbKwm/ZA5shCGtpDW0aTWhydcsdKNup9sbeV47Ib0othvB5ORi6P3h
         vUB4uq1stn/nbgQkZivFYZ36Bo0ytszfMFynmWDIvjZr4wY7CN3mjvThBvV7DHL2bi3C
         AhzTFYGy0OWj17vJ5to+gdLJkkdkuXvni14Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729032935; x=1729637735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7k93xeOUo10oQWujiX8Ujtq4yazAve1WQxIDNWLeUB8=;
        b=KnO+jR87584e3GWOny5yAGK08zQnphDFYnoNqZrdIN7s/kid8jIWUvq2fdpV4jZgZW
         SJBRyEh7XbxbUKKo5+rnwuwp8PliaDTsdMSHDzo2zlc9yodsDPYA8tLLaap0FbGGI1od
         nFKwLfo+RE/DbChw/AXckY2pNPgIRgcbouQDnybTp42HingvrFiWSgFt1EQj7cz1YiCU
         +PXcp447PocZhwScIbU8uKuLL//bJB5rABr43MIuNpj2dZfwBmm6RMpFp+qt7mhcfeVa
         Toy7JBANRjPYp7/BqLqy4SwRrLSKOVz9XT+OFn3uNRe8QjDgAv93ehJXgHO/lq3WQTVE
         4LNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV98jXKkmFAnWaAqNATwgJrNedduO+pmu9kgI4r1CZPI7O93kmJCQHBw7nDkGLhzVn5uYBPTYkUyj6nC5r1@lists.linux.dev
X-Gm-Message-State: AOJu0YxDf9iivvnJi2YegvSbxdzMLOTEQamxjjPLcQ3+OzVLE/TWffxW
	uHCm/czvmkkfz6UvdeUtQORxn/Qai6tE4p8OYVorJnFO6dVxRGZFosYR9Aph7Ag=
X-Google-Smtp-Source: AGHT+IHY99LhDm13B/TrzxEPQoDbwaPzU24insuKtvESXOJnVs45TI9UOS1EdYa68kby+poGQGvadQ==
X-Received: by 2002:a05:6e02:160c:b0:39e:6e47:814d with SMTP id e9e14a558f8ab-3a3dc49c43dmr22393615ab.2.1729032935471;
        Tue, 15 Oct 2024 15:55:35 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbecb38c85sm535170173.89.2024.10.15.15.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:55:35 -0700 (PDT)
Message-ID: <f53523ff-1222-4fc0-9069-10ab895e1136@linuxfoundation.org>
Date: Tue, 15 Oct 2024 16:55:34 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAEO-vhEwkQKnPprdw_r=mg6KRbadY6B4A3R_sOsyH0ds78wb2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/24 16:48, Everest K.C. wrote:
> On Tue, Oct 15, 2024 at 4:35 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 10/15/24 15:51, Everest K.C. wrote:
>>> The variable `in_data` is freed, but used later in the code.
>>> Fix it by moving the freeing the memory after it use has been
>>> completed.
>>>
>>> This issue was reported by Coverity Scan.
>>> Report:
>>> CID 1600783: (#1 of 1): Use after free (USE_AFTER_FREE)
>>> 19. pass_freed_arg: Passing freed pointer in_data as an argument to
>>> ni_usb_dump_raw_block.
>>>
>>> Fixes: 4e127de14fa7 ("staging: gpib: Add National Instruments USB GPIB driver")
>>> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>>> ---
>>>    drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>>> index 1da263676f2a..75f39e1f3ed1 100644
>>> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>>> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>>> @@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8_t *buffer, size_t length,
>>>                kfree(in_data);
>>>                return parse_retval;
>>>        }
>>> -     kfree(in_data);
>>>        if (actual_length != length - status.count) {
>>>                pr_err("%s: actual_length=%i expected=%li\n",
>>>                       __func__, actual_length, (long)(length - status.count));
>>>                ni_usb_dump_raw_block(in_data, usb_bytes_read);
>>>        }
>>> +     kfree(in_data);
>>>        switch (status.error_code) {
>>>        case NIUSB_NO_ERROR:
>>>                retval = 0;
>>
>> Looks good to me. Isn't this on next though. Don't forget to
>> indicate it is against next.
> No, it was fixed in the linux-staging repo.
>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>>

Okay - by the way the same problem is in ni_usb_write_registers().
Did coverity catch that one?

Both problems could be fix in one patch - I will leave it up to the
maintainers to make a call on two patches or a single patch.

thanks,
-- Shuah

