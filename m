Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E6182CA
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709393503; cv=none; b=bJQPbFP/EZd+xlTmmATX9sA+Yfl26T3kNkH4RDZOisfxLJOfBtConjzDhe0PI/MEVjLb3dMwbR+ds7yXO8GRsTRfwt3Obz5KntaQTIy1sIOmKyMjo4l8eI73ldgC6/uITY4CMwHobvnPVnTZ+8II+L+2oPzXJ2vAIb1/8vrMT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709393503; c=relaxed/simple;
	bh=+v4yvN0kxUI9tPDM9nvpiiOzpOQi8oxzkIuHiqx0jYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVObmY4q1sWknTbNUmEr7aBTbtUaHV+8lNsJkmiVKe0khvhY0cR9Miriqc1sv4dJ8iZmXqMyCmxDSx5FYnNejJT8vlbfdlBAYh7cSG4m2/Dx+2zXz7pHTwmv+Kl+l4DZdrbfE17Rmp4HcJCNYuighyHslNzHWEiShEq+tkilclA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Q8S2ELGD; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Q8S2ELGD"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c3e4290f5fso160455039f.2
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709393500; x=1709998300; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcwS+vAT2fwsjgoSR/yvl2URHCxzURia5C1neOopGqY=;
        b=Q8S2ELGDp1DmU//Eq0Wzao7fqk9NZ1UsSRbb9VvNriBFdfk48uzkbGUSDBm/jFtQwt
         O8J8CbvrhxHRdTiYKvZcDFViY4HmQ4lpmKzE+vSoAiYZoa0oBDdU3JWFU3rYyyvIa5vH
         4HdTSmmbymfCz4qO3G68AFwjBcOeFyOiMJtCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709393500; x=1709998300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcwS+vAT2fwsjgoSR/yvl2URHCxzURia5C1neOopGqY=;
        b=X+izVyC9uuHkQKlesNew1LfAf7Y/Qjl+R5GaJBjLMpUnRa/osrme48cCea+Ba2B5vd
         vPH01YLJy3PEdJQixPPB2Kq43xTARKLE1zPGgLRSAzUUBKujXH4vP0tDktn9z2zWUVdU
         QTaf4Dmb4pXS0VYzNX6ZjYqSNCZ5xY+KJakBMFMzGS7TQsXLVPg2sa2fqG1W2fTAW47v
         V1y7wp4aUTKjvjK9JNjFa26ymc0iUxYxhbQbaOEa+xuz46TTvhiXLabmXQgwn/V8kYPz
         jMq2S/R/pkGwcfpDMJP4DPdGBfLB0iQgTZq64tdvBWN+hxG3NC2H3i4KTjON7JA3o5Zh
         AVXw==
X-Forwarded-Encrypted: i=1; AJvYcCXkRSaw9IANe4VgWgeLr/CLRTFLVQck3GD6BHIcdxFYFYgbCC+r+lATyml3X8nSflhyeDElbWKu0EazufOWfdtMLsxITDPw5vztWLEnrQ==
X-Gm-Message-State: AOJu0YxDL1CvWxva/2fU5MaHrcxQu49rLUqGHyLdltXFTP02qafFYm2V
	nNHhDCNxE5iJcTF1Pxs6Kwz38S4UbaZiSbHtvDFdF47CfeRvUC/65qw/BpJRUg==
X-Google-Smtp-Source: AGHT+IEBv+JTa8wk1BLmy4gNLO1GkrEgOLNKogq6t7WnUC0e929OVeUuFvEzgQyds5sDteHCjN1p8Q==
X-Received: by 2002:a5e:a810:0:b0:7c7:f6ac:cb4 with SMTP id c16-20020a5ea810000000b007c7f6ac0cb4mr4979742ioa.3.1709393499975;
        Sat, 02 Mar 2024 07:31:39 -0800 (PST)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id s7-20020a056602168700b007c7ab36d3ffsm1438960iow.43.2024.03.02.07.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 07:31:39 -0800 (PST)
Message-ID: <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
Date: Sat, 2 Mar 2024 09:31:38 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [greybus-dev] [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
Content-Language: en-US
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
 Rui Miguel Silva <rmfrfs@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/24 1:04 PM, Mikhail Lobanov wrote:
> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

I think this is an actual problem but this might not be the
right fix.

The point of the call to get_channel_from_mode() is to get
the attached torch channel if the passed-in channel is a
flash channel.  It's *possible* that any flash channel will
*always* have an attached torch channel, but if so there
ought to be a comment to that effect near this call (to
explain why there's no need for the null pointer check).

I think Dan's suggestion should be implemented as well.
It's possible the intention really *was* to have
get_channel_from_mode() return the original channel pointer
if there is no attached channel with the requested mode.
But if so, that should be done differently.  I.e., Dan's
suggestion should be taken, and the callers should use the
passed-in channel if the call to get_channel_from_mode()
returns NULL.  (I hope that's clear.)

So anyway, I think this (and Dan's suggestion) should be
addressed, but your fix might not be correct.

Rui, can you please shed some light on the situation?

					-Alex

> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> ---
>   drivers/staging/greybus/light.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index 87d36948c610..929514350947 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>   						GB_CHANNEL_MODE_TORCH);
>   
>   	/* For not flash we need to convert brightness to intensity */
> -	intensity = channel->intensity_uA.min +
> +
> +	if (channel) {
> +		intensity = channel->intensity_uA.min +
>   			(channel->intensity_uA.step * channel->led->brightness);
>   
> -	return __gb_lights_flash_intensity_set(channel, intensity);
> +		return __gb_lights_flash_intensity_set(channel, intensity);
> +	}
> +
> +	return 0;
>   }
>   #else
>   static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)

