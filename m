Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE41188596
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760485991; cv=none; b=E/mpqdLDbRwHg05ggDfm+nP1REVGRzVHX5OIidmlzPpm5ptfbJSVX4wl8l3WSyBieeLcljZIeAT8r3pmGcrTw+fbnZvqUrryOSfjG8Oz0l5Lb8u9sfJC1koPQTDjsTWxF+jg7dhQm8xK/Q7PXfOMYUmEH4plR3zVcd+MVZMJNZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760485991; c=relaxed/simple;
	bh=bXKfCGcteRtbKltdpijmFSV2FYgT1rZYsZg4DPoKs9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oc5Nrz/S5gXmNft3YO+9Au0ZYRsTgROkUDThXeiCkZyj3noKViEe9/T7n/7zXTaaWjv3+M3KoB2GLBK0kjCR3BBeHZZt1um9/fTFWbM4FrPQ0oVX9anjF/DTP0dIMZxIl+nBpsGNhrupuKsebxnZQ0HBERo9uXR4rBOG7vYv41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvfoHpqi; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvfoHpqi"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-88e51cf965dso1614085a.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 16:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760485988; x=1761090788; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ob1OnhaB8yNlYIjqAs5ylAnnzR5hzBaZ/c2ZonR81NM=;
        b=cvfoHpqip09GkHfsLas1UQqH731VOQqNadHRwbU0cN8QDsZ8ZgQZhBIVVEvAmG60it
         UaYUFQp7o2jU9q1K+tDYwE/s2OTbLYmq/Ae2RXt/7Pn02R2U3n84ApmTcGCIZbpVojdg
         gcEEf28xjNBMBljMGkW7nb8aqYT3QWSwAZB47KzW0Hy+drUCJ5TGCHIXiU/QnEAYSZ/T
         JkgJULkAk9eBtnxNphl0TqxzcqlFwWQB9P/ssv0x1cUtB1mhiBbz4pSvl7OfizeS5Gb7
         M0dB12Xy3GT82C7H4vkvvbvGO9tGiTFYobheT8v94z71RtxwbXOjhrxAlU+YD7c2UbvP
         +xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760485988; x=1761090788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob1OnhaB8yNlYIjqAs5ylAnnzR5hzBaZ/c2ZonR81NM=;
        b=VSdZQKK1QCw+KObsot40J0irHP9NN9s70sl+69pruZd2GjAxqVzxlq8k0sDH7N3lot
         Q6pBAhG7uTrv+4a6v7LyeDVh5UmzqRwJjb6gn0DgSw0u3GpBbkOITx4jBTvO6cLKAxZo
         8/IFtkUcsnSp7tBbrxl1AkvdfFarISFs5jq79ACThNGWbseVbLuAzEGYUSmJ4Q/rYJ4e
         7X4NJaCx9iqpEtbjthaBKSDV+j/KnJJW6FvBpUhaTaXjt38YmogI8o5e18VTmmVtJLLd
         8j9JVASyZ1fUGHtxT3JlzFXWGy7BtW+2HyTzG2S9rH5urgQqZGCwIhSI4XqxEt7LsLlZ
         bgAA==
X-Forwarded-Encrypted: i=1; AJvYcCVcHl4cvCbVu/iZ9nBazBpcONR0rCXDiadcIDj7UXenpn5ei5SGOnCnpF6VqszenaISdbULvIUtxqcXDLxJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyD7Ya6/WxWMB5GSNYKtsMIxBdg9qM3m7T3TqW/PoyRubLnNPXS
	22x0fzc0dxCppIgVMESirpo7OEAqfYTsKtJkH/QRvhKegDLeJBxmctwm
X-Gm-Gg: ASbGncsod3v2EXlhY0I2RtMc0QxpZ4SRGVAkA3BRhtdKihqoB1RCpE6FAgw2xHfRhOM
	CkW6+vbYAZU4gOG0Yvk7slj+u6QknIszXdx46vwkslhWNzv5kxiVtTHwWVHwi/jlym5BoWUkOZb
	70MohCiBg/nxVgK8VVTy8KkLMJPenbEXsafkqOqDza2IorlgSwSSU8ei2jMlwA4Aaf0cJs5V9Vf
	+/2BRzDxXkIZO75//YB97gH7XUr//zl9nPL/jpVsSblw608MNhL4d9F0wOJv3WJs6V6J59USXZ+
	/EEh5XgGknNudOzPly/OBpewQPLSEre16LoKBSrWIt/IRpniB/BLghAuBE51zSekbRKM2qtWhFZ
	SiqCT9ghmv6fInlHDUx2pjOV+NmJcs5ZOYHS2YlcaPtQ74HeXrjaK8vN3qcbjgVO5fXk4
X-Google-Smtp-Source: AGHT+IHqzXmUGwko+aYtEh2ILwYIMC3c/wyMbPVlj1R55EMnuDNxOjiiifOG9dp6+prvXd8kQnjCfQ==
X-Received: by 2002:a05:620a:44c1:b0:85d:3c32:c404 with SMTP id af79cd13be357-88353464330mr3229717785a.85.1760485988310;
        Tue, 14 Oct 2025 16:53:08 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2273e9dsm1286214585a.47.2025.10.14.16.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 16:53:07 -0700 (PDT)
Message-ID: <451b7aaf-86d0-4a0d-9578-b76c3a7886d5@gmail.com>
Date: Tue, 14 Oct 2025 19:53:05 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: documentation: replace strncpy() with
 strscpy_pad()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org,
 schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
 <aO5a9izAISpCDJrc@stanley.mountain>
 <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>
 <aO6EyUVO9EOYfzV4@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aO6EyUVO9EOYfzV4@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for clarifying. That makes sense — since the struct starts
zeroed and the last byte remains untouched, the current code is
already safe. I’ll drop this patch.

Appreciate the quick guidance.

Best
Vivek

On 2025-10-14 1:13 p.m., Dan Carpenter wrote:
> On Tue, Oct 14, 2025 at 12:10:50PM -0400, Vivek BalachandharTN wrote:
>> Hi Dan,
>>
>> Thanks again—confirmed the structs are zero-initialized before the copy.
>>
>> Would a minimal fix that guarantees NUL-termination be acceptable, e.g.:
>>
>> strncpy((char *)&intf_load.firmware_tag, firmware_tag,
>>          GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
>> ((char *)&intf_load.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE - 1] = '\0';
>>
>> I can respin as v2 with the same change applied to the other two
>> firmware_tag
>> fields.
> Sorry, I should have explained this at the start...  The struct is
> initialized to zero.  The strncpy() copies at most
> "GB_FIRMWARE_U_TAG_MAX_SIZE - 1" characters, meaning we never copy
> anything to the last character which stays as zero.
>
> regards,
> dan carpenter
>
