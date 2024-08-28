Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554521AD3F6
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 21:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724879740; cv=none; b=LTUxYufz46L8anFam2sgoajutdR1SpQ66L6QoDTLBQmcpQax/rQT6Eq7Vx3u/JmZbDJIbz+N+TTLig3A6k8YsbXhCUROFBnOMcZiUSoWmZgib84k7wCmwEwQ2B/3eDMEljrgfGb8EwyFtHebjJ+qnpHu+ejCpHOrLcCQczrBKHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724879740; c=relaxed/simple;
	bh=kuGZ62y/XO4qJyz0UjKv1D4OELR9tiomQ7nZXgNFacg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A9jKvnFiQOIdrt4E2mwXTMcOMMkC4E2VoNrR1BxYU4fpe42M2PUYVaTqaa+woN1qdxnqH7jjd3GdUcq2GQrnb4zDUfs7hHPFXDes56MCLWvAVgXk44BBQqfmWMoVvl9WskbXYIdWdFyZ6DlIvO3EG/jvHqJpReILbvw/e6O1nh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+I2YUWd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+I2YUWd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5334879ba28so9354648e87.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 14:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724879736; x=1725484536; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MALVjPP/ugUbqVBVpipIvnCXRUymBUlW/hUrmGAJS4k=;
        b=b+I2YUWdAJsWTKGmqD1+jvugTixGNVbiW7w7B8pOIuHdulPHrXMULDrkcx0HJe5l5V
         tvUYeBXtUJhFT9Bx3EDJrZDssMt5lJQpwjzyxaFgH1u57aOcgKSvLL/+RLkENKlbbvqu
         6QdcUSUmd9vq5rNODThgwhJAiqOJX4mjYzj9pWlhXanU5UmNTRc6VdCVWVLDX7xtF8jC
         sdKS2EpgKZRZcfx7qjRXO84HvGeoYc+qsPYtSYp5moiu9O83++ghobSbPrdNhSwf7Pb1
         xAhnCQoNmADSaUo7GvUdBHiUKf+nA2NdGHKXYL0yb6+qdgWMtbJA5tHVE4FMSy0WQ7su
         6nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724879736; x=1725484536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MALVjPP/ugUbqVBVpipIvnCXRUymBUlW/hUrmGAJS4k=;
        b=N0giUDSt+39eK4u85NjkaSo0nSn3WD9IRopXYaJDC4dcxUrdMksmSI1hCaZIRFDWAT
         wAHaAv0SQu/a/HGi8C7Cwi56yLB30ILJj5hu/bCch5WFfgzbs+8MQAFtCf6nFUaqsexM
         r1zHY7fNJun/flLL+ZDb6vy0CZz60/HdtSL+lCO3rRMVhiYkVla4Bzv/4htyW14Gb8aF
         Qk5Z0u6Ejqfq1+zt0Mnx2Pp1Sa50V8NClzVgA3jI9RCkv8NHYsxs+TZ4Lt052UNwl+H7
         5eTKdDWhShiwVnlvpxRMyOtVP3/xx3cQdy+TGTH+P80rCzDAb16cZKtHRikMetHQfTSc
         51Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXCZ2+QD4kaU8bXqJm7+7S8l8n5Y0qVNiiU1ZCWGE1E58EM8F2l6R3xpsZ/66dfV0rczpVxJMp8FHHKuki5@lists.linux.dev
X-Gm-Message-State: AOJu0YxlluDXoYvOvkUkdts5yGnweU5XHyMYPNRb2SCxBpZSyGV04ojk
	lU7YLFbFajYsPUPRFOttntqgonyMjh76MHLnJEBlOfVig/6ahwqdzxCJQV1q
X-Google-Smtp-Source: AGHT+IHgi5Ryv8QHYtcvnpQhVFcLZaacH4p1EV3D1dfwmb2DiXZle4AD8ZfNOR440JzQ5Er/Hrvcww==
X-Received: by 2002:a05:6512:3c92:b0:533:3268:b959 with SMTP id 2adb3069b0e04-5353e5be1cfmr292882e87.53.1724879735962;
        Wed, 28 Aug 2024 14:15:35 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3? (p200300c78f2a85534dd47649c4c2f4e3.dip0.t-ipconnect.de. [2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a88c6d2c844sm72477066b.178.2024.08.28.14.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 14:15:35 -0700 (PDT)
Message-ID: <bbd42daa-319e-4390-99ac-7bf874fd0007@gmail.com>
Date: Wed, 28 Aug 2024 23:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] staging: rtl8712: Calculate size from pointer
To: Manisha Singh <masingh.linux@gmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828204552.26790-2-masingh.linux@gmail.com>
 <20240828204552.26790-4-masingh.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240828204552.26790-4-masingh.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 22:45, Manisha Singh wrote:
> Calculate the size from the pointer instead of struct
> 
Hi Manisha,

the first line of the description is good. Please just add the why (to 
adhere to kernel coding style?) and the "." to make it a full sentence.

Omit the next two lines.
> CHECK: Prefer kmalloc(sizeof(*pintf_hdl->pintfpriv)...) over
> kmalloc(sizeof(struct intf_priv)...)
> 

Thanks for your support.

Bye Philipp

> Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_io.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
> index 6311ac15c581..8ad4647dad2f 100644
> --- a/drivers/staging/rtl8712/rtl871x_io.c
> +++ b/drivers/staging/rtl8712/rtl871x_io.c
> @@ -48,7 +48,7 @@ static uint _init_intf_hdl(struct _adapter *padapter,
>   	set_intf_funs = &(r8712_usb_set_intf_funs);
>   	set_intf_ops = &r8712_usb_set_intf_ops;
>   	init_intf_priv = &r8712_usb_init_intf_priv;
> -	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
> +	pintf_priv = kmalloc(sizeof(*pintf_priv), GFP_ATOMIC);
>   	if (!pintf_priv)
>   		goto _init_intf_hdl_fail;
>   	pintf_hdl->pintfpriv = pintf_priv;

