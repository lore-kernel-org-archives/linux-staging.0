Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D5DDA9
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713689408; cv=none; b=s26imy3RjGb/2H/t9r55LmAxZPm0p+201KLX95ZiAYOurAp3Jxk7y3MlhjigSBdvMbVSv2hU5yP9x3v/N/jv1thHJWZod0FVASO/Vm25nu4Sk9sxZFHZJ+sv49Eap9blq3ujsIBSNxAcIySp84wLAkbukAgJsJPKm6XjfCgms2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713689408; c=relaxed/simple;
	bh=8FW1h3/Gl2ZvZOe0s3AoSv9TppeqffKh0f3lLsDBPiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQtw6hwTLXfHTN9xGcZHNAG7rgA/C8zYEaHO31lMxJJaQZ1N6kcuTfFr94NyTONveAyZ7EtO/NNNhEBpJ7NH7CEVH0mNg3R4tLfdzhbLm4tu6B80tVQRCesNamwd6XbB1sSqNfwEx5B3vkHB+jnDfqWHanzydw2iH1GgYFbw3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GOl569Dn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GOl569Dn"
Received: from [192.168.1.105] (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3E3C674;
	Sun, 21 Apr 2024 10:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713689354;
	bh=8FW1h3/Gl2ZvZOe0s3AoSv9TppeqffKh0f3lLsDBPiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GOl569DnmrYcfD9shRE9wX4VQ5ZESYOnvqz2zj4QT9x0vaWHVMy5Xr8QLDl+OkQEm
	 dw9HTou9KHBq7VKyw+DQLck9Uyfd8+zJXsTy9seZXgkpmfmsV7y4XYwfZT6oOtc1yM
	 9J1Q3dER6KwLoRZgGDIjPL5Je4zH9SETKMcOgnSM=
Message-ID: <1d5f20e0-0157-4e4e-955d-342ee804d172@ideasonboard.com>
Date: Sun, 21 Apr 2024 14:19:55 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] staging: vc04_services: vchiq_arm: Fix NULL ptr
 dereferences
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240420091240.9552-1-wahrenst@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240420091240.9552-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for the fix

On 20/04/24 2:42 pm, Stefan Wahren wrote:
> The commit 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop
> g_cache_line_size") introduced NULL pointer dereferences by
> using the wrong device.
>
> Fixes: 8c9753f63905 ("staging: vc04_services: vchiq_arm: Drop g_cache_line_size")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>
> Changes in V2:
> - drop cosmetic changes as noticed by Laurent
>
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 502ddc0f6e46..c06232fcb0fb 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -257,7 +257,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
>   	if (count >= INT_MAX - PAGE_SIZE)
>   		return NULL;
>
> -	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
> +	drv_mgmt = dev_get_drvdata(instance->state->dev);
>
>   	if (buf)
>   		offset = (uintptr_t)buf & (PAGE_SIZE - 1);
> @@ -436,7 +436,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>
>   	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
>
> -	drv_mgmt = dev_get_drvdata(instance->state->dev->parent);
> +	drv_mgmt = dev_get_drvdata(instance->state->dev);
>
>   	/*
>   	 * NOTE: dma_unmap_sg must be called before the
> --
> 2.34.1
>

