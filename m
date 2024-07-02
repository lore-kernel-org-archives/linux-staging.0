Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10317158D61
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916876; cv=none; b=n+7zf/bu5tc02O5Z6wYoacEnMuP/82vuPL/VCnrfuZQyxWbJY9ZxFtSZxiWCDsHQu/2+ywSMyr1AZMlkPXFsVLJNuQzl6Eo+I9FbNcQQL3yMX/skCGUqDQDGU8rIAYn1pM9LudJ73jIwsCoNvGrA2Hry8NzPlfKMI3PolX4xlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916876; c=relaxed/simple;
	bh=lZWDKkVU4wUQ2+XVtlarhxp5FdOdYIV7mJ/9JVxeaqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iud0qqz3SO0ceBBKrd4AWn296LQmPL3+BfG8nHFHaczUfZUf46V0HID9/kr48JTr5/sLaedk4s3riFepu8rxrt7rVs9IAPH7ftLESh64f7IHkW7en5cJ44pvD0kGEckNhy/ccIeQkgzaDiR+ss/D5tp2VaMv6lQsO+UuwOvQUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hv/z9svX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hv/z9svX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719916874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CAtqrFZvfKjiF7uOC6sDtpciWiE0nsuU8n5L7biUdck=;
	b=Hv/z9svXUVQzAO1LnbnKW9KHNv9pK7P2S874C2kXojxcIxPhUEVGZyjfyjj2H+UqxDMeAd
	qMuShlWEsnEZAaIOouoAzMmProBDAHsqfZo/xI1NOL7Rj9FCUaJ8UVwjAJu50B5qMz62fy
	PDndxOjkrAOsgrbR+M5GmYmLFn9rISQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-n_ChQDpEOlmo0Us7CmQLCQ-1; Tue, 02 Jul 2024 06:41:13 -0400
X-MC-Unique: n_ChQDpEOlmo0Us7CmQLCQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-58bd84067fdso285074a12.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jul 2024 03:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719916872; x=1720521672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAtqrFZvfKjiF7uOC6sDtpciWiE0nsuU8n5L7biUdck=;
        b=XjMr4BR6/xtD82CrSyH7AXYk84A7v/uKDgKxqmX9+1vjA7yslC6JUXiekTPoL+Y9X5
         QuuN96paW5J1fqOcCu+d/mtIT9NCtDX8nVOlJMcl+24vq/a858ZIKp1KBSg2eJu7vsGs
         j3bSt61KYFBt4KV37diVYfQidym31xN9CUq5sbLE8vzisXvRIjPbRCacPEIpJvXMlngT
         c3WqoHM5LpVn+Ky+c0eb7YsbozfgZsYhZizdhx+m3JKV2Syfy4bs6FV62j3Ai0URC98J
         kAyutV3Hd8usIohr33eTlRO0nUbIH4lwhl0s4Km+CEsbkPbHiFkp0MFGm/ZwkYO21LAH
         pwNw==
X-Forwarded-Encrypted: i=1; AJvYcCUukDdmbp6VqiTioidqVd8v7IptudRavLc994UaECDKFZkAlLIFugicrtLdHI6Z3NIgCmaBxCE1ZcM2/K8wRX1kA8CsC+B4T7HTZf5B2A==
X-Gm-Message-State: AOJu0YwMRy/yMtF0WIzlaXlbfwHWyw5glZDR8ClZaKzcWrUGA+Vd2crS
	Ls0xQx8gmFWgrhO/NTYjdPhRS71aCU4fFrpzPdBU+nSqOnAzlLzCCLkmzGNiuZy+lOjKVR8iPGg
	z6YZiKSrz6VoIeifCgxAi3bfs2ovpS8PVIiwNUjijQfHNhlEi8EUPGTwzIlmC0D4=
X-Received: by 2002:a05:6402:51d3:b0:57c:947c:f9cf with SMTP id 4fb4d7f45d1cf-5879eed9408mr5609426a12.11.1719916871822;
        Tue, 02 Jul 2024 03:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLlgdlK6UOwTRIbEkRdNSjnktG1oYSCS5jVvBCEBX/8U9vauixSEkrhY6hQoBbUN2cdCflBg==
X-Received: by 2002:a05:6402:51d3:b0:57c:947c:f9cf with SMTP id 4fb4d7f45d1cf-5879eed9408mr5609372a12.11.1719916870421;
        Tue, 02 Jul 2024 03:41:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58613815dd7sm5505486a12.43.2024.07.02.03.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:41:10 -0700 (PDT)
Message-ID: <d240c315-b438-462c-90a6-22f7e39b2a7a@redhat.com>
Date: Tue, 2 Jul 2024 12:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: atomisp: Fix spelling mistake in
 sh_css_internal.h
To: Roshan Khatri <topofeverest8848@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240501162620.86865-1-topofeverest8848@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240501162620.86865-1-topofeverest8848@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/1/24 6:26 PM, Roshan Khatri wrote:
> codespell reported misspelled words still and member.
> This patch fixes misspellings.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>

Thank you for your 5 patches.

I have merged all 5 in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/sh_css_internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
> index 2349eb4d3767..5395be1ed26b 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
> @@ -509,7 +509,7 @@ struct sh_css_sp_pipeline {
>   * of the associated pipe. Dynamic means that the data address can
>   * change with every (frame) iteration of the associated pipe
>   *
> - * s3a and dis are now also dynamic but (stil) handled separately
> + * s3a and dis are now also dynamic but (still) handled separately
>   */
>  #define SH_CSS_NUM_DYNAMIC_FRAME_IDS (3)
>  
> @@ -597,7 +597,7 @@ struct sh_css_sp_stage {
>  
>  /*
>   * Time: 2012-07-19, 17:40.
> - * Note: Add a new data memeber "debug" in "sh_css_sp_group". This
> + * Note: Add a new data member "debug" in "sh_css_sp_group". This
>   * data member is used to pass the debugging command from the
>   * Host to the SP.
>   *

