Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420B030BB9B
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623996; cv=none; b=WfNMXgcvtJqHe9S6ulYhAtWRefX/RnXkO+v0D3CikMNBf25nKYPsSVN8R50drMQ2wx2LKODO5WxTUo2XD8BG7M+qRLbVhqYEYDXsR8cx2EcJpojHs9zIVoXWRXayafQohvzn5J9X+NHBkLk0wm7/oCik8SIs9qEJafrDHWy+Pao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623996; c=relaxed/simple;
	bh=3FyR+xajdgHmjWeefYApeotjJhW3fQL9qbBbALSP4so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnPP4fBcI5zhyRyKALBQoHUT8tU+9PrfPdd0LKkO0cu47fGCKc1xUFo1noLh2OTG6OwcWBqRGT1xkmYbe+q9/WQZEDspNhiMEyWq2agRQNd3ag7BHXJHvdVG98hXr70PGus2/5dqQYk5e4z3hN/ljpUNWmbEFukM88WT1I0ZXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCL93HK2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCL93HK2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432777da980so4238500f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 06:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767623977; x=1768228777; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ljlfQTMdubiXy6Trb6w37rOF+8B2DpqBmlsGz29D7zE=;
        b=pCL93HK2NWfsKjGM1ZOOcEY57/MFnB2Z5zI1TlDwmvXfrHL7QG2hd9qnSsen2VgFdz
         89IsaJXyPIkSuKjslcMifuKkhIQ1SKiColuRNxH39Hn8DDI3h3uIxj2PE+c+ZtO6PIfP
         /2jdTI47wexghdJeCT+iVEpeDnifZ2R98XfZya9WlreNJIM7m0ICmiQXbrs9djK1yW2d
         i2qa2OTSmgsWi/p+eeJ+l+HLnZ0bnuAILFx5SXAt4vDHY2pbK4NAHDTFCQsiWk/wOBYe
         O5Kw7bejDq0l/fXHxHgBCkEq66tZ33OyccRQlOUxw0HH24tAwT4Q8YN+kzHsAx0KcAu4
         2OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623977; x=1768228777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljlfQTMdubiXy6Trb6w37rOF+8B2DpqBmlsGz29D7zE=;
        b=cPWpTqBIDL5/ytMer18NaEV6ZwBzel8r99IGVuv8eOmJkLWugU7iA1TEwld4dEACap
         LlumiilbDBBTKgqK1ZvgOa5iHuxKRiIPKAENA3tAauC1Dc/liRoqviKq5DyuCCW9rSHk
         ZIE9+9OJiXPSAXpdvX/KzFJnLgu/tWabdCthJ1ISFkWPjGTSWdRuPTS2ESb+v97BFphU
         qtFl1WgRM6S7KXV96+PKURD21lrBU8DO1kqdgCHkRdyzSv21ToFQPvdOO7EgRRo4JTqZ
         9TYirGjDvmZNljSTV8hPI+VXQdWsGFGwZfIIW08RUzGX6ZpqUbPDoJyZ9ONV0r/LFEX8
         k13w==
X-Forwarded-Encrypted: i=1; AJvYcCW9dGi6ZKTLZl9csi8WI8l/1474tyMry/6dY7Q/Q4JOGORYraWqFiGJfbH8Vql1m9o30kqP+nM2MjI5CK47@lists.linux.dev
X-Gm-Message-State: AOJu0YwLgoCLyq4kCWdOTjmzpIhQ4Js9/Rf9yf/ZN5veCHdry4DGyIfk
	mZIviZPGLVDTUeVMp1jJCuo4YMQ69D2SauBrV/MUTWZb/nOTp98aXdwvp/4BPgj99hM=
X-Gm-Gg: AY/fxX6ZQ32xyxFTilg5xjMA8n0j7/dFd3ugOsKsHqns8pW1Xwyn1koOJ2GSOO9ngQO
	wnwZRj6imBl6X7afWA7v+9goe9GZkBI7QTh+84h0IooOTSw8UqmoJkvNvymfhZtEjoFLdxOesLQ
	2jKa+1FlLmRHW99ijdd7Ei23xD0U5qXedGnF3I2fIzk9RvIrgSjf2aLCZJc8pTb/Jp6ew6MK9gy
	yQE8U3Y/3EwjHLqDfcrxDZSGzZa7nvyN4kwcyEdHwUwDsNOmkqKxq/m3A31xUNSZYKgtc2RMjKo
	yLpOjbwf49pDUb8bWXOSsaUKRt1CnYCoBqRPoTN4AcC2DaB49GKGP9/ACQYxltFfKHiaz5GeYNz
	lfYREPab9IcL56hQlKvOH/RNKlcB/BFqkF4OdyqzE7ztz59k7wz0YcnOWufgLHRC+AbQmoVG1O3
	0vNx8+O0biACzdw6Rp
X-Google-Smtp-Source: AGHT+IHi6fS0MK2Kosi15XiBw2e95XkRVwWYbIeQ5N6L4qMRxWQV+A5hUru6upLl+PEiAB1wfKiYMw==
X-Received: by 2002:a05:6000:220b:b0:430:fbce:f382 with SMTP id ffacd0b85a97d-4324e4d04d4mr60068477f8f.25.1767623977366;
        Mon, 05 Jan 2026 06:39:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1afbfsm102065572f8f.9.2026.01.05.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:39:36 -0800 (PST)
Date: Mon, 5 Jan 2026 17:39:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 2/4] staging: fbtft: ssd1351: send gamma table via
 fbtft_write_buf_dc()
Message-ID: <aVvNJV93mprLcZwy@stanley.mountain>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-3-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104110638.532615-3-sun.jian.kdev@gmail.com>

On Sun, Jan 04, 2026 at 07:06:36PM +0800, Sun Jian wrote:
> Clang reports a large stack frame in set_gamma() (-Wframe-larger-than=1024)
> due to the large write_reg() call emitting 63 gamma bytes via varargs.
> 
> Send the command byte (0xB8) and the gamma payload using
> fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.
> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ssd1351.c | 35 +++++++++++++-----------------
>  1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
> index 6736b09b2f45..b4ab2c81e528 100644
> --- a/drivers/staging/fbtft/fb_ssd1351.c
> +++ b/drivers/staging/fbtft/fb_ssd1351.c
> @@ -119,43 +119,38 @@ static int set_var(struct fbtft_par *par)
>   */
>  static int set_gamma(struct fbtft_par *par, u32 *curves)
>  {
> -	unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
> +	u8 data[GAMMA_LEN];

Ugh...  GAMMA_NUM is 1 so this is an annoying calculation.  So what
this does is it changes the type from unsigned long to u8 and renames
the variable.  I am fine with renaming the variable it's unrelated and
makes the review harder.

> +	u8 cmd = 0xB8;
>  	int i, acc = 0;
> +	int ret;
>  
> -	for (i = 0; i < 63; i++) {
> +	for (i = 0; i < GAMMA_LEN; i++) {

GAMMA_LEN is 63.  So this looks like a change, but it's an unrelated
cleanup.

>  		if (i > 0 && curves[i] < 2) {
>  			dev_err(par->info->device,
>  				"Illegal value in Grayscale Lookup Table at index %d : %d. Must be greater than 1\n",
>  				i, curves[i]);
>  			return -EINVAL;
>  		}
> +

This is an unrelated white space change.

>  		acc += curves[i];
> -		tmp[i] = acc;
> +
>  		if (acc > 180) {
>  			dev_err(par->info->device,
>  				"Illegal value(s) in Grayscale Lookup Table. At index=%d : %d, the accumulated value has exceeded 180\n",
>  				i, acc);
>  			return -EINVAL;
>  		}
> +
> +		data[i] = acc;

Here we move the acc assignment after the sanity check, but it's just
an unrelated cleanup.

>  	}
>  
> -	write_reg(par, 0xB8,
> -		  tmp[0],  tmp[1],  tmp[2],  tmp[3],
> -		  tmp[4],  tmp[5],  tmp[6],  tmp[7],
> -		  tmp[8],  tmp[9],  tmp[10], tmp[11],
> -		  tmp[12], tmp[13], tmp[14], tmp[15],
> -		  tmp[16], tmp[17], tmp[18], tmp[19],
> -		  tmp[20], tmp[21], tmp[22], tmp[23],
> -		  tmp[24], tmp[25], tmp[26], tmp[27],
> -		  tmp[28], tmp[29], tmp[30], tmp[31],
> -		  tmp[32], tmp[33], tmp[34], tmp[35],
> -		  tmp[36], tmp[37], tmp[38], tmp[39],
> -		  tmp[40], tmp[41], tmp[42], tmp[43],
> -		  tmp[44], tmp[45], tmp[46], tmp[47],
> -		  tmp[48], tmp[49], tmp[50], tmp[51],
> -		  tmp[52], tmp[53], tmp[54], tmp[55],
> -		  tmp[56], tmp[57], tmp[58], tmp[59],
> -		  tmp[60], tmp[61], tmp[62]);
> +	ret = fbtft_write_buf_dc(par, &cmd, 1, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = fbtft_write_buf_dc(par, data, sizeof(data), 1);
> +	if (ret < 0)
> +		return ret;

These are good changes.  Just change the type from unsigned long to u8
and use fbtft_write_buf_dc() instead of write_reg().  Then do the other
changes in a separate patch.

Same for the other patches.

regards,
dan carpenter

>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
