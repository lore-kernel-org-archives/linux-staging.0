Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F6340BCCD
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187897; cv=none; b=VoLiP0mJ6ZCk5TYk+ZUGycMW+gkHjafhWD3g5VZPmLQwiYxwHOYJ9YT3BoJbP9cGwEUVAgG1F9QsI2cwCwiBWPAEABEqMLJIcKKRkTxRlbEa4N3jNkZ3O9U3IFHsm62db9LPStEjygWHrNkujwGPQ9X7UX0SAj7sHeJGCoM52dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187897; c=relaxed/simple;
	bh=2+bJLEv2Ef2Y4040lUSeXkt72wzgn2e/xt7xB6DbBsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttT2QTKCEmXNrXhVUIujQYcCKE/DaG4EQ0sOCot56dahuuyxKlv8YCWPZZHSgAItHxMtQqxf0PiKa74V63DjCH74CX30hjwJZgw1VolqyggUwQlj3n5jeS6PzoRCsVOVEL8tIBhTva7zodULYmdIm9sMHh9WholuTmINmj/yHEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=QzAVIORP; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="QzAVIORP"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6cee520ccso700954a34.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1781187895; x=1781792695; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0Caby6kbsKCRleFf2h8DzUz3LzcAnpcjf6XzhnJ/Kc=;
        b=QzAVIORPQFrb7ODSzRrCXfh80gyE4Kl8nCji15w6DM+ckuOGftEyh+s3nbaQombUSU
         JD5gM4GeAemdotwnshOMdoA7BWVdejnQ9ysiTiZhLaF3yI3zIREzHVC5a5yXJ26PyhsV
         n7zl/rg6gWPoUXiCqn+zi9AZRl6R6zWVSP8oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187895; x=1781792695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0Caby6kbsKCRleFf2h8DzUz3LzcAnpcjf6XzhnJ/Kc=;
        b=FDOkYRNuKvbd9Sw0OYCU63WI66h9zF7DCW4VtGkd+JN1mLKQaXMFQo65Zc/TH07gEL
         ZbFAi8Hc7vR0GIHMkLDrjtUKFbqNmSi7+mrPimAKOeQoDTZr9q3skoY4UDK32iuLv1Fk
         XXxOK494/4ztGpjXaQmczLrMipvU0Zj3FhPPvFP+sWfl4BE/gxZRavUuVrhEw4n0fCIX
         1RrfWU1hxQzNJk0OnW7vIEFM7kVV7CBFHvMR+YNXM/6VlT5jECXpQQ/zjkuBEzM2231o
         emvE1ELmPwpAwU8+eAKwYCWNLPSqgZmuwRURtCxNK6A92w0kfkjUOdZO6Sf/VtVAZeGj
         0SLg==
X-Forwarded-Encrypted: i=1; AFNElJ8uwFD0/w7QMeC83vxnanX6R7u46q+eqW/Iym34eCfypSLqALi/xcPAW+zwCGW3PA6M9BgtDRIoxMc00rfR@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9+phqXpiB9HS3fZWU4uQEuEBMcudZQXx6gA8yH1Lwd+p5EITY
	iZe7AhvfcQncQTjmCQPBniYLSdi9VCtBRg+X38moAocOSeiFNQVEr/zG9g/oh0KhBQ==
X-Gm-Gg: Acq92OFmtjlAYJQCPCWcZ/NGIgqyatm8vnQN3j/bOVSbgMbHQZzcWWgkc/7YGFKfZcj
	UebtV+MSdkAqqbXHke6a+9Dum3PLBGpzUtwIou/U5tSEWs0+xXh7duzk9M5645VgFo9bLiWH1KQ
	XpHXZLJ/w7uJ28xXnULcFW4mi51PEO344eGD+w3DcU9eqbReVJPmWQHDZw5cGJX15LIDzz4pvm/
	eQL3Bei7GgB1Z89+g9f5sGu/bkUM0guiWvmQk36cVxmiZ7+00G8VnvLYVxn9tsgIfFTCRo5k92N
	4RrPEIwpQ6HR9sR8DL6F8Em6KaGXoAXj5PhJMa7Teg48VG44xToZfkFy6fz4/SWlVBKWWFcO4Pj
	nggf5vdzwxn5WErKBeU0BWozlvKUJE0PRJ40fEkyrVKygxo9pjfyHC0cdxuKz4Hc0vv0ZFib+Lu
	Tj4xFK6T4pYHRQ2z6Fow3g96lwyjpm
X-Received: by 2002:a05:6830:4c16:b0:7e6:d7b3:76f4 with SMTP id 46e09a7af769-7e773c80bffmr1836830a34.0.1781187895242;
        Thu, 11 Jun 2026 07:24:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7e774ceef97sm1340773a34.23.2026.06.11.07.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:24:54 -0700 (PDT)
Message-ID: <ff3cfa53-b385-4c3b-aab0-6402ecc23249@ieee.org>
Date: Thu, 11 Jun 2026 09:24:53 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: remove unused macro CAP_TIMEOUT_MS
To: Rhys Tumelty <rhys@tumelty.co.uk>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260610173026.1105803-1-rhys@tumelty.co.uk>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260610173026.1105803-1-rhys@tumelty.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 12:30 PM, Rhys Tumelty wrote:
> The macro CAP_TIMEOUT_MS is defined but never used anywhere
> in the kernel tree. Remove it to clean up code.
> 
> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/authentication.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
> index 97b9937bbdc1..d8f2cd43201f 100644
> --- a/drivers/staging/greybus/authentication.c
> +++ b/drivers/staging/greybus/authentication.c
> @@ -15,8 +15,6 @@
>   #include "greybus_authentication.h"
>   #include "firmware.h"
>   
> -#define CAP_TIMEOUT_MS		1000
> -
>   /*
>    * Number of minor devices this driver supports.
>    * There will be exactly one required per Interface.

