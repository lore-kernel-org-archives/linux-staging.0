Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A1F5D919
	for <linux-staging@lists.linux.dev>; Wed,  6 Mar 2024 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709716906; cv=none; b=esCnyxpyh7RmdrD99K6OeJWNVZrC0/eJAlp5Au4rFsE7VzWT2/V6yRMoSeIxnJL48a9F+iKR9Fj2Hm6nRrLDz78kyAEiS27Z/6lwyWQNTtx+te54iSicsNtartzCwe8448UFbXdhSpdI8mdY3lSgBkqps2KhrQV+XMI5W5zXkf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709716906; c=relaxed/simple;
	bh=zPmVvzS5dPNxox3FTlthI+VtPBf1PINX+vtjBXnCwDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SRxGFVbLVBAF+NY/dwllsHryk1UfmlVDEE+9SdGgtNh55jdqTDtGVq+vfmTahWV+mqe2me03iKOo47xktemUd6KBIScv3NorZWqMxcEG5rmNWmtU3l9TOMHtt9plw86dsG6jcVPqFTa8V9ySxmfyBr0OXhU2Tr4Bo3LZLuXq8nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmHc1bHt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmHc1bHt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412e784060cso3412335e9.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Mar 2024 01:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709716901; x=1710321701; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEbhInZlM3kJtT7xjjkbZehB8ROzUjJZQUZRHEJT3Fw=;
        b=nmHc1bHtD4NLKpMpFkjHGboRSLhNJ40XWb0QowSwoVxZrKrPYRuXFBx86b5lZXVeVs
         T1LmVx7GakCvMfWiXtoPRUobIQ3lgw9AyU3u0WXUF8zomAkqfOMd5ei7aR9Wq5C0c1HJ
         7fl6HbMhia8EK7Z5HGVFDawS1pCMLAKX1mEvHqjwvxjvRg9yLXvMBEj0kyc2SsMSgmX0
         07BqoDkJbpJnkn7n6SMe+I0trL337ygLqyGXRPLcaj4W43m/mpcxKqCrUV6qPoH4ToeQ
         OXcCBgnI5vf53wYA6+WXZTDEpPa8ACGPZxbzxM2vUBfTL0e0SJvE5KsM5dCjQgk5uPGU
         usAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709716901; x=1710321701;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEbhInZlM3kJtT7xjjkbZehB8ROzUjJZQUZRHEJT3Fw=;
        b=ap+wDgopmicTCUUc+J06Oyq5kmiFtSnhnfyVIpuCjR/phIkii++D+gxCGnosQMaKTS
         AJmEYMf1iEvh54wvUpNDnb8Bn7np+5lqiWxBsGdg3YsI6UAy8COZdSx/2wZVXfZmq4eB
         5SQPBSpmI+CLZfLKHiIEtVg6ppltCjyrtGjPu7tT2HVpzuozbz9nm8s7L+aConqUfMz2
         dhTI52xWmxn4RBa+GbxfU9WVnZv01ddu7O9fI0Vwyomrw4UUCSYuoq6yKgq+V+zMXAef
         kc/hEugt8FVa4XfdKoMLOEuhmfPKrveXZpfWsSJi5ERSIHnoV9Bi/V0z2ZqBJy5d4TpL
         5p5g==
X-Forwarded-Encrypted: i=1; AJvYcCXpCcjU8absWZO4N7uQUSFI/b68w6Ac02EaiIOZbUqTSzRA+WdKeJ76U4R8kF792GLwLpPbfyqfOC/RpLXjO8b5Ae+jQmk+D4a7zNCplw==
X-Gm-Message-State: AOJu0YxZ+zM3gI+cuILbgDNgVJaZt3OSUTgpWXso5qYuOYZPVoR4vkw9
	Ndm6OZ8NegKQH8xOrerbSbrRmkOMes0zbc84phUzC2MbO4ckPp2o
X-Google-Smtp-Source: AGHT+IEFn3clUVe3HbSihlyMh7NH6uC2n7uWdal4zB80Ths400Ms6K94kq6wQTFqZ5PbecFVK2jH1g==
X-Received: by 2002:a05:600c:4448:b0:412:ee6a:8826 with SMTP id v8-20020a05600c444800b00412ee6a8826mr3596962wmn.12.1709716900620;
        Wed, 06 Mar 2024 01:21:40 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id v13-20020adfd04d000000b0033d202abf01sm16944420wrh.28.2024.03.06.01.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 01:21:40 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
Date: Wed, 06 Mar 2024 09:21:39 +0000
Message-ID: <m38r2v67h8.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mikhail,
Mikhail Lobanov <m.lobanov@rosalinux.ru> writes:

> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>

Are you sending a new version with the changes suggested in this thread?
or do you want me to prepare something with your reported-by tag?

Cheers,
    Rui

> ---
>  drivers/staging/greybus/light.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index 87d36948c610..929514350947 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
>  						GB_CHANNEL_MODE_TORCH);
>  
>  	/* For not flash we need to convert brightness to intensity */
> -	intensity = channel->intensity_uA.min +
> +
> +	if (channel) {
> +		intensity = channel->intensity_uA.min +
>  			(channel->intensity_uA.step * channel->led->brightness);
>  
> -	return __gb_lights_flash_intensity_set(channel, intensity);
> +		return __gb_lights_flash_intensity_set(channel, intensity);
> +	}
> +
> +	return 0;
>  }
>  #else
>  static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
> -- 
> 2.43.0
