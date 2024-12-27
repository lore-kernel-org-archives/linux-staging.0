Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D928691
	for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735301990; cv=none; b=fD7bWoO93QeybAc1C7NP4SVOHSKg1Sqnu+CKtNXAtRhNXT7pqm13GCbVSVdpqY/V4f4PJ99kliYWFM2bKJTC9nsj83UJKTFttPiFlmJccHTe2Agd9jGhTx1U7gefUh/tUSGkwxv3liQHf9ddraQE32ee+hXC2RvcE6P3SrMGyxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735301990; c=relaxed/simple;
	bh=zBCZdpHo1vkGGBNI4RBd7pGWH81gy0XQcbcABa+X3mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXfd1VFTMMaGuxhDhUkLeL1bEhQ5pHZp5dnn2XOr1nQJp058A6Q4v/GTCuEUm7YNeV8YZ59Ncu0N7Ts0irzW0A7PFYpdcsXJ3AaKCqR7AFl8Q0AtIhMnNjQ1R5FqeZQKGR+OyVE6lhxC+0Y7YE2uQpppnSHtiJ8MJxF+i01p+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0tlzT5S; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0tlzT5S"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644db9f3cso10018915ad.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735301988; x=1735906788; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pd7rx23c1OMvmC13EKVAMU2DQoYUwqAEy1qNyeIW//E=;
        b=Z0tlzT5SRE//pY18LCRPCcB79Zr6nI2qCzHC/7VB/jPyRpPfF3X9u9xmNb7gUQ8T+m
         1XQqKJLxT9Fz2M5st/dAzhu2TaW2T7Y4sWntU3zJDBPs84PxoeGo68pb7yvVO+paHWsV
         bGmbF0BbVDhJ9IXy3FSJqWketz4pSLXO8qlm+gu1nxk6lYAt3eIJhqzT20TFaMym0wBX
         KliRDepuiTKp6kwf2uk2e/UZrtEJlRnrA8oOtHv2tyOjWv9DZY9GORKPAr0LSbhFhDu+
         BUr/iDJSsSs9I7MJVovvpPvpZXdMY2OkeIr8OXcXqwVlMBUMX63eFt2ERkbHC1XEjCbf
         bBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735301988; x=1735906788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pd7rx23c1OMvmC13EKVAMU2DQoYUwqAEy1qNyeIW//E=;
        b=MqJeL3w/8Zz4UMI98UkGo5eJkD+hJKeGKjuR0ydQHPbayrxZ4jGXIpoJ54i/g8KKL4
         aX2bpfJcvbG3vr6Dj5iJT00M1sSjt2/zfzWceQvpT/+K/n35qBqsQogx7pAI6zT6NL2a
         9p56So3mEp9m2GpDB9bIe8XMy9oPivU9b6RqjSH5XUbU2kh0AVdeRoM81GXAEkDXipbv
         hGvmu+0yP99SWDIdQTLgJ7QBXJbGB4xiZdzY++aMIAJOzQXvG6MPFQTIC1RXCYx5c3hn
         8fqCnjsiAs2kMmnbT7lpVFZOGIhgrJzX/p92CZPIwBkr0uucon8XNxUAxbn7rF7hu87s
         AU3g==
X-Forwarded-Encrypted: i=1; AJvYcCXekJ2MkJvR6VpxdvvGJAUOFg7Nh8zkHXyw9mggbaXYJPNhaEJWKxak0HcnUpWSGOUnCHfGbvvM1udSZYsx@lists.linux.dev
X-Gm-Message-State: AOJu0YzwRdiCfMX5NmEg/dx2519V/X26qPy9qa4/7zBqn6BvV1Fuigcm
	X/akDRXNGX65nk3sr0KQVS9IHkl1DN+uduojJB+k1yfHd1f1N4+5
X-Gm-Gg: ASbGnctnrjTo/PBXW1prk674GUKO+xJwJMoqw2LA4Ll/9eXfO4LOMQ+Wm5L5/2jMrpl
	od+9VCQhI/3b4sw9G5bWLtR88TuCWZRM4EVLBgljnB/481+6312zQLTwRBAeUMUZ3AGO3P21/PQ
	77L8Nzq9XDjQNBlstOBMw/9OBQ0093U8oO066ZNQd/XPxPxMTtoj0UD+28iXTTe5BgXK3NoCsvq
	IUpo7L0J5mch96D04rvoWNiDBhBJmcocNWxff1hkfNm8c8OrAMo4s7vq1BvmkPC4jE=
X-Google-Smtp-Source: AGHT+IGZhv7IGy8KabsHqhuwBiR6oD15Tc6C9TmEUdJoplWi5Ph+iUXll1kh3Lp//LFDt9Y8w5co6Q==
X-Received: by 2002:a17:903:2cc:b0:215:6af0:11d5 with SMTP id d9443c01a7336-219e6e88b01mr138235315ad.1.1735301987972;
        Fri, 27 Dec 2024 04:19:47 -0800 (PST)
Received: from [192.168.1.19] ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6251sm131427295ad.207.2024.12.27.04.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 04:19:47 -0800 (PST)
Message-ID: <59934793-9052-4702-8c63-925229f84123@gmail.com>
Date: Fri, 27 Dec 2024 17:49:43 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] staging: gpib: Modify gpib_register_driver() to
 return error if it fails
To: Shuah Khan <skhan@linuxfoundation.org>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
 <20241226193637.241049-2-niharchaithanya@gmail.com>
 <e659e77d-9c09-436a-b5a2-bf9fe28f644c@linuxfoundation.org>
Content-Language: en-US
From: Nihar Chaithanya <niharchaithanya@gmail.com>
In-Reply-To: <e659e77d-9c09-436a-b5a2-bf9fe28f644c@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27/12/24 02:11, Shuah Khan wrote:
> On 12/26/24 12:36, Nihar Chaithanya wrote:
>> The function gpib_register_driver() can fail if kmalloc() fails,
>> but it doesn't return any error if that happens.
>>
>> Modify the function to return error i.e int. Return the appropriate
>> error code if it fails.
>>
>> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
>> ---
>>   drivers/staging/gpib/common/gpib_os.c | 7 ++++---
>>   drivers/staging/gpib/include/gpibP.h  | 2 +-
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/gpib/common/gpib_os.c 
>> b/drivers/staging/gpib/common/gpib_os.c
>> index 405237d8cb47..07795df3b721 100644
>> --- a/drivers/staging/gpib/common/gpib_os.c
>> +++ b/drivers/staging/gpib/common/gpib_os.c
>> @@ -2094,18 +2094,19 @@ void init_gpib_descriptor(gpib_descriptor_t 
>> *desc)
>>       atomic_set(&desc->io_in_progress, 0);
>>   }
>>   -void gpib_register_driver(gpib_interface_t *interface, struct 
>> module *provider_module)
>> +int gpib_register_driver(gpib_interface_t *interface, struct module 
>> *provider_module)
>>   {
>>       struct gpib_interface_list_struct *entry;
>>         entry = kmalloc(sizeof(*entry), GFP_KERNEL);
>>       if (!entry)
>> -        return;
>> +        return -ENOMEM;
>>         entry->interface = interface;
>>       entry->module = provider_module;
>>       list_add(&entry->list, &registered_drivers);
>> -    pr_info("gpib: registered %s interface\n", interface->name);
>
> Did you mean to delete this message? - looks like an useful message.
> Could you make this dev_info() instead?
>

Greg had informed that gpib_register_driver() should not be calling 
pr_info(),
I'll add the dev_* debug statements instead of the pr_* statements wherever
the driver registration is completed or fails in this patch series and send
the next version.

>> +
>> +    return 0;
>>   }
>>   EXPORT_SYMBOL(gpib_register_driver);
>>   diff --git a/drivers/staging/gpib/include/gpibP.h 
>> b/drivers/staging/gpib/include/gpibP.h
>> index 5fc42b645ab7..d0cd42c1a0ad 100644
>> --- a/drivers/staging/gpib/include/gpibP.h
>> +++ b/drivers/staging/gpib/include/gpibP.h
>> @@ -17,7 +17,7 @@
>>   #include <linux/fs.h>
>>   #include <linux/interrupt.h>
>>   -void gpib_register_driver(gpib_interface_t *interface, struct 
>> module *mod);
>> +int gpib_register_driver(gpib_interface_t *interface, struct module 
>> *mod);
>>   void gpib_unregister_driver(gpib_interface_t *interface);
>>   struct pci_dev *gpib_pci_get_device(const gpib_board_config_t 
>> *config, unsigned int vendor_id,
>>                       unsigned int device_id, struct pci_dev *from);
>
> thanks,
> -- Shuah

Thanks,
Nihar
