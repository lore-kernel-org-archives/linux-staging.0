Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D5266A7
	for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478050; cv=none; b=eGkq1XNbsuIZJKajkfgIrR/7HhIVkcuMunl4KGhSQqYnf8ycHg0/KZ30Ej5jeuD3Ib3crJo+RQVfUv5b3F+zWXKxwFBI+TYoW1FmWqOycK3rIWytomGRaI9nPj+Tqu329qcuGVKAkICLeo0lwv4zQ3qGpn8zpDSD9kKCr5KwxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478050; c=relaxed/simple;
	bh=XKIrrIe9nGe1E0/X50h2LcnP+IV6WWYC8Zg+naL6ieY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUev4o+pOZTmXUgYMdfq8mvHWu314CFFrQiRkSajSCueIcpoqK9P9KXNmnPjyCfO9GVPhWnxccYmPDQW4dqNWzEWZwtbJQPfYUaO2mnQQ8mGK/djwLXwwp5BXoMMMYbljaOWYGaEx+Akbh0rmqtA2XtzJY9XjUHb72UpZsULxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnyS38VU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnyS38VU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61cb9f6dbe7so3923425a12.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756478047; x=1757082847; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdRTZcrZww+pyy3+CoQE7C811BJbMEHRMW/x3zTJzwk=;
        b=AnyS38VUSNz6sc/nEm27BH+9Afaa/CKlH/XDLgbIrCsCxv8h61MdGbNeGE7i5sVJ1D
         KO6DWocAa28AoDbCc3qBKtzc1tn9W87bzIPPyxGl9spVsubEAsUaZq9R6dXGy6tx4k53
         0TdhIrs1Wn4uHXaVXDKkWISFrjsZ0HvUcyKq5OLHmD1FnWAGEW1X9G6skkwWOoSElcHq
         JY50d3dzASWUH8G3+2ZxgVMaS/WakjFUfFtP8STs/K4Hdmvzdq0qOKXD5HiAwGzuh3V7
         Ec5oQSzUGszYouEwHfZjFpKgo23tXrltzsOgw4YBP6zhYr9MrfyaNnNgSplAhZy33ivl
         0q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478047; x=1757082847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdRTZcrZww+pyy3+CoQE7C811BJbMEHRMW/x3zTJzwk=;
        b=TSHXXQfKMbVgtWiiBrr2wVAz8t3osWprkAOqRCjBL7royYJ0baITcBwfAJVMjrFZrd
         5mqO8BEh8S9tTTIz8CQg6W6XZ5KjotwMAHAoee3IfWNsRzS0d7FhiCvRrgraHV5ZOAzw
         tmZo6Ls4zNgWxMKrcwAyXLi/yDMm2xE/MdBEHff2VeXNKnlU9qCaAP3qR/pBWsbs24Rz
         bVCsJTT16XJ4OMaBlpBDHnmBfZM7+di0yKEchycLW/22yQr02fhLLDYz/JVTZjTAwcFJ
         8kiHb1JAsL6nQExOlP8Ys95t8ULOcBBSWYDuCk1d/vwzbYQtt1A7jz696uKxH4AGJ8Hf
         Bzjw==
X-Forwarded-Encrypted: i=1; AJvYcCWZQTVTJqA2vEAWjAJxQtToIPYdQs7EkPKL4MkP5egzJ7oD+xgn2YyOPmjvW/Ynh9wuhGZHUnr5rOxrpuL1@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb41o7GCJf+2jo+bd+rdCo5H9++/fcTXtkFcewyGOHbhe8a5IR
	aiVB6A63R1yyS5s+j00BedadjIuRtYStMvoAvAkfN58OA3rmMYZsun1YvvrkVTcK0MY=
X-Gm-Gg: ASbGncvM5EgzZ9oE/ZiwX6hynVfXd0zVU5WhgxpFvgaJazPLe2pEBRusjH7xZ3j8GDl
	jCq0TumKfrDJ1DuohwJ6jar5VnpBGtD6qG00fKZEfYCx1w8FOCQMtcsfzfk7odd72e9o1F7mns6
	NRxVzgZEVoiFsJqyfztieatPu8QtSlTjs/9ZhHe5nsAk69GJ/W9qvWJei9mVa27RRkW9VIPa/XQ
	avC3rxanjd9QRBnb/ZNIbXcjCXp8do6axf5IbWtS448sluIlRhjzXcM+SuVOJKbWdhYqmKsI0NS
	4bOYAMlWM+fy0J4V26+CT4J7ErmRmHMKWHfwnKOlQLJQEL0kwdTyMVVnb7lQ1NjFH9VNhJboxPQ
	zUK3rFr/JdpaCdy2oJrSwW8404B8rU+UXpVbE4m+9HkVN995Fg5r1lKXCooS6/ZjG0mMx2CYGcR
	XE5s/4NLv0lPlAjk7nh6E8ojlNsvV77yTwpqXjQBlei/wbN3m7DfgHQkMjNIeWL6mOA1A=
X-Google-Smtp-Source: AGHT+IFnI4qIfIyTXxPYEiHj0W+DPBn29+qh0m+qBGjJFk3GexO1LJNC3hqeoodfOeTei1uAARroxw==
X-Received: by 2002:a05:6402:2745:b0:618:1835:24ad with SMTP id 4fb4d7f45d1cf-61c1b449c05mr22852723a12.3.1756478046562;
        Fri, 29 Aug 2025 07:34:06 -0700 (PDT)
Received: from ?IPV6:2a02:908:1b0:afe0:7f20:afeb:8c24:8d02? ([2a02:908:1b0:afe0:7f20:afeb:8c24:8d02])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbc07sm1897283a12.30.2025.08.29.07.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 07:34:06 -0700 (PDT)
Message-ID: <20ed561b-aba1-432c-9fdc-103e724852d9@gmail.com>
Date: Fri, 29 Aug 2025 16:34:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: gpib: simplify and fix get_data_lines
To: Dave Penkler <dpenkler@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, matchstick@neverthere.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 marcello.carla@gmx.com
References: <20250827113858.17265-1-osama.abdelkader@gmail.com>
 <aK73HPDKu6rqg9Ya@stanley.mountain> <aK8SGpevZsGM5CCF@egonzo>
Content-Language: en-US
From: Osama Abdelkader <osama.abdelkader@gmail.com>
In-Reply-To: <aK8SGpevZsGM5CCF@egonzo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/27/25 4:11 PM, Dave Penkler wrote:
> On Wed, Aug 27, 2025 at 03:16:28PM +0300, Dan Carpenter wrote:
>> On Wed, Aug 27, 2025 at 01:38:57PM +0200, Osama Abdelkader wrote:
>>> The function `get_data_lines()` in gpib_bitbang.c currently reads 8
>>> GPIO descriptors individually and combines them into a byte.
>>> This has two issues:
>>>
>>>   * `gpiod_get_value()` returns an `int` which may be negative on
>>>     error. Assigning it directly into a `u8` may propagate unexpected
>>>     values. Masking ensures only the LSB is used.
>> This part isn't really true any more.
>>
>>>   * The code is repetitive and harder to extend.
>>>
>>> Fix this by introducing a local array of GPIO descriptors and looping
>>> over them, while masking the return value to its least significant bit.
>> There really isn't any need to mask now that we're checking for
>> negatives.
>>
>>> This reduces duplication, makes the code more maintainable, and avoids
>>> possible data corruption from negative `gpiod_get_value()` returns.
>>>
>>> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
>>> ---
>>> v2:
>>> Just print the gpio pin error and leave the bit as zero
>>> ---
>>>  drivers/staging/gpib/gpio/gpib_bitbang.c | 28 ++++++++++++++----------
>>>  1 file changed, 17 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
>>> index 17884810fd69..f4ca59c007dd 100644
>>> --- a/drivers/staging/gpib/gpio/gpib_bitbang.c
>>> +++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
>>> @@ -1403,17 +1403,23 @@ static void set_data_lines(u8 byte)
>>>  
>>>  static u8 get_data_lines(void)
>>>  {
>>> -	u8 ret;
>>> -
>>> -	ret = gpiod_get_value(D01);
>>> -	ret |= gpiod_get_value(D02) << 1;
>>> -	ret |= gpiod_get_value(D03) << 2;
>>> -	ret |= gpiod_get_value(D04) << 3;
>>> -	ret |= gpiod_get_value(D05) << 4;
>>> -	ret |= gpiod_get_value(D06) << 5;
>>> -	ret |= gpiod_get_value(D07) << 6;
>>> -	ret |= gpiod_get_value(D08) << 7;
>>> -	return ~ret;
>>> +	struct gpio_desc *lines[8] = {
>>> +		D01, D02, D03, D04, D05, D06, D07, D08
>>> +	};
>>> +
>> Delete this blank line.
>>
>>> +	u8 val = 0;
>>> +	int ret, i;
>>> +
>>> +	for (i = 0; i < 8; i++) {
>>> +		ret = gpiod_get_value(lines[i]);
>>> +		if (ret < 0) {
>>> +			pr_err("get GPIO pin %d error: %d\n", i, ret);
>>> +			continue;
>>> +		}
>>> +		val |= (ret & 1) << i;
>> Delete the mask.
>>
>> (I wavered on whether I should comment on the nit picky things I've
>> said in this email, but in the end it was the out of date commit
>> message which pushed me over the edge.  I would have ignored the
>> other things otherwise).
>>
>> regards,
>> dan carpenter
>>
>>
> This patch seems unnecessary.
> The code will never be extended.

But using for loop is more readable than writing 8 similar lines, or?

> In the unlikely case of errors it will produce a huge streams of console spam.
> It negatively impacts performance:  114209 bytes/sec vs 118274 bytes/sec.

We can remove that error message to not impact the performance, but storing errors even unlikely cases
as gpio data is a bug, or?

> regards,
> -Dave
