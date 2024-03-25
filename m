Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636A12E1F6
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 18:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711391499; cv=none; b=ZGKeYeG7WVNzBElN99GAULVk62Avd3fH4KyPdL3mCZGZYgO59mUuDjuhvWX5YS6B+NDq9W/AWFdBTfsFv8a2R/I1Zr9tca4iDjZ05vwfXrhbFewQM/VQ3nwIEFDIfDY3q84/y11ZqfrYfFNLE7HEno9rS90q6L+Ui4zvc18gZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711391499; c=relaxed/simple;
	bh=wzDYu05yzRWrVs6we9co3Ynlag8JDjgb3gajQts0rh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGPPYrcjKpZW0/SSuwImGr929w4MP5oRJA9tHTZauFA+9s9XtoLuUhc1wTK5dJXRwBQrTMMZC/PnhKyWpisp5zJ7sWz5rQKIQxDbLf6VZshK+7cTJNqjQ6y1QOPh7d+3QWQ5U8bAA6ocL33bdDpl6Ovl3TwOzzpl2Psea6oekcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=K2BAXi99; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="K2BAXi99"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-789d76ad270so324702885a.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 11:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1711391495; x=1711996295; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWXC2kNqOyO/to5qi03U9/HzGBiAGiav0puPTUx88nc=;
        b=K2BAXi99QYK4CgYLpX+y8qhhFN0qWxtTJq2kj02IzWpS2cvVGMNSobSotzQYjtDO2W
         mm6CXGjzXXnmWgzWun9pjqoqP9SqkMSCLg4uwNF9VMidSoq1Ix21cddjAKm1r9jZjDyd
         v4r5dgaPOQ5hxRU7o/QY7b2dvoqS8FovHIcc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711391495; x=1711996295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWXC2kNqOyO/to5qi03U9/HzGBiAGiav0puPTUx88nc=;
        b=Ez5VM6fO8lmjxE5/+3ETGVxpl8gTs+BzIVPldGDjaEV2jUkRrgfUy9wYbjIC0HMxvp
         FRISDg9t6OiGzpX/dXMvbwsEqSyPZSWK518zz40ZpdnuzjjjcHnkVjSMJbC6inWUxtEG
         eqbY/Xc9buJUuygAX6kxMg9/lQgxcrcFgwoIk7XzbSTYeULLY5c5l+R/r/zCtRxGZeB3
         ni6ZJq752BpTLud0leKXmZiv5AbMQT0O3JEOHMmnKKy48IjOapiJbFluOdJ0Uo2S5hf3
         y9dBtied1W5NU1WD4/bSpZ9uN7X/cSNplceoE2DRDd3HrATvX2wR1Cgd4vysiOHdcUk0
         atIg==
X-Forwarded-Encrypted: i=1; AJvYcCXLGTNy+IeEDqe/n7vws0nr7xcKqeoPm+xi6ypdg9b+DToibAUUDrRU0ZgDHlHanw9K1K/s4H+FASD/CFn23M2uNIOz83L7AltadinEPg==
X-Gm-Message-State: AOJu0YyOFep36OH27egNflmSapLrnMUhZWjkNyekZtMi+taHQi0EXSEG
	wPoFL4enJdXLiCFvaiCSiehLz71bSJFSh3zrNXICcoilexCsz5QGATaDWuoEWA==
X-Google-Smtp-Source: AGHT+IHtTl6QyxmpD871JHhfnvEgjhEQq5C8VFrsMAix+gWM9mc/ChbgvU9B9JozmfBfPc4uu2Icew==
X-Received: by 2002:a05:620a:2204:b0:78a:4813:da7e with SMTP id m4-20020a05620a220400b0078a4813da7emr7215786qkh.50.1711391495365;
        Mon, 25 Mar 2024 11:31:35 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05620a094a00b0078a24b82c21sm2323834qkw.103.2024.03.25.11.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 11:31:35 -0700 (PDT)
Message-ID: <9fa87c55-42e2-4449-936f-4835b267d22f@ieee.org>
Date: Mon, 25 Mar 2024 13:31:34 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: lights: check return of get_channel_from_mode
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rui Miguel Silva <rui.silva@linaro.org>
Cc: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>,
 linux-staging@lists.linux.dev, Rui Miguel Silva <rmfrfs@gmail.com>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2024032543-village-reference-960d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/24 12:25 PM, Greg Kroah-Hartman wrote:
> On Thu, Mar 07, 2024 at 09:48:13AM +0000, Rui Miguel Silva wrote:
>> If channel for the given node is not found we return null from
>> get_channel_from_mode. Make sure we validate the return pointer
>> before using it in two of the missing places.
>>
>> This was originally reported in [0]:
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
>>
>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>> Suggested-by: Alex Elder <elder@ieee.org>
>> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> ---
>>   drivers/staging/greybus/light.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index c6bd86a5335a..6f10b9e2c053 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>   		channel = get_channel_from_mode(channel->light,
>>   						GB_CHANNEL_MODE_TORCH);
>>   
>> +	if (!channel)
>> +		return -EINVAL;
>> +
>>   	/* For not flash we need to convert brightness to intensity */
>>   	intensity = channel->intensity_uA.min +
>>   			(channel->intensity_uA.step * channel->led->brightness);
>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>   	}
>>   
>>   	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>> -	WARN_ON(!channel_flash);
>> +	if (WARN_ON(!channel_flash))
>> +		return -EINVAL;
> 
> We should NOT crash machines just because of this, the WARN_ON() should
> be removed and just properly handle the error please.

Greg, WARN_ON() doesn't normally crash the machine.  That said,
it's reasonable to remove the WARN_ON().

I think the purpose of the warning is that this is a case that
should "never happen," so if it does, it's making some noise.

The only caller is gb_lights_light_register(), and it checks
for an error and does "properly handle" the\ error (assuming
any error meaning "light has no flash" is correct).

Rui, please weigh in.

					-Alex


> 
> thanks,
> 
> greg k-h

