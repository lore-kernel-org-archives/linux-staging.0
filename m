Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47BA145FE0
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735245668; cv=none; b=NxNMcOJRo/2xRibT6TEbSUuqDY7XjhUEMn/7qvcLAZjd+Va6TusHKzB3j9KIb3DSRoBORrrEzJr/gY6t+amgsmG6Zx3zvlhcCFBHQYx0441xcYo2aXGbPvyxAqHZvJeh3mI+Do2iT9+UunitjoiaSeEIDl8OwRFGrI3+cc6jerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735245668; c=relaxed/simple;
	bh=YWM9hImBspZxObeMlc1v1ICz6P+yK7Hz5MAkxbgl8AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvO3Kbp8hzmyPOZX16hu6H61KuS4fTTBPvP8vjv9J4wNbRDHTDTuuYQ3yyKkQj2BvifJEMqZevj7Cfm0flvW88sRlFtntUCJl7dIO7WU8+8EBuJbqO72igHmR5XUobjKaLLOZbeTkPJ+Q1G+0jafFeLK1da5G2OVRBkK+IcCZcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tbd9xjes; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tbd9xjes"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844e06e5d11so222028939f.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 12:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735245664; x=1735850464; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngJLfzgvuFBxoSa8PD/QvZ8TQx2sJu8ptd75fIsizNE=;
        b=Tbd9xjestku2wwYMRaYAFFwm1J5SLCYzR3zCtSzmgljrtscxVQ3kKErN8Pn5CDnYRS
         vwnV4FbBiMGhVPoEeVdqMtOy4yNolNuw9dY+j+CYIRtFyAFKMKDfMye9BYkVLxDnzq+a
         5OCk4U73jtSfX2zdupW+61WTHKO29y5kt5ZPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735245664; x=1735850464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngJLfzgvuFBxoSa8PD/QvZ8TQx2sJu8ptd75fIsizNE=;
        b=XkNEycbYCPTKh51S8B3vQIh4nh/za2z5vcIPugKAYHk7sUUbpJs9dBnTE+GHIVd4EH
         trVV6KlVg+LCC03WUswpmXBBTUaKhR3ZDretDxZYUfBRndhRWVytbGcORWvaFwvJpt8J
         qNX2squ8+ldrEgUrSyPUb9LxWNZrsw3ynyQQfWZ710zOzTrerwkEe0DvUvXK8j5tNWbN
         Fq9ZH6324d4sWcMEb70dKIdsOhNIjWgxLkEm7F73h3kuBWYa4zRyoGsR5L56iw4XDSO8
         insOZhlBKMFYDlTYjkYxDC42rgHkuHWTufSV1bpLGoenooRbnUqLP0CG9JDQoz5GIfVE
         kNnw==
X-Forwarded-Encrypted: i=1; AJvYcCVyfrOX/roihMuTNxOcArPBomXLNKbKOuD4wVbkmrw9XFH2MLZHp30y25MpKZ5GAPSFI/ST2klUx7hsk0G+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs8TfcCZ6TwseP9AZUpKX0Rl5ahh4uN8kYKntJ2DuUqWT0RlXI
	V0z1VwffY+uiNzNqinNr8NSD8ACgEwOyNTOxOwqDjzdE4t1OGAVycJw6GVzkMAY=
X-Gm-Gg: ASbGnctQOAi/kS4rVJV9u+i85LEV7+BVEczlmf1zWNPEvMCmeBhwZLgqRwSEwm4Pgr0
	Y9Gsh68KhVujIqtGkt7SDJMxW591rS0TfY22Y2MeaWZEJX6NVN7qejEEUMVWcR2orV6TttpJVDF
	gDuTpWIZkcxEFRVHmIlC51baRb3SziVMSFazqLehtArWj1o+o6+bn5dvi1lb16C16IbPl4pzw4t
	YjeC1ao+6BoFmPFG1x+zLQjfS+6w8rRsanYDLOI/RYX/xgzbIXOSGM/XAh480kOl9c9
X-Google-Smtp-Source: AGHT+IE3Sw3vW+2qqpwkx+5iYRVvo4IKg0lRhab19zjm5MMQtpgQoEkXHxvzxjWowbHwRaOy5wFK0Q==
X-Received: by 2002:a05:6602:60c3:b0:83a:639b:bc44 with SMTP id ca18e2360f4ac-8499e4ee011mr2160847639f.3.1735245663868;
        Thu, 26 Dec 2024 12:41:03 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d7c82e8sm374547539f.4.2024.12.26.12.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 12:41:03 -0800 (PST)
Message-ID: <e659e77d-9c09-436a-b5a2-bf9fe28f644c@linuxfoundation.org>
Date: Thu, 26 Dec 2024 13:41:02 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] staging: gpib: Modify gpib_register_driver() to
 return error if it fails
To: Nihar Chaithanya <niharchaithanya@gmail.com>, dpenkler@gmail.com,
 gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
 <20241226193637.241049-2-niharchaithanya@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241226193637.241049-2-niharchaithanya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/24 12:36, Nihar Chaithanya wrote:
> The function gpib_register_driver() can fail if kmalloc() fails,
> but it doesn't return any error if that happens.
> 
> Modify the function to return error i.e int. Return the appropriate
> error code if it fails.
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>   drivers/staging/gpib/common/gpib_os.c | 7 ++++---
>   drivers/staging/gpib/include/gpibP.h  | 2 +-
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
> index 405237d8cb47..07795df3b721 100644
> --- a/drivers/staging/gpib/common/gpib_os.c
> +++ b/drivers/staging/gpib/common/gpib_os.c
> @@ -2094,18 +2094,19 @@ void init_gpib_descriptor(gpib_descriptor_t *desc)
>   	atomic_set(&desc->io_in_progress, 0);
>   }
>   
> -void gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
> +int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
>   {
>   	struct gpib_interface_list_struct *entry;
>   
>   	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
>   	if (!entry)
> -		return;
> +		return -ENOMEM;
>   
>   	entry->interface = interface;
>   	entry->module = provider_module;
>   	list_add(&entry->list, &registered_drivers);
> -	pr_info("gpib: registered %s interface\n", interface->name);

Did you mean to delete this message? - looks like an useful message.
Could you make this dev_info() instead?

> +
> +	return 0;
>   }
>   EXPORT_SYMBOL(gpib_register_driver);
>   
> diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
> index 5fc42b645ab7..d0cd42c1a0ad 100644
> --- a/drivers/staging/gpib/include/gpibP.h
> +++ b/drivers/staging/gpib/include/gpibP.h
> @@ -17,7 +17,7 @@
>   #include <linux/fs.h>
>   #include <linux/interrupt.h>
>   
> -void gpib_register_driver(gpib_interface_t *interface, struct module *mod);
> +int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
>   void gpib_unregister_driver(gpib_interface_t *interface);
>   struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
>   				    unsigned int device_id, struct pci_dev *from);

thanks,
-- Shuah
