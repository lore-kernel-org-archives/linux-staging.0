Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00F19CC04
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907869; cv=none; b=rlP9fn9h70F5lKCBTITqbvkmqlOmXc0WyQbk4HHu+uhDoi9Jx685vC/jk6gnlAQc1y9III2j3vGXZIpRPjQ5mBhaHOezLCV6o5N/ATqGNlZ+CfEANhgV75MSAheLq0Xm4t58Iq56rDR5/DMGqwpyDf2a0vbSnDt9AMHNARlPaKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907869; c=relaxed/simple;
	bh=KQCJ9q56BBbfdQKgw4ihkVxs0x2/I55BBLAghYrpX90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnsZ6CjxycmJiiWImwQQ2Eaftm45pkL0EVjRLJLy+mcjSWbHp9mKs2nwTgGOQak+YB3FC1KbPnv4H9O236Rx8j3Y8MsnLb9ZJDzxvGvKQDtIP71BTjfZ1wYsU8caFRiVXlHZTGTa4BdJgz3utPQTonJvL34p7L5EW47i+Gu/Hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9w4hjZR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9w4hjZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728907866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMrcBLoHcbOcsNGZvKHjw3mzkIxPzPRSPIevwpJyyDM=;
	b=R9w4hjZRT+BnsUwWoKz0I5IXa37iqVxMg7+2mVi+ddwZqGs5K4KGbhlrU0+wwTQm7AEFxe
	+JvtA15k2/0I4IWxyuInqFGPOHFLw0Q4vSIIs44MpES8jDHyJUsAdtTGfvp5fay5ibz7R1
	QtUF7Ni/gifUyEThj6WE90tm2Kvi2b8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-9uGRcuv9O0i7cHxieU4k4w-1; Mon, 14 Oct 2024 08:11:05 -0400
X-MC-Unique: 9uGRcuv9O0i7cHxieU4k4w-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c92e8b8101so3157011a12.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 05:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907864; x=1729512664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMrcBLoHcbOcsNGZvKHjw3mzkIxPzPRSPIevwpJyyDM=;
        b=a2HC8vv2TAe7yvlRS8gSxbZEeR/ncA9UFYqwo8I/ma0q3ZYimFUujFKw21sbzoVSOO
         DS5NElHhDLkFUyYpnuL5CJkUNItwFjUf+OamiNk/5XsaKEAmF3pZcK/Q5ZFvOdpcdZF5
         AmcfTWJWxEKZwzGETgJ373tn2DOQXgWSzDFufvBlazsYTk+xj9ErHWZePxCq5ERcpWPp
         3lTd26K4xsGZes+mRzfy/y1l5VjBxg+mfyk68t145WqxD9B2C9of9FBFHvSjzx/XeP1x
         i6Wtdx8dku8noz2rh3YcL180hVS1ybzJzByMS3E/fF0R1nKOaeGDkQq3j7bkhK/ALaMP
         m3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfsO0Qc+KJjkPIsbx7kP3+EmqHkcXUKQI8PXAAzQYmFTfNDgneKviNb4ntMYIQ0ZGqBZ2I/T6IMw8rWAY/@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ2ZZAUsit7kX0kRkZkIGtWXZwYDEn1Eb5yZFjHQY0Ldhy3yQc
	A76irLT8h8rq8SpmJpdzcj8QkvOSWlI88D7jzCpjfrffixMIvAp47F66ved7q36jQ+vE9ASlu5C
	MZf6CpOlXOENnlTpGwFqM8h4TXnEvms3hwQB7j2RrR4JyJwuFYG5+1SLTN53XoGA=
X-Received: by 2002:a05:6402:1e8b:b0:5c8:79fa:2e4f with SMTP id 4fb4d7f45d1cf-5c948d764e2mr7749837a12.32.1728907864470;
        Mon, 14 Oct 2024 05:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Gw1WbyJBhpULtWclfN+Pi3l+xn2/n0R+iwGpkgC206e/Yof/bHj86HZ1izzH7Sl6E16Gtg==
X-Received: by 2002:a05:6402:1e8b:b0:5c8:79fa:2e4f with SMTP id 4fb4d7f45d1cf-5c948d764e2mr7749820a12.32.1728907864033;
        Mon, 14 Oct 2024 05:11:04 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937293cf4sm4883762a12.80.2024.10.14.05.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 05:11:03 -0700 (PDT)
Message-ID: <925c9bc3-18c8-4e16-9ec4-904cf77706de@redhat.com>
Date: Mon, 14 Oct 2024 14:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: atomisp: mt9m114: Add missing mutex_init()
 call
To: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Robert Mast <rn.mast@zonnet.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241013154056.12532-1-hdegoede@redhat.com>
 <20241013154056.12532-4-hdegoede@redhat.com>
 <Zw0BIPSWN_vR48xf@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zw0BIPSWN_vR48xf@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Oct-24 1:31 PM, Andy Shevchenko wrote:
> On Sun, Oct 13, 2024 at 05:40:55PM +0200, Hans de Goede wrote:
>> The input_lock was not being initialized, fix this.
>>
>> Also switch to devm_kzalloc() for the main driver data struct, so that
>> devm_mutex_init() can be used for this.
> 
> ...
> 
>>  		ret = mt9m114_s_config(&dev->sd, client->irq, pdata);
>>  	if (!pdata || ret) {
> 
> Hmm... What is the ret value when no pdata is provided?

0, so this error-exit leaves the driver bound (pre-existing problem)

The error handling in the probe function is quite foobar in general,
but I just wanted to get the driver working as a POC / to have
a known working setup before focusing on using the other driver
since that is the way forward.

Regards,

Hans




> 
>>  		v4l2_device_unregister_subdev(&dev->sd);
>> -		kfree(dev);
>>  		return ret;
>>  	}
> 
> ...
> 
>>  	ret = atomisp_register_i2c_module(&dev->sd, pdata);
>>  	if (ret) {
>>  		v4l2_device_unregister_subdev(&dev->sd);
>> -		kfree(dev);
>>  		/* Coverity CID 298095 - return on error */
> 
> This comment is useless. But it seems we tend to drop this code completely in
> the future.
> 
>>  		return ret;
>>  	}
> 

