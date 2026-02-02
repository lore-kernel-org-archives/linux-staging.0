Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657B30E84E
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770062918; cv=none; b=Os5Ku3vgt4t/Mn3ydg3ZZClO9wAcV/ULRXw0+YT0o6Fdl3m6RyJVF1LhuYT04n9O/TL5bPvTRRfFtfXtmlPnYHaq78nSp5f8uM3WMtDXICgeUfNksgNDMD95UIjJiBmfkZyo/bl+ZTdUNZJipyFSguoqft9+tyW3zQR+6szSkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770062918; c=relaxed/simple;
	bh=z5ezqF8xkEHg+o9+YAyPSvw5wr+U/Be3CmkY2XvRh5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpLzFIpHzrcUOAWn1le+VrPYZ1xSiEiwOtidWYQTDmfXxDmgGbwCTK0jUlP2BaWNg8cw4sT9CTEJjqTQL3QzGipdC+QUycIeDpeg78TO964dXE89nwJoiT3AdzvJ0T2sX8Z94N9rxTUxLmwozsDz5cbnqbt7j0mkWm3Oe6cjUO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YkVhvlpS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YkVhvlpS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so35920765e9.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 12:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770062915; x=1770667715; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qVWit5gEYvimCyPQVV7/Ca5DAiIkOlL8U62ipYN06HA=;
        b=YkVhvlpS8ZSAPviqb6Ykamg1zVy4wTsZhyvc2zWRhwu1u51BlZVPh0rccPUuUw/20+
         CQyTnb8LRQNM+54qXaDComZm7oiRLIBi26xu8e0LFxBpbkGkxtGdIZotKoSMMcX8bUy1
         B3ipIovflUk5tFWOphEomvS4WlJi1q0Wsny40QcKJOVfOCuttROrB03R16k9e03myht1
         rv9cIneFGE+ofCYp1ba8WP3vfFIVgIUUw6vwPb0QLT6Fi6hhxbn+Uvk1jOwDfxyKKcUg
         /LrCA6jlyEygLySHYL8njHzswhyV1vWlLHuJjl+SwH6cpXjJwk4rG88rwuJzAsuDCndP
         py4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770062915; x=1770667715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVWit5gEYvimCyPQVV7/Ca5DAiIkOlL8U62ipYN06HA=;
        b=XHrReY/NVVYwm0178GNAsywExTgMQDgkWdazqHJWBjQPXvKThuKDl8DRylvW1WWXyl
         69IkgTav6eVApQ9oQATg1J/vsOOVbmYUSVe1pQz8Esp/Xk1GkNrF4FedhNM+nY5tSiUh
         zvTLwYucVvtgjg1xQoOgORUaNFP/lgmoGBrsFDWTmCxCx1887NOYZAt6+oig1G4O6YnH
         Cj6g8/+UYkjdSx30uxDtDFvgs2xn6fSgw/6C98Bdj12H9en2mwB1A898GIlOtKzZRHCG
         1irumIN3Dd9nFkQ+PcpRkj3MQs8xTJYjwgYKHUVLwvTvkDMQBmO9UjI/h1ILg5fpCkQV
         Ktzg==
X-Forwarded-Encrypted: i=1; AJvYcCXFUqutzJjrTM4INyLRthxweWhOtFwGGJwTH2BnirRdIypbSBa53SmyKQdQ8/RxyOHJJZTLv8H1Q8I6vHyQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Hh1A6HX+1VbclmBE8hvukcKurEDu+1XifQfqnS7IonszbjMJ
	VAAqeh6/c+22XuSkUygJjC6ZlcGwvON+NF4oLrfddweMOSJWRzxQwd5IkbCRNn69Y7Y=
X-Gm-Gg: AZuq6aLpfEA0Tvb7d8mkV9NTawInPetqpuLmDyLiPNISjtuae1cOUZIQofMpFyTUU5i
	NvWjiykJjyUWpNw0nNWhRievo8Totpiv3DN816hEc2VNw4sydrrItequDwCI0nDiZ8Q/ErW0CYi
	uJyZYZK7+Z7hur0VgeprU8Q1pQrFvE1txsPkNwlUoLyJgo80zpyxtDhc1dFNB/NATHEUC5/11Rs
	F5HUL62jOrPit2l7kQQCcd5CzMjqT55ntVxkAeYEPGMGjEnvjZ7/FkxW7y/gMUc+EVtZZByQ1EY
	hhAIJGx3r0mamieN//oH5RtFTl4/NbtkD6aXGG24Us1fbAv3BeqNcerGj5jEn1H1/nLtrKMCynm
	5HORC/HYCwdg4xSS7VmA+svc+1hld5qW9Skl016B2XJkaengqa/dszzwmdMjolszVZT8FrCUuS1
	BbwM8xGFVq0rU9aOxr
X-Received: by 2002:a05:600c:a08c:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-482db493a7cmr155741285e9.18.1770062914672;
        Mon, 02 Feb 2026 12:08:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47807259f8f.27.2026.02.02.12.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:08:34 -0800 (PST)
Date: Mon, 2 Feb 2026 23:08:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bogdan Sandu <bogdanelsandu2011@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v2 4/4] media: ipu3: use BIT()
Message-ID: <aYEEP0m-1_xAXZZV@stanley.mountain>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
 <20260202175033.8640-5-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202175033.8640-5-bogdanelsandu2011@gmail.com>

On Mon, Feb 02, 2026 at 07:50:33PM +0200, Bogdan Sandu wrote:
> Prefer BIT() macro over manual bitshift.
> 
> Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
>  drivers/staging/media/ipu3/ipu3-mmu.h | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
> index cb9bf5fb2..95ce34ad8 100644
> --- a/drivers/staging/media/ipu3/ipu3-mmu.c
> +++ b/drivers/staging/media/ipu3/ipu3-mmu.c
> @@ -21,7 +21,7 @@
>  #include "ipu3-mmu.h"
>  
>  #define IPU3_PT_BITS		10
> -#define IPU3_PT_PTES		(1UL << IPU3_PT_BITS)
> +#define IPU3_PT_PTES		(BIT(IPU3_PT_BITS))

IPU3_PT_PTES isn't a bit, it's the number of PTEs.  It's just shifting
because it's a power of two and that's how you calculate power of two.


>  #define IPU3_PT_SIZE		(IPU3_PT_PTES << 2)
>  #define IPU3_PT_ORDER		(IPU3_PT_SIZE >> PAGE_SHIFT)
>  
> diff --git a/drivers/staging/media/ipu3/ipu3-mmu.h b/drivers/staging/media/ipu3/ipu3-mmu.h
> index a5f0bca7e..990482f10 100644
> --- a/drivers/staging/media/ipu3/ipu3-mmu.h
> +++ b/drivers/staging/media/ipu3/ipu3-mmu.h
> @@ -5,8 +5,10 @@
>  #ifndef __IPU3_MMU_H
>  #define __IPU3_MMU_H
>  
> +#include <linux/bitops.h>
> +
>  #define IPU3_PAGE_SHIFT		12
> -#define IPU3_PAGE_SIZE		(1UL << IPU3_PAGE_SHIFT)
> +#define IPU3_PAGE_SIZE		(BIT(IPU3_PAGE_SHIFT))

Same.  This is a size, not a bit.

regards,
dan carpenter

