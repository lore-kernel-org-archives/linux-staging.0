Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A6318A6D5
	for <linux-staging@lists.linux.dev>; Mon, 24 Feb 2025 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387223; cv=none; b=LXKAaiIeTRmIohm1emoECkNVkKxsfOZ/mcXOzWheeQbQGcl7LFdNrUKM75dt0rkNxJMWnXxCxv70/GeE4sL4nxkeTQ2J5YhPo5loY9oe2dr/3zHINPQLx/I2zu9sZq5OSn7ZhVtK3VdrgKkFxHokuHjjedmEsRe1krZqeeLLbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387223; c=relaxed/simple;
	bh=B4rW0LmFwuWgrhKJdc74RygXbfuQEX7ztHygHDec2X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbgSMKnrK2ZiVMh9gEXVMbY4z7LGPtylZdVjwRS48fR+jQ+U8VmbFw/Ss0uj0AziIa8gMfEHKTPE+/dwkLiKLozWrqiuWXIk+qk7H1yu6smIyo6RNW/XofEBZFXUjg519tKfJikZ3uT3RyDqM9LYB+QyZbTZpFFHhKKeXnk+3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUoiL7aF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUoiL7aF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740387221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=orFTzaaO5QTd6KFFusMvxg8e2uUesycrLGa/PjbseoU=;
	b=NUoiL7aFjcziz3o/d7VBp3TxWMMNu0N5jcEskyHORCcuNUdnhhaFd3ekjZNTXYSL+LZ/HZ
	FmjzKQKkGeBtDfMXY7qqsfjOM3AGpCN7cIK0Hdx/DwyqBYbKxVR5pUGg9MoboLADLT4M2G
	VEKV8UD9n19ZG4Zdr4b7ACj9LeUsKLc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-S95FpxDCNLm1wvEsaFRtGA-1; Mon, 24 Feb 2025 03:53:39 -0500
X-MC-Unique: S95FpxDCNLm1wvEsaFRtGA-1
X-Mimecast-MFC-AGG-ID: S95FpxDCNLm1wvEsaFRtGA_1740387218
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-abba896add9so232260266b.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Feb 2025 00:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387217; x=1740992017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orFTzaaO5QTd6KFFusMvxg8e2uUesycrLGa/PjbseoU=;
        b=gTG1AePIYx162T7vjIDGE3v6tdi9hE0x7Sqhp/WmdBcbk3+Dd3BPxdq0jVjn0+zwx4
         YTyDs1uqtkS0bUwmWGNzW1dUxy5cxdwJDZ8r3OOYMrOVJRkh+nQud9nlFT0ErBL+ecqC
         YtXuEzeH3zLDWg5zLVhluMWqgm5Lbtb/17cd9xkA7DAVSEzX1DKUsr98jMoQ5TQ7bda0
         y0kUPtV7a33Qe8cSPvloeo7jsDe7sXKsKMAHqHSYSFkKljG6MHHz2GzQ3kYT5hNBzI71
         vLmCjQlnKwgTP0QXUp84lMQViJ0bWQPThm5sALoLUmpocWmjHL9kB662WXfrZ9UmpFrj
         sKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnkZaWXuhP2F8zgQrRu+TmxlwAS3cdZeatFUGR0UOgPjh0YKvEPxdOAvqMeX0A8SPtCnqNg7XTOMz+7BdK@lists.linux.dev
X-Gm-Message-State: AOJu0YzvXTR3rYcuisKm0RBL86MARnrUEVzQ25PbHbsR/+gywe4p5+DJ
	/ZrWT0M5TKJn2Fr67EoPnThShvg+vxtyVKTiRm3Cv6lywVtwKy5gXjeoRqmaA2nYx0Vjm9y0ahL
	0A+KbZk9pSF0Y5wdoGY29hLxCCvpDfU3Ev2jx5DvB1mZpQatG35fkK3AhqOFwx1byzbfugWI=
X-Gm-Gg: ASbGncvXYWhFx8nHLywAhqDeJQU2KlfQs9VL0TVAOPhMIVXGxRt+7IXozTKdsf6MtYH
	dyOx8RiX+J7QbQA0LfNizFZMiFvY3KyDffD78UPVoaEb+biG06dIvbhhbyKRE+AvpDL4dfL6zbs
	aluMXCksgIVJQP6RCau7jGyOvnA5e7dj4D2AYVCHr2w9xcqEpmy78fYtMKGVDcOm/4NYEwJoA0f
	2bRK/kxxdhSPzz20g5CzhPrPyvfFMn7Aa/tI6DKh9DpK7H51gL2486rh0ryc0hmypme/v+pkQEq
	olKinSi4J9F8O+y8KIasMX+7nvnvlSSAzUSZ+BTUcbbAoYgWpF6mgU7gE4vximSC6/EpyQ/xZs7
	nW/KJUBM0XftVpgHfVqirAINv8IXel+Mu7Qbt5caWS3JUaBq57i7zgCvO5nQoJFVFyA==
X-Received: by 2002:a17:907:7296:b0:abb:eaf5:2121 with SMTP id a640c23a62f3a-abc09c1a0f8mr1295282466b.40.1740387217348;
        Mon, 24 Feb 2025 00:53:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh2r4tYTvO+Dz6YnMnrVD9mue97RhYFkOOKaPOtyAmd11YBgRQpHNLCYitN+B/kdYu5u46gg==
X-Received: by 2002:a17:907:7296:b0:abb:eaf5:2121 with SMTP id a640c23a62f3a-abc09c1a0f8mr1295279766b.40.1740387216954;
        Mon, 24 Feb 2025 00:53:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbd6b57314sm1074242466b.93.2025.02.24.00.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 00:53:36 -0800 (PST)
Message-ID: <494bfb9c-0000-44fb-b33a-e42422488c95@redhat.com>
Date: Mon, 24 Feb 2025 09:53:36 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: select CONFIG_CRYPTO_LIB_AES
To: Yeking@Red54.com, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Robinson <pbrobinson@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-staging@lists.linux.dev
References: <tencent_0BDDF3A721708D16A2E7C3DAFF0FEC79A105@qq.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <tencent_0BDDF3A721708D16A2E7C3DAFF0FEC79A105@qq.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ommN3M2jBYUnG3m7qh6WEZHxJtVhKFnv67Lm35wLcmI_1740387218
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 22-Feb-25 8:36 PM, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> 
> This fixes the following issue:
> ERROR: modpost: "aes_expandkey" [drivers/staging/rtl8723bs/r8723bs.ko]
> undefined!
> ERROR: modpost: "aes_encrypt" [drivers/staging/rtl8723bs/r8723bs.ko]
> undefined!
> 
> Fixes: 7d40753d8820 ("staging: rtl8723bs: use in-kernel aes encryption in OMAC1 routines")
> Fixes: 3d3a170f6d80 ("staging: rtl8723bs: use in-kernel aes encryption")
> Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
> index 8d48c61961a6..353e6ee2c145 100644
> --- a/drivers/staging/rtl8723bs/Kconfig
> +++ b/drivers/staging/rtl8723bs/Kconfig
> @@ -4,6 +4,7 @@ config RTL8723BS
>  	depends on WLAN && MMC && CFG80211
>  	depends on m
>  	select CRYPTO
> +	select CRYPTO_LIB_AES
>  	select CRYPTO_LIB_ARC4
>  	help
>  	This option enables support for RTL8723BS SDIO drivers, such as

