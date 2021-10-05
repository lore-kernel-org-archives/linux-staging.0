Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B1C6D18
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 13:33:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id j5so81335200lfg.8
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MZBsxeP3JQSj3L9+9cIv9tClpw0dUUkSR3BWuM0kHGw=;
        b=DsQlnwUHXvbWcyhexAagbrNJFfgdvWRsEaN7MFHK5H6TPlSnpdxbsDcGyqwxaY3/tk
         xymDcZRrP8m4GzcHpZAwYJPqS9AYYj3Rm7VbvX7c8i7vg+lcPxjzAmfIwgWKauQypA+w
         UIeoLXgOlJ7eVut7VScj8I2qak7O/6HuomCNYxMjaslZYIgFlbGkCdzkla2wcFWytGv0
         1OLc9vVkSzBlUuP4p5MXcTBjwkzC6FMIgsbcyy8QH7fd6gs8JWxwo9gqwtcTf09hynvK
         ls2KhmhE9J9vwxl6otWNTfz4OGOPFlm6802PkmuJmXvI/cmeqZl7R3cATJb9Hx/VtKK0
         /hDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MZBsxeP3JQSj3L9+9cIv9tClpw0dUUkSR3BWuM0kHGw=;
        b=B6Pqrncd8O9Lm91J2M4svCse0yKCS4IOKQkB5eK8U7YyrE35KOswsJDkUvt0nk9clV
         c1ynkIh5kXKK2fY9MIbG3hR6qamMvYAhAIeWBV51dEvyXiyXmJwIw/rZorimQvUj+dFn
         WsdGvv5xU3d+yGObza4c9DRXLy5YA8YQtX/7+6ZmTuXjGeqlwAJWbE0iBup9WOYXur/Z
         uegwoJ1KNSY2EmjFcLWgxVDzp89IBJBZDK4uzhQVwb/uJFMt+YcIKJbTjXj6MMzcGdax
         N3bwuNX6FYcumVMZE9X7S4bAOFD8HY3p4//ecHsTDe7eDHaKfmgkHjX8391+WQXnfdJ5
         S/aw==
X-Gm-Message-State: AOAM530bD+Nw7aiEQxA6Ym7+aEDAXJSS99uUiHOFH/ryBdHcxo5Fmc7Y
	orWCft58v4ty6bE/b7MUtcDtPg==
X-Google-Smtp-Source: ABdhPJwSiw3QMYbPWjsbaTLH2D4VeURZI1m1YGkUm+DOqMdUuBqWSgZqx2RxlULdOX/HVIB/vKtcaw==
X-Received: by 2002:a05:6512:3095:: with SMTP id z21mr3434912lfd.167.1633440783455;
        Tue, 05 Oct 2021 06:33:03 -0700 (PDT)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id z16sm1974264lji.41.2021.10.05.06.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 06:33:03 -0700 (PDT)
Subject: Re: [PATCH] staging: most: dim2: fix device registration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Christian Gromm <christian.gromm@microchip.com>
References: <20210929205619.2800-1-nikita.yoush@cogentembedded.com>
 <YVwofSvwGTv3kHjh@kroah.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <d309b4cf-12f5-5f49-fcbe-3141dff9e73f@cogentembedded.com>
Date: Tue, 5 Oct 2021 16:33:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YVwofSvwGTv3kHjh@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

>> Commit 723de0f9171e ("staging: most: remove device from interface
>> structure") moved registration of driver-provided struct device to
>> the most subsystem, but did not properly update dim2 driver to
>> work with that change.
>>
>> After most subsystem passes driver's dev to register_device(), it
>> becomes refcounted, and can be only deallocated in the release method.
>> Provide that by:
>> - not using devres to allocate the device,
>> - moving shutdown actions from _remove() to the device release method,
>> - not calling shutdown actions in _probe() after the device becomes
>>    refcounted.
> 
> Should this be 3 patches?

But these three items are deeply interconnected, and fix the issue together. Must not manually free 
device structure passed to register_device(), thus must not allocate via devres (because otherwise, 
devres will free it). Once not using devres for it, must deallocate it somehow else, thus must rework 
the release paths.

Perhaps I just shall not go into these details in the commit message.

>> Also, driver used to register it's dev itself, to provide a custom
>> attribute. With the modified most subsystem, this causes duplicate
>> registration of the same device object. Fix that by adding that custom
>> attribute to the platform device - that is a better location for
>> a platform-specific attribute anyway.
> 
> Nope, it should be 4 patches.

Unlike the above three, this item could be separated.
Will split into two patches now - the first for this (and with fix to the attributes issue noted below) 
and the second for proper device releasing.

> Also, why have you not cc:ed the original author of the commit you are
> "fixing" here?   They are the maintainer of this code, right?

I was under impression that "git send-email" does that automatically...

CCing them now.

> One note on your change that would keep me from accepting it even if all
> of the above was not an issue:
> 
>> diff --git a/drivers/staging/most/dim2/sysfs.c b/drivers/staging/most/dim2/sysfs.c
>> index c85b2cdcdca3..22836c8ed554 100644
>> --- a/drivers/staging/most/dim2/sysfs.c
>> +++ b/drivers/staging/most/dim2/sysfs.c
>> @@ -39,11 +39,10 @@ static const struct attribute_group *dev_attr_groups[] = {
>>   
>>   int dim2_sysfs_probe(struct device *dev)
>>   {
>> -	dev->groups = dev_attr_groups;
>> -	return device_register(dev);
>> +	return sysfs_create_groups(&dev->kobj, dev_attr_groups);
> 
> No driver code should ever be calling a sysfs_* function, which is a
> huge hint that this is incorrect.
> 
> You also just raced with userspace and lost, please use the default
> attributes for the driver or bus for this, but NEVER manually add and
> remove sysfs files, that way lies madness and hard to maintain code.
I'm aware of this race, but still creating attributes on device probe is under wide use in the kernel:

nikita@cobook:~/kernel$ grep -r device_create_file drivers | wc -l
448

Still, in case of dim2 driver, moving to driver's dev_groups is trivial. Preparing that patch now.

Nikita

