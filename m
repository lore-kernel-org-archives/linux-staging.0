Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DAA13C689
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 20:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735245801; cv=none; b=okB7knwlTMPrdRGlTlzix1+JElhv5+d+tn1RENNwg/hOUXxjiRC52xhjCReByAcri8+E7WdpBpqkfCJfnRvnJaXF4OxH4hkM2RgU0ROxZzfAj4TzVDrcK1W1Xqr9avJOazT6Vklsm9JpNPFOykOnEl2Abw2P1qv16rS5JYjgf6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735245801; c=relaxed/simple;
	bh=EVB/z94Z/cUpmZl3sx8QihHRwdbPYViMl+801MhowsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqvKzcchMk1rlUucpyh0iUal1r1tK3gdJ8hcGbqDLROnsE7eJDKqAbHPLLVhb5yThqSR3SHcJ5Nxa/h0hzj/cOqPp/auy0UvXqbnj6EPyu3nphmN6kkx4N7IIQ6fAY3d/uoZu/XbhUg4iHRXrYk/XqozzK2vP0h9TNrB1c3g6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bE2CLEgN; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bE2CLEgN"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844dae6a0caso198355339f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 12:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735245798; x=1735850598; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlbero79GqIXgnhR5M62NzRENxRkrfULP9LT/QfVE4c=;
        b=bE2CLEgNTAjzwomcRXq7yMxX0hugNSeuTmc+FFZyOS6ELDfNQfPTGGNMXWwA9+l/cb
         Zw0H5F2TemwrCK3sCL/cr/N84mny7K8l5CWiYca0zaj+WnLd37cXS4AW8zNMNOuvNF/n
         BbVkU9rWBESvwfuBdUPAa3wMTtKPEo6hPOXSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735245798; x=1735850598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlbero79GqIXgnhR5M62NzRENxRkrfULP9LT/QfVE4c=;
        b=cRm02Dqih6nvSLTUQZKQVhi4UK0zvBH70xNOPmaViWw7x0wjgrG8XqwX3VmhLPmQz1
         o76rXKVRDmV+8eYqD/IxxRCflb3Na9rS+aFh4YwGfUFRxIH64A6V+t8XYabzDgUyrMO4
         B1XvD5PfrMxQcSPZcTLkUfCo+mdjC0b282bgHDQ56Hp7fqNbPP1WEVhsE1furUeBBq5c
         o9snkkjBJqQHVVDR9PKSmLj7Rfl/b3teQAHA/t6Si6jLyi0Nb3QZOFv2LLkv1SkNxrRx
         eshCz9Kow5atjh04VfRKKgjVjjkYtVSP93EA8wD1zE7GbndSV4+mcB0oSDf4UFlye2sj
         JCSA==
X-Forwarded-Encrypted: i=1; AJvYcCUF6koNpOtB4rGMtkmen3wUYW+RNEXfxBaB7PWrImEGNjtX6r4U7QVrxu7YjUgCR5RHVvkvd8bE9iw9LL1N@lists.linux.dev
X-Gm-Message-State: AOJu0Yy535V/3LBeaUQLliWImPM5wrCNJiuTDC12gTlfcL/jxri/420B
	TdfYlkl/YTOaf+JmE4RvTH8ZHCLt3Q7p71nYHV9oMw45/bpQsOvPJ1x5QTAHAsw=
X-Gm-Gg: ASbGncv9cmBYkXBjqwKJ5BLCBfkk7g6jZG+lkcfHQ5YrPdlPYwl8psJC13Vpj4VSsLg
	d65rAm4bmeqEmxYVslSGL7muMMyGWXunG1OJRmLtHyMvk42sOkQKONWvx8WvL5O28hQMi3UROr/
	vhxn4RxjioWIMWxvVEDi0Smv0TovOYyH9o9q93V5A7hXGOh74Ciso68icyfEnwTi9WROlAi9+Wo
	6s6NH2e2RZcMEHgsxaw0SB2ymucIBBrqd9ScSgpp2oJLkK01bPQ5/ea0k6EKRDSYkVb
X-Google-Smtp-Source: AGHT+IEgiHnypDUme0HyThlW1l7V+XNsgLos1jQDwGQcqUYckzI7qAkEvzXJfG5JG0fIDbI8yRYPQA==
X-Received: by 2002:a05:6e02:1d0d:b0:3a7:e528:6ee6 with SMTP id e9e14a558f8ab-3c2d2783efdmr165797935ab.13.1735245797776;
        Thu, 26 Dec 2024 12:43:17 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1de6e0sm3838301173.127.2024.12.26.12.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 12:43:17 -0800 (PST)
Message-ID: <9058432a-a00c-49c3-824b-dd296970986a@linuxfoundation.org>
Date: Thu, 26 Dec 2024 13:43:16 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] staging: gpib: agilent_82350b: Handle
 gpib_register_driver() errors
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
 <20241226193637.241049-3-niharchaithanya@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241226193637.241049-3-niharchaithanya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/24 12:36, Nihar Chaithanya wrote:
> The function gpib_register_driver() can fail which can result in
> semi-registered module.
> 
> In case gpib_register_driver() fails unregister the previous
> gpib and pci registering functions, return the error value.
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>   .../gpib/agilent_82350b/agilent_82350b.c      | 21 ++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 53006d0cc79c..39420f2b0b32 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -909,14 +909,25 @@ static int __init agilent_82350b_init_module(void)
>   	int result;
>   
>   	result = pci_register_driver(&agilent_82350b_pci_driver);
> -	if (result) {
> -		pr_err("agilent_82350b: pci_driver_register failed!\n");

Is there a reason to delete this message?

> +	if (result)
>   		return result;
> -	}
>   
> -	gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
> -	gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
> +	result = gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
> +	if (result)
> +		goto err_unaccel;
> +
> +	result = gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
> +	if (result)
> +		goto err_interface;
> +
>   	return 0;
> +
> +err_interface:
> +	gpib_unregister_driver(&agilent_82350b_unaccel_interface);
> +err_unaccel:
> +	pci_unregister_driver(&agilent_82350b_pci_driver);
> +
> +	return result;
>   }
>   
>   static void __exit agilent_82350b_exit_module(void)

thanks,
-- Shuah
