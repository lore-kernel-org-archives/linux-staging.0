Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771FF51C52
	for <linux-staging@lists.linux.dev>; Thu,  2 May 2024 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714639461; cv=none; b=iD3iBs54ZGZp+2NZzzqmY1wA8nwvpZ+/HfOZubHU/jsMY0QDapgEtprU/lqYH4QO1jkwrfeieBWxEUftN9Dd+62jAtt+4EjE2cf8/wJl5lXHlI+mD4OelETBlHczHzcYg+r78b4SO3oY9mpo6L1y2yF1YqESoehHQylMYcr3nVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714639461; c=relaxed/simple;
	bh=kgt/1SMeEZnm5Ptv8rEZ64sSPgtiVX0biVlUi6l52F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUf+iQkO9cTh2xaR5Blmb9umFpDdpTpoHp9fmFaA/Wz40puzoN8ibCO3h+JcSAL1+YfgUNYXznKCOeoqk6lx/td7+LUwtwl6sqElh3CqTz4Ch3b0ILwkKdXFmXq5fOPx0PvhnjhkOup0DjCVjxVep/GmqKebfWZ/xpP4T6Q/vXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oxs1IIfV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oxs1IIfV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-518931f8d23so7704421e87.3
        for <linux-staging@lists.linux.dev>; Thu, 02 May 2024 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714639457; x=1715244257; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcUAASY20ow1VFW4//wEVrnYF6VyjHuuXQ8tiu7WF10=;
        b=Oxs1IIfVtXPGGdi0So1njFileu9GzLeveTVWLbj3jP+CauJRSIkmSkkTpXl9aYRkYg
         u9wGFz2gmNIqAoqXlpI+oHGvPcjb2K7g38dsxteM4bd15hmtJw87VY7KhfzF3NcXoulr
         X3lqKAscxR0wHswfHJRiQg1gwL8XlO9WWuW8dUwU3x7G60t9bRfNDvfFR/BPFy6R8NdW
         IuBeANt/VE4UDOf8VYVahOnzVdq1jl6Z88caWdqk88pgoldrFJc61iT3QLI9kZu432Oo
         DhoLEaRTkLAbRv0Ui+WZQ8f9Uzb3UXjkFzjmjDQW0FuuWTbhNJ1S35+kPpFoqMrhuTHH
         t6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714639457; x=1715244257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcUAASY20ow1VFW4//wEVrnYF6VyjHuuXQ8tiu7WF10=;
        b=IQgQtA9jGn6X6VIA63zP3hslmvfzo2+egKmyFNEyqNEtE3oNmleKLrsTt/SErDfh+4
         R4Jz8Y/nwUTNiPL0Jro7l/1rudPuBtudkWTRIgiyPpqiSNEZxUHMAaK13BPpFTQteNJ5
         a+wUc+PWl/2cyuqPeSaH3X1mfFneW01ASDjliSdgd0BSDWxb4nO7SNX154lfpUoCHcP9
         O2k/V+432/li8OR5dpgLdCDdbFAnpMd2+xYxDX7DcOyiF/c6uuxg5LaXcUEBgRpPQf0F
         Vedc0GtVIkei3BGLJdNP28e3LWl4Gj69NRw6f6jjwS/6IXWjTKOhU43AlQbozKhYbamr
         qblg==
X-Forwarded-Encrypted: i=1; AJvYcCXevfERoJPvuuLiA91enMGeUiT1Oza6BkHobBAcz1lY2xdMD9xd+ioAzY5MykG6C8RvuL9wNwlnFndligY/U5kI5SjFyQBfYJgSqg6Sug==
X-Gm-Message-State: AOJu0YwAaZ2OPtNAQbiZSH6c84q5Ju+Sx20XW4wXI1dTUzL8zxAsj7YK
	aJ8kEVNgYndwuo/PP0c6/nAQFdnbDrxeD1tF68RNZLmQ2oGV3PYm
X-Google-Smtp-Source: AGHT+IGVAwRs80djLEUTTlp/zFwopzo7i0fXr93wtXW+S5botvqJTpOB/D17ajYNyCvcpnMsh7p1UA==
X-Received: by 2002:a19:2d06:0:b0:51f:4a03:a053 with SMTP id k6-20020a192d06000000b0051f4a03a053mr257773lfj.4.1714639457317;
        Thu, 02 May 2024 01:44:17 -0700 (PDT)
Received: from ?IPV6:2a06:c701:737b:ef00:c50a:d96c:6c34:ec52? ([2a06:c701:737b:ef00:c50a:d96c:6c34:ec52])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c4f0800b0041bfa349cadsm4902544wmq.16.2024.05.02.01.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 01:44:16 -0700 (PDT)
Message-ID: <b0cd37c3-5465-467d-8074-67fa2fddcc4d@gmail.com>
Date: Thu, 2 May 2024 11:44:15 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] staging: pi433: Rename goto label.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 andriy.shevchenko@linux.intel.com, robh@kernel.org, felixkimbu1@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240501055820.603272-1-ikobh7@gmail.com>
 <20240501055820.603272-3-ikobh7@gmail.com>
 <3005db51-58f7-4247-a37b-02933767f644@moroto.mountain>
Content-Language: en-US
From: Shahar Avidar <ikobh7@gmail.com>
In-Reply-To: <3005db51-58f7-4247-a37b-02933767f644@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2024 17:06, Dan Carpenter wrote:
> On Wed, May 01, 2024 at 08:58:20AM +0300, Shahar Avidar wrote:
>> Use destroy_class_and_remove_dbfs instead of unreg_class_and_remove_dbfs.
>>
>> Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
>> ---
>>   drivers/staging/pi433/pi433_if.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
>> index c8c1d296184b..4fffd7007040 100644
>> --- a/drivers/staging/pi433/pi433_if.c
>> +++ b/drivers/staging/pi433/pi433_if.c
>> @@ -1409,11 +1409,11 @@ static int __init pi433_init(void)
>>   
>>   	status = spi_register_driver(&pi433_spi_driver);
>>   	if (status < 0)
>> -		goto unreg_class_and_remove_dbfs;
>> +		goto destroy_class_and_remove_dbfs;
>>   
>>   	return 0;
>>   
>> -unreg_class_and_remove_dbfs:
>> +destroy_class_and_remove_dbfs:
>>   	debugfs_remove(root_dir);
>>   	class_destroy(pi433_class);
> 
> This is cleaning up something which changed in patch 1 so it should have
> been done in patch 1.
> 
Thanks for your input.
I thought of a previous comment you had were you noted Greg preferred 
small patches, so I did my best to keep the first patch the with minimum 
changes without breaking git digest.

This patchset won't be accepted anyway.

> regards,
> dan carpenter
> 
>>   unreg_chrdev:
>> -- 
>> 2.34.1
-- 
Regards,

Shahar

