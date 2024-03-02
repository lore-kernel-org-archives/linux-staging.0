Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37784182CA
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709392699; cv=none; b=fO1j0l2LAEprchVORQpwu4nyIDsdmveKAcN+5HEUgJ8deeTCC9vGC00hoEFBcvtlH86Keb9VvZ5Xd5MDFACX9Ggh/lKI0RQTxu9EjMdYj414sD1sOTElWmhBTvbvG7WJZ6oxDYhHR0+GjTxOyljd/U8tv8NVzfMN06t0mCtMJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709392699; c=relaxed/simple;
	bh=iXFz7A/Is1Avr+n6fjouD8BGhLiy6XGPUswE1I3G+6A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PSSReyF3mil1NAeSNRRTW7xaoVkM4mhe7B8CdElCO+67W/tSkq/t5CpTJ+Q0D9CHeTiVpt2h03xFUlI6BpLACQG09veoqcvVgrcBM/Culjpunk+m8j1713PyYmtcCqrtrBEh74u5Zai5DkiBS7JWe7VmPa8pSg9EM2ISE0u39I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkUHg5n0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkUHg5n0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e12916565so1550025f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 07:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709392695; x=1709997495; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3tsMku+8+1/N/PLDjGS+jqwA4yTKYJa9xvpuCgVhy4=;
        b=VkUHg5n0EiU4na5x3T7QKNUoc4OOmX4+LJpGTFjx2uXDnaNQkprv8+mMw3qintMl3b
         eHG9LxqoD1VHbiirJEY8OwcAbvX6+4uhhAlM4Dffl6itu+UAHdvlb94smcIp5ViHtKsQ
         BmZ+XYbyeYureySOMbNJAuGUOhQUDXnxelW7pwMnqdwiBJRzWqfzL9OBYPUAYcesXTfb
         /0DMgle/eLmMxQpdsp82mEvmXjvA3qokJ9q6hckChoZnovK9Uvk/vbm7WUOT1d5nJG2y
         dEWhk9XRsKDUAdhHbWhqGVpAxlMP2ZtWDnSMHleCRARBstoLtdyFHgfGNIfygZxrRI+q
         3I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709392695; x=1709997495;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3tsMku+8+1/N/PLDjGS+jqwA4yTKYJa9xvpuCgVhy4=;
        b=alKjjkbt7ZRk6LCk8rSF2R68toPanj1FupRUl1nbK+PtuemSkdOIKLwmInF2uUbLFD
         FoF1/w5sK+34UgCXvUnBOujpbKyBZjTOsPz0p0Lesdz8sEO4xmJRPZWmS8qByVMdgr0M
         40LRKbAacXKCZwv+rbYvqKyzxRPkkyPqUxhi963V3zTb9Jui9zX11/DpzUObtvLbdAam
         0G+MX5WzDpoXv72XIdA8HHlj+OwmpKs2K0YOsioCtW0oKd5lkq3Di6VZ5jhuVLDUEVAb
         rTyl09En27qR8yLc9h6d1CJsR/tAYeN+yF7mgplPOltZQYpj9UfH7xaCM7JKN7UiVr/L
         oWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuETZKA93tGNhAZQ+wNGlh1JiO1TtKMiUOIH35TUzuSEepedA79ChrTkd7thK9ujmvXUGlh7f0G+1MhrsjqctkPTGEILzRmHghJQns+A==
X-Gm-Message-State: AOJu0YzYRBEBFHt5hcEUYiBYBMr2dmpmPJBUwJQ0ENo+S8nMbq7asGcz
	de9tb3JP7/XWtSCFIU8JszIWWu/GPRFnyM0loUygffndXoFRrlKL
X-Google-Smtp-Source: AGHT+IHMGqcaebuU5XjaJPHEn0KuC12L6kxnnC++HraoFBZmu+7GOQj+YVKjoRWrraAtMf/akjrVOw==
X-Received: by 2002:adf:ca8a:0:b0:33e:1505:9463 with SMTP id r10-20020adfca8a000000b0033e15059463mr5508436wrh.13.1709392695236;
        Sat, 02 Mar 2024 07:18:15 -0800 (PST)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id p18-20020adf9d92000000b0033e18f5714esm5454212wre.59.2024.03.02.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 07:18:14 -0800 (PST)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Fix deref of NULL in
 __gb_lights_flash_brightness_set
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
Date: Sat, 02 Mar 2024 15:18:13 +0000
Message-ID: <m31q8smzm2.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mikhail,
Thanks for your patch.

Mikhail Lobanov <m.lobanov@rosalinux.ru> writes:

> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>

Yeah, at the time when this was implemented I recall that we could only
set the brightness of the torch mode in a flash led, not in the flash
only mode. So, if we were getting here was that for sure we had a torch
channel and get_channel_from_mode will always find a channel, so never
returning null here.

but yeah, this is safer. but maybe just do something like the bellow
would be simpler:
modified   drivers/staging/greybus/light.c
@@ -147,6 +147,9 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
 		channel = get_channel_from_mode(channel->light,
 						GB_CHANNEL_MODE_TORCH);
 
+	if (!channel)
+		return -EINVAL;
+
 	/* For not flash we need to convert brightness to intensity */
 	intensity = channel->intensity_uA.min +
 			(channel->intensity_uA.step * channel->led->brightness);

what do you think?

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
