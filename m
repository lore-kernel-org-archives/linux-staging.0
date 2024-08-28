Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2F1AC429
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 21:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724879316; cv=none; b=SOR7S4jNw4dSD1bvZ8oENUD2LDrU4dON9LL3zrSsmciRrtKHexO/d5cUVDx4mkBhzTEdKGhS5145PhIDc6O9KPSibIh/nMD1zeMk6WMQxux1PhvRsfFStVKizsmBbqjc2P6ugtFlMl7dhTwuSjqzv7B5t+62t9ITEqIkGK8vQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724879316; c=relaxed/simple;
	bh=nyQDeyPCakPfDxs3QZfV0MKbQPUQvviML6Tf8qSHgEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u7obCw5KoKnJbF2DSPPjEk7UK0DrU1BUtQGF2lSJProQoqby2ENAbdeQA80T8RLCAjRxpBV2HZh1aZve7P8IyfpUOyx2+0Nwc1gF6nhUWtt9zN7gL03hNEKxs0qHOpsta0AV8T34LPf91CfEm9NGy/2sWHPdPABNM7AYk4F7fqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu+QNKLE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu+QNKLE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so7838689a12.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 14:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724879313; x=1725484113; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85ekZJurD6OEgw1xa6pHWxSzfh0Sji0JmBiAGp/YvEw=;
        b=Cu+QNKLEpWproeTKpY+GGPwh8Eg9DZsYmtMQRUjghY1HYcxX80zfxjBLU/cRmzat4e
         S/8xowkb31CvSfUYK/yvQJGo56jE7cFXiRYRg7qsW1uymuu7xJ72x7KuJsk2XqxboRiR
         wbvLcin1rtJrnyHlgs/VLT9CaUErl3qmJ1jpCza5El0tpU2zjd5S93Do9EwDDR56zWga
         2EVL1Hs9LbPf6TBxrIkP4huup17nulfkvEURfZIp/yrH5LesnmctJOVXRWiKlIReklBF
         JEyH5eszdyJvUZo97MOlyahACjvp4DKK1JnYEqwi/mr/0IQn/hJwTPLFafcuE12i4/G4
         mdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724879313; x=1725484113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85ekZJurD6OEgw1xa6pHWxSzfh0Sji0JmBiAGp/YvEw=;
        b=EabRsDWEICzTuv0eyGnL8L/nPTdLs6LIsFyGvsiBO6Q1urjPp1wIBxx5bAef+6bosd
         R7+qhE6QY+u6HlWgXacrLXeM5cl4qQvE9ibEHpysG1sa1gVRctWc66a8J4ieywEtVfnQ
         yQqp5zbR4Xb7lXELjpU6eru7PMO5R1TdogfTJLccp/0Vq/jtGIlC+WMg2UsOD/FlorHM
         mC4CbuVsyqZrvaozV2egA+9Ckl6mj7kySc1iIiG03AC1dXMO06YqlKwWWOY4o9uPDHj6
         swf/477xgl7obfX20ImXDoietDi2EKEc2ZU4k6FpEbYL23VnojmnfIK//a63GsycXMpq
         rqxg==
X-Forwarded-Encrypted: i=1; AJvYcCUs/udY997IVwaEz6wKrpmrzvSip3/3o8O1Y9/GjxQwxM9YIjN4aUag1e+f/PTle32wBvfprZ4gE2RriHjD@lists.linux.dev
X-Gm-Message-State: AOJu0YxtjzdvQQZOBQSA5J0+kIWM3dGA6jsdHYXn1lxgEbS6ryzXU+bD
	Znk4ZAIfl2TyKULVq1sEGoi1L8fDrPhvI18q60hS2vWQfGIQXO1P
X-Google-Smtp-Source: AGHT+IFkD3NcDNubXB2Qyq87I7ne/KXmFfllXqgKHMQLbw+T3un6drUQPz2aYiReX2eHE9HsWIvi2w==
X-Received: by 2002:a17:907:6d2a:b0:a86:a046:38a8 with SMTP id a640c23a62f3a-a897f83ae6bmr50393966b.26.1724879313074;
        Wed, 28 Aug 2024 14:08:33 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3? (p200300c78f2a85534dd47649c4c2f4e3.dip0.t-ipconnect.de. [2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5485ea7sm288504266b.16.2024.08.28.14.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 14:08:32 -0700 (PDT)
Message-ID: <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>
Date: Wed, 28 Aug 2024 23:08:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
To: Manisha Singh <masingh.linux@gmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828204552.26790-2-masingh.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240828204552.26790-2-masingh.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 22:45, Manisha Singh wrote:
> Remove multiple assignments from a line
> 
> CHECK: multiple assignments should be avoided
> +	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
> 

Hi Manisha,
please remove the 4 upper lines of the description. They are not required.
> Refactor the _init_intf_hdl() function to avoid multiple
> assignments in a single statement. This change improves code readability
> and adheres to kernel coding style guidelines.
> 
> Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
> ---
> Changes Since V1:
> 	Broke the patch into 2 different fixes
> 
>   drivers/staging/rtl8712/rtl871x_io.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
> index 6789a4c98564..6311ac15c581 100644
> --- a/drivers/staging/rtl8712/rtl871x_io.c
> +++ b/drivers/staging/rtl8712/rtl871x_io.c
> @@ -48,10 +48,10 @@ static uint _init_intf_hdl(struct _adapter *padapter,
>   	set_intf_funs = &(r8712_usb_set_intf_funs);
>   	set_intf_ops = &r8712_usb_set_intf_ops;
>   	init_intf_priv = &r8712_usb_init_intf_priv;
> -	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
> -						    GFP_ATOMIC);
> +	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
>   	if (!pintf_priv)
>   		goto _init_intf_hdl_fail;

By pushing the below statement after the "if (!pintf_priv)" you change 
the logic. Is this really wanted? Why do you think it is better? I would 
avoid this and it would be a separate patch anyhow.

> +	pintf_hdl->pintfpriv = pintf_priv;

Thanks for your support.

Bye Philipp

>   	pintf_hdl->adapter = (u8 *)padapter;
>   	set_intf_option(&pintf_hdl->intf_option);
>   	set_intf_funs(pintf_hdl);

