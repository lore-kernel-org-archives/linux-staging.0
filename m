Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F8DDC3
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711393479; cv=none; b=t06h3RFKQGewDW5HAeEX/ro0x1T/vjBKN+yny85LdnPiqX/K1CulbTKSbI2Vz4OKiSy/yn7UhizE6YCQHFnZMViNOElHwl2lkxSUBRMVuYx+9f8s+nRyap5AfWbxWbyMeAC9t4npiIE7QHUQo6sULnY8ks4ozWQyVJDxQbec5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711393479; c=relaxed/simple;
	bh=10RP+hryuEgzF3eejYbpHCe3NA0eIzqnAfrPN8B9mCI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dd0JhTyTQJTR2pTVh2BOPermUQXD3Tf3Y/F/IbQke6emYD86xuUVkS4HTuyeDLPQXGUBsJMmmF4X4+003+hxeHFnD+L1jkMXS0+VR0HKTbUgOTQTNcjWTWmwp1KPAjLSaERA1vh+mlLlS7Io5fNbaH3aJGShV2lRXk3QivUou3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcyZmXN0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcyZmXN0"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513e25afabaso5602352e87.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 12:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711393475; x=1711998275; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3N/3Adm2GlrHPtgDuDVvUkAM++pdesMApffsNDmK6o=;
        b=DcyZmXN0So6a9m/8C+gkomLr8MIuki1bfmN7wcah0IrMwnLAAzKxIJySE8pv+vYZeB
         JBLHCrx2AWOk5n6nignAbnxImJq1hawP1MPblo7eh3MfjU1+OTvQ24Hj3NaSTw0Clnew
         xuMk5loDWDzGaWrwTY0PAFTzYH9yIXLXvBKckgezlSifbRfTtWc95G+iNsw5n/3B248U
         m/1cXstQA0U6bEBJZEyWP0SikJT0PAmU4WLPZdK4e6olbuWM+m4XqI+C5wt6FCwU2I7C
         R35qCOx+jr5wF8qCFrdXQFhS/yoDDtvOyIQmrhqmyP0NY7xdURoEBzgShiuz4e1bWH+h
         7P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711393475; x=1711998275;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3N/3Adm2GlrHPtgDuDVvUkAM++pdesMApffsNDmK6o=;
        b=tI4O5tmTuEAn5Y4UqKjG8W+e+YoQRzAhqzrAONkv50LjTY5WYBNbxhzK/fR99s0hg4
         i2P9lIVEj6JJDkVwY1FhX8wMMqh8EvtK3g8bJF7LrYYhVHSR9JhSMx9zxWF4nYMpNBzH
         i33dvKFiEiThty+O02Vky7du/IIptXqV31mh9vfIgh25lqb3NSacFYzUnhMyAgPXy6o+
         LRbu/sQRNYdzyTaZwFlcK3fpyFQuCIUgy5oc8cUU0UaxNtDVa34sb8vH8wjNsoYrTDOx
         ypgkpLIGyNqzHsdRYkIk9slg60PHi8qhjrpZaGCfTTj3qJ8M/UoS6PUMZvcbDQcqqxBJ
         /H7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU93im0snE7v43dysoTpZfCatkQwxZ1hJzO5bBJrvlZUJh5CbcX/ihcfI7aaEjKDvkbg4LecTWA6BvaxyyrsDRuYO/rz7tuy3fJNxJoKQ==
X-Gm-Message-State: AOJu0YwOopltz5i85az/AJkOrSnfar2YZ38sGvyHAzgVS5T4sYuuxXGp
	8fBsMWpratUGn5pqIhSIApaHGlc+hvM+VSacjhGSzMReYhv3GAnornJPjHfziy4=
X-Google-Smtp-Source: AGHT+IFYxo3DGoKZd7qFWUNQD35n7ofgkaIM8OtUomoOB31LzCDNcblGf6pjiiWwAx7JEYz6h4rhkw==
X-Received: by 2002:a05:6512:718:b0:515:8a62:682c with SMTP id b24-20020a056512071800b005158a62682cmr4766441lfs.58.1711393475068;
        Mon, 25 Mar 2024 12:04:35 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id jg26-20020a05600ca01a00b004148670f9ecsm6059842wmb.23.2024.03.25.12.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:04:34 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>,
 linux-staging@lists.linux.dev, Alex Elder <elder@ieee.org>
Subject: Re: [PATCH] greybus: lights: check return of get_channel_from_mode
In-Reply-To: <2024032543-village-reference-960d@gregkh>
References: <20240307094838.688281-1-rmfrfs@gmail.com>
 <2024032543-village-reference-960d@gregkh>
Date: Mon, 25 Mar 2024 19:04:33 +0000
Message-ID: <m35xxadtfi.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Greg,

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

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
>>  drivers/staging/greybus/light.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index c6bd86a5335a..6f10b9e2c053 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>>  		channel = get_channel_from_mode(channel->light,
>>  						GB_CHANNEL_MODE_TORCH);
>>  
>> +	if (!channel)
>> +		return -EINVAL;
>> +
>>  	/* For not flash we need to convert brightness to intensity */
>>  	intensity = channel->intensity_uA.min +
>>  			(channel->intensity_uA.step * channel->led->brightness);
>> @@ -549,7 +552,8 @@ static int gb_lights_light_v4l2_register(struct gb_light *light)
>>  	}
>>  
>>  	channel_flash = get_channel_from_mode(light, GB_CHANNEL_MODE_FLASH);
>> -	WARN_ON(!channel_flash);
>> +	if (WARN_ON(!channel_flash))
>> +		return -EINVAL;
>
> We should NOT crash machines just because of this, the WARN_ON() should
> be removed and just properly handle the error please.

Yeah, will move this to a less severe option (dev_err) to make some
noise about this "this should never happen" issue.

Cheers,
   Rui

> thanks,
>
> greg k-h
