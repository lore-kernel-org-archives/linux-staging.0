Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239AA2C3257
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594638; cv=none; b=Bn+83F3ydP5wK+pcVRRsAQM/TeFfgGwVAm26Vl1Kz2RzCtdnE9AWzITXPgVF7DslBm0HSQA8GhhGUhQQMtfeztoaifABD+854IhEnuJcEgte8WL2lStGRtAtrgGhORyAwKkLNRWd8Vi/j2Xwsa4WVf4wOgGAwXL8yJ4nhz0/G3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594638; c=relaxed/simple;
	bh=7IqXQL0kARZhWgh+ADsZmT3tBP273iuy0JxeOoxwv+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoZpp5d7kB3XFfhu8rbPzm8ukG16JRlQ4IkzLf09RfliMKsMoRUORE4Qz/PrjeuXUaTfdrr69hGyBLKfOPwM1N0uLwZo+7iTk3avVziCgICBuk6DyoheEEe0B7Dbnxf08ExPCazWargsWyJUP1aBPxwUaoLu3qvTq3TI1xZTKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qfZLJpWN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qfZLJpWN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso6042455e9.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594635; x=1770199435; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+DEJwFD4nwvG5rwICA6kanaUNleRNgtCx1iTjYk/aLA=;
        b=qfZLJpWNpU/J2mFaA0tGrjDdmt5qZ5uqDuQpKHn8BL4FV14Q6S1AXt43EywvjtFwv4
         2gFicRaykkvkCi0xmshBruJdpz2y6cHAd8CQMk/92yLXfCMrY1A6hvzZ4rqloicTPjIs
         di+JLQPLFdPpTjG9Ncw3vMrphPqbhiQMVfo90kT5f4+1nAYemTYNsI8pCGqVfc3lRAZU
         be93D66R8OPlh0sMNdFdK82C7qj+LEadEKyc604I3ScyuNN7xn3m8xMXcTVvutnNYGN+
         ykhbjRvQTjhi9LtgWMb/2AmPRSLJLqhX8tlQpwCht1ThI/CRuGgQuj2cPwMQhjP9uXOf
         VZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594635; x=1770199435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DEJwFD4nwvG5rwICA6kanaUNleRNgtCx1iTjYk/aLA=;
        b=eyb+HGCr1jJNhFUjRVDqUs+CXoG7QauQ7uT6YZoab/rCij0f/wJnpdryoPq4a7UDhd
         dsNZdnOSAMdbhDB8/pi8ztxksNVOjGMbjsTSeohMa8F9yK48eHdFzyyBTBiis01Nh6sT
         f7iUYfMqGmrvs11fMu+ZfjzQYoZ2Uf85zN15MxCAKJmSSKqIIPoZcSNYgAs2GYA2/7rs
         LAUBQ3nW5zjZy5VqxRNnMx3kJuFGsa0hGcluYK9Hs8RKvdcE4oK44yr1wJjtCgk7Xab6
         ygIaCgxRp2Ycj33c1kc/03YbQtsWvWoe/NPMfWyLm17Ry3ZA2PGtVksiFqryEubyqc2p
         Dm6g==
X-Forwarded-Encrypted: i=1; AJvYcCWvJxVIFgT6CkkmJ8Ew60szhwQvCE6LGD4bcQpnqnwaQwAnoksbkHD4CIdWVKsPESFFXpggismw5k+pcP9r@lists.linux.dev
X-Gm-Message-State: AOJu0YzZGX7hkxDoxhbbQi0rXIaz1aYGnhEGNCXc/BkEjs5Yna8l00MS
	EhQugf+uGVZ27JMGy+uU0kM5YletPL0YgHHhReq0NLhMeELrog7H+1kXdcGq98GJvaw=
X-Gm-Gg: AZuq6aKIYIskG4yoBIKg50GaBL5z+VDX6QHi7RZ8kXTX8AN+7LvyjheF8WABoktIGy0
	JcaeTvqySoLrj4GGoAuieyofr1HqTF/TKkinxs4avp0exc/nFiWQaCE+QUFE3+83l9c+qps2eWQ
	xnPcq5Wyi1g2AXf1hLqz855mgJdwpp6URqluGNDDmDqc29KwRaF6TU0JpVfrXiRV7lkyKW9dyF+
	KmFn4IPN9tsY662ldTc7UQczTjU6LfBipmGGXmocMjZjFAtF8CCyu3DgdGgSM9SUV8o+M+tWdkQ
	GZ+Dj8vgL/1x0T+nONU6Ri/QSkIx+KgQnYYuIApT4zbSwPMKTPMStcwJ22CT8qk5PangcLoDbS1
	8DgvGzgdJbcu/01worfn84edX82nz1Jmsa+hpG5M1mkqqn9y2fc4hWYwlAQKwQDYbJCHvgGoqJ+
	VVv9JgptOItyy1bzon
X-Received: by 2002:a05:600c:1c1c:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48069e79529mr75631765e9.11.1769594635356;
        Wed, 28 Jan 2026 02:03:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e483asm5753081f8f.3.2026.01.28.02.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:03:54 -0800 (PST)
Date: Wed, 28 Jan 2026 13:03:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	gregkh@linuxfoudnation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu3: fix function argument alignment
Message-ID: <aXnfBw6gjULv5xW3@stanley.mountain>
References: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125134900.9964-1-omer.e.idrissi@gmail.com>

On Sun, Jan 25, 2026 at 02:49:00PM +0100, Omer El Idrissi wrote:
> Fix alignment of function arguments to match kernel coding
> style as reported by checkpatch.pl
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index bdf5a457752b..c34ff01484e1 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
>  
>  /* May be called from atomic context */
>  static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
> -						   int queue, unsigned int pipe)
> +						 int queue, unsigned int pipe)

You should have only delete one space character but you accidentally
deleted two.

regards,
dan carpenter

>  {
>  	unsigned int i;
>  	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
> -- 
> 2.51.0
> 
