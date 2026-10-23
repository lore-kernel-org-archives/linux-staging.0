Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764441;
	b=HWP8H5JjZ2XfWgnALQT5QoORg6Pm7wDKTlEDvRsdBIFyU8GFLbEY10cu4ICEeIg27EpR
	 eelDpjJY2BF4HastJsDCDSEvdhceFaN8fHLHPjB6efpuE41WUGR3waLx1otFLiDyL2BOl
	 N0d6IKZrU5uyFMLSytzCvwjzjzZSh4zLAQYN6TimQIo1nF7AJ7Pnu8+Zk3PtUpcBprQAK
	 vNWISsPRjcaksasBF1aIEDwRgQcH3X2d+vvAMZOzRfyo6q7wJdJFXxCNe8OpTsk5B3FF8
	 YEsMZn65fre89DX34TnzJnEXBwX+mg/QXQX5zeh5WtsmXV6CZhR2E0UW80FMCm9ncQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HjNlJvrpXlnAC6x8kLspVEYpzuPQTChgZH754Hl21gE=;
	b=miVg2LbSCW/QRWBMeqA0TS88R86TpO3qFDHnZa0Wi6VWnEf0qiW1s6sdqJyqMtSqqhcC
	 5Ehq1k7MF6pHHe2VLx5SeOnCZ3Wx3jXtPPVRg8aSF4/CsCmKT0j6oEDYCajN9sye+10W5
	 U90K4DP9+38goHZBIPYjZZ1t+D724TndRm+e6x0my4GNNTIdfmBmS7lARwasDDWKHLZtt
	 gX3h9Focs9OJ154jsrVRdUValNPbFWjhdMLTJH63lvoWLdQveL4u4WwN+3cuv7+SGYSGv
	 2D6/EJJ4dWJ0TbvWG17uCDd23N28qk2HqTZTvLfT3HSBcDIovr3l24UdKO3mcTNOqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=X+hU7Vpf;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E8606A327
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 14:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629E8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=X+hU7Vpf
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6f5a0893610so576167eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792764439; x=1793369239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjNlJvrpXlnAC6x8kLspVEYpzuPQTChgZH754Hl21gE=;
        b=X+hU7VpfuE7F1SfF2nopdmblIETrbK90cbTgxdnlcoVyjqHr6ZZn0JQZlxYXcJzn3z
         zBPyn+PRb1a/Si363qLqf8QeYSbEkGqcbUs+CH5nVlHJkRbnAZiFV4iwEKKFdShQfF+n
         u/0shS+jo9mr4ozakF3E573cXLzsqDofLK1i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764439; x=1793369239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjNlJvrpXlnAC6x8kLspVEYpzuPQTChgZH754Hl21gE=;
        b=dQQRxlZEAzNIWkTkt4EKwVVSaaMfcdTCR3uq1d7yy7r8ue2QMgu5Dzp1xST1i1CE9o
         WYJWNytLJqnLLOacH3wVG5plAjqdbTz+d5e2+za+uutUZsQ45OIFacse4TT1GYXDjKeW
         nz3SxLSjnb4L3qYydKz6y10LBZ1A/5nZ2YJJbX+XLsNvTTchC1bCn8pwOAkynT8EHM2A
         BrJHrFiAgHYikjdv8MVnbJ6l1YIh8xhtZAmTmDpLA9RchqOqxawUGQfN7Wm7hVU1RlSr
         7L5x5pHY9GgMr16HAC0X6m5M8x5VkMrwAQPKZutbIHBi3IDEMa7I0kdstVqmEJM1Z7s1
         hQnA==
X-Forwarded-Encrypted: i=1; AKwUvBypMVBeOrazyJ4rgvvU9jKZ8En4iKHBD+1N7mqXJ9dJT3giO6lqbFVmCCuFGcLOFwG5kG7iiV6j0TGzo2eX@lists.linux.dev
X-Gm-Message-State: AFq9FYKjWQQeTtuk2CskyBtODwccF+ySxjEzeiBeDqILlEm/SQeVOjGU
	Kepc62DfVruz4PHkA89qqo+xUFCHOJNsMgLJ6RnXJfn1ADb8rQOc+3xBbyYbrocoWEWH9Syy06m
	YrbeLaA==
X-Gm-Gg: AYBFou0DPQgAJoDCDUFA/uJedRlL9C5+xvcaNK9Mc2nQuzNUvn9ByhZtC2DZq2v2GD4
	fGbm00kr38831dKEZ+SeaGnsGo8w+ep1Uhn0ffqevMc2IWIozKrZfim4RgVKbEaKx3/VM9TakX6
	x5giVoj+RsD+0cKx+RnvmK1EHAL3H/ifmnbYL01AKg4bL14OSnwLp3bN+m7j4GLvxCQ4MYlIyYH
	MYWydy1x81FVjycTvI7rGiEzd+ohbCzCBVx2mKIQVql8GvpOOcwEBt1MLPtSNvU4D39YnPpg/l5
	4qhSmws8Qhb+oKRhdUScAtJGv9XPa/kNMkXYjJjoPpZ6gExSuoM3AlK4B5l0pnWhhh10V5BRtEJ
	wZU4YuJYJJjpd6Zc0bKRwfWrD/G5BanEHwxZpynjfdhJNUd7NKkfIpmFM9rdCkQbEIuEJJOof2g
	H0neR6VvcKd9z8gNigLwT28xt/Brt3t5BVjuZk++nyc6YcE1FhVie2ldD0XDv6S8BOQ86Ab18+e
	MtUs3qMqSz9/TKZTuXN+Yd1SKBm7Zi+wQvFd+9lCf1mj72RUHw=
X-Received: by 2002:a05:6820:824:b0:6f7:9b00:9c54 with SMTP id 006d021491bc7-70b889f75e3mr1649158eaf.34.1792764439178;
        Fri, 23 Oct 2026 07:07:19 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-70b9ad1c706sm155065eaf.1.2026.10.23.07.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:07:18 -0700 (PDT)
Message-ID: <0f4649ba-f731-4f19-ad3e-2d82b641c0a3@ieee.org>
Date: Fri, 23 Oct 2026 09:07:17 -0500
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Use GFP_KERNEL for audio manager
 allocation
To: Torra Sowmya <sowmyatorra@gmail.com>, outreachy@lists.linux.dev
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261023134046.9678-1-sowmyatorra@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261023134046.9678-1-sowmyatorra@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 8:40 AM, Torra Sowmya wrote:
> The audio manager module is created in a context that permits
> sleeping. Its caller, gb_audio_manager_add(), already uses
> GFP_KERNEL through ida_alloc(), and module creation subsequently
> calls kobject_init_and_add().
> 
> GFP_ATOMIC is unnecessary in this context and restricts memory
> reclaim. Remove the explicit flag to use the default GFP_KERNEL
> allocation.
> 
> Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   drivers/staging/greybus/audio_manager_module.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index dc90cc2d2308..8a9f7e7d1766 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -187,7 +187,7 @@ int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
>   	int err;
>   	struct gb_audio_manager_module *m;
>   
> -	m = kzalloc_obj(*m, GFP_ATOMIC);
> +	m = kzalloc_obj(*m);
>   	if (!m)
>   		return -ENOMEM;
>   

