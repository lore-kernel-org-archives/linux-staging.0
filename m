Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D442346E71
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755681; cv=none; b=fUnIobavY8o1oD2btT9n6yhRbE29fdzBvBwLteahlA9qGsbrCj/1bFTh7GiQKQ+Kw/pDmizcGaKyVVbkGp1ST0AMDbeDlD6vtAns46cgMqxofi6TuQBohgyl5ylLfoDTxaeRGs0Z0OLPq40LEBOlzUp3gjl/lxR5mO8bWs1F/Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755681; c=relaxed/simple;
	bh=Xj16wV6V2Sno6eWwvBPH3/NEusVgaroJmp/zJ27wEdc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rWxhqB72Vc2qcSzqACDNkfdb1mcvqCl6Dyy6am3u43t8t2zD1ITtSJRukU0o9nBv79ZqwEYncGk61HWOoyo7QO5Q1z3TIHrFTeIsvM4mn9oJieaf62ZQD1P/FK0iI+hIZv0KoqCZdcBbBwPta+Vd4THspVcgkpq6+kgYpB7n/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPk9rfrg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPk9rfrg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so7995305e9.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 10:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755679; x=1776360479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=budwIyBidm2S9h+Ojfca4wDAEHhJaK900JgD39+1wwQ=;
        b=SPk9rfrgnrCPH6s1m14XVFRKiZbcnYPen0RHNlC53O/hAarmU/WkGhSNL6UH1tF2VT
         bEwQNuKZcWrjDU5v9aPo57cjnfXAtMHM4xXeiA7ixuw6/ndRW6/fuyr5gGKEh66i6gpS
         DqiGigiRIvXpRG2XEVNaajgT+yoTdMuIXiJkPq+JpCXyKyugpukatt5c2ayzyW2a8Qvq
         shp6gzKLGQQQv+p5Yp2O8H+m8Zh5E8ky6ldrrwGFyqAuUCmojJ9/Cg6IBnWrweVk+Hn1
         MBYxcR32ybB/ApUTsm6kHbexXP9Bpom17y/OvW7BoXU5pI8gDWq+u66SrXYVY0hsCkZh
         Smig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755679; x=1776360479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=budwIyBidm2S9h+Ojfca4wDAEHhJaK900JgD39+1wwQ=;
        b=rui7CzUMo3v3FSUJbhQCv1q6G6+JFZdLkKvkBVLDG0KbRjKHYXe7vP2r+8n3GsRSRV
         f5nkE7Hk1oOPhYxZScVfN31w8Pw6pmnh3aTBT+MrVq+Ce//9mCIjag/8dzkBwYdIPBqD
         qLgVdG9GX6vPNJcKHpb3nQ5QpiJbXtBETWgZFsB1+7X6gARysbb4tsnKfvgSWg9bSdpL
         4EPYuSjBx+gGnx4Srahw2TBXxeENpIHNcY1m1r/2mCLAU1uDiHh5cXN0MefzNYdabaqB
         zTouRQeTZ4HRIASnYwEIXUUnwyU4qsLWnsXFN2NwhS58nHcaRTc4YB3ys/KvSYFR5dgb
         8KLA==
X-Forwarded-Encrypted: i=1; AJvYcCVI1hwm1h3zyZkZdemhh2BNFLdagzzwpCFo7u9NCsRVSQiJPzAFRaA5BHm9XYMENCn99i2INjYzZ8+kMBqu@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjz5Locx3fV2GHzDKgpY1r6qcqoczKzTYI7/GkZ6hq23uFI2Dx
	rQGOzwmlqlYzPY29o9WbVGwIHvwGSwlZAPQlitiBm4EDIBLiLcSZ2KSH
X-Gm-Gg: AeBDietU/9mcd3w9D+QySL9EEVVzuR8H+PIX/z5366411FFZYnMgi/7UXX/Py4JH7wP
	AFSA1ZIQqMb8j4gPTrFLg7jtdLy1WJz9u6xfVOhuqz+Ps077woNbJbvuEvD5W9e50QePtgIj59S
	58E8xVn5p03ZxUGOgZ0Usc0rgdJgHLl445PGbbPqg19VCHvE+7WH+dBl6sS9dA1Q59aIS9jmsAj
	EQ3OO8Nj8MGS0JMdHsZgZ/NIAqd278RWLCzgPGDxl/CkCWcMjwZTRWTTI2HsC+Q1Sv9xpBOEeNh
	8uGkzi8gNvF2dFQ/bmIbcsS7Pogf4QABTDyo7eTN0szk+ijrweizcnx0g59BMZJI+5dLmTmmPh6
	HcvfeE4AjmhwkJ6NYhXfdYpamZ23rfFZCqAuM8rgmYdqoiPBUQjgLGaOftnKXD7abWNMdDNd5+Y
	Ib53S8K7lXAkrjn2RoGHvyketHhg8ll/qIe0lJvLa7a2RCz2eFYn4Fq4jyQDL1f9Zg
X-Received: by 2002:a05:600c:c083:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488ccf4062fmr45114025e9.2.1775755678580;
        Thu, 09 Apr 2026 10:27:58 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ed4dsm10576585e9.4.2026.04.09.10.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:27:58 -0700 (PDT)
Date: Thu, 9 Apr 2026 18:27:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 greghk@linuxfoundation.org, dlechner@baylibre.com, nono.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] iio: frequency: ad983x: replace do_div() with
 div64_ul().
Message-ID: <20260409182755.499a419c@pumpkin>
In-Reply-To: <20260409131823.1289-1-joshua.crofts1@gmail.com>
References: <20260409131823.1289-1-joshua.crofts1@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  9 Apr 2026 13:18:23 +0000
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> Coccinelle reported the following in both ad983x drivers:
> do_div() does a 64-by-32 division, please consider using
> div64_ul instead.
> 
> Fix this by replacing do_div() with div64_ul(), which
> safely handles 64-bit dividends and unsigned long
> divisors across all architectures.

Except here you have clock frequencies.
Either they fit in 32bits or they don't.
So the value shouldn't be 'unsigned long', but either u32 or u64.

You need to check the domain of the values, coccinelle is just looking
at the types.
Even with mclk being 'unsigned long' the code is fine provided the
frequency is below 4.2GHz.

So you are probably fixing nothing.

	David

> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
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
> -	do_div(freqreg, mclk);
> +	freqreg = div64_ul(freqreg, mclk);
>  	return freqreg;
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
>  }
>  

