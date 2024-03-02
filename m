Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1817BDA
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709397350; cv=none; b=t3PFNsdqsc/I7WT9AQ4RBXPnrfVv++ZALXlKTlkRhhAQY4lSLtSzF2DqkCCRfG9kJsCAygXU1/4O/QHXlHEEmoStr1D9mQJDAiePe/LQoYHwSGGWmLgE6zjvZ29UHLtwwmTgzBP0OA5Psfyo/G4JGLLRY+GtFtXtBkXqr/VAkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709397350; c=relaxed/simple;
	bh=mfv1HfdmPI8fdPhYbBPOAH1fIt9nLhFaV8nxKi5LH8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V+GLOBLad2G3iNwbnt07U6XnvrABDmm3CmEWBSokPj9ztg4/mHglyLcfZ8GSyEkVLoPSIhNHrM6iWnaYYFStJU64vqF6kvtA5QiZ45PYvCGa4a/130lpTMrv55DZ/6GSLJPZGOmszC3+FY8I6tu+nItpBuaQ+8jwsHgnteseSuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYQHObOo; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYQHObOo"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so34584851fa.3
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 08:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709397346; x=1710002146; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6e6z+3MaXoTllC5shSsv//DVSc5oQDrjOWLS3+A7iL8=;
        b=GYQHObOowfXqJ4xjRHDnIQZ68pCazPzuDZe4Ynl2rNnwH3DkCOpwuKyUr3eShRynya
         jH3BNlj6o27ePuGaRHZOhMVEjAfpkQWlgtpS2lXDLQicrPNyYa2KRpWymS1PqTwyfa8W
         Ic4FMx4EF4lHBGnygOdbn93+Ra2SHLP4VBoU7BbEYp+3lbvDukBz26eAHgLAptNJwk9B
         KERphPsw8AV7+LR2q6c5IpEHCXx+pPBtx8OjzcHLI3R562ruJTEqwfbolsytVCyzFHtD
         7SMR1s+ALLnQyN2hRNlXJ7zMMhUVfdOlx445uWJWEmo5cQj3gqe7dRW82dwngVEaw1wu
         Zgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709397346; x=1710002146;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6e6z+3MaXoTllC5shSsv//DVSc5oQDrjOWLS3+A7iL8=;
        b=c/mub3G3ANRHvSFtXerru5I4DYEEn0N7gTpV4ykc+nQWnk6jGOQ3sjQXFMLZrrJ7nq
         cKbixRzDcwKl/HhcUAgSEJbB1wPQyT+CqrmYO3tqlOT9C1CvrTuOTFWoJ7MqJCQWJjHg
         +7AOJEfNcBooh7P9ra6rgSzfw2k3hwt9CTkb1/u988Pmgy9NzO0BjnHYSEAahRydK+U6
         as8Bv7/dgbIBA/F+jBsC3cUdDLQLoiDbtAVdn5E9ra5kJEtTF96GDgwnCFUYAIWXYCxp
         9OtR1a+/jJRVFFeMrJuiWHKflfaa+ouelDikMtl57fuCYDjf+1+/ja7rRS6KQfnWNgi7
         uxPg==
X-Forwarded-Encrypted: i=1; AJvYcCWl9mf4+ZYqhmdSPrklyrKZfJooD32tF3Od9otPqiTVH0WUXzPS0NelLWICi+8C9ZK34ZU2uD5/AVWdS19G1MDv2ajl9YreWGg0sN0KGQ==
X-Gm-Message-State: AOJu0YxQWmwJvwkKe0c8OiH/Qsn/U+iv52kkoHtx6UtYlLoBThSDFsOh
	hqw2WZsn6Qw2/7Gck3IjhLUbD4iSBhrc5lZz6A9YJofcs8IRTlK4
X-Google-Smtp-Source: AGHT+IGlJ+hdrGnK505esCOHxSvoTG61Z0gG/nTd2nIOanMWktVOwVeoJcG+AgB9uxz6FKki/HgveQ==
X-Received: by 2002:a2e:3801:0:b0:2d2:a9f8:c436 with SMTP id f1-20020a2e3801000000b002d2a9f8c436mr2881143lja.53.1709397345851;
        Sat, 02 Mar 2024 08:35:45 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c358700b00412b6fbb9b5sm41816wmq.8.2024.03.02.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 08:35:45 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Alex Elder <elder@ieee.org>, Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
In-Reply-To: <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
Date: Sat, 02 Mar 2024 16:35:44 +0000
Message-ID: <m3o7bwlhgf.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Alex,
Alex Elder <elder@ieee.org> writes:

> On 3/1/24 1:04 PM, Mikhail Lobanov wrote:
>> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
>> Assigning the channel the result of executing the get_channel_from_mode function
>> without checking for NULL may result in an error.
>> 
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> I think this is an actual problem but this might not be the
> right fix.
>
> The point of the call to get_channel_from_mode() is to get
> the attached torch channel if the passed-in channel is a
> flash channel.  It's *possible* that any flash channel will
> *always* have an attached torch channel, but if so there
> ought to be a comment to that effect near this call (to
> explain why there's no need for the null pointer check).
>
> I think Dan's suggestion should be implemented as well.
> It's possible the intention really *was* to have
> get_channel_from_mode() return the original channel pointer
> if there is no attached channel with the requested mode.
> But if so, that should be done differently.  I.e., Dan's
> suggestion should be taken, and the callers should use the
> passed-in channel if the call to get_channel_from_mode()
> returns NULL.  (I hope that's clear.)
>
> So anyway, I think this (and Dan's suggestion) should be
> addressed, but your fix might not be correct.
>
> Rui, can you please shed some light on the situation?

As we talked,  this email was sent at the same time as my replies to
this thread and you think I addressed your concerns in that replies.
If not, just go ahead and ask again.

Cheers,
   Rui
>
> 					-Alex
>
>> 
>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
>> ---
>>   drivers/staging/greybus/light.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index 87d36948c610..929514350947 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>   						GB_CHANNEL_MODE_TORCH);
>>   
>>   	/* For not flash we need to convert brightness to intensity */
>> -	intensity = channel->intensity_uA.min +
>> +
>> +	if (channel) {
>> +		intensity = channel->intensity_uA.min +
>>   			(channel->intensity_uA.step * channel->led->brightness);
>>   
>> -	return __gb_lights_flash_intensity_set(channel, intensity);
>> +		return __gb_lights_flash_intensity_set(channel, intensity);
>> +	}
>> +
>> +	return 0;
>>   }
>>   #else
>>   static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
