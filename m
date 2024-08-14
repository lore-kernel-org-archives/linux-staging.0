Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C181B4C44
	for <linux-staging@lists.linux.dev>; Wed, 14 Aug 2024 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723648434; cv=none; b=K3gg/9RAVh+jYeAEdyUUOKCjEql0S4Xe32twnPQcg0gWT83vxTWwT81pWJTrluOTMmyUH8Xt02+ElH1Z7+TSttmNCa80qT9LzDLqzENRaPBgdC6CGCwG8qSye0Jo93F55bJcIoEvYdlrKuvZWcxMUi/W1ZzmWRbKSeP5l/OxhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723648434; c=relaxed/simple;
	bh=oJsWFT+Jb5nHR9LlAIUcdeqHgVdMBklDQEMR8aFS2DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TN/M9M5JyblLHxoyTefhTaFFW0lHQU7JtU+lW74Bm2Lm9Z/zVSfHfafQHjaBgdvd8uHukEM2f1XE3HoQCU5EB2JF5+5+OC+peiluj2N4rzW0XZhSNkvNU8U6oLYrJWg2rsLqjYm9ap9V4rFKKpXfbOb18q+vskK8t2MvPtTO8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iHafCQw4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iHafCQw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723648431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yKgzA14Y5NvcmEPfocb3E6ZcDIz/4u0/C8U8OAxVOdw=;
	b=iHafCQw4VKHaoZC/G1JJ057LvXPjf4fPrvKlL/bHS11akqbVi9JHMu6GoXHgq+55c+JDmD
	NTEo4m7KO7fxjkn7XcFODF4PI09VAUDmq1PLCXvFQN5Emu//2X6zddijFbTNond4prl4fN
	QkPoZIUdQs1rinzmK8Bk/EAPl60D5kQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-kZyf-pruPMmRRjfEiTYaZQ-1; Wed, 14 Aug 2024 11:13:50 -0400
X-MC-Unique: kZyf-pruPMmRRjfEiTYaZQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7abaf0aecdso445319366b.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Aug 2024 08:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723648428; x=1724253228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKgzA14Y5NvcmEPfocb3E6ZcDIz/4u0/C8U8OAxVOdw=;
        b=dKp6Ok+qiuFmvPKGX2jfQDIkOOgXQz1LlJlE1guUN2XJV+9D7+36WMWUajR/YwfbKg
         kqnkaiagpSOaUKCkUnxW6TzmldpPwYZjORPNR+mLFeRLRlEbPIzMS/SNiMk7VMuv68hu
         Fc99rpC0qr5i+iVWtlYhxEyBM0VpAQ0djIjaZRfh8+wb0PvVzYOXdKIx2TWKVZVjr5CB
         3pPqRSvMaIwsHxWCKYqNkxU3Ae8RnvR3pX7/BlbL+WdaJNtzuK7mGuMrKkOF3Afy6sCf
         2iYw6bfoN01l5A6pEL4ssHrMlAUXbu0bP+0vCUmtMl9Z9QHGt54VLSBgmR0zitmoh0TU
         tLkA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Ls7F5eK+IGeJ00+MNWfIBnnHX/IHwWycDhrzE7GPgFlFzaDudm8yztUmInV8/MkzwQUM4AVaF9P8Cjv4LkXEq0AopIFrIL6uWcXuxA==
X-Gm-Message-State: AOJu0YwvT3CJ/ua6gJ3LGLPM8szEaLW9/QW2uDmKc/yfxNnrTfzR2oTv
	mqKhYtwP/xAxYcA259/QJqF7rKKrEjzqAtozgrFg2w5fBgxPebj2PBwMrGsLQtQzf1oEOeNKw0v
	EN6s0jwcjdidUM230VS3GRFLe6dPI5OjGd1BjQouXkjUgay96+ZAOdntL0Z88qkQwzqBlqwM=
X-Received: by 2002:a17:907:efc3:b0:a72:af8e:15af with SMTP id a640c23a62f3a-a83670263admr208017166b.49.1723648428487;
        Wed, 14 Aug 2024 08:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7LPvDvuik+r2pNMfqU8pqHImI4Zew/pfxYsF+NKzWNK3YdxnTiStZPosqyJ0HUfyy1qz5uQ==
X-Received: by 2002:a17:907:efc3:b0:a72:af8e:15af with SMTP id a640c23a62f3a-a83670263admr208015366b.49.1723648427975;
        Wed, 14 Aug 2024 08:13:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fa8f64sm183298166b.69.2024.08.14.08.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 08:13:47 -0700 (PDT)
Message-ID: <b3eca851-5a13-40d5-8a9d-87de6862b63b@redhat.com>
Date: Wed, 14 Aug 2024 17:13:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: drop unnessary dep on CFG80211_WEXT
To: Peter Robinson <pbrobinson@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
References: <20240814145250.943457-1-pbrobinson@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240814145250.943457-1-pbrobinson@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/14/24 4:52 PM, Peter Robinson wrote:
> In commit 174ac41a7aaf ("staging: rtl8723bs: remove obsolete wext
> support") a dep on CFG80211_WEXT was added to allow wext userspace
> calls to be managed via the compatibility support. This is an
> optional dependency which the driver has no dependency on and
> stops users/distros etc from dropping CFG80211_WEXT if they want
> to enable this driver. Drop this dependency as if users want this
> legacy feature they will be explicitly enabling it themselves.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
> index f23e29b679fb..8d48c61961a6 100644
> --- a/drivers/staging/rtl8723bs/Kconfig
> +++ b/drivers/staging/rtl8723bs/Kconfig
> @@ -3,7 +3,6 @@ config RTL8723BS
>  	tristate "Realtek RTL8723BS SDIO Wireless LAN NIC driver"
>  	depends on WLAN && MMC && CFG80211
>  	depends on m
> -	select CFG80211_WEXT
>  	select CRYPTO
>  	select CRYPTO_LIB_ARC4
>  	help

