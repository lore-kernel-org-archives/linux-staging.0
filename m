Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8C3DA5BB
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749152; cv=none; b=jQV+hqe5K6JsYrhe/ctWizKRYv+YEN7dSClcOxb5EGnepx/SvDEbiVUFOVwwqv1RM9OkIWKnjItooMbqbf1sww3Xyy5kH+1nffWbyhSVx+pO7J05d3fIoU4buGU/F5FhrpPq7UE6CUkhFFWSaYHL4INyHmeOw3tEl6rxcKAeTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749152; c=relaxed/simple;
	bh=9VhZJJo1ygdNZ7TCtZth8WrDphwJqDTJXg2P9t77FzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hf6HoZSuLM+qzZHK87HzcqPC6Xr7u8t1OUluRuehRCopEE8KeqOI0m9IKo4Ng3khaxIvmDpvXF1aO7QpTWy9LwzMxTFiGa3Z43vclm3GGlmLBgbBscsyJyyEqktgsmkqi6zeygbfaYjuuGVK5l79sGBKm79BShXJuSLWMIBzASc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=KO9whRG5; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="KO9whRG5"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6830f4f34c9so562451eaf.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775749149; x=1776353949; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3W63L8sSL/cmlr8dk45RzNHMgaS33g+6/2V8j5M410k=;
        b=KO9whRG5fllHredRR9uscFIf7JtfhWurb0S5Rt3d4am2iuEPid4s4a6tBrbtN5ZyRu
         /W37mZ6sAsLl1BobrRg5p5pXNmlu1j6JxMwAlwt2NhdonEj4mIQCm6FCsQUmstQ58clw
         +N9zANUUDrScjOR8GXziSCWsf6zWZ+ls4amp78I9HfszBHK08mH7/9c7a8+aS9nlQx0L
         xqlu5fRR9ueLcYqNF4H/VpxPiD3R8OM6oNdu6SkGWhv33G+HAfb5ENZzD41SOSwqnJVm
         OY3XadymKRKPgUY68lv7usmb8FrTHzxALU/uJWa5KL568YlqOBEJ98w81H7v9c1dyZzP
         XMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775749149; x=1776353949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3W63L8sSL/cmlr8dk45RzNHMgaS33g+6/2V8j5M410k=;
        b=egIOWAP5YaVh3Th73HXj/zVcT+cEj3mcN12FjsTeRGJGsfCFH8mnQd467mSiprk5wQ
         qsphx+/kn9qqd5JBgrRjBhtqXY+VaJ6mvLe0H5lkv4KoKJl7NM7LUoNNY/byhib0q+7R
         3o/E0BQDaDCGID895vADiKXpYb4m3TBZqOGf90deW/rKJaNTJuk3Y9YKG47mMtnYxsfT
         LJxX/F7g9NeInlhPoxj28QR00gkJo2cKqNZpxiXS04urVMq+Fy0kR91+LWOLOJfEaSQw
         dyDLNiPx+vvqmpsYkS8RKN8EFNqUDl0YnG5YuDuFiAYhMhKxJKQcMsqEAZqXCsd9EyGR
         LiTw==
X-Forwarded-Encrypted: i=1; AJvYcCVp4RZZ81IqWe8LjYsMCr5QIC2Ijf4VydDTX14I9pgmwXnIBcEAopRHE4d6Vt7NejOT4PZXdy1R+mF8AZQE@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ/el7FnDTdpxyvPEQumUXeruzU/xb2LMlAjeSmZ8fdgCyUiLI
	LR5GJXdVFuq8igQoUegGEDzIT7Hi+YlZoQGB195ZClX3iXYzzBNI+PASNh+HmzebZFg=
X-Gm-Gg: AeBDiesdcWMtBkD+lO0AFD8usW+/GqBEl9PBDnwDgqFczMAc7tgfBxo4KR9g/7kj3Hm
	IftFWWb2I+5ncEKMKL6CmORtb1NyWJvgbssw3lzYkXVEeEN+4zDDitFihbezn37wDhtdvCSQxry
	hmNihn7wriL3OT3C4eBBRysWueIYT3DVPkeAYW/F11oh9+kK292itZaRmRIiIOiaSgYRQpu01Ov
	mCgH9OoLC+LijuSEZ9AQgPymRpZwuIAfKzDH6bk6+VmFKbd7pdj98+WnneuhcZwtIpuoIWzpmWS
	RI6+xdU3HKLCEvVp4thXpQpNTeBUZo9TwXDyFb0Zx82cByhDRpC8LCJCkyUa0zUTzsPcxoD5+LF
	iLNVmRkNOfr8MLhC2MVGQMB9Oy+gYtqZ35utFX+R/Q/czdZcMbD901FIy7Tj83euU61EIEUIkTS
	rtVghs5zeDtJ3SHAE+SaV5wFXSJDmD5xGennhGNrINTqaCrSixFkZWPCrE6RUYemSIYldpY3XOT
	A==
X-Received: by 2002:a4a:e90d:0:b0:67e:aa1:8821 with SMTP id 006d021491bc7-6822123db74mr14009511eaf.64.1775749148827;
        Thu, 09 Apr 2026 08:39:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a548:cf0c:d054:fd01? ([2600:8803:e7e4:500:a548:cf0c:d054:fd01])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-68bc4d03ea1sm15573eaf.0.2026.04.09.08.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:39:07 -0700 (PDT)
Message-ID: <b37516b6-da77-4496-8514-b14ed0ad76d1@baylibre.com>
Date: Thu, 9 Apr 2026 10:39:07 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: frequency: ad983x: replace do_div() with
 div64_ul().
To: Joshua Crofts <joshua.crofts1@gmail.com>, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org, gregkh@linuxfoundation.org
Cc: nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <2026040913-spherical-slacks-bc5b@gregkh>
 <20260409150157.1300-1-joshua.crofts1@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409150157.1300-1-joshua.crofts1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/26 10:01 AM, Joshua Crofts wrote:
> Coccinelle reported the following in both ad983x drivers:
> do_div() does a 64-by-32 division, please consider using
> div64_ul instead.
> 
> Fix this by replacing do_div() with div64_ul(), which
> safely handles 64-bit dividends and unsigned long
> divisors across all architectures.
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> v2:

Please don't send v2 or later revisions in reply to v1. It breaks
some workflows. Start a new thread instead.

>  - resent email with corrected addresses

Instead of a v2, you can just add a RESEND prefix to the subject line
in cases like this. But do include an explanation like this when you
do that.

> 
>  drivers/staging/iio/frequency/ad9832.c | 3 ++-
>  drivers/staging/iio/frequency/ad9834.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index b87ea1781b..61ee93263a 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -13,6 +13,7 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> @@ -115,7 +116,7 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
>  	unsigned long long freqreg = (u64)fout *
>  				     (u64)((u64)1L << AD9832_FREQ_BITS);

I would expect checkpatch to complain that there is no blank line
between variable declarations and the rest of the code here.

> -	do_div(freqreg, mclk);
> +	freqreg = div64_ul(freqreg, mclk);
>  	return freqreg;

We can just return directly now.

	return div64_ul(freqreg, mclk);

>  }
>  
> diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
> index d339d5e8e0..83d0e1360c 100644
> --- a/drivers/staging/iio/frequency/ad9834.c
> +++ b/drivers/staging/iio/frequency/ad9834.c
> @@ -10,6 +10,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/list.h>
> @@ -101,7 +102,7 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
>  	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
>  
> -	do_div(freqreg, mclk);
> +	freqreg = div64_ul(freqreg, mclk);
>  	return freqreg;

ditto.

>  }
>  

