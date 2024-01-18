Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592412C6BD
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705605717; cv=none; b=ZGYgAheFBHJR/krPguMcHf3yit0SqKJwaaF8MQDZC7DNsLc17/aFwbGsKJSRhegshWmtnFkbiGaG/B33F2aQgwQp9kgVFTI5AYxWh0STaLbNffJuEskBbXh79Fm+qQUYPYdSlYwW7mPsVUHvprUuaDoE+nQxdgg9vcDp9yhLJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705605717; c=relaxed/simple;
	bh=q6DGrRWMqPWyRwfJMyIJvxYl5LyRJeyHGWPaEtjNpeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EK9EXSBHNTKbKPYZSLGcFlX8CN2qzZ7r/efgnACl+FIJeKVDr6LAyVehnowCGA77T4baJUZHQh6h9MiL07xNQ1xzHLOsvfByDyQYjF7aF8qP327kbANFR8WcMLB0NFrUt1KSG4zZaTb25okt77gJpfcSSDB1jT1cTE1yTmUfN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bshf3X5e; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bshf3X5e"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dfd973f3fdso503244a34.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 11:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705605714; x=1706210514; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxTTZ6N+91K/oYhMT8hi2veV9+jzOnHm5b9FNSemv/c=;
        b=bshf3X5eeUkHzaoBmInBJ6cynWa4ICqBq+WvYEXDZeaTFJqfrhUlnRPPITkxWXcvL4
         T88x7/0T8qWvh0A6XZt7e4otnivWl2ApAmES0rob2B26N4OOUXTuAHRSIK6Yr/eeauLs
         TmPGg+okFekH9Ix1hm8WdtYZKm7o7oo74QkCfUdm5eYUgJQrwe6+g0O8OFF/u2Osix2J
         oy2uT/IXitAuT3pUpy5Z5XaS7bMDkTv7Af1GSjIydjtzj4M6hmUfqeFlrWSueCbvOu+7
         8HC6M9xrFsnasc7L+bFRM1ohcU/l/NX7UFmsQwadCpABDNuc0sbQZhLHNwDia/tic/hQ
         jlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705605714; x=1706210514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxTTZ6N+91K/oYhMT8hi2veV9+jzOnHm5b9FNSemv/c=;
        b=ve0jDoz8iNLe1TdJf9WZjg81DQ4OpzuPMhVwbKVo3rKi5oc6pSF3dqBxIAlQwtKYxz
         XofE4+hqFnwlCA7O11nlKiM5BpHHxvyVxor+1p8ovbnxQgzUU3Q9Rcjn3UHzeQpjdND6
         DDQEEKJeUD0fr1D1irONVXbsQtB0wSNDIgQsZ6vBMmveSRwpjdYnYjfdLwx9O3auHLl7
         2W8h9nkVeoPcjyHRCAATlmkXqKtyIEjpqTEN5eDXE2aK3FqO+32AzPxTQFc2YHk6Fw1H
         dBmWhnJceH/5TqugJ4O8FUKtS725rT9Ns2EHjk4zHDLj/pwvGDj5xZ/zwGHQFTlBsYrZ
         EiNA==
X-Gm-Message-State: AOJu0YwYWCqY029WHHgF3IC4qEZ3xZTPdJXHRSpbqGojJ6/16WGLxjP/
	zXj8Sg8GUZYn7Up/jL3MIDXRQQY9oVQfdxZh9VVJ3Ot+ABtaGiML
X-Google-Smtp-Source: AGHT+IHJYeUOWbxCqdKT7xQBtiZ7KSCtBxpr4zFXyO2Ij+trZkUeO/feRwA3lSIE0Dzu2+JhFbq4aQ==
X-Received: by 2002:a9d:5781:0:b0:6dc:8bc:4397 with SMTP id q1-20020a9d5781000000b006dc08bc4397mr88386oth.1.1705605714358;
        Thu, 18 Jan 2024 11:21:54 -0800 (PST)
Received: from [192.168.1.157] (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id fi4-20020a05622a58c400b0042a0a3d29a2sm2274714qtb.49.2024.01.18.11.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 11:21:53 -0800 (PST)
Message-ID: <a5b5673a-5404-4121-843b-cd04f32bb7a8@gmail.com>
Date: Thu, 18 Jan 2024 14:21:52 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: rts5208: Add more details to Kconfig help
To: Randy Dunlap <rdunlap@infradead.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240118175947.82297-1-jklott.git@gmail.com>
 <2024011829-gusto-absently-8192@gregkh>
 <5500fa27-13a5-420a-a558-13037d954748@infradead.org>
Content-Language: en-US
From: Jacob Lott <jklott.git@gmail.com>
In-Reply-To: <5500fa27-13a5-420a-a558-13037d954748@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/18/24 2:19 PM, Randy Dunlap wrote:
>
> On 1/18/24 10:59, Greg KH wrote:
>> On Thu, Jan 18, 2024 at 12:59:48PM -0500, Jacob Lott wrote:
>>> The current help text is short and triggers a
>>> warning from checkpatch.pl. This patch adds more
>>> details to the help text which should provide better
>>> information for whether or not to enable the driver.
>>>
>>> Signed-off-by: Jacob Lott <jklott.git@gmail.com>
>>> ---
>>>   drivers/staging/rts5208/Kconfig | 10 +++++++---
>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/staging/rts5208/Kconfig b/drivers/staging/rts5208/Kconfig
>>> index b864023d3ccb..c4664a26ba3b 100644
>>> --- a/drivers/staging/rts5208/Kconfig
>>> +++ b/drivers/staging/rts5208/Kconfig
>>> @@ -3,7 +3,11 @@ config RTS5208
>>>   	tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
>>>   	depends on PCI && SCSI
>>>   	help
>>> -	  Say Y here to include driver code to support the Realtek
>>> -	  PCI-E card reader rts5208/rts5288.
>>> +	  Choose Y here to enable support for the Realtek PCI-E card reader
>>> +	  RTS5208/5288. This driver facilitates communication between the Linux
>>> +	  kernel and the Realtek PCI-E card reader.
>>>   
>>> -	  If this driver is compiled as a module, it will be named rts5208.
>>> +	  If you opt to compile this driver as a module, it will be named rts5208.
>>> +	  Selecting N will exclude this driver from the kernel build. Choose option
>>> +	  Y if your system includes the Realtek PCI-E card reader rts5208/rts5288.
>>> +	  When in doubt, it is generally safe to select N.
>>> -- 
>>> 2.34.1
>>>
>>> v3 fixes the tab spacing for line 6 in Kconfig
>>
>> Hi,
>>
>> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
>> a patch that has triggered this response.  He used to manually respond
>> to these common problems, but in order to save his sanity (he kept
>> writing the same thing over and over, yet to different people), I was
>> created.  Hopefully you will not take offence and will fix the problem
>> in your patch and resubmit it so that it can be accepted into the Linux
>> kernel tree.
>>
>> You are receiving this message because of the following common error(s)
>> as indicated below:
>>
>> - This looks like a new version of a previously submitted patch, but you
>>    did not list below the --- line any changes from the previous version.
> Jacob,
> Immediately below the "---" line, not at the end of the patch.
>
>
>>    Please read the section entitled "The canonical patch format" in the
>>    kernel file, Documentation/process/submitting-patches.rst for what
>>    needs to be done here to properly describe this.
>>
>> If you wish to discuss this problem further, or you have questions about
>> how to resolve this issue, please feel free to respond to this email and
>> Greg will reply once he has dug out from the pending patches received
>> from other developers.
>>
>> thanks,
>>
>> greg k-h's patch email bot
>>
Just sent a fixed version over. I appreciate the feedback and patience 
on this.
