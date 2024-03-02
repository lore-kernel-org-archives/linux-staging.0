Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B75680
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709392879; cv=none; b=E2lZGf7MlbQyfjplGnFFCfxGtT6GMUJovwYq6Ryh2o+A+2agIEQy/UPhwedX3IS4m9pOGJol0yF/TwOT3ljDnB5Ot4jhn043G5388ERpIdgVEH0a156h2vHB00g/KD4+a7gdou8ogXSAfk8rda1AlXH/Mn7v9EEduE0z8H2HHBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709392879; c=relaxed/simple;
	bh=I47t85Os55PEa/BfNCWv/BXn73oHgJagc4hC5Nos084=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VOetQmDvQDjZSCgzHp1JtH20IwtBWtBW6/gpUZ5xrQgvS1GVZByOqxbAfBKDs2ctpwoZusN0ODwsNSAUsbt5pRpScb/Br0jl6E4MM0G16cRzi26pQka5nK/5wT+wrvrNuLl4YwcupN3Fe94qK8RYNdV6xJH6qx50y2XN6GaAisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0kzh8Wv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0kzh8Wv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d153254b7so1794294f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 07:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709392876; x=1709997676; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=db2sXyhsfc6Q/OHUgG2VKAJ26jyQ5IGovOGiX2OSiYg=;
        b=V0kzh8WvUAJSDAMxElFcdR/IgoFdY73KChOAYB4+w429Jwl1VCt47wSM/iQOn4qtuX
         65jwLGzUFbh4eIqJMS9SdcHvZtfexWjSwN9qZI5yE8aLgftnPfOR7JyymHbcdr9jGOgy
         LrsH/4017yCP8oNTkp5tVU/44F694s0WkFoa1wPdh/5N1Q66bneQkLUWHY60N7kZykLH
         SOrWki4OP7Qp7/N1Rzv8ZoO9Q4+uN42cjDbjAeTfxaGrCynGUrXZ9y7B4Khp18X/qwpo
         G4LLEQZNQ0B39mZowRDofVBzBfPjHhKirpk425fEqSK3xJHNtm06RcYOGVwsSn+OdnoV
         3w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709392876; x=1709997676;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=db2sXyhsfc6Q/OHUgG2VKAJ26jyQ5IGovOGiX2OSiYg=;
        b=k2X2OqFbhDfQ4GFolcsQPE+H8DqN0QzkkswS55abwYF3NUxLh4nvFChQFHfO6ZAtK6
         cKxsh48w5PS24iFgfXv7d+Er2cmdamU2UjZbkIc7oD+O4/gS2mZnaT7k2pTwMNTPJhzE
         zHZbVN6obwmx6tuN9Z2X+JzjFJ9suscysZuE0u22XOIxoupxJ//8VZ47qyBmARfcpqK/
         8pJWbEDG4EhBvqnpLOVxy15Q/NnIKwXYNjD/7NUYWB7IPT/Fgtd7Oie/urLh2X13lwtT
         OWRnbgMgDZcOPSyJRrS0uPcLfqURKaPUPMpWaEQlxyyHSoq4PJ9QQTCbLHWX3jhaQpyO
         Fn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx4pEhD9dUcoYZfw5bg10bS3tav76MfaTIcAyfmWfr29a3/g8o+ujAeRdo0ssgu14t9LYii3mkU/27+9z7hwgHx9Ag7HpfzNmP9fliQg==
X-Gm-Message-State: AOJu0YzvaFWVAaECjWjnsdufC/IOX2z0PhP8RYhyrWOQkyRMwKNGKhUD
	QAUPCiqtPnWWT6V5YcVPPW5JmWrV25bglgr0bkrGUI8RgXWQihdu
X-Google-Smtp-Source: AGHT+IFje49m2+Sm61wx66C0eYJgt+5oKJABw7vtF/Ez8g0huflWYR1aEJCCJ9duKZaPb3dTeuUmeg==
X-Received: by 2002:a05:6000:222:b0:33a:ee4d:98c8 with SMTP id l2-20020a056000022200b0033aee4d98c8mr3692596wrz.61.1709392876171;
        Sat, 02 Mar 2024 07:21:16 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id h5-20020adf9cc5000000b0033dd9b050f9sm7441049wre.14.2024.03.02.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 07:21:15 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Alex Elder <elder@ieee.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
In-Reply-To: <36a4d208-9945-4a65-bdf1-d8309d779e63@ieee.org>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
 <36a4d208-9945-4a65-bdf1-d8309d779e63@ieee.org>
Date: Sat, 02 Mar 2024 15:21:15 +0000
Message-ID: <m3wmqklkwk.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Alex Elder <elder@ieee.org> writes:
Hey Alex,

> On 3/2/24 3:59 AM, Dan Carpenter wrote:
>> On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
>>> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
>>> Assigning the channel the result of executing the get_channel_from_mode function
>>> without checking for NULL may result in an error.
>> 
>> get_channel_from_mode() can only return NULL when light->channels_count
>> is zero.
>> 
>> Although get_channel_from_mode() seems buggy to me.  If it can't
>> find the correct mode, it just returns the last channel.  So potentially
>> it should be made to return NULL.
>
> I agree with you.  This looks quite wrong to me, and I
> like your fix, *except* there is also no need to check
> whether the channel pointer is null inside the loop.
> It's the address of an object, and will always be non-null.
>
>      static struct gb_channel *
>      get_channel_from_mode(struct gb_light *light, u32 mode)
>      {
>          struct gb_channel *channel;
>          u32 i;
>
>          for (i = 0; i < light->channels_count; i++) {
>              channel = &light->channels[i];
>              if (channel->mode == mode)
>                  return channel;
>          }
>          return NULL;
>      }
>
>
> Rui, could you please confirm what Dan says (and his
> proposed change) was your intention?

Yup, Dan is right.

>
> If so (and assuming you also fix the check for a null
> channel pointer inside the loop):

And you also here.
>
> Reviewed-by: Alex Elder <elder@linaro.org>

Thanks.

Cheers,
   Rui
>
> 					-Alex
>
>> 
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index d62f97249aca..acd435f5d25d 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>>   static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>>   						u32 mode)
>>   {
>> -	struct gb_channel *channel = NULL;
>> +	struct gb_channel *channel;
>>   	int i;
>>   
>>   	for (i = 0; i < light->channels_count; i++) {
>>   		channel = &light->channels[i];
>>   		if (channel && channel->mode == mode)
>> -			break;
>> +			return channel;
>>   	}
>> -	return channel;
>> +	return NULL;
>>   }
>>   
>>   static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
>> _______________________________________________
>> greybus-dev mailing list -- greybus-dev@lists.linaro.org
>> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
