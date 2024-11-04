Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B37C0BE
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721881; cv=none; b=LuYQVfKIrC/OiPLbEPUCbjvrRpvh/IakuLZlX8en8nL+cnypE0AbXSHVavJEa8xVgl19M9tcBdLIVuAUOrrG1SRcmxAceEDloewyimwmenc6yDCp8El4qtKHqP8h7zwJLqHor5C5+E9eGaf7xfUHux5YUL+X9F5VEJAqjmw27j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721881; c=relaxed/simple;
	bh=bKsxPbLJOjhXS5dwvRb7gDQwbg3TLOfgDt0fz6KwnIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Smu9DjfAjlj+0wuzC+j9aFpaHGIyJfDXEqIQL09K+QAJTujztBMZuO69KV9v5ZrvljRx1WLmFkN+fK3p74b/QkpODaC4d+bqHKPaoYMluytd/v2V+yM9E3Rr1w62YZ+rqZe12pcPawhzwNRgJdYf5aNKAeSQ6ilXBQk2XqSstEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmQkt9HR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmQkt9HR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730721878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRhG8emybav1jveE3I6lnpbMlJJQ1NkRHJ/vqZ/lKwM=;
	b=SmQkt9HRWRmAberA/0yCSY2iTfJvjyAeJhjcC3VAuBgsb0IcKEj8gHpdwTJJDXIfSWlyLj
	L8N9297LKrDIqw8Txt507TKqc1k3QifeMWDGznNOEWKH3Ib+g7Xv+jAUz2jVsCVAEkHmGP
	GZ0ApdhrBWY6WyYT6r5wk9Vvnl4977U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-wCbAuhTDMSCQ2djiUFVARg-1; Mon, 04 Nov 2024 07:04:36 -0500
X-MC-Unique: wCbAuhTDMSCQ2djiUFVARg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99efe7369dso365755166b.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 04:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721876; x=1731326676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRhG8emybav1jveE3I6lnpbMlJJQ1NkRHJ/vqZ/lKwM=;
        b=HZ2A8lUJoyb1kjzTwjxXBQ7jK/t7SGJw0wXZ5xv+bdme+togxoKOnDqEnJxclpu/V6
         F022KDtlW/7ojUvPXSmkybK3FJk/dozEnjp2uVeTQfXzA8UxrhlhGccCQYfp5AzCBPk1
         XHx1+axdYqRbDv8fLYxRGbbmd5573w57pARRGA0InWaJSKu74PQcVBP3XnjngM0RDb90
         Fq2u6UoZgdJaPJLj/sputAL2yzmaMcnfpMgHqP5J9099N4BVKoki1TvxZzdopYN8Kslt
         85RYRwsC+436iAu/3u03HvmKi1Lo5U8wA/QXR9H+Q1p8GNV0ery3GALTD8OBm8gBmA+J
         fotA==
X-Forwarded-Encrypted: i=1; AJvYcCWVyJrXeN6GGI+b7RvJ4aNU1W3p5L1Q1IIEMc/5Kft+8LR2+K3WqI8cA0qjJF5QGY5PhXhHsts4nisWXJ9a@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8xvd0loN2pecvX4oxI+GZI04rjxCGFwVbfeZdw7agAdYgBX+E
	Iup8iB8ibRxUyGeAI8vgHOxnxKOJIoLlZigGpuei2vhWo4Zgz/Uq885ttSqIRdMMttPB0LT7dNf
	C2ErDIo5X2iFGmGb7lDJ/BH7s5WpTXmdg/caEjiP6VD9Z1Vh4vcUFe6JhlPAdnQI=
X-Received: by 2002:aa7:d490:0:b0:5c5:c2a7:d535 with SMTP id 4fb4d7f45d1cf-5ceabf49e20mr12028243a12.16.1730721875620;
        Mon, 04 Nov 2024 04:04:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm/rpK0+UAygyYv+wvXZBfqWjdissJMQdbMV9lkyNEypi5FgacHmiCaOjPUnh7ECYxzDnZTA==
X-Received: by 2002:aa7:d490:0:b0:5c5:c2a7:d535 with SMTP id 4fb4d7f45d1cf-5ceabf49e20mr12028221a12.16.1730721875230;
        Mon, 04 Nov 2024 04:04:35 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac77051csm4161402a12.32.2024.11.04.04.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 04:04:34 -0800 (PST)
Message-ID: <24dadaaf-54ec-4f3a-9c6a-9aea755d0150@redhat.com>
Date: Mon, 4 Nov 2024 13:04:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: atomisp: Add check for rgby_data memory
 allocation failure
To: Li Huafei <lihuafei1@huawei.com>, mchehab@kernel.org, alan@linux.intel.com
Cc: andy@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241104145051.3088231-1-lihuafei1@huawei.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241104145051.3088231-1-lihuafei1@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Nov-24 3:50 PM, Li Huafei wrote:
> In ia_css_3a_statistics_allocate(), there is no check on the allocation
> result of the rgby_data memory. If rgby_data is not successfully
> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
> Changes in v2:
>  - Corrects the "Fixes" tag.
> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 232744973ab8..b1feb6f6ebe8 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -4181,6 +4181,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
>  		goto err;
>  	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
>  	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
> +	if (!me->rgby_data)
> +		goto err;
>  
>  	IA_CSS_LEAVE("return=%p", me);
>  	return me;

