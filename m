Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB80155A30
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 21:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735247447; cv=none; b=CB/yamW2cHSL2e4HMkuQyF+0T8MOENUuiufgQZ/HxJDar4R1g5JC5VeLCsyBQ3AsxPiDgNW3O75sar6Qe648ZE6IMBTtXCsORoIHzY5z1nmZrUs5cPo32xGkINVwAJSl9LhVKoVV2hiJv4En4ezJpnsJ4ZAuOWN64xVzXO4k0as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735247447; c=relaxed/simple;
	bh=eOzYH9sXXhzuSnBsV5Mls+e9HogKueUInGjYXkZp9+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N04V9LiFMHuT5yPhdjxfDjYqpRmEX6dSbF2OcmuHDxIMeJL8Fx+4dJ/Z29gtaAat0solFKjIgZs9hOuiHmyN+60fuvTXwBy6btGxt8TZRqhLvV6PHF9beZIRHCbimJu/YWYaXEzWZY5l1XdefovjeHTygJPpesO/6FXgapk5FNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AA+EFNYs; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AA+EFNYs"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a8ed4c8647so51660415ab.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 13:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735247444; x=1735852244; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtQZrRRHqnZt/b/zw6CJ71pF7s3nqBxoJCXRwknhxVs=;
        b=AA+EFNYsNVSRryT6Gb3w6BSMYMBBXtFnihXeUvcFvLtevZbAEZKGI380rJ43vD1ikA
         xkcjwD2w0AsEglHD4tOBh8lmQ1NjxeR2ZNVK52aClea1Aw3Wk9X3/pc7V1mptsT7aGpy
         eqe4MT7yPETYzJtY797TJ8jbs82oH5QEwWrvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735247444; x=1735852244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtQZrRRHqnZt/b/zw6CJ71pF7s3nqBxoJCXRwknhxVs=;
        b=Lot5/EUNc8By1kwEmuzBHWZJYwL4RwHrdYzAu7mLPKresMvYNsYjKhWQsIb8DJnq2u
         076CXd6+ms1TKgZsyRqyMuK8fidJ4z1M1ECCQbPLUnySm3fu49pruv0ZuyWE9I/JUyzg
         /9S6HsjrY56OR0Xzyacqx4pu7o3Ye+h2qFjv4Jq59tFr5H/voFr0a4teuod56Rgi/EJ8
         c5ew4aA7O7DIF9OLk0SxEF0KlR5j2X2o0mym5yxQZ7qIhA5h+lq+iVcKnOVgFQevf0Lo
         45adgIgzhZeGBbOrRupaAua0IPUulGXmV4jBPRDZTnKShU9nYYilqqtEIeMWA5SM7rfh
         ji3A==
X-Forwarded-Encrypted: i=1; AJvYcCVepU4nTsEVPk8xj62mHgWAiEU4v3TsfVwZtJJ4CQl6PYg3LaDXnoE+BllCEEyGIm4iSI4+m5cSxj18CU4c@lists.linux.dev
X-Gm-Message-State: AOJu0YwLjhvitRt7jQ/FyXtdWMZ2pI0uWVKdqUO+LsAtTd3YuiHVEkh6
	2BJ31yoxtNYQUTEEFw+ACN+0XD8pmNXkAzdcnrbNgxJKTusZmrJXHAvxCwh53zs=
X-Gm-Gg: ASbGncsGOAMCZ6FPht4/LrleFBzsZJySuHVk3OiUTrD58tIZNLsdyw8b+IJCgN5+xlg
	xMQ/O43zilnZbmq6sJE15fxNoMM1Ti6oypoWRU24SYTkUMKk2vrRlUdTqCsuoScu0UzsEJ32cYG
	8UuVC1w9lO0Q8poIlWgOt3oXzacm/kc9VQF5sN58siYp1tS2JqDtuHk3qnOg5wqq8/NhBBhLP9Q
	bj2zzeG/6l95Z9YXie7Z+I5kaRrLgaO/6IYnQmXsSV1PLd7e+ImQOKby3lhQLUWTM+K
X-Google-Smtp-Source: AGHT+IEKMrmxhIVNnNxidDkkLYZZcL4JbGtsw3SgV8F2XTtAfTYrmK30mlwVigK8sbq3YcQuEhHtPQ==
X-Received: by 2002:a05:6e02:20e9:b0:3a3:4175:79da with SMTP id e9e14a558f8ab-3c2d2d5164bmr204152425ab.13.1735247444205;
        Thu, 26 Dec 2024 13:10:44 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0e411e878sm41065925ab.50.2024.12.26.13.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 13:10:43 -0800 (PST)
Message-ID: <7559a7fc-b503-43e6-9cdd-60f479398108@linuxfoundation.org>
Date: Thu, 26 Dec 2024 14:10:43 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] staging: gpib: agilent_82357a: Handle
 gpib_register_driver() errors
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
 <20241226193637.241049-4-niharchaithanya@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241226193637.241049-4-niharchaithanya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/24 12:36, Nihar Chaithanya wrote:
> The usb_register() function can fail and returns an error value which
> is not returned. The function gpib_register_driver() can also fail
> which can result in semi-registered module.
> 
> In case gpib_register_driver() fails unregister the previous usb driver
> registering function. Return the error value if gpib_register_driver()
> or usb_register() functions fail.
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>   .../staging/gpib/agilent_82357a/agilent_82357a.c    | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> index bf05fb4a736b..60311ce8d164 100644
> --- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> +++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
> @@ -1691,14 +1691,21 @@ static struct usb_driver agilent_82357a_bus_driver = {
>   static int __init agilent_82357a_init_module(void)
>   {
>   	int i;
> +	int ret = 0;
>   
>   	pr_info("agilent_82357a_gpib driver loading");

This message could be moved to the end of the routine saying
module init is complete - also fdor all of these messages,
dev_* might work better.

>   	for (i = 0; i < MAX_NUM_82357A_INTERFACES; ++i)
>   		agilent_82357a_driver_interfaces[i] = NULL;
> -	usb_register(&agilent_82357a_bus_driver);
> -	gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
>   
> -	return 0;
> +	ret = usb_register(&agilent_82357a_bus_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
> +	if (ret)
> +		usb_deregister(&agilent_82357a_bus_driver);
> +
> +	return ret;
>   }
>   
>   static void __exit agilent_82357a_exit_module(void)

thanks,
-- Shuah

