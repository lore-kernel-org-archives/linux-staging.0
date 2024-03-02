Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C02175A4
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709391442; cv=none; b=YsGlz9W6TEWKXa006Va8I2tb+NP1xP3K5UikCwMmbHSETjepuXCWP0Anzy1Z3IErAbqw5Nsp8gDMPhIQcc7ZG/DhFprs/wfqQveAKmfRHu6MTLsrtFXKTaHBvEPx6dp06p2k4pV4F8YYBOdlHn+mZ2XAwO9T9U1Wyx81wjjEBGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709391442; c=relaxed/simple;
	bh=vsDO370P9L0eb7fcWgulrtTqYp1omUqwzrlkY+TsrEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNhUYGLx5uO4rM8Ssmh07Wn18Nf2T5Ly4uG4Vosd7mk/73B8uk77tklp16jWD2SYpPjBzFBrnWRFwRBaLF4ZMf48ozTer09A6oBq1Iyyjci9pW85kOm8Yo4SiFF6Fci83NxQPvVoNKZMFDJtoeyIzWvAuKTqkwugiLRg3b6d/Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=amD1vwvE; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="amD1vwvE"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68f5cdca7a3so31122486d6.1
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709391438; x=1709996238; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfIgoTdA9N+MeIiEy0xWNsxv5l2fuvtP53bPZ++Mceg=;
        b=amD1vwvEUutfV4Jpoh3lVk+yIUwL0rwokuHJ3XbTGPYu+iz/H6AOSgpP1LZtwB3IjF
         0cay1V2TdJM7Ld4sZoWfE34WYaYQyEjRgfe8ZgTNQ4wQkynLiyj0wet0KsV5d3qblrEC
         zMBWdR6yz3hm+Zywnbma4RqwTOeMwYHpy9hRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709391438; x=1709996238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfIgoTdA9N+MeIiEy0xWNsxv5l2fuvtP53bPZ++Mceg=;
        b=aQqDVIt1BypTfzlAgMVj1xDQ4corp1H7Evq358iCJOyUleWWGuvicwILDPU48TCdRu
         2n2SvBRlw9F/OBfBs//IUtPp0T/SPoi1YGijv39+4olSGimza7Eq4R53zckEhjDUA6wS
         B1oAiIt1l8amoG4XoyS7nM1BQQdbsx6UbDdpdMQG8nW21Oj8x1VS9Gc169YYUBcrVJKI
         S/LayfPVxmqD6975iYWi2t0+vncuPRLECOWdOiqr0oPpu2v9vL19Ioa3GxxGyo93Sshw
         DlsEKNOF1S9kv2IvJBjTlHiOTl3MlZdf/gYXabAnSLxXM9RcCnYfE2nLXjH5c33MjrtA
         wRWA==
X-Forwarded-Encrypted: i=1; AJvYcCW/WqBSsFgTPXAhkSuaAEPnWCozA0P9/AEgBrRcICXA+Ke+BUe05yJ7UdnkDge0HjuVtRpXL8RdqsdcboQz82wmx7dBF7SFpJ0uksXD1Q==
X-Gm-Message-State: AOJu0YzCMkwIK9KHjdrn3983woodEpvoyjqeA/euxxR7i55a8dsmQuwf
	3DCV1UPdKzTi0znELHxwu3q8c0p+FKzETr/Cakt2ODnANR32B5i0Y8CCfYstcA==
X-Google-Smtp-Source: AGHT+IG9qW7IYS8D4z4TN+vHi467Y/Zi72+/DehK/Phj0uWp6/CbVvutRoW9BsGBwd53MOe9t8x0Hw==
X-Received: by 2002:a0c:da84:0:b0:690:5ff8:cc0 with SMTP id z4-20020a0cda84000000b006905ff80cc0mr2942320qvj.11.1709391438501;
        Sat, 02 Mar 2024 06:57:18 -0800 (PST)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id or33-20020a05621446a100b0068f455083fbsm3018169qvb.63.2024.03.02.06.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 06:57:18 -0800 (PST)
Message-ID: <36a4d208-9945-4a65-bdf1-d8309d779e63@ieee.org>
Date: Sat, 2 Mar 2024 08:57:17 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Mikhail Lobanov <m.lobanov@rosalinux.ru>, rmfrfs@gmail.com
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/24 3:59 AM, Dan Carpenter wrote:
> On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
>> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
>> Assigning the channel the result of executing the get_channel_from_mode function
>> without checking for NULL may result in an error.
> 
> get_channel_from_mode() can only return NULL when light->channels_count
> is zero.
> 
> Although get_channel_from_mode() seems buggy to me.  If it can't
> find the correct mode, it just returns the last channel.  So potentially
> it should be made to return NULL.

I agree with you.  This looks quite wrong to me, and I
like your fix, *except* there is also no need to check
whether the channel pointer is null inside the loop.
It's the address of an object, and will always be non-null.

     static struct gb_channel *
     get_channel_from_mode(struct gb_light *light, u32 mode)
     {
         struct gb_channel *channel;
         u32 i;

         for (i = 0; i < light->channels_count; i++) {
             channel = &light->channels[i];
             if (channel->mode == mode)
                 return channel;
         }
         return NULL;
     }


Rui, could you please confirm what Dan says (and his
proposed change) was your intention?

If so (and assuming you also fix the check for a null
channel pointer inside the loop):

Reviewed-by: Alex Elder <elder@linaro.org>

					-Alex

> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index d62f97249aca..acd435f5d25d 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>   static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>   						u32 mode)
>   {
> -	struct gb_channel *channel = NULL;
> +	struct gb_channel *channel;
>   	int i;
>   
>   	for (i = 0; i < light->channels_count; i++) {
>   		channel = &light->channels[i];
>   		if (channel && channel->mode == mode)
> -			break;
> +			return channel;
>   	}
> -	return channel;
> +	return NULL;
>   }
>   
>   static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

